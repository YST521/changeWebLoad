//
//  ViewController.m
//  RuntimeDemo
//
//  Created by yst911521 on 2017/10/19.
//  Copyright © 2017年 YST. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"


@interface ViewController (){
    
    UIWebView *webView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor redColor]];
    
 //方法交换简书博客 http://www.jianshu.com/p/809b17f2b4a0
    
    NSURL *url =[NSURL URLWithString:@"http://www.baidu.com"];
    webView =[[UIWebView alloc]init];
    webView.frame =  self.view.bounds;
    
    //NSURL+URL 类别里进行了 方法交换 才实现明明加载的是百度 却显示了简书
    
    [self.view addSubview:webView];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    [self test];
 
}

-(void)test{
    
    Person *p =[[Person alloc]init];
    
   // [p eat];
    
    //调用一个没实现方法 通过runtime 添加一个方法
    //给添加的方法传一个参数
    [p performSelector:@selector(eat) withObject:@"888"];
  
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    Person *p =[[Person alloc]init];
    
    [p eat];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
