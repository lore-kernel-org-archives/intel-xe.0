Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A8B606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 08:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CF010F381;
	Tue, 24 Nov 2026 08:50:13 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390C710F37D;
 Tue, 24 Nov 2026 08:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Handl?=
 =?utf-8?q?e_struct_drm=5Fplane=5Fstate=2Eignore=5Fdamage=5Fclips_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Nov 2026 08:50:13 -0000
Message-ID: <179551021322.75807.1218946421219440521@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261124084108.528317-1-tzimmermann@suse.de>
In-Reply-To: <20261124084108.528317-1-tzimmermann@suse.de>
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

Series: drm/i915/display: Handle struct drm_plane_state.ignore_damage_clips (rev4)
URL   : https://patchwork.freedesktop.org/series/169626/
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
commit de404f459a0b375113d8a75ff432aa43b95b8611
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Tue Nov 24 09:40:01 2026 +0100

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
+ /mt/dim checkpatch f3203131d5fcefbf2bb40a53111d9e37eb02b1a4 drm-intel
de404f459a0b drm/i915/display: Handle struct drm_plane_state.ignore_damage_clips
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
before copying the damage information to guarantees that ignore_damage_clips

total: 0 errors, 1 warnings, 0 checks, 22 lines checked


