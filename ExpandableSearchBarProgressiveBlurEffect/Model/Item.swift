//
//  Item.swift
//  ExpandableSearchBarProgressiveBlurEffect
//
//  Created by Abbas on 16/08/2024.
//

import SwiftUI

struct Item: Identifiable , Hashable {
    var id :String = UUID().uuidString
    var title : String
    var image : UIImage?
}

var sampleImage :[Item] = [
    Item(title: "Image 1", image: UIImage(named: "image1")),
    Item(title: "Image 2", image: UIImage(named: "image2")),
    Item(title: "Image 3", image: UIImage(named: "image3")),
    Item(title: "Image 4", image: UIImage(named: "image4")),
    Item(title: "Image 5", image: UIImage(named: "image5")),
    Item(title: "Image 6", image: UIImage(named: "image6")),
    Item(title: "Image 7", image: UIImage(named: "image7")),
    Item(title: "Image 8", image: UIImage(named: "image8")),
    Item(title: "Image 9", image: UIImage(named: "image9")),
    Item(title: "Image 10", image: UIImage(named: "image10")),
    Item(title: "Image 11", image: UIImage(named: "image11")),
    Item(title: "Image 12", image: UIImage(named: "image12")),
    Item(title: "Image 13", image: UIImage(named: "image13")),
    Item(title: "Image 14", image: UIImage(named: "image14")),
    Item(title: "Image 15", image: UIImage(named: "image15")),
    Item(title: "Image 16", image: UIImage(named: "image16")),
    Item(title: "Image 17", image: UIImage(named: "image17")),
    Item(title: "Image 18", image: UIImage(named: "image18")),
    Item(title: "Image 19", image: UIImage(named: "image19")),
    Item(title: "Image 20", image: UIImage(named: "image20")),
    Item(title: "Image 21", image: UIImage(named: "image21")),
    Item(title: "Image 22", image: UIImage(named: "image22")),
    Item(title: "Image 23", image: UIImage(named: "image23")),
    Item(title: "Image 24", image: UIImage(named: "image24")),
    Item(title: "Image 25", image: UIImage(named: "image25")),
    Item(title: "Image 26", image: UIImage(named: "image26")),
    Item(title: "Image 27", image: UIImage(named: "image27")),
    Item(title: "Image 28", image: UIImage(named: "image28")),
    Item(title: "Image 29", image: UIImage(named: "image29")),
    Item(title: "Image 30", image: UIImage(named: "image30")),
    Item(title: "Image 31", image: UIImage(named: "image31")),
    ]
