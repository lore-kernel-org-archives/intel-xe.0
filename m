Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D00CEB2CB
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 23:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F1A10E2FE;
	Mon, 30 Sep 2024 23:19:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E81610E2BC;
 Mon, 30 Sep 2024 23:19:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Use_DSB_for_p?=
 =?utf-8?q?lane/color_management_commits?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Sep 2024 23:19:04 -0000
Message-ID: <172773834457.1139389.8670161768039378807@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240930170415.23841-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240930170415.23841-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Use DSB for plane/color management commits
URL   : https://patchwork.freedesktop.org/series/139341/
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
commit 47d1986acd00920d5507baba894757a576b8ca12
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon Sep 30 20:04:15 2024 +0300

    drm/i915/dsb: Use DSB for plane/color management updates
    
    Push regular plane/color management updates to the DSB,
    if other constraints allow it.
    
    The first part of the sequence will go as follows:
    - CPU will kick off DSB0 immediately
    - DSB0 writes double bufferd non-arming registers
    - DSB0 evades the vblank
    - DSB0 writes double buffered arming registers
    
    If no color management updates is needed we follow that up with:
    - DSB0 waits for the undelayed vblank
    - DSB0 waits for the delayed vblank (usec wait)
    - DSB0 emits an interrupt which will cause the CPU to complete the commit
    
    If color management update is needed:
    - DSB0 will start DSB1 with wait for undelayed vblank
    - DSB0 will in parallel perform the force DEwake tricks
    - DSB1 writes single buffered LUT registers
    - DSB1 waits for the delayed vblank (usec wait)
    - DSB1 emits an interrupt which will cause the CPU to complete the commit
    
    With this sequence we don't need to increase the vblank delay
    to make room for register programming during vblank, which is
    a good thing for high refresh rate display. But I'll need to
    still think of some way to eliminate VRR commit completion
    related races under this scheme.
    
    Stuff that isn't ready for DSB yet:
    - modesets (potentially we could do
      at least the plane enabling via DSB)
    - fastsets
    - VRR
    - PSR
    - scalers
    - async flips
    
    Reviewed-by: Animesh Manna <animesh.manna@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1 drm-intel
cfa53fe8197a drm/i915/dsb: Avoid reads of the DSB buffer for indexed register writes
9ab6afa1a942 drm/i915: Prepare clear color before wait_for_dependencies()
87528053b7b5 drm/i915/dsb: Generate the DSB buffer in commit_tail()
a5bb1a5618e8 drm/i915/dsb: Enable programmable DSB interrupt
cf6d6bf7158d drm/i915/dsb: Introduce intel_dsb_vblank_evade()
1eea038a7f93 drm/i915/dsb: Introduce intel_dsb_wait_usec()
df5eb4fcbbc6 drm/i915/dsb: Introduce intel_dsb_wait_vblanks()
0022b8561371 drm/i915: Introduce intel_scanlines_to_usecs()
3c5a7173a0e0 drm/i915/dsb: Introduce intel_dsb_wait_vblank_delay()
1ba3124af292 drm/i915: Extract intel_crtc_prepare_vblank_event()
b74277d2702b drm/i915: Plumb 'dsb' all way to the plane hooks
-:442: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#442: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:632:
+				   skl_cursor_wm_reg_val(skl_plane_wm_level(pipe_wm, plane_id, level)));

-:908: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#908: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:740:
+				   skl_plane_wm_reg_val(skl_plane_wm_level(pipe_wm, plane_id, level)));

total: 0 errors, 2 warnings, 0 checks, 1215 lines checked
d5196f05b460 drm/i915: Plumb 'dsb' all way to the color commit hooks
47d1986acd00 drm/i915/dsb: Use DSB for plane/color management updates


