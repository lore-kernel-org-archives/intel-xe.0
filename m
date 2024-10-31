Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F47D767DF
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 15:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180D610E8D1;
	Thu, 31 Oct 2024 15:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DGSrhK4/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFDB10E40E
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 15:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730387869; x=1761923869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=me2tOjRTux+cvR3vRZ++hA/KGLIbeNVDwtUNBz4hWJE=;
 b=DGSrhK4/yXyuQ9lpZHnhgnwj5EciIkcB4l6KfcNLM6VJXUeJDdrfxMub
 aZG9mMA7QGN0uAPcf4Qh9w91blaGHIfo6YHTyecm3SyGWWvXcmyUcJUT2
 DXIa8EiigxIMarSnWFXXveJ6THiRtWv/wt44FAopj2HCWehK4KWGAUzet
 iQCFSWhhiQjqB0OjbkOIvkNRq7jO/WLxRH7s0qO6/NnkfkGdVlBhYIpOV
 L+tmZ1JGsBvn3A7c+9U1Hg0EMiX0fOgEMUA9RBXQ1wFPcpvGdvuKE9c8s
 IPpw5fJQghijFRaX3O9i5DhkSDbngFpzBxIejE2ra6ZXicD4zTzOiiQ3d g==;
X-CSE-ConnectionGUID: fAFcJmluSAuchHPpXLRaYQ==
X-CSE-MsgGUID: iZlmHjY8QW+AdF1kp5oh7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29568924"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="29568924"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:17:37 -0700
X-CSE-ConnectionGUID: tePKnIFzS4G044kCc2McPg==
X-CSE-MsgGUID: j3WosthyQhqKKFDA54Q2iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87798861"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:17:36 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.winiarski@intel.com, michal.wajdeczko@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2 1/4] drm/xe/migrate: Add function for raw copy of VRAM and
 CCS
Date: Thu, 31 Oct 2024 16:17:22 +0100
Message-Id: <20241031151725.28315-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241031151725.28315-1-lukasz.laguna@intel.com>
References: <20241031151725.28315-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
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

Introduce a new function to copy data between VRAM and sysmem objects.
It's specifically designed for raw data copies, whereas the existing
xe_migrate_copy() is tailored for eviction and restore operations,
which involves additional logic. For instance, xe_migrate_copy() skips
CCS metadata copies on Xe2 dGPUs, as it's unnecessary in eviction
scenario. However, in cases like VF migration, CCS metadata has to be
saved and restored in its raw form.

Additionally, xe_migrate_raw_vram_copy() allows copying not only entire
objects, but also chunks of data, as well as copying corresponding CCS
metadata to or from a dedicated buffer object, which are essential in
case of VF migration.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 208 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h |   5 +
 2 files changed, 213 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cfd31ae49cc1..e4770f44582d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -936,6 +936,214 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	return fence;
 }
 
