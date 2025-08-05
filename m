Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D11FC87FD2
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6285C10E2C6;
	Tue,  5 Aug 2025 23:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eOY6/Xrb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDDB10E2C6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437325; x=1785973325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2uddxroNQYBhG8vM9USxewlboHL8Sb178ZHXen9p18M=;
 b=eOY6/XrbSh2OzktSZJ8P++VhIbUpuNZIq7Wn24tLC6L4G6azl3iiMvJc
 U2LqxPH7gbhtOM83k3sGp5ztrit+kHXJRoO4YCXIoytN5MVwfqwNrvb0l
 6cI7heoUN+LY/RMfu6Iuvz7pFmLAvRG1F2bgCw+Tmq7FZ4tIhQLUZHU6X
 Q3f5VdPN2arNn6tjzrZk57/q6KIyiJkuxa2ad0sjg45KZfwo7cKjdcg9p
 uaWmJubaXXoLSptGoHp/JZUUeWKhvfz6bBIEPpnppHj1hNf76WksR4Qgr
 PIEcPPKHLrMlUPBkBtFf6OZ1Sk7xx/aeqXvovy23dZUTxR2vFAryRhvHP A==;
X-CSE-ConnectionGUID: mHYKPY70SCyosQweBX/hWg==
X-CSE-MsgGUID: sgRaX4sZRfSRCSffA+BHcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68119058"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68119058"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
X-CSE-ConnectionGUID: 1UWdYU5dSZSXjz/YmQh0eA==
X-CSE-MsgGUID: xGG2GmjmRkiPqq3iVhxpLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164641621"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 02/15] drm/xe: Add __xe_migrate_update_pgtables_cpu helper
Date: Tue,  5 Aug 2025 16:41:47 -0700
Message-Id: <20250805234200.1035609-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805234200.1035609-1-matthew.brost@intel.com>
References: <20250805234200.1035609-1-matthew.brost@intel.com>
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
this helper when a bind jobs dependencies are resolved. Also add some
asserts to the helper while here.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 58 ++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e30e01cf0e28..7e62f96c96e9 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1425,6 +1425,38 @@ struct migrate_test_params {
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
@@ -1437,7 +1469,6 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&pt_update->vops->pt_update_ops[pt_update->tile_id];
 	int err;
-	u32 i, j;
 
 	if (XE_TEST_ONLY(test && test->force_gpu))
 		return ERR_PTR(-ETIME);
@@ -1449,28 +1480,9 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
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
+	__xe_migrate_update_pgtables_cpu(vm, m->tile, ops,
+					 pt_update_ops->ops,
+					 pt_update_ops->num_ops);
 
 	return dma_fence_get_stub();
 }
-- 
2.34.1

