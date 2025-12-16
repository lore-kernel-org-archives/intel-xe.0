Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3995AD5E146
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 12:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E518510E1E8;
	Tue, 16 Dec 2025 12:54:58 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC7E10E1E8;
 Tue, 16 Dec 2025 12:54:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/pll=3A_Verify_pl?=
 =?utf-8?q?l_dividers_and_remove_redundant_=2Eclock_member?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Dec 2025 12:54:58 -0000
Message-ID: <176588969844.93876.7057457320300631540@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251216083759.383163-1-mika.kahola@intel.com>
In-Reply-To: <20251216083759.383163-1-mika.kahola@intel.com>
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

Series: drm/i915/pll: Verify pll dividers and remove redundant .clock member
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
commit fe82427020a8b8248eb8ed57b917ba9fb530cb37
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Tue Dec 16 10:37:59 2025 +0200

    drm/i915/display: Remove .clock member from eDP/DP/HDMI pll tables
    
    PLL state structure has a member .clock. This is not needed as
    the port clock is possible to calculate from the pll dividers.
    Remove the .clock from the pll state structure.
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch 4bae139bb961fd9df698b3bf15bf39f9bf9800a1 drm-intel
6ec8e04e56b3 drm/i915/c10: Move C10 port clock calculation
a4bb939b46f2 drm/i915/c20: Move C20 port clock calculation
8a6813635f5b drm/i915/display: Drop crtc_state from clock calculation
6dd0f1939b50 drm/i915/cx0: Fix HDMI FRL clock rates
efa060291fc7 drm/i915/cx0: Create macro around pll tables
-:49: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__state' may be better as '(__state)' to avoid precedence issues
#49: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:794:
+#define __C10PLL_PARAMS(__is_hdmi, __clock_rate, __state) { \
+        .name = __stringify(__state), \
+        .is_c10 = true, \
+        .is_hdmi = __is_hdmi, \
+        .clock_rate = __clock_rate, \
+        .c10 = &__state, \
+}

-:50: ERROR:CODE_INDENT: code indent should use tabs where possible
#50: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:795:
+        .name = __stringify(__state), \$

-:50: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#50: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:795:
+        .name = __stringify(__state), \$

-:51: ERROR:CODE_INDENT: code indent should use tabs where possible
#51: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:796:
+        .is_c10 = true, \$

-:51: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#51: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:796:
+        .is_c10 = true, \$

-:52: ERROR:CODE_INDENT: code indent should use tabs where possible
#52: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:797:
+        .is_hdmi = __is_hdmi, \$

-:52: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#52: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:797:
+        .is_hdmi = __is_hdmi, \$

-:53: ERROR:CODE_INDENT: code indent should use tabs where possible
#53: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:798:
+        .clock_rate = __clock_rate, \$

-:53: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#53: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:798:
+        .clock_rate = __clock_rate, \$

-:54: ERROR:CODE_INDENT: code indent should use tabs where possible
#54: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:799:
+        .c10 = &__state, \$

-:54: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#54: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:799:
+        .c10 = &__state, \$

-:57: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__state' may be better as '(__state)' to avoid precedence issues
#57: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:802:
+#define __C20PLL_PARAMS(__is_hdmi, __clock_rate, __state)    { \
+        .name = __stringify(__state), \
+        .is_c10 = false, \
+        .is_hdmi = __is_hdmi, \
+        .clock_rate = __clock_rate, \
+        .c20 = &__state, \
+}

-:58: ERROR:CODE_INDENT: code indent should use tabs where possible
#58: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:803:
+        .name = __stringify(__state), \$

-:58: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#58: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:803:
+        .name = __stringify(__state), \$

-:59: ERROR:CODE_INDENT: code indent should use tabs where possible
#59: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:804:
+        .is_c10 = false, \$

-:59: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#59: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:804:
+        .is_c10 = false, \$

-:60: ERROR:CODE_INDENT: code indent should use tabs where possible
#60: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:805:
+        .is_hdmi = __is_hdmi, \$

-:60: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#60: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:805:
+        .is_hdmi = __is_hdmi, \$

-:61: ERROR:CODE_INDENT: code indent should use tabs where possible
#61: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:806:
+        .clock_rate = __clock_rate, \$

-:61: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#61: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:806:
+        .clock_rate = __clock_rate, \$

-:62: ERROR:CODE_INDENT: code indent should use tabs where possible
#62: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:807:
+        .c20 = &__state, \$

-:62: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#62: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:807:
+        .c20 = &__state, \$

