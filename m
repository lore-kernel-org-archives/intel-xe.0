Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BBEFCC074
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 20:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09FD10E3F2;
	Fri,  6 Mar 2026 20:27:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E4910E3F2;
 Fri,  6 Mar 2026 20:27:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Refactor_LT_PHY_PLL_handl?=
 =?utf-8?q?ing_to_use_DPLL_framework_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Mar 2026 20:27:26 -0000
Message-ID: <177282884679.329327.13012313868416371376@a3b018990fe9>
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

Series: Refactor LT PHY PLL handling to use DPLL framework (rev3)
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
commit b0a054e5d124b5778deaec4b78d20de54d3235aa
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
+ /mt/dim checkpatch a48305e6a2e6a1ed90df374101dd29542c105d8f drm-intel
062b78f8cb0b drm/i915/lt_phy: Dump missing PLL state parameters
247584a7e68c drm/i915/lt_phy: Add check if PLL is enabled
b00e5a8c2ea4 drm/i915/lt_phy: Add PLL information for xe3plpd
f811c80ff2fa drm/i915/lt_phy: Refactor LT PHY PLL handling to use explicit PLL state
55ffe1635ea4 drm/i915/lt_phy: Add lane_count to PLL state
eab118dbfca0 drm/i915/lt_phy: Add xe3plpd .compute_dplls hook
8538a959f558 drm/i915/lt_phy: Add xe3plpd .get_dplls hook
424fc35a155c drm/i915/lt_phy: Add xe3plpd .put_dplls hook
db54c54edd38 drm/i915/lt_phy: Add xe3plpd .update_active_dpll hook
806e26c69408 drm/i915/lt_phy: Add xe3plpd .update_dpll_ref_clks hook
df7e88a1bd72 drm/i915/lt_phy: Add xe3plpd .dump_hw_state hook
0dedce6b3205 drm/i915/lt_phy: Add xe3plpd .compare_hw_state hook
b20964187517 drm/i915/lt_phy: Add xe3plpd .get_hw_state hook
5cd12ea0eb9d drm/i915/lt_phy: Add xe3plpd .get_freq hook
3bcf94757d32 drm/i915/lt_phy: Add xe3plpd .crtc_get_dpll
d029fba7acca drm/i915/lt_phy: Replace crtc compute clock
9c857c6df07a drm/i915/lt_phy: Add .enable_clock hook on DDI
5cd7eee5c48d drm/i915/lt_phy: Add .disable_clock hook on DDI
50312fe6f8c6 drm/i915/lt_phy: Dump lane count for HW state
6efe6b2cf226 drm/i915/lt_phy: Readout lane count
4e24285215ef drm/i915/lt_phy: Get encoder configuration for xe3plpd platform
09735c1e243f drm/i915/lt_phy: Add xe3plpd Thunderbolt pll hooks
dc91b6e24cd1 drm/i915/lt_phy: Remove LT PHY specific state verification
-:38: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#38: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:5124:
+			pll_mismatch = !dpll_mgr->compare_hw_state(&pll->state.hw_state, &dpll_hw_state);

-:40: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#40: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:5126:
+			pll_mismatch = memcmp(&pll->state.hw_state, &dpll_hw_state, sizeof(dpll_hw_state));

total: 0 errors, 2 warnings, 0 checks, 86 lines checked
b0a054e5d124 drm/i915/lt_phy: Enable dpll framework for xe3plpd


