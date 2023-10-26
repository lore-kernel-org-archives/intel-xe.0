Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9220FC25B67
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F14810E74C;
	Thu, 26 Oct 2023 04:02:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CEF10E753
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 04:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698292914; x=1729828914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rYFMC54YXcLLRlWiAuwsTDRCNpm+3tjM3JdxJ2n79sc=;
 b=cm80jhrJnRQA2mKNsuCtWimTPZLStznfSMgcC+68eE4XvyCM5WRFGckO
 SbzTObL8ozHSJVf2Ojs3QxywA5RBgMldrOzu/WKoPANno4b/2iU/0q2xU
 maMjKOaYdWoLwTgUx2fdElHvOD+L6A9lJlh1kSA/eLRgMkW/MHDBzo/rA
 wl2FxL+RtPLxMHD9TMUaSgf7ivbyuQpYu3m1sqzL0xOVALpTEkc25sWuF
 1NjHbBnfL3fW3dCldj9VJjQeETTSpkjzdWoL7CNPwYG2+rnnOWcrF52zw
 uBc7ZETnj3URuD09C3SJRso4TXxN+5xDsTxjapsOv/9q7FNAryDj0DuyR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377822016"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377822016"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762682431"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762682431"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 21:02:12 -0700
Message-Id: <20231026040213.1272993-26-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026040213.1272993-1-matthew.brost@intel.com>
References: <20231026040213.1272993-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 25/26] drm/xe: Don't use migrate exec queue for
 page fault binds
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
index f93854c44be5..77fb58ebcae7 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -207,7 +207,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	if (ret)
 		goto unlock_dma_resv;
 	vm->dummy_ops.vops.pt_update_ops[tile->id].q =
-		xe_tile_migrate_exec_queue(tile);
+		xe_tile_migrate_bind_exec_queue(tile);
 	fence = xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
 	xe_vma_ops_free(&vm->dummy_ops.vops);
 	if (IS_ERR(fence)) {
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 81ad8ad67759..7b035570a4f1 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -40,6 +40,8 @@
 struct xe_migrate {
 	/** @q: Default exec queue used for migration */
 	struct xe_exec_queue *q;
+	/** @bind_q: Default exec queue used for binds */
+	struct xe_exec_queue *bind_q;
 	/** @tile: Backpointer to the tile this struct xe_migrate belongs to. */
 	struct xe_tile *tile;
 	/** @job_mutex: Timeline mutex for @eng. */
@@ -87,6 +89,11 @@ struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
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
@@ -105,6 +112,8 @@ static void xe_migrate_fini(struct drm_device *dev, void *arg)
 	mutex_destroy(&m->job_mutex);
 	xe_vm_close_and_put(m->q->vm);
 	xe_exec_queue_put(m->q);
+	if (m->bind_q)
+		xe_exec_queue_put(m->bind_q);
 }
 
 static u64 xe_migrate_vm_addr(u64 slot, u32 level)
@@ -381,6 +390,15 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		if (!hwe || !logical_mask)
 			return ERR_PTR(-EINVAL);
 
+		m->bind_q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
+						 EXEC_QUEUE_FLAG_KERNEL |
+						 EXEC_QUEUE_FLAG_PERMANENT);
+		if (IS_ERR(m->bind_q)) {
+			xe_vm_close_and_put(vm);
+			return ERR_CAST(m->bind_q);
+		}
+		m->bind_q->entity->priority = DRM_SCHED_PRIORITY_KERNEL;
+
 		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
 					    EXEC_QUEUE_FLAG_KERNEL |
 					    EXEC_QUEUE_FLAG_PERMANENT);
@@ -391,6 +409,8 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 						  EXEC_QUEUE_FLAG_PERMANENT);
 	}
 	if (IS_ERR(m->q)) {
+		if (m->bind_q)
+			xe_exec_queue_put(m->bind_q);
 		xe_vm_close_and_put(vm);
 		return ERR_CAST(m->q);
 	}
@@ -1132,7 +1152,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 	struct xe_tile *tile = m->tile;
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
-	bool is_migrate = pt_update_ops->q == m->q;
+	bool is_migrate = pt_update_ops->q == m->bind_q;
 	u64 batch_addr[2] = {0, 0};
 	int err;
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 0b8f307d3970..8e5ce03cdf1f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -118,5 +118,6 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 void xe_migrate_wait(struct xe_migrate *m);
 
 struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
+struct xe_exec_queue *xe_tile_migrate_bind_exec_queue(struct xe_tile *tile);
 
 #endif
-- 
2.34.1

