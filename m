Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBCCC83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 21:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653A410E70F;
	Tue, 22 Jul 2025 21:07:06 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD8810E70F;
 Tue, 22 Jul 2025 21:07:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_DRM_scheduler_for_del?=
 =?utf-8?q?ayed_GT_TLB_invalidations_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Jul 2025 21:07:05 -0000
Message-ID: <175321842571.181092.11634689973666430515@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250722202357.3718853-1-matthew.brost@intel.com>
In-Reply-To: <20250722202357.3718853-1-matthew.brost@intel.com>
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

Series: Use DRM scheduler for delayed GT TLB invalidations (rev3)
URL   : https://patchwork.freedesktop.org/series/150402/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63535c743231a7497a612c53f6edbb8a7d14412d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 39e938b9f5b6bac3926b8fb5d8f69faba5aca629
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jul 22 13:23:57 2025 -0700

    drm/xe: Remove unused GT TLB invalidation trace points
    
    Remove unused GT TLB invalidation trace points after converting to used
    GT TLB invalidation jobs. The trace points removed were used during
    early bring up of unstable driver, with a stable driver no need to
    replace with new tracepoints.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch 3af657bd50a6cefddf6b0edb2c1d8ce747dfdd8a drm-intel
5990bf4dc429 drm/xe: Explicitly mark migration queues with flag
306c512011ac drm/xe: Add generic dependecy jobs / scheduler
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 200 lines checked
925c1c92c107 drm/xe: Create ordered workqueue for GT TLB invalidation jobs
70f6020de996 drm/xe: Add dependency scheduler for GT TLB invalidations to bind queues
3e187262050e drm/xe: Add GT TLB invalidation jobs
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
 - Fix kernel doc in xe_gt_tlb_inval_job_alloc_dep, xe_gt_tlb_inval_job_push

-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 365 lines checked
cbc3822b1f84 drm/xe: Use GT TLB invalidation jobs in PT layer
39e938b9f5b6 drm/xe: Remove unused GT TLB invalidation trace points


