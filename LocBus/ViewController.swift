//
//  ViewController.swift
//  画面を管理するためのViewControllerクラスを実装するファイル
//

// UIKit iOSアプリケーション構築のためのグラフィカルUIフレームワーク
// Xcodeには「UIKit」、「SwiftUI」がすでに組み込まれている

import UIKit //UIKitを使用可能に
import CoreLocation
import Foundation

class ViewController: UIViewController {
    
    var time:String = {
            
            let df = DateFormatter()
            df.calendar = Calendar(identifier: .gregorian)
            df.locale = Locale(identifier: "ja_JP")
            df.timeZone = TimeZone(identifier: "Asia/Tokyo")
            df.dateStyle = .none
            df.timeStyle = .short
            
            return df.string(from: Date())

        }()
    
    
    var id: String = ""
    var id1 : String = ""
    
    
    // enmuで指定したcaseの文字列が取れる
    // メニュー表示項目　(キャリアの選択)
        enum MenuType: String {
            case high = "キャリア1"
            case mid = "キャリア2"
            case low = "キャリア3"
            case loww = "キャリア4"
            case loww2 = "キャリア5"
            case loww3 = "キャリア6"
            case loww4 = "キャリア7"
            case loww5 = "キャリア8"
        }
    
    // メニュー表示項目 (稼働中かどうかの選択)
        enum MenuType1: String {
            case high1 = "稼働中"
            case mid1 = "停止中"
            case low1 = "待機中"
        }
    
    
    @IBOutlet weak var menuButton: UIButton!
    
    // 選択されたMenuType
        var selectedMenuType = MenuType.high


 func configureMenuButton() {
    var actions = [UIMenuElement]()
    // A
    actions.append(UIAction(title: MenuType.high.rawValue, image: nil, state: self.selectedMenuType == MenuType.high ? .on : .off,
                            handler: { (_) in
                                self.selectedMenuType = .high
                                // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                self.configureMenuButton()
        self.id = "1"
                            }))
    // B
    actions.append(UIAction(title: MenuType.mid.rawValue, image: nil, state: self.selectedMenuType == MenuType.mid ? .on : .off,
                            handler: { (_) in
                                self.selectedMenuType = .mid
                                // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                self.configureMenuButton()
        self.id = "2"
                            }))
    // C
    actions.append(UIAction(title: MenuType.low.rawValue, image: nil, state: self.selectedMenuType == MenuType.low ? .on : .off,
                            handler: { (_) in
                                self.selectedMenuType = .low
                                // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                self.configureMenuButton()
        self.id = "3"
                            }))
    //D
    actions.append(UIAction(title: MenuType.loww.rawValue, image: nil, state: self.selectedMenuType == MenuType.loww ? .on : .off,
                            handler: { (_) in
                                self.selectedMenuType = .loww
                                // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                self.configureMenuButton()
        self.id = "4"
                            }))
     actions.append(UIAction(title: MenuType.loww2.rawValue, image: nil, state: self.selectedMenuType == MenuType.loww2 ? .on : .off,
                             handler: { (_) in
                                 self.selectedMenuType = .loww2
                                 // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                 self.configureMenuButton()
         self.id = "5"
                             }))
     actions.append(UIAction(title: MenuType.loww3.rawValue, image: nil, state: self.selectedMenuType == MenuType.loww3 ? .on : .off,
                             handler: { (_) in
                                 self.selectedMenuType = .loww3
                                 // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                 self.configureMenuButton()
         self.id = "6"
                             }))
     actions.append(UIAction(title: MenuType.loww4.rawValue, image: nil, state: self.selectedMenuType == MenuType.loww4 ? .on : .off,
                             handler: { (_) in
                                 self.selectedMenuType = .loww4
                                 // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                 self.configureMenuButton()
         self.id = "7"
                             }))
     actions.append(UIAction(title: MenuType.loww5.rawValue, image: nil, state: self.selectedMenuType == MenuType.loww5 ? .on : .off,
                             handler: { (_) in
                                 self.selectedMenuType = .loww5
                                 // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                 self.configureMenuButton()
         self.id = "8"
                             }))
    

    // UIButtonにUIMenuを設定
    menuButton.menu = UIMenu(title: "", options: .displayInline, children: actions)
    // こちらを書かないと表示できない場合があるので注意
    menuButton.showsMenuAsPrimaryAction = true
    // ボタンの表示を変更
    menuButton.setTitle(self.selectedMenuType.rawValue, for: .normal)
}
    
    @IBOutlet weak var menuButton2: UIButton!
    // 選択されたMenuType
    var selectedMenuType1 = MenuType1.high1
    
    private func configureMenuButton1() {
        var actions = [UIMenuElement]()
        // HIGH
        actions.append(UIAction(title: MenuType1.high1.rawValue, image: nil, state: self.selectedMenuType1 == MenuType1.high1 ? .on : .off,
                                handler: { (_) in
                                    self.selectedMenuType1 = .high1
                                    // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                    self.configureMenuButton1()
            self.id1 = "0"
                                }))

        // MID
        actions.append(UIAction(title: MenuType1.mid1.rawValue, image: nil, state: self.selectedMenuType1 == MenuType1.mid1 ? .on : .off,
                                handler: { (_) in
                                    self.selectedMenuType1 = .mid1
                                    // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                    self.configureMenuButton1()
            self.id1 = "1"
                                }))
        
        // LOW
        actions.append(UIAction(title: MenuType1.low1.rawValue, image: nil, state: self.selectedMenuType1 == MenuType1.low1 ? .on : .off,
                                handler: { (_) in
                                    self.selectedMenuType1 = .low1
                                    // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                    self.configureMenuButton1()
            self.id1 = "2"
                                }))
        
        // UIButtonにUIMenuを設定
        menuButton2.menu = UIMenu(title: "", options: .displayInline, children: actions)
        // こちらを書かないと表示できない場合があるので注意
        menuButton2.showsMenuAsPrimaryAction = true
        // ボタンの表示を変更
        menuButton2.setTitle(self.selectedMenuType1.rawValue, for: .normal)
        
    }
    
    
    @IBOutlet weak var lati: UILabel!
    @IBOutlet weak var long: UILabel!
    @IBOutlet weak var selection: UILabel!
    @IBOutlet weak var selection2: UILabel!
    
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!

    
    
