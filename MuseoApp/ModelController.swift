//
//  ModelController.swift
//  MuseoApp
//
//  Created by Juan David Cruz Serrano on 5/9/17.
//  Copyright © 2017 Dhamova. All rights reserved.
//

import UIKit

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


class ModelController: NSObject, UIPageViewControllerDataSource {

    var pageData: [String] = ["Memoria y Nación"]
    var pageImageURLs: [String] = ["header-memoriaynacion.jpg"]
    var pageDescription: [String] = ["En la sala Memoria y Nación se muestra una síntesis de los elementos conceptuales que se desarrollarán en forma más amplia en las demás salas del Museo Nacional de Colombia. Se abordan temas como las fusiones en el mundo de lo sagrado, la oralidad y la escritura en la construcción y transmisión del conocimiento y la memoria, entre otros contenidos. Así mismo, como elemento central de la sala, se presenta el Muro de la diversidad, un espacio en el que se ofrece una rica selección que resume visualmente el ejercicio de inclusión sobre el que se construye la nueva narrativa del Museo en la actualidad. En cada una de las secciones de esta sala se pueden apreciar piezas emblemáticas de las cuatro colecciones del Museo Nacional de Colombia que, puestas en diálogo, ofrecen al visitante la posibilidad de múltiples lecturas. Adicionalmente, la sala le permite al Museo presentar su narración al público de manera más conmovedora y reflexiva, gracias a herramientas de última tecnología multimedia, un diseño innovador y un montaje contemporáneo. La sala Memoria y Nación es una invitación a que todos formemos parte de este proyecto, con el fin de que el Museo se convierta en un espacio abierto de reflexión sobre nuestra historia, incluyente y diversa, para que constituya un aporte al proceso de reconciliación nacional. ​"]
    var pageLearnMore: [String] = ["http://www.museonacional.gov.co/exposiciones/permanentes/segundo-piso/Paginas/7.aspx"]
    


    override init() {
        super.init()
        // Create the data model.
//        let dateFormatter = DateFormatter()
//        pageData = dateFormatter.monthSymbols
    }

    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> DataViewController? {
        // Return the data view controller for the given index.
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }

        // Create a new view controller and pass suitable data.
        let dataViewController = storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        dataViewController.dataObject = self.pageData[index]
        dataViewController.dataDescription = self.pageDescription[index]
        dataViewController.dataImageName = self.pageImageURLs[index]
        dataViewController.dataLearnMore = self.pageLearnMore[index]
        return dataViewController
    }

    func indexOfViewController(_ viewController: DataViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return pageData.index(of: viewController.dataObject) ?? NSNotFound
    }

    // MARK: - Page View Controller Data Source

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.pageData.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

}

