Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61440D65C7E
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 17:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0764C10E8D5;
	Wed, 17 Dec 2025 17:34:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E5710E8D5;
 Wed, 17 Dec 2025 17:34:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/pll=3A_Verify_pl?=
 =?utf-8?q?l_dividers_and_remove_redundant_=2Eclock_member_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Dec 2025 17:34:58 -0000
Message-ID: <176599289848.97606.12259806072661538776@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251217151955.1690202-1-mika.kahola@intel.com>
In-Reply-To: <20251217151955.1690202-1-mika.kahola@intel.com>
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

Series: drm/i915/pll: Verify pll dividers and remove redundant .clock member (rev2)
URL   : https://patchwork.freedesktop.org/series/159089/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 176151407a52e05308cb7390d79af83a1997fe17
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Wed Dec 17 17:19:55 2025 +0200

    drm/i915/display: Remove .clock member from eDP/DP/HDMI pll tables
    
    PLL state structure has a member .clock. This is not needed as
    the port clock is possible to calculate from the pll dividers.
    Remove the .clock from the pll state structure.
    
    v2: Keep the pll_state->clock assignment in
        intel_snps_hdmi_pll_compute_mpllb().
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch 605176fe40c828b491a1532367df157529895b87 drm-intel
794c3ab7e7d5 drm/i915/c10: Move C10 port clock calculation
a2283db79d78 drm/i915/c20: Move C20 port clock calculation
94e7889a0215 drm/i915/cx0: Drop Cx0 crtc_state from HDMI TMDS pll divider calculation
56614d886f2d drm/i915/lt_phy: Drop LT PHY crtc_state for port calculation
375af7865ff8 drm/i915/cx0: Drop encoder from port clock calculation
fccfcdeafc69 drm/i915/cx0: Create macro around pll tables
-:51: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__state' may be better as '(__state)' to avoid precedence issues
#51: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:794:
+#define __C10PLL_PARAMS(__is_hdmi, __clock_rate, __state) { \
+	.name = __stringify(__state), \
+	.is_c10 = true, \
+	.is_hdmi = __is_hdmi, \
+	.clock_rate = __clock_rate, \
+	.c10 = &__state, \
+}

-:59: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__state' may be better as '(__state)' to avoid precedence issues
#59: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:802:
+#define __C20PLL_PARAMS(__is_hdmi, __clock_rate, __state)    { \
+	.name = __stringify(__state), \
+	.is_c10 = false, \
+	.is_hdmi = __is_hdmi, \
+	.clock_rate = __clock_rate, \
+	.c20 = &__state, \
+}

-:68: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#68: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:811:
+#define C10PLL_DP_PARAMS(__clock_rate, __state)         __C10PLL_PARAMS(false, __clock_rate, __state)

-:71: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#71: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:814:
+#define C20PLL_DP_PARAMS(__clock_rate, __state)         __C20PLL_PARAMS(false, __clock_rate, __state)

total: 0 errors, 2 warnings, 2 checks, 391 lines checked
72a66cb1a31f drm/i915/lt_phy: Create macro for lt phy pll state
-:39: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__state' may be better as '(__state)' to avoid precedence issues
#39: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:446:
+#define __LT_PHY_PLL_PARAMS(__is_hdmi, __clock_rate, __state)    { \
+	.name = __stringify(__state), \
+	.is_hdmi = __is_hdmi, \
+	.clock_rate = __clock_rate, \
+	.state = &__state, \
+}

-:46: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#46: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:453:
+#define LT_PHY_PLL_HDMI_PARAMS(__clock_rate, __state)	__LT_PHY_PLL_PARAMS(true, __clock_rate, __state)

-:47: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#47: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:454:
+#define LT_PHY_PLL_DP_PARAMS(__clock_rate, __state)	__LT_PHY_PLL_PARAMS(false, __clock_rate, __state)

total: 0 errors, 2 warnings, 1 checks, 125 lines checked
f54167c28033 drm/i915/display: Add helper function for fuzzy clock check
38d3e27a659a drm/i915/cx0: Fix HDMI FRL clock rates
038a989576e2 drm/i915/cx0: Add a fuzzy check for DP/HDMI clock rates during programming
8847d02ff871 drm/i915/cx0: Verify C10/C20 pll dividers
-:69: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#69: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3864:
+	intel_c10pll_verify_clock(display, pll_params->clock_rate, pll_params->name, pll_params->c10, true);

-:76: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#76: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3871:
+	intel_c10pll_verify_clock(display, pll_params->clock_rate, pll_params->name, &pll_state, false);

-:115: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#115: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3910:
+	intel_c20pll_verify_clock(display, pll_params->clock_rate, pll_params->name, pll_params->c20, true);

-:123: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#123: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3918:
+	intel_c20pll_verify_clock(display, pll_params->clock_rate, pll_params->name, &pll_state, false);

total: 0 errors, 4 warnings, 0 checks, 152 lines checked
b2ec1adc3c21 drm/i915/lt_phy: Add verification for lt phy pll dividers
-:85: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#85: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:2383:
+	intel_lt_phy_pll_verify_clock(display, pll_params->clock_rate, pll_params->name, pll_params->state, true);

-:93: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#93: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:2391:
+	intel_lt_phy_pll_verify_clock(display, pll_params->clock_rate, pll_params->name, &pll_state, false);

total: 0 errors, 2 warnings, 0 checks, 86 lines checked
7cf9f46caa30 drm/i915/cx0: Drop C20 25.175 MHz rate
89b4bd46c010 drm/i915/lt_phy: Drop 27.2 MHz rate
176151407a52 drm/i915/display: Remove .clock member from eDP/DP/HDMI pll tables


