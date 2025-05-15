Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F396C2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 22:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C9A10E97B;
	Thu, 15 May 2025 22:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfrlF2Vk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F1F10E97B
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 22:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747347522; x=1778883522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=re1GepHwI4NRtiaKSrzQ6qQXKxYHSruMjkeR20IMABI=;
 b=BfrlF2Vkc3MFD9E8XjfvU6SGkZp1GTJGy7hLTS7qoWSF50ftzrpNY73T
 PxWW/OFKttNPIIPTawdXjMpH5EJkH5sDr0Lms8glQ7ne7hBzxKL5Z9n+p
 NEOImL2tcVvpiWtV+GXeEGNufIGOdRXmBUBYwSo2wOD5w0HmpdkX+NoRm
 UHFhVfSgyTBa3Ps4YjwfUUwhISwV726il3/oRqC0jCf9N/nMrPzz/aRR1
 0mBVpIQRPssZMA57pjbwUCZlRnX/Mv4n7xhvsChnHo9WSzgNRRMDYOza8
 Lvtl9/ge56dVPYYJY1Zj0rX5wCfXjVDYysc/qMPwPUJ4x5Th8GenQNfuo w==;
X-CSE-ConnectionGUID: vuZdNbISRgK+CQMQIuHc6g==
X-CSE-MsgGUID: gVdKu+kCQBu4yorf79gtug==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49237278"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="49237278"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 15:18:42 -0700
X-CSE-ConnectionGUID: F2VNz9Y5TTiuFOmd1j2T1w==
X-CSE-MsgGUID: ZKJGBj95Rxm8Y38YmRnywA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="138242894"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa009.jf.intel.com with ESMTP; 15 May 2025 15:18:39 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 6/7] drm/xe/vf: Rebase MEMIRQ structures for all contexts
 after migration
Date: Fri, 16 May 2025 00:18:26 +0200
Message-Id: <20250515221827.1493032-7-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515221827.1493032-1-tomasz.lis@intel.com>
References: <20250515221827.1493032-1-tomasz.lis@intel.com>
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

All contexts require an update of state data, as the data includes
GGTT references to memirq-related buffers.

Default contexts need these references updated as well, because they
are not refreshed when a new context is created from them.

v2: Update addresses by xe_lrc_write_ctx_reg() rather than
  set_memory_based_intr()

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  4 +++-
 drivers/gpu/drm/xe/xe_lrc.c        | 35 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c   | 13 ++++++++++-
 4 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d03600519b27..9814e29a09e1 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1046,6 +1046,8 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *eq)
 {
 	int i;
 
-	for (i = 0; i < eq->width; ++i)
+	for (i = 0; i < eq->width; ++i) {
+		xe_lrc_update_memirq_regs_with_address(eq->hwe, eq->lrc[i]);
 		xe_lrc_update_hwctx_regs_with_address(eq->lrc[i]);
+	}
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 525565480aef..dc748f6df8ff 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -898,6 +898,41 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
 	return data;
 }
 
+/**
+ * xe_default_lrc_update_memirq_regs_with_address - Re-compute GGTT references in default LRC
+ *   of given engine.
+ * @hwe: the &xe_hw_engine struct instance
+ */
+void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe)
+{
+	struct xe_gt *gt = hwe->gt;
+	u32 *regs;
+
+	if (!gt->default_lrc[hwe->class])
+		return;
+
+	regs = gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE;
+	set_memory_based_intr(regs, hwe);
+}
+
+/**
+ * xe_lrc_update_memirq_regs_with_address - Re-compute GGTT references in mem interrupt data
+ *   for given LRC.
+ * @hwe: the &xe_hw_engine struct instance
+ * @lrc: the &xe_lrc struct instance
+ */
+void xe_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe, struct xe_lrc *lrc)
+{
+	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
+
+	xe_lrc_write_ctx_reg(lrc, CTX_INT_MASK_ENABLE_PTR,
+			     xe_memirq_enable_ptr(memirq));
+	xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
+			     xe_memirq_status_ptr(memirq, hwe));
+	xe_lrc_write_ctx_reg(lrc, CTX_INT_SRC_REPORT_PTR,
+			     xe_memirq_source_ptr(memirq, hwe));
+}
+
 static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 {
 	u64 desc = xe_vm_pdp4_descriptor(vm, gt_to_tile(lrc->gt));
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index e7a99cfd0abe..3f0ae3affafe 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -89,6 +89,8 @@ u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
 u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
 u32 *xe_lrc_regs(struct xe_lrc *lrc);
 void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
+void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
+void xe_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe, struct xe_lrc *lrc);
 
 u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
 void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 0e73b79b3a73..3ac042da4b87 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -225,13 +225,24 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
 	return ret;
 }
 
+static void xe_gt_default_lrcs_hwsp_rebase(struct xe_gt *gt)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	for_each_hw_engine(hwe, gt, id)
+		xe_default_lrc_update_memirq_regs_with_address(hwe);
+}
+
 static void vf_post_migration_fixup_contexts(struct xe_device *xe)
 {
 	struct xe_gt *gt;
 	unsigned int id;
 
-	for_each_gt(gt, xe, id)
+	for_each_gt(gt, xe, id) {
+		xe_gt_default_lrcs_hwsp_rebase(gt);
 		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
+	}
 }
 
 static void vf_post_migration_fixup_ctb(struct xe_device *xe)
-- 
2.25.1

