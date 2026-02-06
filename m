Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F83FEE6B46
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 18:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAB810E8B4;
	Fri,  6 Feb 2026 18:42:58 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB94410E8C7;
 Fri,  6 Feb 2026 18:42:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Basic_enabling_patches_fo?=
 =?utf-8?q?r_Xe3p=5FLPG_and_NVL-P_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Feb 2026 18:42:56 -0000
Message-ID: <177040337668.232294.14119781208661992900@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260206-nvl-p-upstreaming-v3-0-636e1ad32688@intel.com>
In-Reply-To: <20260206-nvl-p-upstreaming-v3-0-636e1ad32688@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Basic enabling patches for Xe3p_LPG and NVL-P (rev3)
URL   : https://patchwork.freedesktop.org/series/161037/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 419d28db4957a3c4ce44c1d97e213cb15e512da5
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Fri Feb 6 15:36:11 2026 -0300

    drm/xe/nvlp: Bump maximum WOPCM size
    
    On NVL-P, the primary GT's WOPCM gained an extra 8MiB for the Memory
    URB.  As such, we need to bump the maximum size in the driver so that
    the driver is able to load without erroring out thinking that the WOPCM
    is too small.
    
    FIXME: The wopcm code in xe driver is a bit confusing.  For the case
    where the offsets for GUC WOPCM are already locked, it appears we are
    using the maximum overall WOPCM size instead of the sizes relative to
    each type of GT.  The function __check_layout() should be checking
    against the latter.
    
    Bspec: 67090
    Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch ab5b6da7d4879640bce3197597e0bc707bd60ab5 drm-intel
5ee4d285fa0a drm/xe/xe3p_lpg: Add support for graphics IP 35.10
26ecc2829e82 drm/xe/xe3p_lpg: Add initial workarounds for graphics version 35.10
518f7b952ed7 drm/xe/pat: Differentiate between primary and media for PTA
a589107115ee drm/xe/xe3p_lpg: Add new PAT table
-:46: ERROR:SPACING: space prohibited after that open square bracket '['
#46: FILE: drivers/gpu/drm/xe/xe_pat.c:261:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:46: ERROR:SPACING: space prohibited after that open parenthesis '('
#46: FILE: drivers/gpu/drm/xe/xe_pat.c:261:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:46: ERROR:SPACING: space prohibited before that close parenthesis ')'
#46: FILE: drivers/gpu/drm/xe/xe_pat.c:261:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:47: ERROR:SPACING: space prohibited after that open square bracket '['
#47: FILE: drivers/gpu/drm/xe/xe_pat.c:262:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:47: ERROR:SPACING: space prohibited after that open parenthesis '('
#47: FILE: drivers/gpu/drm/xe/xe_pat.c:262:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:47: ERROR:SPACING: space prohibited before that close parenthesis ')'
#47: FILE: drivers/gpu/drm/xe/xe_pat.c:262:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:48: ERROR:SPACING: space prohibited after that open square bracket '['
#48: FILE: drivers/gpu/drm/xe/xe_pat.c:263:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:48: ERROR:SPACING: space prohibited after that open parenthesis '('
#48: FILE: drivers/gpu/drm/xe/xe_pat.c:263:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:48: ERROR:SPACING: space prohibited before that close parenthesis ')'
#48: FILE: drivers/gpu/drm/xe/xe_pat.c:263:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:49: ERROR:SPACING: space prohibited after that open square bracket '['
#49: FILE: drivers/gpu/drm/xe/xe_pat.c:264:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:49: ERROR:SPACING: space prohibited after that open parenthesis '('
#49: FILE: drivers/gpu/drm/xe/xe_pat.c:264:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:49: ERROR:SPACING: space prohibited before that close parenthesis ')'
#49: FILE: drivers/gpu/drm/xe/xe_pat.c:264:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:50: ERROR:SPACING: space prohibited after that open square bracket '['
#50: FILE: drivers/gpu/drm/xe/xe_pat.c:265:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:50: ERROR:SPACING: space prohibited after that open parenthesis '('
#50: FILE: drivers/gpu/drm/xe/xe_pat.c:265:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:50: ERROR:SPACING: space prohibited before that close parenthesis ')'
#50: FILE: drivers/gpu/drm/xe/xe_pat.c:265:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:51: ERROR:SPACING: space prohibited after that open square bracket '['
#51: FILE: drivers/gpu/drm/xe/xe_pat.c:266:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:51: ERROR:SPACING: space prohibited after that open parenthesis '('
#51: FILE: drivers/gpu/drm/xe/xe_pat.c:266:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:51: ERROR:SPACING: space prohibited before that close parenthesis ')'
#51: FILE: drivers/gpu/drm/xe/xe_pat.c:266:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:52: ERROR:SPACING: space prohibited after that open square bracket '['
#52: FILE: drivers/gpu/drm/xe/xe_pat.c:267:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:52: ERROR:SPACING: space prohibited after that open parenthesis '('
#52: FILE: drivers/gpu/drm/xe/xe_pat.c:267:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:52: ERROR:SPACING: space prohibited before that close parenthesis ')'
#52: FILE: drivers/gpu/drm/xe/xe_pat.c:267:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:53: ERROR:SPACING: space prohibited after that open square bracket '['
#53: FILE: drivers/gpu/drm/xe/xe_pat.c:268:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:53: ERROR:SPACING: space prohibited after that open parenthesis '('
#53: FILE: drivers/gpu/drm/xe/xe_pat.c:268:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:53: ERROR:SPACING: space prohibited before that close parenthesis ')'
#53: FILE: drivers/gpu/drm/xe/xe_pat.c:268:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:54: ERROR:SPACING: space prohibited after that open square bracket '['
#54: FILE: drivers/gpu/drm/xe/xe_pat.c:269:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:54: ERROR:SPACING: space prohibited after that open parenthesis '('
#54: FILE: drivers/gpu/drm/xe/xe_pat.c:269:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:54: ERROR:SPACING: space prohibited before that close parenthesis ')'
#54: FILE: drivers/gpu/drm/xe/xe_pat.c:269:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:55: ERROR:SPACING: space prohibited after that open square bracket '['
#55: FILE: drivers/gpu/drm/xe/xe_pat.c:270:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:55: ERROR:SPACING: space prohibited after that open parenthesis '('
#55: FILE: drivers/gpu/drm/xe/xe_pat.c:270:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:55: ERROR:SPACING: space prohibited before that close parenthesis ')'
#55: FILE: drivers/gpu/drm/xe/xe_pat.c:270:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:56: ERROR:SPACING: space prohibited after that open parenthesis '('
#56: FILE: drivers/gpu/drm/xe/xe_pat.c:271:
+	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),

