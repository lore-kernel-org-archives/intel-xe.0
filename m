Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14E5CEE34A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733B710E516;
	Tue, 18 Nov 2025 16:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkhcjWtU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7D210E4F6
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484231; x=1795020231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vElAl8fHqP/qmQUexYaSzeaefEUYVU36X0nMSl6N7qU=;
 b=NkhcjWtUULKsP6acwq3fhg6g773gG7uH5fk9hanp6fvzlb24MC2wfTMn
 z/n+FdofS7Z3Fmsb4aErKqNPqjfXzyovXU0Ibf2afkm2Mn5i4+9TbDNCt
 LtHsIVj3JICOdP1o6SgvjMyX/vr2OmPAks3PS3RSDqpUOJwNCA/nTj+UD
 39Aytvxv04NRFmc2J/KPRTk2hLEr+BSR4UAGTfunSbiG7ZU3sbnggrxh2
 yg0j1xrRbyy/1wBJbNtvQ/3k/G0pWZIT8MMqHydyKIjwiGFQp0xCK3RVc
 zIzqQe4Ap9BqIgaxH9bYpWuvYXmyKHDlDAZEdstD/5XkLvHB5m4S1tV8R A==;
X-CSE-ConnectionGUID: vRLU6iciTJauw3RK5RFa1Q==
X-CSE-MsgGUID: BuM1dXVQQDWqBdkjAfaY4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544777"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544777"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:50 -0800
X-CSE-ConnectionGUID: su7jXxyRTJS8A2CbTnCtnw==
X-CSE-MsgGUID: XgUumKwgQuS6TT88ypxLCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952242"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 15/27] drm/xe/drm_client: Use scope-based cleanup
Date: Tue, 18 Nov 2025 08:43:54 -0800
Message-ID: <20251118164338.3572146-44-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118164338.3572146-29-matthew.d.roper@intel.com>
References: <20251118164338.3572146-29-matthew.d.roper@intel.com>
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

Use scope-based cleanup for forcewake and runtime PM.

v2:
 - Use xe_force_wake_release_only rather than a custom one-off class for
   "any engine" forcewake.  (Gustavo)

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 39 +++++++++++++-----------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 78551832723b..2787bbb36141 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -321,7 +321,6 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	struct xe_hw_engine *hwe;
 	struct xe_exec_queue *q;
 	u64 gpu_timestamp;
-	struct xe_force_wake_ref fw_ref;
 
 	/*
 	 * RING_TIMESTAMP registers are inaccessible in VF mode.
@@ -338,30 +337,26 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	wait_var_event(&xef->exec_queue.pending_removal,
 		       !atomic_read(&xef->exec_queue.pending_removal));
 
-	xe_pm_runtime_get(xe);
-	fw_ref = force_wake_get_any_engine(xe, &hwe);
-	if (!hwe) {
-		xe_pm_runtime_put(xe);
-		return;
-	}
-
-	/* Accumulate all the exec queues from this client */
-	mutex_lock(&xef->exec_queue.lock);
-	xa_for_each(&xef->exec_queue.xa, i, q) {
-		xe_exec_queue_get(q);
-		mutex_unlock(&xef->exec_queue.lock);
-
-		xe_exec_queue_update_run_ticks(q);
+	scoped_guard(xe_pm_runtime, xe) {
+		CLASS(xe_force_wake_release_only, fw_ref)(force_wake_get_any_engine(xe, &hwe));
+		if (!hwe)
+			return;
 
+		/* Accumulate all the exec queues from this client */
 		mutex_lock(&xef->exec_queue.lock);
-		xe_exec_queue_put(q);
+		xa_for_each(&xef->exec_queue.xa, i, q) {
+			xe_exec_queue_get(q);
+			mutex_unlock(&xef->exec_queue.lock);
+
+			xe_exec_queue_update_run_ticks(q);
+
+			mutex_lock(&xef->exec_queue.lock);
+			xe_exec_queue_put(q);
+		}
+		mutex_unlock(&xef->exec_queue.lock);
+
+		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
 	}
-	mutex_unlock(&xef->exec_queue.lock);
-
-	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
-
-	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref.domains);
-	xe_pm_runtime_put(xe);
 
 	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
 		const char *class_name;
-- 
2.51.1

