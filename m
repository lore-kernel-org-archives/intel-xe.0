Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E91C25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C5C10E754;
	Thu, 26 Oct 2023 04:01:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D80B10E753
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 04:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698292914; x=1729828914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OsBQov6j8OfAoZO/25s8TYm0j+Ui0t7jLAAhh4gsmgU=;
 b=E+sG3qoYHYzXcILw0St+firSb2kZ0zyEtDns52iA0lgX9klbzUYMIATO
 0G0oNNGypWzQO3qLG5tb4ZWinkdUeXnaSzEs+24Z8mOSwV8mLdvdRqdc6
 FoaT3OVgZbhCmW8nhaDygIx0RWB8ODhvkpRpYhGH5K8TKnuomFje5NGPT
 7kheFXlP1k8JdcUpqc8xm4oLFXWotLCMRETLXGUlQkc+YCmIA39BcncBZ
 KbibI0aNK61e7A2ROtkaj6ReA7vK9FA9EZ29PMtuN+hEoN5zl1aXnTD6K
 g1R9XVZRKcm9OQ3yEv5xgNr1HO0nYHBLxnuFtE0Ndmn/MSKzgjkJkJH3j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377822009"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377822009"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762682406"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762682406"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 21:02:06 -0700
Message-Id: <20231026040213.1272993-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026040213.1272993-1-matthew.brost@intel.com>
References: <20231026040213.1272993-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 19/26] drm/xe:
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
index 82df72f71696..e0fd96fa0160 100644
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
index b4baecde60e6..188b9119aed9 100644
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

