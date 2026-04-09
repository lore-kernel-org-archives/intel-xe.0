Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56190F364B6
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 20:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EDA10E12D;
	Thu,  9 Apr 2026 20:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="glI2wPLr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E074D10E83A
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 20:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775767041; x=1807303041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=px42Dzi/weSzwoXyp8rx+vS+sqyf2oz9NvK2G2bFhSs=;
 b=glI2wPLrx1lKpxrgTHHycfXYFCZca1dagMQdG1KnY5k6rqBjk5TX+0bv
 6c1S7AfmxoMI29yjD0CkJ3b8PJlkRS8Ili00xgTqBZgcKT2gUEZ51/Fwq
 aYbn30wKGZVdoYNDXr8W81uR4UqLMiTxdp8NY5t0Xw0YxB2sI9y5M8qd+
 lejt2/BwB7cULt5rsfZxNgEkSNzAOHEXXGWsatflUqDgbxzdOc5/DUbZx
 U7FQYLBMT5utQEpcOfyo9ybe9mgyW5T5t5W16ZwxP7a/RThxklwW70jXE
 kyEpsQkMBiYKaMHIJbXNH/fvo5x3hSR3Sk5J5tGIf8u35jKMUzTo1oxea Q==;
X-CSE-ConnectionGUID: 7lzKknzHQc+E5A9ZB+2Pbw==
X-CSE-MsgGUID: XDrR/rESS1yE1ZZtb5qpVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76692623"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="76692623"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:21 -0700
X-CSE-ConnectionGUID: MVxnVqNcSvqM2j/j2yS13Q==
X-CSE-MsgGUID: uzZ3Tr+JSNKxqvotSrpcbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="227881122"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH 3/5] drm/xe/multi_queue: Capture queue run times for active
 queues
Date: Thu,  9 Apr 2026 13:37:18 -0700
Message-ID: <20260409203714.1887402-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
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

If a queue is currently active on the CS, query the QUEUE TIMESTAMP
register to get an up to date value of the runtime. To do so, ensure
that the primary queue is active and then check if the secondary queue
is executing on the CS.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 +
 drivers/gpu/drm/xe/xe_lrc.c              | 122 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_trace_lrc.h        |  27 +++++
 3 files changed, 133 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 1b4a7e9a703d..af6af6f3f5e8 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -170,6 +170,10 @@
 #define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
 
 #define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
+#define   CURRENT_ACTIVE_QUEUE_ID_MASK		REG_GENMASK(7, 0)
+
+#define RING_QUEUE_TIMESTAMP(base)		XE_REG((base) + 0x4c0)
+#define RING_QUEUE_TIMESTAMP_UDW(base)		XE_REG((base) + 0x4c0 + 4)
 
 #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index be1030c74e21..1e407a761076 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -21,6 +21,7 @@
 #include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
+#include "xe_exec_queue.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
@@ -2638,17 +2639,72 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
 	return 0;
 }
 
-/**
- * xe_lrc_timestamp() - Current ctx timestamp
- * @lrc: Pointer to the lrc.
- *
- * Return latest ctx timestamp. With support for active contexts, the
- * calculation may be slightly racy, so follow a read-again logic to ensure that
- * the context is still active before returning the right timestamp.
- *
- * Returns: New ctx timestamp value
- */
-u64 xe_lrc_timestamp(struct xe_lrc *lrc)
+static struct xe_hw_engine *get_hwe(struct xe_gt *gt, u32 engine_id)
+{
+	u16 class = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
+	u16 instance = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
+	struct xe_hw_engine *hwe = xe_gt_hw_engine(gt, class, instance, false);
+
+	if (xe_gt_WARN_ONCE(gt, !hwe || xe_hw_engine_is_reserved(hwe),
+			    "Unexpected engine class:instance %d:%d for context utilization\n",
+			    class, instance))
+		return NULL;
+
+	return hwe;
+}
+
+static u64 xe_lrc_multi_queue_timestamp(struct xe_lrc *lrc)
+{
+	struct xe_exec_queue *primary_q = lrc->multi_queue.primary;
+	struct xe_lrc *primary_lrc;
+	struct xe_hw_engine *hwe;
+	struct xe_mmio *mmio;
+	u32 engine_id, queue_id;
+	u64 reg_ts = lrc->queue_timestamp;
+
+	/* Ensure we are PF, primary context is active */
+	if (IS_SRIOV_VF(lrc_to_xe(lrc)) ||
+	    !primary_q || !primary_q->lrc[0] ||
+	    xe_lrc_ctx_timestamp(primary_q->lrc[0]) != CONTEXT_ACTIVE)
+		return xe_lrc_queue_timestamp(lrc);
+
+	/* if primary queue is active, we have a valid engine id */
+	primary_lrc = primary_q->lrc[0];
+	engine_id = xe_lrc_engine_id(primary_lrc);
+	hwe = get_hwe(primary_lrc->gt, engine_id);
+	if (!hwe)
+		return xe_lrc_queue_timestamp(lrc);
+
+	mmio = &hwe->gt->mmio;
+	/* check if the queue is currently active and then read timestamp */
+	queue_id = REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK,
+				 xe_mmio_read32(mmio, RING_CSMQDEBUG(hwe->mmio_base)));
+	if (queue_id != lrc->multi_queue.pos)
+		return xe_lrc_queue_timestamp(lrc);
+
+	reg_ts = xe_mmio_read64_2x32(mmio, RING_QUEUE_TIMESTAMP(hwe->mmio_base));
+
+	/* double check queue and primary queue are still active */
+	queue_id = REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK,
+				 xe_mmio_read32(mmio, RING_CSMQDEBUG(hwe->mmio_base)));
+	if (queue_id != lrc->multi_queue.pos ||
+	    xe_lrc_ctx_timestamp(primary_q->lrc[0]) != CONTEXT_ACTIVE)
+		return xe_lrc_queue_timestamp(lrc);
+
+	return reg_ts;
+}
+
+static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
+{
+	*old_ts = lrc->queue_timestamp;
+	lrc->queue_timestamp = xe_lrc_multi_queue_timestamp(lrc);
+
+	trace_xe_lrc_update_queue_timestamp(lrc, *old_ts);
+
+	return lrc->queue_timestamp;
+}
+
+static u64 xe_lrc_single_queue_timestamp(struct xe_lrc *lrc)
 {
 	u64 lrc_ts, reg_ts, new_ts = lrc->ctx_timestamp;
 	u32 engine_id;
@@ -2680,24 +2736,50 @@ u64 xe_lrc_timestamp(struct xe_lrc *lrc)
 	return new_ts;
 }
 
