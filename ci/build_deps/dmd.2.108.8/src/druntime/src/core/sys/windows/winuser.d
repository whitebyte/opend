/**
 * Windows API header module
 *
 * Translated from MinGW Windows headers
 *
 * License: $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
 * Source: $(DRUNTIMESRC core/sys/windows/_winuser.d)
 */
module core.sys.windows.winuser;
version (Windows):

version (ANSI) {} else version = Unicode;
pragma(lib, "user32");

// Conversion Notes:
// The following macros were for win16 only, and are not included in this file:
//#define EnumTaskWindows(h, f, p) EnumThreadWindows((DWORD)h, f, p)
//#define PostAppMessageA(t, m, w, l) PostThreadMessageA((DWORD)t, m, w, l)
//#define PostAppMessageW(t, m, w, l) PostThreadMessageW((DWORD)t, m, w, l)
//#define GetSysModalWindow() (NULL)
//#define SetSysModalWindow(h) (NULL)
//#define GetWindowTask(hWnd) ((HANDLE)GetWindowThreadProcessId(hWnd, NULL))
//#define DefHookProc(c, p, lp, h) CallNextHookEx((HHOOK)*h, c, p, lp)

import core.sys.windows.w32api, core.sys.windows.winbase, core.sys.windows.wingdi;
import core.sys.windows.windef; // for HMONITOR

// FIXME: clean up Windows version support

LPTSTR MAKEINTATOM_T()(int i) {
    return cast(LPTSTR) i;
}

enum LPTSTR WC_DIALOG = MAKEINTATOM_T(0x8002);

enum {
    FAPPCOMMAND_MOUSE = 0x8000,
    FAPPCOMMAND_KEY   = 0,
    FAPPCOMMAND_OEM   = 0x1000,
    FAPPCOMMAND_MASK  = 0xF000
}

enum {
    MNGO_NOINTERFACE = 0,
    MNGO_NOERROR,
    MNGOF_TOPGAP     = 1,
    MNGOF_BOTTOMGAP
}

enum {
    FVIRTKEY  = 1,
    FNOINVERT = 2,
    FSHIFT    = 4,
    FCONTROL  = 8,
    FALT      = 16
}

enum {
    ATF_TIMEOUTON     = 1,
    ATF_ONOFFFEEDBACK = 2,
    ATF_AVAILABLE     = 4 // May be obsolete. Not in recent MS docs.
}

enum {
    WH_MIN             = -1,
    WH_MSGFILTER       = -1,
    WH_JOURNALRECORD,
    WH_JOURNALPLAYBACK,
    WH_KEYBOARD,
    WH_GETMESSAGE,
    WH_CALLWNDPROC,
    WH_CBT,
    WH_SYSMSGFILTER,
    WH_MOUSE,
    WH_HARDWARE,
    WH_DEBUG,
    WH_SHELL,
    WH_FOREGROUNDIDLE,
    WH_CALLWNDPROCRET,
    WH_KEYBOARD_LL,
    WH_MOUSE_LL,    // = 14
    WH_MAX             = 14,
    WH_MINHOOK         = WH_MIN,
    WH_MAXHOOK         = WH_MAX
}

enum {
    HC_ACTION       = 0,
    HC_GETNEXT,
    HC_SKIP,
    HC_NOREMOVE, // = 3
    HC_NOREM        = HC_NOREMOVE,
    HC_SYSMODALON,
    HC_SYSMODALOFF
}

enum {
    HCBT_MOVESIZE    = 0,
    HCBT_MINMAX,
    HCBT_QS,
    HCBT_CREATEWND,
    HCBT_DESTROYWND,
    HCBT_ACTIVATE,
    HCBT_CLICKSKIPPED,
    HCBT_KEYSKIPPED,
    HCBT_SYSCOMMAND,
    HCBT_SETFOCUS // = 9
}

enum {
    CF_TEXT                = 0x0001,
    CF_BITMAP,
    CF_METAFILEPICT,
    CF_SYLK,
    CF_DIF,
    CF_TIFF,
    CF_OEMTEXT,
    CF_DIB,
    CF_PALETTE,
    CF_PENDATA,
    CF_RIFF,
    CF_WAVE,
    CF_UNICODETEXT,
    CF_ENHMETAFILE,
    CF_HDROP,
    CF_LOCALE,
    CF_DIBV5,
    CF_MAX,             // = 0x0012
    CF_OWNERDISPLAY        = 0x0080,
    CF_DSPTEXT,
    CF_DSPBITMAP,
    CF_DSPMETAFILEPICT, // = 0x0083
    CF_DSPENHMETAFILE      = 0x008E,
    CF_PRIVATEFIRST        = 0x0200,
    CF_PRIVATELAST         = 0x02FF,
    CF_GDIOBJFIRST         = 0x0300,
    CF_GDIOBJLAST          = 0x03FF
}

enum HKL_PREV = 0;
enum HKL_NEXT = 1;

enum KLF_ACTIVATE       = 1;
enum KLF_SUBSTITUTE_OK  = 2;
enum KLF_UNLOADPREVIOUS = 4;
enum KLF_REORDER        = 8;
enum KLF_REPLACELANG    = 16;
enum KLF_NOTELLSHELL    = 128;
enum KLF_SETFORPROCESS  = 256;
enum KL_NAMELENGTH      = 9;

enum MF_ENABLED = 0;
enum MF_GRAYED = 1;
enum MF_DISABLED = 2;
enum MF_BITMAP = 4;
enum MF_CHECKED = 8;
enum MF_MENUBARBREAK = 32;
enum MF_MENUBREAK = 64;
enum MF_OWNERDRAW = 256;
enum MF_POPUP = 16;
enum MF_SEPARATOR = 0x800;
enum MF_STRING = 0;
enum MF_UNCHECKED = 0;
enum MF_DEFAULT = 4096;
enum MF_SYSMENU = 0x2000;
enum MF_HELP = 0x4000;
enum MF_END = 128;
enum MF_RIGHTJUSTIFY = 0x4000;
enum MF_MOUSESELECT = 0x8000;
enum MF_INSERT = 0;
enum MF_CHANGE = 128;
enum MF_APPEND = 256;
enum MF_DELETE = 512;
enum MF_REMOVE = 4096;
enum MF_USECHECKBITMAPS = 512;
enum MF_UNHILITE = 0;
enum MF_HILITE = 128;

// Also defined in dbt.h
enum BSM_ALLCOMPONENTS      = 0;
enum BSM_VXDS               = 1;
enum BSM_NETDRIVER          = 2;
enum BSM_INSTALLABLEDRIVERS = 4;
enum BSM_APPLICATIONS       = 8;
enum BSM_ALLDESKTOPS        = 16;

enum {
    BSF_QUERY              = 0x0001,
    BSF_IGNORECURRENTTASK  = 0x0002,
    BSF_FLUSHDISK          = 0x0004,
    BSF_NOHANG             = 0x0008,
    BSF_POSTMESSAGE        = 0x0010,
    BSF_FORCEIFHUNG        = 0x0020,
    BSF_NOTIMEOUTIFNOTHUNG = 0x0040,
    BSF_ALLOWSFW           = 0x0080,
    BSF_SENDNOTIFYMESSAGE  = 0x0100
}
static if (_WIN32_WINNT >= 0x501) {
    enum {
        BSF_RETURNHDESK    = 0x0200,
        BSF_LUID           = 0x0400
    }
}

enum BROADCAST_QUERY_DENY = 1112363332;
enum DWORD ENUM_CURRENT_SETTINGS  = -1;
enum DWORD ENUM_REGISTRY_SETTINGS = -2;

enum CDS_UPDATEREGISTRY = 1;
enum CDS_TEST           = 2;
enum CDS_FULLSCREEN     = 4;
enum CDS_GLOBAL         = 8;
enum CDS_SET_PRIMARY    = 16;
enum CDS_NORESET        = 0x10000000;
enum CDS_SETRECT        = 0x20000000;
enum CDS_RESET          = 0x40000000;

enum {
    DISP_CHANGE_BADPARAM   = -5,
    DISP_CHANGE_BADFLAGS,
    DISP_CHANGE_NOTUPDATED,
    DISP_CHANGE_BADMODE,
    DISP_CHANGE_FAILED,
    DISP_CHANGE_SUCCESSFUL,
    DISP_CHANGE_RESTART // =  1
}

enum BST_UNCHECKED     = 0;
enum BST_CHECKED       = 1;
enum BST_INDETERMINATE = 2;
enum BST_PUSHED        = 4;
enum BST_FOCUS         = 8;

enum MF_BYCOMMAND  = 0;
enum MF_BYPOSITION = 1024;
// [Redefined] MF_UNCHECKED = 0
// [Redefined] MF_HILITE = 128
// [Redefined] MF_UNHILITE = 0

enum CWP_ALL             = 0;
enum CWP_SKIPINVISIBLE   = 1;
enum CWP_SKIPDISABLED    = 2;
enum CWP_SKIPTRANSPARENT = 4;

enum IMAGE_BITMAP = 0;
enum IMAGE_ICON = 1;
enum IMAGE_CURSOR = 2;
enum IMAGE_ENHMETAFILE = 3;

enum DF_ALLOWOTHERACCOUNTHOOK = 1;

enum DESKTOP_READOBJECTS     = 1;
enum DESKTOP_CREATEWINDOW    = 2;
enum DESKTOP_CREATEMENU      = 4;
enum DESKTOP_HOOKCONTROL     = 8;
enum DESKTOP_JOURNALRECORD   = 16;
enum DESKTOP_JOURNALPLAYBACK = 32;
enum DESKTOP_ENUMERATE       = 64;
enum DESKTOP_WRITEOBJECTS    = 128;
enum DESKTOP_SWITCHDESKTOP   = 256;

enum int CW_USEDEFAULT = 0x80000000;

enum {
    WS_OVERLAPPED       = 0,
    WS_TILED            = WS_OVERLAPPED,
    WS_MAXIMIZEBOX      = 0x00010000,
    WS_MINIMIZEBOX      = 0x00020000,
    WS_TABSTOP          = 0x00010000,
    WS_GROUP            = 0x00020000,
    WS_THICKFRAME       = 0x00040000,
    WS_SIZEBOX          = WS_THICKFRAME,
    WS_SYSMENU          = 0x00080000,
    WS_HSCROLL          = 0x00100000,
    WS_VSCROLL          = 0x00200000,
    WS_DLGFRAME         = 0x00400000,
    WS_BORDER           = 0x00800000,
    WS_CAPTION          = 0x00c00000,
    WS_OVERLAPPEDWINDOW = WS_OVERLAPPED|WS_CAPTION|WS_SYSMENU|WS_THICKFRAME|WS_MINIMIZEBOX|WS_MAXIMIZEBOX,
    WS_TILEDWINDOW      = WS_OVERLAPPEDWINDOW,
    WS_MAXIMIZE         = 0x01000000,
    WS_CLIPCHILDREN     = 0x02000000,
    WS_CLIPSIBLINGS     = 0x04000000,
    WS_DISABLED         = 0x08000000,
    WS_VISIBLE          = 0x10000000,
    WS_MINIMIZE         = 0x20000000,
    WS_ICONIC           = WS_MINIMIZE,
    WS_CHILD            = 0x40000000,
    WS_CHILDWINDOW      = 0x40000000,
    WS_POPUP            = 0x80000000,
    WS_POPUPWINDOW      = WS_POPUP|WS_BORDER|WS_SYSMENU,
}

enum MDIS_ALLCHILDSTYLES = 1;

enum BS_3STATE = 5;
enum BS_AUTO3STATE = 6;
enum BS_AUTOCHECKBOX = 3;
enum BS_AUTORADIOBUTTON = 9;
enum BS_BITMAP = 128;
enum BS_BOTTOM = 0x800;
enum BS_CENTER = 0x300;
enum BS_CHECKBOX = 2;
enum BS_DEFPUSHBUTTON = 1;
enum BS_GROUPBOX = 7;
enum BS_ICON = 64;
enum BS_LEFT = 256;
enum BS_LEFTTEXT = 32;
enum BS_MULTILINE = 0x2000;
enum BS_NOTIFY = 0x4000;
enum BS_OWNERDRAW = 0xb;
enum BS_PUSHBUTTON = 0;
enum BS_PUSHLIKE = 4096;
enum BS_RADIOBUTTON = 4;
enum BS_RIGHT = 512;
enum BS_RIGHTBUTTON = 32;
enum BS_TEXT = 0;
enum BS_TOP = 0x400;
enum BS_USERBUTTON = 8;
enum BS_VCENTER = 0xc00;
enum BS_FLAT = 0x8000;

enum CBS_AUTOHSCROLL = 64;
enum CBS_DISABLENOSCROLL = 0x800;
enum CBS_DROPDOWN = 2;
enum CBS_DROPDOWNLIST = 3;
enum CBS_HASSTRINGS = 512;
enum CBS_LOWERCASE = 0x4000;
enum CBS_NOINTEGRALHEIGHT = 0x400;
enum CBS_OEMCONVERT = 128;
enum CBS_OWNERDRAWFIXED = 16;
enum CBS_OWNERDRAWVARIABLE = 32;
enum CBS_SIMPLE = 1;
enum CBS_SORT = 256;
enum CBS_UPPERCASE = 0x2000;

enum ES_AUTOHSCROLL = 128;
enum ES_AUTOVSCROLL = 64;
enum ES_CENTER = 1;
enum ES_LEFT = 0;
enum ES_LOWERCASE = 16;
enum ES_MULTILINE = 4;
enum ES_NOHIDESEL = 256;
enum ES_NUMBER = 0x2000;
enum ES_OEMCONVERT = 0x400;
enum ES_PASSWORD = 32;
enum ES_READONLY = 0x800;
enum ES_RIGHT = 2;
enum ES_UPPERCASE = 8;
enum ES_WANTRETURN = 4096;

enum LBS_DISABLENOSCROLL = 4096;
enum LBS_EXTENDEDSEL = 0x800;
enum LBS_HASSTRINGS = 64;
enum LBS_MULTICOLUMN = 512;
enum LBS_MULTIPLESEL = 8;
enum LBS_NODATA = 0x2000;
enum LBS_NOINTEGRALHEIGHT = 256;
enum LBS_NOREDRAW = 4;
enum LBS_NOSEL = 0x4000;
enum LBS_NOTIFY = 1;
enum LBS_OWNERDRAWFIXED = 16;
enum LBS_OWNERDRAWVARIABLE = 32;
enum LBS_SORT = 2;
enum LBS_STANDARD = 0xa00003;
enum LBS_USETABSTOPS = 128;
enum LBS_WANTKEYBOARDINPUT = 0x400;

enum SBS_BOTTOMALIGN = 4;
enum SBS_HORZ = 0;
enum SBS_LEFTALIGN = 2;
enum SBS_RIGHTALIGN = 4;
enum SBS_SIZEBOX = 8;
enum SBS_SIZEBOXBOTTOMRIGHTALIGN = 4;
enum SBS_SIZEBOXTOPLEFTALIGN = 2;
enum SBS_SIZEGRIP = 16;
enum SBS_TOPALIGN = 2;
enum SBS_VERT = 1;

enum SS_BITMAP = 14;
enum SS_BLACKFRAME = 7;
enum SS_BLACKRECT = 4;
enum SS_CENTER = 1;
enum SS_CENTERIMAGE = 512;
enum SS_ENHMETAFILE = 15;
enum SS_ETCHEDFRAME = 18;
enum SS_ETCHEDHORZ = 16;
enum SS_ETCHEDVERT = 17;
enum SS_GRAYFRAME = 8;
enum SS_GRAYRECT = 5;
enum SS_ICON = 3;
enum SS_LEFT = 0;
enum SS_LEFTNOWORDWRAP = 0xc;
enum SS_NOPREFIX = 128;
enum SS_NOTIFY = 256;
enum SS_OWNERDRAW = 0xd;
enum SS_REALSIZEIMAGE = 0x800;
enum SS_RIGHT = 2;
enum SS_RIGHTJUST = 0x400;
enum SS_SIMPLE = 11;
enum SS_SUNKEN = 4096;
enum SS_WHITEFRAME = 9;
enum SS_WHITERECT = 6;
enum SS_USERITEM = 10;
enum SS_TYPEMASK = 0x0000001FL;
enum SS_ENDELLIPSIS = 0x00004000L;
enum SS_PATHELLIPSIS = 0x00008000L;
enum SS_WORDELLIPSIS = 0x0000C000L;
enum SS_ELLIPSISMASK = 0x0000C000L;

enum DS_ABSALIGN      = 0x0001;
enum DS_3DLOOK        = 0x0004;
enum DS_SYSMODAL      = 0x0002;
enum DS_FIXEDSYS      = 0x0008;
enum DS_NOFAILCREATE  = 0x0010;
enum DS_LOCALEDIT     = 0x0020;
enum DS_SETFONT       = 0x0040;
enum DS_MODALFRAME    = 0x0080;
enum DS_NOIDLEMSG     = 0x0100;
enum DS_SETFOREGROUND = 0x0200;
enum DS_CONTROL       = 0x0400;
enum DS_CENTER        = 0x0800;
enum DS_CENTERMOUSE   = 0x1000;
enum DS_CONTEXTHELP   = 0x2000;
enum DS_SHELLFONT     = DS_SETFONT | DS_FIXEDSYS;

enum WS_EX_ACCEPTFILES = 16;
enum WS_EX_APPWINDOW = 0x40000;
enum WS_EX_CLIENTEDGE = 512;
enum WS_EX_COMPOSITED = 0x2000000;  // XP
enum WS_EX_CONTEXTHELP = 0x400;
enum WS_EX_CONTROLPARENT = 0x10000;
enum WS_EX_DLGMODALFRAME = 1;
enum WS_EX_LAYERED = 0x80000;  // w2k
enum WS_EX_LAYOUTRTL = 0x400000;  // w98, w2k
enum WS_EX_LEFT = 0;
enum WS_EX_LEFTSCROLLBAR = 0x4000;
enum WS_EX_LTRREADING = 0;
enum WS_EX_MDICHILD = 64;
enum WS_EX_NOACTIVATE = 0x8000000;  // w2k
enum WS_EX_NOINHERITLAYOUT = 0x100000;  // w2k
enum WS_EX_NOPARENTNOTIFY = 4;
enum WS_EX_NOREDIRECTIONBITMAP = 0x00200000; // w8, s2012
enum WS_EX_OVERLAPPEDWINDOW = 0x300;
enum WS_EX_PALETTEWINDOW = 0x188;
enum WS_EX_RIGHT = 0x1000;
enum WS_EX_RIGHTSCROLLBAR = 0;
enum WS_EX_RTLREADING = 0x2000;
enum WS_EX_STATICEDGE = 0x20000;
enum WS_EX_TOOLWINDOW = 128;
enum WS_EX_TOPMOST = 8;
enum WS_EX_TRANSPARENT = 32;
enum WS_EX_WINDOWEDGE = 256;

enum WINSTA_ENUMDESKTOPS      = 1;
enum WINSTA_READATTRIBUTES    = 2;
enum WINSTA_ACCESSCLIPBOARD   = 4;
enum WINSTA_CREATEDESKTOP     = 8;
enum WINSTA_WRITEATTRIBUTES   = 16;
enum WINSTA_ACCESSGLOBALATOMS = 32;
enum WINSTA_EXITWINDOWS       = 64;
enum WINSTA_ENUMERATE         = 256;
enum WINSTA_READSCREEN        = 512;

enum DDL_READWRITE = 0;
enum DDL_READONLY  = 1;
enum DDL_HIDDEN    = 2;
enum DDL_SYSTEM    = 4;
enum DDL_DIRECTORY = 16;
enum DDL_ARCHIVE   = 32;
enum DDL_POSTMSGS  = 8192;
enum DDL_DRIVES    = 16384;
enum DDL_EXCLUSIVE = 32768;

enum {
    DC_ACTIVE       = 0x0001,
    DC_SMALLCAP     = 0x0002,
    DC_ICON         = 0x0004,
    DC_TEXT         = 0x0008,
    DC_INBUTTON     = 0x0010,
    DC_GRADIENT     = 0x0020
}
static if (_WIN32_WINNT >= 0x501) {
    enum DC_BUTTONS = 0x1000;
}

// Where are these documented?
//enum DC_CAPTION = DC_ICON|DC_TEXT|DC_BUTTONS;
//enum DC_NC      = DC_CAPTION|DC_FRAME;

enum BDR_RAISEDOUTER = 1;
enum BDR_SUNKENOUTER = 2;
enum BDR_RAISEDINNER = 4;
enum BDR_SUNKENINNER = 8;
enum BDR_OUTER       = 3;
enum BDR_INNER       = 0xc;
enum BDR_RAISED      = 5;
enum BDR_SUNKEN      = 10;

enum EDGE_RAISED = BDR_RAISEDOUTER|BDR_RAISEDINNER;
enum EDGE_SUNKEN = BDR_SUNKENOUTER|BDR_SUNKENINNER;
enum EDGE_ETCHED = BDR_SUNKENOUTER|BDR_RAISEDINNER;
enum EDGE_BUMP   = BDR_RAISEDOUTER|BDR_SUNKENINNER;

enum BF_LEFT                    = 1;
enum BF_TOP                     = 2;
enum BF_RIGHT                   = 4;
enum BF_BOTTOM                  = 8;
enum BF_TOPLEFT                 = BF_TOP|BF_LEFT;
enum BF_TOPRIGHT                = BF_TOP|BF_RIGHT;
enum BF_BOTTOMLEFT              = BF_BOTTOM|BF_LEFT;
enum BF_BOTTOMRIGHT             = BF_BOTTOM|BF_RIGHT;
enum BF_RECT                    = BF_LEFT|BF_TOP|BF_RIGHT|BF_BOTTOM ;
enum BF_DIAGONAL                = 16;
enum BF_DIAGONAL_ENDTOPRIGHT    = BF_DIAGONAL|BF_TOP|BF_RIGHT;
enum BF_DIAGONAL_ENDTOPLEFT     = BF_DIAGONAL|BF_TOP|BF_LEFT;
enum BF_DIAGONAL_ENDBOTTOMLEFT  = BF_DIAGONAL|BF_BOTTOM|BF_LEFT;
enum BF_DIAGONAL_ENDBOTTOMRIGHT = BF_DIAGONAL|BF_BOTTOM|BF_RIGHT;
enum BF_MIDDLE                  = 0x800;
enum BF_SOFT                    = 0x1000;
enum BF_ADJUST                  = 0x2000;
enum BF_FLAT                    = 0x4000;
enum BF_MONO                    = 0x8000;

enum {
    DFC_CAPTION      = 1,
    DFC_MENU,
    DFC_SCROLL,
    DFC_BUTTON,
    DFC_POPUPMENU // = 5
}

enum {
    DFCS_CAPTIONCLOSE,
    DFCS_CAPTIONMIN,
    DFCS_CAPTIONMAX,
    DFCS_CAPTIONRESTORE,
    DFCS_CAPTIONHELP // = 4
}

enum {
    DFCS_MENUARROW      = 0,
    DFCS_MENUCHECK      = 1,
    DFCS_MENUBULLET     = 2,
    DFCS_MENUARROWRIGHT = 4
}

enum {
    DFCS_SCROLLUP            =  0,
    DFCS_SCROLLDOWN          =  1,
    DFCS_SCROLLLEFT          =  2,
    DFCS_SCROLLRIGHT         =  3,
    DFCS_SCROLLCOMBOBOX      =  5,
    DFCS_SCROLLSIZEGRIP      =  8,
    DFCS_SCROLLSIZEGRIPRIGHT = 16
}

enum {
    DFCS_BUTTONCHECK         = 0,
    DFCS_BUTTONRADIOIMAGE    = 0x0001,
    DFCS_BUTTONRADIOMASK     = 0x0002,
    DFCS_BUTTONRADIO         = 0x0004,
    DFCS_BUTTON3STATE        = 0x0008,
    DFCS_BUTTONPUSH          = 0x0010,
    DFCS_INACTIVE            = 0x0100,
    DFCS_PUSHED              = 0x0200,
    DFCS_CHECKED             = 0x0400,
    DFCS_TRANSPARENT         = 0x0800,
    DFCS_HOT                 = 0x1000,
    DFCS_ADJUSTRECT          = 0x2000,
    DFCS_FLAT                = 0x4000,
    DFCS_MONO                = 0x8000
}

enum {
    DST_COMPLEX = 0,
    DST_TEXT,
    DST_PREFIXTEXT,
    DST_ICON,
    DST_BITMAP // = 4
}

enum DSS_NORMAL = 0;
enum DSS_UNION = 16;
enum DSS_DISABLED = 32;
enum DSS_MONO = 128;
enum DSS_RIGHT = 0x8000;

enum DT_BOTTOM = 8;
enum DT_CALCRECT = 1024;
enum DT_CENTER = 1;
enum DT_EDITCONTROL = 8192;
enum DT_END_ELLIPSIS = 32768;
enum DT_PATH_ELLIPSIS = 16384;
enum DT_WORD_ELLIPSIS = 0x40000;
enum DT_EXPANDTABS = 64;
enum DT_EXTERNALLEADING = 512;
enum DT_LEFT = 0;
enum DT_MODIFYSTRING = 65536;
enum DT_NOCLIP = 256;
enum DT_NOPREFIX = 2048;
enum DT_RIGHT = 2;
enum DT_RTLREADING = 131072;
enum DT_SINGLELINE = 32;
enum DT_TABSTOP = 128;
enum DT_TOP = 0;
enum DT_VCENTER = 4;
enum DT_WORDBREAK = 16;
enum DT_INTERNAL = 4096;

enum WB_ISDELIMITER = 2;
enum WB_LEFT = 0;
enum WB_RIGHT = 1;

enum SB_HORZ = 0;
enum SB_VERT = 1;
enum SB_CTL = 2;
enum SB_BOTH = 3;

enum ESB_DISABLE_BOTH = 3;
enum ESB_DISABLE_DOWN = 2;
enum ESB_DISABLE_LEFT = 1;
enum ESB_DISABLE_LTUP = 1;
enum ESB_DISABLE_RIGHT = 2;
enum ESB_DISABLE_RTDN = 2;
enum ESB_DISABLE_UP = 1;
enum ESB_ENABLE_BOTH = 0;

enum SB_LINEUP = 0;
enum SB_LINEDOWN = 1;
enum SB_LINELEFT = 0;
enum SB_LINERIGHT = 1;
enum SB_PAGEUP = 2;
enum SB_PAGEDOWN = 3;
enum SB_PAGELEFT = 2;
enum SB_PAGERIGHT = 3;
enum SB_THUMBPOSITION = 4;
enum SB_THUMBTRACK = 5;
enum SB_ENDSCROLL = 8;
enum SB_LEFT = 6;
enum SB_RIGHT = 7;
enum SB_BOTTOM = 7;
enum SB_TOP = 6;

//MACRO #define IS_INTRESOURCE(i) (((ULONG_PTR)(i) >> 16) == 0)

template MAKEINTRESOURCE_T(WORD i) {
    enum LPTSTR MAKEINTRESOURCE_T = cast(LPTSTR)(i);
}

nothrow @nogc {
    LPSTR MAKEINTRESOURCEA(/*WORD*/uint i) {
        return cast(LPSTR) i;
    }

    LPWSTR MAKEINTRESOURCEW(/*WORD*/uint i) {
        return cast(LPWSTR) i;
    }
}

