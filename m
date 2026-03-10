Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30ABFD4F03
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 16:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663ED10E738;
	Tue, 10 Mar 2026 16:09:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6971710E738;
 Tue, 10 Mar 2026 16:09:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Refactor_LT_PHY_PLL_handl?=
 =?utf-8?q?ing_to_use_DPLL_framework_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Mar 2026 16:09:01 -0000
Message-ID: <177315894141.340795.9704155631228766831@a3b018990fe9>
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

Series: Refactor LT PHY PLL handling to use DPLL framework (rev5)
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
commit c3a7b6958eddefe660aeb2c5f81bd02fa469a8c2
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
+ /mt/dim checkpatch adf67fb1258884dab38a71526783f901069dbb81 drm-intel
d40e20787f64 drm/i915/lt_phy: Dump missing PLL state parameters
388729244ec0 drm/i915/lt_phy: Add check if PLL is enabled
0630b9ef675a drm/i915/lt_phy: Add PLL information for xe3plpd
f66fd6cfbe0d drm/i915/lt_phy: Refactor LT PHY PLL handling to use explicit PLL state
1a4ca2304c64 drm/i915/lt_phy: Add lane_count to PLL state
8d5753a4847a drm/i915/lt_phy: Add xe3plpd .compute_dplls hook
219a705953cd drm/i915/lt_phy: Add xe3plpd .get_dplls hook
6bf332452054 drm/i915/lt_phy: Add xe3plpd .put_dplls hook
e79ef1642de1 drm/i915/lt_phy: Add xe3plpd .update_active_dpll hook
60c49b458dfe drm/i915/lt_phy: Add xe3plpd .update_dpll_ref_clks hook
be7f4b731c33 drm/i915/lt_phy: Add xe3plpd .dump_hw_state hook
-:12: WARNING:BAD_SIGN_OFF: Duplicate signature
#12: 
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

total: 0 errors, 1 warnings, 0 checks, 89 lines checked
187754cdb341 drm/i915/lt_phy: Add xe3plpd .compare_hw_state hook
65d0a0e149c9 drm/i915/lt_phy: Add xe3plpd .get_hw_state hook
b380762411fc drm/i915/lt_phy: Add xe3plpd .get_freq hook
6dfde09bde80 drm/i915/lt_phy: Add xe3plpd .crtc_get_dpll
5f6728dc2bf3 drm/i915/lt_phy: Replace crtc compute clock
40f6a74b71da drm/i915/lt_phy: Add .enable_clock hook on DDI
20fac0d0bdfe drm/i915/lt_phy: Add .disable_clock hook on DDI
cd0710e12ba6 drm/i915/lt_phy: Dump lane count for HW state
985cd3b678ec drm/i915/lt_phy: Readout lane count
69ef522ee863 drm/i915/lt_phy: Get encoder configuration for xe3plpd platform
8735498a9efe drm/i915/lt_phy: Add xe3plpd Thunderbolt pll hooks
e21c61ea09e4 drm/i915/lt_phy: Remove LT PHY specific state verification
-:39: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#39: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:5124:
+			pll_mismatch = !dpll_mgr->compare_hw_state(&pll->state.hw_state, &dpll_hw_state);

-:41: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#41: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:5126:
+			pll_mismatch = memcmp(&pll->state.hw_state, &dpll_hw_state, sizeof(dpll_hw_state));

total: 0 errors, 2 warnings, 0 checks, 86 lines checked
c3a7b6958edd drm/i915/lt_phy: Enable dpll framework for xe3plpd


