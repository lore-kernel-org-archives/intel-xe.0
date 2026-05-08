Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FA5CD3445
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 17:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F3510F571;
	Fri,  8 May 2026 17:04:42 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24D110F569;
 Fri,  8 May 2026 17:04:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/2=5D_gpu/buddy=3A_replace_dual-tree/force=5Fmerge_with_deco?=
 =?utf-8?q?upled_clear_tracker?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 May 2026 17:04:41 -0000
Message-ID: <177825988185.52561.5548063384964470153@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260508162310.57080-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260508162310.57080-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: series starting with [v3,1/2] gpu/buddy: replace dual-tree/force_merge with decoupled clear tracker
URL   : https://patchwork.freedesktop.org/series/166232/
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
commit bccef510c67391b918105332898c1963f6580ab0
Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Date:   Fri May 8 21:53:10 2026 +0530

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
+ /mt/dim checkpatch 32e3e7a9b5d137996e6f57a4aa0c248f12db9544 drm-intel
b66910c60d12 gpu/buddy: replace dual-tree/force_merge with decoupled clear tracker
-:331: WARNING:LINE_SPACING: Missing a blank line after declarations
#331: FILE: drivers/gpu/buddy.c:258:
+			struct gpu_clear_extent *right = extent_alloc();
+			if (!right)

-:369: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#369: FILE: drivers/gpu/buddy.c:296:
+}
+/*

-:590: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#590: FILE: drivers/gpu/buddy.c:557:
+			break;
+		} else {

-:823: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#823: FILE: drivers/gpu/buddy.c:750:
+	mm->free_tree = kcalloc(mm->max_order + 1,
+				 sizeof(struct rb_root),

-:1693: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1693: FILE: drivers/gpu/buddy.c:1840:
+			BUG_ON(!gpu_buddy_block_is_free(block));

-:1752: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1752: FILE: drivers/gpu/drm/drm_buddy.c:56:
+			BUG_ON(!gpu_buddy_block_is_free(block));

total: 0 errors, 4 warnings, 2 checks, 1737 lines checked
bccef510c673 gpu/tests/buddy: add clear-tracker allocation latency benchmarks


