Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E85CD98F2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 10:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AC289C0A;
	Mon, 22 Jun 2026 10:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dl4cxC0m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546D089C0A
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782124517; x=1813660517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uuNdt+rPOaUJYljrNqH4bZdHmsnFCDrnDMHaXrFGOuc=;
 b=dl4cxC0mlgwC3m52lwVWQlkvvYIf1l+hVQFHIY0OGtVp3aLCRwR0ET5u
 qsbSZqFB5xb9Ufiiao3be04REVXFADuveWnop494uz5ILn7WhlK8Nr6Oe
 VgNgf5XE9229rcj8fcvJd/GBRx6do0BhuEBBgd8+B30QZsCXW+IgRNfsZ
 F6dzRbBj4ENQE+w9qtths27h3mjFkHxGD+03UvouEGv3VeTuAmX5WmYhZ
 VR/VWQOLvQP7Ni1ZORzckzYfsgaplggJ7nMKdq36G0pcS0iDC3A/S2hDY
 RsbzIk6uVc9sJbQ5i370Tw9ab3hF3O5al+ucA42rw+PzNNoxkkvopMnGv Q==;
X-CSE-ConnectionGUID: vZeFxrIFSi2WyCKQ3/L4ng==
X-CSE-MsgGUID: SoEvAq/BTF6RLiOSfRbZQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="70365435"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="70365435"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 03:35:17 -0700
X-CSE-ConnectionGUID: pBiRkq3kSgaihMAknUjJHQ==
X-CSE-MsgGUID: C8C2JPFfRqye7sDAjtW7Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="248046776"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 03:35:15 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v2 1/4] drm/xe/xe_migrate: Align MEM_COPY pitch with
 destination address
Date: Mon, 22 Jun 2026 12:34:46 +0200
Message-ID: <20260622103449.3335928-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622103449.3335928-1-jan.maslak@intel.com>
References: <20260622103449.3335928-1-jan.maslak@intel.com>
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
---
 drivers/gpu/drm/xe/xe_migrate.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9428dd5e7760..9218eba31d45 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2186,17 +2186,18 @@ static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr *sram_addr,
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
@@ -2223,16 +2224,11 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
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
@@ -2284,6 +2280,13 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
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
 
@@ -2536,7 +2539,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
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

