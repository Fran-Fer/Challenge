//
//  DetailPresenter.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation

// MARK: Detail Presenter
class DetailPresenter: DetailPresenterProtocol {
  var interactor: DetailInteractorProtocol?
  var router: DetailRouterProtocol?
  var view: DetailViewProtocol?
}
