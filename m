Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C77CD37BF
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CD010E659;
	Wed,  4 Sep 2024 00:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXgrME1s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C0D10E638
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409277; x=1756945277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gd+aZFYXNznc8wG8DRWNlMqVnNdDdHvln/o0Brecc70=;
 b=PXgrME1so3RjkQvbtc/5SrEzxVp6ebonEgC5Wn+pX5tAjZt0DdDeKFcE
 sBzzIMYWssgOqLnL927oxdYKkemHztjYUAXbIMu969BMWfZHYYh2tkrXh
 ktsN52/X+/U21pbrbnVoBIPjMDRKXVB31SxtqLX+LeFgnHuAhJiJ6zXSG
 RZb+yBDkw0D18iqSfWVZlaS6VpMNLuM9Gg8S2vEMsUrpCg6zCoqi2YyW8
 RlJWpfhHFY+s806BJ41PgQLWrUjtqJHCkaYVE0CC1UHDcApxb7h01tA8S
 Kf4Ld3J8L9hz0lvVvit7ZLnwp3uvkxwWbksN2NFTcYvkwHi6K7J82/36C A==;
X-CSE-ConnectionGUID: ksFxrvDfS1eNeoDht4WGfA==
X-CSE-MsgGUID: 2NspbC1WSnigAVAEjEOQfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904820"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904820"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:17 -0700
X-CSE-ConnectionGUID: TAIkDbBSReW+l9lqDKac+Q==
X-CSE-MsgGUID: YPMAiNBrQIS4NXr/PmBuIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944301"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 31/43] drm/xe/oa: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:32 -0700
Message-ID: <20240904002100.2023834-76-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 48 +++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 63286ed8457f..75c3b587954f 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -176,7 +176,7 @@ static const struct xe_oa_regs *__oa_regs(struct xe_oa_stream *stream)
 
 static u32 xe_oa_hw_tail_read(struct xe_oa_stream *stream)
 {
-	return xe_mmio_read32(stream->gt, __oa_regs(stream)->oa_tail_ptr) &
+	return xe_mmio_read32(&stream->gt->mmio, __oa_regs(stream)->oa_tail_ptr) &
 		OAG_OATAILPTR_MASK;
 }
 
@@ -366,7 +366,7 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 		struct xe_reg oaheadptr = __oa_regs(stream)->oa_head_ptr;
 
 		spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
-		xe_mmio_write32(stream->gt, oaheadptr,
+		xe_mmio_write32(&stream->gt->mmio, oaheadptr,
 				(head + gtt_offset) & OAG_OAHEADPTR_MASK);
 		stream->oa_buffer.head = head;
 		spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
@@ -377,22 +377,23 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 
 static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 {
+	struct xe_mmio *mmio = &stream->gt->mmio;
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
 	u32 oa_buf = gtt_offset | OABUFFER_SIZE_16M | OAG_OABUFFER_MEMORY_SELECT;
 	unsigned long flags;
 
 	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
 
-	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_status, 0);
-	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_head_ptr,
+	xe_mmio_write32(mmio, __oa_regs(stream)->oa_status, 0);
+	xe_mmio_write32(mmio, __oa_regs(stream)->oa_head_ptr,
 			gtt_offset & OAG_OAHEADPTR_MASK);
 	stream->oa_buffer.head = 0;
 	/*
 	 * PRM says: "This MMIO must be set before the OATAILPTR register and after the
 	 * OAHEADPTR register. This is to enable proper functionality of the overflow bit".
 	 */
-	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_buffer, oa_buf);
-	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_tail_ptr,
+	xe_mmio_write32(mmio, __oa_regs(stream)->oa_buffer, oa_buf);
+	xe_mmio_write32(mmio, __oa_regs(stream)->oa_tail_ptr,
 			gtt_offset & OAG_OATAILPTR_MASK);
 
 	/* Mark that we need updated tail pointer to read from */
@@ -440,21 +441,23 @@ static void xe_oa_enable(struct xe_oa_stream *stream)
 	val = __format_to_oactrl(format, regs->oa_ctrl_counter_select_mask) |
 		__oa_ccs_select(stream) | OAG_OACONTROL_OA_COUNTER_ENABLE;
 
