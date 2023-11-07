Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223AFC4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0525910E4BE;
	Tue,  7 Nov 2023 05:26:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C18E10E4BB
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334758; x=1730870758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TNPK+cg9C4nZAfSKo+//zpEv79Gi1qdM+GrWuhdcU5w=;
 b=UVOXhyTHf3tDNX4novQcGhr0AmT134o8PIhbJzZx2PAJXNIpnS3QhFF8
 YusZ8GwYfmXRyFdO6NV8WxagvMLf+Mgv1rjZzFAOv5gx7ZLSbjxkNQZZ4
 uOp8XdXOWP85MRokpxj+1x0C8AJphFi/QNW6PV+VdhtgPZZOaq4OLAs3t
 c3IMnI+bdWYL3hfkM7o5qejnE+6Se2bpq4p76ITRQ9SADZTOM9BXQNiUY
 W0zt4hchlhfw+4UPYi7fP/Y2BAZVV5VGKmJ00xdVUWuszqqV7fMeE8fIJ
 yQ0a1qK6U28/tOewdvE1lCTZwNW3AT0O1pVLUMW1VX/ZRcMW7HZSxIxbP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769535"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769535"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689884"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689884"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:59 -0800
Message-Id: <20231107052603.124361-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 23/27] drm/xe: Add
 __xe_migrate_update_pgtables_cpu helper
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

This will help implement CPU binds as the submision backend can call
this helper when a bind jobs dependencies are resolved.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 54 +++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 5d7c3dc080a3..d1022d5544b2 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1117,6 +1117,34 @@ struct migrate_test_params {
 	container_of(_priv, struct migrate_test_params, base)
 #endif
 
+static void
+__xe_migrate_update_pgtables_cpu(struct xe_vm *vm, struct xe_tile *tile,
+				 const struct xe_migrate_pt_update_ops *ops,
+				 struct xe_vm_pgtable_update_op *pt_op,
+				 int num_ops)
+{
+	u32 j, i;
+
+	for (j = 0; j < num_ops; ++j, ++pt_op) {
+		for (i = 0; i < pt_op->num_entries; i++) {
+			const struct xe_vm_pgtable_update *update =
+				&pt_op->entries[i];
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
@@ -1129,7 +1157,6 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&pt_update->vops->pt_update_ops[pt_update->tile_id];
 	int err;
-	u32 j, i;
 
 	if (XE_TEST_ONLY(test && test->force_gpu))
 		return ERR_PTR(-ETIME);
@@ -1141,28 +1168,9 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 			return ERR_PTR(err);
 	}
 
-	for (j = 0; j < pt_update_ops->num_ops; ++j) {
-		const struct xe_vm_pgtable_update_op *pt_op =
-			&pt_update_ops->ops[j];
-
-		for (i = 0; i < pt_op->num_entries; i++) {
-			const struct xe_vm_pgtable_update *update =
-				&pt_op->entries[i];
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
+	__xe_migrate_update_pgtables_cpu(vm, m->tile, ops,
+					 pt_update_ops->ops,
+					 pt_update_ops->num_ops);
 
 	return dma_fence_get_stub();
 }
-- 
2.34.1