enum RT_CURSOR       = MAKEINTRESOURCE_T!(1);
enum RT_BITMAP       = MAKEINTRESOURCE_T!(2);
enum RT_ICON         = MAKEINTRESOURCE_T!(3);
enum RT_MENU         = MAKEINTRESOURCE_T!(4);
enum RT_DIALOG       = MAKEINTRESOURCE_T!(5);
enum RT_STRING       = MAKEINTRESOURCE_T!(6);
enum RT_FONTDIR      = MAKEINTRESOURCE_T!(7);
enum RT_FONT         = MAKEINTRESOURCE_T!(8);
enum RT_ACCELERATOR  = MAKEINTRESOURCE_T!(9);
enum RT_RCDATA       = MAKEINTRESOURCE_T!(10);
enum RT_MESSAGETABLE = MAKEINTRESOURCE_T!(11);

enum RT_GROUP_CURSOR = MAKEINTRESOURCE_T!(12);
enum RT_GROUP_ICON   = MAKEINTRESOURCE_T!(14);
enum RT_VERSION      = MAKEINTRESOURCE_T!(16);
enum RT_DLGINCLUDE   = MAKEINTRESOURCE_T!(17);
enum RT_PLUGPLAY     = MAKEINTRESOURCE_T!(19);
enum RT_VXD          = MAKEINTRESOURCE_T!(20);
enum RT_ANICURSOR    = MAKEINTRESOURCE_T!(21);
enum RT_ANIICON      = MAKEINTRESOURCE_T!(22);
enum RT_HTML         = MAKEINTRESOURCE_T!(23);
enum RT_MANIFEST     = MAKEINTRESOURCE_T!(24);

enum CREATEPROCESS_MANIFEST_RESOURCE_ID                 = MAKEINTRESOURCE_T!(1);
enum ISOLATIONAWARE_MANIFEST_RESOURCE_ID                = MAKEINTRESOURCE_T!(2);
enum ISOLATIONAWARE_NOSTATICIMPORT_MANIFEST_RESOURCE_ID = MAKEINTRESOURCE_T!(3);

enum {
    EWX_LOGOFF      =  0,
    EWX_SHUTDOWN    =  1,
    EWX_REBOOT      =  2,
    EWX_FORCE       =  4,
    EWX_POWEROFF    =  8,
    EWX_FORCEIFHUNG = 16
}

enum CS_BYTEALIGNCLIENT = 4096;
enum CS_BYTEALIGNWINDOW = 8192;
enum CS_KEYCVTWINDOW = 4;
enum CS_NOKEYCVT = 256;
enum CS_CLASSDC = 64;
enum CS_DBLCLKS = 8;
enum CS_GLOBALCLASS = 16384;
enum CS_HREDRAW = 2;
enum CS_NOCLOSE = 512;
enum CS_OWNDC = 32;
enum CS_PARENTDC = 128;
enum CS_SAVEBITS = 2048;
enum CS_VREDRAW = 1;
enum CS_IME = 0x10000;

enum GCW_ATOM = -32;
enum GCL_CBCLSEXTRA = -20;
enum GCL_CBWNDEXTRA = -18;
enum GCL_HBRBACKGROUND = -10;
enum GCL_HCURSOR = -12;
enum GCL_HICON = -14;
enum GCL_HICONSM = -34;
enum GCL_HMODULE = -16;
enum GCL_MENUNAME = -8;
enum GCL_STYLE = -26;
enum GCL_WNDPROC = -24;

alias GCL_HICONSM GCLP_HICONSM;
alias GCL_HICON GCLP_HICON;
alias GCL_HCURSOR GCLP_HCURSOR;
alias GCL_HBRBACKGROUND GCLP_HBRBACKGROUND;
alias GCL_HMODULE  GCLP_HMODULE;
alias GCL_MENUNAME GCLP_MENUNAME;
alias GCL_WNDPROC  GCLP_WNDPROC;

enum {
    IDC_ARROW       = MAKEINTRESOURCE_T!(32512),
    IDC_IBEAM       = MAKEINTRESOURCE_T!(32513),
    IDC_WAIT        = MAKEINTRESOURCE_T!(32514),
    IDC_CROSS       = MAKEINTRESOURCE_T!(32515),
    IDC_UPARROW     = MAKEINTRESOURCE_T!(32516),
    IDC_SIZE        = MAKEINTRESOURCE_T!(32640),
    IDC_ICON        = MAKEINTRESOURCE_T!(32641),
    IDC_SIZENWSE    = MAKEINTRESOURCE_T!(32642),
    IDC_SIZENESW    = MAKEINTRESOURCE_T!(32643),
    IDC_SIZEWE      = MAKEINTRESOURCE_T!(32644),
    IDC_SIZENS      = MAKEINTRESOURCE_T!(32645),
    IDC_SIZEALL     = MAKEINTRESOURCE_T!(32646),
    IDC_NO          = MAKEINTRESOURCE_T!(32648),
    IDC_HAND        = MAKEINTRESOURCE_T!(32649),
    IDC_APPSTARTING = MAKEINTRESOURCE_T!(32650),
    IDC_HELP        = MAKEINTRESOURCE_T!(32651),
    IDI_APPLICATION = MAKEINTRESOURCE_T!(32512),
    IDI_HAND        = MAKEINTRESOURCE_T!(32513),
    IDI_QUESTION    = MAKEINTRESOURCE_T!(32514),
    IDI_EXCLAMATION = MAKEINTRESOURCE_T!(32515),
    IDI_ASTERISK    = MAKEINTRESOURCE_T!(32516),
    IDI_WINLOGO     = MAKEINTRESOURCE_T!(32517),
    IDI_WARNING     = IDI_EXCLAMATION,
    IDI_ERROR       = IDI_HAND,
    IDI_INFORMATION = IDI_ASTERISK
}
static if (_WIN32_WINNT >= 0x600) {
    enum IDI_SHIELD = MAKEINTRESOURCE_T!(32518);
}

enum {
    MIIM_STATE      = 0x0001,
    MIIM_ID         = 0x0002,
    MIIM_SUBMENU    = 0x0004,
    MIIM_CHECKMARKS = 0x0008,
    MIIM_TYPE       = 0x0010,
    MIIM_DATA       = 0x0020,
    MIIM_STRING     = 0x0040,
    MIIM_BITMAP     = 0x0080,
    MIIM_FTYPE      = 0x0100
}

enum {
    MFT_BITMAP       = 0x0004,
    MFT_MENUBARBREAK = 0x0020,
    MFT_MENUBREAK    = 0x0040,
    MFT_OWNERDRAW    = 0x0100,
    MFT_RADIOCHECK   = 0x0200,
    MFT_RIGHTJUSTIFY = 0x4000,
    MFT_SEPARATOR    = 0x0800,
    MFT_RIGHTORDER   = 0x2000,
    MFT_STRING       = 0
}

enum {
    MFS_CHECKED   = 8,
    MFS_DEFAULT   = 4096,
    MFS_DISABLED  = 3,
    MFS_ENABLED   = 0,
    MFS_GRAYED    = 3,
    MFS_HILITE    = 128,
    MFS_UNCHECKED = 0,
    MFS_UNHILITE  = 0
}

enum {
    GW_HWNDFIRST = 0,
    GW_HWNDLAST,
    GW_HWNDNEXT,
    GW_HWNDPREV,
    GW_OWNER,
    GW_CHILD  // = 5
}

enum {
    SW_HIDE            =  0,
    SW_NORMAL          =  1,
    SW_SHOWNORMAL      =  1,
    SW_SHOWMINIMIZED   =  2,
    SW_MAXIMIZE        =  3,
    SW_SHOWMAXIMIZED   =  3,
    SW_SHOWNOACTIVATE  =  4,
    SW_SHOW            =  5,
    SW_MINIMIZE        =  6,
    SW_SHOWMINNOACTIVE =  7,
    SW_SHOWNA          =  8,
    SW_RESTORE         =  9,
    SW_SHOWDEFAULT     = 10,
    SW_FORCEMINIMIZE   = 11,
    SW_MAX             = 11
}

enum {
    SW_PARENTCLOSING  = 1,
    SW_OTHERZOOM,
    SW_PARENTOPENING,
    SW_OTHERUNZOOM // = 4
}

enum { // is this a different SW from the previous?
    SW_SCROLLCHILDREN = 0x01,
    SW_INVALIDATE     = 0x02,
    SW_ERASE          = 0x04,
    SW_SMOOTHSCROLL   = 0x10
}

enum {
    MB_OK                        = 0,
    MB_OKCANCEL,
    MB_ABORTRETRYIGNORE,
    MB_YESNOCANCEL,
    MB_YESNO,
    MB_RETRYCANCEL,
    MB_CANCELTRYCONTINUE,     // = 6
    MB_TYPEMASK                  = 0x0000000F,
    MB_ICONHAND                  = 0x00000010,
    MB_ICONSTOP                  = MB_ICONHAND,
    MB_ICONERROR                 = MB_ICONHAND,
    MB_ICONQUESTION              = 0x00000020,
    MB_ICONEXCLAMATION           = 0x00000030,
    MB_ICONWARNING               = MB_ICONEXCLAMATION,
    MB_ICONASTERISK              = 0x00000040,
    MB_ICONINFORMATION           = MB_ICONASTERISK,
    MB_USERICON                  = 0x00000080,
    MB_ICONMASK                  = 0x000000F0,

    MB_DEFBUTTON1                = 0,
    MB_DEFBUTTON2                = 0x00000100,
    MB_DEFBUTTON3                = 0x00000200,
    MB_DEFBUTTON4                = 0x00000300,
    MB_DEFMASK                   = 0x00000F00,

    MB_APPLMODAL                 = 0,
    MB_SYSTEMMODAL               = 0x00001000,
    MB_TASKMODAL                 = 0x00002000,
    MB_MODEMASK                  = 0x00003000,

    MB_HELP                      = 0x00004000,
    MB_NOFOCUS                   = 0x00008000,
    MB_MISCMASK                  = 0x0000C000,

    MB_SETFOREGROUND             = 0x00010000,
    MB_DEFAULT_DESKTOP_ONLY      = 0x00020000,
    MB_TOPMOST                   = 0x00040000,
    MB_SERVICE_NOTIFICATION_NT3X = 0x00040000,
    MB_RIGHT                     = 0x00080000,
    MB_RTLREADING                = 0x00100000,
    MB_SERVICE_NOTIFICATION      = 0x00200000
}

enum {
    IDOK          = 1,
    IDCANCEL,
    IDABORT,
    IDRETRY,
    IDIGNORE,
    IDYES,
    IDNO,
    IDCLOSE,
    IDHELP,
    IDTRYAGAIN,
    IDCONTINUE // = 11
}

enum GWL_EXSTYLE = -20;
enum GWL_STYLE = -16;
enum GWL_WNDPROC = -4;
enum GWLP_WNDPROC = -4;
enum GWL_HINSTANCE = -6;
enum GWLP_HINSTANCE = -6;
enum GWL_HWNDPARENT = -8;
enum GWLP_HWNDPARENT = -8;
enum GWL_ID = -12;
enum GWLP_ID = -12;
enum GWL_USERDATA = -21;
enum GWLP_USERDATA = -21;

enum DWL_DLGPROC = 4;
enum DWLP_DLGPROC = 4;
enum DWL_MSGRESULT = 0;
enum DWLP_MSGRESULT = 0;
enum DWL_USER = 8;
enum DWLP_USER = 8;

enum QS_KEY            = 1;
enum QS_MOUSEMOVE      = 2;
enum QS_MOUSEBUTTON    = 4;
enum QS_MOUSE          = 6;
enum QS_POSTMESSAGE    = 8;
enum QS_TIMER          = 16;
enum QS_PAINT          = 32;
enum QS_SENDMESSAGE    = 64;
enum QS_HOTKEY         = 128;
enum QS_ALLPOSTMESSAGE = 256;
static if (_WIN32_WINNT >= 0x501) {
enum QS_RAWINPUT       = 1024;
enum QS_INPUT          = 1031;
enum QS_ALLEVENTS      = 1215;
enum QS_ALLINPUT       = 1279;
} else {
enum QS_INPUT          = 7;
enum QS_ALLEVENTS      = 191;
enum QS_ALLINPUT       = 255;
}

enum MWMO_WAITALL        = 1;
enum MWMO_ALERTABLE      = 2;
enum MWMO_INPUTAVAILABLE = 4;

enum COLOR_3DDKSHADOW = 21;
enum COLOR_3DFACE = 15;
enum COLOR_3DHILIGHT = 20;
enum COLOR_3DHIGHLIGHT = 20;
enum COLOR_3DLIGHT = 22;
enum COLOR_BTNHILIGHT = 20;
enum COLOR_3DSHADOW = 16;
enum COLOR_ACTIVEBORDER = 10;
enum COLOR_ACTIVECAPTION = 2;
enum COLOR_APPWORKSPACE = 12;
enum COLOR_BACKGROUND = 1;
enum COLOR_DESKTOP = 1;
enum COLOR_BTNFACE = 15;
enum COLOR_BTNHIGHLIGHT = 20;
enum COLOR_BTNSHADOW = 16;
enum COLOR_BTNTEXT = 18;
enum COLOR_CAPTIONTEXT = 9;
enum COLOR_GRAYTEXT = 17;
enum COLOR_HIGHLIGHT = 13;
enum COLOR_HIGHLIGHTTEXT = 14;
enum COLOR_INACTIVEBORDER = 11;
enum COLOR_INACTIVECAPTION = 3;
enum COLOR_INACTIVECAPTIONTEXT = 19;
enum COLOR_INFOBK = 24;
enum COLOR_INFOTEXT = 23;
enum COLOR_MENU = 4;
enum COLOR_MENUTEXT = 7;
enum COLOR_SCROLLBAR = 0;
enum COLOR_WINDOW = 5;
enum COLOR_WINDOWFRAME = 6;
enum COLOR_WINDOWTEXT = 8;
enum COLOR_HOTLIGHT = 26;
enum COLOR_GRADIENTACTIVECAPTION = 27;
enum COLOR_GRADIENTINACTIVECAPTION = 28;

enum CTLCOLOR_MSGBOX = 0;
enum CTLCOLOR_EDIT = 1;
enum CTLCOLOR_LISTBOX = 2;
enum CTLCOLOR_BTN = 3;
enum CTLCOLOR_DLG = 4;
enum CTLCOLOR_SCROLLBAR = 5;
enum CTLCOLOR_STATIC = 6;
enum CTLCOLOR_MAX = 7;

// For GetSystemMetrics()
enum : int {
    SM_CXSCREEN = 0,
    SM_CYSCREEN,
    SM_CXVSCROLL,
    SM_CYHSCROLL,
    SM_CYCAPTION,
    SM_CXBORDER,
    SM_CYBORDER,
    SM_CXDLGFRAME,    // = 7
    SM_CXFIXEDFRAME      = SM_CXDLGFRAME,
    SM_CYDLGFRAME,    // = 8
    SM_CYFIXEDFRAME      = SM_CYDLGFRAME,
    SM_CYVTHUMB,      // = 9
    SM_CXHTHUMB,
    SM_CXICON,
    SM_CYICON,
    SM_CXCURSOR,
    SM_CYCURSOR,
    SM_CYMENU,
    SM_CXFULLSCREEN,
    SM_CYFULLSCREEN,
    SM_CYKANJIWINDOW,
    SM_MOUSEPRESENT,
    SM_CYVSCROLL,
    SM_CXHSCROLL,
    SM_DEBUG,
    SM_SWAPBUTTON,
    SM_RESERVED1,
    SM_RESERVED2,
    SM_RESERVED3,
    SM_RESERVED4,
    SM_CXMIN,
    SM_CYMIN,
    SM_CXSIZE,
    SM_CYSIZE,
    SM_CXSIZEFRAME,   // = 32,
    SM_CXFRAME           = SM_CXSIZEFRAME,
    SM_CYSIZEFRAME,   // = 33
    SM_CYFRAME           = SM_CYSIZEFRAME,
    SM_CXMINTRACK,
    SM_CYMINTRACK,
    SM_CXDOUBLECLK,
    SM_CYDOUBLECLK,
    SM_CXICONSPACING,
    SM_CYICONSPACING,
    SM_MENUDROPALIGNMENT,
    SM_PENWINDOWS,
    SM_DBCSENABLED,
    SM_CMOUSEBUTTONS,
    SM_SECURE,
    SM_CXEDGE,
    SM_CYEDGE,
    SM_CXMINSPACING,
    SM_CYMINSPACING,
    SM_CXSMICON,
    SM_CYSMICON,
    SM_CYSMCAPTION,
    SM_CXSMSIZE,
    SM_CYSMSIZE,
    SM_CXMENUSIZE,
    SM_CYMENUSIZE,
    SM_ARRANGE,
    SM_CXMINIMIZED,
    SM_CYMINIMIZED,
    SM_CXMAXTRACK,
    SM_CYMAXTRACK,
    SM_CXMAXIMIZED,
    SM_CYMAXIMIZED,
    SM_NETWORK,       // = 63
    SM_CLEANBOOT         = 67,
    SM_CXDRAG,
    SM_CYDRAG,
    SM_SHOWSOUNDS,
    SM_CXMENUCHECK,
    SM_CYMENUCHECK,
    SM_SLOWMACHINE,
    SM_MIDEASTENABLED,
    SM_MOUSEWHEELPRESENT,
    SM_XVIRTUALSCREEN,
    SM_YVIRTUALSCREEN,
    SM_CXVIRTUALSCREEN,
    SM_CYVIRTUALSCREEN,
    SM_CMONITORS,
    SM_SAMEDISPLAYFORMAT,
    SM_IMMENABLED,
    SM_CXFOCUSBORDER,
    SM_CYFOCUSBORDER, // = 84
    SM_TABLETPC          = 86,
    SM_MEDIACENTER,
    SM_STARTER,       // = 88
    SM_CMETRICS          = 88,
    SM_SERVERR2,
    SM_REMOTESESSION     = 0x1000,
}
static if (_WIN32_WINNT >= 0x501) {
    enum {  // These are only for WinXP and later
        SM_SHUTTINGDOWN  = 0x2000,
        SM_REMOTECONTROL = 0x2001
    }
}

enum ARW_BOTTOMLEFT = 0;
enum ARW_BOTTOMRIGHT = 1;
enum ARW_HIDE = 8;
enum ARW_TOPLEFT = 2;
enum ARW_TOPRIGHT = 3;
enum ARW_DOWN = 4;
enum ARW_LEFT = 0;
enum ARW_RIGHT = 0;
enum ARW_UP = 4;

enum UOI_FLAGS = 1;
enum UOI_NAME = 2;
enum UOI_TYPE = 3;
enum UOI_USER_SID = 4;

// For the fuLoad parameter of LoadImage()
enum : UINT {
    LR_DEFAULTCOLOR     = 0,
    LR_MONOCHROME       = 0x0001,
    LR_COLOR            = 0x0002,
    LR_COPYRETURNORG    = 0x0004,
    LR_COPYDELETEORG    = 0x0008,
    LR_LOADFROMFILE     = 0x0010,
    LR_LOADTRANSPARENT  = 0x0020,
    LR_DEFAULTSIZE      = 0x0040,
    LR_VGACOLOR         = 0x0080,
    LR_LOADREALSIZE     = 0x0080,
    LR_LOADMAP3DCOLORS  = 0x1000,
    LR_CREATEDIBSECTION = 0x2000,
    LR_COPYFROMRESOURCE = 0x4000,
    LR_SHARED           = 0x8000
}

enum {
    KEYEVENTF_EXTENDEDKEY = 1,
    KEYEVENTF_KEYUP       = 2,
    KEYEVENTF_UNICODE     = 4,
    KEYEVENTF_SCANCODE    = 8
}

enum OBM_BTNCORNERS = 32758;
enum OBM_BTSIZE = 32761;
enum OBM_CHECK = 32760;
enum OBM_CHECKBOXES = 32759;
enum OBM_CLOSE = 32754;
enum OBM_COMBO = 32738;
enum OBM_DNARROW = 32752;
enum OBM_DNARROWD = 32742;
enum OBM_DNARROWI = 32736;
enum OBM_LFARROW = 32750;
enum OBM_LFARROWI = 32734;
enum OBM_LFARROWD = 32740;
enum OBM_MNARROW = 32739;
enum OBM_OLD_CLOSE = 32767;
enum OBM_OLD_DNARROW = 32764;
enum OBM_OLD_LFARROW = 32762;
enum OBM_OLD_REDUCE = 32757;
enum OBM_OLD_RESTORE = 32755;
enum OBM_OLD_RGARROW = 32763;
enum OBM_OLD_UPARROW = 32765;
enum OBM_OLD_ZOOM = 32756;
enum OBM_REDUCE = 32749;
enum OBM_REDUCED = 32746;
enum OBM_RESTORE = 32747;
enum OBM_RESTORED = 32744;
enum OBM_RGARROW = 32751;
enum OBM_RGARROWD = 32741;
enum OBM_RGARROWI = 32735;
enum OBM_SIZE = 32766;
enum OBM_UPARROW = 32753;
enum OBM_UPARROWD = 32743;
enum OBM_UPARROWI = 32737;
enum OBM_ZOOM = 32748;
enum OBM_ZOOMD = 32745;

enum OCR_NORMAL = 32512;
enum OCR_IBEAM = 32513;
enum OCR_WAIT = 32514;
enum OCR_CROSS = 32515;
enum OCR_UP = 32516;
enum OCR_SIZE = 32640;
enum OCR_ICON = 32641;
enum OCR_SIZENWSE = 32642;
enum OCR_SIZENESW = 32643;
enum OCR_SIZEWE = 32644;
enum OCR_SIZENS = 32645;
enum OCR_SIZEALL = 32646;
enum OCR_NO = 32648;
enum OCR_APPSTARTING = 32650;

enum OIC_SAMPLE = 32512;
enum OIC_HAND = 32513;
enum OIC_QUES = 32514;
enum OIC_BANG = 32515;
enum OIC_NOTE = 32516;
enum OIC_WINLOGO = 32517;
enum OIC_WARNING = OIC_BANG;
enum OIC_ERROR = OIC_HAND;
enum OIC_INFORMATION = OIC_NOTE;

enum HELPINFO_MENUITEM = 2;
enum HELPINFO_WINDOW = 1;

static if (_WIN32_WINNT >= 0x501) {
    enum {
        WTS_CONSOLE_CONNECT = 1,
        WTS_CONSOLE_DISCONNECT,
        WTS_REMOTE_CONNECT,
        WTS_REMOTE_DISCONNECT,
        WTS_SESSION_LOGON,
        WTS_SESSION_LOGOFF,
        WTS_SESSION_LOCK,
        WTS_SESSION_UNLOCK,
        WTS_SESSION_REMOTE_CONTROL // = 9
    }
}

enum MSGF_DIALOGBOX = 0;
enum MSGF_MESSAGEBOX = 1;
enum MSGF_MENU = 2;
enum MSGF_MOVE = 3;
enum MSGF_SIZE = 4;
enum MSGF_SCROLLBAR = 5;
enum MSGF_NEXTWINDOW = 6;
enum MSGF_MAINLOOP = 8;
enum MSGF_USER = 4096;

enum {
    MOUSEEVENTF_MOVE       = 0x0001,
    MOUSEEVENTF_LEFTDOWN   = 0x0002,
    MOUSEEVENTF_LEFTUP     = 0x0004,
    MOUSEEVENTF_RIGHTDOWN  = 0x0008,
    MOUSEEVENTF_RIGHTUP    = 0x0010,
    MOUSEEVENTF_MIDDLEDOWN = 0x0020,
    MOUSEEVENTF_MIDDLEUP   = 0x0040,
    MOUSEEVENTF_XDOWN      = 0x0080,
    MOUSEEVENTF_XUP        = 0x0100,
    MOUSEEVENTF_WHEEL      = 0x0800,
    MOUSEEVENTF_ABSOLUTE   = 0x8000
}

enum PM_NOREMOVE = 0;
enum PM_REMOVE = 1;
enum PM_NOYIELD = 2;

enum : HWND {
    HWND_BROADCAST = cast(HWND) 0xFFFF,
    HWND_MESSAGE   = cast(HWND)     -3,
    HWND_NOTOPMOST = cast(HWND)     -2,
    HWND_TOPMOST   = cast(HWND)     -1,
    HWND_TOP       = cast(HWND)      0,
    HWND_DESKTOP   = cast(HWND)      0,
    HWND_BOTTOM    = cast(HWND)      1
}

enum RDW_INVALIDATE      = 1;
enum RDW_INTERNALPAINT   = 2;
enum RDW_ERASE           = 4;
enum RDW_VALIDATE        = 8;
enum RDW_NOINTERNALPAINT = 16;
enum RDW_NOERASE         = 32;
enum RDW_NOCHILDREN      = 64;
enum RDW_ALLCHILDREN     = 128;
enum RDW_UPDATENOW       = 256;
enum RDW_ERASENOW        = 512;
enum RDW_FRAME           = 1024;
enum RDW_NOFRAME         = 2048;

enum {
    SMTO_NORMAL             = 0,
    SMTO_BLOCK              = 1,
    SMTO_ABORTIFHUNG        = 2,
    SMTO_NOTIMEOUTIFNOTHUNG = 8
}

enum SIF_ALL = 23;
enum SIF_PAGE = 2;
enum SIF_POS = 4;
enum SIF_RANGE = 1;
enum SIF_DISABLENOSCROLL = 8;
enum SIF_TRACKPOS = 16;

enum SWP_DRAWFRAME = 32;
enum SWP_FRAMECHANGED = 32;
enum SWP_HIDEWINDOW = 128;
enum SWP_NOACTIVATE = 16;
enum SWP_NOCOPYBITS = 256;
enum SWP_NOMOVE = 2;
enum SWP_NOSIZE = 1;
enum SWP_NOREDRAW = 8;
enum SWP_NOZORDER = 4;
enum SWP_SHOWWINDOW = 64;
enum SWP_NOOWNERZORDER = 512;
enum SWP_NOREPOSITION = 512;
enum SWP_NOSENDCHANGING = 1024;
enum SWP_DEFERERASE = 8192;
enum SWP_ASYNCWINDOWPOS = 16384;

enum { // passed variously as int or WPARAM
    HSHELL_WINDOWCREATED    =     1,
    HSHELL_WINDOWDESTROYED,
    HSHELL_ACTIVATESHELLWINDOW,
    HSHELL_WINDOWACTIVATED,
    HSHELL_GETMINRECT,
    HSHELL_REDRAW,
    HSHELL_TASKMAN,
    HSHELL_LANGUAGE,     // =     8
    HSHELL_ENDTASK          =    10,
    HSHELL_ACCESSIBILITYSTATE,
    HSHELL_APPCOMMAND,   // =    12
    HSHELL_RUDEAPPACTIVATED = 32772,
    HSHELL_FLASH            = 32774
}

static if (_WIN32_WINNT >= 0x501) {
    enum {
        HSHELL_WINDOWREPLACED = 13,
        HSHELL_WINDOWREPLACING
    }
}

