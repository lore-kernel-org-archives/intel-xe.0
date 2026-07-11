Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B33BC43458
	for <intel-xe@archiver.kernel.org>; Sat, 11 Jul 2026 03:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2DA10E2AF;
	Sat, 11 Jul 2026 03:05:42 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AA310E2AF;
 Sat, 11 Jul 2026 03:05:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=2C_drm/xe=3A_Mini?=
 =?utf-8?q?mize_dma-resv_hold_times_and_defragment_sub-optimally_backed_BOs_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 11 Jul 2026 03:05:41 -0000
Message-ID: <178373914130.177483.17562931379069594182@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260711025619.2540575-1-matthew.brost@intel.com>
In-Reply-To: <20260711025619.2540575-1-matthew.brost@intel.com>
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

Series: drm/ttm, drm/xe: Minimize dma-resv hold times and defragment sub-optimally backed BOs (rev2)
URL   : https://patchwork.freedesktop.org/series/170216/
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
commit 6eb65404a477a97b6ab1a1a6627e56627848a1d3
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Jul 10 19:56:19 2026 -0700

    drm/amdgpu: Preallocate system BO pages outside the reservation lock
    
    Populating a GTT (system) buffer object under the reservation lock can
    stall in reclaim and compaction while trying to satisfy beneficial-order
    allocations, holding the lock for the duration.
    
    Mirror the Xe out-of-lock preallocation for pure system BOs: when a
    gem_create request targets AMDGPU_GEM_DOMAIN_GTT only, fill the full page
    backing up front via ttm_pool_prealloc_fill_full() before taking the
    reservation lock. The populate under the lock then simply installs these
    pages instead of reclaiming and compacting in the critical section. The
    fill is best-effort - a short fill falls back to the normal in-lock
    allocation for the remaining pages, and any leftover pages are released
    by ttm_pool_prealloc_fini() on all exit paths.
    
    Unlike Xe, amdgpu has no background defragmenter, so the higher-order
    reclaim backoff is left disabled (normal reclaim). If the pool uses
    dma-alloc (swiotlb), the fill bails and the feature is a silent no-op.
    
    Factor the tt pool selection into amdgpu_ttm_tt_pool_id() and
    amdgpu_ttm_pool() so the preallocation targets the exact pool the
    populate will consume, and thread an optional prealloc bag through
    amdgpu_gem_object_create() and amdgpu_bo_param into the populate ctx.
    
    Cc: amd-gfx@lists.freedesktop.org
    Cc: Alex Deucher <alexander.deucher@amd.com>
    Cc: Carlos Santa <carlos.santa@intel.com>
    Cc: Ryan Neph <ryanneph@google.com>
    Cc: Christian Koenig <christian.koenig@amd.com>
    Cc: Huang Rui <ray.huang@amd.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Maxime Ripard <mripard@kernel.org>
    Cc: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: David Airlie <airlied@gmail.com>
    Cc: Simona Vetter <simona@ffwll.ch>
    Cc: dri-devel@lists.freedesktop.org
    Cc: linux-kernel@vger.kernel.org
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Assisted-by: GitHub_Copilot:claude-opus-4.8
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 7bb9a26014f9ba1b2cb1300252d1eeb83f169c06 drm-intel
ca5b60f2a01e drm/ttm/pool: Allow backing off reclaim at the beneficial order
82a5853bb4f8 drm/ttm/pool: Add ttm_pool_page_order_nodma() helper
32347960f287 drm/ttm: Record sub-optimal page order allocations in ttm_tt
79e3e12a7e6c drm/ttm: Introduce ttm_pool_alloc_iter for __ttm_pool_alloc()
99b4cb07cbbc drm/ttm: Support defragmentation moves
d9cd771927d9 drm/ttm: Add fault injection for beneficial-order allocation failures
a83648373640 drm/ttm: Harvest beneficial-order pages on defragmentation moves
-:311: WARNING:PREFER_FALLTHROUGH: Prefer 'fallthrough;' over fallthrough comment
#311: FILE: drivers/gpu/drm/ttm/ttm_pool.c:974:
+ * fall through to a fresh allocation, or a negative errno.

