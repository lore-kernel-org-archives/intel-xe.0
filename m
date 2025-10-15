Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C491CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 03:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F91010E728;
	Wed, 15 Oct 2025 03:29:25 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED47510E24F;
 Wed, 15 Oct 2025 03:29:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Add_i?=
 =?utf-8?q?nitial_support_for_Xe3p=5FLPD?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Oct 2025 03:29:23 -0000
Message-ID: <176049896396.14304.9870213036273140002@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015-xe3p_lpd-basic-enabling-v1-0-d2d1e26520aa@intel.com>
In-Reply-To: <20251015-xe3p_lpd-basic-enabling-v1-0-d2d1e26520aa@intel.com>
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

Series: drm/i915/display: Add initial support for Xe3p_LPD
URL   : https://patchwork.freedesktop.org/series/155951/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b7dfccf636a2844f60a302a37bbf64123359aad1
Author: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Date:   Wed Oct 15 00:15:32 2025 -0300

    drm/i915/nvls: Add NVL-S display support
    
    Add platform description and PCI IDs for NVL-S.
    
    BSpec: 74201
    Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb drm-intel
cb7b097861d6 drm/xe/nvl: Define NVL-S platform
-:60: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#60: FILE: include/drm/intel/pciids.h:891:
+#define INTEL_NVLS_IDS(MACRO__, ...) \
+	MACRO__(0xD740, ## __VA_ARGS__), \
+	MACRO__(0xD741, ## __VA_ARGS__), \
+	MACRO__(0xD742, ## __VA_ARGS__), \
+	MACRO__(0xD743, ## __VA_ARGS__), \
+	MACRO__(0xD744, ## __VA_ARGS__), \
+	MACRO__(0xD745, ## __VA_ARGS__)

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

-:60: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#60: FILE: include/drm/intel/pciids.h:891:
+#define INTEL_NVLS_IDS(MACRO__, ...) \
+	MACRO__(0xD740, ## __VA_ARGS__), \
+	MACRO__(0xD741, ## __VA_ARGS__), \
+	MACRO__(0xD742, ## __VA_ARGS__), \
+	MACRO__(0xD743, ## __VA_ARGS__), \
+	MACRO__(0xD744, ## __VA_ARGS__), \
+	MACRO__(0xD745, ## __VA_ARGS__)

total: 1 errors, 0 warnings, 1 checks, 41 lines checked
0c42cca615a1 drm/i915/xe3p_lpd: Add Xe3p_LPD display IP features
330b44c26177 drm/i915/xe3p_lpd: Drop north display reset option programming
70f20c4da10a drm/i915/display: Use braces for if-ladder in intel_bw_init_hw()
a6348acfc38c drm/i915/dram: Add field ecc_impacting_de
ddf354452925 drm/i915/xe3p_lpd: Update bandwidth parameters
6c9db0ebba04 drm/i915/xe3p_lpd: Expand bifield masks dbuf blocks fields
61602c62984a drm/i915/xe3p_lpd: Support UINT16 formats
-:22: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#22: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:139:
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
c0f3c5e27761 drm/i915/xe3p_lpd: Extend FBC support to UINT16 formats
2682d541530a drm/i915/xe3p_lpd: Horizontal flip support for linear surfaces
5a42fe705771 drm/i915/xe3p_lpd: Wait for AUX channel power status
a5350e28aa69 drm/i915/xe3p_lpd: Underrun debuggability and error codes/hints
633f9fbedf83 drm/i915/xe3p_lpd: Remove gamma,csc bottom color checks
ba7a74f83dc1 drm/i915/xe3p_lpd: Adapt to updates on MBUS_CTL/DBUF_CTL registers
933fbf40c127 drm/i915/xe3p_lpd: Always apply level-0 watermark adjustment
34afaade5048 drm/i915/xe3p_lpd: Add CDCLK table
0f02cbcd0c99 drm/i915/xe3p_lpd: Load DMC firmware
3d300d73b726 drm/i915/xe3p_lpd: Drop support for interlace mode
1100816da119 drm/i915/xe3p_lpd: PSR SU minimum lines is 4
44608e6ff811 drm/i915/xe3p_lpd: Enable system caching for FBC
-:109: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#109: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:131:
+#define   FBC_SYS_CACHE_START_BASE(base)        REG_FIELD_PREP(FBC_SYS_CACHE_START_BASE_MASK, (base))

-:111: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#111: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:133:
+#define   FBC_SYS_CACHEABLE_RANGE(range)        REG_FIELD_PREP(FBC_SYS_CACHEABLE_RANGE_MASK, (range))

total: 0 errors, 2 warnings, 0 checks, 90 lines checked
98c836ca888c drm/i915/xe3p_lpd: Extend Wa_16025573575
f47221862843 drm/i915/xe3p_lpd: Don't allow odd ypan or ysize with semiplanar format
b17c3b6c7d2c drm/i915/xe3p_lpd: Reload DMC MMIO for pipes C and D
8b814eec0414 drm/i915/xe3p_lpd: Introduce pixel normalizer config support
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
858d43a09147 drm/i915/xe3p_lpd: Add FBC support for FP16 formats
27281b8793ca drm/i915/xe3p_lpd: Enable pixel normalizer for fp16 formats for FBC
52ab3d726d6b drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc
6d96729efdb5 drm/i915/power: Use intel_encoder_is_tc()
e64f450eb228 drm/i915/display: Handle dedicated external ports in intel_encoder_is_tc()
3e903749b9af drm/i915/wm: don't use method1 in Xe3p_LPD onwards
da3f6b527275 drm/i915/xe3p_lpd: Extend Type-C flow for static DDI allocation
-:49: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tc_port' - possible side-effects?
#49: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2943:
+#define   IOM_DDI_CONSUMER_STATIC_TC(tc_port)	IOM_DDI_CONSUMER(tc_port, 0x8 + (tc_port))

total: 0 errors, 0 warnings, 1 checks, 219 lines checked
b7dfccf636a2 drm/i915/nvls: Add NVL-S display support


