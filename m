Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6853CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 01:38:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D17C10E67A;
	Wed, 22 Oct 2025 01:38:37 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50A910E35B;
 Wed, 22 Oct 2025 01:38:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Add_i?=
 =?utf-8?q?nitial_support_for_Xe3p=5FLPD_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Oct 2025 01:38:36 -0000
Message-ID: <176109711692.39670.11272871991363496335@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251021-xe3p_lpd-basic-enabling-v2-0-10eae6d655b8@intel.com>
In-Reply-To: <20251021-xe3p_lpd-basic-enabling-v2-0-10eae6d655b8@intel.com>
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

Series: drm/i915/display: Add initial support for Xe3p_LPD (rev2)
URL   : https://patchwork.freedesktop.org/series/155951/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8677d3b99d5fd579c143b22605d99121e2482e8a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 387f9710ae42dfc13a4855b133bc0ccdc6b25ed9
Author: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Date:   Tue Oct 21 21:28:57 2025 -0300

    drm/i915/nvls: Add NVL-S display support
    
    Add platform description and PCI IDs for NVL-S.
    
    BSpec: 74201
    Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch fb0f56ad8a2c9953c57c3337a72ccbf9c5050687 drm-intel
83c8f8f1f923 drm/i915/xe3p_lpd: Add Xe3p_LPD display IP features
6b15382528f0 drm/i915/xe3p_lpd: Drop north display reset option programming
61bf516479a9 drm/i915/display: Use braces for if-ladder in intel_bw_init_hw()
62329d343d1a drm/i915/dram: Add field ecc_impacting_de_bw
2272d8259525 drm/i915/xe3p_lpd: Update bandwidth parameters
000a8ad89bba drm/i915/xe3p_lpd: Expand bifield masks dbuf blocks fields
51f2795f4702 drm/i915/xe3p_lpd: Support UINT16 formats
-:26: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#26: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:139:
+#define ICL_HDR_PLANE_FORMATS		\
+	DRM_FORMAT_C8,			\
+	DRM_FORMAT_RGB565,		\
+	DRM_FORMAT_XRGB8888,		\
+	DRM_FORMAT_XBGR8888,		\
+	DRM_FORMAT_ARGB8888,		\
+	DRM_FORMAT_ABGR8888,		\
+	DRM_FORMAT_XRGB2101010,		\
+	DRM_FORMAT_XBGR2101010,		\
+	DRM_FORMAT_ARGB2101010,		\
+	DRM_FORMAT_ABGR2101010,		\
+	DRM_FORMAT_XRGB16161616F,	\
+	DRM_FORMAT_XBGR16161616F,	\
+	DRM_FORMAT_ARGB16161616F,	\
+	DRM_FORMAT_ABGR16161616F,	\
+	DRM_FORMAT_YUYV,		\
+	DRM_FORMAT_YVYU,		\
+	DRM_FORMAT_UYVY,		\
+	DRM_FORMAT_VYUY,		\
+	DRM_FORMAT_NV12,		\
+	DRM_FORMAT_P010,		\
+	DRM_FORMAT_P012,		\
+	DRM_FORMAT_P016,		\
+	DRM_FORMAT_Y210,		\
+	DRM_FORMAT_Y212,		\
+	DRM_FORMAT_Y216,		\
+	DRM_FORMAT_XYUV8888,		\
+	DRM_FORMAT_XVYU2101010,		\
+	DRM_FORMAT_XVYU12_16161616,	\
+	DRM_FORMAT_XVYU16161616

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

total: 1 errors, 0 warnings, 0 checks, 134 lines checked
31399ec88037 drm/i915/xe3p_lpd: Extend FBC support to UINT16 formats
690063b5e6dd drm/i915/xe3p_lpd: Horizontal flip support for linear surfaces
d25b6d5431b3 drm/i915/xe3p_lpd: Wait for AUX channel power status
c9299e73b03a drm/i915/xe3p_lpd: Underrun debuggability and error codes/hints
92f80d12e10f drm/i915/xe3p_lpd: Remove gamma,csc bottom color checks
b27a1a95fe61 drm/i915/xe3p_lpd: Adapt to updates on MBUS_CTL/DBUF_CTL registers
-:90: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#90: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:41:
+#define   MBUS_JOIN_PIPE_SELECT(pipe)			REG_FIELD_PREP(MBUS_JOIN_PIPE_SELECT_MASK, pipe)

