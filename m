Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132CEC79FB5
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 06:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF03D10E315;
	Wed,  9 Sep 2026 06:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="evyvYMID";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5395F10E113
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 06:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788934751; x=1820470751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m6LYWDu36IVBmzAXAQz72DL+8ZbtZvxf7Bs0/TFaSrw=;
 b=evyvYMIDXn8z1z6hzgV3OsLNrS216gDRjgHeKz2x5Pl7x7BRDK4il4nh
 +plPxEtq8eeEnqukeBPnCO5oibayO38DbYp9myd3jY4PDHG+2eIoAInOy
 A5Nc4r4DXVzrlXMAalGhl8QmYsXgeHzvCQvZBCTETlyB9IIen7AowW0v+
 XVOokAPtS70xYzrIni3QGGn1fFiPNL60Ni8hZMiVcm6YqacN2n1Sbv9Wf
 RmiDbHJ+FKw1Tum9k8v/qgWJOpf717ENwucasku8BvfixM5rBZVK1ppRS
 H+5qJVuWOQRqk0ljwAWmlhY3xluLzcoHmpX3RgbdcAuOM1tKZRgH9LkPM Q==;
X-CSE-ConnectionGUID: KyUp1atASpqviARfOZIefg==
X-CSE-MsgGUID: k2o/DIKZRz2XMvJuhcJ/7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89220581"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89220581"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 23:19:10 -0700
X-CSE-ConnectionGUID: eE3vysomQKSkFPReJc4VUw==
X-CSE-MsgGUID: VylX/7GXSv26QLv2/I+TWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="270733913"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 23:19:06 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v3 1/4] drm/xe/xe_migrate: Align MEM_COPY pitch with
 destination address
Date: Wed,  9 Sep 2026 08:18:42 +0200
Message-ID: <20260909061845.4048047-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909061845.4048047-1-jan.maslak@intel.com>
References: <20260909061845.4048047-1-jan.maslak@intel.com>
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
 drivers/gpu/drm/xe/xe_migrate.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ff45c24d8889..2e5827aaf99d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2205,17 +2205,18 @@ static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr *sram_addr,
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
@@ -2242,16 +2243,11 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
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
@@ -2303,6 +2299,13 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 			dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
 	}
 
+	pitch = xe_migrate_copy_pitch(xe, len, dst_L0_ofs);
+	if (!xe->info.has_mem_copy_instr &&
+	    drm_WARN_ON(&xe->drm,
+			(!IS_ALIGNED(len, pitch)) ||
+			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
+		return ERR_PTR(-EOPNOTSUPP);
+
 	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 	update_idx = bb->len;
 
@@ -2555,7 +2558,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
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

