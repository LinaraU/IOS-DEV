//
//  infoBrowser.swift
//  Browser
//
//  Created by Linara Ualiyeva on 2/20/21.
//

import UIKit
import WebKit
class infoBrowser: UIViewController {
    var detailUrl: URL!
    var delegate: NewDelegate!
    var name: String?
    var index: Int = 0
    var getName = String()
    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func addFavorite(_ sender: UIButton) {
        
        
        sender.isSelected = !sender.isSelected
        if sender.isSelected{
            delegate.addFavoritesCell(name: name, url: detailUrl)
            navigationController?.popViewController(animated: true)
            sender.backgroundColor = UIColor.green
           }
        else{
            delegate.deleteRow(name: name, url: detailUrl)
            navigationController?.popViewController(animated: true)
            sender.backgroundColor = UIColor.red
         }
        
    }
    
    var getIndex = Int()


    @IBOutlet weak var showPage: WKWebView!  
    override func viewDidLoad() {
        super.viewDidLoad()
        index = getIndex
        name = getName
        guard let url = detailUrl else { return }
           let request = URLRequest(url: url)
           showPage.load(request)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