-:93: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#93: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:44:
+#define   MBUS_TRANSLATION_THROTTLE_MIN(val)		REG_FIELD_PREP(MBUS_TRANSLATION_THROTTLE_MIN_MASK, val)

-:95: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#95: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:46:
+#define   XE3P_MBUS_TRANSLATION_THROTTLE_MIN(val)	REG_FIELD_PREP(XE3P_MBUS_TRANSLATION_THROTTLE_MIN_MASK, val)

-:129: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#129: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:68:
+#define  DBUF_TRACKER_STATE_SERVICE(x)			REG_FIELD_PREP(DBUF_TRACKER_STATE_SERVICE_MASK, x)

-:133: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#133: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:72:
+#define  XE3P_DBUF_MIN_TRACKER_STATE_SERVICE(x)		REG_FIELD_PREP(XE3P_DBUF_MIN_TRACKER_STATE_SERVICE_MASK, x)

total: 0 errors, 5 warnings, 0 checks, 93 lines checked
d974777d47bf drm/i915/wm: Reorder adjust_wm_latency() for Xe3_LPD
dd6fb557f35d drm/i915/xe3p_lpd: Always apply level-0 watermark adjustment
ca8e49b5183f drm/i915/xe3p_lpd: Add CDCLK table
b377c411618d drm/i915/xe3p_lpd: Load DMC firmware
88c79c22277f drm/i915/xe3p_lpd: Drop support for interlace mode
53d11d92ebdd drm/i915/xe3p_lpd: PSR SU minimum lines is 4
ce331e8fadb3 drm/i915/xe3p_lpd: Enable system caching for FBC
-:109: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#109: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:133:
+#define   FBC_SYS_CACHE_START_BASE(base)        REG_FIELD_PREP(FBC_SYS_CACHE_START_BASE_MASK, (base))

-:111: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#111: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:135:
+#define   FBC_SYS_CACHEABLE_RANGE(range)        REG_FIELD_PREP(FBC_SYS_CACHEABLE_RANGE_MASK, (range))

total: 0 errors, 2 warnings, 0 checks, 90 lines checked
a3bca120437c drm/i915/xe3p_lpd: Extend Wa_16025573575
0eb17bacc065 drm/i915/xe3p_lpd: Don't allow odd ypan or ysize with semiplanar format
12b452115ca9 drm/i915/xe3p_lpd: Reload DMC MMIO for pipes C and D
83fba4a5f9c4 drm/i915/xe3p_lpd: Introduce pixel normalizer config support
-:84: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#84: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:464:
+								_PLANE_PIXEL_NORMALIZE_1_A, _PLANE_PIXEL_NORMALIZE_1_B, \

-:85: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#85: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:465:
+								_PLANE_PIXEL_NORMALIZE_2_A, _PLANE_PIXEL_NORMALIZE_2_B)

-:88: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#88: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:468:
+#define   PLANE_PIXEL_NORMALIZE_NORM_FACTOR(val)	REG_FIELD_PREP(PLANE_PIXEL_NORMALIZE_NORM_FACTOR_MASK, (val))

total: 0 errors, 3 warnings, 0 checks, 57 lines checked
de0cf9ba0fb0 drm/i915/xe3p_lpd: Add FBC support for FP16 formats
e2f2a8b7c679 drm/i915/xe3p_lpd: Enable pixel normalizer for fp16 formats for FBC
34fb910baedf drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc
2075fb0d821d drm/i915/power: Use intel_encoder_is_tc()
e534f54d6aa3 drm/i915/display: Handle dedicated external ports in intel_encoder_is_tc()
20c7de16a9e7 drm/i915/wm: don't use method1 in Xe3p_LPD onwards
9db84c8aed8e drm/i915/xe3p_lpd: Extend Type-C flow for static DDI allocation
-:49: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tc_port' - possible side-effects?
#49: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2932:
+#define   IOM_DDI_CONSUMER_STATIC_TC(tc_port)	IOM_DDI_CONSUMER(tc_port, 0x8 + (tc_port))

total: 0 errors, 0 warnings, 1 checks, 219 lines checked
387f9710ae42 drm/i915/nvls: Add NVL-S display support


