Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DB8CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 12:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43F110EB36;
	Fri, 31 Oct 2025 12:48:28 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0BA10EB32;
 Fri, 31 Oct 2025 12:48:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Add_M?=
 =?utf-8?q?TL+_platforms_to_support_dpll_framework_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Oct 2025 12:48:28 -0000
Message-ID: <176191490816.5608.18338681130574050731@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251031103549.173208-1-mika.kahola@intel.com>
In-Reply-To: <20251031103549.173208-1-mika.kahola@intel.com>
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

Series: drm/i915/display: Add MTL+ platforms to support dpll framework (rev2)
URL   : https://patchwork.freedesktop.org/series/155278/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9af07285ab25db072493e53907cc318207eadff3
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Fri Oct 31 12:35:49 2025 +0200

    drm/i915/display: Enable dpll framework for MTL+
    
    Now that MTL+ platforms are supported by dpll framework
    we can remove a separate check for hw comparison and
    rely solely on dpll framework hw comparison.
    
    Finally, we have all required hooks in place so we can
    initialize the PLL manager for MTL+ platforms and remove
    the redirections to the legacy code paths from the following
    interfaces:
    
    * intel_encoder::clock_enable/disable()
    * intel_encoder::get_config()
    * intel_dpll_funcs::get_hw_state()
    * intel_ddi_update_active_dpll()
    * pipe_config_pll_mismatch()
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch e2df6bac5c3868532a64c869ff7546587aa3dbad drm-intel
a06ecfa42966 drm/i915/display: Rename TBT functions to be ICL specific
be49f5d1cda0 drm/i915/display: Factor out C10 msgbus access start/end helpers
56bd39340a07 drm/i915/display: Sanitize setting the Cx0 PLL use_c10 flag
1dd59d605186 drm/i915/display: Sanitize calculating C20 PLL state from tables
baac894d8209 drm/i915/display: Track the C20 PHY VDR state in the PLL state
4aa05231f628 drm/i915/display: Move definition of Cx0 PHY functions earlier
e4d411e7e00f drm/i915/display: Add macro to get DDI port width from a register value
-:22: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'width' - possible side-effects?
#22: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2352:
+#define  DDI_PORT_WIDTH_ENCODE(width)		((width) == 3 ? 4 : (width) - 1)

-:23: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'regval' - possible side-effects?
#23: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2353:
+#define  DDI_PORT_WIDTH_DECODE(regval)		((regval) == 4 ? 3 : (regval) + 1)

-:27: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#27: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2356:
+#define  DDI_PORT_WIDTH_GET(regval)		DDI_PORT_WIDTH_DECODE(REG_FIELD_GET(DDI_PORT_WIDTH_MASK, \

total: 0 errors, 1 warnings, 2 checks, 14 lines checked
3a5d3d4f011f drm/i915/display: Track the Cx0 PHY enabled lane count in the PLL state
cb0da90879f3 drm/i915/display: Sanitize C10 PHY PLL SSC register setup
82e33f603d90 drm/i915/display: Read out the Cx0 PHY SSC enabled state
1f524ebb2f46 drm/i915/display: Determine Cx0 PLL DP mode from PLL state
ae495add637b drm/i915/display: Determine Cx0 PLL port clock from PLL state
ee1aeb5c2352 drm/i915/display: Zero Cx0 PLL state before compute and HW readout
0a8fe997310e drm/i915/display: Print additional Cx0 PLL HW state
401924c75d81 drm/i915/display: Remove state verification
0db6863c6d9d drm/i915/display: PLL information for MTL+
0e0735660b55 drm/i915/display: Update C10/C20 state calculation
1a8bb567434f drm/i915/display: Compute plls for MTL+ platform
904ff97f897d drm/i915/display: MTL+ .get_dplls
-:54: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#54: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:3516:
+static int mtl_get_non_tc_phy_dpll(struct intel_atomic_state *state,
+				      struct intel_crtc *crtc,

total: 0 errors, 0 warnings, 1 checks, 85 lines checked
aabd03195884 drm/i915/display: MTL+ .put_dplls
76c3d2cb4902 drm/i915/display: Add .update_active_dpll
d041560efa9d drm/i915/display: Add .update_dpll_ref_clks
5b25d8ba8847 drm/i915/display: Add .dump_hw_state
6a8580afee02 drm/i915/display: Add .compare_hw_state
9ae801b407a9 drm/i915/display: Add .get_hw_state to MTL+ platforms
402c6ee0b155 drm/i915/display: Add .get_freq to MTL+ platforms
d8fd3b0e5233 drm/i915/display: Add .crtc_get_dpll hook
3652c8b9cbe1 drm/i915/display: PLL verify debug state print
7ae2d8e105ab drm/i915/display: Add .enable_clock on DDI for MTL+ platforms
74b361277fcf drm/i915/display: Get configuration for C10 and C20
-:66: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#66: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:4300:
+static void mtl_ddi_non_tc_phy_get_config(struct intel_encoder *encoder,
+					     struct intel_crtc_state *crtc_state)

total: 0 errors, 0 warnings, 1 checks, 99 lines checked
32bfbccfc649 drm/i915/display: Add Thunderbolt support
9af07285ab25 drm/i915/display: Enable dpll framework for MTL+


