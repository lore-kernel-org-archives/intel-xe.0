Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED3BCD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBD5112EFA;
	Tue,  9 Apr 2024 20:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dRkYgQZk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9483C112F26
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693095; x=1744229095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QWpAiBLJBOTSczbxxZBeNyxmqsXt6Uf3H2t5PYMLtGM=;
 b=dRkYgQZkmG3Hi79KhQLewe4622bZ4KwtJYWIkmMt6bZQRg/pl+7GZhul
 a6HYUN+JYjF4ZI2DA1Sw/6GHG4Z6QO0jdNThfO9yz2xbPIVeKeg4sW3kq
 pn0u8ONuC5Avm0BI1o3+oeJE1tAPQmYlLHs5MJZRiOziioKQ4Yvtkrzbp
 1ZJLAGACbOrY6PUfuc+/ZQdDxTyPkCsK6CH3osjj653OtVefd5KheQCK+
 Ki6GJMY/kh0SCZHeBzrIs+0joaPKCshzrIXkRp0zoyAfLmKnIPRieQY7D
 x7+llm/nUuRGphdeL+BI6tmizmOC2dGQEpX0CuQ0uw3CLE5PvRs2pDezI Q==;
X-CSE-ConnectionGUID: fqM/Z+0NTsKBTQYWAvnD9Q==
X-CSE-MsgGUID: 3P5ATO8sT72XQVQ7BQdM7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803763"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803763"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: ouVFgWS1QqOT8dXzhn0A2g==
X-CSE-MsgGUID: MQMJLi2oSR67UyzmVXGfjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773775"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 21/31] drm/xe/svm: Introduce svm migration function
Date: Tue,  9 Apr 2024 16:17:32 -0400
Message-Id: <20240409201742.3042626-22-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

Introduce xe_migrate_pa function for data migration.
This function is similar to xe_migrate_copy function
but has different parameters. Instead of BO and ttm
resource parameters, it has source and destination
buffer's physical address as parameter. This function is
intended to be used by svm sub-system which doesn't
have BO and TTM concept.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 217 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h |   7 ++
 2 files changed, 224 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 82b63bdb9c47..f1d53911253b 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -462,6 +462,37 @@ static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
 	return cur->size >= size;
 }
 
+/**
+ * pte_update_cmd_size() - calculate the batch buffer command size
+ * to update a flat page table.
+ *
+ * @size: The virtual address range size of the page table to update
+ *
+ * The page table to update is supposed to be a flat 1 level page
+ * table with all entries pointing to 4k pages.
+ *
+ * Return the number of dwords of the update command
+ */
+static u32 pte_update_cmd_size(u64 size)
+{
+	u32 dword;
+	u64 entries = DIV_ROUND_UP(size, XE_PAGE_SIZE);
+
+	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
+	/*
+	 * MI_STORE_DATA_IMM command is used to update page table. Each
+	 * instruction can update maximumly 0x1ff pte entries. To update
+	 * n (n <= 0x1ff) pte entries, we need:
+	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
+	 * 2 dword for the page table's physical location
+	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
+	 */
+	dword = (1 + 2) * DIV_ROUND_UP(entries, 0x1ff);
+	dword += entries * 2;
+
+	return dword;
+}
+
 static u32 pte_update_size(struct xe_migrate *m,
 			   bool is_vram,
 			   struct ttm_resource *res,
@@ -562,6 +593,48 @@ static void emit_pte(struct xe_migrate *m,
 	}
 }
 
+/**
+ * build_pt_update_batch_sram() - build batch buffer commands to update
+ * migration vm page table for system memory
+ *
+ * @m: The migration context
+ * @bb: The batch buffer which hold the page table update commands
+ * @pt_offset: The offset of page table to update, in byte
+ * @pa: device physical address you want the page table to point to
+ * @size: size of the virtual address space you want the page table to cover
+ */
+static void build_pt_update_batch_sram(struct xe_migrate *m,
+		     struct xe_bb *bb, u32 pt_offset,
+		     u64 pa, u32 size)
+{
+	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
+	u32 ptes;
+
+	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
+	while (ptes) {
+		u32 chunk = min(0x1ffU, ptes);
+
+		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
+		bb->cs[bb->len++] = pt_offset;
+		bb->cs[bb->len++] = 0;
+
+		pt_offset += chunk * 8;
+		ptes -= chunk;
+
+		while (chunk--) {
+			u64 addr;
+
+			addr = pa & PAGE_MASK;
+			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
+								 addr, pat_index,
+								 0, false, 0);
+			bb->cs[bb->len++] = lower_32_bits(addr);
+			bb->cs[bb->len++] = upper_32_bits(addr);
+			pa += XE_PAGE_SIZE;
+		}
+	}
+}
+
 #define EMIT_COPY_CCS_DW 5
 static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 			  u64 dst_ofs, bool dst_is_indirect,
@@ -879,6 +952,150 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	return fence;
 }
 
