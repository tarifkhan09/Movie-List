//
//  UserTableCell.swift
//  Task_Job
//
//  Created by MD Tarif khan on 31/5/22.
//

import UIKit

class UserTableCell: UITableViewCell {

    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configuration(data: Result){
        titleLabel.text = data.originalTitle
        overviewLabel.text = data.overview
        //posterImage.loadFrom(URLAddress: "https://image.tmdb.org/t/p/w342/\(data.posterPath)")
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w342/\(data.posterPath)")!)){
            (data, req, err) in
            do{
                var datas = try data
                DispatchQueue.main.async {
                    self.posterImage.image = UIImage(data: datas!)
                }

            } catch {

            }


        }.resume()
    }
    
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
