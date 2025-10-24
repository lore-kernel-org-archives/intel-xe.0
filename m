Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31896CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 13:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA06110EA8B;
	Fri, 24 Oct 2025 13:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOCXcFUU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C555110EA8B
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761311974; x=1792847974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Baiu+z9TlwuOxuN254ZB+xBvdnqtObk3cJjFbMyiPYk=;
 b=bOCXcFUUwIjv9MhUEoxz5H6rnr8sNyQz9rH2zPc9r4gcYvbqRszxY9Gz
 pXThmUOLtbz2OPxeDnn0YgFuSh7NQqjhIhNgoa90ZWgaX79b63IF6nL0Y
 B1Xqvz7U1bOJSTwe8XpYR8zbzSeLaEXj4VkOH4fmVPHkdkMm73NUN+DAi
 4mQiBpdKOwHcPHU8Nux0YabCwaAfs6nBAlwxtLhpXOvuQvoDNoLnhFKr0
 701ie4HXyllz7wVQbZj2FJ23MxqRZvEPJPxxVFSdj+9BNHCQOuwyt9TUA
 r2RR6E5yrYwPPWDRQwrnNqFUr1GzfgVhCFr5/RzEqCo/M6lBvPIJu3TOe w==;
X-CSE-ConnectionGUID: M+RQmt2oQU2ahqHek3w2KQ==
X-CSE-MsgGUID: BYYVMGFwSEGl1SKAxWvnmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74613299"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="74613299"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 06:19:34 -0700
X-CSE-ConnectionGUID: 3g7VQm9DS02pF0f5I6opCA==
X-CSE-MsgGUID: CyRvjU9uRN+mgm/SQshcOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="185200735"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2025 06:19:31 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v8 3/3] drm/xe/vf: Clear CCS read/write buffers in atomic way
Date: Fri, 24 Oct 2025 19:05:26 +0530
Message-ID: <20251024133522.16970-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024133522.16970-5-satyanarayana.k.v.p@intel.com>
References: <20251024133522.16970-5-satyanarayana.k.v.p@intel.com>
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

Clear the contents of the CCS read/write batch buffer, ensuring no page
faults / GPU hang occur if migration happens midway.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

---
V7 -> V8:
- None.

V6 -> V7:
- None.

V5 -> V6:
- Used xe_gt_assert() instead of xe_assert() (Matt B).

V4 -> V5:
- Fixed review comments (Matt B).

V3 -> V4:
- New commit added.

V2 -> V3:
- None

V1 -> V2:
- None
---
 drivers/gpu/drm/xe/xe_migrate.c      | 134 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h      |   3 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |   5 +-
 3 files changed, 141 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index b5d36073194d..f171ea27bf84 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -668,6 +668,43 @@ static void emit_pte(struct xe_migrate *m,
 	}
 }
 
