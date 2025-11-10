Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609C9CD13CF
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A65710E49B;
	Mon, 10 Nov 2025 23:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHoZchGK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B6110E49B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816834; x=1794352834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sn8Dld7BZQRuiRfyGJe6gduUVo4aieKk2qaiT244kVw=;
 b=XHoZchGKhfTWMba3Zvf0EgvkAQMUhmapmxBf0aHSz+uGqmr3zA31gakn
 IBvW64WdLVhk+TKHjfGExn/EuzyVqHouOum3HHQWtWRsoKlphkcWvvnKQ
 4/RIUywgO3t62la/v8XX1tsuQbSZh4buDF98/sUoOj7Dj5EV9Lqs92JoB
 l3xYKriww2QhKC5R2ppSnXktU6ozDcC+QjOsAdWCRF8HS/Qd8KCp9Y1zd
 sHTW5wtBE8n4rgxpnJfqgQtirZf5HaGr3dvPR2X5F0lPLm+0zFvlBBqQh
 cbRrQY5sTSZY4WyrDaGRau7mYO6OLs2p31n5+Qi7p0+WmCH7yxgiWp11i Q==;
X-CSE-ConnectionGUID: eZra7xTSRGqmRvgByBeCpg==
X-CSE-MsgGUID: AHnmB/g5R+aAQnTu41NeKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75486455"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75486455"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
X-CSE-ConnectionGUID: T7BGQAK0TRyy6BGx/GRC5A==
X-CSE-MsgGUID: AyI10Jr5TNKCAHpdSka9ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189244002"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 18/30] drm/xe/drm_client: Use scope-based cleanup
Date: Mon, 10 Nov 2025 15:20:36 -0800
Message-ID: <20251110232017.1475869-50-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 39 +++++++++++++-----------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 9deb258ba204..72bf399915b7 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -337,7 +337,6 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	struct xe_hw_engine *hwe;
 	struct xe_exec_queue *q;
 	u64 gpu_timestamp;
-	struct xe_force_wake_ref fw_ref;
 
 	/*
 	 * RING_TIMESTAMP registers are inaccessible in VF mode.
@@ -354,30 +353,26 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
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
+		CLASS(xe_force_wake_any_engine, fw_ref)(xe, &hwe);
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

