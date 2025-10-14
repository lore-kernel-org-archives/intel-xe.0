Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95F7CCD185
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 00:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D25D10E104;
	Tue, 14 Oct 2025 00:16:32 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1967F10E104;
 Tue, 14 Oct 2025 00:16:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Reorder_cdclk?=
 =?utf-8?q?_stuff_for_vblank/guardband_length_checks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Oct 2025 00:16:32 -0000
Message-ID: <176040099209.8907.18280541341139527614@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251013201236.30084-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251013201236.30084-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Reorder cdclk stuff for vblank/guardband length checks
URL   : https://patchwork.freedesktop.org/series/155859/
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
commit 043be339de95445152bd7a9866a50e24afef9f1f
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon Oct 13 23:12:36 2025 +0300

    drm/i915: Neuter cdclk_prefill_adjustment()
    
    cdclk_prefill_adjustment() currently uses a stale cdclk
    value. And even if it was using the correct value it'd
    still just 'return 1' because the ratio that it's
    calculating is always <= 1.0, and it just rounds the ratio
    into an integer (and clamps the result to a maximum of 1).
    So for the moment, let's just 'return 1' since that's what
    the code ends up doing anyway.
    
    This is actually safe because 1.0 is the worst case (ie. slowest
    prefill) and thus the actual prefill is always guaranteed to be
    at least as fast as what we assumed during the check.
    
    We'll replace this soon with something that gives more accurate
    estimates.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch c917f7d11493984be9f381ca0a7667bd3e587ada drm-intel
479a25ba65c6 drm/i915/bw: Untangle dbuf bw from the sagv/mem bw stuff
-:425: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#425: 
new file mode 100644

-:650: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#650: FILE: drivers/gpu/drm/i915/display/intel_dbuf_bw.c:221:
+						   intel_dbuf_bw_min_cdclk(display, old_dbuf_bw_state),

-:651: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#651: FILE: drivers/gpu/drm/i915/display/intel_dbuf_bw.c:222:
+						   intel_dbuf_bw_min_cdclk(display, new_dbuf_bw_state),

total: 0 errors, 3 warnings, 0 checks, 750 lines checked
fa3840adda05 drm/i915: s/"not not"/"not"/
e07c466509cf drm/i915/bw: Relocate intel_bw_crtc_min_cdclk()
b01f01509a58 drm/i915/ips: Eliminate the cdclk_state stuff from hsw_ips_compute_config()
afb0a0a8ad92 drm/i915/fbc: Decouple FBC from intel_cdclk_atomic_check()
7ff5c8315035 drm/i915: s/min_cdck[]/plane_min_cdclk[]/
8b2c959d2bae drm/i915: Compute per-crtc min_cdclk earlier
9fc210b64b31 drm/i915: Include the per-crtc minimum cdclk in the crtc state dump
043be339de95 drm/i915: Neuter cdclk_prefill_adjustment()


