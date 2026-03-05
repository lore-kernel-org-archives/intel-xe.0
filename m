Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11251F3D332
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 17:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78DE10EC5B;
	Thu,  5 Mar 2026 17:15:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FACA10EC5E;
 Thu,  5 Mar 2026 17:15:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Refactor_LT_PHY_PLL_handl?=
 =?utf-8?q?ing_to_use_DPLL_framework_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Mar 2026 17:15:27 -0000
Message-ID: <177273092711.322779.12824987677221525920@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260304131423.1017821-1-mika.kahola@intel.com>
In-Reply-To: <20260304131423.1017821-1-mika.kahola@intel.com>
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

Series: Refactor LT PHY PLL handling to use DPLL framework (rev2)
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
commit 4ef8f7bd6cb9707138ba9e53dd4661bbd49b4fc7
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Wed Mar 4 13:14:23 2026 +0000

    drm/i915/lt_phy: Enable dpll framework for xe3plpd
    
    xe3plpd platform is supported by dpll framework remove a separate
    check for hw comparison and rely solely on dpll framework
    hw comparison.
    
    Finally, all required hooks are now in place so initialize
    PLL manager for xe3plpd platform and remove the redirections
    to the legacy code paths for clock enable/disable as well as
    state mismatch checks that are no longer needed.
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch 5bd71a4c0dc55d4f935fce39a7b5f604d1a67183 drm-intel
7b58eeb1fe63 drm/i915/lt_phy: Dump missing PLL state parameters
88640f9e0cf2 drm/i915/lt_phy: Add check if PLL is enabled
cccdcc11fa59 drm/i915/lt_phy: Add PLL information for xe3plpd
54465ff5827d drm/i915/lt_phy: Refactor LT PHY PLL handling to use explicit PLL state
db70ecd3b57a drm/i915/lt_phy: Add lane_count to PLL state
b304abbf2494 drm/i915/lt_phy: Add xe3plpd .compute_dplls hook
887e28203f88 drm/i915/lt_phy: Add xe3plpd .get_dplls hook
663b76c0d489 drm/i915/lt_phy: Add xe3plpd .put_dplls hook
3cdcf6d8b136 drm/i915/lt_phy: Add xe3plpd .update_active_dpll hook
1371ab163b94 drm/i915/lt_phy: Add xe3plpd .update_dpll_ref_clks hook
d6c5efd1e12a drm/i915/lt_phy: Add xe3plpd .dump_hw_state hook
7fff3b44ed20 drm/i915/lt_phy: Add xe3plpd .compare_hw_state hook
087636513ffb drm/i915/lt_phy: Add xe3plpd .get_hw_state hook
046386c67c11 drm/i915/lt_phy: Add xe3plpd .get_freq hook
cc96212b2240 drm/i915/lt_phy: Add xe3plpd .crtc_get_dpll
a9b6b88d96c7 drm/i915/lt_phy: Replace crtc compute clock
6bbd6f87d7cb drm/i915/lt_phy: Add .enable_clock hook on DDI
5aad04983151 drm/i915/lt_phy: Add .disable_clock hook on DDI
69af7a944662 drm/i915/lt_phy: Dump lane count for HW state
930d0676c6a1 drm/i915/lt_phy: Readout lane count
a7bded2578e7 drm/i915/lt_phy: Get encoder configuration for xe3plpd platform
1c12a81af8d7 drm/i915/lt_phy: Add xe3plpd Thunderbolt pll hooks
ff549f3db077 drm/i915/lt_phy: Remove LT PHY specific state verification
-:25: WARNING:LONG_LINE: line length of 123 exceeds 100 columns
#25: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:5121:
+				     !intel_lt_phy_pll_compare_hw_state(&pll->state.hw_state.ltpll, &dpll_hw_state.ltpll) :

-:26: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#26: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:5122:
+				     memcmp(&pll->state.hw_state, &dpll_hw_state, sizeof(dpll_hw_state)),

total: 0 errors, 2 warnings, 0 checks, 71 lines checked
4ef8f7bd6cb9 drm/i915/lt_phy: Enable dpll framework for xe3plpd


