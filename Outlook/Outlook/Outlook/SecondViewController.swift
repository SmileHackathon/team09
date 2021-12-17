//
//  SecondViewController.swift
//  Teat4
//
//  Created by 外川雄也 on 2021/12/17.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var ModalView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
            UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveLinear], animations: {
                self.ModalView.center.y -= 850
            }, completion: { _ in
                let thirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "toThirdVC") as! ThirdViewController
                thirdViewController.modalPresentationStyle = .fullScreen
                self.present(thirdViewController, animated: true, completion: nil)
            })

        }
        
      
        // Do any additional setup after loading the view.
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

