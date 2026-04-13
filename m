Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE36F531CE
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 23:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0C010E3E9;
	Mon, 13 Apr 2026 23:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtQTxTmn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B81010E3E9
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 23:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776121658; x=1807657658;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NaK8xEZlLODiJSE+xbrqmKZe7wV2jQ5JHgFpba5aHG8=;
 b=OtQTxTmn5ttyOoesjo78ZIeLGUNRR3eodWsGcXhS9OZgII5fMK2pZPBW
 Ur6B0+mZkOLYwHq2J5sQiYyzAhJFA6dEaPSw4Umg6Y6CaYXXNiGK4RNoV
 vTPHp6Mt2eYHNEIfISWbnLXTM1ohY470xCXOVuhHG6VTYgYkk4U5AuWII
 JIu5HhA8DeJ9M3H+gNWspNgzufbv1jJNZlDxIQ1JDaQASNz+7n9J8lK3N
 wRMDE8pEsxxQH64EOS62R0qUT/R8ClVQ+9vu59Mc1NsuAb/rij1GVl4gD
 8cFYLI7cjeeCazivGxF9pJ7BiqbiWLuY3UCDvyPF48TVmvzQIfC+crlys A==;
X-CSE-ConnectionGUID: 2Tu7+5gsSU+FWDA3iplPTA==
X-CSE-MsgGUID: NhZ6hLBnT5qsUxoPQku4QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77137782"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="77137782"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 16:07:37 -0700
X-CSE-ConnectionGUID: x3RdyAufT7G+lwmv8FLQ5w==
X-CSE-MsgGUID: MlBhKorrQs26h4nbmSGXpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="228877140"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 16:07:36 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe: Suppress reset log for killed queues
Date: Mon, 13 Apr 2026 16:07:24 -0700
Message-ID: <20260413230724.714884-2-daniele.ceraolospurio@intel.com>
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

When an app exits abruptly (for example due to the user hitting ctrl+c),
any of its queues that are still active on the HW are immediately
killed. As part of this process, the driver tells the GuC to preempt
the queues off the HW and to reset them if they don't preempt.
This can cause a reset log to be printed to dmesg, which can be confusing
to users as resets are commonly tied to errors, while any resets performed
in this case are just done to speed up the cleanup. Also, those reset
messages are not useful for debug, because we don't care what happens to
a queue once its app has exited.

The only case where a queue might be killed before the app that owns it
has exited is if the queue uses PXP and a PXP termination occurs. In
such scenario a log might be useful, but rather than a reset log it is
better to have a communication that the queue is being killed.

Therefore, we can silence the reset log for all killed queues and add a
simple debug log to record when a PXP queue is killed to cover that case.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
v2: silence for all killed queues instead of just destroyed ones (Matt),
rework commit message, add log for PXP killing.
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
 drivers/gpu/drm/xe/xe_pxp.c        | 6 ++++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 10556156eaad..b1222b42174c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2968,9 +2968,10 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
-	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
-		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
-		   atomic_read(&q->guc->state));
+	if (!exec_queue_killed(q))
+		xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
+			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
+			   atomic_read(&q->guc->state));
 
 	trace_xe_exec_queue_reset(q);
 
diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index d570ab3717df..d9af4d6d4bb9 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -13,9 +13,11 @@
 #include "xe_device_types.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
+#include "xe_guc_exec_queue_types.h"
 #include "xe_guc_submit.h"
 #include "xe_gsc_proxy.h"
 #include "xe_gt_types.h"
+#include "xe_hw_engine.h"
 #include "xe_huc.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
@@ -755,6 +757,10 @@ static void pxp_invalidate_queues(struct xe_pxp *pxp)
 	spin_unlock_irq(&pxp->queues.lock);
 
 	list_for_each_entry_safe(q, tmp, &to_clean, pxp.link) {
+		drm_dbg(&pxp->xe->drm,
+			"Killing queue due to PXP termination: eclass=%s, guc_id=%d\n",
+			xe_hw_engine_class_to_str(q->class), q->guc->id);
+
 		xe_exec_queue_kill(q);
 
 		/*
-- 
2.43.0

