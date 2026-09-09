Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B924C88E40
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECFD10F121;
	Wed,  9 Sep 2026 12:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lK2mKZOM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA32B10F114
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957738; x=1820493738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4p4NguyPEapapBvM3nJ9BoYzSAmyXMB1Gt5YAA0Bkwc=;
 b=lK2mKZOMblGMriUQ/+bMlf+MmyZQIRcQKw+klx5+517dvWBHGmbDKv+s
 yqdkzXtNrfoXT3MZXqjHcVsGFb6w+tqtCQbl3qlOHTB7eCk0x2AZLNBOR
 eRVR0zJwJCyEtGfBtXKfE/L6O5xuTi1BijURBvFEcmBayVan2NXdXeBwV
 qhEe0+9t7Cou7YUIm8pyfOA+fR4m05dx+SQ/Zm0WJMpv1KNqPpBBlFa1D
 gnjy4gm/8e6CihmnamJRwQ93e4uLBNf8wMHePn54WqZ6Wdr2xtzYauYpe
 aSVStxA826LOtIkyDkibJSTXsmLBQ5wGhnE9Z1nKG/saWW0boJXEzVbme A==;
X-CSE-ConnectionGUID: 0hFLyXGdRb68Y22G/uVD6A==
X-CSE-MsgGUID: ceEwos2WRO6ABtTXKJor8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715577"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715577"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:42:17 -0700
X-CSE-ConnectionGUID: qSEz+g9yQqqXz/LFiHLkDw==
X-CSE-MsgGUID: fm0ryviHRe69bJCYfzapyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246664"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:42:16 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 18/21] drm/xe/svm: Define access counter migration policy
Date: Wed,  9 Sep 2026 18:15:12 +0530
Message-ID: <20260909124457.1610890-41-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Access counters are a hardware mechanism that tracks how frequently a
GPU accesses a memory region. When a counter becomes hot the driver can
migrate the backing pages to device-local VRAM to improve performance.
Until now the NC (no-count) PTE bit was programmed without a clearly
defined policy for which GPU should own AC-triggered migration in a
multi-GPU system, and the SVM range setup read the range flags
inconsistently.

Define and document the policy, keyed off the VMA's madvise preferred
location, and implement it in xe_vma_supports_access_ctr():

 - Explicit preferred GPU: only that tile maps the range with NC clear,
   so only the owning GPU generates AC events and triggers migration.
   Every other tile maps with NC set and never counts accesses to it.

 - Explicit system memory (DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM): all
   tiles map with NC set; the range stays in system RAM and no
   AC-triggered migration occurs.

 - No preference (DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE, the default):
   first-touch-then-migrate-on-hot. The first GPU to fault migrates the
   range to its own local VRAM (device-side first-touch); NC is left
   clear on all tiles so a different GPU can later win the range once
   its access counter becomes hot.

