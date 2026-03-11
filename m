Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C94112583E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 15:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D36810E205;
	Wed, 11 Mar 2026 15:04:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534C910E205;
 Wed, 11 Mar 2026 15:04:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Refactor_LT_PHY_PLL_handl?=
 =?utf-8?q?ing_to_use_DPLL_framework_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Mar 2026 15:04:49 -0000
Message-ID: <177324148932.346265.7732180897366594724@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260311141905.2526418-1-mika.kahola@intel.com>
In-Reply-To: <20260311141905.2526418-1-mika.kahola@intel.com>
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

Series: Refactor LT PHY PLL handling to use DPLL framework (rev6)
URL   : https://patchwork.freedesktop.org/series/161586/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b37f55406d135040235f72141ca8d65ac601374e
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Wed Mar 11 14:19:05 2026 +0000

    drm/i915/lt_phy: Replace crtc compute clock
    
    The existing DPLL compute clock callback for the XE3PLPD platform
    (`xe3plpd_crtc_compute_clock`) was specific to that platform. Replace it
    with the more generic Haswell (`hsw_crtc_compute_clock`) implementation
    so that the compute clock path does not rely on the XE3PLPD hook.
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch 4a30f5fa0fe382b3915a8208a483d0044c40b9eb drm-intel
e845b0af0bba drm/i915/lt_phy: Dump missing PLL state parameters
7e5699da4fa7 drm/i915/lt_phy: Add check if PLL is enabled
1f688e65026c drm/i915/lt_phy: Add PLL information for xe3plpd
17b6cd337233 drm/i915/lt_phy: Refactor LT PHY PLL handling to use explicit PLL state
-:182: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#182: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1931:
+	if (intel_lt_phy_config_changed(encoder, &crtc_state->dpll_hw_state.ltpll, crtc_state->port_clock)) {

total: 0 errors, 1 warnings, 0 checks, 160 lines checked
6663ebe7a01e drm/i915/lt_phy: Add lane_count to PLL state
f15fa13ebf7e drm/i915/lt_phy: Add xe3plpd .compute_dplls hook
f9aa5d504a8a drm/i915/lt_phy: Add xe3plpd .get_dplls hook
19de91f44ebf drm/i915/lt_phy: Add xe3plpd .put_dplls hook
e1e7df747c46 drm/i915/lt_phy: Add xe3plpd .update_active_dpll hook
0ea2567523ff drm/i915/lt_phy: Add xe3plpd .update_dpll_ref_clks hook
607f8cafbe88 drm/i915/lt_phy: Add xe3plpd .dump_hw_state hook
f1cef37acb22 drm/i915/lt_phy: Add xe3plpd .compare_hw_state hook
acf9bffe3672 drm/i915/lt_phy: Add xe3plpd .get_hw_state hook
29c22831b035 drm/i915/lt_phy: Add xe3plpd .get_freq hook
466633d847fb drm/i915/lt_phy: Add xe3plpd .crtc_get_dpll
2abc9a4f756b drm/i915/lt_phy: Add .enable_clock hook on DDI
814e31778b94 drm/i915/lt_phy: Add .disable_clock hook on DDI
988ef056cb4a drm/i915/lt_phy: Dump lane count for HW state
9130093181e2 drm/i915/lt_phy: Readout lane count
39d313eeff13 drm/i915/lt_phy: Get encoder configuration for xe3plpd platform
2b84e9725815 drm/i915/lt_phy: Add xe3plpd Thunderbolt PLL hooks
ebba69d42c34 drm/i915/lt_phy: Remove LT PHY specific state verification
-:39: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#39: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:5124:
+			pll_mismatch = !dpll_mgr->compare_hw_state(&pll->state.hw_state, &dpll_hw_state);

-:41: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#41: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:5126:
+			pll_mismatch = memcmp(&pll->state.hw_state, &dpll_hw_state, sizeof(dpll_hw_state));

total: 0 errors, 2 warnings, 0 checks, 86 lines checked
28fc8aec4e9f drm/i915/lt_phy: Enable dpll framework for xe3plpd
b37f55406d13 drm/i915/lt_phy: Replace crtc compute clock


