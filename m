Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF2FCA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 18:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E3F10EFEB;
	Tue, 29 Sep 2026 18:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvMgzCYe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EE910E423
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 18:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790705430; x=1822241430;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fJeSVjfW1W8umKyEGLOIQkD3KHKT5hPBAfrci+Myb/k=;
 b=bvMgzCYeQTyAaEemBpd4kofso65SDfTcbq4A8ausTLlclnEfUm+xZOIU
 1yk8GjAHpjb6oVTQ8fbnaL3RNeORZy5REeM3xoIf1KEMUVWOcIw0BytF9
 w7VDcEV7jRWIKZkOuNCWbyt55uyQ5LpoftKiCPAdot/6tbl636I9NzlNv
 zor/xxf/KH4WoxEp0PdwUDglVRI6cXcDmZa49jUqnKGXLR9ySBKdGsXNG
 8myu1QzXpmJBKS2haUm5ZT35KQdMBShaRirPb5xfzx8hlDKYCk8GaVD3x
 /e8OkCDe1lyYt5rFMOiHgH13n18D5Rxg4atVuXcnw+8C+V1UC4bKh2Pd2 A==;
X-CSE-ConnectionGUID: 43SSuGLVRjiyj6mcFOKucQ==
X-CSE-MsgGUID: zUYJnbj5T6CkvGjb1KuAPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95247045"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="95247045"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:10:30 -0700
X-CSE-ConnectionGUID: kwba8KcfRcuSFq2zXXVsVQ==
X-CSE-MsgGUID: 6oZu4X2fSTWpHVRnnj3skg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="304949134"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:10:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe: Add xe_migrate_clear_vram
Date: Tue, 29 Sep 2026 11:10:23 -0700
Message-Id: <20260929181024.2743854-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929181024.2743854-1-matthew.brost@intel.com>
References: <20260929181024.2743854-1-matthew.brost@intel.com>
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

Add a clear which takes a device physical address and a page count
rather than a struct ttm_resource, so callers which only know the
physical extent of a VRAM range can zero it.

VRAM is reachable through the migrate identity map, so no page table
updates are required and the batch is just the clear (plus a CCS clear
on platforms which need one).

The upcoming SVM user skips the clear at allocation time and instead
clears only the ranges which are not fully overwritten by a migration.

Assisted-by: Github-Copilot:Claude-opus-5
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 89 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h |  5 ++
 2 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 0dfc54ba3b8f..04c7cb8aec68 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2371,6 +2371,95 @@ struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
 			       deps, XE_MIGRATE_COPY_TO_SRAM);
 }
 
+/**
+ * xe_migrate_clear_vram() - Clear a VRAM device physical address range
+ * @m: The migration context.
+ * @npages: Number of pages to clear.
+ * @vram_addr: Device physical address of VRAM to clear.
+ * @deps: struct dma_fence representing the dependencies that need to be
+ * signaled before the clear.
+ *
+ * Zero a physically contiguous VRAM range addressed by its device physical
+ * address rather than by a &struct ttm_resource. Used by SVM, which skips the
+ * clear at allocation time and instead clears only the ranges which are not
+ * fully overwritten by a subsequent migration.
+ *
+ * Return: dma fence for the clear to signal completion on success, ERR_PTR on
+ * failure
+ */
+struct dma_fence *xe_migrate_clear_vram(struct xe_migrate *m,
+					unsigned long npages,
+					u64 vram_addr,
+					struct dma_fence *deps)
+{
+	struct xe_gt *gt = m->tile->primary_gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	bool use_usm_batch = xe->info.has_usm;
+	unsigned long len = npages * PAGE_SIZE;
+	u32 flush_flags = 0, batch_size, update_idx;
+	struct dma_fence *fence;
+	struct xe_sched_job *job;
+	struct xe_bb *bb;
+	u64 clear_ofs;
+	int err;
+
+	xe_assert(xe, len <= MAX_PREEMPTDISABLE_TRANSFER);
+
+	batch_size = 1 + emit_clear_cmd_len(gt);
+	if (xe_migrate_needs_ccs_emit(xe))
+		batch_size += EMIT_COPY_CCS_DW;
+
+	bb = xe_bb_new(gt, batch_size, use_usm_batch);
+	if (IS_ERR(bb))
+		return ERR_CAST(bb);
+
+	clear_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
+
+	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+	update_idx = bb->len;
+
+	emit_clear(gt, bb, clear_ofs, len, XE_PAGE_SIZE, true);
+
+	if (xe_migrate_needs_ccs_emit(xe)) {
+		emit_copy_ccs(gt, bb, clear_ofs, true, m->cleared_mem_ofs,
+			      false, len);
+		flush_flags |= MI_FLUSH_DW_CCS;
+	}
+
+	job = xe_bb_create_migration_job(m->q, bb,
+					 xe_migrate_batch_base(m, use_usm_batch),
+					 update_idx);
+	if (IS_ERR(job)) {
+		err = PTR_ERR(job);
+		goto err;
+	}
+
+	xe_sched_job_add_migrate_flush(job, flush_flags);
+
+	if (deps && !dma_fence_is_signaled(deps)) {
+		dma_fence_get(deps);
+		err = drm_sched_job_add_dependency(&job->drm, deps);
+		if (err)
+			dma_fence_wait(deps, false);
+	}
+
+	mutex_lock(&m->job_mutex);
+	fence = xe_migrate_job_push(m, job);
+
+	dma_fence_put(m->fence);
+	m->fence = dma_fence_get(fence);
+	mutex_unlock(&m->job_mutex);
+
+	xe_bb_free(bb, fence);
+
+	return fence;
+
+err:
+	xe_bb_free(bb, NULL);
+
+	return ERR_PTR(err);
+}
+
 static void xe_migrate_dma_unmap(struct xe_device *xe,
 				 struct drm_pagemap_addr *pagemap_addr,
 				 int len, int write)
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 2e8be10fdb71..fc38204394f6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -49,6 +49,11 @@ struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
 				       struct drm_pagemap_addr *dst_addr,
 				       struct dma_fence *deps);
 
+struct dma_fence *xe_migrate_clear_vram(struct xe_migrate *m,
+					unsigned long npages,
+					u64 vram_addr,
+					struct dma_fence *deps);
+
 struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct xe_bo *src_bo,
 				  struct xe_bo *dst_bo,
-- 
2.34.1

