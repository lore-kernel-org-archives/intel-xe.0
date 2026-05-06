Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D783FCD3445
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 22:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E0810EEFD;
	Wed,  6 May 2026 22:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gVruSjfj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4F010EF08
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 22:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778106912; x=1809642912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7zSrsKhW3ofeghG6F2AIIUdR+9QI8qlRYrsdWXkV2M4=;
 b=gVruSjfjMJEMR2bESwEgeIfdRZT5C5gfM851XwBuhsrRXge53U2TojJd
 Ic2jDLC1iTZ7Mi0B3aLK6ITDFZH93NHOy4l3Sc/DeFY5Hl24nyrlRG9oj
 ySdqtt3dDDVybBJaxq15IXOqSJs4KVCyuPJKOUCQqScD5heDukRc3YbUk
 LXfo3ZIGDTShQ0rzJkt88n4pobiaUbjeRwTd54ZReE3LCIMxffyDQPH3/
 pkvT0w1iqZbqYFg8CH8h+DJmXy7qbzKBVQBmODPxCcR8FeJCHGDP+Z1kK
 FD9QWM27pWTLBsLlBfssZ/3BwPqPC/cRMaF8qIJNZIGLcpQTSRj6YUW+a Q==;
X-CSE-ConnectionGUID: l6vEgb6iSFuiXQc+kCgS/g==
X-CSE-MsgGUID: bzb/zXUuSCupotioaB7XFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90429719"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="90429719"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 15:35:11 -0700
X-CSE-ConnectionGUID: L82R7RW4QRayLstcq/GX/Q==
X-CSE-MsgGUID: 8Nry9s9MQzOGqocujB8zRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="259707486"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 15:35:11 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v4 08/11] drm/xe/multi_queue: Capture queue run times for
 active queues
Date: Wed,  6 May 2026 15:35:09 -0700
Message-ID: <20260506223500.3769614-21-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
References: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
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
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
v2:
- Move trace to a separate patch (Stuart)
- Refactor multi queue timestamp logic (Matt/Niranjana)

v3: (Niranjana)
- s/get_queue_id/get_multi_queue_active_queue_id/
- assert for primary_lrc in xe_lrc_multi_queue_timestamp
- don't use the name single_queue

v4: (Niranjana)
- Mention that context active cookie applies to primary context only
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 +
 drivers/gpu/drm/xe/xe_lrc.c              | 114 +++++++++++++++++++----
 2 files changed, 98 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index c4c879a9e555..94033982e694 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -170,6 +170,10 @@
 #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
 
 #define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
+#define   CURRENT_ACTIVE_QUEUE_ID_MASK		REG_GENMASK(7, 0)
+
+#define RING_QUEUE_TIMESTAMP(base)		XE_REG((base) + 0x4c0)
+#define RING_QUEUE_TIMESTAMP_UDW(base)		XE_REG((base) + 0x4c0 + 4)
 
 #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 5f9baf9f6675..869ce0c09939 100644
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
@@ -2663,22 +2664,69 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
 	return 0;
 }
 
+static u64 get_queue_timestamp(struct xe_hw_engine *hwe)
+{
+	return xe_mmio_read64_2x32(&hwe->gt->mmio,
+				   RING_QUEUE_TIMESTAMP(hwe->mmio_base));
+}
+
+static u32 get_multi_queue_active_queue_id(struct xe_hw_engine *hwe)
+{
+	u32 val = xe_mmio_read32(&hwe->gt->mmio,
+				 RING_CSMQDEBUG(hwe->mmio_base));
+
+	return REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK, val);
+}
+
 static bool context_active(struct xe_lrc *lrc)
 {
 	return xe_lrc_ctx_timestamp(lrc) == CONTEXT_ACTIVE;
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
+static u64 xe_lrc_multi_queue_timestamp(struct xe_lrc *lrc)
+{
+	struct xe_device *xe = lrc_to_xe(lrc);
+	struct xe_lrc *primary_lrc = lrc->multi_queue.primary_lrc;
+	struct xe_hw_engine *hwe;
+	u64 reg_queue_ts = lrc->queue_timestamp;
+
+	if (IS_SRIOV_VF(xe))
+		return xe_lrc_queue_timestamp(lrc);
+
+	xe_assert(xe, primary_lrc);
+
+	/* WA BB populates CONTEXT_ACTIVE cookie for primary context only */
+	if (!context_active(primary_lrc))
+		return xe_lrc_queue_timestamp(lrc);
+
+	/* WA BB populates engine id in PPHWSP of primary context only */
+	hwe = engine_id_to_hwe(primary_lrc->gt, xe_lrc_engine_id(primary_lrc));
+	if (!hwe)
+		return xe_lrc_queue_timestamp(lrc);
+
+	if (get_multi_queue_active_queue_id(hwe) != lrc->multi_queue.pos)
+		return xe_lrc_queue_timestamp(lrc);
+
+	/* queue is active, so store the queue timestamp register */
+	reg_queue_ts = get_queue_timestamp(hwe);
+
+	/* double check queue and primary queue are both still active */
+	if (get_multi_queue_active_queue_id(hwe) != lrc->multi_queue.pos ||
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
+static u64 xe_lrc_context_timestamp(struct xe_lrc *lrc)
 {
 	u64 reg_ts, new_ts = lrc->ctx_timestamp;
 
@@ -2700,24 +2748,50 @@ u64 xe_lrc_timestamp(struct xe_lrc *lrc)
 	return new_ts;
 }
 
+static u64 xe_lrc_update_context_timestamp(struct xe_lrc *lrc, u64 *old_ts)
+{
+	*old_ts = lrc->ctx_timestamp;
+	lrc->ctx_timestamp = xe_lrc_context_timestamp(lrc);
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
+		return xe_lrc_context_timestamp(lrc);
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
+		return xe_lrc_update_context_timestamp(lrc, old_ts);
 }
 
 /**
-- 
2.51.0

