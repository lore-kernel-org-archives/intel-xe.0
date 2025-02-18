Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7BCC02198
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 12:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C8D10E69C;
	Tue, 18 Feb 2025 12:19:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAED10E69C;
 Tue, 18 Feb 2025 12:19:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Allow?=
 =?utf-8?q?_display_PHYs_to_reset_power_state_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Feb 2025 12:19:28 -0000
Message-ID: <173988116837.3554660.2834005332805189668@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250218100019.740556-1-mika.kahola@intel.com>
In-Reply-To: <20250218100019.740556-1-mika.kahola@intel.com>
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

Series: drm/i915/display: Allow display PHYs to reset power state (rev5)
URL   : https://patchwork.freedesktop.org/series/144103/
State : success

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
commit ccc29d03a0ee7f948cf36b8a4a6e718269195a09
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Tue Feb 18 12:00:19 2025 +0200

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
    v5: Add debug message on PLL enabling (Imre)
        Add check for intel_encoder_is_dig_port() (Imre)
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch 4587c05996666a92af63f86ba410bae1dc940794 drm-intel
fdeb2e0822b4 drm/i915/display: Drop crtc_state from C10/C20 pll programming
ccc29d03a0ee drm/i915/display: Allow display PHYs to reset power state


