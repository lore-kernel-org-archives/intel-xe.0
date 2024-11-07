Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2789D5D693
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 21:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD1C10E8FC;
	Thu,  7 Nov 2024 21:43:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4AE10E8FC;
 Thu,  7 Nov 2024 21:43:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_conve?=
 =?utf-8?q?rt_display_feature_helpers_to_struct_intel=5Fdisplay_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Nov 2024 21:43:57 -0000
Message-ID: <173101583736.1424299.17534821733129947910@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1731015333.git.jani.nikula@intel.com>
In-Reply-To: <cover.1731015333.git.jani.nikula@intel.com>
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

Series: drm/i915/display: convert display feature helpers to struct intel_display (rev4)
URL   : https://patchwork.freedesktop.org/series/140887/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c7e5796cb15464bd18613caa38bb7a85cf2c07ed
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Nov 7 23:36:49 2024 +0200

    drm/i915/display: add mobile platform group
    
    Identify mobile platforms separately in display, using the platform
    group mechanism. This enables dropping the dependency on i915_drv.h
    IS_MOBILE() from display code.
    
    v2: Make snb_display static (kernel test robot)
    
    Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 85b1b17ed748e1f68ac83052916a95d624405c97 drm-intel
887f9b9428ec drm/i915/display: identify discrete graphics
252bd491bd2c drm/i915/display: convert HAS_D12_PLANE_MINIMIZATION() to struct intel_display
-:36: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#36: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:147:
+#define HAS_D12_PLANE_MINIMIZATION(__display)	((__display)->platform.rocketlake || (__display)->platform.alderlake_s)

-:36: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#36: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:147:
+#define HAS_D12_PLANE_MINIMIZATION(__display)	((__display)->platform.rocketlake || (__display)->platform.alderlake_s)

total: 0 errors, 1 warnings, 1 checks, 68 lines checked
fb4138c0a40f drm/i915/display: convert HAS_4TILE() to struct intel_display
-:22: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#22: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:141:
+#define HAS_4TILE(__display)		((__display)->platform.dg2 || DISPLAY_VER(__display) >= 14)

total: 0 errors, 0 warnings, 1 checks, 56 lines checked
48aefba455a7 drm/i915/display: convert HAS_DOUBLE_BUFFERED_M_N() to struct intel_display
-:44: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#44: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:152:
+#define HAS_DOUBLE_BUFFERED_M_N(__display)	(DISPLAY_VER(__display) >= 9 || (__display)->platform.broadwell)

-:44: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#44: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:152:
+#define HAS_DOUBLE_BUFFERED_M_N(__display)	(DISPLAY_VER(__display) >= 9 || (__display)->platform.broadwell)

total: 0 errors, 1 warnings, 1 checks, 48 lines checked
12f65497fdec drm/i915/display: convert HAS_DP20() to struct intel_display
-:149: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#149: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:155:
+#define HAS_DP20(__display)		((__display)->platform.dg2 || DISPLAY_VER(__display) >= 14)

total: 0 errors, 0 warnings, 1 checks, 150 lines checked
6228c78a75a4 drm/i915/display: convert HAS_GMBUS_BURST_READ() to struct intel_display
-:23: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#23: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:164:
+#define HAS_GMBUS_BURST_READ(__display)	(DISPLAY_VER(__display) >= 10 || (__display)->platform.kabylake)

-:23: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#23: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:164:
+#define HAS_GMBUS_BURST_READ(__display)	(DISPLAY_VER(__display) >= 10 || (__display)->platform.kabylake)

total: 0 errors, 1 warnings, 1 checks, 23 lines checked
a62a0a1aed7c drm/i915/display: convert HAS_IPS() to struct intel_display
-:58: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#58: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:168:
+#define HAS_IPS(__display)		((__display)->platform.haswell_ult || (__display)->platform.broadwell)

-:58: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#58: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:168:
+#define HAS_IPS(__display)		((__display)->platform.haswell_ult || (__display)->platform.broadwell)

total: 0 errors, 1 warnings, 1 checks, 33 lines checked
edb2040a377c drm/i915/display: convert HAS_MBUS_JOINING() to struct intel_display
-:25: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#25: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:171:
+#define HAS_MBUS_JOINING(__display)	((__display)->platform.alderlake_p || DISPLAY_VER(__display) >= 14)

-:25: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#25: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:171:
+#define HAS_MBUS_JOINING(__display)	((__display)->platform.alderlake_p || DISPLAY_VER(__display) >= 14)

total: 0 errors, 1 warnings, 1 checks, 82 lines checked
443759d37e25 drm/i915/display: convert HAS_SAGV() to struct intel_display
-:22: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#22: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:177:
+#define HAS_SAGV(__display)		(DISPLAY_VER(__display) >= 9 && \
+					 !(__display)->platform.broxton && !(__display)->platform.geminilake)

-:23: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#23: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:178:
+					 !(__display)->platform.broxton && !(__display)->platform.geminilake)

