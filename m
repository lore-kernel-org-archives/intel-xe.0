Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C02CEACE4
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C29D10EB3A;
	Fri, 14 Nov 2025 21:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fvc91Qbb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B3610EB2D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763156630; x=1794692630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=awsgHzQ2LaKUzjnZweXMl3Nw1tOl30z+xEuNxmgKkUY=;
 b=Fvc91QbbVKYzAic8fRdMtTpQTHCK19DJeeEvSbnBrZNgpUKS9a4oLYZz
 7TaqhxJcgWgdMIP6hEZ2PLs+N1yKVO62z3AbeLXHFsucf2e7Jwf4R9wgK
 fCdg5Yapi/eNvAnH1KqzWydHvKlsG26hZ3ua+1Pl8L23o/Zhg7pk+BhmO
 rm7h+Gjxb4ml1r4NM7ekT4qb1ENBKMbqBD+jvJYp3iRW4U9W893Z86oXg
 4ZurWAc8o16kjyArPQ7w0wlpk46MJLNaVZcYvgIpjM8ti82KkKY7kjEOf
 SqBnmpoRKqMl9iFgMjqZv5IyeqEpfqQuTdROQTr5jfJs5ea5ipb1UJe1w A==;
X-CSE-ConnectionGUID: moG1tZHfQLOt5AWtM7N1Qg==
X-CSE-MsgGUID: LHWkOad1S9uQQ88VwEM7xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82648318"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82648318"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:49 -0800
X-CSE-ConnectionGUID: dW9xdDFwQuywcCDfwciS6A==
X-CSE-MsgGUID: gTI+mYjLRFmYGqMVaVWe5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190308317"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v3 15/27] drm/xe/drm_client: Use scope-based cleanup
Date: Fri, 14 Nov 2025 13:43:51 -0800
Message-ID: <20251114214335.2388972-44-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

