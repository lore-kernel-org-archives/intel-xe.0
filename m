Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A101EE65D03
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 22:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7244C10EA75;
	Thu, 21 Nov 2024 22:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zq+a/PvF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300D210EA7E
 for <Intel-Xe@lists.freedesktop.org>; Thu, 21 Nov 2024 22:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732229743; x=1763765743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gQUSygVPYupsZUv69ZItrbwZ3c/RgT25/qunueIoImY=;
 b=Zq+a/PvFCxuVY4MJCFm6Gxwcab5LAXAWdPAlghwptXJOweL+ZD2aJGZ3
 dK7rlciWbFYL1ExO/cxVTauc4Vex6qDsEpDnW+BP4IKCkmNXrtWHb0gxG
 aimA/fpjulHpoc+MAvARvZZwtGh4enWIhxTB0ynFjOCf03ZZk/Esd8a8g
 EYNYra9RnCiGQydXu8DqmneDHJt8wumfQAsmQ21HH4x1BVZJjbsQ4ZQql
 nhKW9lA1RQ+TWBxwtzPiQH61s7B+4M+L1PDPnr/ckTKlUzjCHGO5+0mEn
 0xf/Q3468S45TJQJcarC4gjF+2ier/TRjtUifWFTERizli0RDYRRKsMPp A==;
X-CSE-ConnectionGUID: q/lsJc5IQZmmSitsx+YTPQ==
X-CSE-MsgGUID: YMDpxkowSR+xSMqIT3Tz5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42885958"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="42885958"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 14:55:43 -0800
X-CSE-ConnectionGUID: xNMdEyEMQFGGuJomeenfvQ==
X-CSE-MsgGUID: MAPCF66dRZ2oZLpUM1d15Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90194320"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa007.fm.intel.com with ESMTP; 21 Nov 2024 14:55:42 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 2/2] drm/xe: Add mutex locking to devcoredump
Date: Thu, 21 Nov 2024 14:55:42 -0800
Message-ID: <20241121225542.1336796-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121225542.1336796-1-John.C.Harrison@Intel.com>
References: <20241121225542.1336796-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

There are now multiple places that can trigger a coredump. Some of
which can happen in parallel. There is already a check against
capturing multiple dumps sequentially, but without locking it doesn't
guarantee to work against concurrent dumps. And if two dumps do happen
in parallel, they can end up doing Bad Things such as one call stack
freeing the data the other call stack is still processing. Which leads
to a crashed kernel.

Further, it is possible for the DRM timeout to expire and trigger a
free of the capture while a user is still reading that capture out
through sysfs. Again leading to dodgy pointer problems.

So, add a mutext lock around the capture, read and free functions to
prevent inteference.

v2: Swap tiny scope spin_lock for larger scope mutex and fix
kernel-doc comment (review feedback from Matthe Brost)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 26 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 +++-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index dd48745a8a46..0621754ddfd2 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -202,21 +202,29 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	if (!coredump)
 		return -ENODEV;
 
+	mutex_lock(&coredump->lock);
+
 	ss = &coredump->snapshot;
 
 	/* Ensure delayed work is captured before continuing */
 	flush_work(&ss->work);
 
-	if (!ss->read.buffer)
+	if (!ss->read.buffer) {
+		mutex_unlock(&coredump->lock);
 		return -ENODEV;
+	}
 
-	if (offset >= ss->read.size)
+	if (offset >= ss->read.size) {
+		mutex_unlock(&coredump->lock);
 		return 0;
+	}
 
 	byte_copied = count < ss->read.size - offset ? count :
 		ss->read.size - offset;
 	memcpy(buffer, ss->read.buffer + offset, byte_copied);
 
+	mutex_unlock(&coredump->lock);
+
 	return byte_copied;
 }
 
@@ -228,6 +236,8 @@ static void xe_devcoredump_free(void *data)
 	if (!data || !coredump_to_xe(coredump))
 		return;
 
+	mutex_lock(&coredump->lock);
+
 	cancel_work_sync(&coredump->snapshot.work);
 
 	xe_devcoredump_snapshot_free(&coredump->snapshot);
@@ -238,6 +248,8 @@ static void xe_devcoredump_free(void *data)
 	coredump->captured = false;
 	drm_info(&coredump_to_xe(coredump)->drm,
 		 "Xe device coredump has been deleted.\n");
+
+	mutex_unlock(&coredump->lock);
 }
 
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
@@ -312,8 +324,11 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
 	struct xe_devcoredump *coredump = &xe->devcoredump;
 	va_list varg;
 
+	mutex_lock(&coredump->lock);
+
 	if (coredump->captured) {
 		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
+		mutex_unlock(&coredump->lock);
 		return;
 	}
 
@@ -332,6 +347,7 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
 	dev_coredumpm_timeout(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
 			      xe_devcoredump_read, xe_devcoredump_free,
 			      XE_COREDUMP_TIMEOUT_JIFFIES);
+	mutex_unlock(&coredump->lock);
 }
 
 static void xe_driver_devcoredump_fini(void *arg)
@@ -343,6 +359,12 @@ static void xe_driver_devcoredump_fini(void *arg)
 
 int xe_devcoredump_init(struct xe_device *xe)
 {
+	int err;
+
+	err = drmm_mutex_init(&xe->drm, &xe->devcoredump.lock);
+	if (err)
+		return err;
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index e6234e887102..1a1d16a96b2d 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -80,7 +80,9 @@ struct xe_devcoredump_snapshot {
  * for reading the information.
  */
 struct xe_devcoredump {
-	/** @captured: The snapshot of the first hang has already been taken. */
+	/** @lock: protects access to entire structure */
+	struct mutex lock;
+	/** @captured: The snapshot of the first hang has already been taken */
 	bool captured;
 	/** @snapshot: Snapshot is captured at time of the first crash */
 	struct xe_devcoredump_snapshot snapshot;
-- 
2.47.0

