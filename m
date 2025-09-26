Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58B5CAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 13:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA59D10E073;
	Fri, 26 Sep 2025 13:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aYCg/TyP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CC510E073
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 13:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758892485; x=1790428485;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JAFFDMyvsIFEoJpVFlRaQrkzTL+3dfvBsE8F8zzqe9k=;
 b=aYCg/TyP4pYW110V2M6/eXrQXZdBR6+gsZxwYW3j9/R8FhaeXYZS5hCX
 D5jBjXdhpYJorKJ+1rC4rbHNaK1MyiFZUiV5TiSU5pas5zbHnDm29zREX
 LPXIz0ysfISP8iCSe+PuPIdawMxb6e6G+KN3vTirKFkmvwE7fTAJnrfBf
 SrGkuT4X4+Pg2qrhUug40E239H1ls7h0HDGJA+vjG5ZldiJJXPDgYGXa9
 h8XTFzMUcCBUWmyU11IQuC+CMTjE7E1iIXQmlf9txpULzp01Y2UdkANxP
 vNDXLoTQRGfXtZiIKQV+AsVc3VvYcTy/mLlSXCRkh/sVf0QQf5XaDiwol g==;
X-CSE-ConnectionGUID: 3XWqNDxFS2CStav2e1+t5g==
X-CSE-MsgGUID: UAye/dH6Shu5xKmXF7SXbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61278009"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61278009"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 06:14:45 -0700
X-CSE-ConnectionGUID: Y5Tn4DPmRbeH6tJgICY9NQ==
X-CSE-MsgGUID: u8o2aNQDR2e4S1MflNyxmw==
X-ExtLoop1: 1
Received: from gsd-build.iind.intel.com ([10.190.229.175])
 by fmviesa003.fm.intel.com with ESMTP; 26 Sep 2025 06:14:43 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2] drm/xe/migrate: Atomicize CCS copy command setup
Date: Fri, 26 Sep 2025 13:14:37 +0000
Message-ID: <20250926131437.2228555-1-satyanarayana.k.v.p@intel.com>
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

Since VMOVDQU operates on 128-bit chunks, update EMIT_COPY_CCS_DW to emit
8 dwords instead of 5 dwords.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

---
V1 -> V2:
- Use _memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
  (Auld, Matthew)
- Fix issues reported by patchworks.
---
 drivers/gpu/drm/xe/xe_migrate.c | 51 +++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e2fff2107f68..88ed4d09a97e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -5,6 +5,7 @@
 
 #include "xe_migrate.h"
 
+#include <asm/fpu/api.h>
 #include <linux/bitfield.h>
 #include <linux/sizes.h>
 
@@ -644,18 +645,39 @@ static void emit_pte(struct xe_migrate *m,
 	}
 }
 
-#define EMIT_COPY_CCS_DW 5
+#ifdef CONFIG_X86
+/*
+ * The CCS copy command is a 5-dword sequence. If the vCPU halts during
+ * save/restore while this sequence is being issued, partial writes may trigger
+ * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
+ * write the sequence atomically.
+ */
+static void memcpy_vmovdqu(void *dst, const void *src)
+{
+	kernel_fpu_begin();
+
+	asm("vmovdqu (%0), %%ymm0\n"
+	    "vmovups %%ymm0,   (%1)\n"
+	    :: "r" (src), "r" (dst) : "memory");
+
+	kernel_fpu_end();
+}
+#endif
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
@@ -673,14 +695,25 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
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
+#ifdef CONFIG_X86
+	if (IS_SRIOV_VF(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
+		memcpy_vmovdqu(cs, dw);
+	else
+		memcpy(cs, dw, sizeof(u32) * EMIT_COPY_CCS_DW);
+#else
+	memcpy(cs, dw, sizeof(u32) * EMIT_COPY_CCS_DW);
+#endif
+
+	cs += EMIT_COPY_CCS_DW;
 
 	bb->len = cs - bb->cs;
 }
-- 
2.43.0

