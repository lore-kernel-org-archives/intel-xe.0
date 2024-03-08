Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CA2C54E66
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59598112CB7;
	Fri,  8 Mar 2024 05:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hrr2DM/8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704571127D9
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874475; x=1741410475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lRN3Ojdn3BPlTN5fn88zhbjoTeLrS7Zb0yqli2q/K5s=;
 b=Hrr2DM/8qlfhXDo5mjdeThePxjdFSFQU/ZdxHQ5CJlejxbu/WXGxj6zI
 hXA6cTYXvGIlXmkEJO/YVwPuFo3q3fPyZbUR0tVCGuVYnzyQBEg4JP8jb
 6Dwty2VION5VS9y/CXRvToTX7isPpiDn7vd+yJga2/6Vo/KkZNOcQfnpZ
 InZhrOvhWCSciudCm3gRhoyEY3RVhd2pZPG6IKquNUyyyA+98mQkGA+zw
 eWw67MONi/CQDFB0buQJIxcySHJiaP6JAPs/dVMXAzPOiO69dgiiAkk6M
 9UjuPC0xJnx4EGAz1NzLjBIAtYtcGR3yCR7fUtgoppYSHy0rEtdfUXFCh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4761980"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4761980"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10403043"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 25/30] drm/xe: Add __xe_migrate_update_pgtables_cpu helper
Date: Thu,  7 Mar 2024 21:08:01 -0800
Message-Id: <20240308050806.577176-26-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308050806.577176-1-matthew.brost@intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
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
index c8cf0a71a1a9..cb0d94c8debb 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1170,6 +1170,34 @@ struct migrate_test_params {
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
@@ -1182,7 +1210,6 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&pt_update->vops->pt_update_ops[pt_update->tile_id];
 	int err;
-	u32 j, i;
 
 	if (XE_TEST_ONLY(test && test->force_gpu))
 		return ERR_PTR(-ETIME);
@@ -1194,28 +1221,9 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
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

