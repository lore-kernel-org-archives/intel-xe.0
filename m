Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753AFFD4616
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 04:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DA610E869;
	Thu, 26 Feb 2026 04:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpC5n0XO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CE710E86D
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 04:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772080120; x=1803616120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EwZzG4G5hxrHgQVIOshyz/Q88JFOaV4qEVo7suf9QGE=;
 b=HpC5n0XOrxzWqwUu9BgZ0oyP6Uk4pOdnB+qWXZ4qfkndVrH2FT/fYwtd
 QrS9k9qJm6ReuDdqUWnZ3uUDi9Oht0lNakeF/GNHufAPxiu9/2wtEmpH3
 GpE44+vu0ZqBb72S8ID+43d8gPPGkT22Zbq4d3VK9llKAiLszh61W5Yct
 vX8vWRaC0e2CaNjkLIocxOJsRc8R0c8lDhbHuc2LKGxm2jLvw4NfJ+hqd
 v2ozZwmH0xMCORqXywWXObJyNV+Rs6TBHxiTZWNyYk6omrQv1nJ06C/JV
 YqJOtCkxt08vCwoWshywI0sVKQ+jVdr3cehytfWdTDYANyPVrA1727+oY Q==;
X-CSE-ConnectionGUID: 7rwW0JmDSq+QoqJx0xkczQ==
X-CSE-MsgGUID: 8vY0oYNiRUyyy3FCEZAxeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="98603137"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="98603137"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:28:39 -0800
X-CSE-ConnectionGUID: jU+GMYJyQYem8zwi6/T/9Q==
X-CSE-MsgGUID: r43pigb/RxKhQdqNpM6azg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="216334174"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:28:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v4 11/12] drm/xe: batch CT pagefault acks with periodic flush
Date: Wed, 25 Feb 2026 20:28:33 -0800
Message-Id: <20260226042834.2963245-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226042834.2963245-1-matthew.brost@intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Pagefault storms can generate long chains of acknowledgments back to the
GuC. Sending each ack as a full CT submission forces a barrier,
descriptor update and doorbell per fault.

Extend xe_guc_ct_send_locked() with a “write-only” mode that copies the
message into the H2G ring but defers publishing the descriptor and
ringing the doorbell. Add xe_guc_ct_send_flush() to publish pending
writes and notify GuC once per batch. Wire this into the pagefault
producer via new ack_fault_begin/ack_fault_end callbacks and CT lock
wrappers.

To avoid excessive flush latency while still amortizing MMIO costs, use
a simple periodic flush heuristic for GuC pagefault acks: batch most
acks as write-only and force a publish at a fixed interval (e.g., every
16th ack), with a final flush at end-of-batch.

Also increase the H2G CTB size to 16K to better absorb bursts.

Assistent-by: Chat-GPT # Documentation
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c          | 94 +++++++++++++++++++------
 drivers/gpu/drm/xe/xe_guc_ct.h          | 35 ++++++++-
 drivers/gpu/drm/xe/xe_guc_pagefault.c   | 28 +++++++-
 drivers/gpu/drm/xe/xe_guc_types.h       |  6 ++
 drivers/gpu/drm/xe/xe_pagefault.c       | 12 +++-
 drivers/gpu/drm/xe/xe_pagefault_types.h | 14 ++++
 6 files changed, 164 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 3a262d3af8cf..5a126e19c53e 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -255,7 +255,7 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
 
 #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
 #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
-#define CTB_H2G_BUFFER_SIZE	(SZ_4K)
+#define CTB_H2G_BUFFER_SIZE	(SZ_16K)
 #define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE / sizeof(u32))
 #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
 #define CTB_G2H_BUFFER_DWORDS	(CTB_G2H_BUFFER_SIZE / sizeof(u32))
@@ -912,7 +912,7 @@ static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
 #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
 
 static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
-		     u32 ct_fence_value, bool want_response)
+		     u32 ct_fence_value, bool want_response, bool write_only)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
@@ -936,15 +936,8 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	}
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-		u32 desc_tail = desc_read(xe, h2g, tail);
 		u32 desc_head = desc_read(xe, h2g, head);
 
