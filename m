Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA5810F6FD9
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 16:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DD010EB8A;
	Wed,  1 Apr 2026 16:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COhal3eR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C7710E553
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 16:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775060085; x=1806596085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PmjtV1UIisNxsFZ1q5lp9UhJXHNGdDj/KSDnmX2bR+Q=;
 b=COhal3eRc2WWhxJultZQJXqVLZG5OAcz36MzU/nAISW0RAALP7NuKewV
 jLby0ndiKhtVy6bxlt92MxeAquarywxuhuEbfFiReN3ftInQiAQTROrN5
 2v6dspVIQV2Y4fQ9gSHrRHx6E5b7ZXQcsU+UdhG1bMzBT+XEtdM/nSvVl
 Upc4ISo3i4c6KcVGWTdntZT5Afmt7EOalT/pp50ngv3aU/V/AUEp+F1xU
 v6xZEijxqRomhKlPTLIA5jlrM4HDvW0igG2KmM5zGdACwa8OOqi8RkjLr
 IHD2804/BK3jFiBxKRrbwujc/fL02ZMxiZIaVs+g87dPLxA51cYulVg5J A==;
X-CSE-ConnectionGUID: TRGBu5suQY+VEtll+jhXpQ==
X-CSE-MsgGUID: H+BvNMnmQ+Wc7+aDX9q9Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="98717144"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="98717144"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 09:14:44 -0700
X-CSE-ConnectionGUID: hi3puEIOQseynupIu8xBKA==
X-CSE-MsgGUID: RIH5L33xTpGd6Q4nfjEfZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="222354407"
Received: from ksatya-dev.iind.intel.com ([10.190.229.161])
 by fmviesa010.fm.intel.com with ESMTP; 01 Apr 2026 09:14:42 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 2/3] drm/xe/mm: Add batch buffer allocation functions for
 xe_mem_pool manager
Date: Wed,  1 Apr 2026 16:15:27 +0000
Message-ID: <20260401161528.1990499-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401161528.1990499-1-satyanarayana.k.v.p@intel.com>
References: <20260401161528.1990499-1-satyanarayana.k.v.p@intel.com>
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

New APIs xe_pool_bb_alloc(), xe_pool_bb_insert() and
xe_pool_bb_free() are created to manage allocations from the
xe_mem_pool manager.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
V2 -> V3:
- Renamed xe_mm_suballoc to xe_mem_pool.

V1 -> V2:
- Renamed xe_drm_mm to xe_mm_suballoc (Thomas)
- Removed memset from xe_drm_mm_bb_insert() (Matt).
---
 drivers/gpu/drm/xe/xe_bb.c | 58 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bb.h |  6 ++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index b896b6f6615c..26e2430c0dc1 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -10,6 +10,7 @@
 #include "xe_device_types.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
+#include "xe_mem_pool.h"
 #include "xe_sa.h"
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
@@ -172,3 +173,60 @@ void xe_bb_free(struct xe_bb *bb, struct dma_fence *fence)
 	xe_sa_bo_free(bb->bo, fence);
 	kfree(bb);
 }
+
+/**
+ * xe_pool_bb_alloc() - Allocate a new batch buffer structure for drm_mm
+ *
+ * Allocates a new xe_pool_bb structure for use with xe_pool memory
+ * management.
+ *
+ * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
+ */
+struct xe_mem_pool_bb *xe_pool_bb_alloc(void)
+{
+	struct xe_mem_pool_bb *bb = kzalloc_obj(*bb);
+
+	if (!bb)
+		return ERR_PTR(-ENOMEM);
+
+	return bb;
+}
+
+/**
+ * xe_pool_bb_insert() - Initialize a batch buffer and insert a hole
+ * @bb: Batch buffer structure to initialize
+ * @bb_pool: drm_mm manager to allocate from
+ * @dwords: Number of dwords to be allocated
+ *
+ * Initializes the batch buffer by allocating memory from the specified
+ * drm_mm manager.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_pool_bb_insert(struct xe_mem_pool_bb *bb,
+		      struct xe_mem_pool_manager *bb_pool, u32 dwords)
+{
+	int err;
+
+	err = xe_mem_pool_insert_node(bb_pool, &bb->node, 4 * dwords);
+	if (err)
+		return err;
+
+	bb->cs = xe_mem_pool_manager_cpu_addr(bb_pool) + bb->node.start;
+	bb->len = 0;
+
+	return 0;
+}
+
+/**
+ * xe_pool_bb_free() - Free a batch buffer allocated with drm_mm
+ * @bb: Batch buffer structure to free
+ */
+void xe_pool_bb_free(struct xe_mem_pool_bb *bb)
+{
+	if (!bb)
+		return;
+
+	xe_mem_pool_remove_node(&bb->node);
+	kfree(bb);
+}
diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index 231870b24c2f..638d8fc53f1a 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -12,6 +12,8 @@ struct dma_fence;
 
 struct xe_gt;
 struct xe_exec_queue;
+struct xe_mem_pool_bb;
+struct xe_mem_pool_manager;
 struct xe_sa_manager;
 struct xe_sched_job;
 
@@ -24,5 +26,9 @@ struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
 						struct xe_bb *bb, u64 batch_ofs,
 						u32 second_idx);
 void xe_bb_free(struct xe_bb *bb, struct dma_fence *fence);
+struct xe_mem_pool_bb *xe_pool_bb_alloc(void);
+int xe_pool_bb_insert(struct xe_mem_pool_bb *bb,
+		      struct xe_mem_pool_manager *bb_pool, u32 dwords);
+void xe_pool_bb_free(struct xe_mem_pool_bb *bb);
 
 #endif
-- 
2.43.0

