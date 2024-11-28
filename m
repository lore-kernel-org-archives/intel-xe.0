Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0BED70DEB
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 21:08:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E2F10ED59;
	Thu, 28 Nov 2024 21:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VehdbXbO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546D810E4A0
 for <Intel-Xe@lists.freedesktop.org>; Thu, 28 Nov 2024 21:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732828106; x=1764364106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x8/NRZbRN8hPafQLa8tkDhrtfTogi0xC5sier+wCBpE=;
 b=VehdbXbOvAdWtpjjOB0+3Elqdx91sBl95z555mw+d3NHMMsgMlQdRqqZ
 iM0G5+CW4u3cXT9S818tbXVvpJEbB/K6qmu5CqGHLq1q2B8Q5nenQ9O98
 ccQtj45bTnVmc+iIIb+dkAfaJf85vdNvN8+HV+9AG+2OiOC0nGdCsygkK
 kisuoZQiMV/Y7UVfL+j2AEOJCp1DfuW18/YFNLjqT4gss5+eK/Ieovoo+
 u+34MFPY7d6zeZ+vJDHKGAO0n1yLCTAPrsaYmxTov37T7FZdXGBUg6FD+
 vm81misdXEi4avdXSw0IticDsXbGJy4sIG0UTgAksLiJlmKCWxS4r+o3a A==;
X-CSE-ConnectionGUID: Z9bKKH5bRIOxOIpiFpDV6A==
X-CSE-MsgGUID: IeigWGQnRcKxnPsOs9C+5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33311949"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="33311949"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 13:08:25 -0800
X-CSE-ConnectionGUID: 0sn1bdkcS5CciuryCqq5cw==
X-CSE-MsgGUID: O+JQqVbvRneGGHHdnKKFsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="93165068"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 28 Nov 2024 13:08:25 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 3/3] drm/xe: Add mutex locking to devcoredump
Date: Thu, 28 Nov 2024 13:08:24 -0800
Message-ID: <20241128210824.3302147-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128210824.3302147-1-John.C.Harrison@Intel.com>
References: <20241128210824.3302147-1-John.C.Harrison@Intel.com>
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
kernel-doc comment (review feedback from Matthew Brost)
v3: Move mutex locks to exclude worker thread and add reclaim
annotation (review feedback from Matthew Brost)
v4: Fix typo.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 33 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ++-
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index d24f1088e298..71636e80b71d 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -183,16 +183,24 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	/* Ensure delayed work is captured before continuing */
 	flush_work(&ss->work);
 
-	if (!ss->read.buffer)
+	mutex_lock(&coredump->lock);
+
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
 
@@ -206,6 +214,8 @@ static void xe_devcoredump_free(void *data)
 
 	cancel_work_sync(&coredump->snapshot.work);
 
+	mutex_lock(&coredump->lock);
+
 	xe_devcoredump_snapshot_free(&coredump->snapshot);
 	kvfree(coredump->snapshot.read.buffer);
 
@@ -214,6 +224,8 @@ static void xe_devcoredump_free(void *data)
 	coredump->captured = false;
 	drm_info(&coredump_to_xe(coredump)->drm,
 		 "Xe device coredump has been deleted.\n");
+
+	mutex_unlock(&coredump->lock);
 }
 
 static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
@@ -327,8 +339,11 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
 	struct xe_devcoredump *coredump = &xe->devcoredump;
 	va_list varg;
 
+	mutex_lock(&coredump->lock);
+
 	if (coredump->captured) {
 		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
+		mutex_unlock(&coredump->lock);
 		return;
 	}
 
@@ -343,6 +358,8 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
 	drm_info(&xe->drm, "Xe device coredump has been created\n");
 	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
 		 xe->drm.primary->index);
+
+	mutex_unlock(&coredump->lock);
 }
 
 static void xe_driver_devcoredump_fini(void *arg)
@@ -354,6 +371,18 @@ static void xe_driver_devcoredump_fini(void *arg)
 
 int xe_devcoredump_init(struct xe_device *xe)
 {
+	int err;
+
+	err = drmm_mutex_init(&xe->drm, &xe->devcoredump.lock);
+	if (err)
+		return err;
+
+	if (IS_ENABLED(CONFIG_LOCKDEP)) {
+		fs_reclaim_acquire(GFP_KERNEL);
+		might_lock(&xe->devcoredump.lock);
+		fs_reclaim_release(GFP_KERNEL);
+	}
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

