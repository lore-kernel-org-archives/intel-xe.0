Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4298CC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 10:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C6610E467;
	Tue, 31 Oct 2023 10:26:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D86C10E467
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 10:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698748003; x=1730284003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1/X8/AMFsWwtVdjwVRiqg88f1r1Y/Qd3ntuMUl/us60=;
 b=PUqOg6R80ZGw0LNjobuoamVPa4tfl9PvbZ768kA6FUjjGQqXDkWBlEDP
 FN/mO0ubnWk7wfct8AI5hJjZ8T2bV8/tqkm2AZdANwp3hEa+cNluEriZU
 QOI4nxaEUjqO2mOuGoB8eug8K3wwLtKo8Itha00DiZ39eR/OWucQdpyGt
 95m68ohGzw6638s1+4wToG2Gm1Jpo58qPUgWlDnilcUUI3r18ckR1J5pu
 2AWZJH22uDrST5A4HvpKvH0cpGtPjda116zQ/1uVYOeqlPw4I+mzBbq19
 xLhaS5y9TzIBPoN5m56VV+uzIAgZirHwnjbgYvESOQup8EfaMEQt/M/hH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="419369804"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="419369804"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 03:26:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="8287218"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa001.jf.intel.com with ESMTP; 31 Oct 2023 03:26:41 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 31 Oct 2023 16:05:25 +0530
Message-Id: <20231031103525.2433645-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231031103525.2433645-1-tejas.upadhyay@intel.com>
References: <20231031103525.2433645-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V11 1/1] drm/xe: Introduce and update counter for
 low level driver errors
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

Introduce low level driver error counter and incrementing on
each occurrence. Focus is on errors that are not functionally
affecting the system and might otherwise go unnoticed and cause
power/performance regressions, so checking for the error
counters should help.

Importantly the intention is not to go adding new error checks,
but to make sure the existing important error conditions are
propagated in terms of counter under respective categories like
below :
- GT
  - GUC COMMUNICATION
  - ENGINE OTHER
  - GT OTHER

- Tile
  - GTT
  - INTERRUPT

Currently this is just a counting of errors, later these
counters will be reported through netlink interface when it is
implemented and ready.

V11:
  - Unify tlb invalidation timeout errs - Michal
  - Improve kernel doc comments - Michal
  - Improve logging output message - Michal
V10:
  - Report and count errors from common place i.e caller - Michal
  - Fixed some minor nits - Michal
V9:
  - Make one patch for API and counter update - Michal
  - Remove counter from places where driver load will fail - Michal
  - Remove extra \n from logging
  - Improve commit message - Aravind/Michal
V8:
  - Correct missed ret value handling
V7:
  - removed double couting of err - Michal
V6:
  - move drm_err to gt and tile specific err API - Aravind
  - Use GTT naming instead of GGTT - Aravind/Niranjana
V5:
  - Dump err_type in string format
V4:
  - dump err_type in drm_err log - Himal
V2:
  - Use modified APIs

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h        | 16 ++++++++
 drivers/gpu/drm/xe/xe_gt.c                  | 41 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h                  |  4 ++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 13 ++++---
 drivers/gpu/drm/xe/xe_gt_types.h            | 18 +++++++++
 drivers/gpu/drm/xe/xe_guc.c                 | 16 +++++++-
 drivers/gpu/drm/xe/xe_guc_ct.c              | 43 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
 drivers/gpu/drm/xe/xe_reg_sr.c              | 22 +++++------
 drivers/gpu/drm/xe/xe_tile.c                | 41 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile.h                |  3 ++
 11 files changed, 198 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index cb537cac1ef9..0626640f06d9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -61,6 +61,19 @@ struct xe_pat_ops;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
