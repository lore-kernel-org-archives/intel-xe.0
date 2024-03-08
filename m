Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B47C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3D111259C;
	Fri,  8 Mar 2024 05:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLHIXMB9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AE71127FA
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874475; x=1741410475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ho4aGMrmYzuW9AOKXHEgvrlIwOXZLVetaGsxkh06joI=;
 b=XLHIXMB9eY9Dk0UtOvzp+3T+uZRiDga1ysuCamR1c8GLlwkKu4SV8nMA
 dyTfZe4l4KTl1MWTsvut0ZbC6r7l1NoAREFe6k/vbGzNYPr/cYeGNgvyJ
 kJdLKnUpzI9AkOAtIecEW0NpjAQjQweuKpgjy+R/MlHQsg85PFeOU/9rx
 YbtN46jD0d0NQBcL5H2y2YdfJEBLxHT2Esu7hWTsDooQmWC9SCszZTSua
 +AsDYEjF5avT4qhqJJ473NxYXoWYqEcBdDCYaedO5m9kiUXB0EpRqZt5V
 W8+4eSLPLywaMBaLegSqPYTA/9Gt0UoWs5vVZ0+ndaNZv2FgJK4msNEkW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4761982"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4761982"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10403049"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 27/30] drm/xe: Don't use migrate exec queue for page fault
 binds
Date: Thu,  7 Mar 2024 21:08:03 -0800
Message-Id: <20240308050806.577176-28-matthew.brost@intel.com>
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

Now that the CPU is always used for binds even in jobs, CPU bind jobs
can pass GPU jobs in the same exec queue resulting dma-fences signaling
out-of-order. Use a dedicated exec queue for binds issued from page
faults to avoid ordering issues.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c      | 22 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_migrate.h      |  1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index b4320dba7d03..e4f5a80a46fc 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -212,7 +212,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	if (ret)
 		goto unlock_dma_resv;
 	vm->dummy_ops.vops.pt_update_ops[tile->id].q =
-		xe_tile_migrate_exec_queue(tile);
+		xe_tile_migrate_bind_exec_queue(tile);
 	fence = xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
 	xe_vma_ops_free(&vm->dummy_ops.vops);
 	if (IS_ERR(fence)) {
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 949e015250af..00a3c87cc93c 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -41,6 +41,8 @@
 struct xe_migrate {
 	/** @q: Default exec queue used for migration */
 	struct xe_exec_queue *q;
+	/** @bind_q: Default exec queue used for binds */
+	struct xe_exec_queue *bind_q;
 	/** @tile: Backpointer to the tile this struct xe_migrate belongs to. */
 	struct xe_tile *tile;
 	/** @job_mutex: Timeline mutex for @eng. */
@@ -97,6 +99,11 @@ struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
 	return tile->migrate->q;
 }
 
+struct xe_exec_queue *xe_tile_migrate_bind_exec_queue(struct xe_tile *tile)
+{
+	return tile->migrate->bind_q;
+}
+
 static void xe_migrate_fini(struct drm_device *dev, void *arg)
 {
 	struct xe_migrate *m = arg;
@@ -111,6 +118,8 @@ static void xe_migrate_fini(struct drm_device *dev, void *arg)
 	mutex_destroy(&m->job_mutex);
 	xe_vm_close_and_put(m->q->vm);
 	xe_exec_queue_put(m->q);
+	if (m->bind_q)
+		xe_exec_queue_put(m->bind_q);
 }
 
 static u64 xe_migrate_vm_addr(u64 slot, u32 level)
@@ -368,6 +377,15 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		if (!hwe || !logical_mask)
 			return ERR_PTR(-EINVAL);
 
+		m->bind_q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
+						 EXEC_QUEUE_FLAG_KERNEL |
+						 EXEC_QUEUE_FLAG_PERMANENT |
+						 EXEC_QUEUE_FLAG_HIGH_PRIORITY, 0);
+		if (IS_ERR(m->bind_q)) {
+			xe_vm_close_and_put(vm);
+			return ERR_CAST(m->bind_q);
+		}
+
 		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
 					    EXEC_QUEUE_FLAG_KERNEL |
 					    EXEC_QUEUE_FLAG_PERMANENT |
@@ -379,6 +397,8 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 						  EXEC_QUEUE_FLAG_PERMANENT);
 	}
 	if (IS_ERR(m->q)) {
+		if (m->bind_q)
+			xe_exec_queue_put(m->bind_q);
 		xe_vm_close_and_put(vm);
 		return ERR_CAST(m->q);
 	}
@@ -1186,7 +1206,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 	struct xe_tile *tile = m->tile;
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
-	bool is_migrate = pt_update_ops->q == m->q;
+	bool is_migrate = pt_update_ops->q == m->bind_q;
 	int err;
 
 	if (is_migrate)
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index f80c94bb8f4c..701bb27349b0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -119,5 +119,6 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 void xe_migrate_wait(struct xe_migrate *m);
 
 struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
+struct xe_exec_queue *xe_tile_migrate_bind_exec_queue(struct xe_tile *tile);
 
 #endif
-- 
2.34.1

