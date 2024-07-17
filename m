Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654E4C3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 05:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C6F10E8CF;
	Wed, 17 Jul 2024 05:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IlqKoJP4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5BE10E8CF
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 05:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721193708; x=1752729708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bBacBsuZJYrOoxNMnKk6cWHkXg/Fb340IdT2HlGg+M0=;
 b=IlqKoJP40sLxIbDGP+BzwDWn91b6QvzPpC4/OkS+qJlBAsICbdjyfS9F
 PW3l7mNgDTMcOPSuTusp/BgaDWMNeHDlQrP1W7a2z092zSO6SFAqLHtFX
 cQ4E+1WFrZYt+5L81p9orrZNLkZyaXldy0OUZQWFe6Nt9sQgAAIwfe6kv
 Uf9jCrCwaf+zDYBsTSN+F0BzTgrpqAqqZeKfFushI0Q8IvBnMc3fMRk14
 h7Pxiq25Lx9IT9jUsO63QNWj1HlrD3dBXTfWzY9LrEJs+/M7qC1UQl3So
 v40eMBMuDfG7hUhjyt2wpOov9pZfojW17Cp7faRGhtrILMaU73FGVdSRG A==;
X-CSE-ConnectionGUID: E5aY0jXfTrKQpw6Xe7ds9g==
X-CSE-MsgGUID: yDbMI0w3RDiJ9OG5fHoEVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29281155"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="29281155"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:21:47 -0700
X-CSE-ConnectionGUID: kO7u944BRK6+D2yw1RDI0g==
X-CSE-MsgGUID: qdDwc080QlikZCvhCudPnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="55124822"
Received: from dut1107bmgfrd.igk.intel.com ([10.211.177.88])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:21:46 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com, matthew.brost@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH v6 3/8] drm/xe/migrate: Add helper function to program
 identity map
Date: Wed, 17 Jul 2024 05:21:28 +0000
Message-Id: <b3fcb05649d17921d1e3b84e8b5eb1af7d14a72f.1721193361.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721193361.git.akshata.jahagirdar@intel.com>
References: <cover.1721193361.git.akshata.jahagirdar@intel.com>
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