-:56: ERROR:SPACING: space prohibited before that close parenthesis ')'
#56: FILE: drivers/gpu/drm/xe/xe_pat.c:271:
+	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),

-:57: ERROR:SPACING: space prohibited after that open parenthesis '('
#57: FILE: drivers/gpu/drm/xe/xe_pat.c:272:
+	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),

-:57: ERROR:SPACING: space prohibited before that close parenthesis ')'
#57: FILE: drivers/gpu/drm/xe/xe_pat.c:272:
+	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),

-:58: ERROR:SPACING: space prohibited after that open parenthesis '('
#58: FILE: drivers/gpu/drm/xe/xe_pat.c:273:
+	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),

-:58: ERROR:SPACING: space prohibited before that close parenthesis ')'
#58: FILE: drivers/gpu/drm/xe/xe_pat.c:273:
+	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),

-:59: ERROR:SPACING: space prohibited after that open parenthesis '('
#59: FILE: drivers/gpu/drm/xe/xe_pat.c:274:
+	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),

-:59: ERROR:SPACING: space prohibited before that close parenthesis ')'
#59: FILE: drivers/gpu/drm/xe/xe_pat.c:274:
+	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),

-:60: ERROR:SPACING: space prohibited after that open parenthesis '('
#60: FILE: drivers/gpu/drm/xe/xe_pat.c:275:
+	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),

-:60: ERROR:SPACING: space prohibited before that close parenthesis ')'
#60: FILE: drivers/gpu/drm/xe/xe_pat.c:275:
+	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),

-:61: ERROR:SPACING: space prohibited after that open parenthesis '('
#61: FILE: drivers/gpu/drm/xe/xe_pat.c:276:
+	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),

