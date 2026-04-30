Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB88FF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 10:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629CD10E0F5;
	Thu, 30 Apr 2026 10:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fwd97oD2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5FF10E0F5
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 10:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777543902; x=1809079902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JbNOQlOTNhQICDMZx152HTdk1d0RhMJQE6KADYubrgY=;
 b=Fwd97oD2BMoWcsLr7pOJi8Bsi6qa4DDZxDoqI22s2M7mgtGLks17NzOL
 Kz6NSK+ANDOKYq6uTl1PBnUeTqDpQIRLEfD/qRyi+Q5NRjfN0aD8j0Crz
 rq2LVGrP/ElTBNaN72SQdjkRpucMW/tdlN2bbPAPguKXIO972GsgKH17o
 nVn+nYrSyMRi+QsEoHQTfZFA5vPrSVB5GAEWeZTLmXi3VVU8/A5UIpls6
 etKCqcPhyT22ghVogSOBMRUONbaV/JnmvPcCdB3omal1rE2gemprzFMFE
 TC7obD7V7hzEfZu6IBfMyYcPg/ix1aQBQYCohaygpNauW/Yu4o/vjm820 g==;
X-CSE-ConnectionGUID: YcecCJ0zRM24tdvaGgtuFQ==
X-CSE-MsgGUID: G8r1b9cCTWGE0l13UHGT8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78199721"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="78199721"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:11:41 -0700
X-CSE-ConnectionGUID: 7lxWTgSNRaeozxoyveGmSA==
X-CSE-MsgGUID: xd/gi4trSreJSIJ03wZGyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="231410249"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:11:39 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v2] drm/xe/madvise: Track purgeability with BO-local counters
Date: Thu, 30 Apr 2026 15:41:30 +0530
Message-ID: <20260430101130.1365878-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

xe_bo_recompute_purgeable_state() walks all VMAs of a BO to determine
whether the BO can be made purgeable. This makes VMA create/destroy and
madvise updates O(n) in the number of mappings.

Replace the walk with BO-local counters protected by the BO dma-resv
lock:

  - vma_count tracks the number of VMAs mapping the BO.
  - willneed_count tracks active WILLNEED holders, including WILLNEED
    VMAs and active dma-buf exports for non-imported BOs.

A DONTNEED BO is promoted back to WILLNEED on a 0->1 transition of
willneed_count. A BO is demoted to DONTNEED on a 1->0 transition only
when it still has VMAs, preserving the previous behaviour where a BO
with no mappings keeps its current madvise state.

PURGED remains terminal, preserving the existing "once purged, always
purged" rule.

v2:
  - Use early return for imported BOs in all four helpers to avoid
    nesting (Matt B).
  - Group purgeability state into a purgeable sub-struct on struct
    xe_bo (Matt B).
  - Reword xe_bo_willneed_put_locked() kernel-doc to explain that a 1->0
    transition means all remaining active VMAs are DONTNEED (Matt B).

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         |   6 +-
 drivers/gpu/drm/xe/xe_bo.h         |  88 +++++++++++++++-
 drivers/gpu/drm/xe/xe_bo_types.h   |  27 ++++-
 drivers/gpu/drm/xe/xe_dma_buf.c    |  28 ++++-
 drivers/gpu/drm/xe/xe_vm.c         |   9 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 162 ++---------------------------
 drivers/gpu/drm/xe/xe_vm_madvise.h |   2 -
 7 files changed, 155 insertions(+), 167 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5ce60d161e09..eaa3a4ee9111 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -884,10 +884,10 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
 		  new_state == XE_MADV_PURGEABLE_PURGED);
 
 	/* Once purged, always purged - cannot transition out */
