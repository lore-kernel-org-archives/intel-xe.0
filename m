Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D080AD1268D
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 11:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCD910E013;
	Tue,  5 Nov 2024 11:34:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D300710E013;
 Tue,  5 Nov 2024 11:34:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_conve?=
 =?utf-8?q?rt_display_feature_helpers_to_struct_intel=5Fdisplay_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Nov 2024 11:34:31 -0000
Message-ID: <173080647185.1411686.18186195512555387794@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1730740629.git.jani.nikula@intel.com>
In-Reply-To: <cover.1730740629.git.jani.nikula@intel.com>
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

Series: drm/i915/display: convert display feature helpers to struct intel_display (rev2)
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
commit 2efc51bf485b77f7c98aa58a60a255465bf38929
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Nov 4 19:19:29 2024 +0200

    drm/i915/display: add mobile platform group
    
    Identify mobile platforms separately in display, using the platform
    group mechanism. This enables dropping the dependency on i915_drv.h
    IS_MOBILE() from display code.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 913062707a924df0837c0d9eb9745ba52fd92958 drm-intel
fc981100a379 drm/i915/display: identify discrete graphics
4f638e044f67 drm/i915/display: convert HAS_D12_PLANE_MINIMIZATION() to struct intel_display
-:34: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#34: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:147:
+#define HAS_D12_PLANE_MINIMIZATION(__display)	((__display)->platform.rocketlake || (__display)->platform.alderlake_s)

-:34: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#34: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:147:
+#define HAS_D12_PLANE_MINIMIZATION(__display)	((__display)->platform.rocketlake || (__display)->platform.alderlake_s)

total: 0 errors, 1 warnings, 1 checks, 68 lines checked
ad51992903e1 drm/i915/display: convert HAS_4TILE() to struct intel_display
-:20: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#20: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:141:
+#define HAS_4TILE(__display)		((__display)->platform.dg2 || DISPLAY_VER(__display) >= 14)

total: 0 errors, 0 warnings, 1 checks, 56 lines checked
f340fb760e26 drm/i915/display: convert HAS_DOUBLE_BUFFERED_M_N() to struct intel_display
-:42: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#42: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:152:
+#define HAS_DOUBLE_BUFFERED_M_N(__display)	(DISPLAY_VER(__display) >= 9 || (__display)->platform.broadwell)

-:42: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#42: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:152:
+#define HAS_DOUBLE_BUFFERED_M_N(__display)	(DISPLAY_VER(__display) >= 9 || (__display)->platform.broadwell)

total: 0 errors, 1 warnings, 1 checks, 48 lines checked
2a9a7a7900f2 drm/i915/display: convert HAS_DP20() to struct intel_display
-:142: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#142: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:154:
+#define HAS_DP20(__display)		((__display)->platform.dg2 || DISPLAY_VER(__display) >= 14)

total: 0 errors, 0 warnings, 1 checks, 146 lines checked
fb96fb996bf7 drm/i915/display: convert HAS_GMBUS_BURST_READ() to struct intel_display
-:21: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#21: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:163:
+#define HAS_GMBUS_BURST_READ(__display)	(DISPLAY_VER(__display) >= 10 || (__display)->platform.kabylake)

-:21: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#21: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:163:
+#define HAS_GMBUS_BURST_READ(__display)	(DISPLAY_VER(__display) >= 10 || (__display)->platform.kabylake)

total: 0 errors, 1 warnings, 1 checks, 23 lines checked
907e8f84cd2c drm/i915/display: convert HAS_IPS() to struct intel_display
-:56: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#56: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:167:
+#define HAS_IPS(__display)		((__display)->platform.haswell_ult || (__display)->platform.broadwell)

-:56: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#56: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:167:
+#define HAS_IPS(__display)		((__display)->platform.haswell_ult || (__display)->platform.broadwell)

total: 0 errors, 1 warnings, 1 checks, 33 lines checked
96f148a97d01 drm/i915/display: convert HAS_MBUS_JOINING() to struct intel_display
-:21: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#21: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:170:
+#define HAS_MBUS_JOINING(__display)	((__display)->platform.alderlake_p || DISPLAY_VER(__display) >= 14)

-:21: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#21: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:170:
+#define HAS_MBUS_JOINING(__display)	((__display)->platform.alderlake_p || DISPLAY_VER(__display) >= 14)

total: 0 errors, 1 warnings, 1 checks, 61 lines checked
2cd4644e186b drm/i915/display: convert HAS_SAGV() to struct intel_display
-:20: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#20: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:176:
+#define HAS_SAGV(__display)		(DISPLAY_VER(__display) >= 9 && \
+					 !(__display)->platform.broxton && !(__display)->platform.geminilake)

-:21: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#21: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:177:
+					 !(__display)->platform.broxton && !(__display)->platform.geminilake)

total: 0 errors, 1 warnings, 1 checks, 115 lines checked
c2e8820352a3 drm/i915/display: convert HAS_HW_SAGV_WM() to struct intel_display
-:50: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#50: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:165:
+#define HAS_HW_SAGV_WM(__display)	(DISPLAY_VER(__display) >= 13 && !(__display)->platform.dgfx)

