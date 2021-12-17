import UIKit
import AVFoundation

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "last", ofType: "mp4")!
        let player = AVPlayer(url: URL(fileURLWithPath: path))
       
        // AVPlayer用のLayerを生成
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.zPosition = -1 // ボタン等よりも後ろに表示
        view.layer.insertSublayer(playerLayer, at: 0) // 動画をレイヤーとして追加
        player.play()
   
        //タップで画面もとに戻れなかった
//        let singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap(_:)))
//
//            // シングルタップで反応するように設定します。
//        singleTapGesture.numberOfTapsRequired = 1
//
//            // ビューにジェスチャーを設定します。
//            view.addGestureRecognizer(singleTapGesture)
//
//
//
//    }
//    @objc func singleTap(_ gesture: UITapGestureRecognizer) {
//        // シングルタップされた時の処理を記述してください。
//        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}

}