-	xe_assert(xe, !(bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED &&
+	xe_assert(xe, !(bo->purgeable.state == XE_MADV_PURGEABLE_PURGED &&
 			new_state != XE_MADV_PURGEABLE_PURGED));
 
-	bo->madv_purgeable = new_state;
+	bo->purgeable.state = new_state;
 	xe_bo_set_purgeable_shrinker(bo, new_state);
 }
 
@@ -2355,7 +2355,7 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 	INIT_LIST_HEAD(&bo->vram_userfault_link);
 
 	/* Initialize purge advisory state */
-	bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
+	bo->purgeable.state = XE_MADV_PURGEABLE_WILLNEED;
 
 	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 68dea7d25a6b..6340317f7d2e 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -251,7 +251,7 @@ static inline bool xe_bo_is_protected(const struct xe_bo *bo)
 static inline bool xe_bo_is_purged(struct xe_bo *bo)
 {
 	xe_bo_assert_held(bo);
-	return bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED;
+	return bo->purgeable.state == XE_MADV_PURGEABLE_PURGED;
 }
 
 /**
@@ -268,11 +268,95 @@ static inline bool xe_bo_is_purged(struct xe_bo *bo)
 static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
 {
 	xe_bo_assert_held(bo);
-	return bo->madv_purgeable == XE_MADV_PURGEABLE_DONTNEED;
+	return bo->purgeable.state == XE_MADV_PURGEABLE_DONTNEED;
 }
 
 void xe_bo_set_purgeable_state(struct xe_bo *bo, enum xe_madv_purgeable_state new_state);
 
+/**
+ * xe_bo_willneed_get_locked() - Acquire a WILLNEED holder on a BO
+ * @bo: Buffer object
+ *
+ * Increments willneed_count and, on a 0->1 transition, promotes the BO
+ * from DONTNEED to WILLNEED. PURGED is terminal and is never modified.
+ *
+ * Caller must hold the BO's dma-resv lock.
+ */
+static inline void xe_bo_willneed_get_locked(struct xe_bo *bo)
+{
+	xe_bo_assert_held(bo);
+
+	/* Imported BOs are owned externally; do not track purgeability. */
+	if (drm_gem_is_imported(&bo->ttm.base))
+		return;
+
+	if (bo->purgeable.willneed_count++ == 0 && xe_bo_madv_is_dontneed(bo))
+		xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
+}
+
+/**
+ * xe_bo_willneed_put_locked() - Release a WILLNEED holder on a BO
+ * @bo: Buffer object
+ *
+ * Decrements willneed_count and, on a 1->0 transition, marks the BO
+ * DONTNEED only if it still has VMAs (implying all active VMAs are
+ * DONTNEED). If the last VMA is being removed, preserve the current BO
+ * state to match the previous VMA-walk semantics.
+ *
+ * PURGED is terminal and the BO state is never modified.
+ *
+ * Caller must hold the BO's dma-resv lock.
+ */
+static inline void xe_bo_willneed_put_locked(struct xe_bo *bo)
+{
+	xe_bo_assert_held(bo);
+
+	if (drm_gem_is_imported(&bo->ttm.base))
+		return;
+
+	xe_assert(xe_bo_device(bo), bo->purgeable.willneed_count > 0);
+	if (--bo->purgeable.willneed_count == 0 && bo->purgeable.vma_count > 0 &&
+	    !xe_bo_is_purged(bo))
+		xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
+}
+
+/**
+ * xe_bo_vma_count_inc_locked() - Account a new VMA on a BO
+ * @bo: Buffer object
+ *
+ * Increments vma_count.
+ *
+ * Caller must hold the BO's dma-resv lock.
+ */
+static inline void xe_bo_vma_count_inc_locked(struct xe_bo *bo)
+{
+	xe_bo_assert_held(bo);
+
+	if (drm_gem_is_imported(&bo->ttm.base))
+		return;
+
+	bo->purgeable.vma_count++;
+}
+
+/**
+ * xe_bo_vma_count_dec_locked() - Account a VMA removal on a BO
+ * @bo: Buffer object
+ *
+ * Decrements vma_count.
+ *
+ * Caller must hold the BO's dma-resv lock.
+ */
+static inline void xe_bo_vma_count_dec_locked(struct xe_bo *bo)
+{
+	xe_bo_assert_held(bo);
+
+	if (drm_gem_is_imported(&bo->ttm.base))
+		return;
+
+	xe_assert(xe_bo_device(bo), bo->purgeable.vma_count > 0);
+	bo->purgeable.vma_count--;
+}
+
 static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 {
 	if (likely(bo)) {
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 9c199badd9b2..6756d7820aca 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -111,10 +111,31 @@ struct xe_bo {
 	u64 min_align;
 
 	/**
-	 * @madv_purgeable: user space advise on BO purgeability, protected
-	 * by BO's dma-resv lock.
+	 * @purgeable: Purgeability state and accounting.
+	 *
+	 * All fields are protected by the BO's dma-resv lock.
 	 */
-	u32 madv_purgeable;
+	struct {
+		/**
+		 * @purgeable.state: BO purgeability state (WILLNEED/DONTNEED/PURGED).
+		 */
+		u32 state;
+
+		/**
+		 * @purgeable.vma_count: Number of VMAs currently mapping this BO.
+		 */
+		u32 vma_count;
+
+		/**
+		 * @purgeable.willneed_count: Number of active WILLNEED holders.
+		 *
+		 * Counts WILLNEED VMAs plus active dma-buf exports for
+		 * non-imported BOs. The BO flips to DONTNEED on a 1->0
+		 * transition only when VMAs still exist; if the last VMA is
+		 * removed, the previous BO state is preserved.
+		 */
+		u32 willneed_count;
+	} purgeable;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index b9828da15897..855d32ba314d 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -193,6 +193,18 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 	return 0;
 }
 
+static void xe_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct drm_gem_object *obj = dmabuf->priv;
+	struct xe_bo *bo = gem_to_xe_bo(obj);
+
+	xe_bo_lock(bo, false);
+	xe_bo_willneed_put_locked(bo);
+	xe_bo_unlock(bo);
+
+	drm_gem_dmabuf_release(dmabuf);
+}
+
 static const struct dma_buf_ops xe_dmabuf_ops = {
 	.attach = xe_dma_buf_attach,
 	.detach = xe_dma_buf_detach,
@@ -200,7 +212,7 @@ static const struct dma_buf_ops xe_dmabuf_ops = {
 	.unpin = xe_dma_buf_unpin,
 	.map_dma_buf = xe_dma_buf_map,
 	.unmap_dma_buf = xe_dma_buf_unmap,
-	.release = drm_gem_dmabuf_release,
+	.release = xe_dma_buf_release,
 	.begin_cpu_access = xe_dma_buf_begin_cpu_access,
 	.mmap = drm_gem_dmabuf_mmap,
 	.vmap = drm_gem_dmabuf_vmap,
@@ -241,18 +253,26 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
 		ret = -EINVAL;
 		goto out_unlock;
 	}
+
+	xe_bo_willneed_get_locked(bo);
 	xe_bo_unlock(bo);
 
 	ret = ttm_bo_setup_export(&bo->ttm, &ctx);
 	if (ret)
-		return ERR_PTR(ret);
+		goto out_put;
 
 	buf = drm_gem_prime_export(obj, flags);
-	if (!IS_ERR(buf))
-		buf->ops = &xe_dmabuf_ops;
+	if (IS_ERR(buf)) {
+		ret = PTR_ERR(buf);
+		goto out_put;
+	}
 
+	buf->ops = &xe_dmabuf_ops;
 	return buf;
 
+out_put:
+	xe_bo_lock(bo, false);
+	xe_bo_willneed_put_locked(bo);
 out_unlock:
 	xe_bo_unlock(bo);
 	return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c3836f6eab35..12457173ba85 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1131,6 +1131,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		vma->gpuva.gem.offset = bo_offset_or_userptr;
 		drm_gpuva_link(&vma->gpuva, vm_bo);
 		drm_gpuvm_bo_put(vm_bo);
+
+		xe_bo_vma_count_inc_locked(bo);
+		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
+			xe_bo_willneed_get_locked(bo);
 	} else /* userptr or null */ {
 		if (!is_null && !is_cpu_addr_mirror) {
 			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
@@ -1208,7 +1212,10 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 		xe_bo_assert_held(bo);
 
 		drm_gpuva_unlink(&vma->gpuva);
-		xe_bo_recompute_purgeable_state(bo);
+
+		xe_bo_vma_count_dec_locked(bo);
+		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
+			xe_bo_willneed_put_locked(bo);
 	}
 
 	xe_vm_assert_held(vm);
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index c78906dea82b..c4fb29004195 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -185,147 +185,6 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 	}
 }
 
-/**
- * xe_bo_is_dmabuf_shared() - Check if BO is shared via dma-buf
- * @bo: Buffer object
- *
- * Prevent marking imported or exported dma-bufs as purgeable.
- * For imported BOs, Xe doesn't own the backing store and cannot
- * safely reclaim pages (exporter or other devices may still be
- * using them). For exported BOs, external devices may have active
- * mappings we cannot track.
- *
- * Return: true if BO is imported or exported, false otherwise
- */
-static bool xe_bo_is_dmabuf_shared(struct xe_bo *bo)
-{
-	struct drm_gem_object *obj = &bo->ttm.base;
-
-	/* Imported: exporter owns backing store */
-	if (drm_gem_is_imported(obj))
-		return true;
-
-	/* Exported: external devices may be accessing */
-	if (obj->dma_buf)
-		return true;
-
-	return false;
-}
-
-/**
- * enum xe_bo_vmas_purge_state - VMA purgeable state aggregation
- *
- * Distinguishes whether a BO's VMAs are all DONTNEED, have at least
- * one WILLNEED, or have no VMAs at all.
- *
- * Enum values align with XE_MADV_PURGEABLE_* states for consistency.
- */
-enum xe_bo_vmas_purge_state {
-	/** @XE_BO_VMAS_STATE_WILLNEED: At least one VMA is WILLNEED */
-	XE_BO_VMAS_STATE_WILLNEED = 0,
-	/** @XE_BO_VMAS_STATE_DONTNEED: All VMAs are DONTNEED */
-	XE_BO_VMAS_STATE_DONTNEED = 1,
-	/** @XE_BO_VMAS_STATE_NO_VMAS: BO has no VMAs */
-	XE_BO_VMAS_STATE_NO_VMAS = 2,
-};
-
-/*
- * xe_bo_recompute_purgeable_state() casts between xe_bo_vmas_purge_state and
- * xe_madv_purgeable_state. Enforce that WILLNEED=0 and DONTNEED=1 match across
- * both enums so the single-line cast is always valid.
- */
-static_assert(XE_BO_VMAS_STATE_WILLNEED == (int)XE_MADV_PURGEABLE_WILLNEED,
-	      "VMA purge state WILLNEED must equal madv purgeable WILLNEED");
-static_assert(XE_BO_VMAS_STATE_DONTNEED == (int)XE_MADV_PURGEABLE_DONTNEED,
-	      "VMA purge state DONTNEED must equal madv purgeable DONTNEED");
-
-/**
- * xe_bo_all_vmas_dontneed() - Determine BO VMA purgeable state
- * @bo: Buffer object
- *
- * Check all VMAs across all VMs to determine aggregate purgeable state.
- * Shared BOs require unanimous DONTNEED state from all mappings.
- *
- * Caller must hold BO dma-resv lock.
- *
- * Return: XE_BO_VMAS_STATE_DONTNEED if all VMAs are DONTNEED,
- *         XE_BO_VMAS_STATE_WILLNEED if at least one VMA is not DONTNEED,
- *         XE_BO_VMAS_STATE_NO_VMAS if BO has no VMAs
- */
-static enum xe_bo_vmas_purge_state xe_bo_all_vmas_dontneed(struct xe_bo *bo)
-{
-	struct drm_gpuvm_bo *vm_bo;
-	struct drm_gpuva *gpuva;
-	struct drm_gem_object *obj = &bo->ttm.base;
-	bool has_vmas = false;
-
-	xe_bo_assert_held(bo);
-
-	/* Shared dma-bufs cannot be purgeable */
-	if (xe_bo_is_dmabuf_shared(bo))
-		return XE_BO_VMAS_STATE_WILLNEED;
-
-	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
-		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
-			struct xe_vma *vma = gpuva_to_vma(gpuva);
-
-			has_vmas = true;
-
-			/* Any non-DONTNEED VMA prevents purging */
-			if (vma->attr.purgeable_state != XE_MADV_PURGEABLE_DONTNEED)
-				return XE_BO_VMAS_STATE_WILLNEED;
-		}
-	}
-
-	/*
-	 * No VMAs => preserve existing BO purgeable state.
-	 * Avoids incorrectly flipping DONTNEED -> WILLNEED when last VMA unmapped.
-	 */
-	if (!has_vmas)
-		return XE_BO_VMAS_STATE_NO_VMAS;
-
-	return XE_BO_VMAS_STATE_DONTNEED;
-}
-
-/**
- * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state from VMAs
- * @bo: Buffer object
- *
- * Walk all VMAs to determine if BO should be purgeable or not.
- * Shared BOs require unanimous DONTNEED state from all mappings.
- * If the BO has no VMAs the existing state is preserved.
- *
- * Locking: Caller must hold BO dma-resv lock. When iterating GPUVM lists,
- * VM lock must also be held (write) to prevent concurrent VMA modifications.
- * This is satisfied at both call sites:
- * - xe_vma_destroy(): holds vm->lock write
- * - madvise_purgeable(): holds vm->lock write (from madvise ioctl path)
- *
- * Return: nothing
- */
-void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
-{
-	enum xe_bo_vmas_purge_state vma_state;
-
-	if (!bo)
-		return;
-
-	xe_bo_assert_held(bo);
-
-	/*
-	 * Once purged, always purged. Cannot transition back to WILLNEED.
-	 * This matches i915 semantics where purged BOs are permanently invalid.
-	 */
-	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
-		return;
-
-	vma_state = xe_bo_all_vmas_dontneed(bo);
-
-	if (vma_state != (enum xe_bo_vmas_purge_state)bo->madv_purgeable &&
-	    vma_state != XE_BO_VMAS_STATE_NO_VMAS)
-		xe_bo_set_purgeable_state(bo, (enum xe_madv_purgeable_state)vma_state);
-}
-
 /**
  * madvise_purgeable - Handle purgeable buffer object advice
  * @xe: XE device
@@ -359,12 +218,6 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
 		/* BO must be locked before modifying madv state */
 		xe_bo_assert_held(bo);
 