enum {
    SPI_GETBEEP                   = 0x0001,
    SPI_SETBEEP                   = 0x0002,
    SPI_GETMOUSE                  = 0x0003,
    SPI_SETMOUSE                  = 0x0004,
    SPI_GETBORDER                 = 0x0005,
    SPI_SETBORDER                 = 0x0006,
    SPI_GETKEYBOARDSPEED          = 0x000A,
    SPI_SETKEYBOARDSPEED          = 0x000B,
    SPI_LANGDRIVER                = 0x000C,
    SPI_ICONHORIZONTALSPACING     = 0x000D,
    SPI_GETSCREENSAVETIMEOUT      = 0x000E,
    SPI_SETSCREENSAVETIMEOUT      = 0x000F,
    SPI_GETSCREENSAVEACTIVE       = 0x0010,
    SPI_SETSCREENSAVEACTIVE       = 0x0011,
    SPI_GETGRIDGRANULARITY        = 0x0012,
    SPI_SETGRIDGRANULARITY        = 0x0013,
    SPI_SETDESKWALLPAPER          = 0x0014,
    SPI_SETDESKPATTERN            = 0x0015,
    SPI_GETKEYBOARDDELAY          = 0x0016,
    SPI_SETKEYBOARDDELAY          = 0x0017,
    SPI_ICONVERTICALSPACING       = 0x0018,
    SPI_GETICONTITLEWRAP          = 0x0019,
    SPI_SETICONTITLEWRAP          = 0x001A,
    SPI_GETMENUDROPALIGNMENT      = 0x001B,
    SPI_SETMENUDROPALIGNMENT      = 0x001C,
    SPI_SETDOUBLECLKWIDTH         = 0x001D,
    SPI_SETDOUBLECLKHEIGHT        = 0x001E,
    SPI_GETICONTITLELOGFONT       = 0x001F,
    SPI_SETDOUBLECLICKTIME        = 0x0020,
    SPI_SETMOUSEBUTTONSWAP        = 0x0021,
    SPI_SETICONTITLELOGFONT       = 0x0022,
    SPI_GETFASTTASKSWITCH         = 0x0023,
    SPI_SETFASTTASKSWITCH         = 0x0024,
    SPI_SETDRAGFULLWINDOWS        = 0x0025,
    SPI_GETDRAGFULLWINDOWS        = 0x0026,
    SPI_GETNONCLIENTMETRICS       = 0x0029,
    SPI_SETNONCLIENTMETRICS       = 0x002A,
    SPI_GETMINIMIZEDMETRICS       = 0x002B,
    SPI_SETMINIMIZEDMETRICS       = 0x002C,
    SPI_GETICONMETRICS            = 0x002D,
    SPI_SETICONMETRICS            = 0x002E,
    SPI_SETWORKAREA               = 0x002F,
    SPI_GETWORKAREA               = 0x0030,
    SPI_SETPENWINDOWS             = 0x0031,
    SPI_GETFILTERKEYS             = 0x0032,
    SPI_SETFILTERKEYS             = 0x0033,
    SPI_GETTOGGLEKEYS             = 0x0034,
    SPI_SETTOGGLEKEYS             = 0x0035,
    SPI_GETMOUSEKEYS              = 0x0036,
    SPI_SETMOUSEKEYS              = 0x0037,
    SPI_GETSHOWSOUNDS             = 0x0038,
    SPI_SETSHOWSOUNDS             = 0x0039,
    SPI_GETSTICKYKEYS             = 0x003A,
    SPI_SETSTICKYKEYS             = 0x003B,
    SPI_GETACCESSTIMEOUT          = 0x003C,
    SPI_SETACCESSTIMEOUT          = 0x003D,
    SPI_GETSERIALKEYS             = 0x003E,
    SPI_SETSERIALKEYS             = 0x003F,
    SPI_GETSOUNDSENTRY            = 0x0040,
    SPI_SETSOUNDSENTRY            = 0x0041,
    SPI_GETHIGHCONTRAST           = 0x0042,
    SPI_SETHIGHCONTRAST           = 0x0043,
    SPI_GETKEYBOARDPREF           = 0x0044,
    SPI_SETKEYBOARDPREF           = 0x0045,
    SPI_GETSCREENREADER           = 0x0046,
    SPI_SETSCREENREADER           = 0x0047,
    SPI_GETANIMATION              = 0x0048,
    SPI_SETANIMATION              = 0x0049,
    SPI_GETFONTSMOOTHING          = 0x004A,
    SPI_SETFONTSMOOTHING          = 0x004B,
    SPI_SETDRAGWIDTH              = 0x004C,
    SPI_SETDRAGHEIGHT             = 0x004D,
    SPI_SETHANDHELD               = 0x004E,
    SPI_GETLOWPOWERTIMEOUT        = 0x004F,
    SPI_GETPOWEROFFTIMEOUT        = 0x0050,
    SPI_SETLOWPOWERTIMEOUT        = 0x0051,
    SPI_SETPOWEROFFTIMEOUT        = 0x0052,
    SPI_GETLOWPOWERACTIVE         = 0x0053,
    SPI_GETPOWEROFFACTIVE         = 0x0054,
    SPI_SETLOWPOWERACTIVE         = 0x0055,
    SPI_SETPOWEROFFACTIVE         = 0x0056,
    SPI_SETCURSORS                = 0x0057,
    SPI_SETICONS                  = 0x0058,
    SPI_GETDEFAULTINPUTLANG       = 0x0059,
    SPI_SETDEFAULTINPUTLANG       = 0x005A,
    SPI_SETLANGTOGGLE             = 0x005B,
    SPI_GETWINDOWSEXTENSION       = 0x005C,
    SPI_SETMOUSETRAILS            = 0x005D,
    SPI_GETMOUSETRAILS            = 0x005E,
    SPI_GETSNAPTODEFBUTTON        = 0x005F,
    SPI_SETSNAPTODEFBUTTON        = 0x0060,
    //SPI_SCREENSAVERRUNNING        = 0x0061, // mistake in older MinGW?
    SPI_SETSCREENSAVERRUNNING     = 0x0061,
    SPI_GETMOUSEHOVERWIDTH        = 0x0062,
    SPI_SETMOUSEHOVERWIDTH        = 0x0063,
    SPI_GETMOUSEHOVERHEIGHT       = 0x0064,
    SPI_SETMOUSEHOVERHEIGHT       = 0x0065,
    SPI_GETMOUSEHOVERTIME         = 0x0066,
    SPI_SETMOUSEHOVERTIME         = 0x0067,
    SPI_GETWHEELSCROLLLINES       = 0x0068,
    SPI_SETWHEELSCROLLLINES       = 0x0069,
    SPI_GETMENUSHOWDELAY          = 0x006A,
    SPI_SETMENUSHOWDELAY          = 0x006B,
    SPI_GETSHOWIMEUI              = 0x006E,
    SPI_SETSHOWIMEUI              = 0x006F,
    SPI_GETMOUSESPEED             = 0x0070,
    SPI_SETMOUSESPEED             = 0x0071,
    SPI_GETSCREENSAVERRUNNING     = 0x0072,
    SPI_GETDESKWALLPAPER          = 0x0073,
    SPI_GETACTIVEWINDOWTRACKING   = 0x1000,
    SPI_SETACTIVEWINDOWTRACKING   = 0x1001,
    SPI_GETMENUANIMATION          = 0x1002,
    SPI_SETMENUANIMATION          = 0x1003,
    SPI_GETCOMBOBOXANIMATION      = 0x1004,
    SPI_SETCOMBOBOXANIMATION      = 0x1005,
    SPI_GETLISTBOXSMOOTHSCROLLING = 0x1006,
    SPI_SETLISTBOXSMOOTHSCROLLING = 0x1007,
    SPI_GETGRADIENTCAPTIONS       = 0x1008,
    SPI_SETGRADIENTCAPTIONS       = 0x1009,
    SPI_GETKEYBOARDCUES           = 0x100A,
    SPI_GETMENUUNDERLINES         = SPI_GETKEYBOARDCUES,
    SPI_SETKEYBOARDCUES           = 0x100B,
    SPI_SETMENUUNDERLINES         = SPI_SETKEYBOARDCUES,
    SPI_GETACTIVEWNDTRKZORDER     = 0x100C,
    SPI_SETACTIVEWNDTRKZORDER     = 0x100D,
    SPI_GETHOTTRACKING            = 0x100E,
    SPI_SETHOTTRACKING            = 0x100F,
    SPI_GETMENUFADE               = 0x1012,
    SPI_SETMENUFADE               = 0x1013,
    SPI_GETSELECTIONFADE          = 0x1014,
    SPI_SETSELECTIONFADE          = 0x1015,
    SPI_GETTOOLTIPANIMATION       = 0x1016,
    SPI_SETTOOLTIPANIMATION       = 0x1017,
    SPI_GETTOOLTIPFADE            = 0x1018,
    SPI_SETTOOLTIPFADE            = 0x1019,
    SPI_GETCURSORSHADOW           = 0x101A,
    SPI_SETCURSORSHADOW           = 0x101B,
    SPI_GETBLOCKSENDINPUTRESETS   = 0x1026,
    SPI_SETBLOCKSENDINPUTRESETS   = 0x1027,
    SPI_GETUIEFFECTS              = 0x103E,
    SPI_SETUIEFFECTS              = 0x103F,
    SPI_GETFOREGROUNDLOCKTIMEOUT  = 0x2000,
    SPI_SETFOREGROUNDLOCKTIMEOUT  = 0x2001,
    SPI_GETACTIVEWNDTRKTIMEOUT    = 0x2002,
    SPI_SETACTIVEWNDTRKTIMEOUT    = 0x2003,
    SPI_GETFOREGROUNDFLASHCOUNT   = 0x2004,
    SPI_SETFOREGROUNDFLASHCOUNT   = 0x2005,
    SPI_GETCARETWIDTH             = 0x2006,
    SPI_SETCARETWIDTH             = 0x2007
}

enum {
    SPIF_UPDATEINIFILE    = 1,
    SPIF_SENDWININICHANGE = 2,
    SPIF_SENDCHANGE       = SPIF_SENDWININICHANGE
}

// [Redefined] ATF_ONOFFFEEDBACK = 2
// [Redefined] ATF_TIMEOUTON = 1
enum WM_APP = 32768;
enum WM_ACTIVATE = 6;
enum WM_ACTIVATEAPP = 28;
enum WM_AFXFIRST = 864;
enum WM_AFXLAST = 895;
enum WM_ASKCBFORMATNAME = 780;
enum WM_CANCELJOURNAL = 75;
enum WM_CANCELMODE = 31;
enum WM_CAPTURECHANGED = 533;
enum WM_CHANGECBCHAIN = 781;
enum WM_CHAR = 258;
enum WM_CHARTOITEM = 47;
enum WM_CHILDACTIVATE = 34;
enum WM_CLEAR = 771;
enum WM_CLOSE = 16;
enum WM_COMMAND = 273;
enum WM_COMMNOTIFY = 68; // obsolete
enum WM_COMPACTING = 65;
enum WM_COMPAREITEM = 57;
enum WM_CONTEXTMENU = 123;
enum WM_COPY = 769;
enum WM_COPYDATA = 74;
enum WM_CREATE = 1;
enum WM_CTLCOLORBTN = 309;
enum WM_CTLCOLORDLG = 310;
enum WM_CTLCOLOREDIT = 307;
enum WM_CTLCOLORLISTBOX = 308;
enum WM_CTLCOLORMSGBOX = 306;
enum WM_CTLCOLORSCROLLBAR = 311;
enum WM_CTLCOLORSTATIC = 312;
enum WM_CUT = 768;
enum WM_DEADCHAR = 259;
enum WM_DELETEITEM = 45;
enum WM_DESTROY = 2;
enum WM_DESTROYCLIPBOARD = 775;
enum WM_DEVICECHANGE = 537;
enum WM_DEVMODECHANGE = 27;
enum WM_DISPLAYCHANGE = 126;
enum WM_DRAWCLIPBOARD = 776;
enum WM_DRAWITEM = 43;
enum WM_DROPFILES = 563;
enum WM_ENABLE = 10;
enum WM_ENDSESSION = 22;
enum WM_ENTERIDLE = 289;
enum WM_ENTERMENULOOP = 529;
enum WM_ENTERSIZEMOVE = 561;
enum WM_ERASEBKGND = 20;
enum WM_EXITMENULOOP = 530;
enum WM_EXITSIZEMOVE = 562;
enum WM_FONTCHANGE = 29;
enum WM_GETDLGCODE = 135;
enum WM_GETFONT = 49;
enum WM_GETHOTKEY = 51;
enum WM_GETICON = 127;
enum WM_GETMINMAXINFO = 36;
enum WM_GETTEXT = 13;
enum WM_GETTEXTLENGTH = 14;
enum WM_HANDHELDFIRST = 856;
enum WM_HANDHELDLAST = 863;
enum WM_HELP = 83;
enum WM_HOTKEY = 786;
enum WM_HSCROLL = 276;
enum WM_HSCROLLCLIPBOARD = 782;
enum WM_ICONERASEBKGND = 39;
enum WM_INITDIALOG = 272;
enum WM_INITMENU = 278;
enum WM_INITMENUPOPUP = 279;
enum WM_INPUTLANGCHANGE = 81;
enum WM_INPUTLANGCHANGEREQUEST = 80;
enum WM_KEYDOWN = 256;
enum WM_KEYUP = 257;
enum WM_KILLFOCUS = 8;
enum WM_MDIACTIVATE = 546;
enum WM_MDICASCADE = 551;
enum WM_MDICREATE = 544;
enum WM_MDIDESTROY = 545;
enum WM_MDIGETACTIVE = 553;
enum WM_MDIICONARRANGE = 552;
enum WM_MDIMAXIMIZE = 549;
enum WM_MDINEXT = 548;
enum WM_MDIREFRESHMENU = 564;
enum WM_MDIRESTORE = 547;
enum WM_MDISETMENU = 560;
enum WM_MDITILE = 550;
enum WM_MEASUREITEM = 44;
enum WM_UNINITMENUPOPUP = 0x0125;
enum WM_MENURBUTTONUP = 290;
enum WM_MENUCOMMAND = 0x0126;
enum WM_MENUGETOBJECT = 0x0124;
enum WM_MENUDRAG = 0x0123;

enum WM_CHANGEUISTATE = 0x0127;
enum WM_UPDATEUISTATE = 0x0128;
enum WM_QUERYUISTATE  = 0x0129;

// LOWORD(wParam) values in WM_*UISTATE*
enum {
    UIS_SET          =  1,
    UIS_CLEAR        =  2,
    UIS_INITIALIZE   =  3
}

// HIWORD(wParam) values in WM_*UISTATE*
enum {
    UISF_HIDEFOCUS   =  0x1,
    UISF_HIDEACCEL   =  0x2
}


static if (_WIN32_WINNT >= 0x501) {

    // HIWORD(wParam) values in WM_*UISTATE*
    enum {
        UISF_ACTIVE      =  0x4
    }

}

enum WM_MENUCHAR = 288;
enum WM_MENUSELECT = 287;
enum WM_MOVE = 3;
enum WM_MOVING = 534;
enum WM_NCACTIVATE = 134;
enum WM_NCCALCSIZE = 131;
enum WM_NCCREATE = 129;
enum WM_NCDESTROY = 130;
enum WM_NCHITTEST = 132;
enum WM_NCLBUTTONDBLCLK = 163;
enum WM_NCLBUTTONDOWN = 161;
enum WM_NCLBUTTONUP = 162;
enum WM_NCMBUTTONDBLCLK = 169;
enum WM_NCMBUTTONDOWN = 167;
enum WM_NCMBUTTONUP = 168;
enum WM_NCXBUTTONDOWN = 171;
enum WM_NCXBUTTONUP = 172;
enum WM_NCXBUTTONDBLCLK = 173;
enum WM_NCMOUSEHOVER = 0x02A0;
enum WM_NCMOUSELEAVE = 0x02A2;
enum WM_NCMOUSEMOVE = 160;
enum WM_NCPAINT = 133;
enum WM_NCRBUTTONDBLCLK = 166;
enum WM_NCRBUTTONDOWN = 164;
enum WM_NCRBUTTONUP = 165;
enum WM_NEXTDLGCTL = 40;
enum WM_NEXTMENU = 531;
enum WM_NOTIFY = 78;
enum WM_NOTIFYFORMAT = 85;
enum WM_NULL = 0;
enum WM_PAINT = 15;
enum WM_PAINTCLIPBOARD = 777;
enum WM_PAINTICON = 38;
enum WM_PALETTECHANGED = 785;
enum WM_PALETTEISCHANGING = 784;
enum WM_PARENTNOTIFY = 528;
enum WM_PASTE = 770;
enum WM_PENWINFIRST = 896;
enum WM_PENWINLAST = 911;
enum WM_POWER = 72;
enum WM_POWERBROADCAST = 536;
enum WM_PRINT = 791;
enum WM_PRINTCLIENT = 792;
enum WM_APPCOMMAND = 0x0319;
enum WM_QUERYDRAGICON = 55;
enum WM_QUERYENDSESSION = 17;
enum WM_QUERYNEWPALETTE = 783;
enum WM_QUERYOPEN = 19;
enum WM_QUEUESYNC = 35;
enum WM_QUIT = 18;
enum WM_RENDERALLFORMATS = 774;
enum WM_RENDERFORMAT = 773;
enum WM_SETCURSOR = 32;
enum WM_SETFOCUS = 7;
enum WM_SETFONT = 48;
enum WM_SETHOTKEY = 50;
enum WM_SETICON = 128;
enum WM_SETREDRAW = 11;
enum WM_SETTEXT = 12;
enum WM_SETTINGCHANGE = 26;
enum WM_SHOWWINDOW = 24;
enum WM_SIZE = 5;
enum WM_SIZECLIPBOARD = 779;
enum WM_SIZING = 532;
enum WM_SPOOLERSTATUS = 42;
enum WM_STYLECHANGED = 125;
enum WM_STYLECHANGING = 124;
enum WM_SYSCHAR = 262;
enum WM_SYSCOLORCHANGE = 21;
enum WM_SYSCOMMAND = 274;
enum WM_SYSDEADCHAR = 263;
enum WM_SYSKEYDOWN = 260;
enum WM_SYSKEYUP = 261;
static if (_WIN32_WINNT >= 0x501) {
    enum WM_TABLET_FIRST = 704;
    enum WM_TABLET_LAST = 735;
}
enum WM_TCARD = 82;
enum WM_THEMECHANGED = 794;
enum WM_TIMECHANGE = 30;
enum WM_TIMER = 275;
enum WM_UNDO = 772;
enum WM_USER = 1024;
enum WM_USERCHANGED = 84;
enum WM_VKEYTOITEM = 46;
enum WM_VSCROLL = 277;
enum WM_VSCROLLCLIPBOARD = 778;
enum WM_WINDOWPOSCHANGED = 71;
enum WM_WINDOWPOSCHANGING = 70;
enum WM_WININICHANGE = 26;
static if (_WIN32_WINNT >= 0x501) {
enum WM_WTSSESSION_CHANGE = 689;
}
enum WM_INPUT = 255;
enum WM_KEYFIRST = 256;
static if (_WIN32_WINNT >= 0x501) {
enum WM_UNICHAR = 265;
enum WM_KEYLAST = 265;
enum UNICODE_NOCHAR = 0xFFFF;
} else {
enum WM_KEYLAST = 264;
}
enum WM_SYNCPAINT = 136;
enum WM_MOUSEACTIVATE = 33;
enum WM_MOUSEMOVE = 512;
enum WM_LBUTTONDOWN = 513;
enum WM_LBUTTONUP = 514;
enum WM_LBUTTONDBLCLK = 515;
enum WM_RBUTTONDOWN = 516;
enum WM_RBUTTONUP = 517;
enum WM_RBUTTONDBLCLK = 518;
enum WM_MBUTTONDOWN = 519;
enum WM_MBUTTONUP = 520;
enum WM_MBUTTONDBLCLK = 521;
enum WM_MOUSEWHEEL = 522;
enum WM_MOUSEFIRST = 512;
static if (_WIN32_WINNT >= 0x501) {
    enum WM_XBUTTONDOWN = 523;
    enum WM_XBUTTONUP = 524;
    enum WM_XBUTTONDBLCLK = 525;
}
static if (_WIN32_WINNT >= 0x600) { // FIXME: where did this come from? what version is it?
    enum WM_MOUSEHWHEEL = 526;
}

static if (_WIN32_WINNT >= 0x600) {
    enum WM_MOUSELAST = WM_MOUSEHWHEEL;
} else static if (_WIN32_WINNT >= 0x501) {
    enum WM_MOUSELAST = WM_XBUTTONDBLCLK;
} else {
    enum WM_MOUSELAST = WM_MOUSEWHEEL;
}

enum WM_MOUSEHOVER = 0x2A1;
enum WM_MOUSELEAVE = 0x2A3;

enum WHEEL_DELTA = 120;

SHORT GET_WHEEL_DELTA_WPARAM()(WPARAM wparam) {
    return cast(SHORT) HIWORD(wparam);
}

enum WHEEL_PAGESCROLL = uint.max;

enum BM_CLICK = 245;
enum BM_GETCHECK = 240;
enum BM_GETIMAGE = 246;
enum BM_GETSTATE = 242;
enum BM_SETCHECK = 241;
enum BM_SETIMAGE = 247;
static if (_WIN32_WINNT >= 0x600) {
    enum BM_SETDONTCLICK = 248;
}
enum BM_SETSTATE = 243;
enum BM_SETSTYLE = 244;
enum BN_CLICKED = 0;
enum BN_DBLCLK = 5;
enum BN_DISABLE = 4;
enum BN_DOUBLECLICKED = 5;
enum BN_HILITE = 2;
enum BN_KILLFOCUS = 7;
enum BN_PAINT = 1;
enum BN_PUSHED = 2;
enum BN_SETFOCUS = 6;
enum BN_UNHILITE = 3;
enum BN_UNPUSHED = 3;
enum CB_ADDSTRING = 323;
enum CB_DELETESTRING = 324;
enum CB_DIR = 325;
enum CB_FINDSTRING = 332;
enum CB_FINDSTRINGEXACT = 344;
enum CB_GETCOUNT = 326;
enum CB_GETCURSEL = 327;
enum CB_GETDROPPEDCONTROLRECT = 338;
enum CB_GETDROPPEDSTATE = 343;
enum CB_GETDROPPEDWIDTH = 351;
enum CB_GETEDITSEL = 320;
enum CB_GETEXTENDEDUI = 342;
enum CB_GETHORIZONTALEXTENT = 349;
enum CB_GETITEMDATA = 336;
enum CB_GETITEMHEIGHT = 340;
enum CB_GETLBTEXT = 328;
enum CB_GETLBTEXTLEN = 329;
enum CB_GETLOCALE = 346;
enum CB_GETTOPINDEX = 347;
enum CB_INITSTORAGE = 353;
enum CB_INSERTSTRING = 330;
enum CB_LIMITTEXT = 321;
enum CB_RESETCONTENT = 331;
enum CB_SELECTSTRING = 333;
enum CB_SETCURSEL = 334;
enum CB_SETDROPPEDWIDTH = 352;
enum CB_SETEDITSEL = 322;
enum CB_SETEXTENDEDUI = 341;
enum CB_SETHORIZONTALEXTENT = 350;
enum CB_SETITEMDATA = 337;
enum CB_SETITEMHEIGHT = 339;
enum CB_SETLOCALE = 345;
enum CB_SETTOPINDEX = 348;
enum CB_SHOWDROPDOWN = 335;

static if (_WIN32_WINNT >= 0x501) {
enum CB_GETCOMBOBOXINFO = 356;
}

enum CBN_CLOSEUP = 8;
enum CBN_DBLCLK = 2;
enum CBN_DROPDOWN = 7;
enum CBN_EDITCHANGE = 5;
enum CBN_EDITUPDATE = 6;
enum CBN_ERRSPACE = (-1);
enum CBN_KILLFOCUS = 4;
enum CBN_SELCHANGE = 1;
enum CBN_SELENDCANCEL = 10;
enum CBN_SELENDOK = 9;
enum CBN_SETFOCUS = 3;

enum EM_CANUNDO = 198;
enum EM_CHARFROMPOS = 215;
enum EM_EMPTYUNDOBUFFER = 205;
enum EM_FMTLINES = 200;
enum EM_GETFIRSTVISIBLELINE = 206;
enum EM_GETHANDLE = 189;
enum EM_GETLIMITTEXT = 213;
enum EM_GETLINE = 196;
enum EM_GETLINECOUNT = 186;
enum EM_GETMARGINS = 212;
enum EM_GETMODIFY = 184;
enum EM_GETPASSWORDCHAR = 210;
enum EM_GETRECT = 178;
enum EM_GETSEL = 176;
enum EM_GETTHUMB = 190;
enum EM_GETWORDBREAKPROC = 209;
enum EM_LIMITTEXT = 197;
enum EM_LINEFROMCHAR = 201;
enum EM_LINEINDEX = 187;
enum EM_LINELENGTH = 193;
enum EM_LINESCROLL = 182;
enum EM_POSFROMCHAR = 214;
enum EM_REPLACESEL = 194;
enum EM_SCROLL = 181;
enum EM_SCROLLCARET = 183;
enum EM_SETHANDLE = 188;
enum EM_SETLIMITTEXT = 197;
enum EM_SETMARGINS = 211;
enum EM_SETMODIFY = 185;
enum EM_SETPASSWORDCHAR = 204;
enum EM_SETREADONLY = 207;
enum EM_SETRECT = 179;
enum EM_SETRECTNP = 180;
enum EM_SETSEL = 177;
enum EM_SETTABSTOPS = 203;
enum EM_SETWORDBREAKPROC = 208;
enum EM_UNDO = 199;

enum EM_SETIMESTATUS = 216;
enum EM_GETIMESTATUS = 217;

enum EN_CHANGE = 768;
enum EN_ERRSPACE = 1280;
enum EN_HSCROLL = 1537;
enum EN_KILLFOCUS = 512;
enum EN_MAXTEXT = 1281;
enum EN_SETFOCUS = 256;
enum EN_UPDATE = 1024;
enum EN_VSCROLL = 1538;

enum LB_ADDFILE = 406;
enum LB_ADDSTRING = 384;
enum LB_DELETESTRING = 386;
enum LB_DIR = 397;
enum LB_FINDSTRING = 399;
enum LB_FINDSTRINGEXACT = 418;
enum LB_GETANCHORINDEX = 413;
enum LB_GETCARETINDEX = 415;
enum LB_GETCOUNT = 395;
enum LB_GETCURSEL = 392;
enum LB_GETHORIZONTALEXTENT = 403;
enum LB_GETITEMDATA = 409;
enum LB_GETITEMHEIGHT = 417;
enum LB_GETITEMRECT = 408;
enum LB_GETLOCALE = 422;
enum LB_GETSEL = 391;
enum LB_GETSELCOUNT = 400;
enum LB_GETSELITEMS = 401;
enum LB_GETTEXT = 393;
enum LB_GETTEXTLEN = 394;
enum LB_GETTOPINDEX = 398;
enum LB_INITSTORAGE = 424;
enum LB_INSERTSTRING = 385;
enum LB_ITEMFROMPOINT = 425;
enum LB_RESETCONTENT = 388;
enum LB_SELECTSTRING = 396;
enum LB_SELITEMRANGE = 411;
enum LB_SELITEMRANGEEX = 387;
enum LB_SETANCHORINDEX = 412;
enum LB_SETCARETINDEX = 414;
enum LB_SETCOLUMNWIDTH = 405;
enum LB_SETCOUNT = 423;
enum LB_SETCURSEL = 390;
enum LB_SETHORIZONTALEXTENT = 404;
enum LB_SETITEMDATA = 410;
enum LB_SETITEMHEIGHT = 416;
enum LB_SETLOCALE = 421;
enum LB_SETSEL = 389;
enum LB_SETTABSTOPS = 402;
enum LB_SETTOPINDEX = 407;
static if (_WIN32_WINNT >= 0x501) {
enum LB_GETLISTBOXINFO = 434;
}

