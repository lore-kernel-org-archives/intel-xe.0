Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1282A606A320
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 17:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBC010E4AF;
	Fri, 23 Oct 2026 17:06:18 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616CE10E086;
 Fri, 23 Oct 2026 17:05:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/vrr=3A_Fixes_and?=
 =?utf-8?q?_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Oct 2026 17:05:56 -0000
Message-ID: <179277515639.62976.8251405195338544419@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/i915/vrr: Fixes and cleanups
URL   : https://patchwork.freedesktop.org/series/176739/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 860c9d630c5c53a0257224a6c611ee59b16b7438
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Fri Oct 23 19:58:03 2026 +0300

    drm/i915: Add more vertical timing diagrams
    
    Document what's going in the vertical blank interval on all
    platforms. We already have one diagram, but that also includes
    details on the frame counter vs. pixel counter differences and
    whatnot, and so would probably get even messier if we added
    more to it. So create a new set of simpler diagrams. We basically
    have four different timing generator behaviors, add a diagram
    for each.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch b255dd13059988fddde9ea187d1dd1017c9a5766 drm-intel
b75d0865c5bd drm/i915/vrr: Fix intel_vrr_dcb_vmin_vblank_start()
9987794507ed drm/i915/vrr: Drop bogus intel_vrr_hw_value() call
834663f19459 drm/i915/vrr: s/intel_vrr_vblank_start()/vrr_vblank_start()/
654466db9b54 drm/i915/vrr: Reuse vrr_vblank_start() in more places
ebe46a61835b drm/i915/vrr: Add a local 'adjusted_mode' variable to intel_vrr_get_config()
be28a2ac6b67 drm/i915/vrr: Use the local 'adjusted_mode' intel_vrr_compute_config()
ad40542ca783 drm/i915/vrr: Annotate live functions
592b223ea73a drm/i915/vrr: Shuffle code around
c7b1f28dacac drm/i915/vrr: Extract vrr_safe_window_end()
442d5e6a09c9 drm/i915/vrr: Extract intel_vrr_vmin_vblank_start_live()
410e97ee3511 drm/i915/vrr: Introduce intel_vrr_vblank_start_live() and use it for MMIO vblank evasion
6a2229355e6e drm/i915/vrr: Include VRR safe window in state dump
-:26: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#26: FILE: drivers/gpu/drm/i915/display/intel_crtc_state_dump.c:318:
+		   intel_vrr_safe_window_start(pipe_config), intel_vrr_vmin_safe_window_end(pipe_config),

total: 0 errors, 1 warnings, 0 checks, 35 lines checked
860c9d630c5c drm/i915: Add more vertical timing diagrams


