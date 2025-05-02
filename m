Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3182DC3ABB0
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 09:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C470410E174;
	Fri,  2 May 2025 09:35:30 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A40D10E174
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 09:35:24 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 3/4] drm/xe: Fix small leak in migration error path.
Date: Fri,  2 May 2025 11:35:12 +0200
Message-ID: <20250502093514.510621-4-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250502093514.510621-1-dev@lankhorst.se>
References: <20250502093514.510621-1-dev@lankhorst.se>
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

When logical_mask or hwe are zero, we should call xe_vm_close_and_put,
and on error, m->pt_bo is also not cleared.

Also call xe_bo_unpin_map_no_vm even though it is a vm bo,
to ensure the BO is freed.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_migrate.c | 60 +++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 673a5d165482e..7ee27c9f77bac 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -386,6 +386,38 @@ static bool xe_migrate_needs_ccs_emit(struct xe_device *xe)
 	return xe_device_has_flat_ccs(xe) && !(GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe));
 }
 
+static struct xe_exec_queue *xe_migrate_create_queue(struct xe_tile *tile,
+						     struct xe_vm *vm)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_gt *primary_gt = tile->primary_gt;
+
+	if (xe->info.has_usm) {
+		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
+							   XE_ENGINE_CLASS_COPY,
+							   primary_gt->usm.reserved_bcs_instance,
+							   false);
+		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
+
+		if (!hwe || !logical_mask)
+			return ERR_PTR(-EINVAL);
+
+		/*
+		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
+		 * PVC, may want to revisit if performance is needed.
+		 */
+		return xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
+					    EXEC_QUEUE_FLAG_KERNEL |
+					    EXEC_QUEUE_FLAG_PERMANENT |
+					    EXEC_QUEUE_FLAG_HIGH_PRIORITY, 0);
+	} else {
+		return xe_exec_queue_create_class(xe, primary_gt, vm,
+						  XE_ENGINE_CLASS_COPY,
+						  EXEC_QUEUE_FLAG_KERNEL |
+						  EXEC_QUEUE_FLAG_PERMANENT, 0);
+	}
+}
+
 /**
  * xe_migrate_init() - Initialize a migrate context
  * @tile: Back-pointer to the tile we're initializing for.
@@ -395,7 +427,6 @@ static bool xe_migrate_needs_ccs_emit(struct xe_device *xe)
 struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_gt *primary_gt = tile->primary_gt;
 	struct xe_migrate *m;
 	struct xe_vm *vm;
 	int err;
@@ -420,32 +451,11 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		return ERR_PTR(err);
 	}
 
-	if (xe->info.has_usm) {
-		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
-							   XE_ENGINE_CLASS_COPY,
-							   primary_gt->usm.reserved_bcs_instance,
-							   false);
-		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
-
-		if (!hwe || !logical_mask)
-			return ERR_PTR(-EINVAL);
-
-		/*
-		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
-		 * PVC, may want to revisit if performance is needed.
-		 */
-		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
-					    EXEC_QUEUE_FLAG_KERNEL |
-					    EXEC_QUEUE_FLAG_PERMANENT |
-					    EXEC_QUEUE_FLAG_HIGH_PRIORITY, 0);
-	} else {
-		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
-						  XE_ENGINE_CLASS_COPY,
-						  EXEC_QUEUE_FLAG_KERNEL |
-						  EXEC_QUEUE_FLAG_PERMANENT, 0);
-	}
+	m->q = xe_migrate_create_queue(tile, vm);
 	if (IS_ERR(m->q)) {
+		xe_bo_unpin_map_no_vm(m->pt_bo);
 		xe_vm_close_and_put(vm);
+		drm_suballoc_manager_fini(&m->vm_update_sa);
 		return ERR_CAST(m->q);
 	}
 
-- 
2.45.2

