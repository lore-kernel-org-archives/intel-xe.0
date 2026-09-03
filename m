Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351BBC624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C81F10F6FD;
	Thu,  3 Sep 2026 23:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gv69M4yR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F11A10ECCE
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788479929; x=1820015929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tpsJ+7aAa9r/o6x+OJuFHKMm1zamrKPciOD2RXrbAj8=;
 b=gv69M4yRihgwoMguVrHMX91quzflUvi+TBuOEZQ+BH7cmbew9nLE057O
 fMsxubjmSbHRh2HFteOtbN+CFtNlWyIfvgBjGtvwwQbab37FEDGTOSDmi
 zy/l86MmD9jlJTJH4WeU1IC7xot8wGmX9FkPqoUXf1vmxiiQm3FSnQRGe
 Co2gbrJXhLhiwvu75JhbHj6TR++UrksDS5xhTHTDBKWp8juawD/nOWsBy
 s+dEDY2EfjGo3qvBgTGYtDWWh0BT63GbdH6ogy6B3r6T+5/wXaPteGJrk
 dkK1Ma6NJ+YUNwTf8wm1Yr2o1hBW3076a90bQhqc4b3RceM2f4U8t1DNy w==;
X-CSE-ConnectionGUID: n1p4VilqTp2rH1AKoYMURw==
X-CSE-MsgGUID: UHHPhXAzQVO5nZI35LUlMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99637802"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99637802"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:49 -0700
X-CSE-ConnectionGUID: ymxvPprvTJOWszp5LH5mFw==
X-CSE-MsgGUID: Q/jeNy74THKaWN6eRVqSKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="274029034"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 02/25] drm/xe: Add xe_migrate_update_pgtables_cpu_execute
 helper
Date: Thu,  3 Sep 2026 16:58:19 -0700
Message-Id: <20260903235842.3401722-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903235842.3401722-1-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
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
index 149c5fa654e6..084bfee0d047 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1819,6 +1819,38 @@ struct migrate_test_params {
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
@@ -1831,7 +1863,6 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&pt_update->vops->pt_update_ops[pt_update->tile_id];
 	int err;
-	u32 i, j;
 
 	if (XE_TEST_ONLY(test && test->force_gpu))
 		return ERR_PTR(-ETIME);
@@ -1843,28 +1874,9 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
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
2.34.1

