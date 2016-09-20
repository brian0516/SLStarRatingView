# SLStarRatingView

SLStarRatingView 是一个简单的用两张图片就能实现的滑动评分控件,其主要原理是利用三个视图叠加。一个全星的视图放在最下面,一个遮挡视图放在中间,一个全空星的视图放在最上面
![屏幕快照 2016-09-20 下午4.29.46](media/14743365212056/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-09-20%20%E4%B8%8B%E5%8D%884.29.46.png)

如上图所示,黄色的部分为中间的遮挡视图,当手划过视图时,在==-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event==和==-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event==中捕获触摸和滑动,然后更具触摸点改变遮挡视图的frame。最后使用block将分数回调。

##遗留问题
？？当手指滑动到两个星中间的空白处的时候，任然会算分，实际上这个时候是应该停止算分的

！！


