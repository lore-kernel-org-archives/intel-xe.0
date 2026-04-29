Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8194FF8864
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 08:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8387E10E071;
	Wed, 29 Apr 2026 08:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EtxsT4ZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D8D10E071
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 08:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777452765; x=1808988765;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SyT6OUG2bPAW1CxMlSWScHDKV8Pwp5XHaMX4+KxErxg=;
 b=EtxsT4ZB0hD2MwVYNs1p+IOY9t4sObb2pFdISjRsHVevuAKXGZk6MAWt
 aqgEap3mi7U5b3VzvvbGoKfBjPE5nrgmdCNichSfa1C0yfg4qDLckLMhO
 ORDtFc70rGyo2alXxYufJPDb+te0zagOF0t8qlhnJIQSolC+ri9hQlWD9
 g/PG/5TjsThThliC0lWO+o6756sBjAPVC0SYAWD2VnjhJHm32NXg0Xk35
 paOd6mdPwNatzWW20PS+9PrmlUfaZ0B0MoxxQkKCw2F8dljCjc2Odyk5d
 pOxN8zDmVHtKp56XtclQk+dwTzlpFWhycJISAe04BPomdIOyKxKj/MGp3 w==;
X-CSE-ConnectionGUID: gWTcA0oRRfSWOoMUU7pvcQ==
X-CSE-MsgGUID: hFCycwMmSYqyq7sWJ15/OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="80951475"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="80951475"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 01:52:44 -0700
X-CSE-ConnectionGUID: 3ycY5pnIQ7e23RqIATIVSw==
X-CSE-MsgGUID: 9ABnzVYQTJmiTj6r42aKTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="229623400"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 01:52:32 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, tejas.upadhyay@intel.com
Subject: [PATCH] drm/xe/madvise: Track purgeability with BO-local counters
Date: Wed, 29 Apr 2026 14:22:14 +0530
Message-ID: <20260429085214.1203334-1-arvind.yadav@intel.com>
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

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h         |  77 ++++++++++++++
 drivers/gpu/drm/xe/xe_bo_types.h   |  17 +++
 drivers/gpu/drm/xe/xe_dma_buf.c    |  28 ++++-
 drivers/gpu/drm/xe/xe_vm.c         |   9 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 162 ++---------------------------
 drivers/gpu/drm/xe/xe_vm_madvise.h |   2 -
 6 files changed, 136 insertions(+), 159 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 68dea7d25a6b..6fec80cac683 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -273,6 +273,83 @@ static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
 
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
+	/* Imported BOs are owned externally; do not track purgeability. */
+	if (!drm_gem_is_imported(&bo->ttm.base)) {
+		if (bo->willneed_count++ == 0 &&
+		    xe_bo_madv_is_dontneed(bo))
+			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
+	}
+}
+
+/**
+ * xe_bo_willneed_put_locked() - Release a WILLNEED holder on a BO
+ * @bo: Buffer object
+ *
+ * Decrements willneed_count and, on a 1->0 transition, marks the BO
+ * DONTNEED only if it still has VMAs. If the last VMA is being removed,
+ * preserve the current BO state to match the previous VMA-walk semantics.
+ *
+ * PURGED is terminal and the BO state is never modified.
+ *
+ * Caller must hold the BO's dma-resv lock.
+ */
+static inline void xe_bo_willneed_put_locked(struct xe_bo *bo)
+{
+	xe_bo_assert_held(bo);
+	if (!drm_gem_is_imported(&bo->ttm.base)) {
+		xe_assert(xe_bo_device(bo), bo->willneed_count > 0);
+		if (--bo->willneed_count == 0 && bo->vma_count > 0 &&
+		    !xe_bo_is_purged(bo))
+			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
+	}
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
+	if (!drm_gem_is_imported(&bo->ttm.base))
+		bo->vma_count++;
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
+	if (!drm_gem_is_imported(&bo->ttm.base)) {
+		xe_assert(xe_bo_device(bo), bo->vma_count > 0);
+		bo->vma_count--;
+	}
+}
+
 static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 {
 	if (likely(bo)) {
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 9c199badd9b2..5d389396f3aa 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -115,6 +115,23 @@ struct xe_bo {
 	 * by BO's dma-resv lock.
 	 */
 	u32 madv_purgeable;
+
+	/**
+	 * @vma_count: Number of VMAs currently mapping this BO.
+	 *
+	 * Protected by the BO dma-resv lock.
+	 */
+	u32 vma_count;
+
+	/**
+	 * @willneed_count: Number of active WILLNEED holders.
+	 *
+	 * Protected by the BO dma-resv lock. Counts WILLNEED VMAs plus active
+	 * dma-buf exports for non-imported BOs. The BO flips to DONTNEED on a
+	 * 1->0 transition only when VMAs still exist; if the last VMA is
+	 * removed, the previous BO state is preserved.
+	 */
+	u32 willneed_count;
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

