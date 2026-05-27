Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F87CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 14:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5953A10E0E5;
	Wed, 27 May 2026 14:30:51 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E6A10E279;
 Wed, 27 May 2026 14:30:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?4=2C1/2=5D_gpu/buddy=3A_replace_dual-tree/force=5Fmerge_with_deco?=
 =?utf-8?q?upled_clear_tracker?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 May 2026 14:30:50 -0000
Message-ID: <177989225098.15289.4963865315206958557@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260527112902.3815-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260527112902.3815-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: series starting with [v4,1/2] gpu/buddy: replace dual-tree/force_merge with decoupled clear tracker
URL   : https://patchwork.freedesktop.org/series/167369/
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
commit 4137df3a2adf1592ae3dbd4433cd0de29c7f51fd
Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Date:   Wed May 27 16:59:02 2026 +0530

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
    
    v3:
     - Pass GPU_BUDDY_CONTIGUOUS_ALLOCATION on the timed full-pool alloc so
       the benchmark actually exercises the contiguous (force_merge) path
       instead of silently falling back to smaller blocks. (sashiko)
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Christian König <christian.koenig@amd.com>
    Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
+ /mt/dim checkpatch 5390f2273d45bb259d88508828018c0fbbb79d32 drm-intel
9eba0d209827 gpu/buddy: replace dual-tree/force_merge with decoupled clear tracker
-:1732: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1732: FILE: drivers/gpu/buddy.c:1868:
+			BUG_ON(!gpu_buddy_block_is_free(block));

-:1791: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1791: FILE: drivers/gpu/drm/drm_buddy.c:56:
+			BUG_ON(!gpu_buddy_block_is_free(block));

total: 0 errors, 2 warnings, 0 checks, 1765 lines checked
4137df3a2adf gpu/tests/buddy: add clear-tracker allocation latency benchmarks


