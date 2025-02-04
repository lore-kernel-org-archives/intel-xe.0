Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A0FC02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 11:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2F110E5F8;
	Tue,  4 Feb 2025 11:55:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B008110E5F8;
 Tue,  4 Feb 2025 11:55:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Allow?=
 =?utf-8?q?_display_PHYs_to_reset_power_state_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Feb 2025 11:55:30 -0000
Message-ID: <173867013071.826766.1117958776385383002@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250204105358.284687-1-mika.kahola@intel.com>
In-Reply-To: <20250204105358.284687-1-mika.kahola@intel.com>
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

Series: drm/i915/display: Allow display PHYs to reset power state (rev2)
URL   : https://patchwork.freedesktop.org/series/144103/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3541acca27b328a1f55c68aeb212893f1fee4d68
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Tue Feb 4 12:53:58 2025 +0200

    drm/i915/display: Allow display PHYs to reset power state
    
    The dedicated display PHYs reset to a power state that blocks S0ix,
    increasing idle system power. After a system reset (cold boot,
    S3/4/5, warm reset) if a dedicated PHY is not being brought up
    shortly, use these steps to move the PHY to the lowest power state
    to save power.
    
    1. Follow the PLL Enable Sequence, using any valid frequency such as DP 1.62 GHz.
       This brings lanes out of reset and enables the PLL to allow powerdown to be moved
       to the Disable state.
    2. Follow PLL Disable Sequence. This moves powerdown to the Disable state and disables the PLL.
    
    v2: Rename WA function to more descriptive (Jani)
        For PTL, only port A needs this wa
        Add helpers to check presence of C10 phy and pll enabling (Imre)
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch d3f7add53c15ed866828937f140ac252c19f2411 drm-intel
d4a851feb44e drm/i915/display: Drop crtc_state from C10/C20 pll programming
-:57: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#57: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2053:
+					      const struct intel_c10pll_state * const *tables, int port_clock, bool is_dp,

-:98: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#98: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2083:
+						 crtc_state->port_clock, intel_crtc_has_dp_encoder(crtc_state),

-:252: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#252: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3092:
+			      intel_crtc_has_dp_encoder(crtc_state), crtc_state->port_clock, crtc_state->lane_count);

-:254: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#254: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3094:
+
+}

total: 0 errors, 3 warnings, 1 checks, 225 lines checked
3541acca27b3 drm/i915/display: Allow display PHYs to reset power state
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
1. Follow the PLL Enable Sequence, using any valid frequency such as DP 1.62 GHz.

-:41: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#41: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3572:
+}
+/*

-:71: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#71: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3602:
+		intel_c10pll_calc_state_from_table(encoder, mtl_c10_edp_tables, port_clock, true, &pll_state);

total: 0 errors, 2 warnings, 1 checks, 82 lines checked