enum LBN_DBLCLK = 2;
enum LBN_ERRSPACE = -2;
enum LBN_KILLFOCUS = 5;
enum LBN_SELCANCEL = 3;
enum LBN_SELCHANGE = 1;
enum LBN_SETFOCUS = 4;

enum SBM_ENABLE_ARROWS = 228;
enum SBM_GETPOS = 225;
enum SBM_GETRANGE = 227;
enum SBM_GETSCROLLINFO = 234;
enum SBM_SETPOS = 224;
enum SBM_SETRANGE = 226;
enum SBM_SETRANGEREDRAW = 230;
enum SBM_SETSCROLLINFO = 233;
static if (_WIN32_WINNT >= 0x501) {
enum SBM_GETSCROLLBARINFO = 235;
}

enum STM_GETICON = 369;
enum STM_GETIMAGE = 371;
enum STM_SETICON = 368;
enum STM_SETIMAGE = 370;
enum STN_CLICKED = 0;
enum STN_DBLCLK = 1;
enum STN_DISABLE = 3;
enum STN_ENABLE = 2;
enum STM_MSGMAX = 372;

enum DM_GETDEFID   = WM_USER;
enum DM_SETDEFID   = WM_USER+1;
enum DM_REPOSITION = WM_USER+2;

enum PSM_PAGEINFO  = WM_USER+100;
enum PSM_SHEETINFO = WM_USER+101;

enum PSI_SETACTIVE = 1;
enum PSI_KILLACTIVE = 2;
enum PSI_APPLY = 3;
enum PSI_RESET = 4;
enum PSI_HASHELP = 5;
enum PSI_HELP = 6;
enum PSI_CHANGED = 1;
enum PSI_GUISTART = 2;
enum PSI_REBOOT = 3;
enum PSI_GETSIBLINGS = 4;

enum DCX_WINDOW = 1;
enum DCX_CACHE = 2;
enum DCX_PARENTCLIP = 32;
enum DCX_CLIPSIBLINGS = 16;
enum DCX_CLIPCHILDREN = 8;
enum DCX_NORESETATTRS = 4;
enum DCX_INTERSECTUPDATE = 0x200;
enum DCX_LOCKWINDOWUPDATE = 0x400;
enum DCX_EXCLUDERGN = 64;
enum DCX_INTERSECTRGN = 128;
enum DCX_EXCLUDEUPDATE = 256;
enum DCX_VALIDATE = 0x200000;

enum GMDI_GOINTOPOPUPS = 2;
enum GMDI_USEDISABLED = 1;
enum FKF_AVAILABLE = 2;
enum FKF_CLICKON = 64;
enum FKF_FILTERKEYSON = 1;
enum FKF_HOTKEYACTIVE = 4;
enum FKF_HOTKEYSOUND = 16;
enum FKF_CONFIRMHOTKEY = 8;
enum FKF_INDICATOR = 32;
enum HCF_HIGHCONTRASTON = 1;
enum HCF_AVAILABLE = 2;
enum HCF_HOTKEYACTIVE = 4;
enum HCF_CONFIRMHOTKEY = 8;
enum HCF_HOTKEYSOUND = 16;
enum HCF_INDICATOR = 32;
enum HCF_HOTKEYAVAILABLE = 64;
enum MKF_AVAILABLE = 2;
enum MKF_CONFIRMHOTKEY = 8;
enum MKF_HOTKEYACTIVE = 4;
enum MKF_HOTKEYSOUND = 16;
enum MKF_INDICATOR = 32;
enum MKF_MOUSEKEYSON = 1;
enum MKF_MODIFIERS = 64;
enum MKF_REPLACENUMBERS = 128;
enum SERKF_ACTIVE = 8;  // May be obsolete. Not in recent MS docs.
enum SERKF_AVAILABLE = 2;
enum SERKF_INDICATOR = 4;
enum SERKF_SERIALKEYSON = 1;
enum SSF_AVAILABLE = 2;
enum SSF_SOUNDSENTRYON = 1;
enum SSTF_BORDER = 2;
enum SSTF_CHARS = 1;
enum SSTF_DISPLAY = 3;
enum SSTF_NONE = 0;
enum SSGF_DISPLAY = 3;
enum SSGF_NONE = 0;
enum SSWF_CUSTOM = 4;
enum SSWF_DISPLAY = 3;
enum SSWF_NONE = 0;
enum SSWF_TITLE = 1;
enum SSWF_WINDOW = 2;
enum SKF_AUDIBLEFEEDBACK = 64;
enum SKF_AVAILABLE = 2;
enum SKF_CONFIRMHOTKEY = 8;
enum SKF_HOTKEYACTIVE = 4;
enum SKF_HOTKEYSOUND = 16;
enum SKF_INDICATOR = 32;
enum SKF_STICKYKEYSON = 1;
enum SKF_TRISTATE = 128;
enum SKF_TWOKEYSOFF = 256;
enum TKF_AVAILABLE = 2;
enum TKF_CONFIRMHOTKEY = 8;
enum TKF_HOTKEYACTIVE = 4;
enum TKF_HOTKEYSOUND = 16;
enum TKF_TOGGLEKEYSON = 1;
enum MDITILE_SKIPDISABLED = 2;
enum MDITILE_HORIZONTAL = 1;
enum MDITILE_VERTICAL = 0;

enum {
    VK_LBUTTON = 0x01,
    VK_RBUTTON = 0x02,
    VK_CANCEL = 0x03,
    VK_MBUTTON = 0x04,
    VK_XBUTTON1 = 0x05,
    VK_XBUTTON2 = 0x06,
    VK_BACK = 0x08,
    VK_TAB = 0x09,
    VK_CLEAR = 0x0C,
    VK_RETURN = 0x0D,
    VK_SHIFT = 0x10,
    VK_CONTROL = 0x11,
    VK_MENU = 0x12,
    VK_PAUSE = 0x13,
    VK_CAPITAL = 0x14,
    VK_KANA = 0x15,
    VK_HANGEUL = 0x15,
    VK_HANGUL = 0x15,
    VK_JUNJA = 0x17,
    VK_FINAL = 0x18,
    VK_HANJA = 0x19,
    VK_KANJI = 0x19,
    VK_ESCAPE = 0x1B,
    VK_CONVERT = 0x1C,
    VK_NONCONVERT = 0x1D,
    VK_ACCEPT = 0x1E,
    VK_MODECHANGE = 0x1F,
    VK_SPACE = 0x20,
    VK_PRIOR = 0x21,
    VK_NEXT = 0x22,
    VK_END = 0x23,
    VK_HOME = 0x24,
    VK_LEFT = 0x25,
    VK_UP = 0x26,
    VK_RIGHT = 0x27,
    VK_DOWN = 0x28,
    VK_SELECT = 0x29,
    VK_PRINT = 0x2A,
    VK_EXECUTE = 0x2B,
    VK_SNAPSHOT = 0x2C,
    VK_INSERT = 0x2D,
    VK_DELETE = 0x2E,
    VK_HELP = 0x2F,
    VK_LWIN = 0x5B,
    VK_RWIN = 0x5C,
    VK_APPS = 0x5D,
    VK_SLEEP = 0x5F,
    VK_NUMPAD0 = 0x60,
    VK_NUMPAD1 = 0x61,
    VK_NUMPAD2 = 0x62,
    VK_NUMPAD3 = 0x63,
    VK_NUMPAD4 = 0x64,
    VK_NUMPAD5 = 0x65,
    VK_NUMPAD6 = 0x66,
    VK_NUMPAD7 = 0x67,
    VK_NUMPAD8 = 0x68,
    VK_NUMPAD9 = 0x69,
    VK_MULTIPLY = 0x6A,
    VK_ADD = 0x6B,
    VK_SEPARATOR = 0x6C,
    VK_SUBTRACT = 0x6D,
    VK_DECIMAL = 0x6E,
    VK_DIVIDE = 0x6F,
    VK_F1 = 0x70,
    VK_F2 = 0x71,
    VK_F3 = 0x72,
    VK_F4 = 0x73,
    VK_F5 = 0x74,
    VK_F6 = 0x75,
    VK_F7 = 0x76,
    VK_F8 = 0x77,
    VK_F9 = 0x78,
    VK_F10 = 0x79,
    VK_F11 = 0x7A,
    VK_F12 = 0x7B,
    VK_F13 = 0x7C,
    VK_F14 = 0x7D,
    VK_F15 = 0x7E,
    VK_F16 = 0x7F,
    VK_F17 = 0x80,
    VK_F18 = 0x81,
    VK_F19 = 0x82,
    VK_F20 = 0x83,
    VK_F21 = 0x84,
    VK_F22 = 0x85,
    VK_F23 = 0x86,
    VK_F24 = 0x87,
    VK_NUMLOCK = 0x90,
    VK_SCROLL = 0x91,
    VK_LSHIFT = 0xA0,
    VK_RSHIFT = 0xA1,
    VK_LCONTROL = 0xA2,
    VK_RCONTROL = 0xA3,
    VK_LMENU = 0xA4,
    VK_RMENU = 0xA5,
    VK_BROWSER_BACK = 0xA6,
    VK_BROWSER_FORWARD = 0xA7,
    VK_BROWSER_REFRESH = 0xA8,
    VK_BROWSER_STOP = 0xA9,
    VK_BROWSER_SEARCH = 0xAA,
    VK_BROWSER_FAVORITES = 0xAB,
    VK_BROWSER_HOME = 0xAC,
    VK_VOLUME_MUTE = 0xAD,
    VK_VOLUME_DOWN = 0xAE,
    VK_VOLUME_UP = 0xAF,
    VK_MEDIA_NEXT_TRACK = 0xB0,
    VK_MEDIA_PREV_TRACK = 0xB1,
    VK_MEDIA_STOP = 0xB2,
    VK_MEDIA_PLAY_PAUSE = 0xB3,
    VK_LAUNCH_MAIL = 0xB4,
    VK_LAUNCH_MEDIA_SELECT = 0xB5,
    VK_LAUNCH_APP1 = 0xB6,
    VK_LAUNCH_APP2 = 0xB7,
    VK_OEM_1 = 0xBA,
    VK_OEM_PLUS = 0xBB,
    VK_OEM_COMMA = 0xBC,
    VK_OEM_MINUS = 0xBD,
    VK_OEM_PERIOD = 0xBE,
    VK_OEM_2 = 0xBF,
    VK_OEM_3 = 0xC0,
    VK_OEM_4 = 0xDB,
    VK_OEM_5 = 0xDC,
    VK_OEM_6 = 0xDD,
    VK_OEM_7 = 0xDE,
    VK_OEM_8 = 0xDF,
    VK_OEM_102 = 0xE2,
    VK_PROCESSKEY = 0xE5,
    VK_PACKET = 0xE7,
    VK_ATTN = 0xF6,
    VK_CRSEL = 0xF7,
    VK_EXSEL = 0xF8,
    VK_EREOF = 0xF9,
    VK_PLAY = 0xFA,
    VK_ZOOM = 0xFB,
    VK_NONAME = 0xFC,
    VK_PA1 = 0xFD,
    VK_OEM_CLEAR = 0xFE,
}

enum TME_HOVER = 1;
enum TME_LEAVE = 2;
enum TME_QUERY = 0x40000000;
enum TME_CANCEL = 0x80000000;

enum HOVER_DEFAULT = 0xFFFFFFFF;

enum MK_LBUTTON = 1;
enum MK_RBUTTON = 2;
enum MK_SHIFT = 4;
enum MK_CONTROL = 8;
enum MK_MBUTTON = 16;
enum MK_XBUTTON1 = 32;
enum MK_XBUTTON2 = 64;

enum {
    TPM_RECURSE      = 0x0001,
    TPM_LEFTBUTTON   = 0,
    TPM_RIGHTBUTTON  = 0x0002,
    TPM_LEFTALIGN    = 0,
    TPM_CENTERALIGN  = 0x0004,
    TPM_RIGHTALIGN   = 0x0008,
    TPM_TOPALIGN     = 0,
    TPM_VCENTERALIGN = 0x0010,
    TPM_BOTTOMALIGN  = 0x0020,
    TPM_HORIZONTAL   = 0,
    TPM_VERTICAL     = 0x0040,
    TPM_NONOTIFY     = 0x0080,
    TPM_RETURNCMD    = 0x0100
}

enum HELP_COMMAND = 0x102;
enum HELP_CONTENTS = 3;
enum HELP_CONTEXT = 1;
enum HELP_CONTEXTPOPUP = 8;
enum HELP_FORCEFILE = 9;
enum HELP_HELPONHELP = 4;
enum HELP_INDEX = 3;
enum HELP_KEY = 0x101;
enum HELP_MULTIKEY = 0x201;
enum HELP_PARTIALKEY = 0x105;
enum HELP_QUIT = 2;
enum HELP_SETCONTENTS = 5;
enum HELP_SETINDEX = 5;
enum HELP_SETWINPOS = 0x203;
enum HELP_CONTEXTMENU = 0xa;
enum HELP_FINDER = 0xb;
enum HELP_WM_HELP = 0xc;
enum HELP_TCARD = 0x8000;
enum HELP_TCARD_DATA = 16;
enum HELP_TCARD_OTHER_CALLER = 0x11;

enum IDH_NO_HELP = 28440;
enum IDH_MISSING_CONTEXT = 28441;
enum IDH_GENERIC_HELP_BUTTON = 28442;
enum IDH_OK = 28443;
enum IDH_CANCEL = 28444;
enum IDH_HELP = 28445;

enum LB_CTLCODE = 0;
enum LB_OKAY = 0;
enum LB_ERR = -1;
enum LB_ERRSPACE = -2;

enum CB_OKAY = 0;
enum CB_ERR = -1;
enum CB_ERRSPACE = -2;

enum HIDE_WINDOW = 0;

enum SHOW_OPENWINDOW = 1;
enum SHOW_ICONWINDOW = 2;
enum SHOW_FULLSCREEN = 3;
enum SHOW_OPENNOACTIVATE = 4;

enum KF_EXTENDED = 256;
enum KF_DLGMODE = 2048;
enum KF_MENUMODE = 4096;
enum KF_ALTDOWN = 8192;
enum KF_REPEAT = 16384;
enum KF_UP = 32768;

enum WSF_VISIBLE = 1;

enum PWR_OK = 1;
enum PWR_FAIL = -1;
enum PWR_SUSPENDREQUEST = 1;
enum PWR_SUSPENDRESUME = 2;
enum PWR_CRITICALRESUME = 3;

enum NFR_ANSI = 1;
enum NFR_UNICODE = 2;
enum NF_QUERY = 3;
enum NF_REQUERY = 4;

enum MENULOOP_WINDOW = 0;
enum MENULOOP_POPUP = 1;

enum WMSZ_LEFT = 1;
enum WMSZ_RIGHT = 2;
enum WMSZ_TOP = 3;
enum WMSZ_TOPLEFT = 4;
enum WMSZ_TOPRIGHT = 5;
enum WMSZ_BOTTOM = 6;
enum WMSZ_BOTTOMLEFT = 7;
enum WMSZ_BOTTOMRIGHT = 8;

enum HTERROR = -2;
enum HTTRANSPARENT = -1;
enum HTNOWHERE = 0;
enum HTCLIENT = 1;
enum HTCAPTION = 2;
enum HTSYSMENU = 3;
enum HTGROWBOX = 4;
enum HTSIZE = 4;
enum HTMENU = 5;
enum HTHSCROLL = 6;
enum HTVSCROLL = 7;
enum HTMINBUTTON = 8;
enum HTMAXBUTTON = 9;
enum HTREDUCE = 8;
enum HTZOOM = 9;
enum HTLEFT = 10;
enum HTSIZEFIRST = 10;
enum HTRIGHT = 11;
enum HTTOP = 12;
enum HTTOPLEFT = 13;
enum HTTOPRIGHT = 14;
enum HTBOTTOM = 15;
enum HTBOTTOMLEFT = 16;
enum HTBOTTOMRIGHT = 17;
enum HTSIZELAST = 17;
enum HTBORDER = 18;
enum HTOBJECT = 19;
enum HTCLOSE = 20;
enum HTHELP = 21;

enum MA_ACTIVATE = 1;
enum MA_ACTIVATEANDEAT = 2;
enum MA_NOACTIVATE = 3;
enum MA_NOACTIVATEANDEAT = 4;

enum SIZE_RESTORED = 0;
enum SIZE_MINIMIZED = 1;
enum SIZE_MAXIMIZED = 2;
enum SIZE_MAXSHOW = 3;
enum SIZE_MAXHIDE = 4;

enum SIZENORMAL = 0;
enum SIZEICONIC = 1;
enum SIZEFULLSCREEN = 2;
enum SIZEZOOMSHOW = 3;
enum SIZEZOOMHIDE = 4;

enum WVR_ALIGNTOP = 16;
enum WVR_ALIGNLEFT = 32;
enum WVR_ALIGNBOTTOM = 64;
enum WVR_ALIGNRIGHT = 128;
enum WVR_HREDRAW = 256;
enum WVR_VREDRAW = 512;
enum WVR_REDRAW = (WVR_HREDRAW|WVR_VREDRAW);
enum WVR_VALIDRECTS = 1024;

enum PRF_CHECKVISIBLE = 1;
enum PRF_NONCLIENT = 2;
enum PRF_CLIENT = 4;
enum PRF_ERASEBKGND = 8;
enum PRF_CHILDREN = 16;
enum PRF_OWNED = 32;

enum IDANI_OPEN = 1;
enum IDANI_CLOSE = 2;
enum IDANI_CAPTION = 3;

enum WPF_RESTORETOMAXIMIZED = 2;
enum WPF_SETMINPOSITION = 1;

enum ODT_MENU = 1;
enum ODT_LISTBOX = 2;
enum ODT_COMBOBOX = 3;
enum ODT_BUTTON = 4;
enum ODT_STATIC = 5;
enum ODA_DRAWENTIRE = 1;
enum ODA_SELECT = 2;
enum ODA_FOCUS = 4;
enum ODS_SELECTED = 1;
enum ODS_GRAYED = 2;
enum ODS_DISABLED = 4;
enum ODS_CHECKED = 8;
enum ODS_FOCUS = 16;
enum ODS_DEFAULT = 32;
enum ODS_COMBOBOXEDIT = 4096;

enum IDHOT_SNAPWINDOW = -1;
enum IDHOT_SNAPDESKTOP = -2;

enum DBWF_LPARAMPOINTER = 0x8000;
enum DLGWINDOWEXTRA = 30;
enum MNC_IGNORE = 0;
enum MNC_CLOSE = 1;
enum MNC_EXECUTE = 2;
enum MNC_SELECT = 3;
enum DOF_EXECUTABLE = 0x8001;
enum DOF_DOCUMENT = 0x8002;
enum DOF_DIRECTORY = 0x8003;
enum DOF_MULTIPLE = 0x8004;
enum DOF_PROGMAN = 1;
enum DOF_SHELLDATA = 2;
enum DO_DROPFILE = 0x454C4946;
enum DO_PRINTFILE = 0x544E5250;

enum SC_SIZE = 0xF000;
enum SC_MOVE = 0xF010;
enum SC_MINIMIZE = 0xF020;
enum SC_ICON = 0xf020;
enum SC_MAXIMIZE = 0xF030;
enum SC_ZOOM = 0xF030;
enum SC_NEXTWINDOW = 0xF040;
enum SC_PREVWINDOW = 0xF050;
enum SC_CLOSE = 0xF060;
enum SC_VSCROLL = 0xF070;
enum SC_HSCROLL = 0xF080;
enum SC_MOUSEMENU = 0xF090;
enum SC_KEYMENU = 0xF100;
enum SC_ARRANGE = 0xF110;
enum SC_RESTORE = 0xF120;
enum SC_TASKLIST = 0xF130;
enum SC_SCREENSAVE = 0xF140;
enum SC_HOTKEY = 0xF150;
enum SC_DEFAULT = 0xF160;
enum SC_MONITORPOWER = 0xF170;
enum SC_CONTEXTHELP = 0xF180;
enum SC_SEPARATOR = 0xF00F;

enum EC_LEFTMARGIN = 1;
enum EC_RIGHTMARGIN = 2;
enum EC_USEFONTINFO = 0xffff;

enum DC_HASDEFID = 0x534B;

enum DLGC_WANTARROWS = 1;
enum DLGC_WANTTAB = 2;
enum DLGC_WANTALLKEYS = 4;
enum DLGC_WANTMESSAGE = 4;
enum DLGC_HASSETSEL = 8;
enum DLGC_DEFPUSHBUTTON = 16;
enum DLGC_UNDEFPUSHBUTTON = 32;
enum DLGC_RADIOBUTTON = 64;
enum DLGC_WANTCHARS = 128;
enum DLGC_STATIC = 256;
enum DLGC_BUTTON = 0x2000;

enum WA_INACTIVE = 0;
enum WA_ACTIVE = 1;
enum WA_CLICKACTIVE = 2;

enum ICON_SMALL = 0;
enum ICON_BIG = 1;
static if (_WIN32_WINNT >= 0x501) {
enum ICON_SMALL2 = 2;
}

enum HBITMAP
    HBMMENU_CALLBACK = cast(HBITMAP)-1,
    HBMMENU_SYSTEM = cast(HBITMAP)1,
    HBMMENU_MBAR_RESTORE = cast(HBITMAP)2,
    HBMMENU_MBAR_MINIMIZE = cast(HBITMAP)3,
    HBMMENU_MBAR_CLOSE = cast(HBITMAP)5,
    HBMMENU_MBAR_CLOSE_D = cast(HBITMAP)6,
    HBMMENU_MBAR_MINIMIZE_D = cast(HBITMAP)7,
    HBMMENU_POPUP_CLOSE = cast(HBITMAP)8,
    HBMMENU_POPUP_RESTORE = cast(HBITMAP)9,
    HBMMENU_POPUP_MAXIMIZE = cast(HBITMAP)10,
    HBMMENU_POPUP_MINIMIZE = cast(HBITMAP)11;

enum MOD_ALT = 1;
enum MOD_CONTROL = 2;
enum MOD_SHIFT = 4;
enum MOD_WIN = 8;
enum MOD_IGNORE_ALL_MODIFIER = 1024;
enum MOD_ON_KEYUP = 2048;
enum MOD_RIGHT = 16384;
enum MOD_LEFT = 32768;

enum LLKHF_EXTENDED = (KF_EXTENDED >> 8);
enum LLKHF_INJECTED = 0x00000010;
enum LLKHF_ALTDOWN = (KF_ALTDOWN >> 8);
enum LLKHF_UP = (KF_UP >> 8);

enum CURSOR_SHOWING = 0x00000001;
enum WS_ACTIVECAPTION = 0x00000001;
enum ENDSESSION_LOGOFF = 0x80000000;

enum GA_PARENT    = 1;
enum GA_ROOT      = 2;
enum GA_ROOTOWNER = 3;

enum {
    MAPVK_VK_TO_VSC,
    MAPVK_VSC_TO_VK,
    MAPVK_VK_TO_CHAR,
    MAPVK_VSC_TO_VK_EX,
    MAPVK_VK_TO_VSC_EX // = 4
}

enum {
    INPUT_MOUSE,
    INPUT_KEYBOARD,
    INPUT_HARDWARE // = 2
}

// Callbacks
// ---------
extern (Windows) nothrow {
    alias INT_PTR function(HWND, UINT, WPARAM, LPARAM)   DLGPROC;
    alias void function(HWND, UINT, UINT_PTR, DWORD)     TIMERPROC;
    alias BOOL function(HDC, LPARAM, int)                GRAYSTRINGPROC;
    alias LRESULT function(int, WPARAM, LPARAM)          HOOKPROC;
    alias BOOL function(HWND, LPCSTR, HANDLE)            PROPENUMPROCA;
    alias BOOL function(HWND, LPCWSTR, HANDLE)           PROPENUMPROCW;
    alias BOOL function(HWND, LPSTR, HANDLE, ULONG_PTR)  PROPENUMPROCEXA;
    alias BOOL function(HWND, LPWSTR, HANDLE, ULONG_PTR) PROPENUMPROCEXW;
    alias int function(LPSTR, int, int, int)             EDITWORDBREAKPROCA;
    alias int function(LPWSTR, int, int, int)            EDITWORDBREAKPROCW;
    alias LRESULT function(HWND, UINT, WPARAM, LPARAM)   WNDPROC;
    alias BOOL function(HDC, LPARAM, WPARAM, int, int)   DRAWSTATEPROC;
    alias BOOL function(HWND, LPARAM)                    WNDENUMPROC;
    alias BOOL function(HWND, LPARAM)                    ENUMWINDOWSPROC;
    alias void function(LPHELPINFO)                      MSGBOXCALLBACK;

    alias BOOL function(HMONITOR, HDC, LPRECT, LPARAM)   MONITORENUMPROC;
    alias BOOL function(LPSTR, LPARAM)                   NAMEENUMPROCA;
    alias BOOL function(LPWSTR, LPARAM)                  NAMEENUMPROCW;
    alias void function(HWND, UINT, ULONG_PTR, LRESULT)  SENDASYNCPROC;

    alias NAMEENUMPROCA DESKTOPENUMPROCA;
    alias NAMEENUMPROCW DESKTOPENUMPROCW;
    alias NAMEENUMPROCA WINSTAENUMPROCA;
    alias NAMEENUMPROCW WINSTAENUMPROCW;
}

alias HDWP = HANDLE;
alias HDEVNOTIFY = HANDLE;

struct MENUGETOBJECTINFO {
    DWORD dwFlags;
    UINT  uPos;
    HMENU hmenu;
    PVOID riid;
    PVOID pvObj;
}
alias MENUGETOBJECTINFO* PMENUGETOBJECTINFO;

struct ACCEL {
    BYTE fVirt;
    WORD key;
    WORD cmd;
}
alias ACCEL* LPACCEL;

struct ACCESSTIMEOUT {
    UINT  cbSize = ACCESSTIMEOUT.sizeof;
    DWORD dwFlags;
    DWORD iTimeOutMSec;
}
alias ACCESSTIMEOUT* LPACCESSTIMEOUT;

struct ANIMATIONINFO {
    UINT cbSize = ANIMATIONINFO.sizeof;
    int  iMinAnimate;
}
alias ANIMATIONINFO* LPANIMATIONINFO;

struct CREATESTRUCTA {
    LPVOID    lpCreateParams;
    HINSTANCE hInstance;
    HMENU     hMenu;
    HWND      hwndParent;
    int       cy;
    int       cx;
    int       y;
    int       x;
    LONG      style;
    LPCSTR    lpszName;
    LPCSTR    lpszClass;
    DWORD     dwExStyle;
}
alias CREATESTRUCTA* LPCREATESTRUCTA;

