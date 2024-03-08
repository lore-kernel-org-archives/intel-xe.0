Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE87C54E41
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD1C112E96;
	Fri,  8 Mar 2024 05:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MpWya9pr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6999010FCE3
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874474; x=1741410474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IHFk5BfqYCi0egPKWvnaH4O9MDRO4zTQy3X0aiPJR5k=;
 b=MpWya9prZP6g0zzSH02qBD40YU+0H+9xtOz7FvAZsVdQRFl283DmDKVn
 BhDn+UqRYgsM7Gwx0j0orb9kwompGpr3qd5XOgxIEDqnpU9nEQQfGL3hP
 b9ZCVX/hK95WUujmuNBL85BU0zb2mnu2HLFCFr7Y6Qrvadwd09LCdijGA
 8kA76HdplTHriubPogle0Zhp1JRXUnXOtih50qX4GXkYPDLe4g9zoE6Xa
 kZrk0jN7UKd4Fa7B+G/l2nk40WK8R0KE3aCM7uzzudXaMS8gCg4uN3kL0
 W2eQEVSWp7D1SgUk0K2rXayNvZEAb2sM0/K3pzXNh0zRBIrR6rSApIMpP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4761962"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4761962"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10402989"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 08/30] drm/xe:
 s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Date: Thu,  7 Mar 2024 21:07:44 -0800
Message-Id: <20240308050806.577176-9-matthew.brost@intel.com>
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

xe_engine is now xe_exec_queue, adjust this function's name to reflect.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c      | 8 ++++----
 drivers/gpu/drm/xe/xe_migrate.h      | 3 ++-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 3c7d6e4e3917..878e234166aa 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -210,7 +210,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	trace_xe_vma_pf_bind(vma);
 	xe_vm_populate_dummy_rebind(vm, vma);
 	vm->dummy_ops.op.tile_mask = BIT(tile->id);
-	vm->dummy_ops.op.q = xe_tile_migrate_engine(tile);
+	vm->dummy_ops.op.q = xe_tile_migrate_exec_queue(tile);
 	fence = xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
 	if (IS_ERR(fence)) {
 		ret = PTR_ERR(fence);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ee1bb938c493..3fd76f912fda 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -84,15 +84,15 @@ struct xe_migrate {
 #define MAX_PTE_PER_SDI 0x1FE
 
 /**
- * xe_tile_migrate_engine() - Get this tile's migrate engine.
+ * xe_tile_migrate_exec_queue() - Get this tile's migrate exec queue.
  * @tile: The tile.
  *
- * Returns the default migrate engine of this tile.
+ * Returns the default migrate exec queue of this tile.
  * TODO: Perhaps this function is slightly misplaced, and even unneeded?
  *
- * Return: The default migrate engine
+ * Return: The default migrate exec queue
  */
-struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile)
+struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
 {
 	return tile->migrate->q;
 }
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 951f19318ea4..9935ce336bae 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -106,5 +106,6 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 void xe_migrate_wait(struct xe_migrate *m);
 
-struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile);
+struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
+
 #endif
-- 
2.34.1

