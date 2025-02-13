Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53345C02198
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 00:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181C210E9B8;
	Thu, 13 Feb 2025 00:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bSr0gz3c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085D910E9B8
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 00:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739407241; x=1770943241;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rSCWd1VZrFn5MR3PFbiBebcyelCEbYm44X4Q+g2W71I=;
 b=bSr0gz3cs1QeNPyzXHYKTHzgm/MvaLEa1Jltcszx0YagSQh2KmE1mDjR
 dZVYCrcKVKmQF9TSiPl8isNcAtaKia/JNTVTpbXLsZIXyRaLEP9kmhkjC
 Nc5hp5Pb7rg6qTLgBGMO9vpYu658Dpw811uP9aT5KhqwPuBo+Q4yhoO+s
 WW4e8mTlfXZPUCDFhLCzYNiUZbXPtBI84v0Sjv1ZjshWdRQp4V+l0XfP1
 907D+604hvPg/e1Ladz4aSXA6VUpczGzKYaqtwbU+VZ0i4w0hqfmCDwdy
 ZSB2gFAgnNKPw7He6qTZGMvWxER3DYY8wwG63/UUbaPJeAoytRXeT+UaX w==;
X-CSE-ConnectionGUID: bczCiJ8TT2m4UOWnGXrvnA==
X-CSE-MsgGUID: EqYD6CicS0mK6JMT2Z7W+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51523849"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51523849"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 16:40:41 -0800
X-CSE-ConnectionGUID: fti9quOdSVaocQoq6kdeKQ==
X-CSE-MsgGUID: tcGccNFdRbisnp7kn/W1TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="117989988"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 16:40:40 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/pxp: Don't kill queues while holding the spinlock
Date: Wed, 12 Feb 2025 16:40:32 -0800
Message-ID: <20250213004032.2059861-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

xe_exec_queue_kill can sleep, so we can't call it from under the lock.
We can instead move the queues to a separate list and then kill them all
after we release the lock.

Since being in the list is used to track whether RPM cleanup is needed,
we can no longer defer that to queue_destroy, so we perform it
immediately instead.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: f8caa80154c4 ("drm/xe/pxp: Add PXP queue tracking and session start")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c | 58 ++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 3cd3f83e86b0..bca2872ba07a 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -665,23 +665,15 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 	return ret;
 }
 
-/**
- * xe_pxp_exec_queue_remove - remove a queue from the PXP list
- * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
- * @q: the queue to remove from the list
- *
- * If PXP is enabled and the exec_queue is in the list, the queue will be
- * removed from the list and its PM reference will be released. It is safe to
- * call this function multiple times for the same queue.
- */
-void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
+static void __pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q, bool lock)
 {
 	bool need_pm_put = false;
 
 	if (!xe_pxp_is_enabled(pxp))
 		return;
 
-	spin_lock_irq(&pxp->queues.lock);
+	if (lock)
+		spin_lock_irq(&pxp->queues.lock);
 
 	if (!list_empty(&q->pxp.link)) {
 		list_del_init(&q->pxp.link);
@@ -690,36 +682,54 @@ void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
 
 	q->pxp.type = DRM_XE_PXP_TYPE_NONE;
 
-	spin_unlock_irq(&pxp->queues.lock);
+	if (lock)
+		spin_unlock_irq(&pxp->queues.lock);
 
 	if (need_pm_put)
 		xe_pm_runtime_put(pxp->xe);
 }
 
+/**
+ * xe_pxp_exec_queue_remove - remove a queue from the PXP list
+ * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
+ * @q: the queue to remove from the list
+ *
+ * If PXP is enabled and the exec_queue is in the list, the queue will be
+ * removed from the list and its PM reference will be released. It is safe to
+ * call this function multiple times for the same queue.
+ */
+void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
+{
+	__pxp_exec_queue_remove(pxp, q, true);
+}
+
 static void pxp_invalidate_queues(struct xe_pxp *pxp)
 {
 	struct xe_exec_queue *tmp, *q;
+	LIST_HEAD(to_clean);
 
 	spin_lock_irq(&pxp->queues.lock);
 
-	/*
-	 * Removing a queue from the PXP list requires a put of the RPM ref that
-	 * the queue holds to keep the PXP session alive, which can't be done
-	 * under spinlock. Since it is safe to kill a queue multiple times, we
-	 * can leave the invalid queue in the list for now and postpone the
-	 * removal and associated RPM put to when the queue is destroyed.
-	 */
-	list_for_each_entry(tmp, &pxp->queues.list, pxp.link) {
-		q = xe_exec_queue_get_unless_zero(tmp);
-
+	list_for_each_entry_safe(q, tmp, &pxp->queues.list, pxp.link) {
+		q = xe_exec_queue_get_unless_zero(q);
 		if (!q)
 			continue;
 
+		list_move_tail(&q->pxp.link, &to_clean);
+	}
+	spin_unlock_irq(&pxp->queues.lock);
+
+	list_for_each_entry_safe(q, tmp, &to_clean, pxp.link) {
 		xe_exec_queue_kill(q);
+
+		/*
+		 * We hold a ref to the queue so there is no risk of racing with
+		 * the calls to exec_queue_remove coming from exec_queue_destroy.
+		 */
+		__pxp_exec_queue_remove(pxp, q, false);
+
 		xe_exec_queue_put(q);
 	}
-
-	spin_unlock_irq(&pxp->queues.lock);
 }
 
 /**
-- 
2.43.0

