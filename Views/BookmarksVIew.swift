//
//  BookmarksVIew.swift
//  Time To Think
//
//  Created by James Cosgrove on 24/09/2019.
//  Copyright © 2019 James Cosgrove. All rights reserved.
//

import SwiftUI

struct BookmarksView : View {
	var body: some View {
		VStack {
			Text("You don't have any bookmarked \ncards at the moment")
				.multilineTextAlignment(.center)
			Image(systemName: "bookmark")
		}
		.font(.caption)
		.foregroundColor(Color(UIColor.secondaryLabel))
	}
}
