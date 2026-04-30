Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5501ACD13DA
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 15:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22D710E428;
	Thu, 30 Apr 2026 15:29:21 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B3010E428;
 Thu, 30 Apr 2026 15:29:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_gpu/buddy=3A_replace_dual-tree/force=5Fmerge_with_decoupled?=
 =?utf-8?q?_clear_tracker?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Apr 2026 15:29:19 -0000
Message-ID: <177756295978.28203.16878392731796070372@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260430140514.1850417-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260430140514.1850417-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: series starting with [1/2] gpu/buddy: replace dual-tree/force_merge with decoupled clear tracker
URL   : https://patchwork.freedesktop.org/series/165790/
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
commit b450734aa4d629ff92d0bdbc03a3833eea253f4f
Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Date:   Thu Apr 30 19:35:14 2026 +0530

    gpu/tests/buddy: add clear-tracker allocation latency benchmarks
    
    Add gpu_test_buddy_force_merge_removal_performance test case that
    measures allocation latency before and after replacing the dual-tree/
    force_merge design with a decoupled clear tracker.
    
    The test covers three scenarios -
    
    1. Contiguous allocation after alternating clear/dirty fragmentation
       - Allocate a 4 GiB pool as 4 KiB blocks, free in alternating
         clear/dirty order to fragment every buddy pair across the two trees.
       - Attempt a single contiguous 4 GiB allocation.
       - Old dual-tree design: ~60 ms (force_merge O(N x max_order) inside alloc path).
         New clear-tracker:     ~25 ms (pool coalesced during free, O(log N) lookup).
    
    2. Repeated allocs from a fragmented pool
       - Fill a 4 GiB pool, free even-indexed blocks as cleared and odd-indexed
         as dirty so every adjacent buddy pair straddles the merge barrier.
       - Perform 16384 x 256 KiB allocations.
       - Old dual-tree design: ~79 ms (each alloc invokes force_merge).
         New clear-tracker:     ~41 ms (unconditional free-time merging, O(log N) per alloc).
    
    3. Asymmetric 3:1 clear:dirty ratio correctness check
       - Mark every 4th block dirty in a 1 GiB pool; attempt a contiguous
         1 GiB allocation.
       - Old dual-tree design: fails (merge barrier blocks coalescing).
         New clear-tracker:      ~3 ms (unconditional merging handles mixed ratios).
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Christian König <christian.koenig@amd.com>
    Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
+ /mt/dim checkpatch 3ac514cf64f272cc4d5143f4cc28fb18a8aba76d drm-intel
a09212059413 gpu/buddy: replace dual-tree/force_merge with decoupled clear tracker
-:652: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#652: FILE: drivers/gpu/buddy.c:705:
+				rb_erase_augmented(&block->rb, &mm->dirty_tree[i], &gpu_buddy_augment_cb);

-:1472: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1472: FILE: drivers/gpu/buddy.c:1678:
+			BUG_ON(!gpu_buddy_block_is_free(block));

-:1529: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1529: FILE: drivers/gpu/drm/drm_buddy.c:55:
+			BUG_ON(!gpu_buddy_block_is_free(block));

total: 0 errors, 3 warnings, 0 checks, 1528 lines checked
b450734aa4d6 gpu/tests/buddy: add clear-tracker allocation latency benchmarks
-:20: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#20: 
   - Old dual-tree design: ~60 ms (force_merge O(N x max_order) inside alloc path).

total: 0 errors, 1 warnings, 0 checks, 211 lines checked