struct CREATESTRUCTW {
    LPVOID    lpCreateParams;
    HINSTANCE hInstance;
    HMENU     hMenu;
    HWND      hwndParent;
    int       cy;
    int       cx;
    int       y;
    int       x;
    LONG      style;
    LPCWSTR   lpszName;
    LPCWSTR   lpszClass;
    DWORD     dwExStyle;
}
alias CREATESTRUCTW* LPCREATESTRUCTW;

struct CBT_CREATEWNDA {
    LPCREATESTRUCTA lpcs;
    HWND            hwndInsertAfter;
}
alias CBT_CREATEWNDA* LPCBT_CREATEWNDA;

struct CBT_CREATEWNDW {
    LPCREATESTRUCTW lpcs;
    HWND            hwndInsertAfter;
}
alias CBT_CREATEWNDW* LPCBT_CREATEWNDW;

struct CBTACTIVATESTRUCT {
    BOOL fMouse;
    HWND hWndActive;
}
alias CBTACTIVATESTRUCT* LPCBTACTIVATESTRUCT;

static if (_WIN32_WINNT >= 0x501) {

struct WTSSESSION_NOTIFICATION
{
    DWORD cbSize;
    DWORD dwSessionId;
}
alias WTSSESSION_NOTIFICATION* PWTSSESSION_NOTIFICATION;

}

struct CLIENTCREATESTRUCT {
    HANDLE hWindowMenu;
    UINT   idFirstChild;
}
alias CLIENTCREATESTRUCT* LPCLIENTCREATESTRUCT;

struct COMPAREITEMSTRUCT {
    UINT  CtlType;
    UINT  CtlID;
    HWND  hwndItem;
    UINT  itemID1;
    ULONG_PTR itemData1;
    UINT  itemID2;
    ULONG_PTR itemData2;
    DWORD dwLocaleId;
}
alias COMPAREITEMSTRUCT* LPCOMPAREITEMSTRUCT;

struct COPYDATASTRUCT {
    ULONG_PTR dwData;
    DWORD cbData;
    PVOID lpData;
}
alias COPYDATASTRUCT* PCOPYDATASTRUCT;

struct CURSORSHAPE {
    int xHotSpot;
    int yHotSpot;
    int cx;
    int cy;
    int cbWidth;
    BYTE Planes;
    BYTE BitsPixel;
}
alias CURSORSHAPE* LPCURSORSHAPE;

struct CWPRETSTRUCT {
    LRESULT lResult;
    LPARAM lParam;
    WPARAM wParam;
    DWORD message;
    HWND hwnd;
}

struct CWPSTRUCT {
    LPARAM lParam;
    WPARAM wParam;
    UINT message;
    HWND hwnd;
}
alias CWPSTRUCT* PCWPSTRUCT;

struct DEBUGHOOKINFO {
    DWORD idThread;
    DWORD idThreadInstaller;
    LPARAM lParam;
    WPARAM wParam;
    int code;
}
alias DEBUGHOOKINFO* PDEBUGHOOKINFO, LPDEBUGHOOKINFO;

struct DELETEITEMSTRUCT {
    UINT CtlType;
    UINT CtlID;
    UINT itemID;
    HWND hwndItem;
    ULONG_PTR itemData;
}
alias DELETEITEMSTRUCT* PDELETEITEMSTRUCT, LPDELETEITEMSTRUCT;

align(2):
struct DLGITEMTEMPLATE {
    DWORD style;
    DWORD dwExtendedStyle;
    short x;
    short y;
    short cx;
    short cy;
    WORD id;
}
alias DLGITEMTEMPLATE* LPDLGITEMTEMPLATE;

struct DLGTEMPLATE {
    DWORD style;
    DWORD dwExtendedStyle;
    WORD  cdit;
    short x;
    short y;
    short cx;
    short cy;
}
alias DLGTEMPLATE*        LPDLGTEMPLATE, LPDLGTEMPLATEA, LPDLGTEMPLATEW;
alias const(DLGTEMPLATE)* LPCDLGTEMPLATE, LPCDLGTEMPLATEA, LPCDLGTEMPLATEW;

align:

struct DRAWITEMSTRUCT {
    UINT  CtlType;
    UINT  CtlID;
    UINT  itemID;
    UINT  itemAction;
    UINT  itemState;
    HWND  hwndItem;
    HDC   hDC;
    RECT  rcItem;
    ULONG_PTR itemData;
}
alias DRAWITEMSTRUCT* LPDRAWITEMSTRUCT, PDRAWITEMSTRUCT;

struct DRAWTEXTPARAMS {
    UINT cbSize = DRAWTEXTPARAMS.sizeof;
    int  iTabLength;
    int  iLeftMargin;
    int  iRightMargin;
    UINT uiLengthDrawn;
}
alias DRAWTEXTPARAMS* LPDRAWTEXTPARAMS;

struct PAINTSTRUCT {
    HDC      hdc;
    BOOL     fErase;
    RECT     rcPaint;
    BOOL     fRestore;
    BOOL     fIncUpdate;
    BYTE[32] rgbReserved;
}
alias PAINTSTRUCT* PPAINTSTRUCT, NPPAINTSTRUCT, LPPAINTSTRUCT;

struct MSG {
    HWND   hwnd;
    UINT   message;
    WPARAM wParam;
    LPARAM lParam;
    DWORD  time;
    POINT  pt;
}
alias MSG* NPMSG, LPMSG, PMSG;

struct ICONINFO {
    BOOL    fIcon;
    DWORD   xHotspot;
    DWORD   yHotspot;
    HBITMAP hbmMask;
    HBITMAP hbmColor;
}
alias ICONINFO* PICONINFO;

struct NMHDR {
    HWND hwndFrom;
    UINT_PTR idFrom;
    UINT code;
}
alias NMHDR* LPNMHDR;

struct WNDCLASSA {
    UINT      style;
    WNDPROC   lpfnWndProc;
    int       cbClsExtra;
    int       cbWndExtra;
    HINSTANCE hInstance;
    HICON     hIcon;
    HCURSOR   hCursor;
    HBRUSH    hbrBackground;
    LPCSTR    lpszMenuName;
    LPCSTR    lpszClassName;
}
alias WNDCLASSA* NPWNDCLASSA, LPWNDCLASSA, PWNDCLASSA;

struct WNDCLASSW {
    UINT      style;
    WNDPROC   lpfnWndProc;
    int       cbClsExtra;
    int       cbWndExtra;
    HINSTANCE hInstance;
    HICON     hIcon;
    HCURSOR   hCursor;
    HBRUSH    hbrBackground;
    LPCWSTR   lpszMenuName;
    LPCWSTR   lpszClassName;
}
alias WNDCLASSW* NPWNDCLASSW, LPWNDCLASSW, PWNDCLASSW;

struct WNDCLASSEXA {
    UINT      cbSize = WNDCLASSEXA.sizeof;
    UINT      style;
    WNDPROC   lpfnWndProc;
    int       cbClsExtra;
    int       cbWndExtra;
    HINSTANCE hInstance;
    HICON     hIcon;
    HCURSOR   hCursor;
    HBRUSH    hbrBackground;
    LPCSTR    lpszMenuName;
    LPCSTR    lpszClassName;
    HICON     hIconSm;
}
alias WNDCLASSEXA* NPWNDCLASSEXA, LPWNDCLASSEXA, PWNDCLASSEXA;

struct WNDCLASSEXW {
    UINT      cbSize = WNDCLASSEXW.sizeof;
    UINT      style;
    WNDPROC   lpfnWndProc;
    int       cbClsExtra;
    int       cbWndExtra;
    HINSTANCE hInstance;
    HICON     hIcon;
    HCURSOR   hCursor;
    HBRUSH    hbrBackground;
    LPCWSTR   lpszMenuName;
    LPCWSTR   lpszClassName;
    HICON     hIconSm;
}
alias WNDCLASSEXW* LPWNDCLASSEXW, PWNDCLASSEXW;

struct MENUITEMINFOA {
    UINT      cbSize = MENUITEMINFOA.sizeof;
    UINT      fMask;
    UINT      fType;
    UINT      fState;
    UINT      wID;
    HMENU     hSubMenu;
    HBITMAP   hbmpChecked;
    HBITMAP   hbmpUnchecked;
    ULONG_PTR dwItemData;
    LPSTR     dwTypeData;
    UINT      cch;
    HBITMAP   hbmpItem;
}
alias MENUITEMINFOA*        LPMENUITEMINFOA;
alias const(MENUITEMINFOA)* LPCMENUITEMINFOA;

struct MENUITEMINFOW {
    UINT      cbSize = MENUITEMINFOW.sizeof;
    UINT      fMask;
    UINT      fType;
    UINT      fState;
    UINT      wID;
    HMENU     hSubMenu;
    HBITMAP   hbmpChecked;
    HBITMAP   hbmpUnchecked;
    ULONG_PTR dwItemData;
    LPWSTR    dwTypeData;
    UINT      cch;
    HBITMAP   hbmpItem;
}
alias MENUITEMINFOW*        LPMENUITEMINFOW;
alias const(MENUITEMINFOW)* LPCMENUITEMINFOW;

struct SCROLLINFO {
    UINT cbSize = this.sizeof;
    UINT fMask;
    int nMin;
    int nMax;
    UINT nPage;
    int nPos;
    int nTrackPos;
}
alias SCROLLINFO*        LPSCROLLINFO;
alias const(SCROLLINFO)* LPCSCROLLINFO;

struct WINDOWPLACEMENT {
    UINT length;
    UINT flags;
    UINT showCmd;
    POINT ptMinPosition;
    POINT ptMaxPosition;
    RECT rcNormalPosition;
}
alias WINDOWPLACEMENT* LPWINDOWPLACEMENT, PWINDOWPLACEMENT;

struct MENUITEMTEMPLATEHEADER {
    WORD versionNumber;
    WORD offset;
}

struct MENUITEMTEMPLATE {
    WORD mtOption;
    WORD mtID;
    WCHAR[1] mtString = 0;
}

alias void MENUTEMPLATE, MENUTEMPLATEA, MENUTEMPLATEW;

alias MENUTEMPLATE* LPMENUTEMPLATEA, LPMENUTEMPLATEW, LPMENUTEMPLATE;

struct HELPINFO {
    UINT cbSize = this.sizeof;
    int iContextType;
    int iCtrlId;
    HANDLE hItemHandle;
    DWORD_PTR dwContextId;
    POINT MousePos;
}
alias HELPINFO* LPHELPINFO;

struct MSGBOXPARAMSA {
    UINT cbSize = this.sizeof;
    HWND hwndOwner;
    HINSTANCE hInstance;
    LPCSTR lpszText;
    LPCSTR lpszCaption;
    DWORD dwStyle;
    LPCSTR lpszIcon;
    DWORD_PTR dwContextHelpId;
    MSGBOXCALLBACK lpfnMsgBoxCallback;
    DWORD dwLanguageId;
}
alias MSGBOXPARAMSA* PMSGBOXPARAMSA, LPMSGBOXPARAMSA;

struct MSGBOXPARAMSW {
    UINT cbSize = this.sizeof;
    HWND hwndOwner;
    HINSTANCE hInstance;
    LPCWSTR lpszText;
    LPCWSTR lpszCaption;
    DWORD dwStyle;
    LPCWSTR lpszIcon;
    DWORD_PTR dwContextHelpId;
    MSGBOXCALLBACK lpfnMsgBoxCallback;
    DWORD dwLanguageId;
}
alias MSGBOXPARAMSW* PMSGBOXPARAMSW, LPMSGBOXPARAMSW;

struct USEROBJECTFLAGS {
    BOOL fInherit;
    BOOL fReserved;
    DWORD dwFlags;
}

struct FILTERKEYS {
    UINT cbSize = this.sizeof;
    DWORD dwFlags;
    DWORD iWaitMSec;
    DWORD iDelayMSec;
    DWORD iRepeatMSec;
    DWORD iBounceMSec;
}

struct HIGHCONTRASTA {
    UINT cbSize = this.sizeof;
    DWORD dwFlags;
    LPSTR lpszDefaultScheme;
}
alias HIGHCONTRASTA* LPHIGHCONTRASTA;

struct HIGHCONTRASTW {
    UINT cbSize = this.sizeof;
    DWORD dwFlags;
    LPWSTR lpszDefaultScheme;
}
alias HIGHCONTRASTW* LPHIGHCONTRASTW;

struct ICONMETRICSA {
    UINT cbSize = this.sizeof;
    int iHorzSpacing;
    int iVertSpacing;
    int iTitleWrap;
    LOGFONTA lfFont;
}
alias ICONMETRICSA* LPICONMETRICSA;

struct ICONMETRICSW {
    UINT cbSize = this.sizeof;
    int iHorzSpacing;
    int iVertSpacing;
    int iTitleWrap;
    LOGFONTW lfFont;
}
alias ICONMETRICSW* LPICONMETRICSW;

struct MINIMIZEDMETRICS {
    UINT cbSize = this.sizeof;
    int iWidth;
    int iHorzGap;
    int iVertGap;
    int iArrange;
}
alias MINIMIZEDMETRICS* LPMINIMIZEDMETRICS;

struct MOUSEKEYS {
    UINT cbSize = this.sizeof;
    DWORD dwFlags;
    DWORD iMaxSpeed;
    DWORD iTimeToMaxSpeed;
    DWORD iCtrlSpeed;
    DWORD dwReserved1;
    DWORD dwReserved2;
}
alias MOUSEKEYS* LPMOUSEKEYS;

struct NONCLIENTMETRICSA {
    UINT cbSize = this.sizeof;
    int iBorderWidth;
    int iScrollWidth;
    int iScrollHeight;
    int iCaptionWidth;
    int iCaptionHeight;
    LOGFONTA lfCaptionFont;
    int iSmCaptionWidth;
    int iSmCaptionHeight;
    LOGFONTA lfSmCaptionFont;
    int iMenuWidth;
    int iMenuHeight;
    LOGFONTA lfMenuFont;
    LOGFONTA lfStatusFont;
    LOGFONTA lfMessageFont;
}
alias NONCLIENTMETRICSA* LPNONCLIENTMETRICSA;

struct NONCLIENTMETRICSW {
    UINT cbSize = this.sizeof;
    int iBorderWidth;
    int iScrollWidth;
    int iScrollHeight;
    int iCaptionWidth;
    int iCaptionHeight;
    LOGFONTW lfCaptionFont;
    int iSmCaptionWidth;
    int iSmCaptionHeight;
    LOGFONTW lfSmCaptionFont;
    int iMenuWidth;
    int iMenuHeight;
    LOGFONTW lfMenuFont;
    LOGFONTW lfStatusFont;
    LOGFONTW lfMessageFont;
}
alias NONCLIENTMETRICSW* LPNONCLIENTMETRICSW;

struct SERIALKEYSA {
    UINT cbSize = this.sizeof;
    DWORD dwFlags;
    LPSTR lpszActivePort;
    LPSTR lpszPort;
    UINT iBaudRate;
    UINT iPortState;
    UINT iActive;
}
alias SERIALKEYSA* LPSERIALKEYSA;

struct SERIALKEYSW {
    UINT cbSize = this.sizeof;
    DWORD dwFlags;
    LPWSTR lpszActivePort;
    LPWSTR lpszPort;
    UINT iBaudRate;
    UINT iPortState;
    UINT iActive;
}
alias SERIALKEYSW* LPSERIALKEYSW;

struct SOUNDSENTRYA {
    UINT cbSize = this.sizeof;
    DWORD dwFlags;
    DWORD iFSTextEffect;
    DWORD iFSTextEffectMSec;
    DWORD iFSTextEffectColorBits;
    DWORD iFSGrafEffect;
    DWORD iFSGrafEffectMSec;
    DWORD iFSGrafEffectColor;
    DWORD iWindowsEffect;
    DWORD iWindowsEffectMSec;
    LPSTR lpszWindowsEffectDLL;
    DWORD iWindowsEffectOrdinal;
}
alias SOUNDSENTRYA* LPSOUNDSENTRYA;

struct SOUNDSENTRYW {
    UINT cbSize = this.sizeof;
    DWORD dwFlags;
    DWORD iFSTextEffect;
    DWORD iFSTextEffectMSec;
    DWORD iFSTextEffectColorBits;
    DWORD iFSGrafEffect;
    DWORD iFSGrafEffectMSec;
    DWORD iFSGrafEffectColor;
    DWORD iWindowsEffect;
    DWORD iWindowsEffectMSec;
    LPWSTR lpszWindowsEffectDLL;
    DWORD iWindowsEffectOrdinal;
}
alias SOUNDSENTRYW* LPSOUNDSENTRYW;

struct STICKYKEYS {
    DWORD cbSize = this.sizeof;
    DWORD dwFlags;
}
alias STICKYKEYS* LPSTICKYKEYS;

struct TOGGLEKEYS {
    DWORD cbSize = this.sizeof;
    DWORD dwFlags;
}

struct MOUSEHOOKSTRUCT {
    POINT pt;
    HWND hwnd;
    UINT wHitTestCode;
    ULONG_PTR dwExtraInfo;
}
alias MOUSEHOOKSTRUCT* LPMOUSEHOOKSTRUCT, PMOUSEHOOKSTRUCT;

struct TRACKMOUSEEVENT {
    DWORD cbSize = this.sizeof;
    DWORD dwFlags;
    HWND  hwndTrack;
    DWORD dwHoverTime;
}
alias TRACKMOUSEEVENT* LPTRACKMOUSEEVENT;

struct TPMPARAMS {
    UINT cbSize = this.sizeof;
    RECT rcExclude;
}
alias TPMPARAMS* LPTPMPARAMS;

struct EVENTMSG {
    UINT message;
    UINT paramL;
    UINT paramH;
    DWORD time;
    HWND hwnd;
}
alias EVENTMSG* PEVENTMSGMSG, LPEVENTMSGMSG, PEVENTMSG, LPEVENTMSG;

struct WINDOWPOS {
    HWND hwnd;
    HWND hwndInsertAfter;
    int x;
    int y;
    int cx;
    int cy;
    UINT flags;
}
alias WINDOWPOS* PWINDOWPOS, LPWINDOWPOS;

struct NCCALCSIZE_PARAMS {
    RECT[3] rgrc;
    PWINDOWPOS lppos;
}
alias NCCALCSIZE_PARAMS* LPNCCALCSIZE_PARAMS;

struct MDICREATESTRUCTA {
    LPCSTR szClass;
    LPCSTR szTitle;
    HANDLE hOwner;
    int x;
    int y;
    int cx;
    int cy;
    DWORD style;
    LPARAM lParam;
}
alias MDICREATESTRUCTA* LPMDICREATESTRUCTA;

struct MDICREATESTRUCTW {
    LPCWSTR szClass;
    LPCWSTR szTitle;
    HANDLE hOwner;
    int x;
    int y;
    int cx;
    int cy;
    DWORD style;
    LPARAM lParam;
}
alias MDICREATESTRUCTW* LPMDICREATESTRUCTW;

struct MINMAXINFO {
    POINT ptReserved;
    POINT ptMaxSize;
    POINT ptMaxPosition;
    POINT ptMinTrackSize;
    POINT ptMaxTrackSize;
}
alias MINMAXINFO* PMINMAXINFO, LPMINMAXINFO;

struct MDINEXTMENU {
    HMENU hmenuIn;
    HMENU hmenuNext;
    HWND hwndNext;
}
alias MDINEXTMENU* PMDINEXTMENU, LPMDINEXTMENU;

struct MEASUREITEMSTRUCT {
    UINT CtlType;
    UINT CtlID;
    UINT itemID;
    UINT itemWidth;
    UINT itemHeight;
    ULONG_PTR itemData;
}
alias MEASUREITEMSTRUCT* PMEASUREITEMSTRUCT, LPMEASUREITEMSTRUCT;

struct DROPSTRUCT {
    HWND hwndSource;
    HWND hwndSink;
    DWORD wFmt;
    ULONG_PTR dwData;
    POINT ptDrop;
    DWORD dwControlData;
}
alias DROPSTRUCT* PDROPSTRUCT, LPDROPSTRUCT;

alias DWORD HELPPOLY;

struct MULTIKEYHELPA {
    DWORD mkSize;
    CHAR mkKeylist = 0;
    CHAR[1] szKeyphrase = 0;
}
alias MULTIKEYHELPA* PMULTIKEYHELPA, LPMULTIKEYHELPA;

struct MULTIKEYHELPW {
    DWORD mkSize;
    WCHAR mkKeylist = 0;
    WCHAR[1] szKeyphrase = 0;
}
alias MULTIKEYHELPW* PMULTIKEYHELPW, LPMULTIKEYHELPW;

struct HELPWININFOA {
    int wStructSize;
    int x;
    int y;
    int dx;
    int dy;
    int wMax;
    CHAR[2] rgchMember = 0;
}
alias HELPWININFOA* PHELPWININFOA, LPHELPWININFOA;

struct HELPWININFOW {
    int wStructSize;
    int x;
    int y;
    int dx;
    int dy;
    int wMax;
    WCHAR[2] rgchMember = 0;
}
alias HELPWININFOW* PHELPWININFOW, LPHELPWININFOW;

struct STYLESTRUCT {
    DWORD styleOld;
    DWORD styleNew;
}
alias STYLESTRUCT* LPSTYLESTRUCT;

struct ALTTABINFO {
    DWORD cbSize = this.sizeof;
    int   cItems;
    int   cColumns;
    int   cRows;
    int   iColFocus;
    int   iRowFocus;
    int   cxItem;
    int   cyItem;
    POINT ptStart;
}
alias ALTTABINFO* PALTTABINFO, LPALTTABINFO;

struct COMBOBOXINFO {
    DWORD cbSize = this.sizeof;
    RECT rcItem;
    RECT rcButton;
    DWORD stateButton;
    HWND hwndCombo;
    HWND hwndItem;
    HWND hwndList;
}
alias COMBOBOXINFO* PCOMBOBOXINFO, LPCOMBOBOXINFO;

struct CURSORINFO {
    DWORD cbSize = this.sizeof;
    DWORD flags;
    HCURSOR hCursor;
    POINT ptScreenPos;
}
alias CURSORINFO* PCURSORINFO, LPCURSORINFO;

struct MENUBARINFO {
    DWORD cbSize = this.sizeof;
    RECT  rcBar;
    HMENU hMenu;
    HWND  hwndMenu;
    byte bf_; // Simulated bitfield
//  BOOL  fBarFocused:1;
//  BOOL  fFocused:1;
    bool fBarFocused()       { return (bf_ & 1) == 1; }
    bool fFocused()          { return (bf_ & 2) == 2; }
    bool fBarFocused(bool b) { bf_ = cast(byte) ((bf_ & 0xFE) | b);           return b; }
    bool fFocused(bool b)    { bf_ = cast(byte) (b ? (bf_ | 2) : bf_ & 0xFD); return b; }
}
alias MENUBARINFO* PMENUBARINFO;

struct MENUINFO {
    DWORD cbSize = this.sizeof;
    DWORD fMask;
    DWORD dwStyle;
    UINT cyMax;
    HBRUSH  hbrBack;
    DWORD   dwContextHelpID;
    ULONG_PTR dwMenuData;
}
alias MENUINFO*        LPMENUINFO;
alias const(MENUINFO)* LPCMENUINFO;


enum CCHILDREN_SCROLLBAR = 5;

struct SCROLLBARINFO {
    DWORD cbSize = this.sizeof;
    RECT  rcScrollBar;
    int   dxyLineButton;
    int   xyThumbTop;
    int   xyThumbBottom;
    int   reserved;
    DWORD[CCHILDREN_SCROLLBAR+1] rgstate;
}
alias SCROLLBARINFO* PSCROLLBARINFO, LPSCROLLBARINFO;

enum CCHILDREN_TITLEBAR = 5;

struct WINDOWINFO {
    DWORD cbSize = WINDOWINFO.sizeof;
    RECT  rcWindow;
    RECT  rcClient;
    DWORD dwStyle;
    DWORD dwExStyle;
    DWORD dwWindowStatus;
    UINT  cxWindowBorders;
    UINT  cyWindowBorders;
    ATOM  atomWindowType;
    WORD  wCreatorVersion;
}
alias WINDOWINFO* PWINDOWINFO, LPWINDOWINFO;

struct LASTINPUTINFO {
    UINT cbSize = this.sizeof;
    DWORD dwTime;
}
alias LASTINPUTINFO* PLASTINPUTINFO;

struct MONITORINFO {
    DWORD cbSize = this.sizeof;
    RECT rcMonitor;
    RECT rcWork;
    DWORD dwFlags;
}
alias MONITORINFO* LPMONITORINFO;

enum CCHDEVICENAME = 32;

struct MONITORINFOEXA {
    DWORD cbSize = MONITORINFOEXA.sizeof;
    RECT  rcMonitor;
    RECT  rcWork;
    DWORD dwFlags;
    CHAR[CCHDEVICENAME] szDevice = 0;
}
alias MONITORINFOEXA* LPMONITORINFOEXA;

struct MONITORINFOEXW {
    DWORD cbSize = MONITORINFOEXW.sizeof;
    RECT  rcMonitor;
    RECT  rcWork;
    DWORD dwFlags;
    WCHAR[CCHDEVICENAME] szDevice = 0;
}
alias MONITORINFOEXW* LPMONITORINFOEXW;

struct KBDLLHOOKSTRUCT {
    DWORD vkCode;
    DWORD scanCode;
    DWORD flags;
    DWORD time;
    ULONG_PTR dwExtraInfo;
}
alias KBDLLHOOKSTRUCT* LPKBDLLHOOKSTRUCT, PKBDLLHOOKSTRUCT;

struct MSLLHOOKSTRUCT {
    POINT     pt;
    DWORD     mouseData;
    DWORD     flags;
    DWORD     time;
    ULONG_PTR dwExtraInfo;
}
alias MSLLHOOKSTRUCT* PMSLLHOOKSTRUCT;

struct MOUSEINPUT {
    LONG dx;
    LONG dy;
    DWORD mouseData;
    DWORD dwFlags;
    DWORD time;
    ULONG_PTR dwExtraInfo;
}
alias MOUSEINPUT* PMOUSEINPUT;

struct KEYBDINPUT {
    WORD wVk;
    WORD wScan;
    DWORD dwFlags;
    DWORD time;
    ULONG_PTR dwExtraInfo;
}
alias KEYBDINPUT* PKEYBDINPUT;

struct HARDWAREINPUT {
    DWORD uMsg;
    WORD wParamL;
    WORD wParamH;
}
alias HARDWAREINPUT* PHARDWAREINPUT;

struct INPUT {
    DWORD type;
    union {
        MOUSEINPUT mi;
        KEYBDINPUT ki;
        HARDWAREINPUT hi;
    }
}
alias INPUT* PINPUT, LPINPUT;

