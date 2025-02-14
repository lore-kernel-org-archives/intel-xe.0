Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FF3C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 14:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6513310ECC6;
	Fri, 14 Feb 2025 14:23:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634FB10ECC4;
 Fri, 14 Feb 2025 14:23:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Allow?=
 =?utf-8?q?_display_PHYs_to_reset_power_state_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Feb 2025 14:23:01 -0000
Message-ID: <173954298140.2054078.5492435215494758760@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214140442.560378-1-mika.kahola@intel.com>
In-Reply-To: <20250214140442.560378-1-mika.kahola@intel.com>
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

Series: drm/i915/display: Allow display PHYs to reset power state (rev3)
URL   : https://patchwork.freedesktop.org/series/144103/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 86066a284de8b49fce18a1472ac8867429a4e73c
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Fri Feb 14 16:04:42 2025 +0200

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
    v3: Rename wa function (Imre)
        Check return value of C10 pll tables readout (Imre)
        Use PLL request to check pll enabling (Imre)
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch 57457d93f156d8b4bdff8d138127d81b8f97d8c9 drm-intel
302ea8dca81b drm/i915/display: Drop crtc_state from C10/C20 pll programming
-:60: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#60: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2052:
+					      const struct intel_c10pll_state * const *tables, int port_clock, bool is_dp,

-:256: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#256: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3093:
+			      intel_crtc_has_dp_encoder(crtc_state), crtc_state->port_clock, crtc_state->lane_count);

-:258: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#258: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3095:
+
+}

total: 0 errors, 2 warnings, 1 checks, 226 lines checked
86066a284de8 drm/i915/display: Allow display PHYs to reset power state
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
1. Follow the PLL Enable Sequence, using any valid frequency such as DP 1.62 GHz.

-:38: ERROR:CODE_INDENT: code indent should use tabs where possible
#38: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3566:
+        struct intel_digital_port *dig_port = enc_to_dig_port(encoder);$

-:38: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#38: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3566:
+        struct intel_digital_port *dig_port = enc_to_dig_port(encoder);$

total: 1 errors, 2 warnings, 0 checks, 89 lines checked


