Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8253BC83F26
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 19:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4413E10E2A2;
	Thu, 24 Jul 2025 19:18:30 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36B010E2A2;
 Thu, 24 Jul 2025 19:18:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_DRM_scheduler_for_del?=
 =?utf-8?q?ayed_GT_TLB_invalidations_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Jul 2025 19:18:28 -0000
Message-ID: <175338470890.188022.13472242324199150044@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250724191216.4076566-1-matthew.brost@intel.com>
In-Reply-To: <20250724191216.4076566-1-matthew.brost@intel.com>
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

Series: Use DRM scheduler for delayed GT TLB invalidations (rev4)
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
commit dd4a75466ab7368c5bd11693be7444b6c6ef0fc7
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jul 24 12:12:16 2025 -0700

    drm/xe: Remove unused GT TLB invalidation trace points
    
    Remove unused GT TLB invalidation trace points after converting to used
    GT TLB invalidation jobs. The trace points removed were used during
    early bring up of unstable driver, with a stable driver no need to
    replace with new tracepoints.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch 2fe30dbc18cd98a593fa26398fe0147381ca716a drm-intel
6e8c1d23897a drm/xe: Explicitly mark migration queues with flag
658137086527 drm/xe: Add generic dependecy jobs / scheduler
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 200 lines checked
b5ad03655820 drm/xe: Create ordered workqueue for GT TLB invalidation jobs
37b7f59718cc drm/xe: Add dependency scheduler for GT TLB invalidations to bind queues
95596ec5eee7 drm/xe: Add GT TLB invalidation jobs
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
 - Fix kernel doc in xe_gt_tlb_inval_job_alloc_dep, xe_gt_tlb_inval_job_push

-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 365 lines checked
141f2a35ef5b drm/xe: Use GT TLB invalidation jobs in PT layer
dd4a75466ab7 drm/xe: Remove unused GT TLB invalidation trace points


