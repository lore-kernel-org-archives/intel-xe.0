Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79056C624DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E14610F80F;
	Fri,  4 Sep 2026 02:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="byjAzV+S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362CB10E1BB
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 02:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788488535; x=1820024535;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=X0rIx6GuOv16XqZkW/Wmj2hk0oLJpi7uBklMiDGgEzI=;
 b=byjAzV+SfoONkh3WA2xiFZDhqg73x7m3V3wPaN1C8NlFw2lW1B0u0ZwJ
 CD/PIBjVDnbeQ+9pzmzBWMkN5yCOQSaXp9aNm39pFBzdkM9zFTh3QQVEo
 /yj9hG1D5LhhTBugp2OuncEvns1jV08xg6c2PMteY62xnupO1QiCxuIWQ
 U4MCxF11bW99Sdc+3pgvff2+XfVtog8OGyoSFKYK+TEbGinIXC8oP/4/y
 qSZgNQom7mA5qQJcdpV3DqTt2Q8qyJh8+m/ZWHLtxdnmz3MT4TZoJGZIk
 u8oZknKjG2LmOPMnIDPrgr9Vu7ebEqBlL4zl0YmUwWn7XEFzRQ7Vh4T7R A==;
X-CSE-ConnectionGUID: UxPHEnvPST+tJUYXYcO3sw==
X-CSE-MsgGUID: g8UpWlXERxqSB6UMVITKtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="106506286"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="106506286"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 19:22:15 -0700
X-CSE-ConnectionGUID: Ie2bSR/+RpCUDYpttbM1xA==
X-CSE-MsgGUID: ALeJNYMrSKiakB7/yGWq/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="275185131"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 19:22:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 14/25] drm/xe: Remove unused arguments from
 xe_migrate_pt_update_ops
Date: Thu,  3 Sep 2026 19:21:56 -0700
Message-Id: <20260904022207.3490018-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904022207.3490018-1-matthew.brost@intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-15-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_migrate.c |  4 ++--
 drivers/gpu/drm/xe/xe_migrate.h |  7 ++-----
 drivers/gpu/drm/xe/xe_pt.c      | 37 ++++++++++++---------------------
 3 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e5c46e0fa960..22a442d13477 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1812,11 +1812,11 @@ xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile *tile,
 
 			if (pt_op->bind)
 				ops->populate(tile, &update->pt_bo->vmap,
-					      NULL, update->ofs, update->qwords,
+					      update->ofs, update->qwords,
 					      update);
 			else
 				ops->clear(vm, tile, &update->pt_bo->vmap,
-					   NULL, update->ofs, update->qwords,
+					   update->ofs, update->qwords,
 					   update);
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 7a824654cb72..74ff6446309c 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -43,7 +43,6 @@ struct xe_migrate_pt_update_ops {
 	 * @populate: Populate a command buffer or page-table with ptes.
 	 * @tile: The tile for the current operation.
 	 * @map: struct iosys_map into the memory to be populated.
-	 * @pos: If @map is NULL, map into the memory to be populated.
 	 * @ofs: qword offset into @map, unused if @map is NULL.
 	 * @num_qwords: Number of qwords to write.
 	 * @update: Information about the PTEs to be inserted.
@@ -53,14 +52,13 @@ struct xe_migrate_pt_update_ops {
 	 * page-tables with PTEs.
 	 */
 	void (*populate)(struct xe_tile *tile, struct iosys_map *map,
-			 void *pos, u32 ofs, u32 num_qwords,
+			 u32 ofs, u32 num_qwords,
 			 const struct xe_vm_pgtable_update *update);
 	/**
 	 * @clear: Clear a command buffer or page-table with ptes.
 	 * @vm: VM being updated
 	 * @tile: The tile for the current operation.
 	 * @map: struct iosys_map into the memory to be populated.
-	 * @pos: If @map is NULL, map into the memory to be populated.
 	 * @ofs: qword offset into @map, unused if @map is NULL.
 	 * @num_qwords: Number of qwords to write.
 	 * @update: Information about the PTEs to be inserted.
@@ -70,8 +68,7 @@ struct xe_migrate_pt_update_ops {
 	 * page-tables with PTEs.
 	 */
 	void (*clear)(struct xe_vm *vm, struct xe_tile *tile,
-		      struct iosys_map *map, void *pos, u32 ofs,
-		      u32 num_qwords,
+		      struct iosys_map *map, u32 ofs, u32 num_qwords,
 		      const struct xe_vm_pgtable_update *update);
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 24190ba4f533..c17d5f96f00a 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1106,30 +1106,18 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
 
 static void
 xe_vm_populate_pgtable(struct xe_tile *tile, struct iosys_map *map,
-		       void *data, u32 qword_ofs, u32 num_qwords,
+		       u32 qword_ofs, u32 num_qwords,
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
+	for (i = 0; i < num_qwords; i++)
+		xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
+			  sizeof(u64), u64, ptes[i].pte);
 }
 
 static void xe_pt_cancel_bind(struct xe_vma *vma,
@@ -2021,22 +2009,23 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
 
 static void
 xe_migrate_clear_pgtable_callback(struct xe_vm *vm, struct xe_tile *tile,
-				  struct iosys_map *map, void *ptr,
-				  u32 qword_ofs, u32 num_qwords,
+				  struct iosys_map *map, u32 qword_ofs,
+				  u32 num_qwords,
 				  const struct xe_vm_pgtable_update *update)
 {
 	u64 empty = __xe_pt_empty_pte(tile, vm, update->level);
 	int i;
 
-	if (map && map->is_iomem)
+	xe_assert(vm->xe, map);
+	xe_assert(vm->xe, !iosys_map_is_null(map));
+
+	if (map->is_iomem)
 		for (i = 0; i < num_qwords; ++i)
 			xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
 				  sizeof(u64), u64, empty);
-	else if (map)
+	else
 		memset64(map->vaddr + qword_ofs * sizeof(u64), empty,
 			 num_qwords);
-	else
-		memset64(ptr, empty, num_qwords);
 }
 
 static void xe_pt_abort_unbind(struct xe_vma *vma,
-- 
2.34.1

