//
//  ScanQR.swift
//  Vita
//
//  Created by Nnamdi Ugwuoke on 6/29/19.
//  Copyright © 2019 Vita. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase
var counterVar: Int = 0


class ScanQR: UIViewController {
    @IBOutlet weak var viewLayer: UIView!
    @IBOutlet weak var tableview: UITableView!
    private let reuseIdentifier = "qrCodeOptionCell"
    @IBOutlet weak var totalMedicationsLabel: UILabel!
     var video = AVCaptureVideoPreviewLayer()
    var qrSeen = Set<String>() {
        didSet {
            totalMedicationsLabel.text =  "Total: \(qrSeen.count)"
            
        }
    }
    var qrArray: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupQRCode()

        // Do any additional setup after loading the view.
    }
    
        
        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            if metadataObjects.count != 0{
                if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject{
                    if object.type == AVMetadataObject.ObjectType.qr{
                        print(object)
                        for object in metadataObjects {
                            if let readableObject = object as? AVMetadataMachineReadableCodeObject,
                                let value = readableObject.stringValue {
                                print(value)
                                //  qrArray += [value.madeUnique(withRespectTo: qrArray )]
                                //   qrArray.append(value.madeUnique(withRespectTo: qrArray ))
                                
                             //   qrSeen.insert(value)
                               qrArray = Array(qrSeen)
                                tableview.reloadData()
                            }
                        }
                        print("--------")
                       // print(qrSeen)
                        // print(qrArray)
                        let alert = UIAlertController(title: "QR Code", message: object.stringValue, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
                        alert.addAction(UIAlertAction(title: "Reset ", style: .default, handler: { (nil) in
                         //   self.qrSeen.removeAll()
                            //                        UIPasteboard.general.string = object.stringValue
                        }))
                        //present(alert, animated: true, completion: nil)
                    }
                    
                }
            }
        }
    }

                                                                                                                                                                        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


extension ScanQR : AVCaptureMetadataOutputObjectsDelegate{
    func setupQRCode(){
        // Do any additional setup after loading the view, typically from a nib.
        //create session
        let session = AVCaptureSession()
        //Define capture Device
        let captureDevice = AVCaptureDevice.default(for: .video)
        do{
            let input = try AVCaptureDeviceInput(device:captureDevice!)
            session.addInput(input)
        }catch{
            print("error")
        }
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
       
        video = AVCaptureVideoPreviewLayer(session: session)
        //video.frame = CGRect(x: -200, y: 0, width: 700, height: 280)
        video.frame = viewLayer.bounds
        viewLayer.layer.addSublayer(video)
 
        session.startRunning()
        
}
}
extension  ScanQR: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qrSeen.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! QRCodeCell
        //let menuOption = MenuOption(rawValue: indexPath.row)
        //        for qrSeenString
        //           in qrSeen {
        //            DispatchQueue.main.async {
        //              cell.descriptionLabel.text = qrSeenString
        //            }
        //           // print(number)
        //        }
        cell.descriptionLabel.text = qrArray[indexPath.row]
        // cell.iconImageView.image = menuOption?.image
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let menuOption = MenuOption(rawValue: indexPath.row)
        //delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
}