+static u64 xe_lrc_update_ctx_timestamp(struct xe_lrc *lrc, u64 *old_ts)
+{
+	*old_ts = lrc->ctx_timestamp;
+	lrc->ctx_timestamp = xe_lrc_single_queue_timestamp(lrc);
+
+	trace_xe_lrc_update_timestamp(lrc, *old_ts);
+
+	return lrc->ctx_timestamp;
+}
+
+/**
+ * xe_lrc_timestamp() - Current lrc timestamp
+ * @lrc: Pointer to the lrc.
+ *
+ * Return latest lrc timestamp. With support for active contexts/queues, the
+ * calculation may be slightly racy, so follow a read-again logic to ensure that
+ * the context/queue is still active before returning the right timestamp.
+ *
+ * Returns: New lrc timestamp value
+ */
+u64 xe_lrc_timestamp(struct xe_lrc *lrc)
+{
+	if (xe_lrc_is_multi_queue(lrc))
+		return xe_lrc_multi_queue_timestamp(lrc);
+	else
+		return xe_lrc_single_queue_timestamp(lrc);
+}
+
 /**
- * xe_lrc_update_timestamp() - Update ctx timestamp
+ * xe_lrc_update_timestamp() - Update lrc timestamp
  * @lrc: Pointer to the lrc.
  * @old_ts: Old timestamp value
  *
- * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
+ * Populate @old_ts with current saved lrc timestamp, read new lrc timestamp and
  * update saved value.
  *
- * Returns: New ctx timestamp value
+ * Returns: New lrc timestamp value
  */
 u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
 {
-	*old_ts = lrc->ctx_timestamp;
-	lrc->ctx_timestamp = xe_lrc_timestamp(lrc);
-
-	trace_xe_lrc_update_timestamp(lrc, *old_ts);
-
-	return lrc->ctx_timestamp;
+	if (xe_lrc_is_multi_queue(lrc))
+		return xe_lrc_update_multi_queue_timestamp(lrc, old_ts);
+	else
+		return xe_lrc_update_ctx_timestamp(lrc, old_ts);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
index d525cbee1e34..988d360143dc 100644
--- a/drivers/gpu/drm/xe/xe_trace_lrc.h
+++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
@@ -12,6 +12,7 @@
 #include <linux/tracepoint.h>
 #include <linux/types.h>
 
+#include "xe_exec_queue_types.h"
 #include "xe_gt_types.h"
 #include "xe_lrc.h"
 #include "xe_lrc_types.h"
@@ -42,6 +43,32 @@ TRACE_EVENT(xe_lrc_update_timestamp,
 		      __get_str(device_id))
 );
 
+TRACE_EVENT(xe_lrc_update_queue_timestamp,
+	    TP_PROTO(struct xe_lrc *lrc, uint64_t old),
+	    TP_ARGS(lrc, old),
+	    TP_STRUCT__entry(
+		     __field(struct xe_lrc *, lrc)
+		     __field(u8, pos)
+		     __field(u64, old)
+		     __field(u64, new)
+		     __string(name, lrc->fence_ctx.name)
+		     __string(device_id, __dev_name_lrc(lrc))
+	    ),
+
+	    TP_fast_assign(
+		   __entry->lrc	= lrc;
+		   __entry->pos = lrc->multi_queue.pos;
+		   __entry->old = old;
+		   __entry->new = lrc->queue_timestamp;
+		   __assign_str(name);
+		   __assign_str(device_id);
+		   ),
+	    TP_printk("lrc=:%p pos=%d lrc->name=%s old=%llu new=%llu device_id:%s",
+		      __entry->lrc, __entry->pos, __get_str(name),
+		      __entry->old, __entry->new,
+		      __get_str(device_id))
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.43.0

