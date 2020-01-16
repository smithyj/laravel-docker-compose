<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::any('/info', function () {
    echo "<center>访问IP：{$_SERVER['HTTP_X_REAL_IP']}</center>";
    echo "<center>代理IP：{$_SERVER['REMOTE_ADDR']}</center>";
    echo "<center>服务IP：{$_SERVER['SERVER_ADDR']}</center>";
    echo "<center>真实访问地址：{$_SERVER['HTTP_X_FORWARDED_PROTO']}://{$_SERVER['HTTP_X_FORWARDED_HOST']}:{$_SERVER['HTTP_X_FORWARDED_PORT']}</center>";
    echo "<center>代理访问地址：{$_SERVER['REQUEST_SCHEME']}://{$_SERVER['HTTP_HOST']}:{$_SERVER['SERVER_PORT']}</center>";
    phpinfo();
});
