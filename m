Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA524CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 18:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9557E10E90F;
	Wed, 27 May 2026 18:45:03 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED65810E90E;
 Wed, 27 May 2026 18:45:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C01/10=5D_drm/damage-helper=3A_Do_not_alter_damage_clips_on_mo?=
 =?utf-8?q?deset=2C_but_ignore_them?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 May 2026 18:45:02 -0000
Message-ID: <177990750296.16848.1535482383885309116@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260527145113.241595-1-tzimmermann@suse.de>
In-Reply-To: <20260527145113.241595-1-tzimmermann@suse.de>
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

Series: series starting with [v3,01/10] drm/damage-helper: Do not alter damage clips on modeset, but ignore them
URL   : https://patchwork.freedesktop.org/series/167394/
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
commit 78b22a54d71dfe6c30b917af0083d9b39bfdc0bb
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed May 27 16:46:29 2026 +0200

    drm/vmwgfx: Remove unused field struct vmwgfx_du_update_plane.old_state
    
    Plane updates no longer require the old plane state. Remove the field
    from struct vmwgfx_du_update_plane and fix all callers.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
+ /mt/dim checkpatch 11a8456527f00d86dc8b23035c324da194fbbadb drm-intel
1008c5a58ada drm/damage-helper: Do not alter damage clips on modeset, but ignore them
55ae0a06a5e2 drm/atomic-helpers: Evaluate plane damage after atomic_check
596f1fc47dd1 drm/ingenic: Remove calls to drm_atomic_helper_check_plane_damage()
028fb5f5a779 drm/damage-helper: Test src coord in drm_atomic_helper_check_plane_damage()
79fa948d0936 drm/appletbdrm: Allocate request/response buffers in begin_fb_access
43363a4715a2 drm/damage-helper: Remove old state from drm_atomic_helper_damage_iter_init()
-:568: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus-qemu.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

-:571: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus-qemu.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

total: 0 errors, 2 warnings, 0 checks, 509 lines checked
8c52989902e1 drm/damage-helper: Remove old state from drm_atomic_helper_damage_merged()
5238e5668513 drm/atomic_helper: Do not evaluate plane damage before atomic_check
c39700c80dbb drm/damage-helper: Rename state parameters in damage helpers
78b22a54d71d drm/vmwgfx: Remove unused field struct vmwgfx_du_update_plane.old_state


