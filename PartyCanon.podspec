#
# Be sure to run `pod lib lint PartyCanon.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PartyCanon"
  s.version          = "0.1.1"
  s.summary          = "Add a party canon to your screen to reward your user."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                        PartyCanon adds a fine tuneds CoreAnimation particle emitter to your screen and let you shoot confetti over your screen when your user does something special of for the first time. A great way to reward your user.
                       DESC

  s.homepage         = "https://github.com/plaetzchen/PartyCanon"
  s.screenshots     = "http://pltzchn.de/party_canon_2.png", "http://pltzchn.de/party_canon_2.png"
  s.license          = 'MIT'
  s.author           = { "Philip Brechler" => "pbrechler@mac.com" }
  s.source           = { :git => "https://github.com/plaetzchen/PartyCanon.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/plaetzchen'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'PartyCanon' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'QuartzCore'
end
