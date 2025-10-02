Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A572BCCD196
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 05:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB6610E7AA;
	Thu,  2 Oct 2025 05:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SIIEcutE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744E310E788
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 05:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384448; x=1790920448;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JhPs4BUUyX6jTdVElPB4+QTJKtBerFJ8cZUYHdvTF5I=;
 b=SIIEcutEaVSc3rnKAOrbZuwcBHsqX95h+fqguw2eECh2dlL3BIPCLW/S
 pmPLZQ+1yYSeT913XintAsRymVqU/K9rXWbDFuF4z/lfWCdI9sxSYw1RC
 /K7QuiPU8Dcb2v60lX+DMBa8o8mQvuX75NDavFQXY0IY8/X+qiNLiuObu
 YqJvJucxOe16A9CGdi4eKgavJY450Dz0xXRgTyAMocVcNfgwg48xFKt1s
 UY8RBL94pDCglBAnr0fvArQKt++r0J/v0ar+zh9rSYRgqA3c9N5ZfyskO
 nwXNmxUFR3kNdJql6L5OZu1nWHnSyordpeMgI/LSlZcnKChDIvgQzG8vj A==;
X-CSE-ConnectionGUID: 5TZvNa7vTrSNdfxIcTIjbw==
X-CSE-MsgGUID: V8gCPAwKRlCQU6vTUauE9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65304504"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65304504"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
X-CSE-ConnectionGUID: kv2OQb0+SvKNj6hY/L387Q==
X-CSE-MsgGUID: qiw/33lNQg6HDbd+Nfu5uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216083535"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 11/34] drm/xe/vf: Add xe_gt_recovery_inprogress helper
Date: Wed,  1 Oct 2025 22:53:39 -0700
Message-Id: <20251002055402.1865880-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002055402.1865880-1-matthew.brost@intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
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

Add xe_gt_recovery_inprogress helper.

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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.h                | 13 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 22 +++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 10 +++++
 drivers/gpu/drm/xe/xe_memirq.c            | 48 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_memirq.h            |  2 +
 6 files changed, 93 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 41880979f4de..ee0239b2f48c 100644
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
+ * xe_gt_recovery_inprogress() - GT recovery in progress
+ * @gt: the &xe_gt
+ *
+ * Return: True if GT recovery in progress, False otherwise
+ */
+static inline bool xe_gt_recovery_inprogress(struct xe_gt *gt)
+{
+	return IS_SRIOV_VF(gt_to_xe(gt)) &&
+		xe_gt_sriov_vf_recovery_inprogress(gt);
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 0461d5513487..c2be8fc14c88 100644
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
+	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
 
 	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
 	/*
@@ -1118,3 +1120,23 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 	drm_printf(p, "\thandshake:\t%u.%u\n",
 		   pf_version->major, pf_version->minor);
 }
+
+/**
+ * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
+ * @gt: the &xe_gt
+ *
+ * Return: True if VF post migration recovery in progress, False otherwise
+ */
+bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
+{
+	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	/* early detection until recovery starts */
+	if (xe_device_uses_memirq(gt_to_xe(gt)) &&
+	    xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc))
+		return true;
+
+	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 0af1dc769fe0..bb5f8eace19b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -25,6 +25,8 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
 int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
+bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
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
index 49c45ec3e83c..2391993634b5 100644
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
+	 * conditions where xe_gt_sriov_vf_recovery_inprogress() returns false.
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
+ * xe_memirq_sw_int_0_irq_pending() - SW_INT_0 IRQ is pending
+ * @memirq: the &xe_memirq
+ * @guc: the &xe_guc to check for IRQ
+ *
+ * Return: True if SW_INT_0 IRQ is pending on @guc, False otherwise
+ */
+bool xe_memirq_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc *guc)
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
index 06130650e9d6..a6fffdadef88 100644
--- a/drivers/gpu/drm/xe/xe_memirq.h
+++ b/drivers/gpu/drm/xe/xe_memirq.h
@@ -25,4 +25,6 @@ void xe_memirq_handler(struct xe_memirq *memirq);
 
 int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
 
+bool xe_memirq_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc *guc);
+
 #endif
-- 
2.34.1

