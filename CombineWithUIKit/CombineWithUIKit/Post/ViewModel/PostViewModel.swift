//
//  PostViewModel.swift
//  CombineWithUIKit
//
//  Created by Parvendra Kumar on 25/08/23.
//

import Foundation
import UIKit
import Combine


class PostViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    @Published var postDataArray = [PostModel]()
    
    func getPostData(){
        let postURL = API.BaseURL().baseURL + API.ApiEndPoints().postEndPoint
        NetworkHandler.shared.getDataFromServer(apiURL: postURL, type: PostModel.self)
            .sink { completion in
                switch completion{
                case .finished:
                    print("")
                case .failure(let err):
                    print(err.localizedDescription)
                }
            } receiveValue: { [weak self] apiResponseData in
                self?.postDataArray = apiResponseData
            }
            .store(in: &cancellables)
    }
}
