 import UIKit
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var table:UITableView!
    var songs=[Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate=self
        table.dataSource=self
        
    }
    func configureSongs(){
        songs.append(Song(name:"This is halloween",
                         albumName: "Dil-diya galaa!!",
                         artistName: "Taiger jindahen",
                         imageName: "cover1",
                         trackName: "song1"))
        
        
        songs.append(Song(name:"Light Mystical music",
                         albumName: "With you",
                         artistName: "New bitchy",
                         imageName: "cover2",
                         trackName: "song2"))
        
        songs.append(Song(name:"Children electro swing",
                         albumName: "Haniya vee",
                         artistName: "Hanniyaa veeeeeee!!",
                         imageName: "cover3",
                         trackName: "song3"))
        
        songs.append(Song(name:"Chill relax",
                         albumName: "chill buddy",
                         artistName: "chill buddy",
                         imageName: "cover4",
                         trackName: "song4"))
        
        songs.append(Song(name:"holidays",
                         albumName: "busy days",
                         artistName: "colday",
                         imageName: "cover5",
                         trackName: "song5"))
        
        songs.append(Song(name:"holidays",
                         albumName: "busy days",
                         artistName: "colday",
                         imageName: "cover6",
                         trackName: "song6"))
        
        songs.append(Song(name:"holidays",
                         albumName: "busy days",
                         artistName: "colday",
                         imageName: "cover7",
                         trackName: "song7"))
        
        songs.append(Song(name:"holidays",
                         albumName: "busy days",
                         artistName: "colday",
                         imageName: "cover8",
                         trackName: "song8"))
        
        songs.append(Song(name:"holidays",
                         albumName: "busy days",
                         artistName: "colday",
                         imageName: "cover9",
                         trackName: "song9"))
        
        songs.append(Song(name:"holidays",
                         albumName: "busy days",
                         artistName: "colday",
                         imageName: "cover10",
                         trackName: "song10"))
       
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let song=songs[indexPath.row]
        cell.textLabel?.text=song.name
        cell.detailTextLabel?.text=song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font=UIFont(name:"Helvetica-Bold",size: 18 )
        
        cell.detailTextLabel?.font=UIFont(name:"Helvetica",size: 17 )
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let position=indexPath.row
        guard let vc=storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController
        else{
            return
        }
        vc.songs=songs
        vc.position=position
        
        present(vc, animated: true )
    }
}
struct Song{
    let name:String
    let albumName:String
    let artistName:String
    let imageName:String
    let trackName:String
    
}