+/**
+ * xe_migrate_raw_vram_copy() - Raw copy of VRAM object and corresponding CCS.
+ * @vram_bo: The VRAM buffer object.
+ * @vram_offset: The VRAM offset.
+ * @sysmem_bo: The sysmem buffer object. If copying only CCS metadata set this
+ * to NULL.
+ * @sysmem_offset: The sysmem offset.
+ * @ccs_bo: The CCS buffer object located in sysmem. If copying of CCS metadata
+ * is not needed set this to NULL.
+ * @ccs_offset: The CCS offset.
+ * @size: The size of VRAM chunk to copy.
+ * @to_sysmem: True to copy from VRAM to sysmem, false for opposite direction.
+ *
+ * Copies the content of buffer object from or to VRAM. If supported and
+ * needed, it also copies corresponding CCS metadata.
+ *
+ * Return: Pointer to a dma_fence representing the last copy batch, or
+ * an error pointer on failure. If there is a failure, any copy operation
+ * started by the function call has been synced.
+ */
+struct dma_fence *xe_migrate_raw_vram_copy(struct xe_bo *vram_bo, u64 vram_offset,
+					   struct xe_bo *sysmem_bo, u64 sysmem_offset,
+					   struct xe_bo *ccs_bo, u64 ccs_offset,
+					   u64 size, bool to_sysmem)
+{
+	struct xe_device *xe = xe_bo_device(vram_bo);
+	struct xe_tile *tile = vram_bo->tile;
+	struct xe_gt *gt = tile->primary_gt;
+	struct xe_migrate *m = tile->migrate;
+	struct dma_fence *fence = NULL;
+	struct ttm_resource *vram = vram_bo->ttm.resource, *sysmem, *ccs;
+	struct xe_res_cursor vram_it, sysmem_it, ccs_it;
+	u64 vram_L0_ofs, sysmem_L0_ofs;
+	u32 vram_L0_pt, sysmem_L0_pt;
+	u64 vram_L0, sysmem_L0;
+	bool copy_content = sysmem_bo ? true : false;
+	bool copy_ccs = ccs_bo ? true : false;
+	int pass = 0;
+	int err;
+
+	if (!copy_content && !copy_ccs)
+		return ERR_PTR(-EINVAL);
+
+	if (!IS_ALIGNED(vram_offset | sysmem_offset | ccs_offset | size, PAGE_SIZE))
+		return ERR_PTR(-EINVAL);
+
+	if (!xe_bo_is_vram(vram_bo))
+		return ERR_PTR(-EINVAL);
+
+	if (range_overflows(vram_offset, size, (u64)vram_bo->ttm.base.size))
+		return ERR_PTR(-EOVERFLOW);
+
+	if (copy_content) {
+		if (xe_bo_is_vram(sysmem_bo))
+			return ERR_PTR(-EINVAL);
+		if (range_overflows(sysmem_offset, size, (u64)sysmem_bo->ttm.base.size))
+			return ERR_PTR(-EOVERFLOW);
+	}
+
+	if (copy_ccs) {
+		if (xe_bo_is_vram(ccs_bo))
+			return ERR_PTR(-EINVAL);
+		if (!xe_device_has_flat_ccs(xe))
+			return ERR_PTR(-EOPNOTSUPP);
+		if (ccs_bo->ttm.base.size < xe_device_ccs_bytes(xe, size))
+			return ERR_PTR(-EINVAL);
+		if (range_overflows(ccs_offset, (u64)xe_device_ccs_bytes(xe, size),
+				    (u64)ccs_bo->ttm.base.size))
+			return ERR_PTR(-EOVERFLOW);
+	}
+
+	xe_res_first(vram, vram_offset, size, &vram_it);
+
+	if (copy_content) {
+		sysmem = sysmem_bo->ttm.resource;
+		xe_res_first_sg(xe_bo_sg(sysmem_bo), sysmem_offset, size, &sysmem_it);
+	}
+
+	if (copy_ccs) {
+		ccs = ccs_bo->ttm.resource;
+		xe_res_first_sg(xe_bo_sg(ccs_bo), ccs_offset, xe_device_ccs_bytes(xe, size),
+				&ccs_it);
+	}
+
+	while (size) {
+		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
+		struct xe_sched_job *job;
+		struct xe_bb *bb;
+		u32 flush_flags = 0;
+		u32 update_idx;
+		u64 ccs_ofs, ccs_size;
+		u32 ccs_pt;
+
+		bool usm = xe->info.has_usm;
+		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
+
+		vram_L0 = xe_migrate_res_sizes(m, &vram_it);
+
+		if (copy_content) {
+			sysmem_L0 = xe_migrate_res_sizes(m, &sysmem_it);
+			vram_L0 = min(vram_L0, sysmem_L0);
+		}
+
+		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, vram_L0);
+
+		batch_size += pte_update_size(m, PTE_UPDATE_FLAG_IS_VRAM, vram, &vram_it, &vram_L0,
+					      &vram_L0_ofs, &vram_L0_pt, 0, 0, avail_pts);
+		if (copy_content) {
+			batch_size += pte_update_size(m, 0, sysmem, &sysmem_it, &vram_L0,
+						      &sysmem_L0_ofs, &sysmem_L0_pt, 0, avail_pts,
+						      avail_pts);
+		}
+
+		if (copy_ccs) {
+			ccs_size = xe_device_ccs_bytes(xe, vram_L0);
+			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
+						      &ccs_pt, 0, copy_content ? 2 * avail_pts :
+						      avail_pts, avail_pts);
+			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
+		}
+
+		batch_size += copy_content ? EMIT_COPY_DW : 0;
+		batch_size += copy_ccs ? EMIT_COPY_CCS_DW : 0;
+
+		bb = xe_bb_new(gt, batch_size, usm);
+		if (IS_ERR(bb)) {
+			err = PTR_ERR(bb);
+			goto err_sync;
+		}
+
+		if (xe_migrate_allow_identity(vram_L0, &vram_it))
+			xe_res_next(&vram_it, vram_L0);
+		else
+			emit_pte(m, bb, vram_L0_pt, true, false, &vram_it, vram_L0, vram);
+
+		if (copy_content)
+			emit_pte(m, bb, sysmem_L0_pt, false, false, &sysmem_it, vram_L0, sysmem);
+
+		if (copy_ccs)
+			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, ccs);
+
+		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+		update_idx = bb->len;
+
+		if (copy_content)
+			emit_copy(gt, bb, to_sysmem ? vram_L0_ofs : sysmem_L0_ofs, to_sysmem ?
+				  sysmem_L0_ofs : vram_L0_ofs, vram_L0, XE_PAGE_SIZE);
+
+		if (copy_ccs) {
+			emit_copy_ccs(gt, bb, to_sysmem ? ccs_ofs : vram_L0_ofs, !to_sysmem,
+				      to_sysmem ? vram_L0_ofs : ccs_ofs, to_sysmem, vram_L0);
+			flush_flags = to_sysmem ? 0 : MI_FLUSH_DW_CCS;
+		}
+
+		job = xe_bb_create_migration_job(m->q, bb, xe_migrate_batch_base(m, usm),
+						 update_idx);
+		if (IS_ERR(job)) {
+			err = PTR_ERR(job);
+			goto err;
+		}
+
+		xe_sched_job_add_migrate_flush(job, flush_flags);
+		if (!fence) {
+			err = xe_sched_job_add_deps(job, vram_bo->ttm.base.resv,
+						    DMA_RESV_USAGE_BOOKKEEP);
+			if (!err && copy_content)
+				err = xe_sched_job_add_deps(job, sysmem_bo->ttm.base.resv,
+							    DMA_RESV_USAGE_BOOKKEEP);
+			if (!err && copy_ccs)
+				err = xe_sched_job_add_deps(job, ccs_bo->ttm.base.resv,
+							    DMA_RESV_USAGE_BOOKKEEP);
+			if (err)
+				goto err_job;
+		}
+
+		mutex_lock(&m->job_mutex);
+		xe_sched_job_arm(job);
+		dma_fence_put(fence);
+		fence = dma_fence_get(&job->drm.s_fence->finished);
+		xe_sched_job_push(job);
+
+		dma_fence_put(m->fence);
+		m->fence = dma_fence_get(fence);
+
+		mutex_unlock(&m->job_mutex);
+
+		xe_bb_free(bb, fence);
+		size -= vram_L0;
+		continue;
+
+err_job:
+		xe_sched_job_put(job);
+err:
+		xe_bb_free(bb, NULL);
+
+err_sync:
+		/* Sync partial copy if any. FIXME: under job_mutex? */
+		if (fence) {
+			dma_fence_wait(fence, false);
+			dma_fence_put(fence);
+		}
+
+		return ERR_PTR(err);
+	}
+
+	return fence;
+}
+
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 0109866e398a..5cdb26ba6493 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -102,6 +102,11 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct ttm_resource *dst,
 				  bool copy_only_ccs);
 
+struct dma_fence *xe_migrate_raw_vram_copy(struct xe_bo *vram_bo, u64 vram_offset,
+					   struct xe_bo *sysmem_bo, u64 sysmem_offset,
+					   struct xe_bo *ccs_bo, u64 ccs_offset,
+					   u64 size, bool to_sysmem);
+
 #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
 #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
 #define XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
-- 
2.40.0

