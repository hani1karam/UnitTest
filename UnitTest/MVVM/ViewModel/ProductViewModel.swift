//
//  ProductViewModel.swift
//  UnitTest
//
//  Created by hany karam on 9/20/21.
//

import RxCocoa
import RxSwift
class ProductViewModel {
    var loaderSate: BehaviorRelay<LoaderState> = BehaviorRelay(value: .shown)
    var errorState: BehaviorRelay<ErrorState> = BehaviorRelay(value: .hidden)
    var branchesModelSubject = BehaviorSubject<[Datum]>(value: [])
    func showCatrogy() {
        let placesRequest = SimpleGetRequest(url: URls().allProducts,parameters: nil, method: .post)
        APIClient().sentRequest(request: placesRequest, mapResponseOnType: GetProduct.self, successHandler: { [weak self] (response)  in
            guard let self = self else {
                return
            }
            
            self.loaderSate.accept(.hidden)
            self.branchesModelSubject.onNext(response.data)
            
            if (response.data.isEmpty) {
                self.errorState.accept(.shown(#imageLiteral(resourceName: "alert"), "No data found !!"))
            }
        }) { (error) in
            self.loaderSate.accept(.hidden)
            self.errorState.accept(.shown(#imageLiteral(resourceName: "error"), "Something went wrong !!"))
        }
    }
    
}