-:50: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#50: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:165:
+#define HAS_HW_SAGV_WM(__display)	(DISPLAY_VER(__display) >= 13 && !(__display)->platform.dgfx)

total: 0 errors, 1 warnings, 1 checks, 161 lines checked
9e0af7d2f1cb drm/i915/display: convert HAS_ULTRAJOINER() to struct intel_display
-:80: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#80: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:181:
+#define HAS_ULTRAJOINER(__display)	((DISPLAY_VER(__display) >= 20 || \
+					  ((__display)->platform.dgfx && DISPLAY_VER(__display) == 14)) && \
+					 HAS_DSC(__display))

-:81: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#81: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:182:
+					  ((__display)->platform.dgfx && DISPLAY_VER(__display) == 14)) && \

total: 0 errors, 1 warnings, 1 checks, 75 lines checked
83aac2f42d77 drm/i915/display: rename i915 parameter to __display in feature helpers
-:27: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#27: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:143:
+#define HAS_BIGJOINER(__display)	(DISPLAY_VER(__display) >= 11 && HAS_DSC(__display))

-:30: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#30: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:146:
+#define HAS_CUR_FBC(__display)		(!HAS_GMCH(__display) && IS_DISPLAY_VER(__display, 7, 13))

-:36: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#36: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:148:
+#define HAS_DBUF_OVERLAP_DETECTION(__display)	(DISPLAY_RUNTIME_INFO(__display)->has_dbuf_overlap_detection)

-:55: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#55: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:158:
+#define HAS_DSC_MST(__display)		(DISPLAY_VER(__display) >= 12 && HAS_DSC(__display))

-:87: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#87: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:178:
+#define HAS_TRANSCODER(__display, trans)	((DISPLAY_RUNTIME_INFO(__display)->cpu_transcoder_mask & \

-:110: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#110: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:193:
+#define IS_DISPLAY_VERx100(__display, from, until) ( \
 	BUILD_BUG_ON_ZERO((from) < 200) + \
+	(DISPLAY_VERx100(__display) >= (from) && \
+	 DISPLAY_VERx100(__display) <= (until)))

-:110: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'from' - possible side-effects?
#110: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:193:
+#define IS_DISPLAY_VERx100(__display, from, until) ( \
 	BUILD_BUG_ON_ZERO((from) < 200) + \
+	(DISPLAY_VERx100(__display) >= (from) && \
+	 DISPLAY_VERx100(__display) <= (until)))

-:134: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#134: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:213:
+#define IS_DISPLAY_VERx100_STEP(__display, ipver, from, until) \
+	(IS_DISPLAY_VERx100((__display), (ipver), (ipver)) && \
+	 IS_DISPLAY_STEP((__display), (from), (until)))

-:134: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ipver' - possible side-effects?
#134: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:213:
+#define IS_DISPLAY_VERx100_STEP(__display, ipver, from, until) \
+	(IS_DISPLAY_VERx100((__display), (ipver), (ipver)) && \
+	 IS_DISPLAY_STEP((__display), (from), (until)))

-:149: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#149: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:221:
+#define DISPLAY_VERx100(__display)	(DISPLAY_RUNTIME_INFO(__display)->ip.ver * 100 + \
+					 DISPLAY_RUNTIME_INFO(__display)->ip.rel)

-:151: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#151: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:223:
+#define IS_DISPLAY_VER(__display, from, until) \
+	(DISPLAY_VER(__display) >= (from) && DISPLAY_VER(__display) <= (until))

-:160: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#160: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:228:
+#define IS_DISPLAY_STEP(__display, since, until) \
+	(drm_WARN_ON(__to_intel_display(__display)->drm, INTEL_DISPLAY_STEP(__display) == STEP_NONE), \
+	 INTEL_DISPLAY_STEP(__display) >= (since) && INTEL_DISPLAY_STEP(__display) < (until))

-:161: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#161: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:229:
+	(drm_WARN_ON(__to_intel_display(__display)->drm, INTEL_DISPLAY_STEP(__display) == STEP_NONE), \

total: 0 errors, 3 warnings, 10 checks, 147 lines checked
7dfdcd96039d drm/i915/display: convert display device identification to struct intel_display
982ef0da5fbd drm/i915/display: pass struct pci_dev * to intel_display_device_probe()
2efc51bf485b drm/i915/display: add mobile platform group
-:115: WARNING:LONG_LINE_COMMENT: line length of 134 exceeds 100 columns
#115: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:479:
+	.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C) | BIT(PORT_D), /* DP A, SDVO/HDMI/DP B, HDMI/DP C/D */

-:152: WARNING:LONG_LINE_COMMENT: line length of 134 exceeds 100 columns
#152: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:504:
+	.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C) | BIT(PORT_D), /* DP A, SDVO/HDMI/DP B, HDMI/DP C/D */

total: 0 errors, 2 warnings, 0 checks, 180 lines checked


