/* 托盘 */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;    /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;        /* 0 means no systray */


/* 外观 */
static const unsigned int borderpx  = 1;        /* 窗口边框 */
static const unsigned int snap      = 32;       /* 边缘吸附 */
static const int showbar            = 1;        /* 是否显示状态栏 */
static const int topbar             = 1;        /* 0 表示底部状态栏 */
static const char *fonts[]          = {	        /* 状态栏字体 */
					"JetBrainsMono Nerd Font:size=17",
					"Sarasa Mono SC:size=17",
					"Noto Color Emoji:size=17"
				      };
/* 状态栏配色(Gruvbox) */
static const char col_gray1[]       = "#32302f"; /* 背景色 */
static const char col_gray2[]       = "#1d2021"; /* 非激活窗口 */
static const char col_gray3[]       = "#ebdbb2"; /* 文字颜色 */
static const char col_gray4[]       = "#ebdbb2"; /* 激活窗口边框/文字 */
static const char col_cyan[]        = "#5b623e"; /* 主题色 */
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* 标签显示文字 */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
        { "network-manager", NULL,       NULL,       0,            1,           -1 },

};

/* 窗口布局 */
static const float mfact     = 0.5;              /* 两个窗口的分割比例 */
static const int nmaster     = 1;    	         /* 主窗口的窗口数量 */
static const int resizehints = 0;                /* 1 表示尊重应用尺寸提醒 */
static const int lockfullscreen = 1;             /* 1 将强制全屏获得焦点 */
static const int refreshrate = 120;              /* 移动窗口的刷新率 */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },                     /* 默认第一个布局 */
	{ "><>",      NULL },    
	{ "[M]",      monocle },
};

/* 按键自定义 */
#include <X11/XF86keysym.h>                       /* 启用多媒体按键 */                              
#define MODKEY Mod4Mask                           /* Mod1是alt键,Mod4是win键 */ 
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* 变量(命令) */
static const char *flameshotcmd[] = { "flameshot", "gui", NULL };
static const char *slock[] = { "slock",NULL };
static const char *nmcmd[]  = { "st", "-c", "network-manager", "-e", "nmtui", NULL };

static const char scratchpadname[] = "scratchpad";
static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "90x24", NULL }; 

static const char *up_vol[]   = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "+10%",   NULL };
static const char *down_vol[] = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "-10%",   NULL };
static const char *mute_vol[] = { "pactl", "set-sink-mute",   "@DEFAULT_SINK@", "toggle", NULL };
static const char *brighter[] = { "brightnessctl", "set", "10%+", NULL };
static const char *dimmer[]   = { "brightnessctl", "set", "10%-", NULL };

static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run",  NULL };
static const char *termcmd[]  = { "st", NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
/* 音量&亮度 */
       { 0, XF86XK_AudioMute,        spawn, {.v = mute_vol } },
       { 0, XF86XK_AudioLowerVolume, spawn, {.v = down_vol } },
       { 0, XF86XK_AudioRaiseVolume, spawn, {.v = up_vol } },
       { 0, XF86XK_MonBrightnessDown, spawn, {.v = dimmer } },
       { 0, XF86XK_MonBrightnessUp,   spawn, {.v = brighter } },
       
       { MODKEY, XK_s, spawn, {.v = flameshotcmd } }, //截屏(火焰截图) 
       { MODKEY,                       XK_n,      spawn,          {.v = nmcmd } }, // 打开网络管理器(nmtui) 
       { MODKEY,			XK_q,	   spawn, 	   {.v = slock } }, // 锁屏
       { MODKEY,                       XK_grave,  togglescratch,  {.v = scratchpadcmd } }, // 临时终端
       { MODKEY|ControlMask, XK_q,      quit,           {1} }, // 重新加载配置  
       { MODKEY|ShiftMask,             XK_f,      togglefullscr,  {0} }, // 真正全屏

	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

