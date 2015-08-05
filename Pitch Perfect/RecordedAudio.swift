//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Manch Hon on 7/23/15.
//  Copyright (c) 2015 Manch Hon. All rights reserved.
//

import Foundation

class RecordedAudio {
    var filePathUrl: NSURL!
    var title: String!
    init(filePathUrl: NSURL, title: String) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
}