Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD5FCE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 11:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4E910E03A;
	Mon, 17 Nov 2025 11:06:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B8910E03A;
 Mon, 17 Nov 2025 11:06:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/cx0=3A_Add_MTL+_?=
 =?utf-8?q?platforms_to_support_dpll_framework?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Nov 2025 11:06:31 -0000
Message-ID: <176337759113.271.4000784197664746896@a3b018990fe9>
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

Series: drm/i915/cx0: Add MTL+ platforms to support dpll framework
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
commit e11df711629e63976beec4389c5b3ff46ab5bf7a
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Mon Nov 17 12:46:02 2025 +0200

    drm/i915/cx0: Enable dpll framework for MTL+
    
    Now that MTL+ platforms are supported by dpll framework
    remove a separate check for hw comparison and rely solely
    on dpll framework hw comparison.
    
    Finally, all required hooks are now in place so initialize
    PLL manager for MTL+ platforms and remove the redirections
    to the legacy code paths from the following interfaces:
    
    * intel_encoder::clock_enable/disable()
    * intel_encoder::get_config()
    * intel_dpll_funcs::get_hw_state()
    * intel_ddi_update_active_dpll()
    * pipe_config_pll_mismatch()
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch b2e41c70a5eeddce427dc6df02508b6856eb4a11 drm-intel
ad11fa405863 drm/i915/cx0: Rename TBT functions to be ICL specific
ff9be16f4768 drm/i915/cx0: Factor out C10 msgbus access start/end helpers
f60dc166bfd1 drm/i915/cx0: Sanitize setting the Cx0 PLL use_c10 flag
a521df371b14 drm/i915/cx0: Sanitize calculating C20 PLL state from tables
1b757536e3b1 drm/i915/cx0: Track the C20 PHY VDR state in the PLL state
1e92a496de0f drm/i915/cx0: Move definition of Cx0 PHY functions earlier
743e57ef86a5 drm/i915/cx0: Add macro to get DDI port width from a register value
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
97b7f3f0dad8 drm/i915/cx0: Track the Cx0 PHY enabled lane count in the PLL state
32d36e5b18ff drm/i915/cx0: Sanitize C10 PHY PLL SSC register setup
b1bebf91fed3 drm/i915/cx0: Read out the Cx0 PHY SSC enabled state
2f00918bf4d0 drm/i915/cx0: Determine Cx0 PLL DP mode from PLL state
5f871879bd30 drm/i915/cx0: Determine Cx0 PLL port clock from PLL state
02f76d7e81f9 drm/i915/cx0: Zero Cx0 PLL state before compute and HW readout
8fd87871e795 drm/i915/cx0: Print additional Cx0 PLL HW state
9b199ce96069 drm/i915/cx0: Remove state verification
028ead798da8 drm/i915/cx0: Add PLL information for MTL+
f30d5da0eda8 drm/i915/cx0: Update C10/C20 state calculation
d7eb2e2df6df drm/i915/cx0: Compute plls for MTL+ platform
6466b2acbae7 drm/i915/cx0: Add MTL+ .get_dplls hook
-:56: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#56: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:3515:
+static int mtl_get_non_tc_phy_dpll(struct intel_atomic_state *state,
+				      struct intel_crtc *crtc,

total: 0 errors, 0 warnings, 1 checks, 86 lines checked
1907238460ef drm/i915/cx0: Add MTL+ .put_dplls hook
ece6e0a2eba5 drm/i915/cx0: Add MTL+ .update_active_dpll hook
b5d4d942baee drm/i915/cx0: Add MTL+ .update_dpll_ref_clks hook
b70c8aa172d2 drm/i915/cx0: Add MTL+ .dump_hw_state hook
229308cb1123 drm/i915/cx0: Add .compare_hw_state hook
12a529fff606 drm/i915/cx0: Add MTL+ .get_hw_state hook
b36b6a9e4d9a drm/i915/cx0: Add MTL+ .get_freq hook
acd56a0721f0 drm/i915/cx0: Add MTL+ .crtc_get_dpll hook
5c9520e59106 drm/i915/cx0: PLL verify debug state print
55393895e719 drm/i915/cx0: Add MTL+ .enable_clock/.disable clock hooks on DDI
79c5e7bdba10 drm/i915/cx0: Get encoder configuration for C10 and C20 PHY PLLs
-:67: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#67: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:4318:
+static void mtl_ddi_non_tc_phy_get_config(struct intel_encoder *encoder,
+					     struct intel_crtc_state *crtc_state)

total: 0 errors, 0 warnings, 1 checks, 99 lines checked
8b508c38bb67 drm/i915/cx0: Add MTL+ Thunderbolt PLL hooks
e11df711629e drm/i915/cx0: Enable dpll framework for MTL+


