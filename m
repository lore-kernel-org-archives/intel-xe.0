Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054ECCAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 10:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DBB10E346;
	Fri, 26 Sep 2025 10:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y3RvhxBm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A265610E346
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758881900; x=1790417900;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nvMju7sgDnuLwvMPwsPKM7gsdiLEYUbLYJ+CMzQYH0I=;
 b=Y3RvhxBmN5mvSuD4fDPojBLTBV7Z/gkUD0AJ7gxW+esIUGEGX48O4am/
 DcwOP2J19dkrmOBo5jggiCrdRWy5NrGmz+P7xugZ+dDljmMo4KtK5LSDt
 eMXCK9PoJo9MoRz9+o7XHnxXNmIhT3GoJ/4u3g1OAGpZ0Sx5DTfY/iWIJ
 1X8WetGY5MWQj+3RcAyH49UtEBXWxROl9JmWq3+UOdTPby1SByk+on1Yh
 Ucp64u9jXjFbvfNJhRqgewzEjSuxLtZAAgHYZ3ctRhAcdhKkaNKjGJFJn
 OGiwhSxuQXZgupmUP7VicLmf28HR+g9TKkcr7oQPDwvF4ru4Kfb4Zfe9D A==;
X-CSE-ConnectionGUID: nNDbzSiiSYeP8M5E8BzMfg==
X-CSE-MsgGUID: vDZMwRc8R4qZSSUBP91rzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61128403"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61128403"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 03:18:20 -0700
X-CSE-ConnectionGUID: 4Ntn4cnKRbCtmCBT5oS5nw==
X-CSE-MsgGUID: /OkLZgYXSBiELxR4DjfIqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="176855505"
Received: from gsd-build.iind.intel.com ([10.190.229.175])
 by orviesa010.jf.intel.com with ESMTP; 26 Sep 2025 03:18:18 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/migrate: Atomicize CCS copy command setup
Date: Fri, 26 Sep 2025 10:18:14 +0000
Message-ID: <20250926101814.2148970-1-satyanarayana.k.v.p@intel.com>
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
---
 drivers/gpu/drm/xe/xe_migrate.c | 40 +++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e2fff2107f68..8c8685be3b44 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -644,18 +644,37 @@ static void emit_pte(struct xe_migrate *m,
 	}
 }
 
-#define EMIT_COPY_CCS_DW 5
+/*
+ * The CCS copy command is a 5-dword sequence. If the vCPU halts during
+ * save/restore while this sequence is being issued, partial writes may trigger
+ * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
+ * write the sequence atomically.
+ */
+static void _memcpy_vmovdqu(void *dst, const void *src)
+{
+	kernel_fpu_begin();
+
+	asm("vmovdqu (%0), %%ymm0\n"
+	    "vmovups %%ymm0,   (%1)\n"
+	    :: "r" (src), "r" (dst) : "memory");
+
+	kernel_fpu_end();
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
@@ -673,14 +692,17 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
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
+	_memcpy_vmovdqu(cs, dw);
+	cs += EMIT_COPY_CCS_DW;
 
 	bb->len = cs - bb->cs;
 }
-- 
2.43.0

