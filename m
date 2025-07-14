Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631ECC83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 17:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F6310E29E;
	Mon, 14 Jul 2025 17:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Te4zmvpo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA4D10E08E
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752514320; x=1784050320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PMOE03dy0LziPYZFv8F9lFXqE4ZpIJtNifxpUFYpR/4=;
 b=Te4zmvpoAcxd4ZIiVUZNsuHNHFkE6b4Heiy3kgo/Wk0yeacNqMaGvjzp
 PSAH2E2CjD5s3cDbmZgi2F71su2Yy8RszNBXW1iD13RM/QwdCsmxdGn/y
 jboxfCe5ghXluUUYy8biU5bfSVqsbvEXijijcT+MMn28ZzuOeQssjpdOY
 KJeJ23iP6WiZuSNBmYkDOMChIgSPCA0BR3KCnsdM+4jY2ciwpDC1B0c+g
 OdgjptoYVtXZUolq0RY3/lgE5rqoLbVh7VIDjA/RrRDL4OZwNB/18Ir+H
 UwSCilRSuvTy32cxNRmAwgekmiwou9ZE71a4SwsN1DtbTKdPR2ZDjso31 A==;
X-CSE-ConnectionGUID: cW9BRG7IQxe8nLwZnWiOLQ==
X-CSE-MsgGUID: ZfhAO2ttQM6PmLrKKEF1+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72167070"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="72167070"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:31:59 -0700
X-CSE-ConnectionGUID: rWamypYOSjaUUCDNJKNYbQ==
X-CSE-MsgGUID: rViybtGJRXa5HNOtuSK2wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="180689772"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:31:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.mrozek@intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 matthew.auld@intel.com
Subject: [PATCH 2/3] drm/xe: Update xe_migrate_vram to support compression
Date: Mon, 14 Jul 2025 10:33:41 -0700
Message-Id: <20250714173342.2997396-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714173342.2997396-1-matthew.brost@intel.com>
References: <20250714173342.2997396-1-matthew.brost@intel.com>
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

While SVM does not currently support compression, other users of
xe_migrate_vram (e.g., devcoredump) expect the data to be read back
uncompressed. Update xe_migrate_vram to support compressed data.

Cc: stable@vger.kernel.org
Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM support")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ba1cff2e4cda..936daa2b363d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1613,7 +1613,8 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 					 unsigned long len,
 					 unsigned long sram_offset,
 					 dma_addr_t *sram_addr, u64 vram_addr,
-					 const enum xe_migrate_copy_dir dir)
+					 const enum xe_migrate_copy_dir dir,
+					 bool needs_ccs_emit)
 {
 	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
@@ -1623,10 +1624,12 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	u64 src_L0_ofs, dst_L0_ofs;
 	struct xe_sched_job *job;
 	struct xe_bb *bb;
-	u32 update_idx, pt_slot = 0;
+	u32 update_idx, pt_slot = 0, flush_flags = 0;
 	unsigned long npages = DIV_ROUND_UP(len + sram_offset, PAGE_SIZE);
 	unsigned int pitch = len >= PAGE_SIZE && !(len & ~PAGE_MASK) ?
 		PAGE_SIZE : 4;
+	bool use_comp_pat = xe_device_has_flat_ccs(xe) &&
+		GRAPHICS_VER(xe) >= 20 && dir == XE_MIGRATE_COPY_TO_SRAM;
 	int err;
 
 	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
@@ -1637,6 +1640,8 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 
 	batch_size += pte_update_cmd_size(len);
 	batch_size += EMIT_COPY_DW;
+	if (needs_ccs_emit)
+		batch_size += EMIT_COPY_CCS_DW;
 
 	bb = xe_bb_new(gt, batch_size, use_usm_batch);
 	if (IS_ERR(bb)) {
@@ -1652,7 +1657,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 		dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
 
 	} else {
-		src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
+		src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, use_comp_pat);
 		dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
 	}
 
@@ -1661,6 +1666,17 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 
 	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, len, pitch);
 
+	if (needs_ccs_emit) {
+		if (dir == XE_MIGRATE_COPY_TO_VRAM)
+			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
+							  false, dst_L0_ofs,
+							  true, len, 0, true);
+		else
+			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
+							  true, dst_L0_ofs,
+							  false, len, 0, true);
+	}
+
 	job = xe_bb_create_migration_job(m->q, bb,
 					 xe_migrate_batch_base(m, use_usm_batch),
 					 update_idx);
@@ -1669,7 +1685,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 		goto err;
 	}
 
-	xe_sched_job_add_migrate_flush(job, 0);
+	xe_sched_job_add_migrate_flush(job, flush_flags);
 
 	mutex_lock(&m->job_mutex);
 	xe_sched_job_arm(job);
@@ -1708,7 +1724,7 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     u64 dst_addr)
 {
 	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, src_addr, dst_addr,
-			       XE_MIGRATE_COPY_TO_VRAM);
+			       XE_MIGRATE_COPY_TO_VRAM, false);
 }
 
 /**
@@ -1729,7 +1745,7 @@ struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
 				       dma_addr_t *dst_addr)
 {
 	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, dst_addr, src_addr,
-			       XE_MIGRATE_COPY_TO_SRAM);
+			       XE_MIGRATE_COPY_TO_SRAM, false);
 }
 
 static void xe_migrate_dma_unmap(struct xe_device *xe, dma_addr_t *dma_addr,
@@ -1890,7 +1906,8 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 					  dma_addr + current_page,
 					  vram_addr, write ?
 					  XE_MIGRATE_COPY_TO_VRAM :
-					  XE_MIGRATE_COPY_TO_SRAM);
+					  XE_MIGRATE_COPY_TO_SRAM,
+					  xe_bo_needs_ccs_pages(bo));
 		if (IS_ERR(__fence)) {
 			if (fence)
 				dma_fence_wait(fence, false);
-- 
2.34.1

