import Foundation

class Obstacle : CCNode
{
    weak var topCarrot: CCNode!
    var bottomCarrot: CCNode!

    // visibility on a 3,5-inch iPhone ends a 88 points and we want some meat
    let topCarrotMinimumPositionY: CGFloat = 128
    // visibility ends at 480 and we want some meat
    let bottomCarrotMaximumPositionY: CGFloat = 440
    // distance between top and bottom pipe
    let carrotDistance: CGFloat = 142

    func didLoadFromCCB() {
        topCarrot.physicsBody.sensor = true
        bottomCarrot.physicsBody.sensor = true
    }

    func setupRandomPosition() {
        // returns a value between 0.f and 1.f
        let randomPrecision: UInt32 = 100
        let random = CGFloat(arc4random_uniform(randomPrecision)) / CGFloat(randomPrecision)
        // calculate the end of the range of top pipe
        let range = bottomCarrotMaximumPositionY - carrotDistance - topCarrotMinimumPositionY
        topCarrot.position = ccp(topCarrot.position.x, topCarrotMinimumPositionY + (random * range));
        bottomCarrot.position = ccp(bottomCarrot.position.x, topCarrot.position.y + carrotDistance);
    }
}
