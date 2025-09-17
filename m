Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F03CAC59F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 03:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B7510E654;
	Wed, 17 Sep 2025 03:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLUQ7S4l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDCC10E409
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 03:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758080782; x=1789616782;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EZpWUJjpQmYfkenkxYYtTxRQKo4mUVyeDLg3WcW0Gg8=;
 b=BLUQ7S4lA/NBX6UPEUEZE+D3LkczFJjsmSXfetwAgi3qxleCr7J1da3V
 qNOfw5txMPY2r6mr2+AE0t4Kl2vh79/fChIaORfAyV+b4krOhl2Mqy/0l
 ydqBkgsOd3zWPscXY1E2BXgrYC75FUuXymMfFM1G9yOaJ+Y9TijtwY7h+
 8hsKeViXS3DHtn2fKs7PnnOw4jCXHMh78cxvr53sut7lFXgSE4ee5ZaTi
 ymCsGNGaX4CBSk6SgzkXiY2YTAXfBjhMBqHlgZr7s++zew38hSJD6Xqc5
 p2AeLEVkN7tDY4OcprEOZaK5HkWdykLPZfEysHsmStewIf6OZb5hCjfMv g==;
X-CSE-ConnectionGUID: GF72RdvNTg2zrBuCm7Z6cQ==
X-CSE-MsgGUID: qPO+sNcHRL6y4HYkjcCqmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71060792"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="71060792"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:21 -0700
X-CSE-ConnectionGUID: Wo3cqIwZSbe/UOP8OzBgvg==
X-CSE-MsgGUID: 56HB6dvARqW9Jycu6L2vhw==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 10/28] drm/xe/vf: Add xe_gt_sriov_vf_recovery_inprogress helper
Date: Tue, 16 Sep 2025 20:45:57 -0700
Message-Id: <20250917034615.3977603-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917034615.3977603-1-matthew.brost@intel.com>
References: <20250917034615.3977603-1-matthew.brost@intel.com>
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

Add xe_gt_sriov_vf_recovery_inprogress helper.

This helper serves as the singular point to determine whether a VF
post-migration recovery is currently in progress. Expected callers
include the GuC CT layer and the GuC submission layer. Atomically
visable as soon as vCPU are unhalted until VF recovery completes.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 17 ++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 10 +++++
 drivers/gpu/drm/xe/xe_memirq.c            | 48 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_memirq.h            |  3 ++
 5 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 016c867e5e2b..c9d0e32e7a15 100644
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
@@ -828,6 +829,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 
 	xe_gt_assert(gt, IS_SRIOV_VF(xe));
+	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
 
 	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
 	/*
@@ -1172,3 +1174,18 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
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
+	return IS_SRIOV_VF(gt_to_xe(gt)) &&
+		(xe_memirq_vf_recovery_irq_pending(memirq, &gt->uc.guc) ||
+		 READ_ONCE(gt->sriov.vf.migration.recovery_inprogress));
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
index d95857bd789b..7b10b8e1e10e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -49,6 +49,14 @@ struct xe_gt_sriov_vf_runtime {
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
@@ -61,6 +69,8 @@ struct xe_gt_sriov_vf {
 	struct xe_gt_sriov_vf_selfconfig self_config;
 	/** @runtime: runtime data retrieved from the PF. */
 	struct xe_gt_sriov_vf_runtime runtime;
+	/** @migration: migration data for the VF. */
+	struct xe_gt_sriov_vf_migration migration;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 49c45ec3e83c..94d5d6859aab 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -398,6 +398,23 @@ void xe_memirq_postinstall(struct xe_memirq *memirq)
 		memirq_set_enable(memirq, true);
 }
 
+static bool memirq_received_noclear(struct xe_memirq *memirq,
+				    struct iosys_map *vector,
+				    u16 offset, const char *name)
+{
+	u8 value;
+
+	value = iosys_map_rd(vector, offset, u8);
+	if (value) {
+		if (value != 0xff)
+			memirq_err_ratelimited(memirq,
+					       "Unexpected memirq value %#x from %s at %u\n",
+					       value, name, offset);
+	}
+
+	return value;
+}
+
 static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
 			    u16 offset, const char *name)
 {
@@ -434,8 +451,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
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
@@ -460,6 +485,27 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
 	}
 }
 
+/**
+ * xe_memirq_vf_recovery_irq_pending() - VF recovery IRQ is pending
+ * @memirq: the &xe_memirq
+ * @guc: the &xe_guc to check for IRQ
+ *
+ * Return: True if VF recovery IRQ is pending on @guc, False otherwise
+ */
+bool xe_memirq_vf_recovery_irq_pending(struct xe_memirq *memirq,
+				       struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct iosys_map map;
+
+	if (xe_gt_is_media_type(gt))
+		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_MGUC) * SZ_16);
+	else
+		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_GUC) * SZ_16);
+
+	return iosys_map_rd(&map, ilog2(GUC_INTR_SW_INT_0), u8);
+}
+
 /**
  * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
  * @memirq: the &xe_memirq
diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
index 06130650e9d6..476b8cba179d 100644
--- a/drivers/gpu/drm/xe/xe_memirq.h
+++ b/drivers/gpu/drm/xe/xe_memirq.h
@@ -25,4 +25,7 @@ void xe_memirq_handler(struct xe_memirq *memirq);
 
 int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
 
+bool xe_memirq_vf_recovery_irq_pending(struct xe_memirq *memirq,
+				       struct xe_guc *guc);
+
 #endif
-- 
2.34.1

