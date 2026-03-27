Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054F510ED640
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 10:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A979510EC9C;
	Fri, 27 Mar 2026 10:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQz+4dx3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888E610EC8B
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 10:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774606321; x=1806142321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xVo54m1YUoOtqXDkp0Qxl7eKDw2CbMLBctGQphzDcrk=;
 b=PQz+4dx3+jg++qJD7pYoRTnLlihdeWW2vvnwP7WsmF+QrZZZ7waK11OE
 BjNnoBNIqbedeLY5t+XL2gVOFP2MSXsI34liKu8D3dOCQseeH4jckP4Et
 5Gvw5tbJuMe1oya8sQTGSPblA9LES3sp/xHFcpclxUQ8RcDv20ppVGJQN
 spUMVchv4PgpnaJ1XP7MJND6A0tU98xtvJRmSF+aN6xreE1vc+kuamjBt
 7XExkR68d2p94TIsoLAs45ZEJK9if25COLoDr09R+8oOutUmtXF95KG/G
 EJjGmk2axcR8DNpWs4l8ZuIPKgl+IHJc9l4Tp5yYSDI5jnepZt399Q5Aa Q==;
X-CSE-ConnectionGUID: qDHNieqrSlOABK9Z5ZUVNw==
X-CSE-MsgGUID: 1yJDlOn9R0uPNUqVnDy2kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75792679"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="75792679"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 03:12:01 -0700
X-CSE-ConnectionGUID: SjQPF+h5SyC1tjuvaCXcfQ==
X-CSE-MsgGUID: AaU8G0RnSaaxJTKuLk4YkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="230197953"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa005.jf.intel.com with ESMTP; 27 Mar 2026 03:12:00 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 2/3] drm/xe/mm: Add batch buffer allocation functions for
 xe_mm_suballoc manager
Date: Fri, 27 Mar 2026 10:11:49 +0000
Message-ID: <20260327101146.3826819-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327101146.3826819-5-satyanarayana.k.v.p@intel.com>
References: <20260327101146.3826819-5-satyanarayana.k.v.p@intel.com>
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

New APIs xe_mm_suballoc_bb_alloc(), xe_mm_suballoc_bb_insert() and
xe_mm_suballoc_bb_free() are created to manage allocations from the
xe_mm_suablloc manager.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
V1 -> V2:
- Renamed xe_drm_mm to xe_mm_suballoc (Thomas)
- Removed memset from xe_drm_mm_bb_insert() (Matt).
---
 drivers/gpu/drm/xe/xe_bb.c | 67 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bb.h |  6 ++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index b896b6f6615c..1b6990539bdc 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -10,6 +10,7 @@
 #include "xe_device_types.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
+#include "xe_mm_suballoc.h"
 #include "xe_sa.h"
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
@@ -172,3 +173,69 @@ void xe_bb_free(struct xe_bb *bb, struct dma_fence *fence)
 	xe_sa_bo_free(bb->bo, fence);
 	kfree(bb);
 }
+
+/**
+ * xe_mm_suballoc_bb_alloc() - Allocate a new batch buffer structure for drm_mm
+ *
+ * Allocates a new xe_mm_suballoc_bb structure for use with xe_mm_suballoc memory
+ * management.
+ *
+ * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
+ */
+struct xe_mm_suballoc_bb *xe_mm_suballoc_bb_alloc(void)
+{
+	struct xe_mm_suballoc_bb *bb = kzalloc(sizeof(*bb), GFP_KERNEL);
+
+	if (!bb)
+		return ERR_PTR(-ENOMEM);
+
+	return bb;
+}
+
+/**
+ * xe_mm_suballoc_bb_insert() - Initialize a batch buffer and insert a hole
+ * @bb: Batch buffer structure to initialize
+ * @bb_pool: drm_mm manager to allocate from
+ * @dwords: Number of dwords to be allocated
+ *
+ * Initializes the batch buffer by allocating memory from the specified
+ * drm_mm manager.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_mm_suballoc_bb_insert(struct xe_mm_suballoc_bb *bb,
+			     struct xe_mm_suballoc_manager *bb_pool,
+			     u32 dwords)
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
+	err = xe_mm_suballoc_insert_node(bb_pool, &bb->node, 4 * (dwords + 1));
+	if (err)
+		return err;
+
+	bb->manager = bb_pool;
+	bb->cs = bb_pool->cpu_addr + bb->node.start;
+	bb->len = 0;
+
+	return 0;
+}
+
+/**
+ * xe_mm_suballoc_bb_free() - Free a batch buffer allocated with drm_mm
+ * @bb: Batch buffer structure to free
+ */
+void xe_mm_suballoc_bb_free(struct xe_mm_suballoc_bb *bb)
+{
+	if (!bb)
+		return;
+
+	xe_mm_suballoc_remove_node(&bb->node);
+	kfree(bb);
+}
diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index 231870b24c2f..e587aacc4dbd 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -12,6 +12,8 @@ struct dma_fence;
 
 struct xe_gt;
 struct xe_exec_queue;
+struct xe_mm_suballoc_bb;
+struct xe_mm_suballoc_manager;
 struct xe_sa_manager;
 struct xe_sched_job;
 
@@ -24,5 +26,9 @@ struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
 						struct xe_bb *bb, u64 batch_ofs,
 						u32 second_idx);
 void xe_bb_free(struct xe_bb *bb, struct dma_fence *fence);
+struct xe_mm_suballoc_bb *xe_mm_suballoc_bb_alloc(void);
+int xe_mm_suballoc_bb_insert(struct xe_mm_suballoc_bb *bb,
+			     struct xe_mm_suballoc_manager *bb_pool, u32 dwords);
+void xe_mm_suballoc_bb_free(struct xe_mm_suballoc_bb *bb);
 
 #endif
-- 
2.43.0

