Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E78ECAC5AC
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 17:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66C510E667;
	Tue, 23 Sep 2025 17:46:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E81A10E667;
 Tue, 23 Sep 2025 17:46:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/cdclk=3A_Decoupl?=
 =?utf-8?q?e_CDCLK_from_state-=3Emodeset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Sep 2025 17:46:23 -0000
Message-ID: <175864958318.359685.9767727759028603119@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250923171943.7319-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250923171943.7319-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/cdclk: Decouple CDCLK from state->modeset
URL   : https://patchwork.freedesktop.org/series/154922/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9a6daad3e5bd606e4cbcfabacc6e8248af79761b
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Sep 23 20:19:42 2025 +0300

    drm/i915/cdclk: Move intel_cdclk_atomic_check()
    
    Move intel_cdclk_atomic_check() a bit so that we don't need an
    extra intel_modeset_calc_cdclk() forward declaration.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch b7dc24fb9b729c5719c63fd9e7706a26674017f3 drm-intel
81c1ddceb42b drm/i915: Introduce intel_crtc_enable_changed() and intel_any_crtc_enable_changed()
29b7d745b067 drm/i915: Introduce intel_crtc_active_changed() and intel_any_crtc_active_changed()
6517e3c3d0f9 drm/i915/bw: Skip the bw_state->active_pipes update if no pipe is changing its active state
100da82c0e2f drm/1915/bw: Drop redundant display version checks
a2372813d1c6 drm/i915/cdclk: Extract glk_cdclk_audio_wa_needed()
a61823775858 drm/i915/cdclk: Extract dg2_power_well_count()
86f028fd8a02 drm/i915/cdclk: Introduce intel_cdclk_modeset_checks()
9b5325df77a3 drm/i915/cdclk: Handle the force_min_cdclk state locking in intel_cdclk_atomic_check()
a8e59ab6fb69 drm/i915/cdclk: Extract intel_cdclk_update_bw_min_cdclk()
4fa0b2c580a5 drm/i915/cdclk: Extract intel_cdclk_update_crtc_min_cdclk()
0ccc640cc020 drm/i915/cdclk: Rework bw_min_cdclk handling
6dd1aba0f03b drm/i915/cdclk: Do intel_cdclk_update_crtc_min_cdclk() per-pipe
-:53: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#53: FILE: drivers/gpu/drm/i915/display/intel_cdclk.c:3294:
+							intel_crtc_compute_min_cdclk(old_crtc_state),

-:54: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#54: FILE: drivers/gpu/drm/i915/display/intel_cdclk.c:3295:
+							intel_crtc_compute_min_cdclk(new_crtc_state),

total: 0 errors, 2 warnings, 0 checks, 116 lines checked
1ab0f3f16f51 drm/i915/cdclk: Relocate intel_plane_calc_min_cdclk() calls
0c2aed8456a1 drm/i915/cdclk: Rework crtc min_cdclk handling
96453a4d4f62 drm/i915/cdclk: Move intel_bw_crtc_min_cdclk() handling into intel_crtc_compute_min_cdclk()
bfea3efed4c9 drm/i915/cdclk: Decuple cdclk from state->modeset
1fe8f216e8ac drm/i915: Introduce intel_calc_enabled_pipes()
5b998402cc41 drm/i915/cdclk: Use enabled_pipes instead of active_pipes for the glk audio w/a
38a1c81286a8 drm/i915/cdclk: Hide intel_modeset_calc_cdclk()
9a6daad3e5bd drm/i915/cdclk: Move intel_cdclk_atomic_check()


