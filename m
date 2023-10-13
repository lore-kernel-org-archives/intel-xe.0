Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69C6CDB474
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 02:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE0810E587;
	Fri, 13 Oct 2023 02:50:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B2A10E587
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 02:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697165442; x=1728701442;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UW09ez9TtHJlGqYN8soIl2CqW+RCjpVnAxvqX5gFkro=;
 b=mCkTzmILgW3lYWhD9DIpL7ZDF6b/SHOgZRwzIQWaBbpX1/4ZjmfWKTRr
 bJTTvsfnYqt/9Uw4lpFkhV5juaorzes2UcKyzIZlC13jjnLSSIqKl6mLi
 sd6QFQS8/6kj55D9uXkDBncTpZLR0mV4ES2WhigP0LFAgYHT9bl59QkHD
 aOHC3nsep7kbM4DpZlsHfXX3gFL3QnGVJC0d4jRflp0sXST/IUQxF1evS
 3fPfbpvKKiOBLPUXPyU9CIsWhPx0DRZs7WUOe7zSyOGhQA/VDgoeSRz9b
 swC/0ZqOtuXSW15YchhPIyAT+DDSbgliI6o7Vo1WUlKN/30yEHWVCfOcN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382318798"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="382318798"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 19:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="758314803"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="758314803"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 19:50:40 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 08:23:21 +0530
Message-Id: <20231013025321.2972772-1-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/pmu: Enable PMU interface
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Drop interrupt event from PMU as that is not useful and not being used
by any UMD.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c       | 18 ------------------
 drivers/gpu/drm/xe/xe_pmu.c       |  9 ---------
 drivers/gpu/drm/xe/xe_pmu_types.h |  8 --------
 include/uapi/drm/xe_drm.h         | 13 ++++++-------
 4 files changed, 6 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index def9369eb488..4c22b97047b3 100644
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
@@ -351,8 +337,6 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
 
 	xe_display_irq_enable(xe, gu_misc_iir);
 
-	xe_pmu_irq_stats(xe);
-
 	return IRQ_HANDLED;
 }
 
@@ -449,8 +433,6 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	dg1_intr_enable(xe, false);
 	xe_display_irq_enable(xe, gu_misc_iir);
 
-	xe_pmu_irq_stats(xe);
-
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index abfc0b3aeac4..318bbc9c1c9b 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -114,10 +114,6 @@ config_status(struct xe_device *xe, u64 config)
 		return -ENOENT;
 
 	switch (config_counter(config)) {
-	case XE_PMU_INTERRUPTS(0):
-		if (gt_id)
-			return -ENOENT;
-		break;
 	case XE_PMU_RENDER_GROUP_BUSY(0):
 	case XE_PMU_COPY_GROUP_BUSY(0):
 	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
@@ -181,13 +177,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	const unsigned int gt_id = config_gt_id(event->attr.config);
 	const u64 config = event->attr.config;
 	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
-	struct xe_pmu *pmu = &xe->pmu;
 	u64 val;
 
 	switch (config_counter(config)) {
-	case XE_PMU_INTERRUPTS(0):
-		val = READ_ONCE(pmu->irq_count);
-		break;
 	case XE_PMU_RENDER_GROUP_BUSY(0):
 	case XE_PMU_COPY_GROUP_BUSY(0):
 	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
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
index d48d8e3c898c..b183c9693887 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1060,7 +1060,7 @@ struct drm_xe_vm_madvise {
  * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
  * particular event.
  *
- * For example to open the XE_PMU_INTERRUPTS(0):
+ * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
  *
  * .. code-block:: C
  *
@@ -1074,7 +1074,7 @@ struct drm_xe_vm_madvise {
  *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
  *	attr.use_clockid = 1;
  *	attr.clockid = CLOCK_MONOTONIC;
- *	attr.config = XE_PMU_INTERRUPTS(0);
+ *	attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
  *
  *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
  */
@@ -1087,11 +1087,10 @@ struct drm_xe_vm_madvise {
 #define ___XE_PMU_OTHER(gt, x) \
 	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
 
-#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
-#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
-#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
-#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
-#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
+#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 0)
+#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
+#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
+#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 3)
 
 #if defined(__cplusplus)
 }
-- 
2.25.1

