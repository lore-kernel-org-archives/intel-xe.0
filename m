Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F98CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 15:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB0310E0AC;
	Mon,  6 Oct 2025 15:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NG5Fgrej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5BC10E0AC
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 15:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759763270; x=1791299270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4m8cGyS7EbkyZw0dyLzoGNMCIu77QFxnA8JLChI82es=;
 b=NG5FgrejHKSBkBAMOIyAh3OXkPWcP8id4hUejd2iqsqZ63I1cv8bUMkO
 zfDRDhmu7JeQVGNqr1KyVLBy+3t+WX4F7etzi/XOmqtH9QRVE+XTbx2Vs
 n86nQo6gKbKf+EoCCfuGmQqRNdKw7nVHKo+iaSiTyjCY1gbtxOEEQ3ApC
 aETnzOp1Z2i0jpnVAh3eTIt+8TSRi4FvFpGuDpOpQ4Cy75reTSIcC4n5L
 t4PcM10fwiEO48zSgToapQzMm6JlerAwdU01DFBus8DO1HQE61YTXqiPG
 Te89cHM1csKOtnknjqzS3AudarEBNew6BjayZGSNIncXzymBSXj+WOfJj Q==;
X-CSE-ConnectionGUID: bGc93We1Tp6uDvyu+HhKig==
X-CSE-MsgGUID: W99BxOQhRQmqfSqbA19QAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65769450"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65769450"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 08:07:49 -0700
X-CSE-ConnectionGUID: +0ELOmx5SlqoiCP72GvHrw==
X-CSE-MsgGUID: 1rsZ0/4jTBiDkJ8gpfxeAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="216985386"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa001.jf.intel.com with ESMTP; 06 Oct 2025 08:07:47 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v4 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Date: Mon,  6 Oct 2025 20:54:45 +0530
Message-ID: <20251006152443.12269-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006152443.12269-5-satyanarayana.k.v.p@intel.com>
References: <20251006152443.12269-5-satyanarayana.k.v.p@intel.com>
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

The CCS copy command is a 5-dword sequence. If the vCPU halts during
save/restore while this sequence is being programmed, partial writes may
trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
instruction to write the sequence atomically.

Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
8 dwords instead of 5 dwords.

Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
chunks.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

---
V3 -> V4:
- Fixed review comments. (Wajdeczko)
- Fix issues reported by patchworks.

V2 -> V3:
- Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
- Updated emit_flush_invalidate() to use vmovdqu instruction.

V1 -> V2:
- Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
  (Auld, Matthew)
- Fix issues reported by patchworks.
---
 drivers/gpu/drm/xe/xe_migrate.c | 92 +++++++++++++++++++++++++--------
 1 file changed, 71 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c39c3b423d05..b960fdcecd88 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -5,7 +5,9 @@
 
 #include "xe_migrate.h"
 
+#include <asm/fpu/api.h>
 #include <linux/bitfield.h>
+#include <linux/cpufeature.h>
 #include <linux/sizes.h>
 
 #include <drm/drm_managed.h>
@@ -644,18 +646,50 @@ static void emit_pte(struct xe_migrate *m,
 	}
 }
 
