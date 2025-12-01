Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0B2D111A8
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 06:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049EB10E2E2;
	Mon,  1 Dec 2025 06:47:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F87610E10D;
 Mon,  1 Dec 2025 06:47:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Plane_Color_Pipeline_supp?=
 =?utf-8?q?ort_for_Intel_platforms_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Dec 2025 06:47:19 -0000
Message-ID: <176457163964.41555.10217883620842548715@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251201064655.3579280-1-uma.shankar@intel.com>
In-Reply-To: <20251201064655.3579280-1-uma.shankar@intel.com>
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

Series: Plane Color Pipeline support for Intel platforms (rev6)
URL   : https://patchwork.freedesktop.org/series/141788/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d8f5267dc37e79d7f45b81ec2495dcfb6e8d7f14
Author: Uma Shankar <uma.shankar@intel.com>
Date:   Mon Dec 1 12:16:55 2025 +0530

    drm/i915/color: Enable Plane Color Pipelines
    
    Expose color pipeline and add ability to program it.
    
    v2: Set bit to enable multisegmented lut
    v3: s/drm_color_lut_32/drm_color_lut32 (Simon)
    v4: - Fix dsb programming
        - Remove multi-segment LUT, they will be added in later patches
        - Add pipeline only to TGL+
        - Code Refactor
    
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Signed-off-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch 9fcf9189976d387cb9199155c35dd6c826268c52 drm-intel
dbb6832c746b drm/i915/display: Add identifiers for driver specific blocks
c70350e10b61 drm/i915: Add intel_color_op
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 48 lines checked
2cedffcb569b drm/i915/color: Add helper to create intel colorop
f93d30ada8a3 drm/i915/color: Create a transfer function color pipeline
-:41: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#41: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 124 lines checked
f70a9facffd9 drm/i915/color: Add framework to program CSC
b43480bd87b5 drm/i915/color: Preserve sign bit when int_bits is Zero
753d3e1473a5 drm/i915/color: Add plane CTM callback for D12 and beyond
0bc27935d927 drm/i915: Add register definitions for Plane Degamma
-:40: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#40: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:300:
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe)		_PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A, \

-:42: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#42: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:302:
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe)		_PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A, \

-:44: WARNING:LONG_LINE: line length of 123 exceeds 100 columns
#44: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:304:
+#define PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \

-:44: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#44: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:304:
+#define PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \
+									 _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))

-:45: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#45: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:305:
+									 _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))

-:52: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#52: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:312:
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe)		_PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A, \

-:54: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#54: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:314:
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe)		_PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_ENH_2_A, \

-:56: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#56: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:316:
+#define PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe), \

-:56: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#56: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:316:
+#define PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe), \
+									 _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe))

-:57: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#57: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:317:
+									 _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe))

-:67: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#67: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:327:
+#define PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_1(pipe), \

-:67: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#67: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:327:
+#define PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_1(pipe), \
+									 _PLANE_PRE_CSC_GAMC_INDEX_2(pipe))

-:68: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#68: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:328:
+									 _PLANE_PRE_CSC_GAMC_INDEX_2(pipe))

-:78: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#78: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:338:
+#define PLANE_PRE_CSC_GAMC_DATA(pipe, plane, i)		_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \

-:78: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#78: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:338:
+#define PLANE_PRE_CSC_GAMC_DATA(pipe, plane, i)		_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \
+									 _PLANE_PRE_CSC_GAMC_DATA_2(pipe))

-:79: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#79: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:339:
+									 _PLANE_PRE_CSC_GAMC_DATA_2(pipe))

total: 0 errors, 12 warnings, 4 checks, 60 lines checked
688047b90591 drm/i915: Add register definitions for Plane Post CSC
-:39: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#39: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:301:
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A, \

-:40: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#40: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:302:
+								      _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B)

-:41: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#41: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:303:
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A, \

-:42: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#42: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:304:
+								      _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B)

-:43: WARNING:LONG_LINE: line length of 137 exceeds 100 columns
#43: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:305:
+#define PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe), \

-:43: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#43: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:305:
+#define PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe), \
+										 _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe))

-:44: WARNING:LONG_LINE: line length of 125 exceeds 100 columns
#44: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:306:
+										 _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe))

-:50: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#50: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:312:
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A, \

-:51: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#51: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:313:
+							      _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B)

-:52: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#52: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:314:
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A, \

-:53: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#53: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:315:
+							      _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B)

-:54: WARNING:LONG_LINE: line length of 136 exceeds 100 columns
#54: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:316:
+#define PLANE_POST_CSC_GAMC_SEG0_DATA_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe), \

-:54: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#54: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:316:
+#define PLANE_POST_CSC_GAMC_SEG0_DATA_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe), \
+										 _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe))

-:55: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#55: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:317:
+										 _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe))

-:61: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#61: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:323:
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_ENH_1_A, \

-:63: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#63: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:325:
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_ENH_2_A, \

-:65: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#65: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:327:
+#define PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe), \

-:65: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#65: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:327:
+#define PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe), \
+									 _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe))

-:66: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#66: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:328:
+									 _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe))

-:72: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#72: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:334:
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_ENH_1_A, \

-:74: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#74: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:336:
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_ENH_2_A, \

-:76: WARNING:LONG_LINE: line length of 123 exceeds 100 columns
#76: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:338:
+#define PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe), \

-:76: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#76: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:338:
+#define PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe), \
+									 _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe))

-:77: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#77: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:339:
+									 _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe))

-:83: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#83: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:345:
+#define _PLANE_POST_CSC_GAMC_INDEX_1(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_1_A, \

-:85: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#85: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:347:
+#define _PLANE_POST_CSC_GAMC_INDEX_2(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_2_A, \

-:87: WARNING:LONG_LINE: line length of 120 exceeds 100 columns
#87: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:349:
+#define PLANE_POST_CSC_GAMC_INDEX(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_1(pipe), \

-:87: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#87: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:349:
+#define PLANE_POST_CSC_GAMC_INDEX(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_1(pipe), \
+									 _PLANE_POST_CSC_GAMC_INDEX_2(pipe))

-:88: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#88: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:350:
+									 _PLANE_POST_CSC_GAMC_INDEX_2(pipe))

-:98: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#98: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:360:
+#define PLANE_POST_CSC_GAMC_DATA(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_1(pipe), \

-:98: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#98: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:360:
+#define PLANE_POST_CSC_GAMC_DATA(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_1(pipe), \
+									 _PLANE_POST_CSC_GAMC_DATA_2(pipe))

-:99: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#99: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:361:
+									 _PLANE_POST_CSC_GAMC_DATA_2(pipe))

total: 0 errors, 26 warnings, 6 checks, 79 lines checked
b4120f4d09db drm/i915/color: Add framework to program PRE/POST CSC LUT
1639b52e7a7c drm/i915/color: Program Pre-CSC registers
59c545469b16 drm/i915/xelpd: Program Plane Post CSC Registers
2f5cdc667ac3 drm/i915/display: Add registers for 3D LUT
7fcdd42d1f14 drm/i915/color: Add 3D LUT to color pipeline
d8f5267dc37e drm/i915/color: Enable Plane Color Pipelines


