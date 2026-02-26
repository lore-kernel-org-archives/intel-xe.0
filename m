Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE65FD9E14
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 21:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B96710E9B7;
	Thu, 26 Feb 2026 21:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBKamloe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171DD10E9B6
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 21:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772140942; x=1803676942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=omVTnDKdig08hXMyneAKmOvWiGVCu1UMWsxHAN3tIds=;
 b=GBKamloe8U1/Fu2+aHWrqzZLiuRiRxM8EkQ7UMgTCe1ECm2uX6879m3J
 XOJ6OoFnYLBEfNYiX6rF7CX7A9asiaPFk2dTQH2vFrPO6DZWagjvifTpW
 XNm2DaR9Fp49lCRR3X4jVq7E0b975f+KO3B8m27+MZJepPpK68yfmDY+x
 JIVUT3eT0i9Qns2yovS2DO6xc5HHvgZBgUgtLyF/6K7AJyBsCSYn5LMhj
 onCUmocvZ7Dm2ew4HuWH09gXV6nwg0ZYFVkZWVAd/9t1Kt8V/wlF2jBL5
 qF99hGB6Qe3XmYr8v2m0+1Xi+EL1QJnZtDB3i/saR1ToxGmrabs4cP2OJ w==;
X-CSE-ConnectionGUID: 8L80ogNfTHCadE/kJQN4vQ==
X-CSE-MsgGUID: xi6x/Wu5RO2/mI/t0AnUgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84307901"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="84307901"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 13:22:22 -0800
X-CSE-ConnectionGUID: kiAZgCQ1RpmTxPBK2PsC/A==
X-CSE-MsgGUID: YgUQKMcUS/SHb4aA9VpHqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221698676"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa005.jf.intel.com with ESMTP; 26 Feb 2026 13:22:20 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 2/4] drm/xe: Wrappers for setting and getting LRC references
Date: Thu, 26 Feb 2026 22:26:59 +0100
Message-Id: <20260226212701.2937065-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260226212701.2937065-1-tomasz.lis@intel.com>
References: <20260226212701.2937065-1-tomasz.lis@intel.com>
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

There is a small but non-zero chance that VF post migration fixups
are running on an exec queue during teardown. The chances are
decreased by starting the teardown by releasing guc_id, but remain
non-zero. On the other hand the sync between fixups and EQ creation
(wait_valid_ggtt) drastically increases the chance for such parallel
teardown if queue creation error path is entered (err_lrc label).

The exec queue itself is not going to cause an issue, but LRCs have
a small chance of getting freed during the fixups.

Creating a setter and a getter makes it easier to protect the fixup
operations with a lock. For other driver activities, the original
access method (without any protection) can still be used.

v2: Separate lock, only for LRCs. Kerneldoc fixes. Subject tag fix.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 73 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_exec_queue.h       |  1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  5 ++
 3 files changed, 60 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b4ef725a682d..c0e95f1a9911 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -231,6 +231,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	INIT_LIST_HEAD(&q->hw_engine_group_link);
 	INIT_LIST_HEAD(&q->pxp.link);
 	spin_lock_init(&q->multi_queue.lock);
+	spin_lock_init(&q->lrc_lookup_lock);
 	q->multi_queue.priority = XE_MULTI_QUEUE_PRIORITY_NORMAL;
 
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
@@ -270,6 +271,56 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	return q;
 }
 
+static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u16 idx)
+{
+	xe_assert(gt_to_xe(q->gt), idx < q->width);
+
+	scoped_guard(spinlock, &q->lrc_lookup_lock)
+		q->lrc[idx] = lrc;
+}
+
+/**
+ * xe_exec_queue_get_lrc() - Get the LRC from exec queue.
+ * @q: The exec queue instance.
+ * @idx: Index within multi-LRC array.
+ *
+ * Retrieves LRC of given index for the exec queue under lock
+ * and takes reference.
+ *
+ * Return: Pointer to LRC on success, error on failure, NULL on
+ * lookup failure.
+ */
+struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx)
+{
+	struct xe_lrc *lrc;
+
+	xe_assert(gt_to_xe(q->gt), idx < q->width);
+
+	scoped_guard(spinlock, &q->lrc_lookup_lock) {
+		lrc = q->lrc[idx];
+		if (lrc)
+			xe_lrc_get(lrc);
+	}
+
+	return lrc;
+}
+
+/**
+ * xe_exec_queue_lrc() - Get the LRC from exec queue.
+ * @q: The exec queue instance.
+ *
+ * Retrieves the primary LRC for the exec queue. Note that this function
+ * returns only the first LRC instance, even when multiple parallel LRCs
+ * are configured. This function does not increment reference count,
+ * so the reference can be just forgotten after use.
+ *
+ * Return: Pointer to LRC on success, error on failure
+ */
+struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q)
+{
+	return q->lrc[0];
+}
+
 static void __xe_exec_queue_fini(struct xe_exec_queue *q)
 {
 	int i;
@@ -327,8 +378,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 			goto err_lrc;
 		}
 
-		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
-		WRITE_ONCE(q->lrc[i], lrc);
+		xe_exec_queue_set_lrc(q, lrc, i);
 	}
 
 	return 0;
@@ -1288,21 +1338,6 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
-/**
- * xe_exec_queue_lrc() - Get the LRC from exec queue.
- * @q: The exec_queue.
- *
- * Retrieves the primary LRC for the exec queue. Note that this function
- * returns only the first LRC instance, even when multiple parallel LRCs
- * are configured.
- *
- * Return: Pointer to LRC on success, error on failure
- */
-struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q)
-{
-	return q->lrc[0];
-}
-
 /**
  * xe_exec_queue_is_lr() - Whether an exec_queue is long-running
  * @q: The exec_queue
@@ -1662,14 +1697,14 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 	for (i = 0; i < q->width; ++i) {
 		struct xe_lrc *lrc;
 
-		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
-		lrc = READ_ONCE(q->lrc[i]);
+		lrc = xe_exec_queue_get_lrc(q, i);
 		if (!lrc)
 			continue;
 
 		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
 		xe_lrc_update_hwctx_regs_with_address(lrc);
 		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
+		xe_lrc_put(lrc);
 		if (err)
 			break;
 	}
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index c9e3a7c2d249..a82d99bd77bc 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -160,6 +160,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
 
 struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
+struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx);
 
 /**
  * xe_exec_queue_idle_skip_suspend() - Can exec queue skip suspend
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 3791fed34ffa..a1f3938f4173 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -257,6 +257,11 @@ struct xe_exec_queue {
 	u64 tlb_flush_seqno;
 	/** @hw_engine_group_link: link into exec queues in the same hw engine group */
 	struct list_head hw_engine_group_link;
+	/**
+	 * @lrc_lookup_lock: Lock for protecting lrc array access. Only used when
+	 * running in parallel to queue creation is possible.
+	 */
+	spinlock_t lrc_lookup_lock;
 	/** @lrc: logical ring context for this exec queue */
 	struct xe_lrc *lrc[] __counted_by(width);
 };
-- 
2.25.1

