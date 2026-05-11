Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2BFCD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 15:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9ED10E1E1;
	Mon, 11 May 2026 15:28:03 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7E310E1D0;
 Mon, 11 May 2026 15:28:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Improve_logic_behi?=
 =?utf-8?q?nd_damage_handling_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 May 2026 15:28:02 -0000
Message-ID: <177851328212.58002.12942791113896631262@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260511122421.114014-1-tzimmermann@suse.de>
In-Reply-To: <20260511122421.114014-1-tzimmermann@suse.de>
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

Series: drm: Improve logic behind damage handling (rev2)
URL   : https://patchwork.freedesktop.org/series/166108/
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
commit 3d95cbeabb89cc1d0a5225b81356b2db0db84bbe
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Mon May 11 14:22:34 2026 +0200

    drm/vmwgfx: Remove unused field struct vmwgfx_du_update_plane.old_state
    
    Plane updates no longer require the old plane state. Remove the field
    from struct vmwgfx_du_update_plane and fix all callers.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
+ /mt/dim checkpatch f8ee23694aa6be213355905a78f79bb1b0861565 drm-intel
cc03da3857d0 drm/damage-helper: Do not alter damage clips on modeset, but ignore them
48081d78858d drm/atomic-helpers: Evaluate plane damage after atomic_check
89eb98e76fd9 drm/ingenic: Remove calls to drm_atomic_helper_check_plane_damage()
6fa7a535de7b drm/damage-helper: Test src coord in drm_atomic_helper_check_plane_damage()
fb46401507e8 drm/appletbdrm: Allocate request/response buffers in begin_fb_access
a15af9a1bd0d drm/damage-helper: Remove old state from drm_atomic_helper_damage_iter_init()
-:568: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus-qemu.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

-:571: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus-qemu.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

total: 0 errors, 2 warnings, 0 checks, 509 lines checked
91e0ccd51d95 drm/damage-helper: Remove old state from drm_atomic_helper_damage_merged()
89ad10814fdd drm/atomic_helper: Do not evaluate plane damage before atomic_check
00cc7fe25819 drm/damage-helper: Rename state parameters in damage helpers
3d95cbeabb89 drm/vmwgfx: Remove unused field struct vmwgfx_du_update_plane.old_state


