Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFC5C531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 23:32:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD53210E573;
	Fri, 24 Jul 2026 23:32:21 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8AD10E573;
 Fri, 24 Jul 2026 23:32:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fine_grained_fault_lockin?=
 =?utf-8?q?g=2C_threaded_prefetch=2C_storm_cache_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jul 2026 23:32:21 -0000
Message-ID: <178493594138.226316.9670442626065253420@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260724232601.1753977-1-matthew.brost@intel.com>
In-Reply-To: <20260724232601.1753977-1-matthew.brost@intel.com>
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

Series: Fine grained fault locking, threaded prefetch, storm cache (rev8)
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
commit 6127c7fa172994ce8b15dfc4b8ae8f93e86e14e8
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Jul 24 16:26:01 2026 -0700

    drm/xe: Track parallel page fault activity in GT stats
    
    Add a new GT statistic, PARALLEL_PAGEFAULT_COUNT, to record when
    multiple page fault workers are active concurrently.
    
    When a worker dequeues a fault, scan peer workers for an active
    cache entry and increment the counter if another fault is already
    in flight. This provides basic visibility into parallel fault
    handling behavior for performance analysis and tuning.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
+ /mt/dim checkpatch 03696c1dc9eabc0658baefcff8787dab48c89d93 drm-intel
0f0603b3c74b drm/xe: Fine grained page fault locking
-:609: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#609: FILE: drivers/gpu/drm/xe/xe_svm.h:253:
+	struct mutex lock;

total: 0 errors, 0 warnings, 1 checks, 935 lines checked
642cbbc4d719 drm/xe: Allow prefetch-only VM bind IOCTLs to use VM read lock
c7aa31bd85b5 drm/xe: Thread prefetch of SVM ranges
-:47: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#47: 
Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>

total: 0 errors, 1 warnings, 0 checks, 356 lines checked
9c9b2f274ffe drm/xe: Use a single page-fault queue with multiple workers
0f3c5ada6164 drm/xe: Add num_pf_work modparam
e456d7cdceab drm/xe: Engine class and instance into a u8
ef9ac1c6a6fb drm/xe: Track pagefault worker runtime
ac0b4177ea0b drm/xe: Chain page faults via queue-resident cache to avoid fault storms
-:41: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#41: 
Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>

-:443: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#443: FILE: drivers/gpu/drm/xe/xe_pagefault.c:598:
+				xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);

-:485: CHECK:LINE_SPACING: Please don't use multiple blank lines
#485: FILE: drivers/gpu/drm/xe/xe_pagefault.c:639:
+
+

total: 0 errors, 2 warnings, 1 checks, 806 lines checked
4e6703849361 drm/xe: Add pagefault chaining stats
-:112: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#112: FILE: drivers/gpu/drm/xe/xe_pagefault.c:857:
+							 XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT,

total: 0 errors, 1 warnings, 0 checks, 84 lines checked
b50ac559ad31 drm/xe: Add debugfs pagefault_info
8e8d86f2c0d3 drm/xe: batch CT pagefault acks with periodic flush
6127c7fa1729 drm/xe: Track parallel page fault activity in GT stats