+static void emit_pte_clear(struct xe_gt *gt, struct xe_bb *bb, int start_offset,
+			   int end_offset)
+{
+	u32 dw_nop[SZ_2] = {MI_NOOP};
+	int i = start_offset;
+	int len = end_offset;
+	u32 *cs = bb->cs;
+
+	/* Reverses the operations performed by emit_pte() */
+	while (i < len) {
+		u32 dwords, qwords;
+
+		xe_gt_assert(gt, (REG_FIELD_GET(REG_GENMASK(31, 23), cs[i]) == 0x20));
+
+		qwords = REG_FIELD_GET(MI_SDI_LEN_DW, cs[i]);
+		/*
+		 * If Store QW is enabled, then the value of the dwlengh
+		 * includes the header, address and multiple QW pairs of data
+		 * which means the values will be limited to odd values starting
+		 * at a value of 3(3 representing the size of a 5 DW command
+		 * including header, 2 dw address and 2 dw data).
+		 */
+		dwords = qwords - 1;
+		/*
+		 * Do not clear header first. Clear PTEs first and then clear the
+		 * header to avoid page faults.
+		 */
+		memset(&cs[i + 3], MI_NOOP, (dwords) * sizeof(u32));
+
+		xe_device_wmb(gt_to_xe(gt));
+		WRITE_ONCE(*(u64 *)&cs[i], *(u64 *)dw_nop);
+
+		cs[i + 2] = MI_NOOP;
+		i += (dwords + 3);
+	}
+}
+
 /*
  * VF KMD registers two special LRCs with the GuC to handle save/restore
  * operations for CCS metadata on IGPU. GUC executes these LRCAs during
@@ -769,6 +806,18 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 	bb->len = cs - bb->cs;
 }
 
+static u32 emit_copy_ccs_clear(struct xe_gt *gt, struct xe_bb *bb, u32 offset)
+{
+	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
+	u32 *cs = bb->cs + offset - EMIT_COPY_CCS_DW;
+
+	xe_gt_assert(gt, (REG_FIELD_GET(REG_GENMASK(31, 22), *cs) == 0x148));
+	emit_atomic(gt, cs, dw, sizeof(dw));
+	xe_device_wmb(gt_to_xe(gt));
+
+	return offset - EMIT_COPY_CCS_DW;
+}
+
 #define EMIT_COPY_DW 10
 static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 			      u64 dst_ofs, unsigned int size,
@@ -1155,6 +1204,19 @@ static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 fl
 	return i + j;
 }
 
+static u32 emit_flush_invalidate_clear(struct xe_gt *gt, struct xe_bb *bb,
+				       u32 offset)
+{
+	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP};
+	u32 *cs = bb->cs + offset - EMIT_FLUSH_INVALIDATE_DW;
+
+	xe_gt_assert(gt, (REG_FIELD_GET(REG_GENMASK(31, 23), *cs) == 0x26));
+
+	emit_atomic(gt, cs, dw, sizeof(dw));
+
+	return offset - EMIT_FLUSH_INVALIDATE_DW;
+}
+
 /**
  * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
  * @tile: Tile whose migration context to be used.
@@ -1279,6 +1341,78 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 	return err;
 }
 
+static u32 ccs_rw_pte_size(struct xe_gt *gt, struct xe_bb *bb, u32 offset)
+{
+	int len = bb->len;
+	u32 *cs = bb->cs;
+	u32 i = offset;
+
+	while (i < len) {
+		u32 dwords, qwords;
+
+		xe_gt_assert(gt, (REG_FIELD_GET(REG_GENMASK(31, 23), cs[i]) == 0x20));
+
+		qwords = REG_FIELD_GET(MI_SDI_LEN_DW, cs[i]);
+		/*
+		 * If Store QW is enabled, then the value of the dwlengh
+		 * includes the header, address and multiple QW pairs of data
+		 * which means the values will be limited to odd values starting
+		 * at a value of 3(3 representing the size of a 5 DW command
+		 * including header, 2 dw address and 2 dw data).
+		 */
+		dwords = qwords - 1;
+		i += dwords + 3;
+
+		/*
+		 * Break if the next dword is for emit_flush_invalidate_clear()
+		 * or emit_copy_ccs_clear()
+		 */
+		if ((REG_FIELD_GET(REG_GENMASK(31, 23), cs[i]) == 0x26) ||
+		    (REG_FIELD_GET(REG_GENMASK(31, 22), cs[i]) == 0x148))
+			break;
+	}
+	return i;
+}
+
+/**
+ * xe_migrate_ccs_rw_copy_clear() - Clear the CCS read/write batch buffer
+ * content.
+ * @tile: Tile whose migration context to be used.
+ * @src_bo: The buffer object @src is currently bound to.
+ * @read_write : Creates BB commands for CCS read/write.
+ *
+ * The CCS copy command has three stages: PTE setup, TLB invalidation, and CCS
+ * copy. Each stage includes a header followed by instructions. When clearing,
+ * remove the instructions first, then the header. For the TLB invalidation and
+ * CCS copy stages, ensure the writes are atomic.
+ *
+ * This reverses the operations performed by xe_migrate_ccs_rw_copy().
+ *
+ * Returns: None.
+ */
+void xe_migrate_ccs_rw_copy_clear(struct xe_tile *tile, struct xe_bo *src_bo,
+				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
+{
+	struct xe_bb *bb = src_bo->bb_ccs[read_write];
+	u32 bb_offset = 0, bb_offset_chunk = 0;
+	struct xe_gt *gt = tile->primary_gt;
+
+	while (bb_offset_chunk >= 0 && bb_offset_chunk < bb->len) {
+		bb_offset = ccs_rw_pte_size(gt, bb, bb_offset_chunk);
+		/*
+		 * After PTE entries, we have one TLB invalidation, CCS copy
+		 * command and another TLB invalidation command.
+		 */
+		bb_offset_chunk = bb_offset + EMIT_FLUSH_INVALIDATE_DW +
+				  EMIT_COPY_CCS_DW + EMIT_FLUSH_INVALIDATE_DW;
+
+		bb_offset = emit_flush_invalidate_clear(gt, bb, bb_offset_chunk);
+		bb_offset = emit_copy_ccs_clear(gt, bb, bb_offset);
+		bb_offset = emit_flush_invalidate_clear(gt, bb, bb_offset);
+		emit_pte_clear(gt, bb, bb_offset_chunk, bb_offset);
+	}
+}
+
 /**
  * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
  * @migrate: Migrate context.
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 4fad324b6253..7d3d4c5109dd 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -129,6 +129,9 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 			   struct xe_bo *src_bo,
 			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
 
+void xe_migrate_ccs_rw_copy_clear(struct xe_tile *tile, struct xe_bo *src_bo,
+				  enum xe_sriov_vf_ccs_rw_ctxs read_write);
+
 struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
 struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
 int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 797a4b866226..bda838f4d59a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -429,6 +429,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+	struct xe_tile *tile;
 	struct xe_bb *bb;
 
 	xe_assert(xe, IS_VF_CCS_READY(xe));
@@ -436,12 +437,14 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
 	if (!xe_bo_has_valid_ccs_bb(bo))
 		return 0;
 
+	tile = xe_device_get_root_tile(xe);
+
 	for_each_ccs_rw_ctx(ctx_id) {
 		bb = bo->bb_ccs[ctx_id];
 		if (!bb)
 			continue;
 
-		memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
+		xe_migrate_ccs_rw_copy_clear(tile, bo, ctx_id);
 		xe_bb_free(bb, NULL);
 		bo->bb_ccs[ctx_id] = NULL;
 	}
-- 
2.51.0

