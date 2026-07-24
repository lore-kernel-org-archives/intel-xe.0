Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D51C531CC
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 01:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE2810F287;
	Fri, 24 Jul 2026 01:17:20 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3E810F287;
 Fri, 24 Jul 2026 01:17:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fine_grained_fault_lockin?=
 =?utf-8?q?g=2C_threaded_prefetch=2C_storm_cache_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jul 2026 01:17:19 -0000
Message-ID: <178485583991.222631.16109502479085257510@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260724010947.1573757-1-matthew.brost@intel.com>
In-Reply-To: <20260724010947.1573757-1-matthew.brost@intel.com>
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

Series: Fine grained fault locking, threaded prefetch, storm cache (rev6)
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
commit f38be77e8077de6892a776f2c1bf7c75b171a615
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jul 23 18:09:47 2026 -0700

    drm/xe: Track parallel page fault activity in GT stats
    
    Add a new GT statistic, PARALLEL_PAGEFAULT_COUNT, to record when
    multiple page fault workers are active concurrently.
    
    When a worker dequeues a fault, scan peer workers for an active
    cache entry and increment the counter if another fault is already
    in flight. This provides basic visibility into parallel fault
    handling behavior for performance analysis and tuning.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
+ /mt/dim checkpatch e98d61b409afb12527aabb2c2bc9e4521a245952 drm-intel
6200f763ae13 drm/xe: Fine grained page fault locking
-:609: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#609: FILE: drivers/gpu/drm/xe/xe_svm.h:253:
+	struct mutex lock;

total: 0 errors, 0 warnings, 1 checks, 871 lines checked
7d3271d83cc8 drm/xe: Allow prefetch-only VM bind IOCTLs to use VM read lock
ea3a499566c8 drm/xe: Thread prefetch of SVM ranges
9eea3e6eed02 drm/xe: Use a single page-fault queue with multiple workers
f2f643b34864 drm/xe: Add num_pf_work modparam
d21dfca530dc drm/xe: Engine class and instance into a u8
4af5b16316e6 drm/xe: Track pagefault worker runtime
e100db1c13e2 drm/xe: Chain page faults via queue-resident cache to avoid fault storms
-:469: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#469: FILE: drivers/gpu/drm/xe/xe_pagefault.c:628:
+				xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);

total: 0 errors, 1 warnings, 0 checks, 830 lines checked
965a9a4b724c drm/xe: Add pagefault chaining stats
-:112: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#112: FILE: drivers/gpu/drm/xe/xe_pagefault.c:868:
+							 XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT,

total: 0 errors, 1 warnings, 0 checks, 84 lines checked
c8cdf84097b7 drm/xe: Add debugfs pagefault_info
2cf96e245b2e drm/xe: batch CT pagefault acks with periodic flush
f38be77e8077 drm/xe: Track parallel page fault activity in GT stats


