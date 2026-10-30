Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1243606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EB210E0EC;
	Fri, 30 Oct 2026 17:20:56 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5318C10E0EC;
 Fri, 30 Oct 2026 17:20:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Enable_vblank?=
 =?utf-8?q?s_after_the_timing_generator_has_started?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Oct 2026 17:20:55 -0000
Message-ID: <179338085533.95178.6432912361973700592@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Enable vblanks after the timing generator has started
URL   : https://patchwork.freedesktop.org/series/177276/
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
commit d31616db6c784efd0e452167789a1321b0b6611c
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Fri Oct 30 19:13:26 2026 +0200

    drm/i915: Allow joiner with port sync
    
    Ever since the overhaul to use
    for_each_pipe_crtc_modeset_{enable,disable)()/etc
    joiner no longer interferes with the transcoder
    based order imposed in skl_commit_modeset_enables()
    and intel_commit_modeset_disables(). Thus we can
    now allow joiner to be used in conjunction with
    port sync.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 238c1e3e984e2b7f948cb24165314b8d719a23d6 drm-intel
79db06dd3082 drm/i915: Disable port sync if VRR is enabled
-:40: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 12 lines checked
ee1f94c183f5 drm/i915: Do intel_crtc_vblank_on() later on HSW+
cd1c69dc29ba drm/i915: Handle joined pipes inside intel_crtc_vblank_{on, off}()
b37fbffd9179 Revert "drm/i915/display: Avoid stale PIPE_SCANLINE values after crtc_enable"
500668b4cbab drm/i915: Fix intel_crtc_vblank_on() with port sync
4a594a5ce23a drm/i915: Wait for timing generator to start in intel_crtc_vblank_on() on HSW+
25f18502452c drm/i915: Reduce the sleep inside pipe_scanline_is_moving()
1cf7dbfe21bc drm/i915: Document timing generator start/stop behaviour on HSW+
2ab175d615be drm/i915: Fix FEC wait with port sync on pre-LNL
d31616db6c78 drm/i915: Allow joiner with port sync