-:61: ERROR:SPACING: space prohibited before that close parenthesis ')'
#61: FILE: drivers/gpu/drm/xe/xe_pat.c:276:
+	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),

-:62: ERROR:SPACING: space prohibited after that open parenthesis '('
#62: FILE: drivers/gpu/drm/xe/xe_pat.c:277:
+	[16] = XE2_PAT( 0, 1, 0, 0, 3, 2 ),

-:62: ERROR:SPACING: space prohibited before that close parenthesis ')'
#62: FILE: drivers/gpu/drm/xe/xe_pat.c:277:
+	[16] = XE2_PAT( 0, 1, 0, 0, 3, 2 ),

-:64: ERROR:SPACING: space prohibited after that open parenthesis '('
#64: FILE: drivers/gpu/drm/xe/xe_pat.c:279:
+	[18] = XE2_PAT( 1, 0, 0, 2, 3, 0 ),

-:64: ERROR:SPACING: space prohibited before that close parenthesis ')'
#64: FILE: drivers/gpu/drm/xe/xe_pat.c:279:
+	[18] = XE2_PAT( 1, 0, 0, 2, 3, 0 ),

-:65: ERROR:SPACING: space prohibited after that open parenthesis '('
#65: FILE: drivers/gpu/drm/xe/xe_pat.c:280:
+	[19] = XE2_PAT( 1, 0, 0, 2, 3, 2 ),

-:65: ERROR:SPACING: space prohibited before that close parenthesis ')'
#65: FILE: drivers/gpu/drm/xe/xe_pat.c:280:
+	[19] = XE2_PAT( 1, 0, 0, 2, 3, 2 ),

-:66: ERROR:SPACING: space prohibited after that open parenthesis '('
#66: FILE: drivers/gpu/drm/xe/xe_pat.c:281:
+	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),

-:66: ERROR:SPACING: space prohibited before that close parenthesis ')'
#66: FILE: drivers/gpu/drm/xe/xe_pat.c:281:
+	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),

-:67: ERROR:SPACING: space prohibited after that open parenthesis '('
#67: FILE: drivers/gpu/drm/xe/xe_pat.c:282:
+	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),

-:67: ERROR:SPACING: space prohibited before that close parenthesis ')'
#67: FILE: drivers/gpu/drm/xe/xe_pat.c:282:
+	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),

-:68: ERROR:SPACING: space prohibited after that open parenthesis '('
#68: FILE: drivers/gpu/drm/xe/xe_pat.c:283:
+	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),

-:68: ERROR:SPACING: space prohibited before that close parenthesis ')'
#68: FILE: drivers/gpu/drm/xe/xe_pat.c:283:
+	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),

-:69: ERROR:SPACING: space prohibited after that open parenthesis '('
#69: FILE: drivers/gpu/drm/xe/xe_pat.c:284:
+	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),

-:69: ERROR:SPACING: space prohibited before that close parenthesis ')'
#69: FILE: drivers/gpu/drm/xe/xe_pat.c:284:
+	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),

-:70: ERROR:SPACING: space prohibited after that open parenthesis '('
#70: FILE: drivers/gpu/drm/xe/xe_pat.c:285:
+	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),

-:70: ERROR:SPACING: space prohibited before that close parenthesis ')'
#70: FILE: drivers/gpu/drm/xe/xe_pat.c:285:
+	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),

-:71: ERROR:SPACING: space prohibited after that open parenthesis '('
#71: FILE: drivers/gpu/drm/xe/xe_pat.c:286:
+	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),

-:71: ERROR:SPACING: space prohibited before that close parenthesis ')'
#71: FILE: drivers/gpu/drm/xe/xe_pat.c:286:
+	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),

-:72: ERROR:SPACING: space prohibited after that open parenthesis '('
#72: FILE: drivers/gpu/drm/xe/xe_pat.c:287:
+	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),

-:72: ERROR:SPACING: space prohibited before that close parenthesis ')'
#72: FILE: drivers/gpu/drm/xe/xe_pat.c:287:
+	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),

-:73: ERROR:SPACING: space prohibited after that open parenthesis '('
#73: FILE: drivers/gpu/drm/xe/xe_pat.c:288:
+	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),

