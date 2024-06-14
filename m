Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8048BC2BB85
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3F410E2C0;
	Fri, 14 Jun 2024 21:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WtTnfbzu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC04310EE84
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401661; x=1749937661;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8zclo0epobdKDXZehOf+jmHGCl+wie7HhAR1+RxmTNo=;
 b=WtTnfbzuk4AWAjG06ylGKDpZYJHUAyoO0dLVPhs5RVygZBHCE6XtZLh1
 tOcjVffYGChPM839cScZGLxl2IG3S9GkqG4Rni7C/232izHySQOLRp39e
 N4FyFAeLTQFYm1iV+RvxjpY1yViyDFyZ5nY5JWDmX8RbtkwAQwUCCXkJt
 9Jbt3ABKTPZuF6RAG5V+Yu3gVh3TpUsTjTJw77fLJfG0UhSNc4xiTlJN3
 Do57mg0rIWUJo1MLyweDTBL7lBLG5r1ZsVtOwNvsJkLU9LCkeybLx+K/1
 kTWXBJbtl6ACliTkl9IAVKUZYB7oUHnWUBfecT5kM1ONxoSmhbcXVn0LI A==;
X-CSE-ConnectionGUID: z4kTgc5HTRqM+d06yxYyHA==
X-CSE-MsgGUID: T/ye/ZkNSbOLZpXpvRoEaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886608"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886608"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
X-CSE-ConnectionGUID: +xJzANqUSbCUZe0h5R0lKg==
X-CSE-MsgGUID: lbYNkA/RRqe9zMcvoxqfoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572431"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 37/44] drm/xe/svm: Add migrate layer functions for SVM support
Date: Fri, 14 Jun 2024 17:58:10 -0400
Message-Id: <20240614215817.1097633-37-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Add functions which migrate to / from VRAM accepting a single DPA
argument (VRAM) and array of dma addresses (SRAM).

FIXME: Support non-contiguous VRAM DPA. The VRAM DPA can be an
array and we can dynamically map DPAs into contiguous device
virtual address space like what we did for SRAM, and still use
one single blitter command for migration

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 126 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h |   5 ++
 2 files changed, 131 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 540afc85d289..21d2595ea065 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1451,6 +1451,132 @@ void xe_migrate_wait(struct xe_migrate *m)
 		dma_fence_wait(m->fence, false);
 }
 
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
+static void build_pt_update_batch_sram(struct xe_migrate *m,
+				       struct xe_bb *bb, u32 pt_offset,
+				       dma_addr_t *sram_addr, u32 size)
+{
+	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
+	u32 ptes;
+	int i = 0;
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
+			u64 addr = sram_addr[i++] & PAGE_MASK;
+
+			xe_tile_assert(m->tile, addr);
+			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
+								 addr, pat_index,
+								 0, false, 0);
+			bb->cs[bb->len++] = lower_32_bits(addr);
+			bb->cs[bb->len++] = upper_32_bits(addr);
+		}
+	}
+}
+
+struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
+				  unsigned long npages,
+				  dma_addr_t *sram_addr, u64 vram_addr,
+				  bool dst_vram)
+{
+	struct xe_gt *gt = m->tile->primary_gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct dma_fence *fence = NULL;
+	u32 batch_size = 2;
+	u64 src_L0_ofs, dst_L0_ofs;
+	u64 round_update_size;
+	struct xe_sched_job *job;
+	struct xe_bb *bb;
+	u32 update_idx, pt_slot = 0;
+	int err;
+
+	round_update_size = min_t(u64, npages * PAGE_SIZE,
+				  MAX_PREEMPTDISABLE_TRANSFER);
+	batch_size += pte_update_cmd_size(round_update_size);
+	batch_size += EMIT_COPY_DW;
+
+	bb = xe_bb_new(gt, batch_size, true);
+	if (IS_ERR(bb)) {
+		err = PTR_ERR(bb);
+		return ERR_PTR(err);
+	}
+
+	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
+				   sram_addr, round_update_size);
+
+	if (dst_vram) {
+		src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0);
+		dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr);
+
+	} else {
+		src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr);
+		dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0);
+	}
+
+	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+	update_idx = bb->len;
+
+	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, round_update_size,
+		  XE_PAGE_SIZE);
+
+	mutex_lock(&m->job_mutex);
+	job = xe_bb_create_migration_job(m->q, bb,
+					 xe_migrate_batch_base(m, true),
+					 update_idx);
+	if (IS_ERR(job)) {
+		err = PTR_ERR(job);
+		goto err;
+	}
+
+	xe_sched_job_add_migrate_flush(job, 0);
+	xe_sched_job_arm(job);
+	fence = dma_fence_get(&job->drm.s_fence->finished);
+	xe_sched_job_push(job);
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
+	mutex_unlock(&m->job_mutex);
+	xe_bb_free(bb, NULL);
+
+	return ERR_PTR(err);
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_migrate.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 453e0ecf5034..6313a5452de6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -115,4 +115,9 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 void xe_migrate_wait(struct xe_migrate *m);
 
 struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
+
+struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
+				  unsigned long npages,
+				  dma_addr_t *sram_addr, u64 vram_addr,
+				  bool dst_vram);
 #endif
-- 
2.26.3

