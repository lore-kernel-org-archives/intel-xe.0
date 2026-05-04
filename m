Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21339FF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 14:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A7E10E734;
	Mon,  4 May 2026 14:48:15 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944AA10E730;
 Mon,  4 May 2026 14:48:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/2=5D_gpu/buddy=3A_replace_dual-tree/force=5Fmerge_with_deco?=
 =?utf-8?q?upled_clear_tracker?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 May 2026 14:48:14 -0000
Message-ID: <177790609460.33916.11365650228912646199@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260504111055.262964-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260504111055.262964-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: series starting with [v2,1/2] gpu/buddy: replace dual-tree/force_merge with decoupled clear tracker
URL   : https://patchwork.freedesktop.org/series/165893/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 75bd739a55c8e43ce7d9bfb7cb6acb3b014dd040
Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Date:   Mon May 4 16:40:55 2026 +0530

    gpu/tests/buddy: add clear-tracker allocation latency benchmarks
    
    Add gpu_test_buddy_clear_tracker_performance test case that measures
    allocation latency before and after replacing the dual-tree /
    force_merge design with a decoupled clear tracker.
    
    Two scenarios are covered.
    
    1. Single contiguous allocation after fragmentation. A 4 GiB pool is
       filled with 4 KiB blocks and freed in alternating clear/dirty order,
       so every buddy pair ends up split across the two trees and cannot
       coalesce at free() time. A single contiguous 4 GiB allocation then
       takes ~61 ms on the dual-tree design (the alloc path has to invoke
       __force_merge() to climb back up to max_order) and ~25 ms with the
       clear tracker (the pool is already coalesced at free() time).
    
    2. Repeated allocations from a fragmented pool. Same 4 GiB pool, freed
       with even-indexed blocks cleared and odd-indexed dirty so every
       adjacent buddy pair sits on opposite sides of the merge barrier.
       16384 x 256 KiB allocations then take ~80 ms on the dual-tree
       design (each alloc pays the __force_merge() cost) and ~39 ms with
       the clear tracker (free-time merging makes each alloc an O(log N)
       split).
    
    v2:
     - Removed unwanted sub tests
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Christian König <christian.koenig@amd.com>
    Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
+ /mt/dim checkpatch 190806bad83a94cee94343c1e937c8447046976b drm-intel
456fe204242d gpu/buddy: replace dual-tree/force_merge with decoupled clear tracker
-:319: WARNING:LINE_SPACING: Missing a blank line after declarations
#319: FILE: drivers/gpu/buddy.c:256:
+			struct gpu_clear_extent *right = extent_alloc();
+			if (!right)

-:654: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#654: FILE: drivers/gpu/buddy.c:627:
+	mm->free_tree = kcalloc(mm->max_order + 1,
+				 sizeof(struct rb_root),

-:762: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#762: FILE: drivers/gpu/buddy.c:768:
+				rb_erase_augmented(&block->rb, &mm->free_tree[i], &gpu_buddy_augment_cb);

-:1524: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1524: FILE: drivers/gpu/buddy.c:1703:
+			BUG_ON(!gpu_buddy_block_is_free(block));

-:1624: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1624: FILE: drivers/gpu/drm/drm_buddy.c:82:
+			BUG_ON(!gpu_buddy_block_is_free(block));

total: 0 errors, 4 warnings, 1 checks, 1588 lines checked
75bd739a55c8 gpu/tests/buddy: add clear-tracker allocation latency benchmarks


