Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748D6C04E85
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB92010E4BC;
	Tue,  7 Nov 2023 05:26:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048C410E4B8
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334757; x=1730870757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oGtwSjORN/W7gp8V9zijOyH3R1H7ppQjohLj/SeUGlk=;
 b=nAhQurLEw9uCYLaY5AkfHEEp8IFJCWat1aY9lPiF4hQizVeOvUu2d25N
 GhHqFDUNG+IiIuASUE1wOvQIfA7aWCTzFV6R31uLWFd8dJXqxFnKmmxO0
 JokgSbPM8Xj197wGBfimWN6yWiRb9bQDls3/77PhZLOKmop9gXzXsJGEO
 OBtT1Hj6DqI04ZI1HVYloyVj/k7x4vTKDEyIUgOtOkbLHPqEOX/nkUXJE
 iw986xlEV343UCbCuUHFFP386KF//rutYuH5GP/qm9UYZYOh/pTduG5Bv
 oQZh9fq9RjkpGE8rD43hCPg0HNnChQyQfdIix656FA/D3jZ6ndjFSVMwK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769532"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769532"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689875"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689875"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:56 -0800
Message-Id: <20231107052603.124361-21-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 20/27] drm/xe:
 s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
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
index 6125456373cb..fd9abe4f9c3c 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -205,7 +205,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	trace_xe_vma_pf_bind(vma);
 	xe_vm_populate_dummy_rebind(vm, vma);
 	vm->dummy_ops.op.tile_mask = BIT(tile->id);
-	vm->dummy_ops.op.q = xe_tile_migrate_engine(tile);
+	vm->dummy_ops.op.q = xe_tile_migrate_exec_queue(tile);
 	fence = xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
 	if (IS_ERR(fence)) {
 		ret = PTR_ERR(fence);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e6a31f90ebdb..33c4f8caa38f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -74,15 +74,15 @@ struct xe_migrate {
 #define NUM_PT_PER_BLIT (MAX_PREEMPTDISABLE_TRANSFER / SZ_2M)
 
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
index c729241776ad..8b8eedce8499 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -105,5 +105,6 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 void xe_migrate_wait(struct xe_migrate *m);
 
-struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile);
+struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
+
 #endif
-- 
2.34.1

