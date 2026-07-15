Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1802CC44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 13:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C514210F05F;
	Wed, 15 Jul 2026 13:28:37 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3EE10F05F;
 Wed, 15 Jul 2026 13:28:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/cdclk=3A_Workaro?=
 =?utf-8?q?und_some_kind_of_scaler_2PPC_issue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jul 2026 13:28:36 -0000
Message-ID: <178412211688.190770.7021345788671590850@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260715120926.10786-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260715120926.10786-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/cdclk: Workaround some kind of scaler 2PPC issue
URL   : https://patchwork.freedesktop.org/series/170484/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 075a046d92212ba7ac27a00fd4d595ee3f9cb0ce
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Jul 15 15:09:26 2026 +0300

    drm/i915/cdclk: Deal with 2 PPC hscale issues when calculating min CDCLK
    
    Double the fractional part of the horizontal scale factor
    for the purposes of min_cdck calculation. This bumps the min
    CDCLK sufficiently to overcome some kind of 2 PPC granularity
    issue. Without this CDCLK may end up being too low and we get
    underruns with certail horizontal downscale factors.
    
    The current Bspec formula calls for doubling only the
    fractional part below 0.5, and rounding it to down to
    a unit fraction. But that formula does not result in a
    sufficient CDCLK bump in a lot of cases. Empirical evidence
    supports doubling the entire fractional part, so let's just
    do that while we wait for further analysis from the hardware
    team.
    
    Also note that the position of the scaler output window also
    seems to matter. If the output is near the left edge of the
    screen then lower CDCLK is sufficient, but moving the output
    window further to the right causes underruns unless CDCLK is
    also bumped. Some prefill happening during hblank already?
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 116ce94f4e028e50e3523c46a8ce1e665ce47cb9 drm-intel
e9c7d16d400d drm/i915/cdclk: Use intel_cdclk_ppc() in intel_modeset_readout_hw_state()
-:59: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#59: FILE: drivers/gpu/drm/i915/display/intel_modeset_setup.c:860:
+						     intel_cdclk_ppc(display, crtc_state->double_wide));

total: 0 errors, 1 warnings, 0 checks, 33 lines checked
5dce3ccf90bc drm/i915/cdclk: Introduce HAS_2PPC()
dc9b19131017 drm/i915/cdclk: Introduce crtc_state->pixel_rate_cdclk
075a046d9221 drm/i915/cdclk: Deal with 2 PPC hscale issues when calculating min CDCLK
-:111: ERROR:SPACING: space required after that ',' (ctx:VxV)
#111: FILE: drivers/gpu/drm/i915/display/intel_plane.c:294:
+	vscale = drm_rect_calc_vscale(src, dst,0, INT_MAX);
 	                                      ^

-:125: CHECK:SPACING: No space is necessary after a cast
#125: FILE: drivers/gpu/drm/i915/display/intel_plane.c:308:
+	return DIV64_U64_ROUND_UP((u64) rate * hscale * vscale, 1ull << 32);

total: 1 errors, 0 warnings, 1 checks, 142 lines checked