+/**
+ * xe_migrate_pa() - Migrate buffers with src and dst physical address
+ *
+ * @m: The migration context
+ * @src_pa: physical address of source, from GPU's point of view. This is a
+ * device physical address (dpa) when source is in vram. When source is in
+ * system memory, this is a dma mapped host physical address
+ * @src_is_vram: True if source buffer is in vram.
+ * @dst_pa: physical address of destination, from GPU's point of view. This is a
+ * device physical address (dpa) when source is in vram. When source is in
+ * system memory, this is a dma mapped host physical address
+ * @dst_is_vram: True if destination buffer is in vram.
+ * @size: The size of data to copy.
+ *
+ * Copy @size bytes of data from @src_pa to @dst_pa. The functionality
+ * and behavior of this function is similar to xe_migrate_copy function, but
+ * the interface is different. This function is a helper function supposed to
+ * be used by SVM subsytem. Since in SVM subsystem there is no buffer object
+ * and ttm, there is no src/dst bo as function input. Instead, we directly use
+ * src/dst's physical address as function input.
+ *
+ * Since the back store of any user malloc'ed or mmap'ed memory can be placed in
+ * system  memory, it can not be compressed. Thus this function doesn't need
+ * to consider copy CCS (compression control surface) data as xe_migrate_copy did.
+ *
+ * This function assumes the source buffer and destination buffer are all physically
+ * contiguous.
+ *
+ * We use gpu blitter to copy data. Source and destination are first mapped to
+ * migration vm which is a flat one level (L0) page table, then blitter is used to
+ * perform the copy.
+ *
+ * Return: Pointer to a dma_fence representing the last copy batch, or
+ * an error pointer on failure. If there is a failure, any copy operation
+ * started by the function call has been synced.
+ */
+struct dma_fence *xe_migrate_pa(struct xe_migrate *m,
+				  u64 src_pa,
+				  bool src_is_vram,
+				  u64 dst_pa,
+				  bool dst_is_vram,
+				  u64 size)
+{
+#define NUM_PT_PER_BLIT (MAX_PREEMPTDISABLE_TRANSFER / SZ_2M)
+	struct xe_gt *gt = m->tile->primary_gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct dma_fence *fence = NULL;
+	u64 src_L0_ofs, dst_L0_ofs;
+	u64 round_update_size;
+	/* A slot is a 4K page of page table, covers 2M virtual address*/
+	u32 pt_slot;
+	int err;
+
+	while (size) {
+		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
+		struct xe_sched_job *job;
+		struct xe_bb *bb;
+		u32 update_idx;
+
+		/* Maximumly copy MAX_PREEMPTDISABLE_TRANSFER bytes. Why?*/
+		round_update_size = min_t(u64, size, MAX_PREEMPTDISABLE_TRANSFER);
+
+		/* src pte update*/
+		if (!src_is_vram)
+			batch_size += pte_update_cmd_size(round_update_size);
+		/* dst pte update*/
+		if (!dst_is_vram)
+			batch_size += pte_update_cmd_size(round_update_size);
+
+		/* Copy command size*/
+		batch_size += EMIT_COPY_DW;
+
+		bb = xe_bb_new(gt, batch_size, true);
+		if (IS_ERR(bb)) {
+			err = PTR_ERR(bb);
+			goto err_sync;
+		}
+
+		if (!src_is_vram) {
+			pt_slot = 0;
+			build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
+					src_pa, round_update_size);
+			src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0);
+		}
+		else
+			src_L0_ofs = xe_migrate_vram_ofs(xe, src_pa);
+
+		if (!dst_is_vram) {
+			pt_slot = NUM_PT_PER_BLIT;
+			build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
+					dst_pa, round_update_size);
+			dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0);
+		}
+		else
+			dst_L0_ofs = xe_migrate_vram_ofs(xe, dst_pa);
+
+
+		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+		update_idx = bb->len;
+
+		emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, round_update_size,
+			  XE_PAGE_SIZE);
+
+		mutex_lock(&m->job_mutex);
+		job = xe_bb_create_migration_job(m->q, bb,
+						 xe_migrate_batch_base(m, true),
+						 update_idx);
+		if (IS_ERR(job)) {
+			err = PTR_ERR(job);
+			goto err;
+		}
+
+		xe_sched_job_add_migrate_flush(job, 0);
+		xe_sched_job_arm(job);
+		dma_fence_put(fence);
+		fence = dma_fence_get(&job->drm.s_fence->finished);
+		xe_sched_job_push(job);
+		dma_fence_put(m->fence);
+		m->fence = dma_fence_get(fence);
+
+		mutex_unlock(&m->job_mutex);
+
+		xe_bb_free(bb, fence);
+		size -= round_update_size;
+		src_pa += round_update_size;
+		dst_pa += round_update_size;
+		continue;
+
+err:
+		mutex_unlock(&m->job_mutex);
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
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 701bb27349b0..98b480244265 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -101,6 +101,13 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct ttm_resource *dst,
 				  bool copy_only_ccs);
 
+struct dma_fence *xe_migrate_pa(struct xe_migrate *m,
+				  u64 src_pa,
+				  bool src_is_vram,
+				  u64 dst_pa,
+				  bool dst_is_vram,
+				  u64 size);
+
 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct xe_bo *bo,
 				   struct ttm_resource *dst);
-- 
2.26.3

