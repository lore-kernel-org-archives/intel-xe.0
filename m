Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464CFC5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 09:20:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC00510E5A4;
	Wed, 28 May 2025 09:20:03 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E601610E5A4;
 Wed, 28 May 2025 09:20:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/gem=3A_Audit_around_h?=
 =?utf-8?q?andle=5Fcreate_races?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simona Vetter" <simona.vetter@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 09:20:02 -0000
Message-ID: <174842400292.27669.13571204674089603514@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
In-Reply-To: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
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

Series: drm/gem: Audit around handle_create races
URL   : https://patchwork.freedesktop.org/series/149576/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit de6329afb3bbecb37e4ab07e8b1320674b0e0f8e
Author: Simona Vetter <simona.vetter@ffwll.ch>
Date:   Wed May 28 11:13:06 2025 +0200

    drm/xe: Add comments about drm_file.object_idr issues
    
    idr_for_each_entry() is fine, but will prematurely terminate on
    transient NULL entries. It should be switched over to idr_for_each,
    which allows you to handle this explicitly.
    
    Note that transient NULL pointers in drm_file.object_idr have been a
    thing since f6cd7daecff5 ("drm: Release driver references to handle
    before making it available again"), this is a really old issue.
    
    Since it's just a premature loop terminate the impact should be fairly
    benign, at least for any debugfs or fdinfo code.
    
    On top of that this code also drops the drm_file.table_lock lock while
    iterating, which can mess up the iterator state. And that's actually
    bad.
    
    Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
    Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: intel-xe@lists.freedesktop.org
+ /mt/dim checkpatch 87357770e16c3ee781dee93de25d175944f7d239 drm-intel
0bc065c2570d drm/gem: Fix race in drm_gem_handle_create_tail()
-:42: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit f6cd7daecff5 ("drm: Release driver references to handle before making it available again")'
#42: 
Note that the close-side of this race was fixed in f6cd7daecff5 ("drm:

-:84: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#84: 
Reported-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: stable@vger.kernel.org

-:125: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "obj"
#125: FILE: drivers/gpu/drm/drm_gem.c:429:
+	WARN_ON(obj != NULL);

-:143: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 1 errors, 2 warnings, 1 checks, 37 lines checked
4fdb91a34a34 drm/fdinfo: Switch to idr_for_each() in drm_show_memory_stats()
-:13: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit f6cd7daecff5 ("drm: Release driver references to handle before making it available again")'
#13: 
thing since f6cd7daecff5 ("drm: Release driver references to handle

total: 1 errors, 0 warnings, 0 checks, 111 lines checked
a4468e1a24bb drm/panthor: Fix UAF in panthor_gem_create_with_handle() debugfs code
-:14: WARNING:TYPO_SPELLING: 'initilized' may be misspelled - perhaps 'initialized'?
#14: 
actually initilized.
         ^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 85 lines checked
fe19488b1263 accel/qaic: delete qaic_bo.handle
-:8: WARNING:TYPO_SPELLING: 'intialize' may be misspelled - perhaps 'initialize'?
#8: 
allowed to further intialize a bo after that function has published it
                   ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
bca5d0be5d3e drm/amd/kfd: Add comment about possible drm_gem_handle_create() race
-:26: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#26: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:1778:
+	 * drm_gem_handle_create. Or explain why this is safe. */

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
e9cb7f84c3f0 drm/amdgpu: Add comments about drm_file.object_idr issues
-:14: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit f6cd7daecff5 ("drm: Release driver references to handle before making it available again")'
#14: 
thing since f6cd7daecff5 ("drm: Release driver references to handle

total: 1 errors, 0 warnings, 0 checks, 14 lines checked
6e19b4eb0620 drm/vmwgfx: Add comments about drm_file.object_idr issues
-:11: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit f6cd7daecff5 ("drm: Release driver references to handle before making it available again")'
#11: 
thing since f6cd7daecff5 ("drm: Release driver references to handle

total: 1 errors, 0 warnings, 0 checks, 7 lines checked
de6329afb3bb drm/xe: Add comments about drm_file.object_idr issues
-:14: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit f6cd7daecff5 ("drm: Release driver references to handle before making it available again")'
#14: 
thing since f6cd7daecff5 ("drm: Release driver references to handle

-:48: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#48: FILE: drivers/gpu/drm/xe/xe_drm_client.c:218:
+			 * state up */

total: 1 errors, 1 warnings, 0 checks, 15 lines checked


