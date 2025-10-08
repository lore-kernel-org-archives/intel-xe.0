Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563DBCCD18B
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 18:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE9910E896;
	Wed,  8 Oct 2025 18:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q3ocn7MR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE23A10E886
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 18:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759946708; x=1791482708;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wJXRWjTpmhcJWqRYUyMyOhwzyfuzQVEQ221Z9ULHkCU=;
 b=Q3ocn7MR9PEwOeo0bso3FPnHwfAiuhO8KS5g9IaRCoRnwbF1+BHpGXul
 HoVtD1lf1IOuaRniCRm4DRcozi/QJE4UZMRiCxs9NzVbBJpz9RkFzK5PA
 Oq232Op9aPhOD9kTXXW6kJCG+nBlBblzEci9D6TYi3rhhsNovzjxjNJCi
 0lSfFbEP5FiMaq2vkjKb34gQLHU1AFGw2et5jo3JUXq2zInJbK/ikd0f+
 f5aptHQJ8P6LVxi7D4iFmWaMtjgqcqSfmrwRzy266NYTp8SWnM60N1cmg
 gDoaogPM+HlXE3hy29aVdaHUE2im/oHT6/o+HFPtxBJjokMVGeXFhKmlI Q==;
X-CSE-ConnectionGUID: eO/4DshgQMeopp2/TAwe8w==
X-CSE-MsgGUID: m/QBEbyBQIGPi/dq9nI5qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62067518"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62067518"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
X-CSE-ConnectionGUID: JvaZpdQeTOGGHd7dkatbCA==
X-CSE-MsgGUID: o98GWTkGT+G0k008Mrb0qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217593724"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 08/34] drm/xe/vf: Add xe_gt_recovery_pending helper
Date: Wed,  8 Oct 2025 11:04:34 -0700
Message-Id: <20251008180500.3261209-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008180500.3261209-1-matthew.brost@intel.com>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
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

Add xe_gt_recovery_pending helper.

This helper serves as the singular point to determine whether a GT
recovery is currently in progress. Expected callers include the GuC CT
layer and the GuC submission layer. Atomically visable as soon as vCPU
are unhalted until VF recovery completes.

v3:
 - Add GT layer xe_gt_recovery_inprogress (Michal)
 - Don't blow up in memirq not enabled (CI)
 - Add __memirq_received with clear argument (Michal)
 - xe_memirq_sw_int_0_irq_pending rename (Michal)
 - Use offset in xe_memirq_sw_int_0_irq_pending (Michal)
v4:
 - Refactor xe_gt_recovery_inprogress logic around memirq (Michal)
v5:
 - s/inprogress/pending (Michal)
v7:
 - Fix typos, adjust comment (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.h                | 13 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 28 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 10 +++++
 drivers/gpu/drm/xe/xe_memirq.c            | 48 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_memirq.h            |  2 +
 6 files changed, 99 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 41880979f4de..5df2ffe3ff83 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -12,6 +12,7 @@
 
 #include "xe_device.h"
 #include "xe_device_types.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_hw_engine.h"
 
 #define for_each_hw_engine(hwe__, gt__, id__) \
@@ -124,4 +125,16 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
 
+/**
+ * xe_gt_recovery_pending() - GT recovery pending
+ * @gt: the &xe_gt
+ *
+ * Return: True if GT recovery in pending, False otherwise
+ */
+static inline bool xe_gt_recovery_pending(struct xe_gt *gt)
+{
+	return IS_SRIOV_VF(gt_to_xe(gt)) &&
+		xe_gt_sriov_vf_recovery_pending(gt);
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 0461d5513487..43cb5fd7b222 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -26,6 +26,7 @@
 #include "xe_guc_hxg_helpers.h"
 #include "xe_guc_relay.h"
 #include "xe_lrc.h"
+#include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_sriov_vf.h"
@@ -776,6 +777,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 
 	xe_gt_assert(gt, IS_SRIOV_VF(xe));
+	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_pending(gt));
 
 	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
 	/*
@@ -1118,3 +1120,29 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 	drm_printf(p, "\thandshake:\t%u.%u\n",
 		   pf_version->major, pf_version->minor);
 }
+
+/**
+ * xe_gt_sriov_vf_recovery_pending() - VF post migration recovery pending
+ * @gt: the &xe_gt
+ *
+ * The return value of this function must be immediately visible upon vCPU
+ * unhalt and must persist until RESFIX_DONE is issued. This guarantee is
+ * currently implemented only for platforms that support memirq. If non-memirq
+ * platforms begin to support VF migration, this function will need to be
+ * updated accordingly.
+ *
+ * Return: True if VF post migration recovery is pending, False otherwise
+ */
+bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt)
+{
+	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	/* early detection until recovery starts */
+	if (xe_device_uses_memirq(gt_to_xe(gt)) &&
+	    xe_memirq_guc_sw_int_0_irq_pending(memirq, &gt->uc.guc))
+		return true;
+
+	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 0af1dc769fe0..b91ae857e983 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -25,6 +25,8 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
 int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
+bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
+
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 298dedf4b009..1dfef60ec044 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -46,6 +46,14 @@ struct xe_gt_sriov_vf_runtime {
 	} *regs;
 };
 
