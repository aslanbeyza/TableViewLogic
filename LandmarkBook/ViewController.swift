//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Beyza Aslan on 23.02.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Taj Mahal")
        
      
        landmarkImages.append(UIImage(named: "colosseum.jpeg")!)
        landmarkImages.append(UIImage(named: "greatwall.jpeg")!)
        landmarkImages.append(UIImage(named: "kremlinpalace.jpeg")!)
        landmarkImages.append(UIImage(named: "tajmahal.jpeg")!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count    //landmarkNames içinde ne kadar varsa o kadar göstericek demek bu
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]   //hangi sırada ise o gözükür
        //content.image = landmarkImages[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    //tableView a tıklandığında ne olaağını henüz bilmiyorum daha yazmadım ama tüm fonksiyonlarına erişebiliyorum en baştan sınıfını import ettim çünkü
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]  // diziden hangisi seçiliyse ona eşitle
        chosenLandmarkImage = landmarkImages[indexPath.row] // diziden hangisi seçiliyse ona eşitle
        //performSegue sayfalar arası geçişi sağlıyor
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "toDetailsVC" {
          let destinationVC = segue.destination as! DetailsVC  //DetailsVC gideceğim view controller DetailsVC bu ise diyorum burda
          destinationVC.selectedLandmarkLabel = chosenLandmarkName
          destinationVC.selectedimageView = chosenLandmarkImage
//          destinationVC.imageView.image = chosenLandmarkImage bunu dersen üstteki yerine uygulama çöker burada kod çalışsa bile              detailsVC henüz oluşmadığı için bu bizim uygulamamızı çökertir
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row) //seçilen indeksten silicez
            self.landmarkImages.remove(at: indexPath.row)
            //tableView.reloadData()
            tableView.deleteRows(at: [indexPath], with: .fade) //tablo eski halini hatırlayacak ya direk silinen boş satır olcak ya orası onuda silsin diye bu
        }
    }
}

