Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C160BCCD188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA0F10E366;
	Mon,  6 Oct 2025 11:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OTd6B1e1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B7710E346
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 11:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759749044; x=1791285044;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8KIvvAQ628AJ1n4cVBA6I0BJudGy6gpsWkvWM3ziPGU=;
 b=OTd6B1e1Os8tpA26XZApV2ie1lRHaH3MicSeI1XMeGJgRC6w3NBBpTWg
 gWe0mfp0qtH6m8QYQCVX4MicmN/s0t4CDBqjX6I8FFANGLpfibfBNSwu7
 BKCbwwQgy1fEMSnQiSbe1tKaexEq2NgyRGGMFPeInakZuSJzLe+OXOWnu
 Fn/FL2BuI9RhRJw5smq3KZKP+acX6JCgc9AM988dGLp6WHejMeyZdYc0/
 PtcnnXihqY+lKWEfMhYUNWQDbQSrGshtJXOYWC3IWlRpY9swiRIwFked+
 GU+UKiYDgD+vvWU/EOtk7Y/eQJsaLEebYJGatGpC5j8t5MhZCU4E4ztHe A==;
X-CSE-ConnectionGUID: /Xdx9hLTSp62lNCdmOoeDA==
X-CSE-MsgGUID: ZZamtoIyTa+zgXY4X9sHbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="73020383"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="73020383"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:10:43 -0700
X-CSE-ConnectionGUID: fui9itaTTnWgHIOnqFE9hQ==
X-CSE-MsgGUID: cgIFq0poSvigHGTyvoelRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="180655222"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:10:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 07/30] drm/xe/vf: Add xe_gt_recovery_pending helper
Date: Mon,  6 Oct 2025 04:10:15 -0700
Message-Id: <20251006111038.2234860-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006111038.2234860-1-matthew.brost@intel.com>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.h                | 13 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 27 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 10 +++++
 drivers/gpu/drm/xe/xe_memirq.c            | 48 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_memirq.h            |  2 +
 6 files changed, 98 insertions(+), 4 deletions(-)

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
index 0461d5513487..86131ee481dc 100644
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
@@ -1118,3 +1120,28 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 	drm_printf(p, "\thandshake:\t%u.%u\n",
 		   pf_version->major, pf_version->minor);
 }
+
+/**
+ * xe_gt_sriov_vf_recovery_pending() - VF post migration recovery pending
+ * @gt: the &xe_gt
+ *
+ * This function's return value must be immediately visable upon vCPU unhalt and
+ * be persisent until RESFIX_DONE is issued. This guarnetee is only coded for
+ * platforms which support memirq, if non-memirq platforms support VF migration
+ * this function will need to be updated.
+ *
+ * Return: True if VF post migration recovery in pending, False otherwise
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
index 49c45ec3e83c..56acfdd77266 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -398,8 +398,9 @@ void xe_memirq_postinstall(struct xe_memirq *memirq)
 		memirq_set_enable(memirq, true);
 }
 
-static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
-			    u16 offset, const char *name)
+static bool __memirq_received(struct xe_memirq *memirq,
+			      struct iosys_map *vector, u16 offset,
+			      const char *name, bool clear)
 {
 	u8 value;
 
@@ -409,12 +410,26 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
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
@@ -434,8 +449,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
 	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
 		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
 
-	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
+	/*
+	 * We must wait to perform the clear operation until after
+	 * xe_gt_sriov_vf_start_migration_recovery() runs, to avoid race
+	 * conditions where xe_gt_sriov_vf_recovery_pending() returns false.
+	 */
+	if (memirq_received_noclear(memirq, status, ilog2(GUC_INTR_SW_INT_0),
+				    name)) {
 		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);
+		iosys_map_wr(status, ilog2(GUC_INTR_SW_INT_0), u8, 0x00);
+	}
 }
 
 /**
@@ -460,6 +483,23 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
 	}
 }
 
+/**
+ * xe_memirq_guc__sw_int_0_irq_pending() - SW_INT_0 IRQ is pending
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

