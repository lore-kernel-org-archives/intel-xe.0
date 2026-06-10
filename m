Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571A2CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 15:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165D710EA40;
	Wed, 10 Jun 2026 15:35:20 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E283310EA11;
 Wed, 10 Jun 2026 15:35:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Improve_logic_behi?=
 =?utf-8?q?nd_damage_handling_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Jun 2026 15:35:18 -0000
Message-ID: <178110571892.65607.16827001887804217225@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260610152505.260172-1-tzimmermann@suse.de>
In-Reply-To: <20260610152505.260172-1-tzimmermann@suse.de>
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

Series: drm: Improve logic behind damage handling (rev4)
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
commit a319a953ca5eae127ff6a7a60c514ee3bfb20ece
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Jun 10 17:18:31 2026 +0200

    drm/vmwgfx: Remove unused field struct vmwgfx_du_update_plane.old_state
    
    Plane updates no longer require the old plane state. Remove the field
    from struct vmwgfx_du_update_plane and fix all callers.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
    Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
+ /mt/dim checkpatch fc59f76558703febba8056be87d1c97d14f7485e drm-intel
f9955f922f7a drm/amd/display: Handle struct drm_plane_state.ignore_damage_clips
6042ab6801ed drm/i915/display: Handle struct drm_plane_state.ignore_damage_clips
135b8263ce7a drm/vboxvideo: Handle struct drm_plane_state.ignore_damage_clips
50d941f9f6e3 drm/vmwgfx: Handle struct drm_plane_state.ignore_damage_clips
eb2f528facf5 drm/appletbdrm: Allocate request/response buffers in begin_fb_access
78c9ad39e00a drm/damage-helper: Clear ignore_damage_clips in plane-state duplication
66bee9a7752f drm/damage-helper: Do not alter damage clips on modeset, but ignore them
0ea62b0d13d1 drm/atomic-helpers: Evaluate plane damage after atomic_check
9ff3f2da44bc drm/ingenic: Remove calls to drm_atomic_helper_check_plane_damage()
23e09ffa7fa0 drm/atomic_helper: Do not evaluate plane damage before atomic_check
e6799f9d0599 drm/damage-helper: Test src coord in drm_atomic_helper_check_plane_damage()
bbb3dde714cb drm/damage-helper: Remove old state from drm_atomic_helper_damage_iter_init()
-:571: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus-qemu.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

-:574: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus-qemu.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

total: 0 errors, 2 warnings, 0 checks, 509 lines checked
418e33dc7b77 drm/damage-helper: Remove old state from drm_atomic_helper_damage_merged()
750a9938b9b1 drm/damage-helper: Rename state parameters in damage helpers
a319a953ca5e drm/vmwgfx: Remove unused field struct vmwgfx_du_update_plane.old_state


