Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD95CAC5B0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 16:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6942010E241;
	Mon, 29 Sep 2025 16:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoYwPoNF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D4310E241
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 16:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759164314; x=1790700314;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6zlPHAQ4NyAJ6pbncn2ymEZ8mJW98I1f0BKaGGZwwxY=;
 b=BoYwPoNFCtAZAu+LkcHDYYgBMMsG1lPcSgRAv9c3scqk0lc8Nz7diSPc
 Cmxghkz9O4L5qc6TanV8bf5kaUFPWvW+J8kdG/vzf1fVwBi1j4JdOEUBr
 TNK2Hr2SWq+OVaUz/FbW2Q3gtifBOfZf1VNAXqnSsCr+Xp0CedAY9L+GS
 QV/U8GBfkQBn2NuEUOc2yojxbWGbhZzVjIdCYZNh6KncTT4YxY2wuQqT0
 dFX4AN3QYLaH2qgqNgGRSvV35Mggrf/qkChSYnraStqtfNpK6Erg9qaFr
 gmgkpvwRplvU/dcRfkP/klEG88PBjUWzb4TNeRWklqP2TXY1BtturOyoX w==;
X-CSE-ConnectionGUID: dSd4Q2GRRRCUd8fVJ0NBSg==
X-CSE-MsgGUID: lATTDWWVRXCHLDhyAwZW4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="78833496"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="78833496"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 09:45:13 -0700
X-CSE-ConnectionGUID: myTHzHNISfaTfLlu+Xs0wg==
X-CSE-MsgGUID: DEFWXd0iSYqFceBrgoKbew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178324580"
Received: from gsd-build.iind.intel.com ([10.190.229.175])
 by orviesa008.jf.intel.com with ESMTP; 29 Sep 2025 09:45:11 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3] drm/xe/migrate: Atomicize CCS copy command setup
Date: Mon, 29 Sep 2025 16:45:07 +0000
Message-ID: <20250929164507.2593639-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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
V2 -> V3:
- Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
- Updated emit_flush_invalidate() to use vmovdqu instruction.

V1 -> V2:
- Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
  (Auld, Matthew)
  - Fix issues reported by patchworks.
---
 drivers/gpu/drm/xe/xe_migrate.c | 92 +++++++++++++++++++++++++++------
 1 file changed, 77 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 1d667fa36cf3..a37d4cb28aac 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -5,6 +5,7 @@
 
 #include "xe_migrate.h"
 
+#include <asm/fpu/api.h>
 #include <linux/bitfield.h>
 #include <linux/sizes.h>
 
@@ -644,18 +645,64 @@ static void emit_pte(struct xe_migrate *m,
 	}
 }
 
-#define EMIT_COPY_CCS_DW 5
+/*
+ * The CCS copy command is a 5-dword sequence. If the vCPU halts during
+ * save/restore while this sequence is being issued, partial writes may trigger
+ * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
+ * write the sequence atomically.
+ */
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
+static int xe_migrate_memcpy_atomic(struct xe_gt *gt, void *dst, const void
+				     *src, u32 size)
+{
+	int instr_size = size * SZ_8;
+
+	if (IS_SRIOV_VF(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX)) {
+		if (instr_size != SZ_128 && instr_size != SZ_256) {
+			drm_dbg(&gt_to_xe(gt)->drm,
+				"Invalid size received for atomic copy %d", instr_size);
+			return -EINVAL;
+		}
+
+		memcpy_vmovdqu(dst, src, instr_size);
+	} else {
+		memcpy(dst, src, size);
+	}
+
+	return 0;
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
@@ -673,14 +720,17 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
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
+
+	if (!xe_migrate_memcpy_atomic(gt, cs, dw, sizeof(u32) * EMIT_COPY_CCS_DW))
+		cs += EMIT_COPY_CCS_DW;
 
 	bb->len = cs - bb->cs;
 }
@@ -980,16 +1030,28 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
 	return migrate->q->lrc[0];
 }
 
+/*
+ * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
+ * save/restore while this sequence is being issued, partial writes may
+ * trigger page faults when saving iGPU CCS metadata. Use
+ * xe_migrate_memcpy_atomic() to write the sequence atomically.
+ */
 static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i,
 				 u32 flags)
 {
 	struct xe_lrc *lrc = xe_exec_queue_lrc(q);
-	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
-		  MI_FLUSH_IMM_DW | flags;
-	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc)) |
-		  MI_FLUSH_DW_USE_GTT;
-	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc));
-	dw[i++] = MI_NOOP;
+	u32 tmp_dw[SZ_4] = {MI_NOOP}, j = 0;
+
+	tmp_dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
+		      MI_FLUSH_IMM_DW | flags;
+	tmp_dw[j++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc)) |
+		      MI_FLUSH_DW_USE_GTT;
+	tmp_dw[j++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc));
+	tmp_dw[j++] = MI_NOOP;
+
+	if (!xe_migrate_memcpy_atomic(q->gt, &dw[i], tmp_dw, sizeof(u32) * j))
+		i += j;
+
 	dw[i++] = MI_NOOP;
 
 	return i;
-- 
2.43.0

