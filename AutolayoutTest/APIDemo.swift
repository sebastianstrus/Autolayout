//
//  APIDemo.swift
//  AutolayoutTest
//
//  Created by Sebastian Strus on 2018-06-21.
//  Copyright © 2018 Sebastian Strus. All rights reserved.
//

import UIKit

class APIDemo {
    
    class func getAllPages() -> [Page] {
        let pages = [
            Page(imageName: "emerald", title: "Diamond is a vary solid form!", description: "Emerald is a precious gemstone and a variety of the mineral beryl colored green by trace amounts of chromium and sometimes vanadium. Beryl has a hardness of 7.5–8 on the Mohs scale.[2] Most emeralds are highly included, so their toughness (resistance to breakage) is classified as generally poor. Emerald is a cyclosilicate."),
            Page(imageName: "gold", title: "Gold is one of the most coveted metals in the world. ", description: "Gold is a chemical element with symbol Au (from Latin: aurum) and atomic number 79, making it one of the higher atomic number elements that occur naturally. In its purest form, it is a bright, slightly reddish yellow, dense, soft, malleable, and ductile metal."),
            Page(imageName: "pearl", title: "Pearls have been valued since ancient times.", description: "A pearl is a hard glistening object produced within the soft tissue (specifically the mantle) of a living shelled mollusk or another animal, such as a conulariid. Just like the shell of a mollusk, a pearl is composed of calcium carbonate (mainly aragonite or a mixture of aragonite and calcite) in minute crystalline form, which has been deposited in concentric layers."),
            Page(imageName: "silver", title: "Demand for silver in the latter field has reached a new record.", description: "Silver is a chemical element with symbol Ag (from the Latin argentum, derived from the Proto-Indo-European h₂erǵ: \"shiny\" or \"white\") and atomic number 47. A soft, white, lustrous transition metal, it exhibits the highest electrical conductivity, thermal conductivity, and reflectivity of any metal.")
        ]
        
        return pages
    }
}

