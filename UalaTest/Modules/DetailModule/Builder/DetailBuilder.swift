//
//  DetailBuilder.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation

// MARK: Detail Builder
class DetailBuilder {
  func build(router: DetailRouter) -> DetailViewController {
    let view: DetailViewController = DetailViewController()
    let interactor: DetailInteractorProtocol = DetailInteractor()
    let presenter: DetailPresenterProtocol = DetailPresenter()
    
    interactor.presenter = presenter
    presenter.interactor = interactor
    presenter.view = view
    view.presenter = presenter
    
    return view
  }
}