-	xe_mmio_write32(stream->gt, regs->oa_ctrl, val);
+	xe_mmio_write32(&stream->gt->mmio, regs->oa_ctrl, val);
 }
 
 static void xe_oa_disable(struct xe_oa_stream *stream)
 {
-	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctrl, 0);
-	if (xe_mmio_wait32(stream->gt, __oa_regs(stream)->oa_ctrl,
+	struct xe_mmio *mmio = &stream->gt->mmio;
+
+	xe_mmio_write32(mmio, __oa_regs(stream)->oa_ctrl, 0);
+	if (xe_mmio_wait32(mmio, __oa_regs(stream)->oa_ctrl,
 			   OAG_OACONTROL_OA_COUNTER_ENABLE, 0, 50000, NULL, false))
 		drm_err(&stream->oa->xe->drm,
 			"wait for OA to be disabled timed out\n");
 
 	if (GRAPHICS_VERx100(stream->oa->xe) <= 1270 && GRAPHICS_VERx100(stream->oa->xe) != 1260) {
 		/* <= XE_METEORLAKE except XE_PVC */
-		xe_mmio_write32(stream->gt, OA_TLB_INV_CR, 1);
-		if (xe_mmio_wait32(stream->gt, OA_TLB_INV_CR, 1, 0, 50000, NULL, false))
+		xe_mmio_write32(mmio, OA_TLB_INV_CR, 1);
+		if (xe_mmio_wait32(mmio, OA_TLB_INV_CR, 1, 0, 50000, NULL, false))
 			drm_err(&stream->oa->xe->drm,
 				"wait for OA tlb invalidate timed out\n");
 	}
@@ -477,7 +480,7 @@ static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
 			size_t count, size_t *offset)
 {
 	/* Only clear our bits to avoid side-effects */
-	stream->oa_status = xe_mmio_rmw32(stream->gt, __oa_regs(stream)->oa_status,
+	stream->oa_status = xe_mmio_rmw32(&stream->gt->mmio, __oa_regs(stream)->oa_status,
 					  OASTATUS_RELEVANT_BITS, 0);
 	/*
 	 * Signal to userspace that there is non-zero OA status to read via
@@ -748,7 +751,8 @@ static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
 	int err;
 
 	/* Set ccs select to enable programming of OAC_OACONTROL */
-	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctrl, __oa_ccs_select(stream));
+	xe_mmio_write32(&stream->gt->mmio, __oa_regs(stream)->oa_ctrl,
+			__oa_ccs_select(stream));
 
 	/* Modify stream hwe context image with regs_context */
 	err = xe_oa_modify_ctx_image(stream, stream->exec_q->lrc[0],
@@ -784,6 +788,7 @@ static u32 oag_configure_mmio_trigger(const struct xe_oa_stream *stream, bool en
 
 static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 {
+	struct xe_mmio *mmio = &stream->gt->mmio;
 	u32 sqcnt1;
 
 	/*
@@ -797,7 +802,7 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
 	}
 
-	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_debug,
+	xe_mmio_write32(mmio, __oa_regs(stream)->oa_debug,
 			oag_configure_mmio_trigger(stream, false));
 
 	/* disable the context save/restore or OAR counters */
@@ -805,13 +810,13 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 		xe_oa_configure_oa_context(stream, false);
 
 	/* Make sure we disable noa to save power. */
-	xe_mmio_rmw32(stream->gt, RPM_CONFIG1, GT_NOA_ENABLE, 0);
+	xe_mmio_rmw32(mmio, RPM_CONFIG1, GT_NOA_ENABLE, 0);
 
 	sqcnt1 = SQCNT1_PMON_ENABLE |
 		 (HAS_OA_BPC_REPORTING(stream->oa->xe) ? SQCNT1_OABPC : 0);
 
 	/* Reset PMON Enable to save power. */
-	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, sqcnt1, 0);
+	xe_mmio_rmw32(mmio, XELPMP_SQCNT1, sqcnt1, 0);
 }
 
 static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
@@ -939,6 +944,7 @@ static u32 oag_report_ctx_switches(const struct xe_oa_stream *stream)
 
 static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 {
+	struct xe_mmio *mmio = &stream->gt->mmio;
 	u32 oa_debug, sqcnt1;
 	int ret;
 
@@ -965,12 +971,12 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 			OAG_OA_DEBUG_DISABLE_START_TRG_2_COUNT_QUAL |
 			OAG_OA_DEBUG_DISABLE_START_TRG_1_COUNT_QUAL;
 
-	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_debug,
+	xe_mmio_write32(mmio, __oa_regs(stream)->oa_debug,
 			_MASKED_BIT_ENABLE(oa_debug) |
 			oag_report_ctx_switches(stream) |
 			oag_configure_mmio_trigger(stream, true));
 
-	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctx_ctrl, stream->periodic ?
+	xe_mmio_write32(mmio, __oa_regs(stream)->oa_ctx_ctrl, stream->periodic ?
 			(OAG_OAGLBCTXCTRL_COUNTER_RESUME |
 			 OAG_OAGLBCTXCTRL_TIMER_ENABLE |
 			 REG_FIELD_PREP(OAG_OAGLBCTXCTRL_TIMER_PERIOD_MASK,
@@ -984,7 +990,7 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 	sqcnt1 = SQCNT1_PMON_ENABLE |
 		 (HAS_OA_BPC_REPORTING(stream->oa->xe) ? SQCNT1_OABPC : 0);
 
-	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, 0, sqcnt1);
+	xe_mmio_rmw32(mmio, XELPMP_SQCNT1, 0, sqcnt1);
 
 	/* Configure OAR/OAC */
 	if (stream->exec_q) {
@@ -1533,7 +1539,7 @@ u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
 	case XE_PVC:
 	case XE_METEORLAKE:
 		xe_pm_runtime_get(gt_to_xe(gt));
-		reg = xe_mmio_read32(gt, RPM_CONFIG0);
+		reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
 		xe_pm_runtime_put(gt_to_xe(gt));
 
 		shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
@@ -2349,7 +2355,7 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
 		}
 
 		/* Ensure MMIO trigger remains disabled till there is a stream */
-		xe_mmio_write32(gt, u->regs.oa_debug,
+		xe_mmio_write32(&gt->mmio, u->regs.oa_debug,
 				oag_configure_mmio_trigger(NULL, false));
 
 		/* Set oa_unit_ids now to ensure ids remain contiguous */
-- 
2.45.2

