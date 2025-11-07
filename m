Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322B5CCFA1A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC48A10EB95;
	Fri,  7 Nov 2025 18:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AbwwcKDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0CA10EB83
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539211; x=1794075211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hYErGLmJMZBLmsY2d9aNfST312K33Rgmgb7ZOZOH3Ck=;
 b=AbwwcKDjJvqpt1lGUdLpUPtRM3WGiYJyWtBrf4GEt+QAnOZy7nM/07qD
 yJFF6K1pO1HhoeEalw2MNxepPXTUJ5edLqYWF3E4x5zNCh6aqRTXc0T1B
 pELl0rvIHgg3o048Ej4NIhxedbRQFIprQ4+oDsAbvCXnBYYfuqEn+jhsE
 SzJ8ScAZo0n85OXrOyfsQBodh69tx6fBSUqYO4VMeWDFeVMLSjeCtZAjH
 4le0SigFOd8s4KSOvDmNHM2Fr+ScQHCyC+mECjvULBNQiSHG1uQ+f6LRT
 WJS+Uj4UQggTSR/UuB9luL3DqV/Iva4rPOxBjwgzuSxNkz1mjJzdHUhrE Q==;
X-CSE-ConnectionGUID: BV355MWNSjWSoSMKoUOosQ==
X-CSE-MsgGUID: y51As/UAQjmg9DQDpgAXsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733154"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733154"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:31 -0800
X-CSE-ConnectionGUID: wbMgDAv9Q9+t8PZCqgf15A==
X-CSE-MsgGUID: /aZaEg7qSN6kfL3F2c53ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271214"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 21/33] drm/xe/drm_client: Use scope-based cleanup
Date: Fri,  7 Nov 2025 10:13:37 -0800
Message-ID: <20251107181315.631642-56-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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
index 6e0a05eeb587..b3486d748951 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -338,7 +338,6 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	struct xe_hw_engine *hwe;
 	struct xe_exec_queue *q;
 	u64 gpu_timestamp;
-	struct xe_force_wake_ref fw_ref;
 
 	/*
 	 * RING_TIMESTAMP registers are inaccessible in VF mode.
@@ -355,30 +354,26 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
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
-	xe_force_wake_put(fw_ref);
-	xe_pm_runtime_put(xe);
 
 	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
 		const char *class_name;
-- 
2.51.1

