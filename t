
[1mFrom:[0m /home/ec2-user/environment/microposts/app/controllers/microposts_controller.rb:8 MicropostsController#create:

     [1;34m5[0m: [32mdef[0m [1;34mcreate[0m
     [1;34m6[0m:   @micropost = current_user.microposts.build(micropost_params)
     [1;34m7[0m:   binding.pry
 =>  [1;34m8[0m:   [32mif[0m @micropost.save
     [1;34m9[0m:     flash[[33m:success[0m] = [31m[1;31m'[0m[31mメッセージを投稿しました。[1;31m'[0m[31m[0m
    [1;34m10[0m:     redirect_to root_url
    [1;34m11[0m:   [32melse[0m
    [1;34m12[0m:     @microposts = current_user.feed_microposts.order([35mid[0m: [33m:desc[0m).page(params[[33m:page[0m])
    [1;34m13[0m:     flash.now[[33m:danger[0m] = [31m[1;31m'[0m[31mメッセージの投稿に失敗しました。[1;31m'[0m[31m[0m
    [1;34m14[0m:     render [31m[1;31m'[0m[31mtoppages/index[1;31m'[0m[31m[0m
    [1;34m15[0m:   [32mend[0m
    [1;34m16[0m: [32mend[0m

