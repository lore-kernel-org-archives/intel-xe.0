Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2FCC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BFD10E9FE;
	Fri,  3 Nov 2023 14:35:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF5410E9F4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022155; x=1730558155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1YEUy2gf07QX7q1JicGDd/me+AeJhNL/JdLnhOhCd1U=;
 b=GFI+gWM9W14X1tQV6KNZShWcRsOvLhDNBo8og1p79Ltpo871mKEytAp/
 GAUHMMo4riCgBJ7PV9Nsjgir+Q1HoLBiogHzEbadzUaoOpV15TEqd+NyH
 9BJQrVMgfk6norOeoyk4+dKLYMOXvNZso205riSc/PC9AznIs3Zqlf25v
 FnSUQ2WjlnFwfP5qcGQ3ZN2pFyLRrkWgUjUiC4gkFE6nQuTUOPrVKMPBb
 0YDVVTU0KPlk5Zw8Yp/MgcjmcqPaPMqZfO3horNOYcdrds2fwJQ0a7f6R
 Evx6MzDyObp5KyIfFALIEn2LFCus8fOqBlgr4UsC2i/Fy+QmFzRd7H7b2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843410"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843410"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832487"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832487"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:36 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:29 +0000
Message-Id: <20231103143456.7-24-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 23/50] drm/xe/pmu: Drop interrupt pmu event
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Drop interrupt event from PMU as that is not useful and not being used
by any UMD.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c       | 18 ------------------
 drivers/gpu/drm/xe/xe_pmu.c       |  9 ---------
 drivers/gpu/drm/xe/xe_pmu_types.h |  8 --------
 include/uapi/drm/xe_drm.h         | 13 ++++++-------
 4 files changed, 6 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 21d5273d7e61..205147511aa0 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -27,20 +27,6 @@
 #define IIR(offset)				XE_REG(offset + 0x8)
 #define IER(offset)				XE_REG(offset + 0xc)
 
-/*
- * Interrupt statistic for PMU. Increments the counter only if the
- * interrupt originated from the GPU so interrupts from a device which
- * shares the interrupt line are not accounted.
- */
-static __always_inline void xe_pmu_irq_stats(struct xe_device *xe)
-{
-	/*
-	 * A clever compiler translates that into INC. A not so clever one
-	 * should at least prevent store tearing.
-	 */
-	WRITE_ONCE(xe->pmu.irq_count, xe->pmu.irq_count + 1);
-}
-
 static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
 {
 	u32 val = xe_mmio_read32(mmio, reg);
@@ -360,8 +346,6 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
 
 	xe_display_irq_enable(xe, gu_misc_iir);
 
-	xe_pmu_irq_stats(xe);
-
 	return IRQ_HANDLED;
 }
 
@@ -458,8 +442,6 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	dg1_intr_enable(xe, false);
 	xe_display_irq_enable(xe, gu_misc_iir);
 
-	xe_pmu_irq_stats(xe);
-
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 8378ca3007d9..3e13e48a4f45 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -114,10 +114,6 @@ config_status(struct xe_device *xe, u64 config)
 		return -ENOENT;
 
 	switch (config_counter(config)) {
-	case DRM_XE_PMU_INTERRUPTS(0):
-		if (gt_id)
-			return -ENOENT;
-		break;
 	case DRM_XE_PMU_RENDER_GROUP_BUSY(0):
 	case DRM_XE_PMU_COPY_GROUP_BUSY(0):
 	case DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
@@ -181,13 +177,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	const unsigned int gt_id = config_gt_id(event->attr.config);
 	const u64 config = event->attr.config;
 	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
-	struct xe_pmu *pmu = &xe->pmu;
 	u64 val;
 
 	switch (config_counter(config)) {
-	case DRM_XE_PMU_INTERRUPTS(0):
-		val = READ_ONCE(pmu->irq_count);
-		break;
 	case DRM_XE_PMU_RENDER_GROUP_BUSY(0):
 	case DRM_XE_PMU_COPY_GROUP_BUSY(0):
 	case DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
@@ -361,7 +353,6 @@ create_event_attributes(struct xe_pmu *pmu)
 		const char *unit;
 		bool global;
 	} events[] = {
-		__global_event(0, "interrupts", NULL),
 		__event(1, "render-group-busy", "ns"),
 		__event(2, "copy-group-busy", "ns"),
 		__event(3, "media-group-busy", "ns"),
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index 4ccc7e9042f6..9cadbd243f57 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -51,14 +51,6 @@ struct xe_pmu {
 	 *
 	 */
 	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
-	/**
-	 * @irq_count: Number of interrupts
-	 *
-	 * Intentionally unsigned long to avoid atomics or heuristics on 32bit.
-	 * 4e9 interrupts are a lot and postprocessing can really deal with an
-	 * occasional wraparound easily. It's 32bit after all.
-	 */
-	unsigned long irq_count;
 	/**
 	 * @events_attr_group: Device events attribute group.
 	 */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b39b1c2646de..ec50007fef64 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1102,7 +1102,7 @@ struct drm_xe_wait_user_fence {
  * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
  * particular event.
  *
- * For example to open the DRM_XE_PMU_INTERRUPTS(0):
+ * For example to open the DRM_XE_PMU_RENDER_GROUP_BUSY(0):
  *
  * .. code-block:: C
  *
@@ -1116,7 +1116,7 @@ struct drm_xe_wait_user_fence {
  *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
  *	attr.use_clockid = 1;
  *	attr.clockid = CLOCK_MONOTONIC;
- *	attr.config = DRM_XE_PMU_INTERRUPTS(0);
+ *	attr.config = DRM_XE_PMU_RENDER_GROUP_BUSY(0);
  *
  *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
  */
@@ -1129,11 +1129,10 @@ struct drm_xe_wait_user_fence {
 #define ___XE_PMU_OTHER(gt, x) \
 	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
 
-#define DRM_XE_PMU_INTERRUPTS(gt)		___XE_PMU_OTHER(gt, 0)
-#define DRM_XE_PMU_RENDER_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 1)
-#define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
-#define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
-#define DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
+#define DRM_XE_PMU_RENDER_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 0)
+#define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
+#define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
+#define DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 3)
 
 #if defined(__cplusplus)
 }
-- 
2.34.1

