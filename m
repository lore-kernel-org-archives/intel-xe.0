Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2558C98306
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 04:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522CB10E594;
	Fri, 25 Sep 2026 04:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1f66qzM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF22110F825
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 04:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790312012; x=1821848012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+NorUnAop2fdIiAkSlU8wCGkdpRy6oOHTfV3Vxz3dsM=;
 b=j1f66qzM7/wfQEdOqlCiMeKzFFfzziF8kFUzUohi+dyuxCchWpYsI94Z
 /SIctsGT2V8WJBpTrr595E8lafrWNm2NbwewsVW1+XK21y0+Dg5bU+srM
 AxZS0rXaDn9alycuenLvSsYGaDyf5yYYzP+9l/wUtZ8ocVyViTA3vkGzg
 72lGVqaS079gA1mvHWdduqzMf4tDAg1MExhEEm2KK2LB4iMHqT04HG6Xw
 r0s4vqzP7E8KhxiC9ixpQeBjL3Sbp8l0V31lmSkUKOQw4wnL2OAiB0tbW
 OpddL7TowzJUwuwHANZ66IoKt34FLgK6GBMCbWyywCYzjGBeh2MtBGvyV w==;
X-CSE-ConnectionGUID: Gak44LnxRJyEqtt78qGe9A==
X-CSE-MsgGUID: aO2mOttHQvW/AAk+P9i6Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90156227"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90156227"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:27 -0700
X-CSE-ConnectionGUID: ETI9VLaASSKwBq7SNjbuCg==
X-CSE-MsgGUID: Mn8Z8ioVQ4SiK7W7vS+W8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="312155532"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v7 14/24] drm/xe: Remove unused arguments from
 xe_migrate_pt_update_ops
Date: Thu, 24 Sep 2026 21:53:10 -0700
Message-Id: <20260925045320.1325860-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925045320.1325860-1-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
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

Both populate and clear have unused void* ptr arguments, remove these.
Also consolidate ofs, num_qwords in update argument.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

---
v7:
 - Drop ofs, num_qwords (Shuicheng)
---
 drivers/gpu/drm/xe/xe_migrate.c |  2 --
 drivers/gpu/drm/xe/xe_migrate.h | 10 +-------
 drivers/gpu/drm/xe/xe_pt.c      | 41 +++++++++++----------------------
 3 files changed, 15 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 1fabc160b7d8..1c16d31f0d10 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1811,11 +1811,9 @@ xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile *tile,
 
 			if (pt_op->bind && !force_clear)
 				ops->populate(tile, &update->pt_bo->vmap,
-					      NULL, update->ofs, update->qwords,
 					      update);
 			else
 				ops->clear(vm, tile, &update->pt_bo->vmap,
-					   NULL, update->ofs, update->qwords,
 					   update);
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index e6b7070134e1..94b8d8d63720 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -43,9 +43,6 @@ struct xe_migrate_pt_update_ops {
 	 * @populate: Populate a command buffer or page-table with ptes.
 	 * @tile: The tile for the current operation.
 	 * @map: struct iosys_map into the memory to be populated.
-	 * @pos: If @map is NULL, map into the memory to be populated.
-	 * @ofs: qword offset into @map, unused if @map is NULL.
-	 * @num_qwords: Number of qwords to write.
 	 * @update: Information about the PTEs to be inserted.
 	 *
 	 * This interface is intended to be used as a callback into the
@@ -53,16 +50,12 @@ struct xe_migrate_pt_update_ops {
 	 * page-tables with PTEs.
 	 */
 	void (*populate)(struct xe_tile *tile, struct iosys_map *map,
-			 void *pos, u32 ofs, u32 num_qwords,
 			 const struct xe_vm_pgtable_update *update);
 	/**
 	 * @clear: Clear a command buffer or page-table with ptes.
 	 * @vm: VM being updated
 	 * @tile: The tile for the current operation.
 	 * @map: struct iosys_map into the memory to be populated.
-	 * @pos: If @map is NULL, map into the memory to be populated.
-	 * @ofs: qword offset into @map, unused if @map is NULL.
-	 * @num_qwords: Number of qwords to write.
 	 * @update: Information about the PTEs to be inserted.
 	 *
 	 * This interface is intended to be used as a callback into the
@@ -70,8 +63,7 @@ struct xe_migrate_pt_update_ops {
 	 * page-tables with PTEs.
 	 */
 	void (*clear)(struct xe_vm *vm, struct xe_tile *tile,
-		      struct iosys_map *map, void *pos, u32 ofs,
-		      u32 num_qwords,
+		      struct iosys_map *map,
 		      const struct xe_vm_pgtable_update *update);
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 666097d68563..102f40c966f1 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1106,30 +1106,17 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
 
 static void
 xe_vm_populate_pgtable(struct xe_tile *tile, struct iosys_map *map,
-		       void *data, u32 qword_ofs, u32 num_qwords,
 		       const struct xe_vm_pgtable_update *update)
 {
 	struct xe_pt_entry *ptes = update->pt_entries;
-	u64 *ptr = data;
 	u32 i;
 
-	/*
-	 * @qword_ofs is the absolute entry offset within the page table, while
-	 * @ptes is indexed relative to @update->ofs (its first entry). The GPU
-	 * path (write_pgtable) splits a single update into MAX_PTE_PER_SDI-sized
-	 * chunks, calling this with an advancing @qword_ofs but a fresh @data
-	 * pointer per chunk, so translate back into a @ptes index rather than
-	 * assuming the chunk starts at ptes[0].
-	 */
-	for (i = 0; i < num_qwords; i++) {
-		u32 idx = qword_ofs - update->ofs + i;
+	xe_assert(tile_to_xe(tile), map);
+	xe_assert(tile_to_xe(tile), !iosys_map_is_null(map));
 
-		if (map)
-			xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
-				  sizeof(u64), u64, ptes[idx].pte);
-		else
-			ptr[i] = ptes[idx].pte;
-	}
+	for (i = 0; i < update->qwords; i++)
+		xe_map_wr(tile_to_xe(tile), map, (update->ofs + i) *
+			  sizeof(u64), u64, ptes[i].pte);
 }
 
 static void xe_pt_cancel_bind(struct xe_vma *vma,
@@ -2021,22 +2008,22 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
 
 static void
 xe_migrate_clear_pgtable_callback(struct xe_vm *vm, struct xe_tile *tile,
-				  struct iosys_map *map, void *ptr,
-				  u32 qword_ofs, u32 num_qwords,
+				  struct iosys_map *map,
 				  const struct xe_vm_pgtable_update *update)
 {
 	u64 empty = __xe_pt_empty_pte(tile, vm, update->level);
 	int i;
 
-	if (map && map->is_iomem)
-		for (i = 0; i < num_qwords; ++i)
-			xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
+	xe_assert(vm->xe, map);
+	xe_assert(vm->xe, !iosys_map_is_null(map));
+
+	if (map->is_iomem)
+		for (i = 0; i < update->qwords; ++i)
+			xe_map_wr(tile_to_xe(tile), map, (update->ofs + i) *
 				  sizeof(u64), u64, empty);
-	else if (map)
-		memset64(map->vaddr + qword_ofs * sizeof(u64), empty,
-			 num_qwords);
 	else
-		memset64(ptr, empty, num_qwords);
+		memset64(map->vaddr + update->ofs * sizeof(u64), empty,
+			 update->qwords);
 }
 
 static void xe_pt_abort_unbind(struct xe_vma *vma,
-- 
2.34.1