static if (_WIN32_WINNT >= 0x501) {
    align(4) struct BSMINFO {
        UINT  cbSize = this.sizeof;
        HDESK hdesk;
        HWND  hwnd;
align(4) LUID  luid;
    }
    alias BSMINFO* PBSMINFO;

    alias HANDLE HRAWINPUT;

    struct RAWINPUTHEADER {
        DWORD dwType;
        DWORD dwSize;
        HANDLE hDevice;
        WPARAM wParam;
    }
    alias RAWINPUTHEADER* PRAWINPUTHEADER;

    struct RAWMOUSE {
        USHORT usFlags;
        union {
            ULONG ulButtons;
            struct {
                USHORT usButtonFlags;
                USHORT usButtonData;
            }
        }
        ULONG ulRawButtons;
        LONG lLastX;
        LONG lLastY;
        ULONG ulExtraInformation;
    }
    alias RAWMOUSE* PRAWMOUSE, LPRAWMOUSE;

    struct RAWKEYBOARD {
        USHORT MakeCode;
        USHORT Flags;
        USHORT Reserved;
        USHORT VKey;
        UINT Message;
        ULONG ExtraInformation;
    }
    alias RAWKEYBOARD* PRAWKEYBOARD, LPRAWKEYBOARD;

    struct RAWHID {
        DWORD dwSizeHid;
        DWORD dwCount;
        BYTE bRawData;
    }
    alias RAWHID* PRAWHID, LPRAWHID;

    struct RAWINPUT {
        RAWINPUTHEADER header;
        union _data {
            RAWMOUSE    mouse;
            RAWKEYBOARD keyboard;
            RAWHID      hid;
        }
        _data data;
    }
    alias RAWINPUT* PRAWINPUT, LPRAWINPUT;

    struct RAWINPUTDEVICE {
        USHORT usUsagePage;
        USHORT usUsage;
        DWORD dwFlags;
        HWND hwndTarget;
    }
    alias RAWINPUTDEVICE*        PRAWINPUTDEVICE, LPRAWINPUTDEVICE;
    alias const(RAWINPUTDEVICE)* PCRAWINPUTDEVICE;

    struct RAWINPUTDEVICELIST {
        HANDLE hDevice;
        DWORD dwType;
    }
    alias RAWINPUTDEVICELIST* PRAWINPUTDEVICELIST;

    struct RID_DEVICE_INFO_MOUSE {
        DWORD dwId;
        DWORD dwNumberOfButtons;
        DWORD dwSampleRate;
        BOOL  fHasHorizontalWheel;
    }

    struct RID_DEVICE_INFO_KEYBOARD {
        DWORD dwType;
        DWORD dwSubType;
        DWORD dwKeyboardMode;
        DWORD dwNumberOfFunctionKeys;
        DWORD dwNumberOfIndicators;
        DWORD dwNumberOfKeysTotal;
    }

    struct RID_DEVICE_INFO_HID {
        DWORD dwVendorId;
        DWORD dwProductId;
        DWORD dwVersionNumber;
        USHORT usUsagePage;
        USHORT usUsage;
    }

    struct RID_DEVICE_INFO {
        DWORD cbSize = this.sizeof;
        DWORD dwType;
        union {
            RID_DEVICE_INFO_MOUSE mouse;
            RID_DEVICE_INFO_KEYBOARD keyboard;
            RID_DEVICE_INFO_HID hid;
        }
    }
}// (_WIN32_WINNT >= 0x501)

alias CharToOemA AnsiToOem;
alias OemToCharA OemToAnsi;
alias CharToOemBuffA AnsiToOemBuff;
alias OemToCharBuffA OemToAnsiBuff;
alias CharUpperA AnsiUpper;
alias CharUpperBuffA AnsiUpperBuff;
alias CharLowerA AnsiLower;
alias CharLowerBuffA AnsiLowerBuff;
alias CharNextA AnsiNext;
alias CharPrevA AnsiPrev;

alias MAKELONG MAKEWPARAM;
alias MAKELONG MAKELPARAM;
alias MAKELONG MAKELRESULT;

void POINTSTOPOINT()(out POINT p, LONG ps) {
    p.x = LOWORD(ps);
    p.y = HIWORD(ps);
}

POINTS POINTTOPOINTS()(const POINT p) {
    return MAKELONG(p.x, p.y);
}

extern (Windows) nothrow @nogc {
    HKL ActivateKeyboardLayout(HKL, UINT);
    BOOL AdjustWindowRect(LPRECT, DWORD, BOOL);
    BOOL AdjustWindowRectEx(LPRECT, DWORD, BOOL, DWORD);
    BOOL AnyPopup();
    BOOL AppendMenuA(HMENU, UINT, UINT_PTR, LPCSTR);
    BOOL AppendMenuW(HMENU, UINT, UINT_PTR, LPCWSTR);
    UINT ArrangeIconicWindows(HWND);
    BOOL AttachThreadInput(DWORD, DWORD, BOOL);
    HDWP BeginDeferWindowPos(int);
    HDC BeginPaint(HWND, LPPAINTSTRUCT);
    BOOL BringWindowToTop(HWND);
    BOOL CallMsgFilterA(LPMSG, INT);
    BOOL CallMsgFilterW(LPMSG, INT);
    LRESULT CallNextHookEx(HHOOK, int, WPARAM, LPARAM);
    LRESULT CallWindowProcA(WNDPROC, HWND, UINT, WPARAM, LPARAM);
    LRESULT CallWindowProcW(WNDPROC, HWND, UINT, WPARAM, LPARAM);
    WORD CascadeWindows(HWND, UINT, LPCRECT, UINT, const(HWND)*);
    BOOL ChangeClipboardChain(HWND, HWND);

    LONG ChangeDisplaySettingsA(PDEVMODEA, DWORD);
    LONG ChangeDisplaySettingsW(PDEVMODEW, DWORD);
    LONG ChangeDisplaySettingsExA(LPCSTR, LPDEVMODEA, HWND, DWORD, LPVOID);
    LONG ChangeDisplaySettingsExW(LPCWSTR, LPDEVMODEW, HWND, DWORD, LPVOID);

    BOOL ChangeMenuA(HMENU, UINT, LPCSTR, UINT, UINT);
    BOOL ChangeMenuW(HMENU, UINT, LPCWSTR, UINT, UINT);
    LPSTR CharLowerA(LPSTR);
    LPWSTR CharLowerW(LPWSTR);
    DWORD CharLowerBuffA(LPSTR, DWORD);
    DWORD CharLowerBuffW(LPWSTR, DWORD);
    LPSTR CharNextA(LPCSTR);
    LPWSTR CharNextW(LPCWSTR);
    LPSTR CharNextExA(WORD, LPCSTR, DWORD);
    LPWSTR CharNextExW(WORD, LPCWSTR, DWORD);
    LPSTR CharPrevA(LPCSTR, LPCSTR);
    LPWSTR CharPrevW(LPCWSTR, LPCWSTR);
    LPSTR CharPrevExA(WORD, LPCSTR, LPCSTR, DWORD);
    LPWSTR CharPrevExW(WORD, LPCWSTR, LPCWSTR, DWORD);
    BOOL CharToOemA(LPCSTR, LPSTR);
    BOOL CharToOemW(LPCWSTR, LPSTR);
    BOOL CharToOemBuffA(LPCSTR, LPSTR, DWORD);
    BOOL CharToOemBuffW(LPCWSTR, LPSTR, DWORD);
    LPSTR CharUpperA(LPSTR);
    LPWSTR CharUpperW(LPWSTR);
    DWORD CharUpperBuffA(LPSTR, DWORD);
    DWORD CharUpperBuffW(LPWSTR, DWORD);
    BOOL CheckDlgButton(HWND, int, UINT);
    DWORD CheckMenuItem(HMENU, UINT, UINT);
    BOOL CheckMenuRadioItem(HMENU, UINT, UINT, UINT, UINT);
    BOOL CheckRadioButton(HWND, int, int, int);
    HWND ChildWindowFromPoint(HWND, POINT);
    HWND ChildWindowFromPointEx(HWND, POINT, UINT);
    BOOL ClientToScreen(HWND, LPPOINT);
    BOOL ClipCursor(LPCRECT);
    BOOL CloseClipboard();
    BOOL CloseDesktop(HDESK);
    BOOL CloseWindow(HWND);
    BOOL CloseWindowStation(HWINSTA);
    int CopyAcceleratorTableA(HACCEL, LPACCEL, int);
    int CopyAcceleratorTableW(HACCEL, LPACCEL, int);

    HICON CopyIcon(HICON);
    HANDLE CopyImage(HANDLE, UINT, int, int, UINT);
    BOOL CopyRect(LPRECT, LPCRECT);
    int CountClipboardFormats();
    HACCEL CreateAcceleratorTableA(LPACCEL, int);
    HACCEL CreateAcceleratorTableW(LPACCEL, int);
    BOOL CreateCaret(HWND, HBITMAP, int, int);
    HCURSOR CreateCursor(HINSTANCE, int, int, int, int, PCVOID, PCVOID);

    HDESK CreateDesktopA(LPCSTR, LPCSTR, LPDEVMODEA, DWORD, ACCESS_MASK, LPSECURITY_ATTRIBUTES);
    HDESK CreateDesktopW(LPCWSTR, LPCWSTR, LPDEVMODEW, DWORD, ACCESS_MASK, LPSECURITY_ATTRIBUTES);

    HWND CreateDialogParamA(HINSTANCE, LPCSTR, HWND, DLGPROC, LPARAM);
    HWND CreateDialogParamW(HINSTANCE, LPCWSTR, HWND, DLGPROC, LPARAM);
    HWND CreateDialogIndirectParamA(HINSTANCE, LPCDLGTEMPLATE, HWND, DLGPROC, LPARAM);
    HWND CreateDialogIndirectParamW(HINSTANCE, LPCDLGTEMPLATE, HWND, DLGPROC, LPARAM);

    HICON CreateIcon(HINSTANCE, int, int, BYTE, BYTE, const(BYTE)*, BYTE*);
    HICON CreateIconFromResource(PBYTE, DWORD, BOOL, DWORD);
    HICON CreateIconFromResourceEx(PBYTE, DWORD, BOOL, DWORD, int, int, UINT);
    HICON CreateIconIndirect(PICONINFO);
    HWND CreateMDIWindowA(LPCSTR, LPCSTR, DWORD, int, int, int, int, HWND, HINSTANCE, LPARAM);
    HWND CreateMDIWindowW(LPCWSTR, LPCWSTR, DWORD, int, int, int, int, HWND, HINSTANCE, LPARAM);
    HMENU CreateMenu();
    HMENU CreatePopupMenu();

    HWND CreateWindowExA(DWORD, LPCSTR, LPCSTR, DWORD, int, int, int, int, HWND, HMENU, HINSTANCE, LPVOID);
    HWND CreateWindowExW(DWORD, LPCWSTR, LPCWSTR, DWORD, int, int, int, int, HWND, HMENU, HINSTANCE, LPVOID);

    HWINSTA CreateWindowStationA(LPSTR, DWORD, DWORD, LPSECURITY_ATTRIBUTES);
    HWINSTA CreateWindowStationW(LPWSTR, DWORD, DWORD, LPSECURITY_ATTRIBUTES);
    LRESULT DefDlgProcA(HWND, UINT, WPARAM, LPARAM);
    LRESULT DefDlgProcW(HWND, UINT, WPARAM, LPARAM);
    HDWP DeferWindowPos(HDWP, HWND, HWND, int, int, int, int, UINT);
    LRESULT DefFrameProcA(HWND, HWND, UINT, WPARAM, LPARAM);
    LRESULT DefFrameProcW(HWND, HWND, UINT, WPARAM, LPARAM);

    LRESULT DefMDIChildProcA(HWND, UINT, WPARAM, LPARAM);
    LRESULT DefMDIChildProcW(HWND, UINT, WPARAM, LPARAM);
    LRESULT DefWindowProcA(HWND, UINT, WPARAM, LPARAM);
    LRESULT DefWindowProcW(HWND, UINT, WPARAM, LPARAM);
    BOOL DeleteMenu(HMENU, UINT, UINT);
    BOOL DeregisterShellHookWindow(HWND);
    BOOL DestroyAcceleratorTable(HACCEL);
    BOOL DestroyCaret();
    BOOL DestroyCursor(HCURSOR);
    BOOL DestroyIcon(HICON);
    BOOL DestroyMenu(HMENU);
    BOOL DestroyWindow(HWND);

    INT_PTR DialogBoxParamA(HINSTANCE, LPCSTR, HWND, DLGPROC, LPARAM);
    INT_PTR DialogBoxParamW(HINSTANCE, LPCWSTR, HWND, DLGPROC, LPARAM);
    INT_PTR DialogBoxIndirectParamA(HINSTANCE, LPCDLGTEMPLATE, HWND, DLGPROC, LPARAM);
    INT_PTR DialogBoxIndirectParamW(HINSTANCE, LPCDLGTEMPLATE, HWND, DLGPROC, LPARAM);

} // extern (Windows)

nothrow @nogc {
    HCURSOR CopyCursor(HCURSOR c) {
        return cast(HCURSOR)CopyIcon(cast(HICON)c);
    }

    HWND CreateDialogA(HINSTANCE h, LPCSTR n, HWND w, DLGPROC f) {
        return CreateDialogParamA(h, n, w, f, 0);
    }

    HWND CreateDialogW(HINSTANCE h, LPCWSTR n, HWND w, DLGPROC f) {
        return CreateDialogParamW(h, n, w, f, 0);
    }

    HWND CreateDialogIndirectA(HINSTANCE h, LPCDLGTEMPLATE t, HWND w, DLGPROC f) {
        return CreateDialogIndirectParamA(h, t, w, f, 0);
    }

    HWND CreateDialogIndirectW(HINSTANCE h, LPCDLGTEMPLATE t, HWND w, DLGPROC f) {
        return CreateDialogIndirectParamW(h, t, w, f, 0);
    }

    HWND CreateWindowA(LPCSTR a, LPCSTR b, DWORD c, int d, int e, int f, int g, HWND h, HMENU i, HINSTANCE j, LPVOID k) {
        return CreateWindowExA(0, a, b, c, d, e, f, g, h, i, j, k);
    }

    HWND CreateWindowW(LPCWSTR a, LPCWSTR b, DWORD c, int d, int e, int f, int g, HWND h, HMENU i, HINSTANCE j, LPVOID k) {
        return CreateWindowExW(0, a, b, c, d, e, f, g, h, i, j, k);
    }

    INT_PTR DialogBoxA(HINSTANCE i, LPCSTR t, HWND p, DLGPROC f) {
        return DialogBoxParamA(i, t, p, f, 0);
    }

    INT_PTR DialogBoxW(HINSTANCE i, LPCWSTR t, HWND p, DLGPROC f) {
        return DialogBoxParamW(i, t, p, f, 0);
    }

    INT_PTR DialogBoxIndirectA(HINSTANCE i, LPCDLGTEMPLATE t, HWND p, DLGPROC f) {
        return DialogBoxIndirectParamA(i, t, p, f, 0);
    }

    INT_PTR DialogBoxIndirectW(HINSTANCE i, LPCDLGTEMPLATE t, HWND p, DLGPROC f) {
        return DialogBoxIndirectParamW(i, t, p, f, 0);
    }

    BOOL ExitWindows(UINT r, DWORD c) {
        return ExitWindowsEx(EWX_LOGOFF, 0);
    }
}
alias GetWindow GetNextWindow;

extern (Windows) nothrow @nogc:
LONG DispatchMessageA(const(MSG)*);
LONG DispatchMessageW(const(MSG)*);
int DlgDirListA(HWND, LPSTR, int, int, UINT);
int DlgDirListW(HWND, LPWSTR, int, int, UINT);
int DlgDirListComboBoxA(HWND, LPSTR, int, int, UINT);
int DlgDirListComboBoxW(HWND, LPWSTR, int, int, UINT);
BOOL DlgDirSelectComboBoxExA(HWND, LPSTR, int, int);
BOOL DlgDirSelectComboBoxExW(HWND, LPWSTR, int, int);
BOOL DlgDirSelectExA(HWND, LPSTR, int, int);
BOOL DlgDirSelectExW(HWND, LPWSTR, int, int);
BOOL DragDetect(HWND, POINT);
DWORD DragObject(HWND, HWND, UINT, ULONG_PTR, HCURSOR);
BOOL DrawAnimatedRects(HWND, int, LPCRECT, LPCRECT);
BOOL DrawCaption(HWND, HDC, LPCRECT, UINT);
BOOL DrawEdge(HDC, LPRECT, UINT, UINT);
BOOL DrawFocusRect(HDC, LPCRECT);
BOOL DrawFrameControl(HDC, LPRECT, UINT, UINT);
BOOL DrawIcon(HDC, int, int, HICON);
BOOL DrawIconEx(HDC, int, int, HICON, int, int, UINT, HBRUSH, UINT);
BOOL DrawMenuBar(HWND);
BOOL DrawStateA(HDC, HBRUSH, DRAWSTATEPROC, LPARAM, WPARAM, int, int, int, int, UINT);
BOOL DrawStateW(HDC, HBRUSH, DRAWSTATEPROC, LPARAM, WPARAM, int, int, int, int, UINT);
int DrawTextA(HDC, LPCSTR, int, LPRECT, UINT);
int DrawTextW(HDC, LPCWSTR, int, LPRECT, UINT);
int DrawTextExA(HDC, LPSTR, int, LPRECT, UINT, LPDRAWTEXTPARAMS);
int DrawTextExW(HDC, LPWSTR, int, LPRECT, UINT, LPDRAWTEXTPARAMS);
BOOL EmptyClipboard();
BOOL EnableMenuItem(HMENU, UINT, UINT);
BOOL EnableScrollBar(HWND, UINT, UINT);
BOOL EnableWindow(HWND, BOOL);
BOOL EndDeferWindowPos(HDWP);
BOOL EndDialog(HWND, INT_PTR);
BOOL EndMenu();
BOOL EndPaint(HWND, const(PAINTSTRUCT)*);
BOOL EnumChildWindows(HWND, ENUMWINDOWSPROC, LPARAM);
UINT EnumClipboardFormats(UINT);
BOOL EnumDesktopsA(HWINSTA, DESKTOPENUMPROCA, LPARAM);
BOOL EnumDesktopsW(HWINSTA, DESKTOPENUMPROCW, LPARAM);
BOOL EnumDesktopWindows(HDESK, ENUMWINDOWSPROC, LPARAM);
BOOL EnumDisplaySettingsA(LPCSTR, DWORD, PDEVMODEA);
BOOL EnumDisplaySettingsW(LPCWSTR, DWORD, PDEVMODEW);

BOOL EnumDisplayDevicesA(LPCSTR, DWORD, PDISPLAY_DEVICEA, DWORD);
BOOL EnumDisplayDevicesW(LPCWSTR, DWORD, PDISPLAY_DEVICEW, DWORD);

int EnumPropsA(HWND, PROPENUMPROCA);
int EnumPropsW(HWND, PROPENUMPROCW);
int EnumPropsExA(HWND, PROPENUMPROCEXA, LPARAM);
int EnumPropsExW(HWND, PROPENUMPROCEXW, LPARAM);

BOOL EnumThreadWindows(DWORD, WNDENUMPROC, LPARAM);
BOOL EnumWindows(WNDENUMPROC, LPARAM);
BOOL EnumWindowStationsA(WINSTAENUMPROCA, LPARAM);
BOOL EnumWindowStationsW(WINSTAENUMPROCW, LPARAM);
BOOL EqualRect(LPCRECT, LPCRECT);

BOOL ExitWindowsEx(UINT, DWORD);
HWND FindWindowA(LPCSTR, LPCSTR);
HWND FindWindowExA(HWND, HWND, LPCSTR, LPCSTR);
HWND FindWindowExW(HWND, HWND, LPCWSTR, LPCWSTR);
HWND FindWindowW(LPCWSTR, LPCWSTR);
BOOL FlashWindow(HWND, BOOL);

int FrameRect(HDC, LPCRECT, HBRUSH);
BOOL FrameRgn(HDC, HRGN, HBRUSH, int, int);
HWND GetActiveWindow();
HWND GetAncestor(HWND, UINT);
SHORT GetAsyncKeyState(int);
HWND GetCapture();
UINT GetCaretBlinkTime();
BOOL GetCaretPos(LPPOINT);
BOOL GetClassInfoA(HINSTANCE, LPCSTR, LPWNDCLASSA);
BOOL GetClassInfoExA(HINSTANCE, LPCSTR, LPWNDCLASSEXA);
BOOL GetClassInfoW(HINSTANCE, LPCWSTR, LPWNDCLASSW);
BOOL GetClassInfoExW(HINSTANCE, LPCWSTR, LPWNDCLASSEXW);
DWORD GetClassLongA(HWND, int);
DWORD GetClassLongW(HWND, int);
int GetClassNameA(HWND, LPSTR, int);
int GetClassNameW(HWND, LPWSTR, int);
WORD GetClassWord(HWND, int);
BOOL GetClientRect(HWND, LPRECT);
HANDLE GetClipboardData(UINT);
int GetClipboardFormatNameA(UINT, LPSTR, int);
int GetClipboardFormatNameW(UINT, LPWSTR, int);
HWND GetClipboardOwner();
HWND GetClipboardViewer();
BOOL GetClipCursor(LPRECT);
BOOL GetCursorPos(LPPOINT);
HDC GetDC(HWND);
HDC GetDCEx(HWND, HRGN, DWORD);
HWND GetDesktopWindow();
int GetDialogBaseUnits();
int GetDlgCtrlID(HWND);
HWND GetDlgItem(HWND, int);
UINT GetDlgItemInt(HWND, int, PBOOL, BOOL);
UINT GetDlgItemTextA(HWND, int, LPSTR, int);
UINT GetDlgItemTextW(HWND, int, LPWSTR, int);
UINT GetDoubleClickTime();
HWND GetFocus();
HWND GetForegroundWindow();

BOOL GetIconInfo(HICON, PICONINFO);
BOOL GetInputState();
UINT GetKBCodePage();
HKL GetKeyboardLayout(DWORD);
UINT GetKeyboardLayoutList(int, HKL*);
BOOL GetKeyboardLayoutNameA(LPSTR);
BOOL GetKeyboardLayoutNameW(LPWSTR);
BOOL GetKeyboardState(PBYTE);
int GetKeyboardType(int);
int GetKeyNameTextA(LONG, LPSTR, int);
int GetKeyNameTextW(LONG, LPWSTR, int);
SHORT GetKeyState(int);
HWND GetLastActivePopup(HWND);
HMENU GetMenu(HWND);
LONG GetMenuCheckMarkDimensions();
DWORD GetMenuContextHelpId(HMENU);
UINT GetMenuDefaultItem(HMENU, UINT, UINT);
int GetMenuItemCount(HMENU);
UINT GetMenuItemID(HMENU, int);
BOOL GetMenuItemInfoA(HMENU, UINT, BOOL, LPMENUITEMINFOA);
BOOL GetMenuItemInfoW(HMENU, UINT, BOOL, LPMENUITEMINFOW);
BOOL GetMenuItemRect(HWND, HMENU, UINT, LPRECT);
UINT GetMenuState(HMENU, UINT, UINT);
int GetMenuStringA(HMENU, UINT, LPSTR, int, UINT);
int GetMenuStringW(HMENU, UINT, LPWSTR, int, UINT);
BOOL GetMessageA(LPMSG, HWND, UINT, UINT);
BOOL GetMessageW(LPMSG, HWND, UINT, UINT);
LONG GetMessageExtraInfo();
DWORD GetMessagePos();
LONG GetMessageTime();

HWND GetNextDlgGroupItem(HWND, HWND, BOOL);
HWND GetNextDlgTabItem(HWND, HWND, BOOL);

HWND GetOpenClipboardWindow();
HWND GetParent(HWND);
int GetPriorityClipboardFormat(UINT*, int);
HANDLE GetPropA(HWND, LPCSTR);
HANDLE GetPropW(HWND, LPCWSTR);

DWORD GetQueueStatus(UINT);
BOOL GetScrollInfo(HWND, int, LPSCROLLINFO);
int GetScrollPos(HWND, int);
BOOL GetScrollRange(HWND, int, LPINT, LPINT);

HMENU GetSubMenu(HMENU, int);
DWORD GetSysColor(int);
HBRUSH GetSysColorBrush(int);

HMENU GetSystemMenu(HWND, BOOL);
int GetSystemMetrics(int);
DWORD GetTabbedTextExtentA(HDC, LPCSTR, int, int, LPINT);
DWORD GetTabbedTextExtentW(HDC, LPCWSTR, int, int, LPINT);
LONG GetWindowLongA(HWND, int);
LONG GetWindowLongW(HWND, int);

