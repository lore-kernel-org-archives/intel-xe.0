Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0A9D2444F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 23:12:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5817C10E9FD;
	Thu, 10 Oct 2024 23:12:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B175910E9FD;
 Thu, 10 Oct 2024 23:12:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_xe3lpd_edp_enabling_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Oct 2024 23:12:58 -0000
Message-ID: <172860197872.1238063.6164220761719789317@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241010224311.50133-1-matthew.s.atwood@intel.com>
In-Reply-To: <20241010224311.50133-1-matthew.s.atwood@intel.com>
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

Series: Add xe3lpd edp enabling (rev2)
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
commit 4300006c5acf657368f2fdc0ac3f8708172b7723
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Thu Oct 10 15:43:11 2024 -0700

    drm/i915/xe3lpd: Add condition for EDP to powerdown P2.PG
    
    Add condition for P2.PG power down value.
    
    v2: change subject line to better match patch condition
    
    Bspec: 74494
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
+ /mt/dim checkpatch 8e9b30b81e6981fc408260ad8cdf8c1e14c58500 drm-intel
7807b696eeca drm/i915/xe3lpd: reuse xe2lpd definition
-:67: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#67: FILE: include/drm/intel/i915_pciids.h:798:
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

-:67: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#67: FILE: include/drm/intel/i915_pciids.h:798:
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
0741f21eb692 drm/i915/xe3lpd: Adjust watermark calculations
dfb84045d8a9 drm/i915/xe3lpd: Add new display power wells
-:42: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#42: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1602:
+#define XE3LPD_PW_C_POWER_DOMAINS \
+	POWER_DOMAIN_PIPE_C, \
+	POWER_DOMAIN_PIPE_PANEL_FITTER_C

-:46: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#46: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1606:
+#define XE3LPD_PW_D_POWER_DOMAINS \
+	POWER_DOMAIN_PIPE_D, \
+	POWER_DOMAIN_PIPE_PANEL_FITTER_D

-:50: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#50: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1610:
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

-:80: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#80: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1640:
+		.instances = &I915_PW_INSTANCES(

-:89: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#89: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1649:
+		.instances = &I915_PW_INSTANCES(

-:97: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#97: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1657:
+		.instances = &I915_PW_INSTANCES(

-:105: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#105: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1665:
+		.instances = &I915_PW_INSTANCES(

-:113: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#113: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1673:
+		.instances = &I915_PW_INSTANCES(

-:121: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#121: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1681:
+		.instances = &I915_PW_INSTANCES(

-:134: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#134: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1694:
+I915_DECL_PW_DOMAINS(xe3lpd_pwdoms_dc_off,
+	POWER_DOMAIN_DC_OFF,

-:143: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#143: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1703:
+		.instances = &I915_PW_INSTANCES(

-:151: CHECK:LINE_SPACING: Please don't use multiple blank lines
#151: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1711:
+
+

total: 3 errors, 0 warnings, 9 checks, 147 lines checked
f3f96f76ae57 drm/i915/xe3lpd: Update pmdemand programming
-:71: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#71: FILE: drivers/gpu/drm/i915/display/intel_pmdemand.c:336:
+	if (DISPLAY_VER(i915) >= 30) max_active_pipes = 4;

total: 1 errors, 0 warnings, 0 checks, 165 lines checked
e6d9350f46f5 drm/i915/xe3lpd: Add cdclk changes
aa64ef015309 drm/i915/xe3lpd: Include hblank restriction for xe3lpd
f5955720cd54 drm/i915/xe3lpd: Add C20 Phy consolidated programming table
eaca3ec95ab0 drm/i915/xe3lpd: Add new bit range of MAX swing setup
-:9: WARNING:TYPO_SPELLING: 'seperate' may be misspelled - perhaps 'separate'?
#9: 
v2: implement as two seperate macros instead of a single macro
                     ^^^^^^^^

-:32: CHECK:LINE_SPACING: Please don't use multiple blank lines
#32: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:334:
 
+

-:65: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#65: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:299:
+#define PORT_ALPM_CTL(port)				_MMIO_PORT(port, _PORT_ALPM_CTL_A, _PORT_ALPM_CTL_B)

-:69: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#69: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:303:
+#define  PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(val)		REG_FIELD_PREP(PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK, val)

-:70: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#70: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:304:
+#define  XE3_PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(val)	REG_FIELD_PREP(XE3_PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK, val)

-:72: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#72: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:306:
+#define  PORT_ALPM_CTL_MAX_PHY_SWING_HOLD(val)		REG_FIELD_PREP(PORT_ALPM_CTL_MAX_PHY_SWING_HOLD_MASK, val)

-:74: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#74: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:308:
+#define  PORT_ALPM_CTL_SILENCE_PERIOD(val)		REG_FIELD_PREP(PORT_ALPM_CTL_SILENCE_PERIOD_MASK, val)

total: 0 errors, 6 warnings, 1 checks, 52 lines checked
3bc69cd085c6 drm/i915/xe3lpd: Add check to see if edp over type c is allowed
-:81: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#81: FILE: drivers/gpu/drm/i915/i915_reg.h:4587:
+#define PICA_PHY_CONFIG_CONTROL ^I_MMIO(0x16FE68)$

total: 0 errors, 1 warnings, 0 checks, 50 lines checked
4300006c5acf drm/i915/xe3lpd: Add condition for EDP to powerdown P2.PG


