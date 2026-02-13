Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807B2EDF159
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 12:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5C410E7FF;
	Fri, 13 Feb 2026 12:33:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC2510E7F6;
 Fri, 13 Feb 2026 12:33:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Refactor_LT_PHY_PLL_handl?=
 =?utf-8?q?ing_to_use_DPLL_framework?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Feb 2026 12:33:13 -0000
Message-ID: <177098599388.252685.9390084990555476930@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260213122615.1083654-1-mika.kahola@intel.com>
In-Reply-To: <20260213122615.1083654-1-mika.kahola@intel.com>
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

Series: Refactor LT PHY PLL handling to use DPLL framework
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
commit bb7a4f68f35e5935691aa3de6892111f6465a61d
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Fri Feb 13 12:26:15 2026 +0000

    drm/i915/lt_phy: Enable dpll framework for xe3plpd
    
    xe3plpd platform is supported by dpll framework remove a separate
    check for hw comparison and rely solely on dpll framework
    hw comparison.
    
    Finally, all required hooks are now in place so initialize
    PLL manager for xe3plpd platform and remove the redirections
    to the legacy code paths for clock enable/disable as well as
    state mismatch checks that are no longer needed.
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch cd76e45b9a192aa3d4f7a2efb8ee46767f098e07 drm-intel
a5ee448ee4b4 drm/i915/lt_phy: Dump missing PLL state parameters
-:35: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:2205:
+		pll_state->addr_msb[i] = intel_lt_phy_read(encoder, INTEL_LT_PHY_LANE0, LT_PHY_VDR_X_ADDR_MSB(i));

-:36: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#36: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:2206:
+		pll_state->addr_lsb[i] = intel_lt_phy_read(encoder, INTEL_LT_PHY_LANE0, LT_PHY_VDR_X_ADDR_LSB(i));

total: 0 errors, 2 warnings, 0 checks, 23 lines checked
ec5f357e3d83 drm/i915/lt_phy: Add check if PLL is enabled
5383b5caa45a drm/i915/lt_phy: Add PLL information for xe3lpdp
24c29d37cd74 drm/i915/lt_phy: Add xe3plpd .compute_dplls hook
27d412ece96b drm/i915/lt_phy: Add xe3plpd .get_dplls hook
ba20fd337ecc drm/i915/lt_phy: Add xe3plpd .put_dplls hook
6bfda2ed9072 drm/i915/lt_phy: Add xe3plpdp .update_active_dpll hook
ec4b62352854 drm/i915/lt_phy: Add xe3plpd .update_dpll_ref_clks hook
cfc3598d283f drm/i915/lt_phy: Add xe3plpd .dump_hw_state hook
2de3ef92536f drm/i915/lt_phy: Add xe3pldp .compare_hw_state hook
69c37c6108e9 drm/i915/lt_phy: Add xe3plpd .get_hw_state hook
7f2fb1d1a5bb drm/i915/lt_phy: Add xe3plpd .get_freq hook
0fd6ae8fd1e4 drm/i915/lt_phy: Add xe3plpd .crtc_get_dpll
3dac2fe02add drm/i915/lt_phy: Add .enable_clock/disable clock on DDI for xe3plpd platform
-:266: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#266: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1909:
+	intel_lt_phy_program_port_clock_ctl(encoder, &dpll_hw_state->ltpll, port_clock, lane_reversal);

total: 0 errors, 1 warnings, 0 checks, 342 lines checked
167aa05526da drm/i915/lt_phy: Readout lane count
20ef4a26ee6e drm/i915/lt_phy: Get encoder configuration for xe3plpd platform
d34e3d66094f drm/i915/lt_phy: Add xe3plpd Thunderbolt pll hooks
5f6fc96b789e drm/i915/lt_phy: Remove LT PHY specific state verification
bb7a4f68f35e drm/i915/lt_phy: Enable dpll framework for xe3plpd


