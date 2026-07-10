Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5507FC43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 22:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F2810E257;
	Fri, 10 Jul 2026 22:03:46 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F46810E257;
 Fri, 10 Jul 2026 22:03:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=2C_drm/xe=3A_Mini?=
 =?utf-8?q?mize_dma-resv_hold_times_and_defragment_sub-optimally_backed_BOs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Jul 2026 22:03:45 -0000
Message-ID: <178372102531.176614.5568261753489666285@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260710215442.2444235-1-matthew.brost@intel.com>
In-Reply-To: <20260710215442.2444235-1-matthew.brost@intel.com>
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

Series: drm/ttm, drm/xe: Minimize dma-resv hold times and defragment sub-optimally backed BOs
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
commit 82ab45b799f73f937cd639d94d3b08a5b7a9a0b2
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Jul 10 14:54:42 2026 -0700

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
+ /mt/dim checkpatch 6d76f5afea7406e978db1fc356a9b88d0d8989d1 drm-intel
b5ea29b79e69 drm/ttm/pool: Allow backing off reclaim at the beneficial order
40519ebbeb07 drm/ttm/pool: Add ttm_pool_page_order_nodma() helper
d11b3260013f drm/ttm: Record sub-optimal page order allocations in ttm_tt
09a182540850 drm/ttm: Introduce ttm_pool_alloc_iter for __ttm_pool_alloc()
29b9e1034781 drm/ttm: Support defragmentation moves
545efd587d6c drm/ttm: Add fault injection for beneficial-order allocation failures
6b0f9d119b29 drm/ttm: Harvest beneficial-order pages on defragmentation moves
-:296: WARNING:PREFER_FALLTHROUGH: Prefer 'fallthrough;' over fallthrough comment
#296: FILE: drivers/gpu/drm/ttm/ttm_pool.c:959:
+ * fall through to a fresh allocation, or a negative errno.

total: 0 errors, 1 warnings, 0 checks, 442 lines checked
ac53fd9106fb drm/ttm: Bound page (re)allocation per defragmentation move
c996f6eb6f33 drm/ttm: Preallocate beneficial-order defrag pages outside the lock
-:280: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#280: FILE: drivers/gpu/drm/ttm/ttm_pool.c:1104:
+	pp->count = pp->used = 0;

-:354: WARNING:PREFER_FALLTHROUGH: Prefer 'fallthrough;' over fallthrough comment
#354: FILE: drivers/gpu/drm/ttm/ttm_pool.c:1262:
+	 * reclaim/compaction). Falls through once the bag is empty.

total: 0 errors, 1 warnings, 1 checks, 451 lines checked
d8e9b4e458ba drm/ttm: Add full out-of-lock preallocation for ttm_pool_alloc()
-:313: WARNING:PREFER_FALLTHROUGH: Prefer 'fallthrough;' over fallthrough comment
#313: FILE: drivers/gpu/drm/ttm/ttm_pool.c:1439:
+	 * taking its order from the page. Falls through to in-line allocation

total: 0 errors, 1 warnings, 0 checks, 336 lines checked
b64fca16eebd drm/gpusvm: Add a DMA-mapping accounting callback
07bccbda4186 drm/xe: Add debugfs stats for DMA-mapped pages per order
13e14afb16de drm/xe: Flush L2 asynchronously in xe_bo_trigger_rebind()
db0dc1e13c44 drm/xe: Destroy page tables after unlinking all VMAs on VM close
c4a0595dcbde drm/xe: Track BOs backed at a sub-optimal page order
e1acf58015b1 drm/xe: Back off beneficial-order reclaim under defrag pressure
381ceba7708f drm/xe: Add xe_migrate_copy_defrag() for on-GPU defrag copies
97501f259e44 drm/xe: Handle defrag moves in xe_bo_move()
-:66: WARNING:PREFER_FALLTHROUGH: Prefer 'fallthrough;' over fallthrough comment
#66: FILE: drivers/gpu/drm/xe/xe_bo.c:1211:
+	 * For a defrag move the old and new tt differ, so fallthrough to the

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
926f66dda2e7 drm/xe: Skip self-copies for borrowed pages on defrag moves
8c392057c15f drm/xe: Add a page defragmentation worker
5f3a08ec2b4d drm/xe: Add defrag GT stats
73f0ef10d182 drm/xe: Add Kconfig.profile options for BO defrag configuration
ee0a08bca176 drm/xe: Defrag using out-of-lock page preallocation
0ad2ae8f7849 drm/xe: Add defrag profiling tracepoints
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
1331bb746434 drm/xe: Preallocate system BO backing outside the dma-resv lock
fb30f45f50c5 drm/xe: Add tracepoint for xe_gem_create_ioctl
-:107: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#107: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:152:
+	    TP_STRUCT__entry(

-:117: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#117: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:162:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 83 lines checked
21e477f8ed2b drm/xe: Add IOVA-based xe_res_cursor variant
c2cb5210431a drm/xe: Use IOVA-based DMA mapping for eligible tt BOs
e4d12e72dbd8 drm/xe: Add per-device dependency scheduler for IOVA defrag finalize
ebdffcf82b2f drm/xe: Add packed copy-step IOVA mapping for defrag
e0180fc409b2 drm/xe: Blit src-natural to dst-packed for defrag-IOVA copies
dd513f622f83 drm/xe: Finalize defrag-IOVA moves with post-copy job
82ab45b799f7 drm/amdgpu: Preallocate system BO pages outside the reservation lock
-:136: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 's32' over 'int32_t'
#136: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:459:
+		int32_t xcp_id = adev->gmc.mem_partitions ? fpriv->xcp_id : 0;

-:137: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 's32' over 'int32_t'
#137: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:460:
+		int32_t pool_id = amdgpu_ttm_tt_pool_id(adev, xcp_id);

total: 0 errors, 0 warnings, 2 checks, 248 lines checked


