Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCC4C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 16:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065BD10E6DA;
	Tue, 25 Jun 2024 16:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="THFvhQ/f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFA310E6DA
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 16:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719334698; x=1750870698;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jFRqqT1+aahhjSxGP/w27HnpYWx5wsuRG/ykDtT+Y0A=;
 b=THFvhQ/fh9V7oJKfqN3jo0reKwW0WWSrC54JoQ08zXAPuWxcnckORvvT
 CEMgYBqUCGMVBIQKXsdiyAZ88eAQ2VH6j+9FAVx8OpKeZZeX6mF9OrPci
 8WTYQRX8IxuGl8TjRcjp4mXnSDG7HK2HOurEd6vJS3/DVbHKc54jRrxo3
 g+dCyx1OKvEu0vPjnnjaoqG+5HK3O98byK4vXRGw4veiNFVzZrxmN7Ata
 ajU8D5f18v5GfXlwwVRxL+4MorQsCeUMzS2qyIL0op0d/T5jxUm02ZR25
 0hEbwZ+MzwytXm2hyG44wOTZkc6XBLbs1qXFovRMQFdLucLKVtS4iJJNw A==;
X-CSE-ConnectionGUID: itgHHLJUSp+XJPMkEfEd/A==
X-CSE-MsgGUID: Cfy+fcKnQVurcGN0luIuqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20178747"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20178747"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 09:58:18 -0700
X-CSE-ConnectionGUID: zcXHGtdQR/mBQ6+As+LnOQ==
X-CSE-MsgGUID: ARkL/Ao3TT267HVsFuZfCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43524769"
Received: from xpumcyp04.jf.intel.com ([10.75.202.213])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 09:58:17 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	lucas.demarchi@intel.com
Subject: [PATCH 1/2] drm/xe: Use a helper to get delta run ticks from the exec
 queue
Date: Wed, 26 Jun 2024 00:58:11 +0800
Message-Id: <20240625165812.58411-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
References: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
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

As per earlier review feedback - code manipulating exec queue fields
should not be present in xe_device.c. Use a helper to get the delta run
ticks from exec queue.

Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c |  7 ++-----
 drivers/gpu/drm/xe/xe_exec_queue.c | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 4a19b771e3a0..e0c4a50d372c 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -251,11 +251,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 
 	/* Accumulate all the exec queues from this client */
 	mutex_lock(&xef->exec_queue.lock);
-	xa_for_each(&xef->exec_queue.xa, i, q) {
-		xe_exec_queue_update_run_ticks(q);
-		xef->run_ticks[q->class] += q->run_ticks - q->old_run_ticks;
-		q->old_run_ticks = q->run_ticks;
-	}
+	xa_for_each(&xef->exec_queue.xa, i, q)
+		xef->run_ticks[q->class] += xe_exec_queue_delta_run_ticks(q);
 	mutex_unlock(&xef->exec_queue.lock);
 
 	/* Get the total GPU cycles */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0ba37835849b..4d90a16745d2 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -786,6 +786,24 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	q->run_ticks += (new_ts - old_ts) * q->width;
 }
 
+/**
+ * xe_exec_queue_delta_run_ticks() - Get delta of queue run_ticks 
+ * @q: The exec queue
+ *
+ * Update run ticks for the specific queue and then return the delta when
+ * compared to the previous value of run ticks.
+ */
+u64 xe_exec_queue_delta_run_ticks(struct xe_exec_queue *q)
+{
+	u64 delta_ticks;
+
+	xe_exec_queue_update_run_ticks(q);
+	delta_ticks = q->run_ticks - q->old_run_ticks;
+	q->old_run_ticks = q->run_ticks;
+
+	return delta_ticks;
+}
+
 void xe_exec_queue_kill(struct xe_exec_queue *q)
 {
 	struct xe_exec_queue *eq = q, *next;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 289a3a51d2a2..42f683e5d88a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -76,5 +76,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
 void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
 				  struct dma_fence *fence);
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
+u64 xe_exec_queue_delta_run_ticks(struct xe_exec_queue *q);
 
 #endif
-- 
2.34.1