+/**
+ * xe_gt_sriov_vf_migration - VF migration data.
+ */
+struct xe_gt_sriov_vf_migration {
+	/** @recovery_inprogress: VF post migration recovery in progress */
+	bool recovery_inprogress;
+};
+
 /**
  * struct xe_gt_sriov_vf - GT level VF virtualization data.
  */
@@ -58,6 +66,8 @@ struct xe_gt_sriov_vf {
 	struct xe_gt_sriov_vf_selfconfig self_config;
 	/** @runtime: runtime data retrieved from the PF. */
 	struct xe_gt_sriov_vf_runtime runtime;
+	/** @migration: migration data for the VF. */
+	struct xe_gt_sriov_vf_migration migration;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 0affede05820..2ef9d9aab264 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -397,8 +397,9 @@ void xe_memirq_postinstall(struct xe_memirq *memirq)
 		memirq_set_enable(memirq, true);
 }
 
-static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
-			    u16 offset, const char *name)
+static bool __memirq_received(struct xe_memirq *memirq,
+			      struct iosys_map *vector, u16 offset,
+			      const char *name, bool clear)
 {
 	u8 value;
 
@@ -408,12 +409,26 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
 			memirq_err_ratelimited(memirq,
 					       "Unexpected memirq value %#x from %s at %u\n",
 					       value, name, offset);
-		iosys_map_wr(vector, offset, u8, 0x00);
+		if (clear)
+			iosys_map_wr(vector, offset, u8, 0x00);
 	}
 
 	return value;
 }
 
+static bool memirq_received_noclear(struct xe_memirq *memirq,
+				    struct iosys_map *vector,
+				    u16 offset, const char *name)
+{
+	return __memirq_received(memirq, vector, offset, name, false);
+}
+
+static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
+			    u16 offset, const char *name)
+{
+	return __memirq_received(memirq, vector, offset, name, true);
+}
+
 static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *status,
 				   struct xe_hw_engine *hwe)
 {
@@ -433,8 +448,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
 	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
 		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
 
-	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
+	/*
+	 * This is a software interrupt that must be cleared after it's consumed
+	 * to avoid race conditions where xe_gt_sriov_vf_recovery_pending()
+	 * returns false.
+	 */
+	if (memirq_received_noclear(memirq, status, ilog2(GUC_INTR_SW_INT_0),
+				    name)) {
 		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);
+		iosys_map_wr(status, ilog2(GUC_INTR_SW_INT_0), u8, 0x00);
+	}
 }
 
 /**
@@ -459,6 +482,23 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
 	}
 }
 
+/**
+ * xe_memirq_guc_sw_int_0_irq_pending() - SW_INT_0 IRQ is pending
+ * @memirq: the &xe_memirq
+ * @guc: the &xe_guc to check for IRQ
+ *
+ * Return: True if SW_INT_0 IRQ is pending on @guc, False otherwise
+ */
+bool xe_memirq_guc_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	u32 offset = xe_gt_is_media_type(gt) ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
+	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&memirq->status, offset * SZ_16);
+
+	return memirq_received_noclear(memirq, &map, ilog2(GUC_INTR_SW_INT_0),
+				       guc_name(guc));
+}
+
 /**
  * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
  * @memirq: the &xe_memirq
diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
index 06130650e9d6..e25d2234ab87 100644
--- a/drivers/gpu/drm/xe/xe_memirq.h
+++ b/drivers/gpu/drm/xe/xe_memirq.h
@@ -25,4 +25,6 @@ void xe_memirq_handler(struct xe_memirq *memirq);
 
 int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
 
+bool xe_memirq_guc_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc *guc);
+
 #endif
-- 
2.34.1

