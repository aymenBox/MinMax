extends Node

var admob = null
var isReal = true
var isTop = true
var adBannerId = "ca-app-pub-1225630991244449/8972795635" # [Replace with your Ad Unit ID and delete this message.]
var adInterstitialId = "ca-app-pub-1225630991244449/6780573104" # [Replace with your Ad Unit ID and delete this message.]
var adRewardedId = "ca-app-pub-1225630991244449/8398080565"


func _ready():
	if(Engine.has_singleton("AdMob")):
		admob = Engine.get_singleton("AdMob")
		admob.init(isReal, get_instance_id())
		loadBanner()
		loadInterstitial()
		loadRewardedVideo()
	get_tree().connect("screen_resized", self, "onResize")


func loadBanner():
	if admob != null:
		admob.loadBanner(adBannerId, isTop)

func loadInterstitial():
	if admob != null:
		admob.loadInterstitial(adInterstitialId)

func loadRewardedVideo():
	if admob != null:
		admob.loadRewardedVideo(adRewardedId)


func onResize():
	if admob != null:
		admob.resize()

#func _on_interstitial_close():
#	pass

func _on_rewarded_video_ad_closed():
	$"/root/main/restart".queue_free()
	$"/root/main".set_process(true)
	$"/root/main".set_process_input(true)
	$"/root/main/time_c/time_bar".value=0
	loadRewardedVideo()
	pass