total: 0 errors, 1 warnings, 0 checks, 457 lines checked
8ed9f29c1b20 drm/ttm: Bound page (re)allocation per defragmentation move
9e54c19ebb56 drm/ttm: Preallocate beneficial-order defrag pages outside the lock
-:355: WARNING:PREFER_FALLTHROUGH: Prefer 'fallthrough;' over fallthrough comment
#355: FILE: drivers/gpu/drm/ttm/ttm_pool.c:1278:
+	 * reclaim/compaction). Falls through once the bag is empty.

total: 0 errors, 1 warnings, 0 checks, 452 lines checked
0e15cbe02f3b drm/ttm: Add full out-of-lock preallocation for ttm_pool_alloc()
-:313: WARNING:PREFER_FALLTHROUGH: Prefer 'fallthrough;' over fallthrough comment
#313: FILE: drivers/gpu/drm/ttm/ttm_pool.c:1455:
+	 * taking its order from the page. Falls through to in-line allocation

total: 0 errors, 1 warnings, 0 checks, 336 lines checked
f31c496aaaad drm/gpusvm: Add a DMA-mapping accounting callback
395e8e01f190 drm/xe: Add debugfs stats for DMA-mapped pages per order
afe121cac666 drm/xe: Flush L2 asynchronously in xe_bo_trigger_rebind()
dd394d166c5e drm/xe: Destroy page tables after unlinking all VMAs on VM close
b9ec005a2558 drm/xe: Track BOs backed at a sub-optimal page order
28e16b5385ca drm/xe: Back off beneficial-order reclaim under defrag pressure
b354fd96d207 drm/xe: Add xe_migrate_copy_defrag() for on-GPU defrag copies
fe324c71e70f drm/xe: Handle defrag moves in xe_bo_move()
-:66: WARNING:PREFER_FALLTHROUGH: Prefer 'fallthrough;' over fallthrough comment
#66: FILE: drivers/gpu/drm/xe/xe_bo.c:1217:
+	 * For a defrag move the old and new tt differ, so fallthrough to the

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
7058b4dbabda drm/xe: Skip self-copies for borrowed pages on defrag moves
dfca735205ea drm/xe: Add a page defragmentation worker
da2e92bf7288 drm/xe: Add defrag GT stats
7f74453aa6ad drm/xe: Add Kconfig.profile options for BO defrag configuration
9f95b5c35377 drm/xe: Defrag using out-of-lock page preallocation
ffab6edee52c drm/xe: Add defrag profiling tracepoints
-:124: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#124: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:92:
+	    TP_STRUCT__entry(

-:130: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#130: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:98:
+	    TP_fast_assign(

-:147: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#147: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:115:
+	    TP_STRUCT__entry(

-:159: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#159: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:127:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 4 checks, 128 lines checked
cc16137f500c drm/xe: Preallocate system BO backing outside the dma-resv lock
aa94481ff3fb drm/xe: Add tracepoint for xe_gem_create_ioctl
-:89: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#89: FILE: drivers/gpu/drm/xe/xe_bo.c:4157:
+				  div_u64(ktime_to_ns(ktime_sub(ktime_get(),
+							ioctl_start)), 1000),

-:108: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#108: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:152:
+	    TP_STRUCT__entry(

-:118: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#118: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:162:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 3 checks, 84 lines checked
471be044e3c0 drm/xe: Add IOVA-based xe_res_cursor variant
733160fb85cc drm/xe: Use IOVA-based DMA mapping for eligible tt BOs
dc6a0019172f drm/xe: Add per-device dependency scheduler for IOVA defrag finalize
1e6fd95f81a1 drm/xe: Add packed copy-step IOVA mapping for defrag
c2175a7158fc drm/xe: Blit src-natural to dst-packed for defrag-IOVA copies
bf0da55143cb drm/xe: Finalize defrag-IOVA moves with post-copy job
6eb65404a477 drm/amdgpu: Preallocate system BO pages outside the reservation lock
-:138: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 's32' over 'int32_t'
#138: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:461:
+		int32_t xcp_id = adev->gmc.mem_partitions ? fpriv->xcp_id : 0;

-:139: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 's32' over 'int32_t'
#139: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:462:
+		int32_t pool_id = amdgpu_ttm_tt_pool_id(adev, xcp_id);

total: 0 errors, 0 warnings, 2 checks, 276 lines checked


