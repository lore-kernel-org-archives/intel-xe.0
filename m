Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFF8C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA92110E8A8;
	Thu,  5 Jun 2025 15:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMENtF0p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC22910E92F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749137455; x=1780673455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5rkqUf16mI5jbLe43CExltzmihBQvB9AirQEDV+fozY=;
 b=KMENtF0pp5FsEOqs3fZU59saTyqAGu+UWQS+nlxPnYNRXHs3pZ0Z+Pnq
 D4n3WsYFvqvy74oKITSI/cT+LPrfIBVxFfFgtbz7UbQ8cYy6d1GygjTRJ
 FcNeQd7JZ6VyaR6khfTZrzEoetTL4brhOCpnVtK8SN4eqa9JkUpeiH7mC
 QXER9NtwNod6xoQV1CJHKbISf8Yc9a144e8wkDYcA2OINGAjcAhaqH1Jo
 h5M2Yl3iM/3jD0Jf+jeOwo4fKUhDnQGua72thQZPwdCK+YGGqaxFvMhEC
 JqgNzn+4Bk2FTMJ1fbzhOmznyfjnDYLtJLWgfiV5LTtiiMXAdg6/Yikj3 A==;
X-CSE-ConnectionGUID: 4DvTmDc8RtayZOJXP+Qx8Q==
X-CSE-MsgGUID: 4LFMgoYYQ3eoEJccPoQNzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61529487"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="61529487"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:51 -0700
X-CSE-ConnectionGUID: 5jdonTlWQqy+OKrnijOylg==
X-CSE-MsgGUID: FU4AZ4HATVePFDM8mHS6rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176502801"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 04/15] drm/xe: Remove unused arguments from
 xe_migrate_pt_update_ops
Date: Thu,  5 Jun 2025 08:32:12 -0700
Message-Id: <20250605153223.2789122-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605153223.2789122-1-matthew.brost@intel.com>
References: <20250605153223.2789122-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_migrate.c |  4 ++--
 drivers/gpu/drm/xe/xe_migrate.h |  7 ++-----
 drivers/gpu/drm/xe/xe_pt.c      | 29 ++++++++++++++---------------
 3 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e444f3fae97c..9b17feb8bae6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1218,11 +1218,11 @@ __xe_migrate_update_pgtables_cpu(struct xe_vm *vm, struct xe_tile *tile,
 
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
index 0986ffdd8d9a..b78bdd11d496 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -34,7 +34,6 @@ struct xe_migrate_pt_update_ops {
 	 * @populate: Populate a command buffer or page-table with ptes.
 	 * @tile: The tile for the current operation.
 	 * @map: struct iosys_map into the memory to be populated.
-	 * @pos: If @map is NULL, map into the memory to be populated.
 	 * @ofs: qword offset into @map, unused if @map is NULL.
 	 * @num_qwords: Number of qwords to write.
 	 * @update: Information about the PTEs to be inserted.
@@ -44,14 +43,13 @@ struct xe_migrate_pt_update_ops {
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
@@ -61,8 +59,7 @@ struct xe_migrate_pt_update_ops {
 	 * page-tables with PTEs.
 	 */
 	void (*clear)(struct xe_vm *vm, struct xe_tile *tile,
-		      struct iosys_map *map, void *pos, u32 ofs,
-		      u32 num_qwords,
+		      struct iosys_map *map, u32 ofs, u32 num_qwords,
 		      const struct xe_vm_pgtable_update *update);
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 1ad31f444b79..5132e8eb7562 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -976,20 +976,18 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
 
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
@@ -1748,22 +1746,23 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
 
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

