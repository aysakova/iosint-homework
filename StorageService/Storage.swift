//
//  Storage.swift
//  Navigation
//
//  Created by Aysa Minkova on 2021/11/04.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

public let postPolitics = Post(author: "BBC Politics", description: "Boris Johnson says he absolutely has full confidence in his foreign secretary amid criticism of Dominic Raab's decision not to call Afghan ministers over evacuating translators. \n Mr Raab said he instead prioritised security at Kabul airport and delegated the call to a junior minister. But that call did not happen due to the deteriorating situation, he added. The foreign secretary has rejected demands from the opposition to resign.\n Speaking after a meeting of the government's emergency Cobra committee on Afghanistan, the prime minister dismissed suggestions the UK was uninterested in the issue, saying: The whole of the government has been working virtually round the clock.", image: "politics", likes: 5, views: 5)

public let postEconomics = Post(author: "Famous economist", description: "S&P500 crashed amidst threat of nuclear attack from Wakanda government.", image: "economics", likes: 20, views: 20)

public let postGossip = Post(author: "Famous instagrammer", description: "Brad Pitt and Angelina Jolie are back together! \nThe couple threw a wedding party on the bride's private island.", image: "gossip", likes: 123, views: 1000)

public let postHealth = Post(author: "Famous bodybuilder", description: "India's drug regulator has approved the world's first DNA vaccine against Covid-19 for emergency The three-dose ZyCoV-D vaccine prevented symptomatic disease in 66% of those vaccinated, according to an interim study quoted by the vaccine maker Cadila Healthcare. The firm plans to make up to 120 million doses of India's second home-grown vaccine every. Previous DNA vaccines have worked well in animals but not humans. India has so far given more than 570 million doses of three previously approved vaccines - Covishield, Covaxin and Sputnik V.", image: "health", likes: 1, views: 2)

public struct Storage {
    public static let arrayOfPosts = [postPolitics, postEconomics, postGossip, postHealth]
}