HDESK GetThreadDesktop(DWORD);
HWND GetTopWindow(HWND);
BOOL GetUpdateRect(HWND, LPRECT, BOOL);
int GetUpdateRgn(HWND, HRGN, BOOL);
BOOL GetUserObjectInformationA(HANDLE, int, PVOID, DWORD, PDWORD);
BOOL GetUserObjectInformationW(HANDLE, int, PVOID, DWORD, PDWORD);
BOOL GetUserObjectSecurity(HANDLE, PSECURITY_INFORMATION, PSECURITY_DESCRIPTOR, DWORD, PDWORD);
HWND GetWindow(HWND, UINT);
DWORD GetWindowContextHelpId(HWND);
HDC GetWindowDC(HWND);
BOOL GetWindowPlacement(HWND, WINDOWPLACEMENT*);
BOOL GetWindowRect(HWND, LPRECT);
int GetWindowRgn(HWND, HRGN);
int GetWindowTextA(HWND, LPSTR, int);
int GetWindowTextLengthA(HWND);
int GetWindowTextLengthW(HWND);
int GetWindowTextW(HWND, LPWSTR, int);
WORD GetWindowWord(HWND, int);
BOOL GetAltTabInfoA(HWND, int, PALTTABINFO, LPSTR, UINT);
BOOL GetAltTabInfoW(HWND, int, PALTTABINFO, LPWSTR, UINT);
BOOL GetComboBoxInfo(HWND, PCOMBOBOXINFO);
BOOL GetCursorInfo(PCURSORINFO);
BOOL GetLastInputInfo(PLASTINPUTINFO);
DWORD GetListBoxInfo(HWND);
BOOL GetMenuBarInfo(HWND, LONG, LONG, PMENUBARINFO);
BOOL GetMenuInfo(HMENU, LPMENUINFO);
BOOL GetScrollBarInfo(HWND, LONG, PSCROLLBARINFO);
BOOL GetTitleBarInfo(HWND, PTITLEBARINFO);
BOOL GetWindowInfo(HWND, PWINDOWINFO);
UINT GetWindowModuleFileNameA(HWND, LPSTR, UINT);
UINT GetWindowModuleFileNameW(HWND, LPWSTR, UINT);
BOOL GrayStringA(HDC, HBRUSH, GRAYSTRINGPROC, LPARAM, int, int, int, int, int);
BOOL GrayStringW(HDC, HBRUSH, GRAYSTRINGPROC, LPARAM, int, int, int, int, int);
BOOL HideCaret(HWND);
BOOL HiliteMenuItem(HWND, HMENU, UINT, UINT);
BOOL InflateRect(LPRECT, int, int);
BOOL InSendMessage();
BOOL InsertMenuA(HMENU, UINT, UINT, UINT_PTR, LPCSTR);
BOOL InsertMenuW(HMENU, UINT, UINT, UINT_PTR, LPCWSTR);
BOOL InsertMenuItemA(HMENU, UINT, BOOL, LPCMENUITEMINFOA);
BOOL InsertMenuItemW(HMENU, UINT, BOOL, LPCMENUITEMINFOW);
INT InternalGetWindowText(HWND, LPWSTR, INT);
BOOL IntersectRect(LPRECT, LPCRECT, LPCRECT);
BOOL InvalidateRect(HWND, LPCRECT, BOOL);
BOOL InvalidateRgn(HWND, HRGN, BOOL);
BOOL InvertRect(HDC, LPCRECT);
BOOL IsCharAlphaA(CHAR ch);
BOOL IsCharAlphaNumericA(CHAR);
BOOL IsCharAlphaNumericW(WCHAR);
BOOL IsCharAlphaW(WCHAR);
BOOL IsCharLowerA(CHAR);
BOOL IsCharLowerW(WCHAR);
BOOL IsCharUpperA(CHAR);
BOOL IsCharUpperW(WCHAR);
BOOL IsChild(HWND, HWND);
BOOL IsClipboardFormatAvailable(UINT);
BOOL IsDialogMessageA(HWND, LPMSG);
BOOL IsDialogMessageW(HWND, LPMSG);
UINT IsDlgButtonChecked(HWND, int);
BOOL IsIconic(HWND);
BOOL IsMenu(HMENU);
BOOL IsRectEmpty(LPCRECT);
BOOL IsWindow(HWND);
BOOL IsWindowEnabled(HWND);
BOOL IsWindowUnicode(HWND);
BOOL IsWindowVisible(HWND);
BOOL IsZoomed(HWND);
void keybd_event(BYTE, BYTE, DWORD, ULONG_PTR);
BOOL KillTimer(HWND, UINT_PTR);
HACCEL LoadAcceleratorsA(HINSTANCE, LPCSTR);
HACCEL LoadAcceleratorsW(HINSTANCE, LPCWSTR);
HBITMAP LoadBitmapA(HINSTANCE, LPCSTR);
HBITMAP LoadBitmapW(HINSTANCE, LPCWSTR);
HCURSOR LoadCursorA(HINSTANCE, LPCSTR);
HCURSOR LoadCursorFromFileA(LPCSTR);
HCURSOR LoadCursorFromFileW(LPCWSTR);
HCURSOR LoadCursorW(HINSTANCE, LPCWSTR);
HICON LoadIconA(HINSTANCE, LPCSTR);
HICON LoadIconW(HINSTANCE, LPCWSTR);
HANDLE LoadImageA(HINSTANCE, LPCSTR, UINT, int, int, UINT);
HANDLE LoadImageW(HINSTANCE, LPCWSTR, UINT, int, int, UINT);
HKL LoadKeyboardLayoutA(LPCSTR, UINT);
HKL LoadKeyboardLayoutW(LPCWSTR, UINT);
HMENU LoadMenuA(HINSTANCE, LPCSTR);
HMENU LoadMenuIndirectA(const(MENUTEMPLATE)*);
HMENU LoadMenuIndirectW(const(MENUTEMPLATE)*);
HMENU LoadMenuW(HINSTANCE, LPCWSTR);
int LoadStringA(HINSTANCE, UINT, LPSTR, int);
int LoadStringW(HINSTANCE, UINT, LPWSTR, int);
BOOL LockWindowUpdate(HWND);
int LookupIconIdFromDirectory(PBYTE, BOOL);
int LookupIconIdFromDirectoryEx(PBYTE, BOOL, int, int, UINT);
BOOL MapDialogRect(HWND, LPRECT);
UINT MapVirtualKeyA(UINT, UINT);
UINT MapVirtualKeyExA(UINT, UINT, HKL);
UINT MapVirtualKeyExW(UINT, UINT, HKL);
UINT MapVirtualKeyW(UINT, UINT);
int MapWindowPoints(HWND, HWND, LPPOINT, UINT);
int MenuItemFromPoint(HWND, HMENU, POINT);
BOOL MessageBeep(UINT);
int MessageBoxA(HWND, LPCSTR, LPCSTR, UINT);
int MessageBoxW(HWND, LPCWSTR, LPCWSTR, UINT);
int MessageBoxExA(HWND, LPCSTR, LPCSTR, UINT, WORD);
int MessageBoxExW(HWND, LPCWSTR, LPCWSTR, UINT, WORD);
int MessageBoxIndirectA(const(MSGBOXPARAMSA)*);
int MessageBoxIndirectW(const(MSGBOXPARAMSW)*);
BOOL ModifyMenuA(HMENU, UINT, UINT, UINT_PTR, LPCSTR);
BOOL ModifyMenuW(HMENU, UINT, UINT, UINT_PTR, LPCWSTR);
void mouse_event(DWORD, DWORD, DWORD, DWORD, ULONG_PTR);
BOOL MoveWindow(HWND, int, int, int, int, BOOL);
DWORD MsgWaitForMultipleObjects(DWORD, const(HANDLE)*, BOOL, DWORD, DWORD);
DWORD MsgWaitForMultipleObjectsEx(DWORD, const(HANDLE)*, DWORD, DWORD, DWORD);
DWORD OemKeyScan(WORD);
BOOL OemToCharA(LPCSTR, LPSTR);
BOOL OemToCharBuffA(LPCSTR, LPSTR, DWORD);
BOOL OemToCharBuffW(LPCSTR, LPWSTR, DWORD);
BOOL OemToCharW(LPCSTR, LPWSTR);
BOOL OffsetRect(LPRECT, int, int);
BOOL OpenClipboard(HWND);
HDESK OpenDesktopA(LPSTR, DWORD, BOOL, DWORD);
HDESK OpenDesktopW(LPWSTR, DWORD, BOOL, DWORD);
BOOL OpenIcon(HWND);
HDESK OpenInputDesktop(DWORD, BOOL, DWORD);
HWINSTA OpenWindowStationA(LPSTR, BOOL, DWORD);
HWINSTA OpenWindowStationW(LPWSTR, BOOL, DWORD);
BOOL PaintDesktop(HDC);
BOOL PeekMessageA(LPMSG, HWND, UINT, UINT, UINT);
BOOL PeekMessageW(LPMSG, HWND, UINT, UINT, UINT);
BOOL PostMessageA(HWND, UINT, WPARAM, LPARAM);
BOOL PostMessageW(HWND, UINT, WPARAM, LPARAM);
void PostQuitMessage(int);
BOOL PostThreadMessageA(DWORD, UINT, WPARAM, LPARAM);
BOOL PostThreadMessageW(DWORD, UINT, WPARAM, LPARAM);
BOOL PtInRect(LPCRECT, POINT);
HWND RealChildWindowFromPoint(HWND, POINT);
UINT RealGetWindowClassA(HWND, LPSTR, UINT);
UINT RealGetWindowClassW(HWND, LPWSTR, UINT);
BOOL RedrawWindow(HWND, LPCRECT, HRGN, UINT);
ATOM RegisterClassA(const(WNDCLASSA)*);
ATOM RegisterClassW(const(WNDCLASSW)*);
ATOM RegisterClassExA(const(WNDCLASSEXA)*);
ATOM RegisterClassExW(const(WNDCLASSEXW)*);
UINT RegisterClipboardFormatA(LPCSTR);
UINT RegisterClipboardFormatW(LPCWSTR);
BOOL RegisterHotKey(HWND, int, UINT, UINT);
UINT RegisterWindowMessageA(LPCSTR);
UINT RegisterWindowMessageW(LPCWSTR);
BOOL ReleaseCapture();
int ReleaseDC(HWND, HDC);
BOOL RemoveMenu(HMENU, UINT, UINT);
HANDLE RemovePropA(HWND, LPCSTR);
HANDLE RemovePropW(HWND, LPCWSTR);
BOOL ReplyMessage(LRESULT);
BOOL ScreenToClient(HWND, LPPOINT);
BOOL ScrollDC(HDC, int, int, LPCRECT, LPCRECT, HRGN, LPRECT);
BOOL ScrollWindow(HWND, int, int, LPCRECT, LPCRECT);
int ScrollWindowEx(HWND, int, int, LPCRECT, LPCRECT, HRGN, LPRECT, UINT);
LONG SendDlgItemMessageA(HWND, int, UINT, WPARAM, LPARAM);
LONG SendDlgItemMessageW(HWND, int, UINT, WPARAM, LPARAM);
LRESULT SendMessageA(HWND, UINT, WPARAM, LPARAM);
BOOL SendMessageCallbackA(HWND, UINT, WPARAM, LPARAM, SENDASYNCPROC, ULONG_PTR);
BOOL SendMessageCallbackW(HWND, UINT, WPARAM, LPARAM, SENDASYNCPROC, ULONG_PTR);
LRESULT SendMessageTimeoutA(HWND, UINT, WPARAM, LPARAM, UINT, UINT, PDWORD);
LRESULT SendMessageTimeoutW(HWND, UINT, WPARAM, LPARAM, UINT, UINT, PDWORD);
LRESULT SendMessageW(HWND, UINT, WPARAM, LPARAM);
BOOL SendNotifyMessageA(HWND, UINT, WPARAM, LPARAM);
BOOL SendNotifyMessageW(HWND, UINT, WPARAM, LPARAM);
HWND SetActiveWindow(HWND);
HWND SetCapture(HWND hWnd);
BOOL SetCaretBlinkTime(UINT);
BOOL SetCaretPos(int, int);
DWORD SetClassLongA(HWND, int, LONG);
DWORD SetClassLongW(HWND, int, LONG);
WORD SetClassWord(HWND, int, WORD);
HANDLE SetClipboardData(UINT, HANDLE);
HWND SetClipboardViewer(HWND);
HCURSOR SetCursor(HCURSOR);
BOOL SetCursorPos(int, int);
void SetDebugErrorLevel(DWORD);
BOOL SetDlgItemInt(HWND, int, UINT, BOOL);
BOOL SetDlgItemTextA(HWND, int, LPCSTR);
BOOL SetDlgItemTextW(HWND, int, LPCWSTR);
BOOL SetDoubleClickTime(UINT);
HWND SetFocus(HWND);
BOOL SetForegroundWindow(HWND);
BOOL SetKeyboardState(PBYTE);
BOOL SetMenu(HWND, HMENU);
BOOL SetMenuContextHelpId(HMENU, DWORD);
BOOL SetMenuDefaultItem(HMENU, UINT, UINT);
BOOL SetMenuInfo(HMENU, LPCMENUINFO);
BOOL SetMenuItemBitmaps(HMENU, UINT, UINT, HBITMAP, HBITMAP);
BOOL SetMenuItemInfoA(HMENU, UINT, BOOL, LPCMENUITEMINFOA);
BOOL SetMenuItemInfoW(HMENU, UINT, BOOL, LPCMENUITEMINFOW);
LPARAM SetMessageExtraInfo(LPARAM);
BOOL SetMessageQueue(int);
HWND SetParent(HWND, HWND);
BOOL SetProcessWindowStation(HWINSTA);
BOOL SetPropA(HWND, LPCSTR, HANDLE);
BOOL SetPropW(HWND, LPCWSTR, HANDLE);
BOOL SetRect(LPRECT, int, int, int, int);
BOOL SetRectEmpty(LPRECT);
int SetScrollInfo(HWND, int, LPCSCROLLINFO, BOOL);
int SetScrollPos(HWND, int, int, BOOL);
BOOL SetScrollRange(HWND, int, int, int, BOOL);
BOOL SetSysColors(int, const(INT)*, const(COLORREF)*);
BOOL SetSystemCursor(HCURSOR, DWORD);
BOOL SetThreadDesktop(HDESK);
UINT_PTR SetTimer(HWND, UINT_PTR, UINT, TIMERPROC);
BOOL SetUserObjectInformationA(HANDLE, int, PVOID, DWORD);
BOOL SetUserObjectInformationW(HANDLE, int, PVOID, DWORD);
BOOL SetUserObjectSecurity(HANDLE, PSECURITY_INFORMATION, PSECURITY_DESCRIPTOR);
BOOL SetWindowContextHelpId(HWND, DWORD);
LONG SetWindowLongA(HWND, int, LONG);
LONG SetWindowLongW(HWND, int, LONG);
BOOL SetWindowPlacement(HWND hWnd, const(WINDOWPLACEMENT)*);
BOOL SetWindowPos(HWND, HWND, int, int, int, int, UINT);
int SetWindowRgn(HWND, HRGN, BOOL);
HHOOK SetWindowsHookA(int, HOOKPROC);
HHOOK SetWindowsHookW(int, HOOKPROC);
HHOOK SetWindowsHookExA(int, HOOKPROC, HINSTANCE, DWORD);
HHOOK SetWindowsHookExW(int, HOOKPROC, HINSTANCE, DWORD);
BOOL SetWindowTextA(HWND, LPCSTR);
BOOL SetWindowTextW(HWND, LPCWSTR);
WORD SetWindowWord(HWND, int, WORD);
BOOL ShowCaret(HWND);
int ShowCursor(BOOL);
BOOL ShowOwnedPopups(HWND, BOOL);
BOOL ShowScrollBar(HWND, int, BOOL);
BOOL ShowWindow(HWND, int);
BOOL ShowWindowAsync(HWND, int);
BOOL SubtractRect(LPRECT, LPCRECT, LPCRECT);
BOOL SwapMouseButton(BOOL);
BOOL SwitchDesktop(HDESK);
BOOL SystemParametersInfoA(UINT, UINT, PVOID, UINT);
BOOL SystemParametersInfoW(UINT, UINT, PVOID, UINT);
LONG TabbedTextOutA(HDC, int, int, LPCSTR, int, int, LPINT, int);
LONG TabbedTextOutW(HDC, int, int, LPCWSTR, int, int, LPINT, int);
WORD TileWindows(HWND, UINT, LPCRECT, UINT, const(HWND)*);
int ToAscii(UINT, UINT, PBYTE, LPWORD, UINT);
int ToAsciiEx(UINT, UINT, PBYTE, LPWORD, UINT, HKL);
int ToUnicode(UINT, UINT, PBYTE, LPWSTR, int, UINT);
int ToUnicodeEx(UINT, UINT, PBYTE, LPWSTR, int, UINT, HKL);
BOOL TrackMouseEvent(LPTRACKMOUSEEVENT);
BOOL TrackPopupMenu(HMENU, UINT, int, int, int, HWND, LPCRECT);
BOOL TrackPopupMenuEx(HMENU, UINT, int, int, HWND, LPTPMPARAMS);
int TranslateAcceleratorA(HWND, HACCEL, LPMSG);
int TranslateAcceleratorW(HWND, HACCEL, LPMSG);
BOOL TranslateMDISysAccel(HWND, LPMSG);
BOOL TranslateMessage(const(MSG)*);
BOOL UnhookWindowsHook(int, HOOKPROC);
BOOL UnhookWindowsHookEx(HHOOK);
BOOL UnionRect(LPRECT, LPCRECT, LPCRECT);
BOOL UnloadKeyboardLayout(HKL);
BOOL UnregisterClassA(LPCSTR, HINSTANCE);
BOOL UnregisterClassW(LPCWSTR, HINSTANCE);
BOOL UnregisterHotKey(HWND, int);
BOOL UpdateWindow(HWND);
BOOL ValidateRect(HWND, LPCRECT);
BOOL ValidateRgn(HWND, HRGN);
SHORT VkKeyScanA(CHAR);
SHORT VkKeyScanExA(CHAR, HKL);
SHORT VkKeyScanExW(WCHAR, HKL);
SHORT VkKeyScanW(WCHAR);
DWORD WaitForInputIdle(HANDLE, DWORD);
BOOL WaitMessage();
HWND WindowFromDC(HDC hDC);
HWND WindowFromPoint(POINT);
UINT WinExec(LPCSTR, UINT);
BOOL WinHelpA(HWND, LPCSTR, UINT, ULONG_PTR);
BOOL WinHelpW(HWND, LPCWSTR, UINT, ULONG_PTR);

extern (C) {
    int wsprintfA(LPSTR, LPCSTR, ...);
    int wsprintfW(LPWSTR, LPCWSTR, ...);
}


// These shouldn't be necessary for D.
alias char* va_list_;
int wvsprintfA(LPSTR, LPCSTR, va_list_ arglist);
int wvsprintfW(LPWSTR, LPCWSTR, va_list_ arglist);

enum : DWORD {
    MONITOR_DEFAULTTONULL,
    MONITOR_DEFAULTTOPRIMARY,
    MONITOR_DEFAULTTONEAREST // = 2
}
enum MONITORINFOF_PRIMARY = 1;

enum EDS_RAWMODE = 0x00000002;

enum {
    ISMEX_NOSEND   = 0,
    ISMEX_SEND     = 1,
    ISMEX_NOTIFY   = 2,
    ISMEX_CALLBACK = 4,
    ISMEX_REPLIED  = 8
}

struct TITLEBARINFO {
    DWORD cbSize = TITLEBARINFO.sizeof;
    RECT  rcTitleBar;
    DWORD[CCHILDREN_TITLEBAR+1] rgstate;
}
alias TITLEBARINFO* PTITLEBARINFO, LPTITLEBARINFO;

static if (_WIN32_WINNT >= 0x501) { // *** correct?
    struct FLASHWINFO {
        UINT  cbSize = this.sizeof;
        HWND  hwnd;
        DWORD dwFlags;
        UINT  uCount;
        DWORD dwTimeout;
    }
    alias FLASHWINFO* PFLASHWINFO;
}

enum DWORD ASFW_ANY = -1;
enum : UINT {
    LSFW_LOCK = 1,
    LSFW_UNLOCK
}
enum {
    GMMP_USE_DISPLAY_POINTS = 1,
    GMMP_USE_HIGH_RESOLUTION_POINTS
}

struct MOUSEMOVEPOINT {
    int x;
    int y;
    DWORD time;
    ULONG_PTR dwExtraInfo;
}
alias MOUSEMOVEPOINT* PMOUSEMOVEPOINT, LPMOUSEMOVEPOINT;

enum {
    MIM_MAXHEIGHT       =  1,
    MIM_BACKGROUND      =  2,
    MIM_HELPID          =  4,
    MIM_MENUDATA        =  8,
    MIM_STYLE           = 16,
    MIM_APPLYTOSUBMENUS = 0x80000000L
}

enum {
    MNS_NOCHECK     = 0x80000000,
    MNS_MODELESS    = 0x40000000,
    MNS_DRAGDROP    = 0x20000000,
    MNS_AUTODISMISS = 0x10000000,
    MNS_NOTIFYBYPOS = 0x08000000,
    MNS_CHECKORBMP  = 0x04000000
}

enum {
    PM_QS_INPUT       = (QS_INPUT << 16),
    PM_QS_POSTMESSAGE = ((QS_POSTMESSAGE | QS_HOTKEY | QS_TIMER) << 16),
    PM_QS_PAINT       = (QS_PAINT << 16),
    PM_QS_SENDMESSAGE = (QS_SENDMESSAGE << 16)
}
/*
#define WM_GETOBJECT 0x003D
#define WM_CHANGEUISTATE 0x0127
#define WM_UPDATEUISTATE 0x0128
#define WM_QUERYUISTATE 0x0129
#define WM_UNINITMENUPOPUP 0x0125
#define WM_MENURBUTTONUP 290
#define WM_MENUCOMMAND 0x0126
#define WM_MENUGETOBJECT 0x0124
#define WM_MENUDRAG 0x0123
#define WM_APPCOMMAND 0x0319
#define WM_NCXBUTTONDOWN 171
#define WM_NCXBUTTONUP 172
#define WM_NCXBUTTONDBLCLK 173
#define WM_NCMOUSEHOVER 0x02A0
#define WM_NCMOUSELEAVE 0x02A2*/

enum {
    FLASHW_STOP      = 0,
    FLASHW_CAPTION   = 0x01,
    FLASHW_TRAY      = 0x02,
    FLASHW_ALL       = 0x03,
    FLASHW_TIMER     = 0x04,
    FLASHW_TIMERNOFG = 0x0C
}

enum CHILDID_SELF = 0;

enum {
    OBJID_WINDOW   = 0x00000000,
    OBJID_SOUND    = 0xFFFFFFF5,
    OBJID_ALERT    = 0xFFFFFFF6,
    OBJID_CURSOR   = 0xFFFFFFF7,
    OBJID_CARET    = 0xFFFFFFF8,
    OBJID_SIZEGRIP = 0xFFFFFFF9,
    OBJID_HSCROLL  = 0xFFFFFFFA,
    OBJID_VSCROLL  = 0xFFFFFFFB,
    OBJID_CLIENT   = 0xFFFFFFFC,
    OBJID_MENU     = 0xFFFFFFFD,
    OBJID_TITLEBAR = 0xFFFFFFFE,
    OBJID_SYSMENU  = 0xFFFFFFFF
}

enum {
    GUI_CARETBLINKING  = 0x0001,
    GUI_INMOVESIZE     = 0x0002,
    GUI_INMENUMODE     = 0x0004,
    GUI_SYSTEMMENUMODE = 0x0008,
    GUI_POPUPMENUMODE  = 0x0010
}
static if (_WIN32_WINNT >= 0x501) {
    enum GUI_16BITTASK = 0x0020;
}

enum {
    WINEVENT_OUTOFCONTEXT   = 0x00,
    WINEVENT_SKIPOWNTHREAD  = 0x01,
    WINEVENT_SKIPOWNPROCESS = 0x02,
    WINEVENT_INCONTEXT      = 0x04
}

enum {
    AW_HOR_POSITIVE = 0x00000001,
    AW_HOR_NEGATIVE = 0x00000002,
    AW_VER_POSITIVE = 0x00000004,
    AW_VER_NEGATIVE = 0x00000008,
    AW_CENTER       = 0x00000010,
    AW_HIDE         = 0x00010000,
    AW_ACTIVATE     = 0x00020000,
    AW_SLIDE        = 0x00040000,
    AW_BLEND        = 0x00080000
}

enum {
    DEVICE_NOTIFY_WINDOW_HANDLE  = 0x00000000,
    DEVICE_NOTIFY_SERVICE_HANDLE = 0x00000001
}

static if (_WIN32_WINNT >= 0x501) {
    enum DEVICE_NOTIFY_ALL_INTERFACE_CLASSES = 0x00000004;
}

enum : DWORD {
    EVENT_MIN                          = 0x00000001,
    EVENT_SYSTEM_SOUND                 = 0x00000001,
    EVENT_SYSTEM_ALERT,
    EVENT_SYSTEM_FOREGROUND,
    EVENT_SYSTEM_MENUSTART,
    EVENT_SYSTEM_MENUEND,
    EVENT_SYSTEM_MENUPOPUPSTART,
    EVENT_SYSTEM_MENUPOPUPEND,
    EVENT_SYSTEM_CAPTURESTART,
    EVENT_SYSTEM_CAPTUREEND,
    EVENT_SYSTEM_MOVESIZESTART,
    EVENT_SYSTEM_MOVESIZEEND,
    EVENT_SYSTEM_CONTEXTHELPSTART,
    EVENT_SYSTEM_CONTEXTHELPEND,
    EVENT_SYSTEM_DRAGDROPSTART,
    EVENT_SYSTEM_DRAGDROPEND,
    EVENT_SYSTEM_DIALOGSTART,
    EVENT_SYSTEM_DIALOGEND,
    EVENT_SYSTEM_SCROLLINGSTART,
    EVENT_SYSTEM_SCROLLINGEND,
    EVENT_SYSTEM_SWITCHSTART,
    EVENT_SYSTEM_SWITCHEND,
    EVENT_SYSTEM_MINIMIZESTART,
    EVENT_SYSTEM_MINIMIZEEND,       // = 0x00000017
    EVENT_OBJECT_CREATE                = 0x00008000,
    EVENT_OBJECT_DESTROY,
    EVENT_OBJECT_SHOW,
    EVENT_OBJECT_HIDE,
    EVENT_OBJECT_REORDER,
    EVENT_OBJECT_FOCUS,
    EVENT_OBJECT_SELECTION,
    EVENT_OBJECT_SELECTIONADD,
    EVENT_OBJECT_SELECTIONREMOVE,
    EVENT_OBJECT_SELECTIONWITHIN,
    EVENT_OBJECT_STATECHANGE,
    EVENT_OBJECT_LOCATIONCHANGE,
    EVENT_OBJECT_NAMECHANGE,
    EVENT_OBJECT_DESCRIPTIONCHANGE,
    EVENT_OBJECT_VALUECHANGE,
    EVENT_OBJECT_PARENTCHANGE,
    EVENT_OBJECT_HELPCHANGE,
    EVENT_OBJECT_DEFACTIONCHANGE,
    EVENT_OBJECT_ACCELERATORCHANGE, // = 0x00008012
    EVENT_MAX                          = 0x7FFFFFFF
}

static if (_WIN32_WINNT >= 0x501) {
    enum : DWORD {
        EVENT_CONSOLE_CARET                = 0x00004000,
        EVENT_CONSOLE_UPDATE_REGION,
        EVENT_CONSOLE_UPDATE_SIMPLE,
        EVENT_CONSOLE_UPDATE_SCROLL,
        EVENT_CONSOLE_LAYOUT,
        EVENT_CONSOLE_START_APPLICATION,
        EVENT_CONSOLE_END_APPLICATION,  // = 0x00004007
    }

    enum : LONG {
        CONSOLE_CARET_SELECTION  = 1,
        CONSOLE_CARET_VISIBLE // = 2
    }
    enum LONG CONSOLE_APPLICATION_16BIT = 1;
}

enum {
    LWA_COLORKEY = 1,
    LWA_ALPHA
}
enum {
    ULW_COLORKEY = 1,
    ULW_ALPHA    = 2,
    ULW_OPAQUE   = 4
}
enum {
    GR_GDIOBJECTS,
    GR_USEROBJECTS
}

enum {
    XBUTTON1 = 1,
    XBUTTON2
}

struct GUITHREADINFO {
    DWORD cbSize = this.sizeof;
    DWORD flags;
    HWND  hwndActive;
    HWND  hwndFocus;
    HWND  hwndCapture;
    HWND  hwndMenuOwner;
    HWND  hwndMoveSize;
    HWND  hwndCaret;
    RECT  rcCaret;
}
alias GUITHREADINFO* PGUITHREADINFO, LPGUITHREADINFO;
extern (Windows) {
    alias void function(HWINEVENTHOOK, DWORD, HWND, LONG, LONG, DWORD, DWORD) WINEVENTPROC;
}
// *** line 4680 of MinGW 4.0
int BroadcastSystemMessageA(DWORD, LPDWORD, UINT, WPARAM, LPARAM);
int BroadcastSystemMessageW(DWORD, LPDWORD, UINT, WPARAM, LPARAM);

UINT SendInput(UINT, LPINPUT, int);
BOOL EnumDisplayMonitors(HDC, LPCRECT, MONITORENUMPROC, LPARAM);
BOOL GetMonitorInfoA(HMONITOR, LPMONITORINFO);
extern(D) BOOL GetMonitorInfoA(HMONITOR m, LPMONITORINFOEXA mi) { return GetMonitorInfoA(m, cast(LPMONITORINFO)mi); }
BOOL GetMonitorInfoW(HMONITOR, LPMONITORINFO);
extern(D) BOOL GetMonitorInfoW(HMONITOR m, LPMONITORINFOEXW mi) { return GetMonitorInfoW(m, cast(LPMONITORINFO)mi); }
HMONITOR MonitorFromPoint(POINT, DWORD);
HMONITOR MonitorFromRect(LPCRECT, DWORD);
HMONITOR MonitorFromWindow(HWND, DWORD);
BOOL AllowSetForegroundWindow(DWORD);
BOOL AnimateWindow(HWND, DWORD, DWORD);
BOOL EndTask(HWND, BOOL, BOOL);
BOOL EnumDisplaySettingsExA(LPCSTR, DWORD, LPDEVMODEA, DWORD);
BOOL EnumDisplaySettingsExW(LPCWSTR, DWORD, LPDEVMODEW, DWORD);
DWORD GetClipboardSequenceNumber();
DWORD GetGuiResources(HANDLE, DWORD);
BOOL GetGUIThreadInfo(DWORD, LPGUITHREADINFO);

