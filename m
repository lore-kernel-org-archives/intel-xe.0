Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55A6CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 14:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614E310E122;
	Wed, 14 Oct 2026 14:27:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9988310E9C0
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 14:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791988045; x=1823524045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h7MHhKa+rNNq5e6CVmYA1yHYLJjQrSYH2zUGMipr7Ag=;
 b=nweXo/bM4T6WoMuxWcFf9XMrtuF3S6mFVVfmqgD80w7vcv6Zxe80b1uR
 qpH5mF0HzQDU2OH+ze2VgK3UhhyggRRXKHaxSERSVU3aW2ZCTWDZQzjjU
 GLnQ9IxYhFPNiyrJWwbk9euWxrM3UJaifLaHqC5DAjNkJeBN2lUVPyVLB
 QGXu/+gftCclyc/nRzCc3f6PHtVA+g/4cWZIoeoF7V1onBbWgowy/Jww2
 61noqrjV1iTRCqisKbqaypGz4km5Wh/1Lo/as4kzr5E4zFcomeQ005b82
 C8pRSzQmpzKsc93dZ85hF2F3jCIswSDb7+XqnNgv2R2aJYpXcjgkXNaON w==;
X-CSE-ConnectionGUID: AKTKrf8KTO2xT+iZJ9Qy8g==
X-CSE-MsgGUID: oCiOtVCVTIuxfO7wGoMU4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="738975"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="738975"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 07:27:25 -0700
X-CSE-ConnectionGUID: hOxhj7lKSZud117XVaZSlg==
X-CSE-MsgGUID: LiW/sFlbTNGBPOWez/e8Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3203443"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 07:27:22 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v5 2/4] drm/xe/xe_migrate: Align MEM_COPY pitch with
 destination address
Date: Wed, 14 Oct 2026 16:27:04 +0200
Message-ID: <20261014142706.598490-3-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014142706.598490-1-jan.maslak@intel.com>
References: <20261014142706.598490-1-jan.maslak@intel.com>
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

MEM_COPY_CMD can corrupt memory when MATRIX_COPY mode uses a pitch that
is not aligned to the destination address.

Fix this by incorporating the destination address into the pitch
selection so the chosen pitch is aligned to both the copy length and the
destination address.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Jan Maslak <jan.maslak@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3711d4542ad3..4b995c93fcea 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2187,17 +2187,18 @@ static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr *sram_addr,
 #define XE_CACHELINE_BYTES	64ull
 #define XE_CACHELINE_MASK	(XE_CACHELINE_BYTES - 1)
 
-static u32 xe_migrate_copy_pitch(struct xe_device *xe, u32 len)
+static u32 xe_migrate_copy_pitch(struct xe_device *xe, u32 len, u64 dst_addr)
 {
+	u64 align_check = len | dst_addr;
 	u32 pitch;
 
-	if (IS_ALIGNED(len, PAGE_SIZE))
+	if (IS_ALIGNED(align_check, PAGE_SIZE))
 		pitch = PAGE_SIZE;
-	else if (IS_ALIGNED(len, SZ_4K))
+	else if (IS_ALIGNED(align_check, SZ_4K))
 		pitch = SZ_4K;
-	else if (IS_ALIGNED(len, SZ_256))
+	else if (IS_ALIGNED(align_check, SZ_256))
 		pitch = SZ_256;
-	else if (IS_ALIGNED(len, 4))
+	else if (IS_ALIGNED(align_check, 4))
 		pitch = 4;
 	else
 		pitch = 1;
@@ -2224,16 +2225,11 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	struct xe_bb *bb;
 	u32 update_idx, pt_slot = 0;
 	unsigned long npages = DIV_ROUND_UP(len + sram_offset, PAGE_SIZE);
-	unsigned int pitch = xe_migrate_copy_pitch(xe, len);
+	unsigned int pitch;
 	int err;
 	unsigned long i, j;
 	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
 
-	if (!xe->info.has_mem_copy_instr &&
-	    drm_WARN_ON(&xe->drm,
-			(!IS_ALIGNED(len, pitch)) || (sram_offset | vram_addr) & XE_CACHELINE_MASK))
-		return ERR_PTR(-EOPNOTSUPP);
-
 	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
 
 	batch_size += pte_update_cmd_size(npages << PAGE_SHIFT);
@@ -2285,6 +2281,15 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 			dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
 	}
 
+	pitch = xe_migrate_copy_pitch(xe, len, dst_L0_ofs);
+	if (!xe->info.has_mem_copy_instr &&
+	    drm_WARN_ON(&xe->drm,
+			(!IS_ALIGNED(len, pitch)) ||
+			(sram_offset | vram_addr) & XE_CACHELINE_MASK)) {
+		err = -EOPNOTSUPP;
+		goto err;
+	}
+
 	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 	update_idx = bb->len;
 
@@ -2535,7 +2540,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 		else
 			current_bytes = min_t(int, bytes_left, cursor.size);
 
-		pitch = xe_migrate_copy_pitch(xe, current_bytes);
+		pitch = xe_migrate_copy_pitch(xe, current_bytes,
+					      write ? vram_addr :
+					      (unsigned long)buf & ~PAGE_MASK);
 		if (xe->info.has_mem_copy_instr)
 			current_bytes = min_t(int, current_bytes, U16_MAX * pitch);
 		else
-- 
2.43.0

