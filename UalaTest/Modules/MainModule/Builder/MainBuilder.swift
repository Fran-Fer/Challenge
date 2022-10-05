//
//  MainBuilder.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation

// MARK: Main Builder
class MainBuilder: MainBuilderProtocol {
  func build(router: MainRouterProtocol) -> MainViewController {
    let view: MainViewController = MainViewController()
    let network: NetworkingProtocol = Networking()
    let router: MainRouterProtocol = router
    let presenter: MainPresenterProtocol = MainPresenter()
    let interactor: MainInteractorProtocol = MainInteractor()
    let dataManager: MainDataManagerProtocol = MainDataManagerClass(network: network)
    
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.apiDataManager = dataManager

    //view.presenter?.fetchRandom()
    //view.presenter?.fetchParsedData()
    
    return view
  }
}
