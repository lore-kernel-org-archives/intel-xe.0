Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8250DC71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 16:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B89910E0F4;
	Tue, 17 Jun 2025 16:39:47 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FA910E0F4;
 Tue, 17 Jun 2025 16:39:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_DRM_scheduler_for_del?=
 =?utf-8?q?ayed_GT_TLB_invalidations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Jun 2025 16:39:46 -0000
Message-ID: <175017838681.88665.11974962838440086099@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250617153730.2136174-1-matthew.brost@intel.com>
In-Reply-To: <20250617153730.2136174-1-matthew.brost@intel.com>
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

Series: Use DRM scheduler for delayed GT TLB invalidations
URL   : https://patchwork.freedesktop.org/series/150402/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 385d724a23203d0dbddb680258a58b90f3d0581c
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jun 17 08:37:30 2025 -0700

    drm/xe: Use GT TLB invalidation jobs in PT layer
    
    Rather than open-coding GT TLB invalidations in the PT layer, use GT TLB
    invalidation jobs. The real benefit is that GT TLB invalidation jobs use
    a single dma-fence context, allowing the generated fences to be squashed
    in dma-resv/DRM scheduler.
    
    Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch cec6aa5dda0bef82c8f9ba6422d982712a0f8c7d drm-intel
a232170258a1 drm/xe: Explicitly mark migration queues with flag
57f99acd2529 drm/xe: Add generic dependecy jobs / scheduler
-:30: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#30: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 202 lines checked
aa8e8d562bd1 drm/xe: Add dependency scheduler for GT TLB invalidations to bind queues
f7fe8e4b6b99 drm/xe: Add xe_migrate_job_lock/unlock helpers
-:35: WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#35: FILE: drivers/gpu/drm/xe/xe_migrate.c:1934:
+		xe_vm_assert_held(q->vm);	/* User queues VM's should be
+						   locked */

-:35: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#35: FILE: drivers/gpu/drm/xe/xe_migrate.c:1934:
+						   locked */

-:54: WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#54: FILE: drivers/gpu/drm/xe/xe_migrate.c:1953:
+		xe_vm_assert_held(q->vm);	/* User queues VM's should be
+						   locked */

-:54: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#54: FILE: drivers/gpu/drm/xe/xe_migrate.c:1953:
+						   locked */

total: 0 errors, 4 warnings, 0 checks, 52 lines checked
5be64a787cd3 drm/xe: Add GT TLB invalidation jobs
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

-:150: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kmalloc(sizeof(*job->fence)...) over kmalloc(sizeof(struct xe_gt_tlb_invalidation_fence)...)
#150: FILE: drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c:118:
+	job->fence = kmalloc(sizeof(struct xe_gt_tlb_invalidation_fence),

-:192: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#192: FILE: drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c:160:
+}
+/**

-:205: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!xa_load"
#205: FILE: drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c:173:
+		  xa_load(&job->dep.drm.dependencies, 0) == NULL);

-:245: WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#245: FILE: drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c:213:
+		dma_fence_get(fence);	/* ref released once dependency
+					   processed by scheduler */

-:245: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#245: FILE: drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c:213:
+					   processed by scheduler */

total: 0 errors, 3 warnings, 3 checks, 315 lines checked
385d724a2320 drm/xe: Use GT TLB invalidation jobs in PT layer
-:198: WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#198: FILE: drivers/gpu/drm/xe/xe_pt.c:2369:
+			err = PTR_ERR(ijob);;

total: 0 errors, 1 warnings, 0 checks, 313 lines checked