-		if (tail != desc_tail) {
-			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
-			xe_gt_err(gt, "CT write: tail was modified %u != %u\n", desc_tail, tail);
-			goto corrupted;
-		}
-
 		if (tail > h2g->info.size) {
 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
 			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
@@ -966,7 +959,8 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			      (h2g->info.size - tail) * sizeof(u32));
 		h2g_reserve_space(ct, (h2g->info.size - tail));
 		h2g->info.tail = 0;
-		desc_write(xe, h2g, tail, h2g->info.tail);
+		if (!write_only)
+			desc_write(xe, h2g, tail, h2g->info.tail);
 
 		return -EAGAIN;
 	}
@@ -997,14 +991,15 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	/* Write H2G ensuring visible before descriptor update */
 	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
 	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
-	xe_device_wmb(xe);
-
 	/* Update local copies */
 	h2g->info.tail = (tail + full_len) % h2g->info.size;
 	h2g_reserve_space(ct, full_len);
 
 	/* Update descriptor */
-	desc_write(xe, h2g, tail, h2g->info.tail);
+	if (!write_only) {
+		xe_device_wmb(xe);
+		desc_write(xe, h2g, tail, h2g->info.tail);
+	}
 
 	trace_xe_guc_ctb_h2g(xe, gt->info.id, *(action - 1), full_len,
 			     desc_read(xe, h2g, head), h2g->info.tail);
@@ -1018,7 +1013,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 				u32 len, u32 g2h_len, u32 num_g2h,
-				struct g2h_fence *g2h_fence)
+				struct g2h_fence *g2h_fence, bool write_only)
 {
 	struct xe_gt *gt = ct_to_gt(ct);
 	u16 seqno;
@@ -1073,7 +1068,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	if (unlikely(ret))
 		goto out_unlock;
 
-	ret = h2g_write(ct, action, len, seqno, !!g2h_fence);
+	ret = h2g_write(ct, action, len, seqno, !!g2h_fence, write_only);
 	if (unlikely(ret)) {
 		if (ret == -EAGAIN)
 			goto retry;
@@ -1081,7 +1076,8 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	}
 
 	__g2h_reserve_space(ct, g2h_len, num_g2h);
-	xe_guc_notify(ct_to_guc(ct));
+	if (!write_only)
+		xe_guc_notify(ct_to_guc(ct));
 out_unlock:
 	if (g2h_len)
 		spin_unlock_irq(&ct->fast_lock);
@@ -1157,7 +1153,7 @@ static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
 
 static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			      u32 g2h_len, u32 num_g2h,
-			      struct g2h_fence *g2h_fence)
+			      struct g2h_fence *g2h_fence, bool write_only)
 {
 	struct xe_gt *gt = ct_to_gt(ct);
 	unsigned int sleep_period_ms = 1;
@@ -1170,9 +1166,11 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 try_again:
 	ret = __guc_ct_send_locked(ct, action, len, g2h_len, num_g2h,
-				   g2h_fence);
+				   g2h_fence, write_only);
 
 	if (unlikely(ret == -EBUSY)) {
+		if (write_only)
+			xe_guc_ct_send_flush(ct);
 		if (!guc_ct_send_wait_for_retry(ct, len, g2h_len, g2h_fence,
 						&sleep_period_ms, &sleep_total_ms))
 			goto broken;
@@ -1196,7 +1194,8 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	xe_gt_assert(ct_to_gt(ct), !g2h_len || !g2h_fence);
 
 	mutex_lock(&ct->lock);
-	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
+	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence,
+				 false);
 	mutex_unlock(&ct->lock);
 
 	return ret;
@@ -1214,25 +1213,76 @@ int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	return ret;
 }
 
+/**
+ * xe_guc_ct_send_locked() - submit a GuC CT H2G message with CT lock held
+ * @ct: GuC CT object
+ * @action: payload dwords (HxG header dword is expected at @action[-1])
+ * @len: number of payload dwords in @action
+ * @write_only: defer publishing/doorbell for batching
+ *
+ * Sends a single H2G message to the GuC CT buffer while the caller already
+ * holds @ct->lock.
+ *
+ * If @write_only is false, the function completes the submission immediately:
+ * it makes the payload visible to the device, updates the H2G descriptor and
+ * rings the GuC doorbell.
+ *
+ * If @write_only is true, the message payload is copied into the H2G ring and
+ * the software tail is advanced, but the descriptor update and doorbell are
+ * deferred so multiple messages can be batched. In this mode, the caller must
+ * eventually call xe_guc_ct_send_flush() (still holding @ct->lock) to publish
+ * the descriptor and notify the GuC. On internal retry paths (-EBUSY), the
+ * implementation may force a flush to ensure forward progress.
+ *
+ * Return: 0 on success, negative errno on failure.
+ *
+ * Locking:
+ *   Must be called with @ct->lock held.
+ */
 int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
