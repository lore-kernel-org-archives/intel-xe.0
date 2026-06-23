Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF44BCDB471
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 22:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A179310E449;
	Tue, 23 Jun 2026 22:35:26 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9327010E449;
 Tue, 23 Jun 2026 22:35:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=2C_drm/xe=3A_Page?=
 =?utf-8?q?_defragmentation_for_sub-optimally_backed_BOs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jun 2026 22:35:24 -0000
Message-ID: <178225412459.108193.9257113532210316738@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260623222732.360872-1-matthew.brost@intel.com>
In-Reply-To: <20260623222732.360872-1-matthew.brost@intel.com>
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

Series: drm/ttm, drm/xe: Page defragmentation for sub-optimally backed BOs
URL   : https://patchwork.freedesktop.org/series/169053/
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
commit 878d2eb3eb824974038f1cd6ef953c78604030d9
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jun 23 15:27:32 2026 -0700

    drm/xe: Add Kconfig.profile options for BO defrag configuration
    
    Add Kconfig.profile options to make XE_BO_DEFRAG_* defines configurable:
    - DRM_XE_BO_DEFRAG_RECLAIM_BACKOFF_THRESHOLD: Threshold for TTM reclaim
      backoff
    - DRM_XE_BO_DEFRAG_NUM_BO_LIMIT_PER_WORK: Maximum BOs to defrag per work
      run
    - DRM_XE_BO_DEFRAG_INTERVAL_MS: Default delay before defrag worker runs
    - DRM_XE_BO_DEFRAG_INTERVAL_MAX_MS: Upper bound for defrag worker
      interval
    
    Update xe_bo.c to use these Kconfig options as defaults via #ifdef
    guards, maintaining backward compatibility with hardcoded values when
    not configured.
    
    Additionally, disable defrag completely when
    XE_BO_DEFRAG_NUM_BO_LIMIT_PER_WORK is set to 0 by returning early from
    xe_bo_defrag_add() without adding to the defrag list or kicking the
    worker.
    
    Cc: Carlos Santa <carlos.santa@intel.com>
    Cc: Ryan Neph <ryanneph@google.com>
    Cc: Christian Koenig <christian.koenig@amd.com>
    Cc: Huang Rui <ray.huang@amd.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Maxime Ripard <mripard@kernel.org>
    Cc: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: David Airlie <airlied@gmail.com>
    Cc: Simona Vetter <simona@ffwll.ch>
    Cc: dri-devel@lists.freedesktop.org
    Cc: linux-kernel@vger.kernel.org
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Assisted-by: GitHub_Copilot:claude-haiku-4.5
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch e2a6e04d045a56c6dc61e1eb9e2a6d7cf86512cd drm-intel
d434e2d39310 drm/ttm/pool: Allow backing off reclaim at the beneficial order
8f15da64e272 drm/ttm: Record sub-optimal page order allocations in ttm_tt
d0659bc3ecfb drm/ttm: Support defragmentation moves
a2a649919607 drm/ttm: Add fault injection for beneficial-order allocation failures
b82ba91e7f54 drm/xe: Track BOs backed at a sub-optimal page order
a0d4fba1341f drm/xe: Back off beneficial-order reclaim under defrag pressure
5405214087c6 drm/xe: Add xe_migrate_copy_defrag() for on-GPU defrag copies
-:167: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#167: FILE: drivers/gpu/drm/xe/xe_migrate.c:1026:
+		batch_size += ((flags.copy_only_ccs || flags.defrag_ccs) ? 0 : emit_copy_cmd_len(xe)) +

total: 0 errors, 1 warnings, 0 checks, 234 lines checked
eeb337515691 drm/xe: Handle defrag moves in xe_bo_move()
-:66: WARNING:PREFER_FALLTHROUGH: Prefer 'fallthrough;' over fallthrough comment
#66: FILE: drivers/gpu/drm/xe/xe_bo.c:1131:
+	 * For a defrag move the old and new tt differ, so fall through to the

total: 0 errors, 1 warnings, 0 checks, 78 lines checked
1b273d543b36 drm/xe: Add a page defragmentation worker
536fa976c9a1 drm/xe: Add defrag GT stats
253bf46c9f56 drm/xe: Add DRM_XE_DEBUG_DEFRAG Kconfig option for debugging memory fragmentation
878d2eb3eb82 drm/xe: Add Kconfig.profile options for BO defrag configuration