-:66: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#66: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:811:
+#define C10PLL_DP_PARAMS(__clock_rate, __state)         __C10PLL_PARAMS(false, __clock_rate, __state)

-:69: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#69: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:814:
+#define C20PLL_DP_PARAMS(__clock_rate, __state)         __C20PLL_PARAMS(false, __clock_rate, __state)

-:314: ERROR:SPACING: space required after that ',' (ctx:VxV)
#314: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2047:
+	C20PLL_HDMI_PARAMS(148500,mtl_c20_hdmi_148_5),
 	                         ^

-:363: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#363: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2534:
 }
+static const struct intel_cx0pll_params *

total: 11 errors, 12 warnings, 3 checks, 384 lines checked
2a1d3977dffb drm/i915/lt_phy: Create macro for lt phy pll state
-:34: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__state' may be better as '(__state)' to avoid precedence issues
#34: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:445:
+#define LT_PHY_PLL_PARAMS(__clock_rate, __state)    { \
+	.name = __stringify(__state), \
+	.clock_rate = __clock_rate, \
+	.pll = &__state, \
+}

total: 0 errors, 0 warnings, 1 checks, 117 lines checked
f8992f3b1564 drm/i915/display: Add helper function for fuzzy clock check
-:7: WARNING:TYPO_SPELLING: 'withing' may be misspelled - perhaps 'within'?
#7: 
These clocks are expected to be withing +-2 kHz range.
                                ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 45 lines checked
d3d6c6f1e281 drm/i915/cx0: Replace encoder with display
1b6651ec58ef drm/i915/cx0: Verify C10/C20 pll dividers
-:71: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#71: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3848:
+	intel_c10pll_verify_clock(display, pll_params->clock_rate, pll_params->name, pll_params->c10, true);

-:78: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#78: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3855:
+	intel_c10pll_verify_clock(display, pll_params->clock_rate, pll_params->name, &pll_state, false);

-:116: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#116: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3893:
+	intel_c20pll_verify_clock(display, pll_params->clock_rate, pll_params->name, pll_params->c20, true);

-:124: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#124: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3901:
+	intel_c20pll_verify_clock(display, pll_params->clock_rate, pll_params->name, &pll_state, false);

-:149: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#149: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3926:
+	intel_cx0pll_verify_tables(display, xe2hpd_c20_edp_tables, ARRAY_SIZE(xe2hpd_c20_edp_tables));

-:152: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#152: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3929:
+	intel_cx0pll_verify_tables(display, xe3lpd_c20_dp_edp_tables, ARRAY_SIZE(xe3lpd_c20_dp_edp_tables));

total: 0 errors, 6 warnings, 0 checks, 178 lines checked
956eb9320060 drm/i915/lt_phy: Add verfication for lt phy pll dividers
-:4: WARNING:TYPO_SPELLING: 'verfication' may be misspelled - perhaps 'verification'?
#4: 
Subject: [PATCH] drm/i915/lt_phy: Add verfication for lt phy pll dividers
                                      ^^^^^^^^^^^

-:40: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__state' may be better as '(__state)' to avoid precedence issues
#40: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:446:
+#define __LT_PHY_PLL_PARAMS(__is_hdmi, __clock_rate, __state)    { \
 	.name = __stringify(__state), \
+	.is_hdmi = __is_hdmi, \
 	.clock_rate = __clock_rate, \
+	.state = &__state, \
 }

-:48: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#48: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:453:
+#define LT_PHY_PLL_HDMI_PARAMS(__clock_rate, __state)	__LT_PHY_PLL_PARAMS(true, __clock_rate, __state)

-:49: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#49: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:454:
+#define LT_PHY_PLL_DP_PARAMS(__clock_rate, __state)	__LT_PHY_PLL_PARAMS(false, __clock_rate, __state)

-:162: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#162: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:2375:
+	intel_lt_phy_pll_verify_clock(display, pll_params->clock_rate, pll_params->name, pll_params->state, true);

-:170: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#170: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:2383:
+	intel_lt_phy_pll_verify_clock(display, pll_params->clock_rate, pll_params->name, &pll_state, false);

total: 0 errors, 5 warnings, 1 checks, 171 lines checked
7854f2183923 drm/i915/cx0: Drop C20 25.175 MHz rate
31afac033080 drm/i915/lt_phy: Drop 27.2 MHz rate
fe82427020a8 drm/i915/display: Remove .clock member from eDP/DP/HDMI pll tables


