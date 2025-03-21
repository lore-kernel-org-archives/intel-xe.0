Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12588C35FFF
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 10:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF93910E7A2;
	Fri, 21 Mar 2025 10:58:54 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AB910E7A2;
 Fri, 21 Mar 2025 10:58:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_yet_a?=
 =?utf-8?q?nother_batch_of_struct_intel=5Fdisplay_conversions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 10:58:53 -0000
Message-ID: <174255473385.63987.4086101351711379960@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <cover.1742554320.git.jani.nikula@intel.com>
In-Reply-To: <cover.1742554320.git.jani.nikula@intel.com>
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

Series: drm/i915/display: yet another batch of struct intel_display conversions
URL   : https://patchwork.freedesktop.org/series/146583/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ffffe6f60dcd76af20e87fbf89cb790d20da9cf5
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Mar 21 12:52:56 2025 +0200

    drm/i915/pch: convert intel_pch_refclk.c to struct intel_display
    
    Going forward, struct intel_display is the main display device data
    pointer. Convert as much as possible of intel_pch_refclk.[ch] to struct
    intel_display.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch b15a87713d14b1c2986f47a622c5a8c5458e2396 drm-intel
157a823726db drm/i915/dsi: convert vlv_dsi.[ch] to struct intel_display
-:682: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#682: FILE: drivers/gpu/drm/i915/display/vlv_dsi.h:26:
 }
+static inline void vlv_dsi_init(struct intel_display *display)

total: 0 errors, 0 warnings, 1 checks, 605 lines checked
78c21b7ecb51 drm/i915/dsi: convert vlv_dsi_pll.[ch] to struct intel_display
5cfc55fe731a drm/i915/dsi: convert parameter printing to drm_printer
7cd54ee34257 drm/i915/dsi: convert intel_dsi_vbt.[ch] to struct intel_display
573b0bf6e8a6 drm/i915/dsi: convert intel_dsi_dcs_backlight.c to struct intel_display
c2f512b0d2b6 drm/i915/dvo: convert intel_dvo.[ch] to struct intel_display
8f673062a222 drm/i915/lvds: convert intel_lvds.[ch] to struct intel_display
-:632: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#632: FILE: drivers/gpu/drm/i915/display/intel_lvds.h:28:
 }
+static inline void intel_lvds_init(struct intel_display *display)

-:636: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#636: FILE: drivers/gpu/drm/i915/display/intel_lvds.h:31:
 }
+static inline struct intel_encoder *intel_get_lvds_encoder(struct intel_display *display)

-:641: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#641: FILE: drivers/gpu/drm/i915/display/intel_lvds.h:35:
 }
+static inline bool intel_is_dual_link_lvds(struct intel_display *display)

-:654: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#654: FILE: drivers/gpu/drm/i915/display/intel_pch_display.c:96:
+				 intel_lvds_port_enabled(display, PCH_LVDS, &port_pipe) && port_pipe == pipe,

total: 0 errors, 1 warnings, 3 checks, 589 lines checked
ae3e6484a037 drm/i915/tc: convert intel_tc.c to struct intel_display
-:860: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#860: FILE: drivers/gpu/drm/i915/display/intel_tc.c:1784:
+	drm_WARN_ON(display->drm, tc->mode != TC_PORT_TBT_ALT &&
 				!tc_phy_is_owned(tc));

total: 0 errors, 0 warnings, 1 checks, 821 lines checked
8508400fbb34 drm/i915/atomic: convert intel_atomic.c to struct intel_display
0614f320a48f drm/i915/display: convert intel_crtc_state_dump.c to struct intel_display
976a3430b435 drm/i915/pch: convert intel_pch_display.[ch] to struct intel_display
-:486: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#486: FILE: drivers/gpu/drm/i915/display/intel_pch_display.h:93:
 }
+static inline void intel_pch_sanitize(struct intel_display *display)

total: 0 errors, 0 warnings, 1 checks, 438 lines checked
ffffe6f60dcd drm/i915/pch: convert intel_pch_refclk.c to struct intel_display
-:467: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#467: FILE: drivers/gpu/drm/i915/display/intel_pch_refclk.h:26:
 }
+static inline void lpt_disable_iclkip(struct intel_display *display)

-:471: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#471: FILE: drivers/gpu/drm/i915/display/intel_pch_refclk.h:29:
 }
+static inline int lpt_get_iclkip(struct intel_display *display)

-:480: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#480: FILE: drivers/gpu/drm/i915/display/intel_pch_refclk.h:37:
 }
+static inline void intel_init_pch_refclk(struct intel_display *display)

-:484: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#484: FILE: drivers/gpu/drm/i915/display/intel_pch_refclk.h:40:
 }
+static inline void lpt_disable_clkout_dp(struct intel_display *display)

total: 0 errors, 0 warnings, 4 checks, 434 lines checked


