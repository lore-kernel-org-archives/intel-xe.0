Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1294BC44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 10:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EB710E74B;
	Tue, 21 Jul 2026 10:18:54 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6335D10E335;
 Tue, 21 Jul 2026 10:18:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Handl?=
 =?utf-8?q?e_struct_drm=5Fplane=5Fstate=2Eignore=5Fdamage=5Fclips_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Jul 2026 10:18:53 -0000
Message-ID: <178462913340.209804.3255064526470297471@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260721095454.404298-1-tzimmermann@suse.de>
In-Reply-To: <20260721095454.404298-1-tzimmermann@suse.de>
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

Series: drm/i915/display: Handle struct drm_plane_state.ignore_damage_clips (rev3)
URL   : https://patchwork.freedesktop.org/series/169626/
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
commit 4a7285cb3f16f45b205c811dee6fea753edc5276
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Tue Jul 21 11:54:11 2026 +0200

    drm/i915/display: Handle struct drm_plane_state.ignore_damage_clips
    
    Call drm_atomic_helper_check_plane_damage() in plane_atomic_check()
    before copying the damage information to guarantees that ignore_damage_clips
    from struct drm_plane_state has the correct value. Although i915 does not
    directly modify or use the flag, DRM's damage iterator will soon rely on
    it.
    
    As a side effect, if the CRTC has been marked for a full modeset before
    the call to drm_atomic_helper_check_plane_damage() happens, the plane now
    ignores all damage clips and does a full update.
    
    Git commit 35ed38d58257 ("drm: Allow drivers to indicate the damage
    helpers to ignore damage clips") introduced ignore_damage_clips to
    selectively ignore damage clipping for certain framebuffer changes. The
    mode-setting pipeline can disabled damage clippings for an atomic commit
    by setting ignore_damage_clips in struct drm_plane_state. The atomic
    commit will then do a full display update.
    
    Future directions: there's currently a multitude of options that affect
    damage clipping; with different places seeing different state. In order
    to unify this, drm_atomic_helper_check_plane_state() will soon evaluate
    all options in a single place and set ignore_damage_clips accordingly. All
    later stages of the mode-setting pipeline will only look at this field.
    
    v3:
    - fix the call to drm_atomic_helper_check_plane_state()
    - use primary-CRTC's plane state (Sashiko)
    - note full-plane updates in commit description
    v2:
    - move _check_plane_damage() before reading damage first time (Sashiko)
    - expand commit description
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
+ /mt/dim checkpatch 74d5c695a145d1d6394a84ba483549d3310eb2d9 drm-intel
4a7285cb3f16 drm/i915/display: Handle struct drm_plane_state.ignore_damage_clips
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
before copying the damage information to guarantees that ignore_damage_clips

total: 0 errors, 1 warnings, 0 checks, 22 lines checked