-			  u32 g2h_len, u32 num_g2h)
+			  bool write_only)
 {
 	int ret;
 
-	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, NULL);
+	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, write_only);
 	if (ret == -EDEADLK)
 		kick_reset(ct);
 
 	return ret;
 }
 
+/**
+ * xe_guc_ct_send_flush() - flush pending GuC CT H2G writes
+ * @ct: GuC CT instance
+ *
+ * Some callers batch multiple H2G writes using xe_guc_ct_send_locked() in
+ * "write-only" mode (i.e., queue the message payloads but defer ringing the
+ * doorbell / updating the CT descriptor). This helper completes the submission
+ * by ensuring the payload writes are visible to the device, updating the H2G
+ * descriptor, and ringing the GuC CT doorbell.
+ *
+ * Locking:
+ *   Must be called with @ct->lock held.
+ */
+void xe_guc_ct_send_flush(struct xe_guc_ct *ct)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	struct guc_ctb *h2g = &ct->ctbs.h2g;
+
+	lockdep_assert_held(&ct->lock);
+
+	xe_device_wmb(xe);
+	desc_write(xe, h2g, tail, h2g->info.tail);
+	xe_guc_notify(ct_to_guc(ct));
+}
+
 int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action, u32 len)
 {
 	int ret;
 
 	lockdep_assert_held(&ct->lock);
 
-	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL);
+	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, false);
 	if (ret == -EDEADLK)
 		kick_reset(ct);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 767365a33dee..2db4dded6b96 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -54,7 +54,7 @@ static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
 int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		   u32 g2h_len, u32 num_g2h);
 int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
-			  u32 g2h_len, u32 num_g2h);
+			  bool write_only);
 int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			u32 *response_buffer);
 static inline int
@@ -62,6 +62,7 @@ xe_guc_ct_send_block(struct xe_guc_ct *ct, const u32 *action, u32 len)
 {
 	return xe_guc_ct_send_recv(ct, action, len, NULL);
 }
+void xe_guc_ct_send_flush(struct xe_guc_ct *ct);
 
 /* This is only version of the send CT you can call from a G2H handler */
 int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action,
@@ -87,4 +88,36 @@ static inline void xe_guc_ct_wake_waiters(struct xe_guc_ct *ct)
 	wake_up_all(&ct->wq);
 }
 
