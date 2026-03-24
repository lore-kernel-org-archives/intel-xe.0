Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6607DF54ABC
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 13:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD9210E6D7;
	Tue, 24 Mar 2026 13:58:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C55B10E6D7;
 Tue, 24 Mar 2026 13:58:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/wm=3A_Watermark/?=
 =?utf-8?q?SAGV_fixes/cleanups/etc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Mar 2026 13:58:57 -0000
Message-ID: <177436073755.389820.9773138904058976649@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260324134843.2364-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260324134843.2364-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/wm: Watermark/SAGV fixes/cleanups/etc
URL   : https://patchwork.freedesktop.org/series/163783/
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
commit 27adaeaea14b2b145e3f56da54c7682080580654
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Mar 24 15:48:43 2026 +0200

    drm/i915/wm: Allow SAGV with multiple pipes on pre-icl
    
    There was never any documented reason for limiting SAGV to
    single active pipe configuration on pre-icl. Allow SAGV
    with multiple active pipes.
    
    At least my CFL NUC seems happy with this when using
    multiple displays. The machine actually has working
    SAGV because the memory clock can be observed changing
    via SA_PERF_STATUS/mchbar:0x5918.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 3a61374eb191c4ab83fbbcc569bb3f82a5d68819 drm-intel
c2d67d7533b2 drm/i915/wm: Reject SAGV consistently when block_time_us==0
a9f9af560708 drm/i915/wm: Don't compute separate SAGV watermarks for RKL
-:24: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#24: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:203:
+#define HAS_SAGV_WM(__display)		(DISPLAY_VER(__display) >= 12 && !(__display)->platform.rocketlake)

-:24: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#24: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:203:
+#define HAS_SAGV_WM(__display)		(DISPLAY_VER(__display) >= 12 && !(__display)->platform.rocketlake)

total: 0 errors, 1 warnings, 1 checks, 58 lines checked
af9bde3ce05c drm/i915/wm: Consolidate SAGV pipe active/interlace checks to common code
0262717f3680 drm/i915/wm: Verify the correct plane DDB entry
38b174170dd9 drm/i915/wm: Extract skl_wm_level_verify()
677129410b71 drm/i915/wm: Extract skl_ddb_entry_verify()
d24aee566334 drm/i915/wm: Verify 'ddb_y' as well as 'ddb'
b6fe7d92b13a drm/i915/wm: Reduce copy-pasta in skl_print_plane_wm_changes()
-:25: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#25: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:2617:
+#define PLANE_WM_EN_ARGS(__wm) \
+	enast((__wm)->wm[0].enable), enast((__wm)->wm[1].enable), \
+	enast((__wm)->wm[2].enable), enast((__wm)->wm[3].enable), \
+	enast((__wm)->wm[4].enable), enast((__wm)->wm[5].enable), \
+	enast((__wm)->wm[6].enable), enast((__wm)->wm[7].enable), \
+	enast((__wm)->trans_wm.enable), \
+	enast((__wm)->sagv.wm0.enable), \
+	enast((__wm)->sagv.trans_wm.enable)

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

-:25: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__wm' - possible side-effects?
#25: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:2617:
+#define PLANE_WM_EN_ARGS(__wm) \
+	enast((__wm)->wm[0].enable), enast((__wm)->wm[1].enable), \
+	enast((__wm)->wm[2].enable), enast((__wm)->wm[3].enable), \
+	enast((__wm)->wm[4].enable), enast((__wm)->wm[5].enable), \
+	enast((__wm)->wm[6].enable), enast((__wm)->wm[7].enable), \
+	enast((__wm)->trans_wm.enable), \
+	enast((__wm)->sagv.wm0.enable), \
+	enast((__wm)->sagv.trans_wm.enable)

-:35: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#35: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:2627:
+#define PLANE_WM_ARGS(__wm, __field) \
+	(__wm)->wm[0].__field, (__wm)->wm[1].__field, \
+	(__wm)->wm[2].__field, (__wm)->wm[3].__field, \
+	(__wm)->wm[4].__field, (__wm)->wm[5].__field, \
+	(__wm)->wm[6].__field, (__wm)->wm[7].__field, \
+	(__wm)->trans_wm.__field, \
+	(__wm)->sagv.wm0.__field, \
+	(__wm)->sagv.trans_wm.__field

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

-:35: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__wm' - possible side-effects?
#35: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:2627:
+#define PLANE_WM_ARGS(__wm, __field) \
+	(__wm)->wm[0].__field, (__wm)->wm[1].__field, \
+	(__wm)->wm[2].__field, (__wm)->wm[3].__field, \
+	(__wm)->wm[4].__field, (__wm)->wm[5].__field, \
+	(__wm)->wm[6].__field, (__wm)->wm[7].__field, \
+	(__wm)->trans_wm.__field, \
+	(__wm)->sagv.wm0.__field, \
+	(__wm)->sagv.trans_wm.__field

-:35: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__field' - possible side-effects?
#35: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:2627:
+#define PLANE_WM_ARGS(__wm, __field) \
+	(__wm)->wm[0].__field, (__wm)->wm[1].__field, \
+	(__wm)->wm[2].__field, (__wm)->wm[3].__field, \
+	(__wm)->wm[4].__field, (__wm)->wm[5].__field, \
+	(__wm)->wm[6].__field, (__wm)->wm[7].__field, \
+	(__wm)->trans_wm.__field, \
+	(__wm)->sagv.wm0.__field, \
+	(__wm)->sagv.trans_wm.__field

total: 2 errors, 0 warnings, 3 checks, 158 lines checked
27adaeaea14b drm/i915/wm: Allow SAGV with multiple pipes on pre-icl


