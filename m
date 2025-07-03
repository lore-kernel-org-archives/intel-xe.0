Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D812C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 00:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B87F10E0E0;
	Thu,  3 Jul 2025 00:45:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268C810E0E0;
 Thu,  3 Jul 2025 00:45:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_DRM_scheduler_for_del?=
 =?utf-8?q?ayed_GT_TLB_invalidations_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Jul 2025 00:45:17 -0000
Message-ID: <175150351715.130138.6951358130807940223@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250702234222.3278264-1-matthew.brost@intel.com>
In-Reply-To: <20250702234222.3278264-1-matthew.brost@intel.com>
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

Series: Use DRM scheduler for delayed GT TLB invalidations (rev2)
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
commit ab779db6c849a20cce551a3657118e501035461e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jul 2 16:42:22 2025 -0700

    drm/xe: Remove unused GT TLB invalidation trace points
    
    Remove unused GT TLB invalidation trace points after converting to used
    GT TLB invalidation jobs. Tracepoint removed were used during early
    bring up of unstable driver, with a stable driver no need to replace
    with new tracepoints.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch d04a54cd3b99001adbc4cd3305b44f9f3e658407 drm-intel
98c94bb20348 drm/xe: Explicitly mark migration queues with flag
07bd59ab265f drm/xe: Add generic dependecy jobs / scheduler
-:30: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#30: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 202 lines checked
95c78be3a531 drm: Simplify drmm_alloc_ordered_workqueue return
7da0b8367f16 drm/xe: Create ordered workqueue for GT TLB invalidation jobs
f3469f546bcc drm/xe: Add dependency scheduler for GT TLB invalidations to bind queues
b4b49a64b967 drm/xe: Add xe_migrate_job_lock/unlock helpers
7cf9477334c9 drm/xe: Add GT TLB invalidation jobs
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 312 lines checked
adb50df92929 drm/xe: Use GT TLB invalidation jobs in PT layer
ab779db6c849 drm/xe: Remove unused GT TLB invalidation trace points