+/**
+ * enum xe_tile_drv_err_type - Types of tile level errors
+ * @XE_TILE_DRV_ERR_GTT: Error type for all PPGTT and GTT errors
+ * @XE_TILE_DRV_ERR_INTR: Interrupt errors
+ * @__XE_TILE_DRV_ERR_MAX: Number of defined error types, keep this last
+ */
+enum xe_tile_drv_err_type {
+	XE_TILE_DRV_ERR_GTT,
+	XE_TILE_DRV_ERR_INTR,
+	/* private: number of defined error types, keep this last */
+	__XE_TILE_DRV_ERR_MAX
+};
+
 /**
  * struct xe_mem_region - memory region structure
  * This is used to describe a memory region in xe
@@ -190,6 +203,9 @@ struct xe_tile {
 
 	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
 	struct kobject *sysfs;
+
+	/** @drv_err_cnt: driver error counter for this tile */
+	u32 drv_err_cnt[__XE_TILE_DRV_ERR_MAX];
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d380f67b3365..30a4b837f01a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -49,6 +49,47 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
+static const char *const xe_gt_drv_err_to_str[] = {
+	[XE_GT_DRV_ERR_GUC_COMM] = "GUC COMMUNICATION",
+	[XE_GT_DRV_ERR_ENGINE] = "ENGINE OTHER",
+	[XE_GT_DRV_ERR_OTHERS] = "GT OTHER"
+};
+
+/**
+ * xe_gt_report_driver_error - Count driver error for GT
+ * @gt: GT to count error for
+ * @err: enum error type
+ * @fmt: debug message format to print error
+ * @...: variable args to print error
+ *
+ * Increment the driver error counter in respective error
+ * category for this GT.
+ *
+ * Return: void.
+ */
+void xe_gt_report_driver_error(struct xe_gt *gt,
+			       const enum xe_gt_drv_err_type err,
+			       const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_drv_err_to_str) !=
+		     __XE_GT_DRV_ERR_MAX);
+
+	xe_gt_assert(gt, err >= 0);
+	xe_gt_assert(gt, err < __XE_GT_DRV_ERR_MAX);
+	WRITE_ONCE(gt->drv_err_cnt[err],
+		   READ_ONCE(gt->drv_err_cnt[err]) + 1);
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	xe_gt_err(gt, "[%s] %pV\n", xe_gt_drv_err_to_str[err], &vaf);
+	va_end(args);
+}
+
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 {
 	struct xe_gt *gt;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index caded203a8a0..efd83707b367 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -67,4 +67,8 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
 
+void xe_gt_report_driver_error(struct xe_gt *gt,
+			       const enum xe_gt_drv_err_type err,
+			       const char *fmt, ...);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index bd6005b9d498..8db4018a2c3a 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -9,6 +9,7 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
+#include "xe_tile.h"
 #include "xe_trace.h"
 
 #define TLB_TIMEOUT	(HZ / 4)
@@ -35,8 +36,10 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 			break;
 
 		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
-		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d recv=%d",
-			gt->info.id, fence->seqno, gt->tlb_invalidation.seqno_recv);
+		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
+					    "GT%u: TLB invalidation time'd out, seqno=%d recv=%d",
+					    gt->info.id, fence->seqno,
+					    gt->tlb_invalidation.seqno_recv);
 
 		list_del(&fence->link);
 		fence->base.error = -ETIME;
@@ -317,7 +320,6 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
  */
 int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_guc *guc = &gt->uc.guc;
 	int ret;
 
