Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1090CC83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 13:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62CA10E7FE;
	Wed,  9 Jul 2025 13:57:49 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6842310E801;
 Wed,  9 Jul 2025 13:57:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/gem=3A_Fix_race_in_drm=5Fgem=5Fhandle=5Fcreate=5Ftail?=
 =?utf-8?q?=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simona Vetter" <simona.vetter@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Jul 2025 13:57:48 -0000
Message-ID: <175206946841.147425.5066230296802430784@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250707151814.603897-1-simona.vetter@ffwll.ch>
In-Reply-To: <20250707151814.603897-1-simona.vetter@ffwll.ch>
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

Series: series starting with [1/2] drm/gem: Fix race in drm_gem_handle_create_tail() (rev2)
URL   : https://patchwork.freedesktop.org/series/151277/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit df0d2746a503e35814e246f2ad2a9146d3eff3e2
Author: Simona Vetter <simona.vetter@ffwll.ch>
Date:   Wed Jul 9 15:52:20 2025 +0200

    drm/panthor: Fix UAF in panthor_gem_create_with_handle() debugfs code
    
    The object is potentially already gone after the drm_gem_object_put().
    In general the object should be fully constructed before calling
    drm_gem_handle_create(), except the debugfs tracking uses a separate
    lock and list and separate flag to denotate whether the object is
    actually initilized.
    
    Since I'm touching this all anyway simplify this by only adding the
    object to the debugfs when it's ready for that, which allows us to
    delete that separate flag. panthor_gem_debugfs_bo_rm() already checks
    whether we've actually been added to the list or this is some error
    path cleanup.
    
    v2: Fix build issues for !CONFIG_DEBUGFS (Adrián)
    
    v3: Add linebreak and remove outdated comment (Liviu)
    
    Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
    Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
    Cc: Boris Brezillon <boris.brezillon@collabora.com>
    Cc: Steven Price <steven.price@arm.com>
    Cc: Liviu Dudau <liviu.dudau@arm.com>
    Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
    Signed-off-by: Simona Vetter <simona.vetter@intel.com>
    Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
+ /mt/dim checkpatch 0cc3f2731cb8e77b27ffb7f361407fd240276ed5 drm-intel
af5595056eb8 drm/gem: Fix race in drm_gem_handle_create_tail()
-:42: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit f6cd7daecff5 ("drm: Release driver references to handle before making it available again")'
#42: 
Note that the close-side of this race was fixed in f6cd7daecff5 ("drm:

-:73: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#73: 
Reported-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Tested-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

-:116: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "obj"
#116: FILE: drivers/gpu/drm/drm_gem.c:476:
+	WARN_ON(obj != NULL);

-:134: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 1 errors, 2 warnings, 1 checks, 37 lines checked
df0d2746a503 drm/panthor: Fix UAF in panthor_gem_create_with_handle() debugfs code
-:14: WARNING:TYPO_SPELLING: 'initilized' may be misspelled - perhaps 'initialized'?
#14: 
actually initilized.
         ^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 88 lines checked