-		/* Skip shared dma-bufs - no PTEs to zap */
-		if (xe_bo_is_dmabuf_shared(bo)) {
-			vmas[i]->skip_invalidation = true;
-			continue;
-		}
-
 		/*
 		 * Once purged, always purged. Cannot transition back to WILLNEED.
 		 * This matches i915 semantics where purged BOs are permanently invalid.
@@ -377,13 +230,14 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
 
 		switch (op->purge_state_val.val) {
 		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
-			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
 			vmas[i]->skip_invalidation = true;
-
-			xe_bo_recompute_purgeable_state(bo);
+			/* Only act on a real DONTNEED -> WILLNEED transition. */
+			if (vmas[i]->attr.purgeable_state == XE_MADV_PURGEABLE_DONTNEED) {
+				vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
+				xe_bo_willneed_get_locked(bo);
+			}
 			break;
 		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
-			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
 			/*
 			 * Don't zap PTEs at DONTNEED time -- pages are still
 			 * alive. The zap happens in xe_bo_move_notify() right
@@ -391,7 +245,11 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
 			 */
 			vmas[i]->skip_invalidation = true;
 
-			xe_bo_recompute_purgeable_state(bo);
+			/* Only act on a real WILLNEED -> DONTNEED transition. */
+			if (vmas[i]->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED) {
+				vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
+				xe_bo_willneed_put_locked(bo);
+			}
 			break;
 		default:
 			/* Should never hit - values validated in madvise_args_are_sane() */
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
index 39acd2689ca0..a3078f634c7e 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.h
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
@@ -13,6 +13,4 @@ struct xe_bo;
 int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 
-void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
-
 #endif
-- 
2.43.0

