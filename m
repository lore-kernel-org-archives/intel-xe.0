Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498CBD10395
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 00:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DC510E9C0;
	Fri, 25 Oct 2024 00:26:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38EE10E9C0;
 Fri, 25 Oct 2024 00:26:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_bunch?=
 =?utf-8?q?_of_struct_intel=5Fdisplay_conversions_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 00:26:13 -0000
Message-ID: <172981597392.1330038.4534137801784940416@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1729776384.git.jani.nikula@intel.com>
In-Reply-To: <cover.1729776384.git.jani.nikula@intel.com>
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

Series: drm/i915/display: bunch of struct intel_display conversions (rev2)
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
commit d699d5e7458c58ce36e3036a9936038a9ebc8187
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Oct 24 16:27:42 2024 +0300

    drm/i915/de: remove unnecessary generic wrappers
    
    With many of the intel_de_* callers switched over to struct
    intel_display, we can remove some of the unnecessary generic wrappers.
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch df4c2f3aa67cea423504125ceb12ed46ac116cfb drm-intel
4465a2c959f5 drm/i915/gmbus: convert to struct intel_display
be736b50c04a drm/i915/cx0: remove unnecessary includes
d33d86896909 drm/i915/cx0: convert to struct intel_display
-:441: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#441: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2422:
+									  PHY_C20_B_MPLLB_CNTX_CFG(display, i));

-:446: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#446: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2426:
+									  PHY_C20_A_MPLLB_CNTX_CFG(display, i));

-:455: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#455: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2434:
+									  PHY_C20_B_MPLLA_CNTX_CFG(display, i));

-:460: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#460: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2438:
+									  PHY_C20_A_MPLLA_CNTX_CFG(display, i));

-:617: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#617: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2785:
+		if (intel_de_wait_for_clear(display, XELPDP_PORT_M2P_MSGBUS_CTL(display, port, lane),

total: 0 errors, 5 warnings, 0 checks, 984 lines checked
daf5f8e40ba7 drm/i915/dpio: convert to struct intel_display
-:565: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#565: FILE: drivers/gpu/drm/i915/display/intel_dpio_phy.h:84:
 }
+static inline void bxt_dpio_phy_init(struct intel_display *display, enum dpio_phy phy)

-:569: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#569: FILE: drivers/gpu/drm/i915/display/intel_dpio_phy.h:87:
 }
+static inline void bxt_dpio_phy_uninit(struct intel_display *display, enum dpio_phy phy)

-:573: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#573: FILE: drivers/gpu/drm/i915/display/intel_dpio_phy.h:90:
 }
+static inline bool bxt_dpio_phy_is_enabled(struct intel_display *display,

-:579: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#579: FILE: drivers/gpu/drm/i915/display/intel_dpio_phy.h:95:
 }
+static inline bool bxt_dpio_phy_verify_state(struct intel_display *display,

total: 0 errors, 0 warnings, 4 checks, 570 lines checked
ad42b5012007 drm/i915/hdcp: further conversion to struct intel_display
cc3ca9020f4f drm/i915/dp/hdcp: convert to struct intel_display
ce40718fe396 drm/i915/crt: convert to struct intel_display
-:218: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#218: FILE: drivers/gpu/drm/i915/display/intel_crt.c:497:
+		save_adpa = adpa = intel_de_read(display, crt->adpa_reg);

-:272: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#272: FILE: drivers/gpu/drm/i915/display/intel_crt.c:557:
+	save_adpa = adpa = intel_de_read(display, crt->adpa_reg);

-:704: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#704: FILE: drivers/gpu/drm/i915/display/intel_crt.h:26:
 }
+static inline void intel_crt_init(struct intel_display *display)

total: 0 errors, 0 warnings, 3 checks, 704 lines checked
fa0c0e24b6da drm/i915/display: convert vlv_wait_port_ready() to struct intel_display
ffb8f43a79af drm/i915/power: convert assert_chv_phy_status() to struct intel_display
d98bc827c9be drm/i915/ips: convert to struct intel_display
f309032ffcba drm/i915/dsi: convert to struct intel_display
-:1366: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#1366: FILE: drivers/gpu/drm/i915/display/icl_dsi.c:2041:
+	if (drm_WARN_ON(display->drm, intel_connector->panel.vbt.dsi.cabc_ports & ~intel_dsi->ports))

total: 0 errors, 1 warnings, 0 checks, 1302 lines checked
d699d5e7458c drm/i915/de: remove unnecessary generic wrappers


