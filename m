Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D130CA1010
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 21:43:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B61910E296;
	Wed,  3 Sep 2025 21:43:17 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F0D10E296;
 Wed,  3 Sep 2025 21:43:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_RFC=3A_Add_dedicated_prin?=
 =?utf-8?q?tk_macros_for_tile_and_device?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Sep 2025 21:43:16 -0000
Message-ID: <175693579662.300637.12317521417203812302@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250903213712.6364-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250903213712.6364-1-michal.wajdeczko@intel.com>
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

Series: RFC: Add dedicated printk macros for tile and device
URL   : https://patchwork.freedesktop.org/series/153985/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4025f1cbaf844fa303497e24b707dd4a356eb3b0
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Sep 3 23:36:12 2025 +0200

    drm/xe: Use tile-oriented messages in LMTT code
    
    Use recently added macros to print tile-oriented messages.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 2b95afd5f659a01a6fc8195358e62077846b97e7 drm-intel
db7ddca681fb drm/xe: Keep xe_gt_err() macro definitions together
2bdeb20ea33c drm/xe: Drop "gt_" prefix from xe_gt_WARN() macros
8a62c0469407 drm/xe: Prepare format for GT-oriented messages in one place
-:37: ERROR:SPACING: space required after that ',' (ctx:VxO)
#37: FILE: drivers/gpu/drm/xe/xe_gt_printk.h:43:
+	xe_gt_WARN_type((_gt),, _condition, __xe_gt_printk_fmt((_gt), _fmt, ##__VA_ARGS__))
 	                     ^

total: 1 errors, 0 warnings, 0 checks, 35 lines checked
f4885406d11f drm/xe: Add dedicated printk macros for tile and device
-:86: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#86: 
new file mode 100644

-:103: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#103: FILE: drivers/gpu/drm/xe/xe_printk.h:13:
+#define __xe_printk_fmt(_xe, _fmt, _args...)	_fmt, ##_args

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

-:103: WARNING:MACRO_ARG_UNUSED: Argument '_xe' is not used in function-like macro
#103: FILE: drivers/gpu/drm/xe/xe_printk.h:13:
+#define __xe_printk_fmt(_xe, _fmt, _args...)	_fmt, ##_args

-:105: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_xe' - possible side-effects?
#105: FILE: drivers/gpu/drm/xe/xe_printk.h:15:
+#define xe_printk(_xe, _level, _fmt, ...) \
+	drm_##_level(&(_xe)->drm, __xe_printk_fmt((_xe), _fmt, ## __VA_ARGS__))

-:132: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_xe' - possible side-effects?
#132: FILE: drivers/gpu/drm/xe/xe_printk.h:42:
+#define xe_WARN(_xe, _condition, _fmt, ...) \
+	xe_WARN_type((_xe),, _condition, __xe_printk_fmt((_xe), _fmt, ## __VA_ARGS__))

-:133: ERROR:SPACING: space required after that ',' (ctx:VxO)
#133: FILE: drivers/gpu/drm/xe/xe_printk.h:43:
+	xe_WARN_type((_xe),, _condition, __xe_printk_fmt((_xe), _fmt, ## __VA_ARGS__))
 	                  ^

-:135: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_xe' - possible side-effects?
#135: FILE: drivers/gpu/drm/xe/xe_printk.h:45:
+#define xe_WARN_ONCE(_xe, _condition, _fmt, ...) \
+	xe_WARN_type((_xe), _ONCE, _condition, __xe_printk_fmt((_xe), _fmt, ## __VA_ARGS__))

-:238: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_tile' - possible side-effects?
#238: FILE: drivers/gpu/drm/xe/xe_tile_printk.h:13:
+#define xe_tile_printk(_tile, _level, _fmt, ...) \
+	xe_printk((_tile)->xe, _level, __xe_tile_printk_fmt((_tile), _fmt, ##__VA_ARGS__))

-:265: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_tile' - possible side-effects?
#265: FILE: drivers/gpu/drm/xe/xe_tile_printk.h:40:
+#define xe_tile_WARN(_tile, _condition, _fmt, ...) \
+	xe_tile_WARN_type((_tile),, _condition, __xe_tile_printk_fmt((_tile), _fmt, ##__VA_ARGS__))

-:266: ERROR:SPACING: space required after that ',' (ctx:VxO)
#266: FILE: drivers/gpu/drm/xe/xe_tile_printk.h:41:
+	xe_tile_WARN_type((_tile),, _condition, __xe_tile_printk_fmt((_tile), _fmt, ##__VA_ARGS__))
 	                         ^

-:268: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_tile' - possible side-effects?
#268: FILE: drivers/gpu/drm/xe/xe_tile_printk.h:43:
+#define xe_tile_WARN_ONCE(_tile, _condition, _fmt, ...) \
+	xe_tile_WARN_type((_tile), _ONCE, _condition, __xe_tile_printk_fmt((_tile), _fmt, ##__VA_ARGS__))

-:269: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#269: FILE: drivers/gpu/drm/xe/xe_tile_printk.h:44:
+	xe_tile_WARN_type((_tile), _ONCE, _condition, __xe_tile_printk_fmt((_tile), _fmt, ##__VA_ARGS__))

total: 3 errors, 3 warnings, 6 checks, 291 lines checked
c7555ede174d drm/xe: Define verbose debug macros
b5a912446767 drm/xe: Use tile-oriented messages in GGTT code
4025f1cbaf84 drm/xe: Use tile-oriented messages in LMTT code