total: 0 errors, 1 warnings, 1 checks, 115 lines checked
382d6c78772b drm/i915/display: convert HAS_HW_SAGV_WM() to struct intel_display
-:54: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#54: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:166:
+#define HAS_HW_SAGV_WM(__display)	(DISPLAY_VER(__display) >= 13 && !(__display)->platform.dgfx)

-:54: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#54: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:166:
+#define HAS_HW_SAGV_WM(__display)	(DISPLAY_VER(__display) >= 13 && !(__display)->platform.dgfx)

total: 0 errors, 1 warnings, 1 checks, 161 lines checked
9cb3ff697cae drm/i915/display: convert HAS_ULTRAJOINER() to struct intel_display
-:82: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#82: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:182:
+#define HAS_ULTRAJOINER(__display)	((DISPLAY_VER(__display) >= 20 || \
+					  ((__display)->platform.dgfx && DISPLAY_VER(__display) == 14)) && \
+					 HAS_DSC(__display))

-:83: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#83: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:183:
+					  ((__display)->platform.dgfx && DISPLAY_VER(__display) == 14)) && \

total: 0 errors, 1 warnings, 1 checks, 75 lines checked
b7a5e7abd763 drm/i915/display: rename i915 parameter to __display in feature helpers
-:28: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#28: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:143:
+#define HAS_BIGJOINER(__display)	(DISPLAY_VER(__display) >= 11 && HAS_DSC(__display))

-:31: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#31: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:146:
+#define HAS_CUR_FBC(__display)		(!HAS_GMCH(__display) && IS_DISPLAY_VER(__display, 7, 13))

-:37: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#37: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:148:
+#define HAS_DBUF_OVERLAP_DETECTION(__display)	(DISPLAY_RUNTIME_INFO(__display)->has_dbuf_overlap_detection)

-:58: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#58: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:159:
+#define HAS_DSC_MST(__display)		(DISPLAY_VER(__display) >= 12 && HAS_DSC(__display))

-:90: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#90: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:179:
+#define HAS_TRANSCODER(__display, trans)	((DISPLAY_RUNTIME_INFO(__display)->cpu_transcoder_mask & \

-:113: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#113: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:194:
+#define IS_DISPLAY_VERx100(__display, from, until) ( \
 	BUILD_BUG_ON_ZERO((from) < 200) + \
+	(DISPLAY_VERx100(__display) >= (from) && \
+	 DISPLAY_VERx100(__display) <= (until)))

-:113: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'from' - possible side-effects?
#113: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:194:
+#define IS_DISPLAY_VERx100(__display, from, until) ( \
 	BUILD_BUG_ON_ZERO((from) < 200) + \
+	(DISPLAY_VERx100(__display) >= (from) && \
+	 DISPLAY_VERx100(__display) <= (until)))

-:137: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#137: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:214:
+#define IS_DISPLAY_VERx100_STEP(__display, ipver, from, until) \
+	(IS_DISPLAY_VERx100((__display), (ipver), (ipver)) && \
+	 IS_DISPLAY_STEP((__display), (from), (until)))

-:137: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ipver' - possible side-effects?
#137: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:214:
+#define IS_DISPLAY_VERx100_STEP(__display, ipver, from, until) \
+	(IS_DISPLAY_VERx100((__display), (ipver), (ipver)) && \
+	 IS_DISPLAY_STEP((__display), (from), (until)))

-:152: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#152: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:222:
+#define DISPLAY_VERx100(__display)	(DISPLAY_RUNTIME_INFO(__display)->ip.ver * 100 + \
+					 DISPLAY_RUNTIME_INFO(__display)->ip.rel)

-:154: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#154: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:224:
+#define IS_DISPLAY_VER(__display, from, until) \
+	(DISPLAY_VER(__display) >= (from) && DISPLAY_VER(__display) <= (until))

-:163: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#163: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:229:
+#define IS_DISPLAY_STEP(__display, since, until) \
+	(drm_WARN_ON(__to_intel_display(__display)->drm, INTEL_DISPLAY_STEP(__display) == STEP_NONE), \
+	 INTEL_DISPLAY_STEP(__display) >= (since) && INTEL_DISPLAY_STEP(__display) < (until))

-:164: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#164: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:230:
+	(drm_WARN_ON(__to_intel_display(__display)->drm, INTEL_DISPLAY_STEP(__display) == STEP_NONE), \

total: 0 errors, 3 warnings, 10 checks, 149 lines checked
e981de2d1f3e drm/i915/display: convert display device identification to struct intel_display
78519a892d50 drm/i915/display: pass struct pci_dev * to intel_display_device_probe()
c7e5796cb154 drm/i915/display: add mobile platform group
-:119: WARNING:LONG_LINE_COMMENT: line length of 134 exceeds 100 columns
#119: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:479:
+	.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C) | BIT(PORT_D), /* DP A, SDVO/HDMI/DP B, HDMI/DP C/D */

-:156: WARNING:LONG_LINE_COMMENT: line length of 134 exceeds 100 columns
#156: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:504:
+	.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C) | BIT(PORT_D), /* DP A, SDVO/HDMI/DP B, HDMI/DP C/D */

total: 0 errors, 2 warnings, 0 checks, 180 lines checked


