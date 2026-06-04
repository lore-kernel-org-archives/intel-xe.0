Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F20CD6E79
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 16:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0204611A165;
	Thu,  4 Jun 2026 16:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Plefu+RM";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D3511A15B
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 16:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780589215;
 bh=dFPQRaHzSCbu6FjKDEcmQkybCau5hlhTFjVuZUKUgtM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Plefu+RMe53VU9q5TgYCs9g6aOuur/cg4Qfuxjz/AEL+1IRYsqwAqZvpL2rB985F0
 P8cKVrypb8hcUAQqsLfKUErTyIq4Fx88w/eeMXlvQBYy2lxhQK6g+Pov+RwbLHDtXL
 JE/VDFH004rcB+1gueESDsmtEB5ZUaU5KE4WHOSlm28BtwOi+ycklh+fS8E043qeKu
 2x/foo339YaogbubSXeSiG82sg9L65tnvxwEUwxXBiHDsyKzyO63xs89HzuihWC/Zv
 J8Z0mSDis4TpXjWuqWp9ZclV5IzbaPSbS8eXtzCKQ8PRHK6mEyrDigcyhEAN/WqiFZ
 g4w3V4QLSnMqA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [CI 02/24] drm/xe: Add xe_migrate_update_pgtables_cpu_execute helper
Date: Thu,  4 Jun 2026 18:06:31 +0200
Message-ID: <20260604160655.50036-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604160655.50036-1-dev@lankhorst.se>
References: <20260604160655.50036-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add the xe_migrate_update_pgtables_cpu_execute helper, which performs
the CPU-side page-table update. This will support implementing CPU
binds, as the submission backend can call this helper once a bind job’s
dependencies are resolved. While here, add assertions to provide basic
sanity checks on tht function arguments.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-3-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_migrate.c | 58 ++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index d63e977b0e528..cc92633809b6d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1800,6 +1800,38 @@ struct migrate_test_params {
 	container_of(_priv, struct migrate_test_params, base)
 #endif
 
+static void
+xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile *tile,
+				       const struct xe_migrate_pt_update_ops *ops,
+				       struct xe_vm_pgtable_update_op *pt_op,
+				       int num_ops)
+{
+	u32 j, i;
+
+	for (j = 0; j < num_ops; ++j, ++pt_op) {
+		for (i = 0; i < pt_op->num_entries; i++) {
+			const struct xe_vm_pgtable_update *update =
+				&pt_op->entries[i];
+
+			xe_tile_assert(tile, update);
+			xe_tile_assert(tile, update->pt_bo);
+			xe_tile_assert(tile, !iosys_map_is_null(&update->pt_bo->vmap));
+
+			if (pt_op->bind)
+				ops->populate(tile, &update->pt_bo->vmap,
+					      NULL, update->ofs, update->qwords,
+					      update);
+			else
+				ops->clear(vm, tile, &update->pt_bo->vmap,
+					   NULL, update->ofs, update->qwords,
+					   update);
+		}
+	}
+
+	trace_xe_vm_cpu_bind(vm);
+	xe_device_wmb(vm->xe);
+}
+
 static struct dma_fence *
 xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 			       struct xe_migrate_pt_update *pt_update)
@@ -1812,7 +1844,6 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&pt_update->vops->pt_update_ops[pt_update->tile_id];
 	int err;
-	u32 i, j;
 
 	if (XE_TEST_ONLY(test && test->force_gpu))
 		return ERR_PTR(-ETIME);
@@ -1824,28 +1855,9 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 			return ERR_PTR(err);
 	}
 
-	for (i = 0; i < pt_update_ops->num_ops; ++i) {
-		const struct xe_vm_pgtable_update_op *pt_op =
-			&pt_update_ops->ops[i];
-
-		for (j = 0; j < pt_op->num_entries; j++) {
-			const struct xe_vm_pgtable_update *update =
-				&pt_op->entries[j];
-
-			if (pt_op->bind)
-				ops->populate(m->tile,
-					      &update->pt_bo->vmap, NULL,
-					      update->ofs, update->qwords,
-					      update);
-			else
-				ops->clear(vm, m->tile,
-					   &update->pt_bo->vmap, NULL,
-					   update->ofs, update->qwords, update);
-		}
-	}
-
-	trace_xe_vm_cpu_bind(vm);
-	xe_device_wmb(vm->xe);
+	xe_migrate_update_pgtables_cpu_execute(vm, m->tile, ops,
+					       pt_update_ops->ops,
+					       pt_update_ops->num_ops);
 
 	return dma_fence_get_stub();
 }
-- 
2.53.0

