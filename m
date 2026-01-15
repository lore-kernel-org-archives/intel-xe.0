Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739B5D3CCBF
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 07:59:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FE110E6F5;
	Thu, 15 Jan 2026 07:59:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C914810E6F1;
 Thu, 15 Jan 2026 07:59:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/pll=3A_Verify_pl?=
 =?utf-8?q?l_dividers_and_remove_redundant_=2Eclock_member_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Jan 2026 07:59:58 -0000
Message-ID: <176846399882.156800.16281249581739405788@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260115075101.2214842-1-mika.kahola@intel.com>
In-Reply-To: <20260115075101.2214842-1-mika.kahola@intel.com>
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

Series: drm/i915/pll: Verify pll dividers and remove redundant .clock member (rev3)
URL   : https://patchwork.freedesktop.org/series/159089/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
ee83616c430ce70bd254bd2774d143a5733c8666
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b33435b392a307b09f24ae23c624af438295b819
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Thu Jan 15 07:51:01 2026 +0000

    drm/i915/display: Remove .clock member from eDP/DP/HDMI pll tables
    
    PLL state structure has a member .clock. This is not needed as
    the port clock is possible to calculate from the pll dividers.
    Remove the encoder from being passed to the port clock calculation
    function.
    
    v2: Keep the pll_state->clock assignment in
        intel_snps_hdmi_pll_compute_mpllb().
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 733664f1edf3c01cc68e6dd0bbdb135158a98a1d drm-intel
a2bb2cda30ab drm/i915/cx0: Move C10 port clock calculation
a8f124c14fb8 drm/i915/cx0: Move C20 port clock calculation
9a22d2a956ef drm/i915/cx0: Drop Cx0 crtc_state from HDMI TMDS pll divider calculation
e0468dfaeb81 drm/i915/lt_phy: Drop LT PHY crtc_state for port calculation
b8b209c38175 drm/i915/cx0: Drop encoder from port clock calculation
65213cbba014 drm/i915/cx0: Create macro around PLL tables
-:52: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__state' may be better as '(__state)' to avoid precedence issues
#52: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:794:
+#define __C10PLL_PARAMS(__is_hdmi, __clock_rate, __state) { \
+	.name = __stringify(__state), \
+	.is_c10 = true, \
+	.is_hdmi = __is_hdmi, \
+	.clock_rate = __clock_rate, \
+	.c10 = &__state, \
+}

-:60: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__state' may be better as '(__state)' to avoid precedence issues
#60: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:802:
+#define __C20PLL_PARAMS(__is_hdmi, __clock_rate, __state)    { \
+	.name = __stringify(__state), \
+	.is_c10 = false, \
+	.is_hdmi = __is_hdmi, \
+	.clock_rate = __clock_rate, \
+	.c20 = &__state, \
+}

-:69: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#69: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:811:
+#define C10PLL_DP_PARAMS(__clock_rate, __state)         __C10PLL_PARAMS(false, __clock_rate, __state)

-:72: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#72: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:814:
+#define C20PLL_DP_PARAMS(__clock_rate, __state)         __C20PLL_PARAMS(false, __clock_rate, __state)

total: 0 errors, 2 warnings, 2 checks, 391 lines checked
7d3fce771e79 drm/i915/lt_phy: Create macro for LT PHY PLL state
-:40: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__state' may be better as '(__state)' to avoid precedence issues
#40: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:447:
+#define __LT_PHY_PLL_PARAMS(__is_hdmi, __clock_rate, __state)    { \
+	.name = __stringify(__state), \
+	.is_hdmi = __is_hdmi, \
+	.clock_rate = __clock_rate, \
+	.state = &__state, \
+}

-:47: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#47: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:454:
+#define LT_PHY_PLL_HDMI_PARAMS(__clock_rate, __state)	__LT_PHY_PLL_PARAMS(true, __clock_rate, __state)

-:48: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#48: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:455:
+#define LT_PHY_PLL_DP_PARAMS(__clock_rate, __state)	__LT_PHY_PLL_PARAMS(false, __clock_rate, __state)

total: 0 errors, 2 warnings, 1 checks, 125 lines checked
9010b42594d4 drm/i915/display: Add helper function for fuzzy clock check
-:102: ERROR:CODE_INDENT: code indent should use tabs where possible
#102: FILE: drivers/gpu/drm/i915/display/intel_dpll.c:2340:
+        return abs(clock1 - clock2) <= 1;$

-:102: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#102: FILE: drivers/gpu/drm/i915/display/intel_dpll.c:2340:
+        return abs(clock1 - clock2) <= 1;$

total: 1 errors, 1 warnings, 0 checks, 98 lines checked
68acc3d37797 drm/i915/cx0: Fix HDMI FRL clock rates
3d1c65e4df4c drm/i915/cx0: Add a fuzzy check for DP/HDMI clock rates during programming
b1ec380ec220 drm/i915/cx0: Verify C10/C20 pll dividers
-:70: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#70: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3878:
+	intel_c10pll_verify_clock(display, pll_params->clock_rate, pll_params->name, pll_params->c10, true);

-:77: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#77: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3885:
+	intel_c10pll_verify_clock(display, pll_params->clock_rate, pll_params->name, &pll_state, false);

-:116: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#116: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3924:
+	intel_c20pll_verify_clock(display, pll_params->clock_rate, pll_params->name, pll_params->c20, true);

-:124: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#124: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3932:
+	intel_c20pll_verify_clock(display, pll_params->clock_rate, pll_params->name, &pll_state, false);

total: 0 errors, 4 warnings, 0 checks, 152 lines checked
8c72579d6f6f drm/i915/lt_phy: Add verification for lt phy pll dividers
-:86: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#86: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:2377:
+	intel_lt_phy_pll_verify_clock(display, pll_params->clock_rate, pll_params->name, pll_params->state, true);

-:94: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#94: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:2385:
+	intel_lt_phy_pll_verify_clock(display, pll_params->clock_rate, pll_params->name, &pll_state, false);

total: 0 errors, 2 warnings, 0 checks, 86 lines checked
b4252145d39b drm/i915/cx0: Drop C20 25.175 MHz rate
d3d6cb27b4b5 drm/i915/lt_phy: Drop 27.2 MHz rate
b33435b392a3 drm/i915/display: Remove .clock member from eDP/DP/HDMI pll tables


