Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD9DC98332
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 20:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DCC10FC6E;
	Fri, 25 Sep 2026 20:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P82pef2e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB23C10FC46
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790367333; x=1821903333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SXNBCX8OG27yGU7fMB2mblb4mJsY1OC0x8CP5s9H/dY=;
 b=P82pef2e+1kfIn6Iwckt6iXrRyVVtH52rizfWVc6PZx1XvDRmiMy1oWb
 tt6VV28RzMpgPZOFBarnyWtjbRC2flYEzXmzHsNgi19eTzVRiwkt+A7M6
 eKdTPayzjGWgRVTIL0sRFrNQH7V17kLBJ3tQrFwF8tSEy1wZjnq/q5RY0
 zZGPD4/5/bCxDdKH9yXG2r5RBWlwrgmn9J6wVS+BVhRPH30lstyUm2zj5
 n25JbuuFdDeFowlsVDZOvGdmFDCyg4MhkBPVoiTw73+yqBeeJiX9nJA9B
 IY6t/usbJeXdwlxOAX5PtHc+qBoO+AebavZMNUOdA9qn1VDzQhldfCJxg Q==;
X-CSE-ConnectionGUID: LCPV1jdzRUK0qdrCi3KTnw==
X-CSE-MsgGUID: DpyfpA4CQLesKqSnUKbQWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90377960"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="90377960"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 13:15:32 -0700
X-CSE-ConnectionGUID: zI7rr20MTfedHawlWJ3WOA==
X-CSE-MsgGUID: CYo/fTUZTZWQixR1sxl9KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="274509879"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 13:15:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v8 14/24] drm/xe: Remove unused arguments from
 xe_migrate_pt_update_ops
Date: Fri, 25 Sep 2026 13:15:16 -0700
Message-Id: <20260925201526.1355279-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925201526.1355279-1-matthew.brost@intel.com>
References: <20260925201526.1355279-1-matthew.brost@intel.com>
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
Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
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

