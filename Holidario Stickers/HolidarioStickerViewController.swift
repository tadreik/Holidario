//
//  HolidarioStickerViewController.swift
//  Holidario Stickers
//
//  Created by Tadreik Campbell on 12/25/19.
//  Copyright © 2019 Tadreik Campbell. All rights reserved.
//


import UIKit
import Messages

class HolidarioStickerViewController: MSStickerBrowserViewController {
    
    var stickers = [MSSticker]()
    
    func changeBrowserViewBackgroundColor(color: UIColor) {
        stickerBrowserView.backgroundColor = color
    }
    
    func loadStickers() {
        
    }
    
    func createSticker(asset: String, localizedDescription: String) {
        guard let stickerPath = Bundle.main.path(forResource: asset, ofType: "png") else {
            print("couldnt create the sticker path for", asset)
            return
        }
        let stickerURL = URL(fileURLWithPath: stickerPath)
        let sticker: MSSticker
        do {
            try sticker = MSSticker(contentsOfFileURL: stickerURL, localizedDescription: localizedDescription)
            stickers.append(sticker)
        } catch {
            print(error)
            return
        }
    }
    
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        stickers.count
    }
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker {
        return stickers[index]
    }
}

