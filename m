Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CFFC3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 21:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4F310E446;
	Wed, 17 Jul 2024 21:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KN3B7ate";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CDA10E43E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 21:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721250619; x=1752786619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bBacBsuZJYrOoxNMnKk6cWHkXg/Fb340IdT2HlGg+M0=;
 b=KN3B7ateti3k8FDaXV5ldY+6SmxsF9971ednuiUWMdhpBbc06lWLngXu
 hnqVIXO2D5SIk69rFp5GohD95IPG2AQg4941d7L1O7IH10ayqFXJgue9G
 UzOG9+F63bXY2T1TxJc5gm/dRcg4YMCP1oniQpy1GhsajphPsnU4LobjU
 YX8tQXSaWwAjCbztdqcnaYP3jGK9hoyLBE5sUtsH5RZc0ppYrRkzjSxho
 +MuG6QnFJgfZivK783UlbS9f/8rDIemCzcZkpuaYYDeDSU3Nhv8DrUzLx
 9RBERnJaHn1/DW7zw2eq7xW8d5abmzXNr1OEH7jFNHj8rZOwzkziKhzej A==;
X-CSE-ConnectionGUID: KKzDrJeaT+ajS2uUIQeW6w==
X-CSE-MsgGUID: HBZDj5ZDRc6BzyG1d/UXLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="12596202"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="12596202"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 14:10:19 -0700
X-CSE-ConnectionGUID: SyWNH0WeSLe5WCB0tJ6riA==
X-CSE-MsgGUID: jcVaI/5ySm+Wuir3SZfuJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="50252650"
Received: from dut1122bmgfrd.igk.intel.com ([10.211.178.41])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 14:10:18 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v7 3/7] drm/xe/migrate: Add helper function to program
 identity map
Date: Wed, 17 Jul 2024 21:10:04 +0000
Message-Id: <91dc05f05bd33076fb9a9f74f8495b48d2abff53.1721250309.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721250309.git.akshata.jahagirdar@intel.com>
References: <cover.1721250309.git.akshata.jahagirdar@intel.com>
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

Add an helper function to program identity map.

v2: Formatting nits

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 88 ++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 85eec95c9bc2..49ad5d8443cf 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -130,6 +130,51 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
 	return addr + (256ULL << xe_pt_shift(2));
 }
 
+static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm, struct xe_bo *bo,
+					u64 map_ofs, u64 vram_offset, u16 pat_index, u64 pt_2m_ofs)
+{
+	u64 pos, ofs, flags;
+	u64 entry;
+	/* XXX: Unclear if this should be usable_size? */
+	u64 vram_limit =  xe->mem.vram.actual_physical_size +
+		xe->mem.vram.dpa_base;
+	u32 level = 2;
+
+	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
+	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
+					    true, 0);
+
+	xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
+
+	/*
+	 * Use 1GB pages when possible, last chunk always use 2M
+	 * pages as mixing reserved memory (stolen, WOCPM) with a single
+	 * mapping is not allowed on certain platforms.
+	 */
+	for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
+	     pos += SZ_1G, ofs += 8) {
+		if (pos + SZ_1G >= vram_limit) {
+			entry = vm->pt_ops->pde_encode_bo(bo, pt_2m_ofs,
+							  pat_index);
+			xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
+
+			flags = vm->pt_ops->pte_encode_addr(xe, 0,
+							    pat_index,
+							    level - 1,
+							    true, 0);
+
+			for (ofs = pt_2m_ofs; pos < vram_limit;
+			     pos += SZ_2M, ofs += 8)
+				xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
+			break;	/* Ensure pos == vram_limit assert correct */
+		}
+
+		xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
+	}
+
+	xe_assert(xe, pos == vram_limit);
+}
+
 static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 				 struct xe_vm *vm)
 {
@@ -253,47 +298,10 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 	/* Identity map the entire vram at 256GiB offset */
 	if (IS_DGFX(xe)) {
-		u64 pos, ofs, flags;
-		/* XXX: Unclear if this should be usable_size? */
-		u64 vram_limit =  xe->mem.vram.actual_physical_size +
-			xe->mem.vram.dpa_base;
-
-		level = 2;
-		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
-		flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
-						    true, 0);
-
-		xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
-
-		/*
-		 * Use 1GB pages when possible, last chunk always use 2M
-		 * pages as mixing reserved memory (stolen, WOCPM) with a single
-		 * mapping is not allowed on certain platforms.
-		 */
-		for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
-		     pos += SZ_1G, ofs += 8) {
-			if (pos + SZ_1G >= vram_limit) {
-				u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
-
-				entry = vm->pt_ops->pde_encode_bo(bo, pt31_ofs,
-								  pat_index);
-				xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
-
-				flags = vm->pt_ops->pte_encode_addr(xe, 0,
-								    pat_index,
-								    level - 1,
-								    true, 0);
-
-				for (ofs = pt31_ofs; pos < vram_limit;
-				     pos += SZ_2M, ofs += 8)
-					xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
-				break;	/* Ensure pos == vram_limit assert correct */
-			}
-
-			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
-		}
+		u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
 
-		xe_assert(xe, pos == vram_limit);
+		xe_migrate_program_identity(xe, vm, bo, map_ofs, 256, pat_index, pt31_ofs);
+		xe_assert(xe, (xe->mem.vram.actual_physical_size <= SZ_256G));
 	}
 
 	/*
-- 
2.34.1

