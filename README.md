# ScrollView
//图片轮播:初始化,添加一下就ok
    NSArray *pictureArr = [[NSArray alloc]initWithObjects:@"1.jpg",@"2.jpg",@"3.jpg", nil];//图片的名字
    //第一个参数是你创建scrollView的大小 第二个参数图片名字数组   第三个参数是pageControlHight
    ScrollView *scrollView = [[ScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetWidth(self.view.frame)) imageArr:pictureArr pageControlHight:40];
    [self.view addSubview:scrollView];
