Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CA5C3DA5E
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 22:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4922510E901;
	Tue, 16 Jul 2024 22:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQHieZpv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4285510E8FD
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 22:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721170462; x=1752706462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CBZdywFqvh/ciR//poN7FlLLaAdg4iSYzGWZqnpL4+w=;
 b=iQHieZpvHEIv/zWw2TYw1JTsGAVs/Ek/px8xIkboqan4gQplIlFXW+Oa
 iIgnRWnTk8JNBQvVi8dZ/lIYGmX0LBK2hDUmNA5StayMElcS4CgeZANFj
 FvnsCU3m4hPWbE7JJrVneF3EpJUIaQwWf7o462l++Az9EhAub8xNeaay9
 c3agnWK+AK9uA6UzSToi7tqM5IbPRh90KFiiPpfkO3pCjt+5Ip589RUx9
 rV7zEmP0Zbm28SrlwCRwVnK2XuB9GiIaXX5DxU1S4YWqaeYf5MVoSlbwa
 rfA7Wl4+B+QOcjXYbm2ELBlocLqRgYFdDhrFp5aZ923dfkx76vgWsZZxd A==;
X-CSE-ConnectionGUID: ti/LYlv5RlmHUb64fTSnHA==
X-CSE-MsgGUID: SCgs6lUPRbelgEoU6ZbNuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="22457138"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="22457138"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 15:54:22 -0700
X-CSE-ConnectionGUID: v36EllgmT2mCb9xxMSNP+Q==
X-CSE-MsgGUID: QmQXFsbJS+OCDN59U57KWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="50765835"
Received: from unknown (HELO DUT1107BMGFRD.igk.intel.com) ([10.211.177.88])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 15:54:20 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH v5 3/8] drm/xe/migrate: Add helper function to program
 identity map
Date: Tue, 16 Jul 2024 22:54:04 +0000
Message-Id: <810bcf155874734488222a4be7414054d6445b8d.1721170212.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721170212.git.akshata.jahagirdar@intel.com>
References: <cover.1721170212.git.akshata.jahagirdar@intel.com>
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
---
 drivers/gpu/drm/xe/xe_migrate.c | 88 ++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 85eec95c9bc2..6b952ed98a51 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -130,6 +130,51 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
 	return addr + (256ULL << xe_pt_shift(2));
 }
 
+static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm, struct xe_bo *bo,
+					u64 map_ofs, u64 vram_offset, u16 pat_index, u64 pt_ofs)
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
+			entry = vm->pt_ops->pde_encode_bo(bo, pt_ofs,
+							  pat_index);
+			xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
+
+			flags = vm->pt_ops->pte_encode_addr(xe, 0,
+							    pat_index,
+							    level - 1,
+							    true, 0);
+
+			for (ofs = pt_ofs; pos < vram_limit;
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

