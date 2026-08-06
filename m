Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968FBC56205
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 18:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C69810E35A;
	Thu,  6 Aug 2026 18:58:53 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CC910E35A;
 Thu,  6 Aug 2026 18:58:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fine_grained_fault_lockin?=
 =?utf-8?q?g=2C_threaded_prefetch=2C_storm_cache_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Aug 2026 18:58:51 -0000
Message-ID: <178604273128.26160.1235310214515397005@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260806185202.3922432-1-matthew.brost@intel.com>
In-Reply-To: <20260806185202.3922432-1-matthew.brost@intel.com>
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

Series: Fine grained fault locking, threaded prefetch, storm cache (rev9)
URL   : https://patchwork.freedesktop.org/series/162167/
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
commit 730a43d603bf58d04224ffef6a24ba3787c91175
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Aug 6 11:52:02 2026 -0700

    drm/xe: Track parallel page fault activity in GT stats
    
    Add a new GT statistic, PARALLEL_PAGEFAULT_COUNT, to record when
    multiple page fault workers are active concurrently.
    
    When a worker dequeues a fault, scan peer workers for an active
    cache entry and increment the counter if another fault is already
    in flight. This provides basic visibility into parallel fault
    handling behavior for performance analysis and tuning.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
+ /mt/dim checkpatch 315143829f142ea471e5f358dd92e2658c89ffef drm-intel
279b810701a7 drm/xe: Fine grained page fault locking
-:609: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#609: FILE: drivers/gpu/drm/xe/xe_svm.h:253:
+	struct mutex lock;

total: 0 errors, 0 warnings, 1 checks, 959 lines checked
1a5f97486015 drm/xe: Allow prefetch-only VM bind IOCTLs to use VM read lock
cee94233fa60 drm/xe: Thread prefetch of SVM ranges
b56505b21f19 drm/xe: Use a single page-fault queue with multiple workers
577714222456 drm/xe: Add num_pf_work modparam
654c79558ae8 drm/xe: Engine class and instance into a u8
8ddae696cf7e drm/xe: Track pagefault worker runtime
fe996de77b9c drm/xe: Chain page faults via queue-resident cache to avoid fault storms
-:442: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#442: FILE: drivers/gpu/drm/xe/xe_pagefault.c:598:
+				xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);

total: 0 errors, 1 warnings, 0 checks, 806 lines checked
ff5d4b2ceb75 drm/xe: Add pagefault chaining stats
-:112: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#112: FILE: drivers/gpu/drm/xe/xe_pagefault.c:857:
+							 XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT,

total: 0 errors, 1 warnings, 0 checks, 84 lines checked
5f79bc8ce14d drm/xe: Add debugfs pagefault_info
1fdca776ad48 drm/xe: batch CT pagefault acks with periodic flush
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
Extend xe_guc_ct_send_locked() with a “defer-flush” mode that copies the

total: 0 errors, 1 warnings, 0 checks, 383 lines checked
730a43d603bf drm/xe: Track parallel page fault activity in GT stats


