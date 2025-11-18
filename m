Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169FFCEE33F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 17:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB06810E1BF;
	Tue, 18 Nov 2025 17:17:41 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7523510E1BF;
 Tue, 18 Nov 2025 17:17:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/cx0=3A_Add_MTL+_?=
 =?utf-8?q?platforms_to_support_dpll_framework_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Nov 2025 17:17:40 -0000
Message-ID: <176348626047.6922.6872976405691326160@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251117104602.2363671-1-mika.kahola@intel.com>
In-Reply-To: <20251117104602.2363671-1-mika.kahola@intel.com>
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

Series: drm/i915/cx0: Add MTL+ platforms to support dpll framework (rev3)
URL   : https://patchwork.freedesktop.org/series/157658/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4f6d565cd96e665e2cd44640ae6d2f694c62aa7c
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Tue Nov 18 15:28:59 2025 +0200

    drm/i915/cx0: Enable dpll framework for MTL+
    
    MTL+ platforms are supported by dpll framework remove a separate
    check for hw comparison and rely solely on dpll framework
    hw comparison.
    
    Finally, all required hooks are now in place so initialize
    PLL manager for MTL+ platforms and remove the redirections
    to the legacy code paths from the following interfaces:
    
    * intel_encoder::clock_enable/disable()
    * intel_encoder::get_config()
    * intel_dpll_funcs::get_hw_state()
    * intel_ddi_update_active_dpll()
    * pipe_config_pll_mismatch()
    
    v2: Rebase on !HAS_LT_PHY check in intel_ddi_update_active_dpll()
    v3: Rebase on !display->dpll.mgr check in intel_ddi_update_active_dpll()
        Add check for NVL as the platform is not part of pll framework (Suraj)
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch b603326a067916accf680fd623f4fc3c22bba487 drm-intel
5a9dd14375e7 drm/i915/cx0: Rename TBT functions to be ICL specific
555184ff150a drm/i915/cx0: Factor out C10 msgbus access start/end helpers
896112d3ec9e drm/i915/cx0: Sanitize setting the Cx0 PLL use_c10 flag
6f4d4d4a80b6 drm/i915/cx0: Sanitize calculating C20 PLL state from tables
077c57b01a43 drm/i915/cx0: Track the C20 PHY VDR state in the PLL state
207ded286196 drm/i915/cx0: Move definition of Cx0 PHY functions earlier
104662f03b13 drm/i915/cx0: Add macro to get DDI port width from a register value
-:23: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'width' - possible side-effects?
#23: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2352:
+#define  DDI_PORT_WIDTH_ENCODE(width)		((width) == 3 ? 4 : (width) - 1)

-:24: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'regval' - possible side-effects?
#24: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2353:
+#define  DDI_PORT_WIDTH_DECODE(regval)		((regval) == 4 ? 3 : (regval) + 1)

-:28: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#28: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2356:
+#define  DDI_PORT_WIDTH_GET(regval)		DDI_PORT_WIDTH_DECODE(REG_FIELD_GET(DDI_PORT_WIDTH_MASK, \

total: 0 errors, 1 warnings, 2 checks, 14 lines checked
b2955d3bb8a1 drm/i915/cx0: Track the Cx0 PHY enabled lane count in the PLL state
4a9adca5a3c7 drm/i915/cx0: Sanitize C10 PHY PLL SSC register setup
2d54ea7c065a drm/i915/cx0: Read out the Cx0 PHY SSC enabled state
a62ada4bef06 drm/i915/cx0: Determine Cx0 PLL DP mode from PLL state
8c859c877867 drm/i915/cx0: Determine Cx0 PLL port clock from PLL state
83e26c8668a9 drm/i915/cx0: Zero Cx0 PLL state before compute and HW readout
c23d6704aeb8 drm/i915/cx0: Print additional Cx0 PLL HW state
9baeeecd1053 drm/i915/cx0: Remove state verification
825a397f9614 drm/i915/cx0: Add PLL information for MTL+
ab8518b83871 drm/i915/cx0: Update C10/C20 state calculation
1dfc05ba365e drm/i915/cx0: Compute plls for MTL+ platform
aeaae2456b50 drm/i915/cx0: Add MTL+ .get_dplls hook
-:57: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#57: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:3515:
+static int mtl_get_non_tc_phy_dpll(struct intel_atomic_state *state,
+				      struct intel_crtc *crtc,

total: 0 errors, 0 warnings, 1 checks, 86 lines checked
1ef36b0cb3da drm/i915/cx0: Add MTL+ .put_dplls hook
9fdd2a369587 drm/i915/cx0: Add MTL+ .update_active_dpll hook
b462f6e69666 drm/i915/cx0: Add MTL+ .update_dpll_ref_clks hook
fa40b1ad523b drm/i915/cx0: Add MTL+ .dump_hw_state hook
09c2cc4b5c98 drm/i915/cx0: Add .compare_hw_state hook
7c6607a5508a drm/i915/cx0: Add MTL+ .get_hw_state hook
15daadb1b1c9 drm/i915/cx0: Add MTL+ .get_freq hook
dbdbd2d0f30d drm/i915/cx0: Add MTL+ .crtc_get_dpll hook
e6402537ce89 drm/i915/cx0: PLL verify debug state print
ce6965134f7f drm/i915/cx0: Add MTL+ .enable_clock/.disable clock hooks on DDI
2bf972e23d6d drm/i915/cx0: Get encoder configuration for C10 and C20 PHY PLLs
-:67: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#67: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:4315:
+static void mtl_ddi_non_tc_phy_get_config(struct intel_encoder *encoder,
+					     struct intel_crtc_state *crtc_state)

total: 0 errors, 0 warnings, 1 checks, 99 lines checked
35a49e981d36 drm/i915/cx0: Add MTL+ Thunderbolt PLL hooks
4f6d565cd96e drm/i915/cx0: Enable dpll framework for MTL+


