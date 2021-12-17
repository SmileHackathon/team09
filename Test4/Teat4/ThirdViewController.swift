//
//  NextViewController.swift
//  Teat4
//
//  Created by 外川雄也 on 2021/12/16.
//

import UIKit
import AVFoundation

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "scan03", ofType: "mp4")!
        let player = AVPlayer(url: URL(fileURLWithPath: path))
       
        // AVPlayer用のLayerを生成
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.zPosition = -1 // ボタン等よりも後ろに表示
        view.layer.insertSublayer(playerLayer, at: 0) // 動画をレイヤーとして追加
        player.play()
        
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
