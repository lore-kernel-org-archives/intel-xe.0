Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95114C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 22:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CACE10E5FE;
	Tue, 13 May 2025 22:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0yRGSi3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B6610E5FE
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 22:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747176604; x=1778712604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MhH9zUzjDlo4CXkle5lcJFOnUv8PHcNLuW88vj62n5A=;
 b=b0yRGSi3KBuIQglooL+XnM9jV63gDmr+oj/ZvXCrF2J5mrJf7eX3Rx/0
 1Jr/TtG/02TxzZ3v8jnmc9YzXCvOIG3xS6TWkEN/VWZkgkHnON9pJcWJM
 yv0DAQ29UdO2HvDmGRJ1HiXxOBvxWKyOEGVUal0qLrSawS0UndAlrr+/l
 TNMe0B4MFWyUrY575+KogTyYA+lxEgNoBg7JqliWaxkcEQMmnRYsC6b/0
 qGkEiQlJFfCj/xuj1CFtveHa8s/ym7uREri2rzo8B8sXH84072zK+hrzg
 G0HQrBf4+Kh9HtJo2Rszk5K3WLcvDGeTxOjRZ0y/n7ZzD1MXz1oXraAuA A==;
X-CSE-ConnectionGUID: h16piD9SQ/iAHzxLz9dX3A==
X-CSE-MsgGUID: lYdF6QuYRcqTfKunIX6Gsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52860518"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="52860518"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 15:50:04 -0700
X-CSE-ConnectionGUID: OzsGwEkCRhWAz+vhOt8esg==
X-CSE-MsgGUID: HzKm806UTrWKzEmMcIOnvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="142789421"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 13 May 2025 15:50:03 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v1 5/7] drm/xe/vf: Rebase HWSP of all contexts after migration
Date: Wed, 14 May 2025 00:49:50 +0200
Message-Id: <20250513224952.701343-6-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513224952.701343-1-tomasz.lis@intel.com>
References: <20250513224952.701343-1-tomasz.lis@intel.com>
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

All contexts require an update due to GGTT range shift, as that
affects their HWSP.

The HW status page of a context contains GGTT references, which
need to be shifted to a new range (or re-computed using the
previously updated vma nodes). The references include ring start
address and indirect state address.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c      | 18 ++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h      |  1 +
 drivers/gpu/drm/xe/xe_sriov_vf.c | 35 ++++++++++++++++++++++++++++++--
 3 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 61a2e87990a9..43e1c18e1769 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1184,6 +1184,24 @@ void xe_lrc_destroy(struct kref *ref)
 	kfree(lrc);
 }
 
+/**
+ * xe_lrc_update_hwctx_regs_with_address - Re-compute GGTT references within given LRC.
+ * @lrc: the &xe_lrc struct instance
+ */
+void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc)
+{
+	struct xe_gt *gt = lrc->fence_ctx.gt;
+
+	if (xe_gt_has_indirect_ring_state(gt)) {
+		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
+				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
+
+		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START,
+					      __xe_lrc_ring_ggtt_addr(lrc));
+	} else
+		xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc));
+}
+
 void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
 {
 	if (xe_lrc_has_indirect_ring_state(lrc))
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index eb6e8de8c939..e7a99cfd0abe 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -88,6 +88,7 @@ bool xe_lrc_ring_is_idle(struct xe_lrc *lrc);
 u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
 u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
 u32 *xe_lrc_regs(struct xe_lrc *lrc);
+void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
 
 u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
 void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index ab91ac68ef5f..016faa29cddd 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -7,12 +7,14 @@
 
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_exec_queue_types.h"
 #include "xe_gt.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_submit.h"
 #include "xe_irq.h"
+#include "xe_lrc.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_sriov_printk.h"
@@ -223,6 +225,34 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
 	return ret;
 }
 
+static void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *eq)
+{
+	int i;
+
+	for (i = 0; i < eq->width; ++i)
+		xe_lrc_update_hwctx_regs_with_address(eq->lrc[i]);
+}
+
+static void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc)
+{
+	struct xe_exec_queue *eq;
+	unsigned long index;
+
+	mutex_lock(&guc->submission_state.lock);
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, eq)
+		xe_exec_queue_contexts_hwsp_rebase(eq);
+	mutex_unlock(&guc->submission_state.lock);
+}
+
+static void vf_post_migration_fixup_contexts(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+
+	for_each_gt(gt, xe, id)
+		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
+}
+
 static void vf_post_migration_fixup_ctb(struct xe_device *xe)
 {
 	struct xe_gt *gt;
@@ -303,9 +333,10 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 		goto fail;
 
 	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
-	/* FIXME: add the recovery steps */
-	if (need_fixups)
+	if (need_fixups) {
+		vf_post_migration_fixup_contexts(xe);
 		vf_post_migration_fixup_ctb(xe);
+	}
 
 	vf_post_migration_kickstart(xe);
 	vf_post_migration_notify_resfix_done(xe);
-- 
2.25.1

