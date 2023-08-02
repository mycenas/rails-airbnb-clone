module QuestsHelper
  def display_coins(reward)
    if reward < 500
      image_tag('coin.png', alt: '1x coin', width: '20px', height: '20px')
    elsif reward >= 500 && reward < 1000
      image_tag('coin.png', alt: '2x coin', width: '20px', height: '20px') * 2
    elsif reward >= 1000 && reward < 1500
      image_tag('coin.png', alt: '3x coin', width: '20px', height: '20px') * 3
    else
      image_tag('coin.png', alt: '4x coin', width: '20px', height: '20px') * 4
    end
  end
end
