Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4219CD2CE0B
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 17:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED8A10E059;
	Tue, 22 Oct 2024 17:15:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4391310E059;
 Tue, 22 Oct 2024 17:15:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_bunch?=
 =?utf-8?q?_of_struct_intel=5Fdisplay_conversions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Oct 2024 17:15:04 -0000
Message-ID: <172961730427.1310805.14063213158622483835@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1729612605.git.jani.nikula@intel.com>
In-Reply-To: <cover.1729612605.git.jani.nikula@intel.com>
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

Series: drm/i915/display: bunch of struct intel_display conversions
URL   : https://patchwork.freedesktop.org/series/140323/
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
commit 211d7d1470e43581e633c9d433c17fb65f648924
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Oct 22 18:57:28 2024 +0300

    drm/i915/de: remove unnecessary generic wrappers
    
    With many of the intel_de_* callers switched over to struct
    intel_display, we can remove some of the unnecessary generic wrappers.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 26b9d5af7030484e831dd7335a08ec0c3a22f553 drm-intel
0c3d9eb65df4 drm/i915/gmbus: convert to struct intel_display
55c77acbdece drm/i915/cx0: convert to struct intel_display
-:540: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#540: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2767:
+		if (intel_de_wait_for_clear(display, XELPDP_PORT_M2P_MSGBUS_CTL(display, port, lane),

total: 0 errors, 1 warnings, 0 checks, 904 lines checked
842c365d9be3 drm/i915/dpio: convert to struct intel_display
-:564: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#564: FILE: drivers/gpu/drm/i915/display/intel_dpio_phy.h:84:
 }
+static inline void bxt_dpio_phy_init(struct intel_display *display, enum dpio_phy phy)

-:568: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#568: FILE: drivers/gpu/drm/i915/display/intel_dpio_phy.h:87:
 }
+static inline void bxt_dpio_phy_uninit(struct intel_display *display, enum dpio_phy phy)

-:572: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#572: FILE: drivers/gpu/drm/i915/display/intel_dpio_phy.h:90:
 }
+static inline bool bxt_dpio_phy_is_enabled(struct intel_display *display,

-:578: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#578: FILE: drivers/gpu/drm/i915/display/intel_dpio_phy.h:95:
 }
+static inline bool bxt_dpio_phy_verify_state(struct intel_display *display,

total: 0 errors, 0 warnings, 4 checks, 570 lines checked
86c0a1d0033b drm/i915/hdcp: further conversion to struct intel_display
7083e8741d51 drm/i915/dp/hdcp: convert to struct intel_display
9ab5a12c77e4 drm/i915/crt: convert to struct intel_display
-:217: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#217: FILE: drivers/gpu/drm/i915/display/intel_crt.c:497:
+		save_adpa = adpa = intel_de_read(display, crt->adpa_reg);

-:271: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#271: FILE: drivers/gpu/drm/i915/display/intel_crt.c:557:
+	save_adpa = adpa = intel_de_read(display, crt->adpa_reg);

-:672: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#672: FILE: drivers/gpu/drm/i915/display/intel_crt.c:1149:
+		display->fdi.rx_config = intel_de_read(display,
 								FDI_RX_CTL(PIPE_A)) & fdi_config;

-:701: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#701: FILE: drivers/gpu/drm/i915/display/intel_crt.h:26:
 }
+static inline void intel_crt_init(struct intel_display *display)

total: 0 errors, 0 warnings, 4 checks, 702 lines checked
a621e4a5db86 drm/i915/display: convert vlv_wait_port_ready() to struct intel_display
3bad5a48b835 drm/i915/power: convert assert_chv_phy_status() to struct intel_display
832465aa0289 drm/i915/ips: convert to struct intel_display
96835280d818 drm/i915/dsi: convert to struct intel_display
-:1365: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#1365: FILE: drivers/gpu/drm/i915/display/icl_dsi.c:2040:
+	if (drm_WARN_ON(display->drm, intel_connector->panel.vbt.dsi.cabc_ports & ~intel_dsi->ports))

total: 0 errors, 1 warnings, 0 checks, 1302 lines checked
211d7d1470e4 drm/i915/de: remove unnecessary generic wrappers