    // 緯度
    var latitudeNow: String = ""
    // 経度
    var longitudeNow: String = ""
    
    

    var timer = Timer()
    /// ロケーションマネージャ
    @objc var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lati.text = "緯度"
        long.text = "経度"
        selection.text = "キャリアを選択してください"
        selection2.text = "稼働中，停止中もしくは待機中から選んでください"
        // ロケーションマネージャのセットアップ
        setupLocationManager()
        
        // UIButtonにUIMenuを設定する
        self.configureMenuButton()
        // UIButtonにUIMenuを設定する
        self.configureMenuButton1()
    
        
    }

    /// "位置情報を取得"ボタンを押下した際、位置情報をラベルに反映する
    /// - Parameter sender: "位置情報を取得"ボタン
    @IBAction func getLocationInfo(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval:3,
                                       target:self,
                                       selector:#selector(self.send_info),
                                     userInfo:nil,
                                       repeats:true)
        
    }
    
    @objc func send_info(){
        // マネージャの設定
        let status = CLLocationManager.authorizationStatus()
        if status == .denied {
                    showAlert()
                } else if status == .authorizedWhenInUse {
                    self.latitude.text = latitudeNow
                    self.longitude.text = longitudeNow
                }
        
        let lat = String(latitudeNow) //緯度
        let lon = String(longitudeNow) //軽度
        let id = String(self.id) //キャリア番号
        let id1 = String(self.id1) //キャリアの状態
        
        
        let dateString = String(time)
        
        //let lat = String(123)
        //let lon = String(234)
        
        //urlオブジェクトを渡すと、HTTPリクエストを生成する
        //リクエスト時にサーバーへ送信するデータはリクエストURLの後に付け加えられる
        //この場合だと?以降のlat,lon,id,id1の計4つ
        let url = URL(string: "http?id="+id+"&lat="+lat+"&lon="+lon+"&dateString="+dateString+"&id1="+id1)!//URLを生成
          
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            //データ受信後の処理を書く
            //おそらくこれで、マップ上に位置が表示されると思われる。
            print(id1)
               }
            //resume()メソッドを使って実行する
               task.resume()

        
    }

    /// "クリア"ボタンを押下するたびに、ラベルを初期化する
        /// - Parameter sender: "クリア"ボタン
    @IBAction func clearLabel(_ sender: Any) {
        self.latitude.text = "デフォルト"
                self.longitude.text = "デフォルト"
        let lat = String(-1) //緯度
        let lon = String(-1) //軽度
        let id = String(self.id) //キャリア番号
        let id1 = String(self.id1) //キャリアの状態
        
        let dateString = String(time)
        
        //let lat = String(123)
        //let lon = String(234)
        
        let url = URL(string: "http?id="+id+"&lat="+lat+"&lon="+lon+"&dateString="+dateString+"&id1="+id1)!//URLを生成
          
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
               }
               task.resume()
        
        timer.invalidate()
    }
    /// ロケーションマネージャのセットアップ
       func setupLocationManager() {
           locationManager = CLLocationManager()

           // 権限をリクエスト
           guard let locationManager = locationManager else { return }
           locationManager.requestWhenInUseAuthorization()

           // マネージャの設定
           let status = CLLocationManager.authorizationStatus()

           // ステータスごとの処理
           //　必要最低限の制度を指定することで電力消費を抑えることができる
           if status == .authorizedWhenInUse {
               locationManager.delegate = self //自身をデリゲートプロパティに設定
               locationManager.startUpdatingLocation()//位置情報取得を開始
               locationManager.distanceFilter = 3 //更新頻度に関わる移動距離(m)
               locationManager.allowsBackgroundLocationUpdates = true
           }
       }

       /// アラートを表示する
       func showAlert() {
           let alertTitle = "位置情報取得が許可されていません。"
           let alertMessage = "設定アプリの「プライバシー > 位置情報サービス」から変更してください。"
           let alert: UIAlertController = UIAlertController(
               title: alertTitle,
               message: alertMessage,
               preferredStyle:  UIAlertController.Style.alert
           )
           // OKボタン
           let defaultAction: UIAlertAction = UIAlertAction(
               title: "OK",
               style: UIAlertAction.Style.default,
               handler: nil
           )
           // UIAlertController に Action を追加
           alert.addAction(defaultAction)
           // Alertを表示
           present(alert, animated: true, completion: nil)
       }
   }

extension ViewController: CLLocationManagerDelegate {

    /// 位置情報が更新された際、位置情報を格納する
    /// - Parameters:
    ///   - manager: ロケーションマネージャ
    ///   - locations: 位置情報
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first
                let latitude = location?.coordinate.latitude
                let longitude = location?.coordinate.longitude
                // 位置情報を格納する
                self.latitudeNow = String(latitude!)
                self.longitudeNow = String(longitude!)
    }
    
    // 位置情報の取得に失敗すると呼ばれる
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            self.latitudeNow = String("error")
            self.longitudeNow = String("error")
        }
    
    
    
}



