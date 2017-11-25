//
//  GCDBlackBox.swift
//  MyMovieManager
//
//  Created by xengar on 2017-11-25.
//  Copyright © 2017 xengar. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
