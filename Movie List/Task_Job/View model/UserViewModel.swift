////
////  UserViewModel.swift
////  API _ IOS Academy
////
////  Created by MD Tarif khan on 28/5/22.
////
//
//import UIKit
//
//class UserViewModel{
//    var dataList = [Result]()
//    weak var vc: ViewController?
//    
//    func getAllUserData(){
//        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://api.themoviedb.org/3/search/movie?api_key=38e61227f85671163c275f9bd95a8803&query=marvel")!)) {
//            (data,req,err) in
//
//            do{
//                let result = try JSONDecoder().decode(MoviesResult.self, from: data!)
//                DispatchQueue.main.async {
//                    
//                    print("====== rrrrrrrrrr ==== \(result.results)")
//                    
//                    self.dataList = result.results
//                    self.vc?.tableVewUser.reloadData()
//                }
//
//            } catch {
//                
//            }
//
//        }.resume()
//
//    }
//    
//}