-#define EMIT_COPY_CCS_DW 5
+static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
+{
+	kernel_fpu_begin();
+
+#ifdef CONFIG_X86
+	if (size == SZ_128) {
+		asm("vmovdqu (%0), %%xmm0\n"
+		    "vmovups %%xmm0,   (%1)\n"
+		    :: "r" (src), "r" (dst) : "memory");
+	} else if (size == SZ_256) {
+		asm("vmovdqu (%0), %%ymm0\n"
+		    "vmovups %%ymm0,   (%1)\n"
+		    :: "r" (src), "r" (dst) : "memory");
+	}
+#endif
+	kernel_fpu_end();
+}
+
+static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
+{
+	u32 instr_size = size * BITS_PER_BYTE;
+
+	xe_assert(gt_to_xe(gt), !(instr_size != SZ_128 && instr_size != SZ_256));
+
+	if (IS_SRIOV_VF(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
+		memcpy_vmovdqu(dst, src, instr_size);
+	else
+		memcpy(dst, src, size);
+}
+
+#define EMIT_COPY_CCS_DW 8
 static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 			  u64 dst_ofs, bool dst_is_indirect,
 			  u64 src_ofs, bool src_is_indirect,
 			  u32 size)
 {
+	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 *cs = bb->cs + bb->len;
 	u32 num_ccs_blks;
 	u32 num_pages;
 	u32 ccs_copy_size;
 	u32 mocs;
+	u32 i = 0;
 
 	if (GRAPHICS_VERx100(xe) >= 2000) {
 		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
@@ -673,15 +707,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
 	}
 
-	*cs++ = XY_CTRL_SURF_COPY_BLT |
-		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
-		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
-		ccs_copy_size;
-	*cs++ = lower_32_bits(src_ofs);
-	*cs++ = upper_32_bits(src_ofs) | mocs;
-	*cs++ = lower_32_bits(dst_ofs);
-	*cs++ = upper_32_bits(dst_ofs) | mocs;
+	dw[i++] = XY_CTRL_SURF_COPY_BLT |
+		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
+		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
+		  ccs_copy_size;
+	dw[i++] = lower_32_bits(src_ofs);
+	dw[i++] = upper_32_bits(src_ofs) | mocs;
+	dw[i++] = lower_32_bits(dst_ofs);
+	dw[i++] = upper_32_bits(dst_ofs) | mocs;
 
+	/*
+	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
+	 * save/restore while this sequence is being issued, partial writes may trigger
+	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
+	 * write the sequence atomically.
+	 */
+	emit_atomic(gt, cs, dw, sizeof(u32) * EMIT_COPY_CCS_DW);
+	cs += EMIT_COPY_CCS_DW;
 	bb->len = cs - bb->cs;
 }
 
@@ -993,18 +1035,26 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
 	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
 }
 
-static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
+/*
+ * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
+ * save/restore while this sequence is being issued, partial writes may
+ * trigger page faults when saving iGPU CCS metadata. Use
+ * emit_atomic() to write the sequence atomically.
+ */
+static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i, u32 flags)
 {
 	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
+	u32 tmp_dw[SZ_4] = {MI_NOOP}, j = 0;
+
+	tmp_dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
+		      MI_FLUSH_IMM_DW | flags;
+	tmp_dw[j++] = lower_32_bits(addr);
+	tmp_dw[j++] = upper_32_bits(addr);
+	tmp_dw[j++] = MI_NOOP;
 
-	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
-		  MI_FLUSH_IMM_DW | flags;
-	dw[i++] = lower_32_bits(addr);
-	dw[i++] = upper_32_bits(addr);
-	dw[i++] = MI_NOOP;
-	dw[i++] = MI_NOOP;
+	emit_atomic(q->gt, &dw[i], tmp_dw, sizeof(tmp_dw));
 
-	return i;
+	return i + j;
 }
 
 /**
@@ -1049,7 +1099,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 	/* Calculate Batch buffer size */
 	batch_size = 0;
 	while (size) {
-		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
+		batch_size += 8; /* Flush + ggtt addr + 1 NOP */
 		u64 ccs_ofs, ccs_size;
 		u32 ccs_pt;
 
@@ -1090,7 +1140,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 	 * sizes here again before copy command is emitted.
 	 */
 	while (size) {
-		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
+		batch_size += 8; /* Flush + ggtt addr + 1 NOP */
 		u32 flush_flags = 0;
 		u64 ccs_ofs, ccs_size;
 		u32 ccs_pt;
@@ -1113,11 +1163,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 
 		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
 
-		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
+		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
 		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
 						  src_L0_ofs, dst_is_pltt,
 						  src_L0, ccs_ofs, true);
-		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
+		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
 
 		size -= src_L0;
 	}
-- 
2.51.0