@@ -329,8 +331,9 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 				 tlb_invalidation_seqno_past(gt, seqno),
 				 TLB_TIMEOUT);
 	if (!ret) {
-		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
-			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
+		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
+					    "GT%u: TLB invalidation time'd out, seqno=%d, recv=%d",
+					    gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
 		return -ETIME;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d3f2793684e2..5bb7a2c6ecc2 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -24,6 +24,21 @@ enum xe_gt_type {
 	XE_GT_TYPE_MEDIA,
 };
 
+/**
+ * enum xe_gt_drv_err_type - Types of GT level errors
+ * @XE_GT_DRV_ERR_GUC_COMM: Driver guc communication errors
+ * @XE_GT_DRV_ERR_ENGINE: Engine execution errors
+ * @XE_GT_DRV_ERR_OTHERS: Other errors like error during save/restore registers
+ * @__XE_GT_DRV_ERR_MAX: Number of defined error types, keep this last
+ */
+enum xe_gt_drv_err_type {
+	XE_GT_DRV_ERR_GUC_COMM,
+	XE_GT_DRV_ERR_ENGINE,
+	XE_GT_DRV_ERR_OTHERS,
+	/* private: number of defined error types, keep this last */
+	__XE_GT_DRV_ERR_MAX
+};
+
 #define XE_MAX_DSS_FUSE_REGS	3
 #define XE_MAX_EU_FUSE_REGS	1
 
@@ -347,6 +362,9 @@ struct xe_gt {
 		/** @oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+
+	/** @drv_err_cnt: driver error counter for this GT */
+	u32 drv_err_cnt[__XE_GT_DRV_ERR_MAX];
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 84f0b5488783..d25fb605e9dc 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -619,8 +619,8 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
 	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
 }
 
-int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
-			  u32 len, u32 *response_buf)
+static int __xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
+				   u32 len, u32 *response_buf)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -724,6 +724,18 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	return FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
 }
 
+int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
+			  u32 len, u32 *response_buf)
+{
+	int ret = __xe_guc_mmio_send_recv(guc, request, len, response_buf);
+
+	if (ret < 0)
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
+					  "MMIO send failed (%pe)",
+					  ERR_PTR(ret));
+	return ret;
+}
+
 int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
 {
 	return xe_guc_mmio_send_recv(guc, request, len, NULL);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index a84e111bb36a..ce8ba923a4cd 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -547,9 +547,9 @@ static void kick_reset(struct xe_guc_ct *ct)
 
 static int dequeue_one_g2h(struct xe_guc_ct *ct);
 
-static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
-			      u32 g2h_len, u32 num_g2h,
-			      struct g2h_fence *g2h_fence)
+static int _guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
+			       u32 g2h_len, u32 num_g2h,
+			       struct g2h_fence *g2h_fence)
 {
 	struct drm_device *drm = &ct_to_xe(ct)->drm;
 	struct drm_printer p = drm_info_printer(drm->dev);
@@ -621,6 +621,20 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	return -EDEADLK;
 }
 
+static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
+			      u32 g2h_len, u32 num_g2h,
+			      struct g2h_fence *g2h_fence)
+{
+	int ret = _guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
+
+	if (ret < 0)
+		xe_gt_report_driver_error(ct_to_gt(ct),
+					  XE_GT_DRV_ERR_GUC_COMM,
+					  "CTB send failed (%pe)",
+					  ERR_PTR(ret));
+	return ret;
+}
+
 static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		       u32 g2h_len, u32 num_g2h, struct g2h_fence *g2h_fence)
 {
@@ -690,8 +704,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
 	return true;
 }
 
-static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
-			    u32 *response_buffer, bool no_fail)
+static int __guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
+			      u32 *response_buffer, bool no_fail)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct g2h_fence g2h_fence;
@@ -755,6 +769,19 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	return ret > 0 ? 0 : ret;
 }
 