-:73: ERROR:SPACING: space prohibited before that close parenthesis ')'
#73: FILE: drivers/gpu/drm/xe/xe_pat.c:288:
+	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),

-:74: ERROR:SPACING: space prohibited after that open parenthesis '('
#74: FILE: drivers/gpu/drm/xe/xe_pat.c:289:
+	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),

-:74: ERROR:SPACING: space prohibited before that close parenthesis ')'
#74: FILE: drivers/gpu/drm/xe/xe_pat.c:289:
+	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),

-:75: ERROR:SPACING: space prohibited after that open parenthesis '('
#75: FILE: drivers/gpu/drm/xe/xe_pat.c:290:
+	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),

-:75: ERROR:SPACING: space prohibited before that close parenthesis ')'
#75: FILE: drivers/gpu/drm/xe/xe_pat.c:290:
+	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),

-:76: ERROR:SPACING: space prohibited after that open parenthesis '('
#76: FILE: drivers/gpu/drm/xe/xe_pat.c:291:
+	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),

-:76: ERROR:SPACING: space prohibited before that close parenthesis ')'
#76: FILE: drivers/gpu/drm/xe/xe_pat.c:291:
+	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),

-:77: ERROR:SPACING: space prohibited after that open parenthesis '('
#77: FILE: drivers/gpu/drm/xe/xe_pat.c:292:
+	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),

-:77: ERROR:SPACING: space prohibited before that close parenthesis ')'
#77: FILE: drivers/gpu/drm/xe/xe_pat.c:292:
+	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),

total: 72 errors, 0 warnings, 0 checks, 73 lines checked
bf360eb42c90 drm/xe/xe3p_lpg: Add MCR steering
2df949e1fb1a drm/xe/xe3p_lpg: Add LRC parsing for additional RCS engine state
f25fd14def84 drm/xe/xe3p_lpg: Disable reporting of context switch status to GHWSP
6e8e6901ee6a drm/xe/xe3p_lpg: Drop unnecessary tuning settings
2a6090984f06 drm/xe/xe3p_lpg: Extend 'group ID' mask size
3b026475a834 drm/xe/xe3p_lpg: Update LRC sizes
af316392a8a3 drm/xe/xe3p_lpg: Set STLB bank hash mode to 4KB
585e7e676c17 drm/xe/nvlp: Add NVL-P platform definition
-:94: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#94: FILE: include/drm/intel/pciids.h:904:
+#define INTEL_NVLP_IDS(MACRO__, ...) \
+	MACRO__(0xD750, ## __VA_ARGS__), \
+	MACRO__(0xD751, ## __VA_ARGS__), \
+	MACRO__(0xD752, ## __VA_ARGS__), \
+	MACRO__(0xD753, ## __VA_ARGS__), \
+	MACRO__(0XD754, ## __VA_ARGS__), \
+	MACRO__(0XD755, ## __VA_ARGS__), \
+	MACRO__(0XD756, ## __VA_ARGS__), \
+	MACRO__(0XD757, ## __VA_ARGS__), \
+	MACRO__(0xD75F, ## __VA_ARGS__)

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:94: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#94: FILE: include/drm/intel/pciids.h:904:
+#define INTEL_NVLP_IDS(MACRO__, ...) \
+	MACRO__(0xD750, ## __VA_ARGS__), \
+	MACRO__(0xD751, ## __VA_ARGS__), \
+	MACRO__(0xD752, ## __VA_ARGS__), \
+	MACRO__(0xD753, ## __VA_ARGS__), \
+	MACRO__(0XD754, ## __VA_ARGS__), \
+	MACRO__(0XD755, ## __VA_ARGS__), \
+	MACRO__(0XD756, ## __VA_ARGS__), \
+	MACRO__(0XD757, ## __VA_ARGS__), \
+	MACRO__(0xD75F, ## __VA_ARGS__)

total: 1 errors, 0 warnings, 1 checks, 60 lines checked
0db3ff1ac9aa drm/xe/nvlp: Attach MOCS table for nvlp
f78478bb6bd4 drm/i915/nvlp: Hook up display support
419d28db4957 drm/xe/nvlp: Bump maximum WOPCM size


