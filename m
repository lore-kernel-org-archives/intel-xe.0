Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBB9CEE33F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B208E10E507;
	Tue, 18 Nov 2025 16:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwuGawU0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B4010E4F6
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484231; x=1795020231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nV0Z+e/aPLxoZRJA0bH64NCXsafOe0wBQjKtF2MaA1E=;
 b=dwuGawU0CbUrOx9pojQwC/3cIo2zHUDLRLQNlqpyo3n2wiwSExlXDLuA
 fqMJu0yLj2en7bwprN6V8uiFmpsUdig6L6Wj+tqK6xoWgbpKlvpnpoOxG
 fQqFX8yqcH8JEFoYh8lRZraZBGxdaoHZGDYRUQa/yEkyFCrmtgy4K9irp
 9KI3f/0K2ElGyTof6RDTLs+IHoC7rEaoZfUXwJYkYFjeHuUdnno/pdCL0
 bHJQ89QvhJvQM7Wl4FJ15TGV58N0H+sUYAMKLWmZB/NYyP2P7r53kfEko
 VOWovsivrfiShCJreuV7Knjykw9MKo2rNsWCOt09ifb3rCH264hcEZT5c A==;
X-CSE-ConnectionGUID: XLLB9sEMTwu+FvzQsfyInA==
X-CSE-MsgGUID: N0209P9fQ9Ox0CnezujCqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544772"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544772"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:50 -0800
X-CSE-ConnectionGUID: V8YMIC03QNSTlsDnmD/wKQ==
X-CSE-MsgGUID: E6pGcymbT0ayd2gHnc+XEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952233"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 12/27] drm/xe/devcoredump: Use scope-based cleanup
Date: Tue, 18 Nov 2025 08:43:51 -0800
Message-ID: <20251118164338.3572146-41-matthew.d.roper@intel.com>
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

Use scope-based cleanup for forcewake and runtime PM in the devcoredump
code.  This eliminates some goto-based error handling and slightly
simplifies other functions.

v2:
 - Move the forcewake acquisition slightly higher in
   devcoredump_snapshot() so that we maintain an easy-to-understand LIFO
   cleanup order.  (Gustavo)

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 30 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 203e3038cc81..bf347714b5e0 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -276,7 +276,6 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
 	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
 	struct xe_device *xe = coredump_to_xe(coredump);
-	unsigned int fw_ref;
 
 	/*
 	 * NB: Despite passing a GFP_ flags parameter here, more allocations are done
@@ -287,15 +286,15 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 			      xe_devcoredump_read, xe_devcoredump_free,
 			      XE_COREDUMP_TIMEOUT_JIFFIES);
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 
 	/* keep going if fw fails as we still want to save the memory and SW data */
-	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
-	xe_vm_snapshot_capture_delayed(ss->vm);
-	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
-	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
+	xe_with_force_wake(fw_ref, gt_to_fw(ss->gt), XE_FORCEWAKE_ALL) {
+		if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
+			xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
+		xe_vm_snapshot_capture_delayed(ss->vm);
+		xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
+	}
 
 	ss->read.chunk_position = 0;
 
@@ -306,7 +305,7 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
 					   GFP_USER);
 		if (!ss->read.buffer)
-			goto put_pm;
+			return;
 
 		__xe_devcoredump_read(ss->read.buffer,
 				      XE_DEVCOREDUMP_CHUNK_MAX,
@@ -314,15 +313,12 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	} else {
 		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
 		if (!ss->read.buffer)
-			goto put_pm;
+			return;
 
 		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
 				      coredump);
 		xe_devcoredump_snapshot_free(ss);
 	}
-
-put_pm:
-	xe_pm_runtime_put(xe);
 }
 
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
@@ -332,7 +328,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	const char *process_name = "no process";
-	unsigned int fw_ref;
 	bool cookie;
 
 	ss->snapshot_time = ktime_get_real();
@@ -348,11 +343,11 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	ss->gt = q->gt;
 	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
 
+	/* keep going if fw fails as we still want to save the memory and SW data */
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
+
 	cookie = dma_fence_begin_signalling();
 
-	/* keep going if fw fails as we still want to save the memory and SW data */
-	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
-
 	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
 	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
 	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
@@ -364,7 +359,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	queue_work(system_unbound_wq, &ss->work);
 
-	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
 	dma_fence_end_signalling(cookie);
 }
 
-- 
2.51.1

