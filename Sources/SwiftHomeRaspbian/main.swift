import TwitterAPIKit
import PathKit
import Foundation
import SwiftHomeCredentials

print("Hello, world!")

let client = TwitterAPIClient(
    consumerKey: TwitterCredentials.consumerAPIKey,
    consumerSecret: TwitterCredentials.consumerAPIsecretkey,
    oauthToken: TwitterCredentials.oauthToken,
    oauthTokenSecret: TwitterCredentials.oauthTokenSecret)
let fileName = "test.png"
let imagePath = URL(string: "file://\(Path.current)/\(fileName)")!
let imageData = try! Data(contentsOf: imagePath)
let tweetText = "Test!"
client.v1.media.uploadMedia(.init(media: imageData, mediaType: "image/png.", filename: "")) { response in
    switch response.result {
    case .success(let mediaId):
        let media = PostTweetsRequestV2.Media(mediaIDs: [mediaId])

        client.v2.tweet.postTweet(.init(
            media: media,
            text: tweetText
        ))
        .responseObject { tweetResponse in
            switch tweetResponse.result {
            case .success(let success):
                print(success)
            case .failure(let error):
                print(error)
            }
        }
    case .failure(let error):
        print(error)
    }
}
