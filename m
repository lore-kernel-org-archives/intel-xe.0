Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0BACD6E7B
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 16:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D7411A173;
	Thu,  4 Jun 2026 16:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="E8zITHH9";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255C811A189
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 16:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780589223;
 bh=vXGFrz0/MMuTBVYJ6rdT5mHPDqcoMBG+s5slqh2XCD4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=E8zITHH9s5rZMf7FQ+QbJVBRaExXzdTpnNWLPfBnM7aIfEqZ1ydLuXN0Tw51vfqNY
 XOdr/q6t4ikQlKkdUCbuqer35nQ7nnz9gN+Agdf6VaItbAxMr2ATCpN/UUJhFHnNnA
 Z25APD115PL1yPSUiIjm6uIUPIEGbQircsFRV+rrW1xvWcgrhq+JgNuT4C6AR8lwrx
 TO4xcfFHbCAHjqr5Oa5spZRBkwqsng64Ivr8vGcvIzA4WUz5672Pz/WdKqNi+J9tVF
 sEnzyLYH3ampzK8uuwB0shU3cdoNGx5XS40kz1SVbuShzbQcFwXX0sH0eXIWbbQufX
 l/JWPdaPFiPLw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [CI 14/24] drm/xe: Remove unused arguments from
 xe_migrate_pt_update_ops
Date: Thu,  4 Jun 2026 18:06:43 +0200
Message-ID: <20260604160655.50036-15-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604160655.50036-1-dev@lankhorst.se>
References: <20260604160655.50036-1-dev@lankhorst.se>
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

From: Matthew Brost <matthew.brost@intel.com>

Both populate and clear have unused void* ptr arguments, remove these.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-15-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_migrate.c |  4 ++--
 drivers/gpu/drm/xe/xe_migrate.h |  7 ++-----
 drivers/gpu/drm/xe/xe_pt.c      | 29 ++++++++++++++---------------
 3 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c820618433b16..f069f42aeabb8 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1795,11 +1795,11 @@ xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile *tile,
 
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
index 4e253bbf21e47..d55ccbdde4cc8 100644
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
index 9935804168cb8..feef08984418c 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1023,20 +1023,18 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
 
 static void
 xe_vm_populate_pgtable(struct xe_tile *tile, struct iosys_map *map,
-		       void *data, u32 qword_ofs, u32 num_qwords,
+		       u32 qword_ofs, u32 num_qwords,
 		       const struct xe_vm_pgtable_update *update)
 {
 	struct xe_pt_entry *ptes = update->pt_entries;
-	u64 *ptr = data;
 	u32 i;
 
-	for (i = 0; i < num_qwords; i++) {
-		if (map)
-			xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
-				  sizeof(u64), u64, ptes[i].pte);
-		else
-			ptr[i] = ptes[i].pte;
-	}
+	xe_assert(tile_to_xe(tile), map);
+	xe_assert(tile_to_xe(tile), !iosys_map_is_null(map));
+
+	for (i = 0; i < num_qwords; i++)
+		xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
+			  sizeof(u64), u64, ptes[i].pte);
 }
 
 static void xe_pt_cancel_bind(struct xe_vma *vma,
@@ -1873,22 +1871,23 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
 
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
2.53.0

