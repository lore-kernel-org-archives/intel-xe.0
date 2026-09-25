Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCC3C98306
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 04:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9D910F85A;
	Fri, 25 Sep 2026 04:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nD/BX9fA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2545D10F825
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 04:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790312012; x=1821848012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O+I8NXQjhvWxvEUzuBNrc5eiKKgWxz1JLcMtIix3ykU=;
 b=nD/BX9fAs4u8VoUIKUPN69hLkUgZ8Zy6ZzuZ1SbrJI+OiBHqpBNkcqYU
 VKZ6CxuXjw9zES4rKB21ahUkFZzp6JW2TQi2C1zkbzc3fBY2hAD2gBLA6
 CmpT0VeMovo4v3p5NvfU7C0w+yKe9iQsGyBhfk/pE7AI3nKOAJy2FeS5Y
 fu6+zZ339/6Pc+pGoWca1TB2Rp34G3sPSnoD6c/+39AdXHOhoi4YWBPB3
 QOnAu17C1Hm3ad9X+71OhmVtFAAbfteFVH88lB18swVadSj2ZJ2QZsMMa
 d/2okh5rrL+MYfw2b6/DQeJZrg+QdzYWBXbJBj4r8rzapQZ30SLawy6sh Q==;
X-CSE-ConnectionGUID: hmVRCzOZSiiHW2cCsv9bMw==
X-CSE-MsgGUID: KuWrPRIaRyWVxHjqC4L8EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90156216"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90156216"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:27 -0700
X-CSE-ConnectionGUID: ygcw80jvR6+caXEUErCsHw==
X-CSE-MsgGUID: iBAyHbSKT06CT9eJaKSs2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="312155502"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v7 03/24] drm/xe: Add xe_migrate_update_pgtables_cpu_execute
 helper
Date: Thu, 24 Sep 2026 21:52:59 -0700
Message-Id: <20260925045320.1325860-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925045320.1325860-1-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
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

---
v7:
 - Fix assert structure (Sashiko)
---
 drivers/gpu/drm/xe/xe_migrate.c | 56 +++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 149c5fa654e6..40e60567cb58 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1819,6 +1819,36 @@ struct migrate_test_params {
 	container_of(_priv, struct migrate_test_params, base)
 #endif
 
+static void
+xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile *tile,
+				       const struct xe_migrate_pt_update_ops *ops,
+				       struct xe_vm_pgtable_update_op *pt_op,
+				       u32 num_ops)
+{
+	u32 j, i;
+
+	for (j = 0; j < num_ops; ++j, ++pt_op) {
+		for (i = 0; i < pt_op->num_entries; i++) {
+			const struct xe_vm_pgtable_update *update =
+				&pt_op->entries[i];
+
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
@@ -1831,7 +1861,6 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&pt_update->vops->pt_update_ops[pt_update->tile_id];
 	int err;
-	u32 i, j;
 
 	if (XE_TEST_ONLY(test && test->force_gpu))
 		return ERR_PTR(-ETIME);
@@ -1843,28 +1872,9 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
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