For single-GPU systems with default memory attributes the behaviour is
unchanged.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c  | 10 +++++++++
 drivers/gpu/drm/xe/xe_svm.c | 42 +++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c  | 30 +++++++++++++++++++++++++-
 3 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 9000e882e51d..03a5d0e846c8 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -866,6 +866,16 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	}
 
 	if (range) {
+		/*
+		 * Always set NC (no-count) on VRAM PTEs for SVM ranges so
+		 * this GPU does not generate access counter events for memory
+		 * it is already responsible for.  Today default_vram_pte
+		 * covers only local VRAM; once UAL lands, remote-device VRAM
+		 * pages will also flow through default_vram_pte — NC remains
+		 * the right setting there too, as the owning device handles
+		 * AC for its own local memory.  Update this comment when UAL
+		 * support is added and adjust if the semantics change.
+		 */
 		xe_walk.default_vram_pte |= XE_PPGTT_PTE_NC;
 		range_flags.__flags = READ_ONCE(range->base.flags.__flags);
 		if (!range_flags.migrate_devmem)
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 75da11c3bbb2..6e0fc0c80905 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -30,6 +30,38 @@
 #define XE_PEER_PAGEMAP ((void *)0ul)
 #define XE_PEER_VM ((void *)1ul)
 
+/**
+ * DOC: SVM access counter migration policy
+ *
+ * Access counters are a hardware mechanism that tracks how frequently the GPU
+ * accesses memory regions.  When counters become hot, the kernel driver can
+ * migrate memory to device-local VRAM for better performance.  The policy
+ * governing when and where AC-triggered migration happens is as follows:
+ *
+ * 1. Explicit preferred location (set via madvise DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC):
+ *
+ *    - If the preferred location resolves to a specific GPU tile, only that
+ *      tile's PTEs have the NC (no-count) bit clear, so only that GPU generates
+ *      AC events and triggers migration.  All other GPUs map the memory with
+ *      NC set and never generate AC events for it.
+ *    - If the preferred location is system memory (DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM),
+ *      all GPUs map with NC set — no AC-triggered migration occurs.
+ *
+ * 2. No explicit preference (default — DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE or unset):
+ *
+ *    First-touch-then-migrate-on-hot policy:
+ *    - The first GPU to fault the range migrates it to that GPU's local VRAM
+ *      (device-side first-touch placement).
+ *    - NC is left clear on all tiles, so any other GPU that subsequently
+ *      accesses the range keeps counting; once its access counter becomes
+ *      hot the range is migrated to that GPU's local VRAM.
+ *    - The GPU that fires the AC event wins placement.
+ *
+ * 3. TODO: "Migrate only once hot" — skip migration on the initial GPU page
+ *    fault entirely and rely solely on AC events for first placement, avoiding
+ *    unnecessary early migrations.  Addressed by a later patch in this series.
+ */
+
 /**
  * DOC: drm_pagemap reference-counting in xe:
  *
@@ -1339,9 +1371,15 @@ static int __xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "PAGE FAULT");
 
-	if (acc_ctr_trigger && !range_flags.migrate_devmem) {
+	/*
+	 * AC-triggered setup: if the range is already in device memory a
+	 * rebind is all that's needed.  Otherwise proceed to the
+	 * migration path — with no explicit madvise preferred location, the
+	 * default first-touch-then-migrate-on-hot policy applies and we
+	 * should attempt VRAM placement for this hot range.
+	 */
+	if (acc_ctr_trigger && !range_flags.migrate_devmem)
 		goto out;
-	}
 
 	if (--migrate_try_count >= 0 &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma, dpagemap)) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5f09f446d86f..c60de5ad76c5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4880,6 +4880,17 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
  * @vma: The VMA
  * @tile: Tile with which VMA bound is associated to
  *
+ * For CPU address mirror VMAs the decision is policy-driven:
+ *
+ * - If madvise has set an explicit preferred location that resolves to a
+ *   pagemap belonging to a *different* tile, this tile should not generate
+ *   access counter events (the user declared where the memory lives).  Set
+ *   NC so AC events are suppressed.
+ * - If the preferred location is system memory (DEFAULT_SYSTEM), no GPU
+ *   should migrate via AC; suppress on all tiles.
+ * - Otherwise (no preference / DEFAULT_DEVICE) apply first-touch-then-hot
+ *   policy: enable AC so this tile can migrate the range once it becomes hot.
+ *
  * Note, access counters are not used unless enabled in LRC.
  */
 bool xe_vma_supports_access_ctr(struct xe_device *xe,
@@ -4893,7 +4904,24 @@ bool xe_vma_supports_access_ctr(struct xe_device *xe,
 		return false;
 
 	if (xe_vma_is_cpu_addr_mirror(vma)) {
-		/*TODO: Add policy based on preferred locations */
+		struct drm_pagemap *preferred = xe_vma_resolve_pagemap(vma, tile);
+
+		/*
+		 * Explicit system preference: no AC on any GPU — the user
+		 * has stated memory should remain in system RAM.
+		 */
+		if (vma->attr.preferred_loc.devmem_fd == DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM)
+			return false;
+
+		/*
+		 * Explicit device preference pointing at a *different* tile:
+		 * suppress AC on this tile so migrates only happen on the
+		 * owning GPU.
+		 */
+		if (preferred && preferred != xe_tile_local_pagemap(tile))
+			return false;
+
+		/* No preference or this tile is preferred: enable AC. */
 		return true;
 	}
 
-- 
2.43.0

