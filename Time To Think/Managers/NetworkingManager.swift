//
//  NetworkingManager.swift
//  Time To Think
//
//  Created by James Cosgrove on 24/09/2019.
//  Copyright © 2019 James Cosgrove. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import WikipediaKit

class NetworkingManager: ObservableObject {
	
	let wikipedia = Wikipedia()
	
	var willChange = PassthroughSubject<NetworkingManager, Never>()
    
	var topicList = CardModel(title: "", text: ""){
        didSet {
            willChange.send(self)
        }
    }
	
	init() {
		
		WikipediaNetworking.appAuthorEmailForAPI = "briscoe3@me.com"
		let language = WikipediaLanguage("en")
		
		let _ = Wikipedia.shared.requestOptimizedSearchResults(language: language, term: "zone of death", maxCount: 1) { (searchResults, error) in

			guard error == nil else { return }
			guard let searchResults = searchResults else { return }
			
			for articlePreview in searchResults.items {
				self.topicList.title = articlePreview.displayTitle
				self.topicList.text = articlePreview.displayText
				print(self.topicList)
			}
		}
		
	}
}