+static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
+			    u32 *response_buffer, bool no_fail)
+{
+	int ret = __guc_ct_send_recv(ct, action, len, response_buffer, no_fail);
+
+	if (ret < 0)
+		xe_gt_report_driver_error(ct_to_gt(ct),
+					  XE_GT_DRV_ERR_GUC_COMM,
+					  "CTB send failed (%pe)",
+					  ERR_PTR(ret));
+	return ret;
+}
+
 int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			u32 *response_buffer)
 {
@@ -1133,6 +1160,12 @@ static void g2h_worker_func(struct work_struct *w)
 		ret = dequeue_one_g2h(ct);
 		mutex_unlock(&ct->lock);
 
+		if (ret < 0)
+			xe_gt_report_driver_error(ct_to_gt(ct),
+						  XE_GT_DRV_ERR_GUC_COMM,
+						  "CTB receive failed (%pe)",
+						  ERR_PTR(ret));
+
 		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
 			struct drm_device *drm = &ct_to_xe(ct)->drm;
 			struct drm_printer p = drm_info_printer(drm->dev);
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 21d5273d7e61..29a22cb64825 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -18,6 +18,7 @@
 #include "xe_guc.h"
 #include "xe_hw_engine.h"
 #include "xe_mmio.h"
+#include "xe_tile.h"
 
 /*
  * Interrupt registers for a unit are always consecutive and ordered
@@ -227,8 +228,9 @@ gt_engine_identity(struct xe_device *xe,
 		 !time_after32(local_clock() >> 10, timeout_ts));
 
 	if (unlikely(!(ident & INTR_DATA_VALID))) {
-		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
-			bank, bit, ident);
+		xe_tile_report_driver_error(gt_to_tile(mmio), XE_TILE_DRV_ERR_INTR,
+					    "INTR_IDENTITY_REG%u:%u 0x%08x not valid!",
+					    bank, bit, ident);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 87adefb56024..f2e20e10d927 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -125,12 +125,12 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 	return 0;
 
 fail:
-	xe_gt_err(gt,
-		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
-		  idx, e->clr_bits, e->set_bits,
-		  str_yes_no(e->reg.masked),
-		  str_yes_no(e->reg.mcr),
-		  ret);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS,
+				  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d",
+				  idx, e->clr_bits, e->set_bits,
+				  str_yes_no(e->reg.masked),
+				  str_yes_no(e->reg.mcr),
+				  ret);
 	reg_sr_inc_error(sr);
 
 	return ret;
@@ -207,7 +207,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	return;
 
 err_force_wake:
-	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS, "Failed to apply, err=%d", err);
 }
 
 void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
@@ -234,9 +234,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	p = drm_debug_printer(KBUILD_MODNAME);
 	xa_for_each(&sr->xa, reg, entry) {
 		if (slot == RING_MAX_NONPRIV_SLOTS) {
-			xe_gt_err(gt,
-				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
-				  hwe->name, RING_MAX_NONPRIV_SLOTS);
+			xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_ENGINE,
+						  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more",
+						  hwe->name, RING_MAX_NONPRIV_SLOTS);
 			break;
 		}
 
@@ -259,7 +259,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	return;
 
 err_force_wake:
-	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS, "Failed to apply, err=%d", err);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 131752a57f65..4de9b5e558a2 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -71,6 +71,47 @@
  *  - MOCS and PAT programming
  */
 
+static const char *const xe_tile_drv_err_to_str[] = {
+	[XE_TILE_DRV_ERR_GTT] = "GTT",
+	[XE_TILE_DRV_ERR_INTR] = "INTERRUPT"
+};
+
+/**
+ * xe_tile_report_driver_error - Count driver error for tile
+ * @tile: tile to count error for
+ * @err: Enum error type
+ * @fmt: debug message format to print error
+ * @...: variable args to print error
+ *
+ * Increment the driver error counter in respective error
+ * category for this tile.
+ *
+ * Return: void.
+ */
+void xe_tile_report_driver_error(struct xe_tile *tile,
+				 const enum xe_tile_drv_err_type err,
+				 const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	BUILD_BUG_ON(ARRAY_SIZE(xe_tile_drv_err_to_str) !=
+		     __XE_TILE_DRV_ERR_MAX);
+
+	xe_tile_assert(tile, err >= 0);
+	xe_tile_assert(tile, err < __XE_TILE_DRV_ERR_MAX);
+	WRITE_ONCE(tile->drv_err_cnt[err],
+		   READ_ONCE(tile->drv_err_cnt[err]) + 1);
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	drm_err(&tile->xe->drm, "TILE%u [%s] %pV\n",
+		tile->id, xe_tile_drv_err_to_str[err], &vaf);
+	va_end(args);
+}
+
 /**
  * xe_tile_alloc - Perform per-tile memory allocation
  * @tile: Tile to perform allocations for
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 782c47f8bd45..c79108fb9579 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -14,5 +14,8 @@ int xe_tile_alloc(struct xe_tile *tile);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
+void xe_tile_report_driver_error(struct xe_tile *tile,
+				 const enum xe_tile_drv_err_type err,
+				 const char *fmt, ...);
 
 #endif
-- 
2.25.1

