import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    //@IBOutlet weak var sampleButton: UIButton!
    @IBOutlet weak var FadeOutView: UIView!
    @IBOutlet weak var FlameOutView: UIImageView!
    @IBOutlet weak var FlameInView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        //scene.backgroundColor = UIColor.white
        sceneView.scene = scene
        sceneView.delegate = self
        //sampleButton.isHidden = true
        /*let myImage:UIImage = UIImage(named:"black.png")!
        let myImageView = UIImageView(image: UIImage.ResizeUIImage(myImage, width: self.view.frame.maxX, height: self.view.frame.maxY))
        myImageView.alpha = 0.05
        self.view.addSubview(myImageView)
        */
        
        UIView.animate(withDuration: 1.0, delay: 0.0 , options: [.autoreverse, .repeat] ,animations: {
           var transScale = CGAffineTransform()
           transScale = CGAffineTransform(scaleX: 1.05, y: 1.05)
           self.FlameInView.transform = transScale
           
           transScale = CGAffineTransform(scaleX: 0.95, y: 0.95)
           self.FlameOutView.transform = transScale
        }) { _ in //戻る処理
            self.identity()
        }
         
        }
    
    private func identity() {
        UIView.animate(withDuration: 5.0, delay: 0.0, options: [] ,animations: {
                self.FlameInView.transform = .identity
                self.FlameOutView.transform = .identity
            })
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let configuration = ARImageTrackingConfiguration()

        let images = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil)
        configuration.trackingImages = images! // ARReferenceImageがあれば落ちないはず
        configuration.maximumNumberOfTrackedImages = 1
        sceneView.session.run(configuration)
    }
      
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor){
        guard let imageAnchor = anchor as? ARImageAnchor else {
                return
        }
        guard let scene = SCNScene(named: "art.scnassets/particle.scn") else {
            return
        }
        guard let shipNode = scene.rootNode.childNode(withName: "particles", recursively: true) else {
            return
        }
        
        /*guard let textNode = scene.rootNode.childNode(withName: "text", recursively: true) else {
            return
        }*/
        

        shipNode.scale = SCNVector3(imageAnchor.referenceImage.physicalSize.width, imageAnchor.referenceImage.physicalSize.height, 0)
        
        //shipNode.position = SCNVector3(0,0,imageAnchor.referenceImage.physicalSize.height+10)
        DispatchQueue.main.async {
            node.addChildNode(shipNode)
        }
        
        // Flame_in,outのアニメーション
//                DispatchQueue.main.async {
//                    UIView.animate(withDuration: 2.0, delay: 1.0, options: [.curveLinear, .repeat], animations: {
//                        var transScale = CGAffineTransform()
//                        transScale = CGAffineTransform(scaleX: 2, y: 2)
//                        self.FlameInView.transform = transScale
//
//                        transScale = CGAffineTransform(scaleX: 2, y: 2)
//                        self.FlameOutView.transform = transScale
//
//                        //１つ目
////                        self.FlameInView.contentMode = .scaleAspectFit
////                        self.FlameOutView.contentMode = .scaleAspectFit
//                     })
//
//                }
        

        /*self.sceneView.scene.background.contents = UIColor(red: 1.0 , green: 1.0, blue: 1.0, alpha: 1.0)
        UIView.animate(withDuration: 5.0, delay: 1.0, options: .curveEaseIn, animations: {self.sceneView.scene.background.contents=UIColor(red: 1.0 , green: 1.0, blue: 1.0, alpha: 0.0)}, completion: nil)*/
        DispatchQueue.main.async {
            UIView.animate(withDuration: 3.0, delay: 3.0, options: [.curveLinear], animations: {
            //self.myImageView.alpha = 1
       
                self.FadeOutView.alpha = 1.0
            
            /*self.sceneView.scene.background.contents = UIColor.white
        }, completion: {(finished: Bool) in
            self.sceneView.scene.background.contents = UIColor.black*/
             })
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.5){
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "toSecondVC") as! SecondViewController
            secondViewController.modalPresentationStyle = .fullScreen
            self.present(secondViewController, animated: false, completion: nil)
            
        }
        //button1Action(sampleButton)
        
    }
    /*func button1Action(_ sender: UIButton) { //上のボタンを押す
    DispatchQueue.main.async {
        self.sampleButton.isHidden = false
    }
    }
    @IBAction func toNextVCButton(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "toNextVC") as! NextViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }*/

    
}

