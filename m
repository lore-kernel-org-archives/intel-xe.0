Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9969D606A334
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 17:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FD510F314;
	Mon, 16 Nov 2026 17:04:51 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560AD10F314;
 Mon, 16 Nov 2026 17:04:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Ignor?=
 =?utf-8?q?e_disabled_planes_in_async_flip_checks_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Erwin Springer via B4 Relay" <devnull+aot.lerwin.gmail.com@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Nov 2026 17:04:49 -0000
Message-ID: <179484868934.33749.16727512233678366541@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261115-i915-async-planes-v1-1-d13498d0b6be@gmail.com>
In-Reply-To: <20261115-i915-async-planes-v1-1-d13498d0b6be@gmail.com>
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

Series: drm/i915/display: Ignore disabled planes in async flip checks (rev2)
URL   : https://patchwork.freedesktop.org/series/178711/
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
commit fcb953e622ad230d8ca09817a783f65c42792974
Author: Erwin Springer <aot.lerwin@gmail.com>
Date:   Sun Nov 15 15:17:23 2026 +0100

    drm/i915/display: Ignore disabled planes in async flip checks
    
    Atomic async flips may carry properties that don't change, so compositors
    tend to send their whole plane state with every commit. KWin for example
    adds all planes of the pipe, including the ones that are disabled and stay
    disabled (CRTC_ID=0, FB_ID=0).
    
    intel_async_flip_check_uapi() fails the commit as soon as the state
    contains any plane of the pipe that can't do async flips:
    
      [drm:intel_atomic_check [i915]] [PLANE:66:plane 2A] async flip not supported
      [drm:drm_atomic_check_only.cold] atomic driver check for ... failed: -22
    
    So with such a compositor tearing never works on a pipe with sprite or
    cursor planes, even though only the FB of the primary plane changes. KWin
    silently falls back to vsynced flips, about 60 rejected commits per second.
    
    A plane without a framebuffer before and after the commit takes no part in
    the flip. Skip it in both async flip checks.
    
    Tested on Raptor Lake-U (Iris Xe) with the patch applied to the i915 of
    Linux 7.3.4, unmodified KWin 6.8.2 and a fullscreen client that requests
    tearing through wp_tearing_control_v1. Before, none of about 350 frames per
    run was presented without vsync. With the patch 3334 of 3340 frames tear
    and the message above is gone. What is still rejected is the first flip
    after the modifier or format changed, once per run, as intended.
    
    Signed-off-by: Erwin Springer <aot.lerwin@gmail.com>
+ /mt/dim checkpatch d5a6e2921e68b0cc42812376ca6c8095b6c941a2 drm-intel
fcb953e622ad drm/i915/display: Ignore disabled planes in async flip checks
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
  [drm:intel_atomic_check [i915]] [PLANE:66:plane 2A] async flip not supported

total: 0 errors, 1 warnings, 0 checks, 24 lines checked


