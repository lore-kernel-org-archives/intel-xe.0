Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7AF108B90B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 12:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D899210EAA4;
	Fri, 20 Mar 2026 12:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cVpb0NmE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4560810EA9A
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 12:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774008717; x=1805544717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KUS15DmN7I/nOIsi4yXoZe02hYlS/Q4XAQpTqB/4/2g=;
 b=cVpb0NmE4knoGdKIv8m4AGPtF8lqT/kApjFjAosYN3pVjzDdFay8kgoT
 zfcQkPk+9V4eqSjnyQ1PBhOvfcCp/TZ3I3M5smNzFfb6GB9Te8fJH0U/T
 VD7G1iDFidiwC8sKz0nO4HGtK3xf7QaGvj2gtJeL1g6ALzjINdc8cSDJb
 x97XbE8pX0auPRU59SVaRIuXGxr8n6EXevg6fAFrEQTWW2uuBPEGL0gzg
 2MtTJowVxvWkRMLFP4I7mA1S6q6NjeeIpbHFZUa8JKG10OBLZJMs+IvtG
 Wf8aqvZRvAsvOcVyTIdNM2FmAABOb25gRPvKelmCrZMnDFZsN7oCuzA/X A==;
X-CSE-ConnectionGUID: qaylgGMFSiqZAoJTTx4V8Q==
X-CSE-MsgGUID: 5OXapUWjSQyvAlYcThvbwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="85717811"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="85717811"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 05:11:48 -0700
X-CSE-ConnectionGUID: B8YGWFzsRI+5igLd/RHt5A==
X-CSE-MsgGUID: mgX05cZYQACna69mRrVmPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227399286"
Received: from ksatya-dev.iind.intel.com ([10.190.229.161])
 by orviesa003.jf.intel.com with ESMTP; 20 Mar 2026 05:11:46 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/3] drm/xe/mm: Add batch buffer allocation functions for
 xe_drm_mm manager
Date: Fri, 20 Mar 2026 12:12:30 +0000
Message-ID: <20260320121231.638189-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
References: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
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

New APIs xe_drm_mm_bb_alloc(), xe_drm_mm_bb_insert() and
xe_drm_mm_bb_free() are created to manage allocations from the xe_drm_mm
manager.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c | 67 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bb.h |  6 ++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index b896b6f6615c..c366ec5b269a 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -8,6 +8,7 @@
 #include "instructions/xe_mi_commands.h"
 #include "xe_assert.h"
 #include "xe_device_types.h"
+#include "xe_drm_mm.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
 #include "xe_sa.h"
@@ -172,3 +173,69 @@ void xe_bb_free(struct xe_bb *bb, struct dma_fence *fence)
 	xe_sa_bo_free(bb->bo, fence);
 	kfree(bb);
 }
+
+/**
+ * xe_drm_mm_bb_alloc() - Allocate a new batch buffer structure for drm_mm
+ *
+ * Allocates a new xe_drm_mm_bb structure for use with xe_drm_mm memory management.
+ *
+ * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
+ */
+struct xe_drm_mm_bb *xe_drm_mm_bb_alloc(void)
+{
+	struct xe_drm_mm_bb *bb = kzalloc(sizeof(*bb), GFP_KERNEL);
+
+	if (!bb)
+		return ERR_PTR(-ENOMEM);
+
+	return bb;
+}
+
+/**
+ * xe_drm_mm_bb_insert() - Initialize a batch buffer and insert a hole
+ * @bb: Batch buffer structure to initialize
+ * @bb_pool: drm_mm manager to allocate from
+ * @dwords: Number of dwords to be allocated
+ *
+ * Initializes the batch buffer by allocating memory from the specified
+ * drm_mm manager.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_drm_mm_bb_insert(struct xe_drm_mm_bb *bb, struct xe_drm_mm_manager *bb_pool, u32 dwords)
+{
+	int err;
+
+	/*
+	 * We need to allocate space for the requested number of dwords &
+	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
+	 * is submitted to HW, we need to make sure that the last instruction
+	 * is not over written when the last chunk of SA is allocated for BB.
+	 * So, this extra DW acts as a guard here.
+	 */
+	err = xe_drm_mm_insert_node(bb_pool, &bb->node, 4 * (dwords + 1));
+	if (err)
+		return err;
+
+	bb->manager = bb_pool;
+	bb->cs = bb_pool->cpu_addr + bb->node.start;
+	bb->len = 0;
+
+	memset(bb->cs, MI_NOOP, 4 * (dwords + 1));
+
+	return 0;
+}
+
+/**
+ * xe_drm_mm_bb_free() - Free a batch buffer allocated with drm_mm
+ * @bb: Batch buffer structure to free
+ */
+void xe_drm_mm_bb_free(struct xe_drm_mm_bb *bb)
+{
+	if (!bb)
+		return;
+
+	xe_drm_mm_remove_node(&bb->node);
+	kfree(bb);
+}
+
diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index 231870b24c2f..d5417005d09b 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -11,6 +11,8 @@
 struct dma_fence;
 
 struct xe_gt;
+struct xe_drm_mm_bb;
+struct xe_drm_mm_manager;
 struct xe_exec_queue;
 struct xe_sa_manager;
 struct xe_sched_job;
@@ -24,5 +26,9 @@ struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
 						struct xe_bb *bb, u64 batch_ofs,
 						u32 second_idx);
 void xe_bb_free(struct xe_bb *bb, struct dma_fence *fence);
+struct xe_drm_mm_bb *xe_drm_mm_bb_alloc(void);
+int xe_drm_mm_bb_insert(struct xe_drm_mm_bb *bb, struct xe_drm_mm_manager
+		      *bb_pool, u32 dwords);
+void xe_drm_mm_bb_free(struct xe_drm_mm_bb *bb);
 
 #endif
-- 
2.43.0

