Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E38BCD3430
	for <intel-xe@archiver.kernel.org>; Sat,  2 May 2026 00:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3624210F657;
	Sat,  2 May 2026 00:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9Drx64W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA0D10E50E
 for <intel-xe@lists.freedesktop.org>; Sat,  2 May 2026 00:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777683221; x=1809219221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tMDIM1mwxCuEDzldQO77p5/jEHILYbngXyUonah2n7w=;
 b=N9Drx64WXdGWVAdv4fwOi3N59zLq0LQs1kanOqoa0XpdENqTF7BzIHCs
 NX7aiJv9YmqvI2Xk2LpjjIcpP4bVxrCm7xRxYAHxuuxNE8Qxg96SDJ3zg
 rQOC9mxuRuMaeddVbXSuPR0DMGYMWqFHGT/ULjrXkiytc6jTaeohvKHru
 +Qh5dRAbMfI9okI7TW2gmWqwT4TocRUidMF26aXzggg8rUwRmBIGLpsho
 doF/run8Seq01cNP5kE+2nSXOdzPVgRFucNILvEBwl5J+EalzAitBc/Qs
 QjlEfxwV+EonXZOOQwStPRYkPtq7hPhXMHWodN9TlzYbuow0wxhlev686 g==;
X-CSE-ConnectionGUID: B6dsNnTQTpWwyXZa4BfCew==
X-CSE-MsgGUID: HnC3SOYlS2mXrbyCiQk89w==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78841561"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="78841561"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:40 -0700
X-CSE-ConnectionGUID: 2AHFvsk3RhW9TrB0RnC2MA==
X-CSE-MsgGUID: ZIxBHqbySZaDl4XaSyMqgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="228510953"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v2 6/9] drm/xe/multi_queue: Capture queue run times for active
 queues
Date: Fri,  1 May 2026 17:53:39 -0700
Message-ID: <20260502005332.3135977-17-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
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
v2:
- Move trace to a separate patch (Stuart)
- Refactor multi queue timestamp logic (Matt/Niranjana)
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 +
 drivers/gpu/drm/xe/xe_lrc.c              | 115 +++++++++++++++++++----
 2 files changed, 99 insertions(+), 20 deletions(-)

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
index 92419e5058fd..023202be5d52 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -21,6 +21,7 @@
 #include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
+#include "xe_exec_queue.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
 #include "xe_gt_clock.h"
@@ -2655,17 +2656,65 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
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
+static u64 get_queue_timestamp(struct xe_hw_engine *hwe)
+{
+	return xe_mmio_read64_2x32(&hwe->gt->mmio,
+				   RING_QUEUE_TIMESTAMP(hwe->mmio_base));
+}
+
+static u32 get_queue_id(struct xe_hw_engine *hwe)
+{
+	u32 val = xe_mmio_read32(&hwe->gt->mmio,
+				 RING_CSMQDEBUG(hwe->mmio_base));
+
+	return REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK, val);
+}
+
+static bool context_active(struct xe_lrc *lrc)
+{
+	return xe_lrc_ctx_timestamp(lrc) == CONTEXT_ACTIVE;
+}
+
+static u64 xe_lrc_multi_queue_timestamp(struct xe_lrc *lrc)
+{
+	struct xe_lrc *primary_lrc = lrc->multi_queue.primary_lrc;
+	struct xe_hw_engine *hwe;
+	u64 reg_queue_ts = lrc->queue_timestamp;
+
+	if (IS_SRIOV_VF(lrc_to_xe(lrc)))
+		return xe_lrc_queue_timestamp(lrc);
+
+	if (!primary_lrc || !context_active(primary_lrc))
+		return xe_lrc_queue_timestamp(lrc);
+
+	/* WA BB populates engine id in PPHWSP of primary context only */
+	hwe = engine_id_to_hwe(primary_lrc->gt, xe_lrc_engine_id(primary_lrc));
+	if (!hwe)
+		return xe_lrc_queue_timestamp(lrc);
+
+	if (get_queue_id(hwe) != lrc->multi_queue.pos)
+		return xe_lrc_queue_timestamp(lrc);
+
+	/* queue is active, so store the queue timestamp register */
+	reg_queue_ts = get_queue_timestamp(hwe);
+
+	/* double check queue and primary queue are both still active */
+	if (get_queue_id(hwe) != lrc->multi_queue.pos ||
+	    !context_active(primary_lrc))
+		return xe_lrc_queue_timestamp(lrc);
+
+	return reg_queue_ts;
+}
+
+static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
+{
+	*old_ts = lrc->queue_timestamp;
+	lrc->queue_timestamp = xe_lrc_multi_queue_timestamp(lrc);
+
+	return lrc->queue_timestamp;
+}
+
+static u64 xe_lrc_single_queue_timestamp(struct xe_lrc *lrc)
 {
 	u64 lrc_ts, reg_ts, new_ts = lrc->ctx_timestamp;
 	u32 engine_id;
@@ -2697,24 +2746,50 @@ u64 xe_lrc_timestamp(struct xe_lrc *lrc)
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
 /**
- * xe_lrc_update_timestamp() - Update ctx timestamp
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
+/**
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
-- 
2.43.0

