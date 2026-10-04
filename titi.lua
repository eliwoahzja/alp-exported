L0_21 = MediaPlayer
L0_21 = L0_21()
video.setVideoPath(activity.getLuaDir().. "/motherchod/bg.mp4")
video.start()
video.setOnPreparedListener(MediaPlayer.OnPreparedListener({
  onPrepared = function(A0_27)
    video.start()
    A0_27.setLooping(true)
    video.setBackgroundColor(0)
  end}))