Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8C3C48BED
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D1D112F78;
	Tue,  6 Feb 2024 23:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxL4GN2H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963EA112F64
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707262615; x=1738798615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V3PAWELdsV9fhhMamrcIZI3f/oHVLjiOChjlMJAh1qg=;
 b=cxL4GN2HIHXd0RgMElQqnja6NzOQELpi8SoWsonAehUe/H19FirJ0zvf
 eH2DfR2fuAuvr8KKKdYPMP7uRgFwMaSFMFcGdDLEiUP2tSdBLSd2OBQAP
 8Y+zKvlbf6xib86XQplnwWMIfnE8taEK/H1i+aG5D9PLQclWB7U1VTO9/
 DBs+SUzfc88h7Eat9jWrc1/A+T+VdabrjUYiZg2dBwlLrD7BPd56aEh3e
 p6ve/ka326miMObBIaCv2Fv2CrfzOohjED8lc4TpjN8OVovZ70cDPy5ss
 bQ1Qnzyx3b6c+rgeChxs0G8PmoG2dTDwb7jTwgGLMBCCrHKtvSFNC9N0j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="776802"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="776802"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5793840"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 19/22] drm/xe: Add __xe_migrate_update_pgtables_cpu helper
Date: Tue,  6 Feb 2024 15:37:26 -0800
Message-Id: <20240206233729.3173206-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206233729.3173206-1-matthew.brost@intel.com>
References: <20240206233729.3173206-1-matthew.brost@intel.com>
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

This will help implement CPU binds as the submision backend can call
this helper when a bind jobs dependencies are resolved.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 54 +++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9ea7a6a221b5..780e6eca2c40 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1169,6 +1169,34 @@ struct migrate_test_params {
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
@@ -1181,7 +1209,6 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&pt_update->vops->pt_update_ops[pt_update->tile_id];
 	int err;
-	u32 j, i;
 
 	if (XE_TEST_ONLY(test && test->force_gpu))
 		return ERR_PTR(-ETIME);
@@ -1193,28 +1220,9 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
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