int GetMouseMovePointsEx(UINT, LPMOUSEMOVEPOINT, LPMOUSEMOVEPOINT, int, DWORD);
BOOL GetProcessDefaultLayout(DWORD*);
HWND GetShellWindow();
BOOL IsHungAppWindow(HWND);
DWORD InSendMessageEx(LPVOID);
BOOL LockSetForegroundWindow(UINT);
BOOL LockWorkStation();
void NotifyWinEvent(DWORD, HWND, LONG, LONG);
HDEVNOTIFY RegisterDeviceNotificationA(HANDLE, LPVOID, DWORD);
HDEVNOTIFY RegisterDeviceNotificationW(HANDLE, LPVOID, DWORD);
BOOL SetProcessDefaultLayout(DWORD);
HWINEVENTHOOK SetWinEventHook(UINT, UINT, HMODULE, WINEVENTPROC, DWORD, DWORD, UINT);
void SwitchToThisWindow(HWND, BOOL);
BOOL SetLayeredWindowAttributes(HWND, COLORREF, BYTE, DWORD);
BOOL UpdateLayeredWindow(HWND, HDC, POINT*, SIZE*, HDC, POINT*, COLORREF, BLENDFUNCTION*, DWORD);
BOOL UserHandleGrantAccess(HANDLE, HANDLE, BOOL);
BOOL UnhookWinEvent(HWINEVENTHOOK);
BOOL UnregisterDeviceNotification(HANDLE);

static if (_WIN32_WINNT >= 0x501) {
    int BroadcastSystemMessageExA(DWORD, LPDWORD, UINT, WPARAM, LPARAM, PBSMINFO);
    int BroadcastSystemMessageExW(DWORD, LPDWORD, UINT, WPARAM, LPARAM, PBSMINFO);
    LRESULT DefRawInputProc(PRAWINPUT*, INT, UINT);
    BOOL FlashWindowEx(PFLASHWINFO);
    BOOL GetLayeredWindowAttributes(HWND, COLORREF*, BYTE*, DWORD*);
    UINT GetRawInputBuffer(PRAWINPUT, PUINT, UINT);
    UINT GetRawInputData(HRAWINPUT, UINT, LPVOID, PUINT, UINT);
    UINT GetRawInputDeviceInfoA(HANDLE, UINT, LPVOID, PUINT);
    UINT GetRawInputDeviceInfoW(HANDLE, UINT, LPVOID, PUINT);
    UINT GetRawInputDeviceList(PRAWINPUTDEVICELIST, PUINT, UINT);
    UINT GetRegisteredRawInputDevices(PRAWINPUTDEVICE, PUINT, UINT);
    BOOL IsGUIThread(BOOL);
    BOOL IsWinEventHookInstalled(DWORD);
    BOOL PrintWindow(HWND, HDC, UINT);
    BOOL RegisterRawInputDevices(PCRAWINPUTDEVICE, UINT, UINT);
}

version (Win64) {
    ULONG_PTR GetClassLongPtrA(HWND, int);
    ULONG_PTR GetClassLongPtrW(HWND, int);
    ULONG_PTR SetClassLongPtrA(HWND, int, LONG_PTR);
    ULONG_PTR SetClassLongPtrW(HWND, int, LONG_PTR);
    LONG_PTR GetWindowLongPtrA(HWND, int);
    LONG_PTR GetWindowLongPtrW(HWND, int);
    LONG_PTR SetWindowLongPtrA(HWND, int, LONG_PTR);
    LONG_PTR SetWindowLongPtrW(HWND, int, LONG_PTR);
} else {
    alias GetClassLongA GetClassLongPtrA;
    alias GetClassLongW GetClassLongPtrW;
    alias SetClassLongA SetClassLongPtrA;
    alias SetClassLongW SetClassLongPtrW;
    alias GetWindowLongA GetWindowLongPtrA;
    alias GetWindowLongW GetWindowLongPtrW;
    alias SetWindowLongA SetWindowLongPtrA;
    alias SetWindowLongW SetWindowLongPtrW;
}


// -----
// Aliases for Unicode or Ansi
version (Unicode) {
    alias EDITWORDBREAKPROCW EDITWORDBREAKPROC;
    alias PROPENUMPROCW PROPENUMPROC;
    alias PROPENUMPROCEXW PROPENUMPROCEX;
    alias DESKTOPENUMPROCW DESKTOPENUMPROC;
    alias WINSTAENUMPROCW WINSTAENUMPROC;
    alias MAKEINTRESOURCEW MAKEINTRESOURCE;

    alias WNDCLASSW WNDCLASS;
    alias WNDCLASSEXW WNDCLASSEX;
    alias MENUITEMINFOW MENUITEMINFO;
    alias LPCMENUITEMINFOW LPCMENUITEMINFO;
    alias MSGBOXPARAMSW MSGBOXPARAMS;
    alias HIGHCONTRASTW HIGHCONTRAST;
    alias SERIALKEYSW SERIALKEYS;
    alias SOUNDSENTRYW SOUNDSENTRY;
    alias CREATESTRUCTW CREATESTRUCT;
    alias CBT_CREATEWNDW CBT_CREATEWND;
    alias MDICREATESTRUCTW MDICREATESTRUCT;
    alias MULTIKEYHELPW MULTIKEYHELP;
    alias MONITORINFOEXW MONITORINFOEX;
    alias ICONMETRICSW ICONMETRICS;
    alias NONCLIENTMETRICSW NONCLIENTMETRICS;

    alias AppendMenuW AppendMenu;
    alias BroadcastSystemMessageW BroadcastSystemMessage;
    static if (_WIN32_WINNT >= 0x501) {
        alias BroadcastSystemMessageExW BroadcastSystemMessageEx;
    }
    alias CallMsgFilterW CallMsgFilter;
    alias CallWindowProcW CallWindowProc;
    alias ChangeMenuW ChangeMenu;
    alias CharLowerW CharLower;
    alias CharLowerBuffW CharLowerBuff;
    alias CharNextW CharNext;
    alias CharNextExW CharNextEx;
    alias CharPrevW CharPrev;
    alias CharPrevExW CharPrevEx;
    alias CharToOemW CharToOem;
    alias CharToOemBuffW CharToOemBuff;
    alias CharUpperW CharUpper;
    alias CharUpperBuffW CharUpperBuff;
    alias CopyAcceleratorTableW CopyAcceleratorTable;
    alias CreateAcceleratorTableW CreateAcceleratorTable;
    alias CreateDialogW CreateDialog;
    alias CreateDialogIndirectW CreateDialogIndirect;
    alias CreateDialogIndirectParamW CreateDialogIndirectParam;
    alias CreateDialogParamW CreateDialogParam;
    alias CreateMDIWindowW CreateMDIWindow;
    alias CreateWindowW CreateWindow;
    alias CreateWindowExW CreateWindowEx;
    alias CreateWindowStationW CreateWindowStation;
    alias DefDlgProcW DefDlgProc;
    alias DefFrameProcW DefFrameProc;
    alias DefMDIChildProcW DefMDIChildProc;
    alias DefWindowProcW DefWindowProc;
    alias DialogBoxW DialogBox;
    alias DialogBoxIndirectW DialogBoxIndirect;
    alias DialogBoxIndirectParamW DialogBoxIndirectParam;
    alias DialogBoxParamW DialogBoxParam;
    alias DispatchMessageW DispatchMessage;
    alias DlgDirListW DlgDirList;
    alias DlgDirListComboBoxW DlgDirListComboBox;
    alias DlgDirSelectComboBoxExW DlgDirSelectComboBoxEx;
    alias DlgDirSelectExW DlgDirSelectEx;
    alias DrawStateW DrawState;
    alias DrawTextW DrawText;
    alias DrawTextExW DrawTextEx;
    alias EnumDesktopsW EnumDesktops;
    alias EnumPropsW EnumProps;
    alias EnumPropsExW EnumPropsEx;
    alias EnumWindowStationsW EnumWindowStations;
    alias FindWindowW FindWindow;
    alias FindWindowExW FindWindowEx;
    alias GetClassInfoW GetClassInfo;
    alias GetClassInfoExW GetClassInfoEx;
    alias GetClassLongW GetClassLong;
    alias GetClassLongPtrW GetClassLongPtr;
    alias GetClassNameW GetClassName;
    alias GetClipboardFormatNameW GetClipboardFormatName;
    alias GetDlgItemTextW GetDlgItemText;
    alias GetKeyboardLayoutNameW GetKeyboardLayoutName;
    alias GetKeyNameTextW GetKeyNameText;
    alias GetMenuItemInfoW GetMenuItemInfo;
    alias GetMenuStringW GetMenuString;
    alias GetMessageW GetMessage;
    alias GetMonitorInfoW GetMonitorInfo;
    alias GetPropW GetProp;
    static if (_WIN32_WINNT >= 0x501) {
        alias GetRawInputDeviceInfoW GetRawInputDeviceInfo;
    }
    alias GetTabbedTextExtentW GetTabbedTextExtent;
    alias GetUserObjectInformationW GetUserObjectInformation;
    alias GetWindowLongW GetWindowLong;
    alias GetWindowLongPtrW GetWindowLongPtr;
    alias GetWindowTextW GetWindowText;
    alias GetWindowTextLengthW GetWindowTextLength;
    alias GetAltTabInfoW GetAltTabInfo;
    alias GetWindowModuleFileNameW GetWindowModuleFileName;
    alias GrayStringW GrayString;
    alias InsertMenuW InsertMenu;
    alias InsertMenuItemW InsertMenuItem;
    alias IsCharAlphaW IsCharAlpha;
    alias IsCharAlphaNumericW IsCharAlphaNumeric;
    alias IsCharLowerW IsCharLower;
    alias IsCharUpperW IsCharUpper;
    alias IsDialogMessageW IsDialogMessage;
    alias LoadAcceleratorsW LoadAccelerators;
    alias LoadBitmapW LoadBitmap;
    alias LoadCursorW LoadCursor;
    alias LoadCursorFromFileW LoadCursorFromFile;
    alias LoadIconW LoadIcon;
    alias LoadImageW LoadImage;
    alias LoadKeyboardLayoutW LoadKeyboardLayout;
    alias LoadMenuW LoadMenu;
    alias LoadMenuIndirectW LoadMenuIndirect;
    alias LoadStringW LoadString;
    alias MapVirtualKeyW MapVirtualKey;
    alias MapVirtualKeyExW MapVirtualKeyEx;
    alias MessageBoxW MessageBox;
    alias MessageBoxExW MessageBoxEx;
    alias MessageBoxIndirectW MessageBoxIndirect;
    alias ModifyMenuW ModifyMenu;
    alias OemToCharW OemToChar;
    alias OemToCharBuffW OemToCharBuff;
    alias OpenDesktopW OpenDesktop;
    alias OpenWindowStationW OpenWindowStation;
    alias PeekMessageW PeekMessage;
    alias PostMessageW PostMessage;
    alias PostThreadMessageW PostThreadMessage;
    alias RealGetWindowClassW RealGetWindowClass;
    alias RegisterClassW RegisterClass;
    alias RegisterClassExW RegisterClassEx;
    alias RegisterClipboardFormatW RegisterClipboardFormat;
    alias RegisterDeviceNotificationW RegisterDeviceNotification;
    alias RegisterWindowMessageW RegisterWindowMessage;
    alias RemovePropW RemoveProp;
    alias SendDlgItemMessageW SendDlgItemMessage;
    alias SendMessageW SendMessage;
    alias SendMessageCallbackW SendMessageCallback;
    alias SendMessageTimeoutW SendMessageTimeout;
    alias SendNotifyMessageW SendNotifyMessage;
    alias SetClassLongW SetClassLong;
    alias SetClassLongPtrW SetClassLongPtr;
    alias SetDlgItemTextW SetDlgItemText;
    alias SetMenuItemInfoW SetMenuItemInfo;
    alias SetPropW SetProp;
    alias SetUserObjectInformationW SetUserObjectInformation;
    alias SetWindowLongW SetWindowLong;
    alias SetWindowLongPtrW SetWindowLongPtr;
    alias SetWindowsHookW SetWindowsHook;
    alias SetWindowsHookExW SetWindowsHookEx;
    alias SetWindowTextW SetWindowText;
    alias SystemParametersInfoW SystemParametersInfo;
    alias TabbedTextOutW TabbedTextOut;
    alias TranslateAcceleratorW TranslateAccelerator;
    alias UnregisterClassW UnregisterClass;
    alias VkKeyScanW VkKeyScan;
    alias VkKeyScanExW VkKeyScanEx;
    alias WinHelpW WinHelp;
    alias wsprintfW wsprintf;
    alias wvsprintfW wvsprintf;

    alias ChangeDisplaySettingsW ChangeDisplaySettings;
    alias ChangeDisplaySettingsExW ChangeDisplaySettingsEx;
    alias CreateDesktopW CreateDesktop;
    alias EnumDisplaySettingsW EnumDisplaySettings;
    alias EnumDisplaySettingsExW EnumDisplaySettingsEx;
    alias EnumDisplayDevicesW EnumDisplayDevices;

} else { // ANSI

    alias EDITWORDBREAKPROCA EDITWORDBREAKPROC;
    alias PROPENUMPROCA PROPENUMPROC;
    alias PROPENUMPROCEXA PROPENUMPROCEX;
    alias DESKTOPENUMPROCA DESKTOPENUMPROC;
    alias WINSTAENUMPROCA WINSTAENUMPROC;
    alias MAKEINTRESOURCEA MAKEINTRESOURCE;

    alias WNDCLASSA WNDCLASS;
    alias WNDCLASSEXA WNDCLASSEX;
    alias MENUITEMINFOA MENUITEMINFO;
    alias LPCMENUITEMINFOA LPCMENUITEMINFO;
    alias MSGBOXPARAMSA MSGBOXPARAMS;
    alias HIGHCONTRASTA HIGHCONTRAST;
    alias SERIALKEYSA SERIALKEYS;
    alias SOUNDSENTRYA SOUNDSENTRY;
    alias CREATESTRUCTA CREATESTRUCT;
    alias CBT_CREATEWNDA CBT_CREATEWND;
    alias MDICREATESTRUCTA MDICREATESTRUCT;
    alias MULTIKEYHELPA MULTIKEYHELP;
    alias MONITORINFOEXA MONITORINFOEX;
    alias ICONMETRICSA ICONMETRICS;
    alias NONCLIENTMETRICSA NONCLIENTMETRICS;

    alias AppendMenuA AppendMenu;
    alias BroadcastSystemMessageA BroadcastSystemMessage;
    static if (_WIN32_WINNT >= 0x501) {
        alias BroadcastSystemMessageExA BroadcastSystemMessageEx;
    }
    alias CallMsgFilterA CallMsgFilter;
    alias CallWindowProcA CallWindowProc;
    alias ChangeMenuA ChangeMenu;
    alias CharLowerA CharLower;
    alias CharLowerBuffA CharLowerBuff;
    alias CharNextA CharNext;
    alias CharNextExA CharNextEx;
    alias CharPrevA CharPrev;
    alias CharPrevExA CharPrevEx;
    alias CharToOemA CharToOem;
    alias CharToOemBuffA CharToOemBuff;
    alias CharUpperA CharUpper;
    alias CharUpperBuffA CharUpperBuff;
    alias CopyAcceleratorTableA CopyAcceleratorTable;
    alias CreateAcceleratorTableA CreateAcceleratorTable;
    alias CreateDialogA CreateDialog;
    alias CreateDialogIndirectA CreateDialogIndirect;
    alias CreateDialogIndirectParamA CreateDialogIndirectParam;
    alias CreateDialogParamA CreateDialogParam;
    alias CreateMDIWindowA CreateMDIWindow;
    alias CreateWindowA CreateWindow;
    alias CreateWindowExA CreateWindowEx;
    alias CreateWindowStationA CreateWindowStation;
    alias DefDlgProcA DefDlgProc;
    alias DefFrameProcA DefFrameProc;
    alias DefMDIChildProcA DefMDIChildProc;
    alias DefWindowProcA DefWindowProc;
    alias DialogBoxA DialogBox;
    alias DialogBoxIndirectA DialogBoxIndirect;
    alias DialogBoxIndirectParamA DialogBoxIndirectParam;
    alias DialogBoxParamA DialogBoxParam;
    alias DispatchMessageA DispatchMessage;
    alias DlgDirListA DlgDirList;
    alias DlgDirListComboBoxA DlgDirListComboBox;
    alias DlgDirSelectComboBoxExA DlgDirSelectComboBoxEx;
    alias DlgDirSelectExA DlgDirSelectEx;
    alias DrawStateA DrawState;
    alias DrawTextA DrawText;
    alias DrawTextExA DrawTextEx;
    alias EnumDesktopsA EnumDesktops;
    alias EnumPropsA EnumProps;
    alias EnumPropsExA EnumPropsEx;
    alias EnumWindowStationsA EnumWindowStations;
    alias FindWindowA FindWindow;
    alias FindWindowExA FindWindowEx;
    alias GetClassInfoA GetClassInfo;
    alias GetClassInfoExA GetClassInfoEx;
    alias GetClassLongA GetClassLong;
    alias GetClassLongPtrA GetClassLongPtr;
    alias GetClassNameA GetClassName;
    alias GetClipboardFormatNameA GetClipboardFormatName;
    alias GetDlgItemTextA GetDlgItemText;
    alias GetKeyboardLayoutNameA GetKeyboardLayoutName;
    alias GetKeyNameTextA GetKeyNameText;
    alias GetMenuItemInfoA GetMenuItemInfo;
    alias GetMenuStringA GetMenuString;
    alias GetMessageA GetMessage;
    alias GetMonitorInfoA GetMonitorInfo;
    alias GetPropA GetProp;
    static if (_WIN32_WINNT >= 0x501) {
        alias GetRawInputDeviceInfoA GetRawInputDeviceInfo;
    }
    alias GetTabbedTextExtentA GetTabbedTextExtent;
    alias GetUserObjectInformationA GetUserObjectInformation;
    alias GetWindowLongA GetWindowLong;
    alias GetWindowLongPtrA GetWindowLongPtr;
    alias GetWindowTextA GetWindowText;
    alias GetWindowTextLengthA GetWindowTextLength;
    alias GetAltTabInfoA GetAltTabInfo;
    alias GetWindowModuleFileNameA GetWindowModuleFileName;
    alias GrayStringA GrayString;
    alias InsertMenuA InsertMenu;
    alias InsertMenuItemA InsertMenuItem;
    alias IsCharAlphaA IsCharAlpha;
    alias IsCharAlphaNumericA IsCharAlphaNumeric;
    alias IsCharLowerA IsCharLower;
    alias IsCharUpperA IsCharUpper;
    alias IsDialogMessageA IsDialogMessage;
    alias LoadAcceleratorsA LoadAccelerators;
    alias LoadBitmapA LoadBitmap;
    alias LoadCursorA LoadCursor;
    alias LoadIconA LoadIcon;
    alias LoadCursorFromFileA LoadCursorFromFile;
    alias LoadImageA LoadImage;
    alias LoadKeyboardLayoutA LoadKeyboardLayout;
    alias LoadMenuA LoadMenu;
    alias LoadMenuIndirectA LoadMenuIndirect;
    alias LoadStringA LoadString;
    alias MapVirtualKeyA MapVirtualKey;
    alias MapVirtualKeyExA MapVirtualKeyEx;
    alias MessageBoxA MessageBox;
    alias MessageBoxExA MessageBoxEx;
    alias MessageBoxIndirectA MessageBoxIndirect;
    alias ModifyMenuA ModifyMenu;
    alias OemToCharA OemToChar;
    alias OemToCharBuffA OemToCharBuff;
    alias OpenDesktopA OpenDesktop;
    alias OpenWindowStationA OpenWindowStation;
    alias PeekMessageA PeekMessage;
    alias PostMessageA PostMessage;
    alias PostThreadMessageA PostThreadMessage;
    alias RealGetWindowClassA RealGetWindowClass;
    alias RegisterClassA RegisterClass;
    alias RegisterClassExA RegisterClassEx;
    alias RegisterClipboardFormatA RegisterClipboardFormat;
    alias RegisterDeviceNotificationA RegisterDeviceNotification;
    alias RegisterWindowMessageA RegisterWindowMessage;
    alias RemovePropA RemoveProp;
    alias SendDlgItemMessageA SendDlgItemMessage;
    alias SendMessageA SendMessage;
    alias SendMessageCallbackA SendMessageCallback;
    alias SendMessageTimeoutA SendMessageTimeout;
    alias SendNotifyMessageA SendNotifyMessage;
    alias SetClassLongA SetClassLong;
    alias SetClassLongPtrA SetClassLongPtr;
    alias SetDlgItemTextA SetDlgItemText;
    alias SetMenuItemInfoA SetMenuItemInfo;
    alias SetPropA SetProp;
    alias SetUserObjectInformationA SetUserObjectInformation;
    alias SetWindowLongA SetWindowLong;
    alias SetWindowLongPtrA SetWindowLongPtr;
    alias SetWindowsHookA SetWindowsHook;
    alias SetWindowsHookExA SetWindowsHookEx;
    alias SetWindowTextA SetWindowText;
    alias SystemParametersInfoA SystemParametersInfo;
    alias TabbedTextOutA TabbedTextOut;
    alias TranslateAcceleratorA TranslateAccelerator;
    alias UnregisterClassA UnregisterClass;
    alias VkKeyScanA VkKeyScan;
    alias VkKeyScanExA VkKeyScanEx;
    alias WinHelpA WinHelp;
    alias wsprintfA wsprintf;
    alias wvsprintfA wvsprintf;

    alias ChangeDisplaySettingsA ChangeDisplaySettings;
    alias ChangeDisplaySettingsExA ChangeDisplaySettingsEx;
    alias CreateDesktopA CreateDesktop;
    alias EnumDisplaySettingsA EnumDisplaySettings;
    alias EnumDisplaySettingsExA EnumDisplaySettingsEx;
    alias EnumDisplayDevicesA EnumDisplayDevices;
}

alias WNDCLASS* LPWNDCLASS, PWNDCLASS;
alias WNDCLASSEX* LPWNDCLASSEX, PWNDCLASSEX;
alias MENUITEMINFO* LPMENUITEMINFO;
alias MSGBOXPARAMS* PMSGBOXPARAMS, LPMSGBOXPARAMS;
alias HIGHCONTRAST* LPHIGHCONTRAST;
alias SERIALKEYS* LPSERIALKEYS;
alias SOUNDSENTRY* LPSOUNDSENTRY;
alias CREATESTRUCT* LPCREATESTRUCT;
alias CBT_CREATEWND* LPCBT_CREATEWND;
alias MDICREATESTRUCT* LPMDICREATESTRUCT;
alias MULTIKEYHELP* PMULTIKEYHELP, LPMULTIKEYHELP;
alias MONITORINFOEX* LPMONITORINFOEX;
alias ICONMETRICS* LPICONMETRICS;
alias NONCLIENTMETRICS* LPNONCLIENTMETRICS;

static if (_WIN32_WINNT >= 0x501) {
    enum PW_CLIENTONLY               = 0x00000001;
    enum RIM_INPUT                   = 0x00000000;
    enum RIM_INPUTSINK               = 0x00000001;
    enum RIM_TYPEMOUSE               = 0x00000000;
    enum RIM_TYPEKEYBOARD            = 0x00000001;
    enum RIM_TYPEHID                 = 0x00000002;
    enum MOUSE_MOVE_RELATIVE         = 0x00000000;
    enum MOUSE_MOVE_ABSOLUTE         = 0x00000001;
    enum MOUSE_VIRTUAL_DESKTOP       = 0x00000002;
    enum MOUSE_ATTRIBUTES_CHANGED    = 0x00000004;
    enum RI_MOUSE_LEFT_BUTTON_DOWN   = 0x0001;
    enum RI_MOUSE_LEFT_BUTTON_UP     = 0x0002;
    enum RI_MOUSE_RIGHT_BUTTON_DOWN  = 0x0004;
    enum RI_MOUSE_RIGHT_BUTTON_UP    = 0x0008;
    enum RI_MOUSE_MIDDLE_BUTTON_DOWN = 0x0010;
    enum RI_MOUSE_MIDDLE_BUTTON_UP   = 0x0020;
    enum RI_MOUSE_BUTTON_1_DOWN = RI_MOUSE_LEFT_BUTTON_DOWN;
    enum RI_MOUSE_BUTTON_1_UP   = RI_MOUSE_LEFT_BUTTON_UP;
    enum RI_MOUSE_BUTTON_2_DOWN = RI_MOUSE_RIGHT_BUTTON_DOWN;
    enum RI_MOUSE_BUTTON_2_UP   = RI_MOUSE_RIGHT_BUTTON_UP;
    enum RI_MOUSE_BUTTON_3_DOWN = RI_MOUSE_MIDDLE_BUTTON_DOWN;
    enum RI_MOUSE_BUTTON_3_UP   = RI_MOUSE_MIDDLE_BUTTON_UP;
    enum RI_MOUSE_BUTTON_4_DOWN = 0x0040;
    enum RI_MOUSE_BUTTON_4_UP   = 0x0080;
    enum RI_MOUSE_BUTTON_5_DOWN = 0x0100;
    enum RI_MOUSE_BUTTON_5_UP   = 0x0200;
    enum RI_MOUSE_WHEEL         = 0x0400;
    enum KEYBOARD_OVERRUN_MAKE_CODE = 0x00ff;
    enum RI_KEY_MAKE            = 0x0000;
    enum RI_KEY_BREAK           = 0x0001;
    enum RI_KEY_E0              = 0x0002;
    enum RI_KEY_E1              = 0x0004;
    enum RI_KEY_TERMSRV_SET_LED = 0x0008;
    enum RI_KEY_TERMSRV_SHADOW  = 0x0010;

    enum RID_INPUT          = 0x10000003;
    enum RID_HEADER         = 0x10000005;

    enum RIDI_PREPARSEDDATA = 0x20000005;
    enum RIDI_DEVICENAME    = 0x20000007;
    enum RIDI_DEVICEINFO    = 0x2000000b;

    enum RIDEV_REMOVE       = 0x00000001;
    enum RIDEV_EXCLUDE      = 0x00000010;
    enum RIDEV_PAGEONLY     = 0x00000020;
    enum RIDEV_NOLEGACY     = 0x00000030;
    enum RIDEV_INPUTSINK    = 0x00000100;
    enum RIDEV_CAPTUREMOUSE = 0x00000200;
    enum RIDEV_NOHOTKEYS    = 0x00000200;
    enum RIDEV_APPKEYS      = 0x00000400;
}
