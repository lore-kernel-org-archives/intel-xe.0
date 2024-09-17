Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E73CAC595
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EE410E4EF;
	Tue, 17 Sep 2024 17:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOQdSa5B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE19110E4EE
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 17:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595798; x=1758131798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bx34JWsxUWNxh3hA9rQ2LpSz8FsD+UZP6nc96qVLZf0=;
 b=QOQdSa5BXMTXQxEEwn6fBbuyJKOBPxfFJdBjrGfNGvMYxultzRNnUokW
 QQStdlevF2GkXvcmqpm6Pv/kfMw01PRSA3DnrOgl5ZmyEErDaE0rf1516
 3C6FvhBZVUOuAqNUG/3ULR9YG3SZHOYYxYW6Dd8OqYMET81lVoULVQFpa
 DPjEcV2UifRjc90GlS+fjUZB1BnoOGlPfZTN+NR/Oz6Z+dtLkWC9rW5Um
 OhzWGIK8rB9tIL/4bqYYG95iYG9dTK0ojDLVphIPLzOTo7d9RjwvM/TCQ
 Jpmzj8PGHGyavIHG1Ur41agjoXUWxwPyu8lLODr6k9TRrB7toX3wpySve A==;
X-CSE-ConnectionGUID: wAOW8GUZRuGzdb+JEaLvIw==
X-CSE-MsgGUID: VG0556p1SX2QvWzDVChBww==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13562003"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="13562003"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:56:38 -0700
X-CSE-ConnectionGUID: dxO9rHaXQA6ZNPumza9hMg==
X-CSE-MsgGUID: 8/JHd5dyT1mw693Zs1QYug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="68926477"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2024 10:56:36 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 08/23] drm/xe/devcoredump: Update handling of
 xe_force_wake_get return
Date: Tue, 17 Sep 2024 23:44:10 +0530
Message-Id: <20240917181425.515871-9-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
References: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented domain
mask, a non-zero return value in the case of XE_FORCEWAKE_ALL does not
necessarily indicate success. Compare the return value with
XE_FORCEWAKE_ALL to determine the status of the call.

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index bdb76e834e4c..d1881f95daa4 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -141,13 +141,15 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 {
 	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
 	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
+	xe_wakeref_t fw_ref;
 
 	/* keep going if fw fails as we still want to save the memory and SW data */
-	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
+	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
+	if (fw_ref != XE_FORCEWAKE_ALL)
 		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 	xe_vm_snapshot_capture_delayed(ss->vm);
 	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
-	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
+	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
 
 	/* Calculate devcoredump size */
 	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
@@ -220,8 +222,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	u32 width_mask = (0x1 << q->width) - 1;
 	const char *process_name = "no process";
 
-	int i;
+	xe_wakeref_t fw_ref;
 	bool cookie;
+	int i;
 
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
@@ -244,7 +247,8 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	}
 
 	/* keep going if fw fails as we still want to save the memory and SW data */
-	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
+	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
+	if (fw_ref != XE_FORCEWAKE_ALL)
 		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
@@ -263,7 +267,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	queue_work(system_unbound_wq, &ss->work);
 
-	xe_force_wake_put(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
+	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
 	dma_fence_end_signalling(cookie);
 }
 
-- 
2.34.1

