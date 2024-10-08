Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD130CF0429
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 22:43:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A14310E604;
	Tue,  8 Oct 2024 22:43:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E580210E604;
 Tue,  8 Oct 2024 22:43:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_xe3lpd_edp_enabling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Oct 2024 22:43:43 -0000
Message-ID: <172842742393.1206241.14410170521195989776@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241008223741.82790-1-matthew.s.atwood@intel.com>
In-Reply-To: <20241008223741.82790-1-matthew.s.atwood@intel.com>
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

Series: Add xe3lpd edp enabling
URL   : https://patchwork.freedesktop.org/series/139732/
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
commit 2313550324d751503dbe93e701deccfd72f04ea9
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Tue Oct 8 15:37:41 2024 -0700

    drm/i915/xe3lpd: Add powerdown value of eDP over type c
    
    Add condition for P2.PG power down value.
    
    Bspec: 74494
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
+ /mt/dim checkpatch c8e01f4159a790812aa3c38cf659d6480fc7d029 drm-intel
3a468144e9ea drm/i915/xe3lpd: reuse xe2lpd definition
-:66: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#66: FILE: include/drm/intel/i915_pciids.h:798:
+#define INTEL_PTL_IDS(MACRO__, ...) \
+	MACRO__(0xB080, ## __VA_ARGS__), \
+	MACRO__(0xB081, ## __VA_ARGS__), \
+	MACRO__(0xB082, ## __VA_ARGS__), \
+	MACRO__(0xB090, ## __VA_ARGS__), \
+	MACRO__(0xB091, ## __VA_ARGS__), \
+	MACRO__(0xB092, ## __VA_ARGS__), \
+	MACRO__(0xB0A0, ## __VA_ARGS__), \
+	MACRO__(0xB0A1, ## __VA_ARGS__), \
+	MACRO__(0xB0A2, ## __VA_ARGS__)

-:66: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#66: FILE: include/drm/intel/i915_pciids.h:798:
+#define INTEL_PTL_IDS(MACRO__, ...) \
+	MACRO__(0xB080, ## __VA_ARGS__), \
+	MACRO__(0xB081, ## __VA_ARGS__), \
+	MACRO__(0xB082, ## __VA_ARGS__), \
+	MACRO__(0xB090, ## __VA_ARGS__), \
+	MACRO__(0xB091, ## __VA_ARGS__), \
+	MACRO__(0xB092, ## __VA_ARGS__), \
+	MACRO__(0xB0A0, ## __VA_ARGS__), \
+	MACRO__(0xB0A1, ## __VA_ARGS__), \
+	MACRO__(0xB0A2, ## __VA_ARGS__)

total: 1 errors, 0 warnings, 1 checks, 48 lines checked
3f023c5a4180 drm/i915/xe3lpd: Adjust watermark calculations
a1a5252d8b81 drm/i915/xe3lpd: Add new display power wells
-:41: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#41: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1602:
+#define XE3LPD_PW_C_POWER_DOMAINS \
+	POWER_DOMAIN_PIPE_C, \
+	POWER_DOMAIN_PIPE_PANEL_FITTER_C

-:45: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#45: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1606:
+#define XE3LPD_PW_D_POWER_DOMAINS \
+	POWER_DOMAIN_PIPE_D, \
+	POWER_DOMAIN_PIPE_PANEL_FITTER_D

-:49: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#49: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1610:
+#define XE3LPD_PW_2_POWER_DOMAINS \
+	XE3LPD_PW_C_POWER_DOMAINS, \
+	XE3LPD_PW_D_POWER_DOMAINS, \
+	POWER_DOMAIN_TRANSCODER_C, \
+	POWER_DOMAIN_TRANSCODER_D, \
+	POWER_DOMAIN_VGA, \
+	POWER_DOMAIN_PORT_DDI_LANES_TC1, \
+	POWER_DOMAIN_PORT_DDI_LANES_TC2, \
+	POWER_DOMAIN_PORT_DDI_LANES_TC3, \
+	POWER_DOMAIN_PORT_DDI_LANES_TC4

-:79: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#79: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1640:
+		.instances = &I915_PW_INSTANCES(

-:88: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#88: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1649:
+		.instances = &I915_PW_INSTANCES(

-:96: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#96: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1657:
+		.instances = &I915_PW_INSTANCES(

-:104: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#104: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1665:
+		.instances = &I915_PW_INSTANCES(

-:112: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#112: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1673:
+		.instances = &I915_PW_INSTANCES(

-:120: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#120: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1681:
+		.instances = &I915_PW_INSTANCES(

-:133: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#133: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1694:
+I915_DECL_PW_DOMAINS(xe3lpd_pwdoms_dc_off,
+	POWER_DOMAIN_DC_OFF,

-:142: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#142: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1703:
+		.instances = &I915_PW_INSTANCES(

-:150: CHECK:LINE_SPACING: Please don't use multiple blank lines
#150: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1711:
+
+

total: 3 errors, 0 warnings, 9 checks, 147 lines checked
a21c0975b089 drm/i915/xe3lpd: Update pmdemand programming
23e23f3b8df5 drm/i915/xe3lpd: Add cdclk changes
b9ec47c6416c drm/i915/xe3lpd: Add macro to choose HDCP_LINE_REKEY bit
-:40: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#40: FILE: drivers/gpu/drm/i915/i915_reg.h:3835:
+#define  TRANS_DDI_HDCP_LINE_REKEY_DISABLE(display)	(DISPLAY_VER(display) >= 30 ? REG_BIT(15) : REG_BIT(12))

total: 0 errors, 1 warnings, 0 checks, 21 lines checked
f39e0cba1d0b drm/i915/xe3lpd: Add C20 Phy consolidated programming table
4e79e0b558a6 drm/i915/xe3lpd: Add new bit range of MAX swing setup
-:36: WARNING:LONG_LINE: line length of 160 exceeds 100 columns
#36: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:303:
+#define  PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(display, val)	(DISPLAY_VER(display) >= 30 ? REG_FIELD_PREP(PTL_PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK, val) :\

-:36: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'val' - possible side-effects?
#36: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:303:
+#define  PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(display, val)	(DISPLAY_VER(display) >= 30 ? REG_FIELD_PREP(PTL_PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK, val) :\
+							 REG_FIELD_PREP(PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK, val))

-:37: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#37: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:304:
+							 REG_FIELD_PREP(PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK, val))

total: 0 errors, 2 warnings, 1 checks, 18 lines checked
fe376a038e85 drm/i915/xe3lpd: Add check to see if edp over type c is allowed
-:81: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#81: FILE: drivers/gpu/drm/i915/i915_reg.h:4586:
+#define PICA_PHY_CONFIG_CONTROL ^I_MMIO(0x16FE68)$

total: 0 errors, 1 warnings, 0 checks, 50 lines checked
2313550324d7 drm/i915/xe3lpd: Add powerdown value of eDP over type c


