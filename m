Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F45C021A1
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 11:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B175110E1C6;
	Mon, 17 Feb 2025 11:33:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8805F10E1C6;
 Mon, 17 Feb 2025 11:33:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Allow?=
 =?utf-8?q?_display_PHYs_to_reset_power_state_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Feb 2025 11:33:25 -0000
Message-ID: <173979200555.3242223.10897821104395419388@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250217111711.639619-1-mika.kahola@intel.com>
In-Reply-To: <20250217111711.639619-1-mika.kahola@intel.com>
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

Series: drm/i915/display: Allow display PHYs to reset power state (rev4)
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
commit 7aba4f3e31aad524fc4efb5ac6b911742e7e6192
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Mon Feb 17 13:17:11 2025 +0200

    drm/i915/display: Allow display PHYs to reset power state
    
    The dedicated display PHYs reset to a power state that blocks S0ix,
    increasing idle system power. After a system reset (cold boot,
    S3/4/5, warm reset) if a dedicated PHY is not being brought up
    shortly, use these steps to move the PHY to the lowest power state
    to save power.
    
    1. Follow the PLL Enable Sequence, using any valid frequency such
       as DP 1.62 GHz. This brings lanes out of reset and enables the
       PLL to allow powerdown to be moved to the Disable state.
    2. Follow PLL Disable Sequence. This moves powerdown to the Disable
       state and disables the PLL.
    
    v2: Rename WA function to more descriptive (Jani)
        For PTL, only port A needs this wa
        Add helpers to check presence of C10 phy and pll enabling (Imre)
    v3: Rename wa function (Imre)
        Check return value of C10 pll tables readout (Imre)
        Use PLL request to check pll enabling (Imre)
    v4: Move intel_cx0_pll_is_enabled() right after
        intel_cx0_pll_disable() (Imre)
        Add drm_WARN_ON() if C10 state cannot be calculated from
        the tables (Imre)
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch 297dc497ff4e957b8a82d4d9f67631e322bdd2a5 drm-intel
ad9a932e687b drm/i915/display: Drop crtc_state from C10/C20 pll programming
-:290: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#290: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3097:
+
+}

total: 0 errors, 0 warnings, 1 checks, 256 lines checked
7aba4f3e31aa drm/i915/display: Allow display PHYs to reset power state