+/**
+ * xe_guc_ct_lock() - take the GuC CT mutex
+ * @ct: GuC CT object
+ *
+ * Wrapper around mutex_lock(&ct->lock) for cases where CT operations need to be
+ * performed from contexts that want an explicit "CT locked" pair without
+ * exporting the lock itself.
+ *
+ * Return/Locking:
+ *   Acquires @ct->lock.
+ */
+static inline void xe_guc_ct_lock(struct xe_guc_ct *ct)
+__acquires(&ct->lock)
+{
+	mutex_lock(&ct->lock);
+}
+
+/**
+ * xe_guc_ct_unlock() - release the GuC CT mutex
+ * @ct: GuC CT object
+ *
+ * Counterpart to xe_guc_ct_lock().
+ *
+ * Locking:
+ *   Releases @ct->lock.
+ */
+static inline void xe_guc_ct_unlock(struct xe_guc_ct *ct)
+__releases(&ct->lock)
+{
+	mutex_unlock(&ct->lock);
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 2470faf3d5d8..cee653bf463b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -10,6 +10,19 @@
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
 
+#define XE_GUC_PAGEFAULT_FLUSH_PERIOD	BIT(4)	/* Sixteen */
+
+static void guc_ack_fault_begin(void *private)
+{
+	struct xe_guc *guc = private;
+
+	xe_guc_ct_lock(&guc->ct);
+
+	/* Ack the 2th, then 18th, etc... */
+	guc->pagefault_ack_counter =
+		XE_GUC_PAGEFAULT_FLUSH_PERIOD - 2;
+}
+
 static void guc_ack_fault(struct xe_pagefault *pf, int err)
 {
 	u32 vfid = FIELD_GET(PFD_VFID, pf->producer.msg[2]);
@@ -36,12 +49,25 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
 		FIELD_PREP(PFR_PDATA, pdata),
 	};
 	struct xe_guc *guc = pf->producer.private;
+	bool write_only = guc->pagefault_ack_counter++ &
+		(XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1);
+
+	xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
+			      write_only);
+}
+
+static void guc_ack_fault_end(void *private)
+{
+	struct xe_guc *guc = private;
 
-	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
+	xe_guc_ct_send_flush(&guc->ct);
+	xe_guc_ct_unlock(&guc->ct);
 }
 
 static const struct xe_pagefault_ops guc_pagefault_ops = {
+	.ack_fault_begin = guc_ack_fault_begin,
 	.ack_fault = guc_ack_fault,
+	.ack_fault_end = guc_ack_fault_end,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index c7b9642b41ba..2996e5903ccb 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -124,6 +124,12 @@ struct xe_guc {
 	struct xe_reg notify_reg;
 	/** @params: Control params for fw initialization */
 	u32 params[GUC_CTL_MAX_DWORDS];
+
+	/**
+	 * @pagefault_ack_counter: Counter to determine when periodically ack
+	 * pagefaults in a batch.
+	 */
+	u32 pagefault_ack_counter;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 2cfda29321c9..d252a8c9d88c 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -425,6 +425,10 @@ static bool xe_pagefault_cache_hit(struct xe_pagefault_queue *pf_queue,
 			xe_assert(xe, pf_work->cache.pf->consumer.alloc_state ==
 				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
 
+			if (pf->producer.private !=
+			    pf_work->cache.pf->producer.private)
+				continue;
+
 			xe_gt_stats_incr(pf->gt,
 					 XE_GT_STATS_ID_CHAIN_PAGEFAULT_COUNT,
 					 1);
@@ -559,6 +563,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 
 
 	while (xe_pagefault_queue_pop(pf_queue, &pf, pf_work->id)) {
+		const struct xe_pagefault_ops *ops = pf->producer.ops;
+		void *private = pf->producer.private;
 		struct xe_gt *gt = pf->gt;
 		u32 asid = pf->consumer.asid;
 		int err = 0;
@@ -599,6 +605,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 			  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
 		xe_assert(xe, pf == pf_work->cache.pf);
 
+		ops->ack_fault_begin(private);
 		while (pf) {
 			struct xe_pagefault *next;
 
@@ -606,8 +613,10 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 				  XE_PAGEFAULT_ALLOC_STATE_CHAINED ||
 				  pf->consumer.alloc_state ==
 				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
+			xe_assert(xe, ops == pf->producer.ops);
+			xe_assert(xe, gt == pf->gt);
 
-			pf->producer.ops->ack_fault(pf, err);
+			ops->ack_fault(pf, err);
 
 			if (pf->consumer.alloc_state ==
 			    XE_PAGEFAULT_ALLOC_STATE_ACTIVE)
@@ -635,6 +644,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 				pf = xe_pagefault_queue_requeue(pf_queue, pf,
 								gt);
 		}
+		ops->ack_fault_end(private);
 
 		if (time_after(jiffies, threshold)) {
 			queue_work(xe->usm.pf_wq, w);
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index 57cb292105d7..bc8f582b4e03 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -33,6 +33,13 @@ enum xe_pagefault_type {
 
 /** struct xe_pagefault_ops - Xe pagefault ops (producer) */
 struct xe_pagefault_ops {
+	/**
+	 * @ack_fault_begin: Ack fault begin
+	 * @private: producer private data
+	 *
+	 * Page fault producer begins acknowledgment from the consumer.
+	 */
+	void (*ack_fault_begin)(void *private);
 	/**
 	 * @ack_fault: Ack fault
 	 * @pf: Page fault
@@ -42,6 +49,13 @@ struct xe_pagefault_ops {
 	 * sends the result to the HW/FW interface.
 	 */
 	void (*ack_fault)(struct xe_pagefault *pf, int err);
+	/**
+	 * @ack_fault_end: Ack fault end
+	 * @private: producer private data
+	 *
+	 * Page fault producer ends acknowledgment from the consumer.
+	 */
+	void (*ack_fault_end)(void *private);
 };
 
 /**
-- 
2.34.1

