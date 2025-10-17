Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B41CCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 13:55:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8E310EC3C;
	Fri, 17 Oct 2025 13:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gC0D+rXk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD1810EC3D
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 13:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760709315; x=1792245315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Evig7sa4HMZok+qcEW6BPw9HLOPjSBLs7PRKKpxR1EI=;
 b=gC0D+rXkjO2ssq0GslSJl1ZS/G3UWYT2c3PqiQzSe2RCCAnBZGhISrTR
 1hqutpHSY5M2nfBhEy53TYLbv5hepM/r2K4FD5Kl8+gLuI3QcHgbitoPY
 gTDqLii9YRQExqsguNcB5IhsUKPNvGxbkViIaanenkG4TfxiiabYKQ3mL
 VVf51QvCPVdNxG81VhF2PE8R+tXzVQUhSk7NoNJC15KwYCqi9cMJVNQiM
 k5NU7qxOB2TDfCYkN/vaOb8m2JKZdcRvxPzDO5jfEdW00EJwFYYV1+0NF
 4nyNTuAfnOJ9p8TjQF+ArKpN52W7/RCncY6+6MCx97sdyiekqgVcfiesR g==;
X-CSE-ConnectionGUID: LNtWwQghRQSzwMWWw2RJYQ==
X-CSE-MsgGUID: lw+pHFAOTQWZR4TSkMkG0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="80549760"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="80549760"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 06:55:15 -0700
X-CSE-ConnectionGUID: OKJRB1PtR067usa9JVzqaA==
X-CSE-MsgGUID: JwguC3qxRw68UJIf7nOoZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="213338063"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa002.jf.intel.com with ESMTP; 17 Oct 2025 06:55:14 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v7 3/3] drm/xe/vf: Clear CCS read/write buffers in atomic way
Date: Fri, 17 Oct 2025 19:42:30 +0530
Message-ID: <20251017141226.924-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
References: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
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
index 88634a26ebf5..8d9d79018555 100644
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
  * VF KMD registers two specialized LRCs with the GuC to handle save/restore
  * operations for CCS metadata on IGPU. The GuC executes these LRCAs during
@@ -767,6 +804,18 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
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
 static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
 		      u64 src_ofs, u64 dst_ofs, unsigned int size,
@@ -1098,6 +1147,19 @@ static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 fl
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
@@ -1222,6 +1284,78 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
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
index 790249801364..2d3728cb24ca 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -387,6 +387,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+	struct xe_tile *tile;
 	struct xe_bb *bb;
 
 	xe_assert(xe, IS_VF_CCS_READY(xe));
@@ -394,12 +395,14 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
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

