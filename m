Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774C5E65D15
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 02:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112FB10EAAC;
	Fri, 22 Nov 2024 02:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F4Ay2++M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292D610EACA
 for <Intel-Xe@lists.freedesktop.org>; Fri, 22 Nov 2024 02:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732244040; x=1763780040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zsOt9xGqoGZQEr3kYp+UIzxsbyyzVRuj+rXN37H22cc=;
 b=F4Ay2++Mg+gJh19b26h9JdDJ4Cr9/xs472KnEWJi5jB8quZt6Plagrex
 AOC286EEFoZbbThiDmdtidORrfhcNYxFlYhCQO64z3odlxCOoITJXyYoR
 O4vjvmo/BQFSLi1GlqGNjfAvRnYPGZrnDFaU6udhseHuehkoMmsDitlSi
 YSM+uBR1My1YEBnUeHoYjZOL7YUQPuVIHy0BGPNUhnHaNBuQbM0Y0oucT
 45mWMegWe3tHIDg5Aos0zayyR+SnMDpb2SAakH1QFd1aGHiFeuKniafpp
 5dxnVXI65ArSsPHuJ/CEXetyukyAMvzWwh5Rfo6YwiXt2f/rUFjVvn0vl w==;
X-CSE-ConnectionGUID: 2EorKEXwQLqJg/3m0hyb9Q==
X-CSE-MsgGUID: A4ElpOKuRk2tXF15V6MEwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43001894"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="43001894"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 18:53:58 -0800
X-CSE-ConnectionGUID: lpkumZNxQUSogffxxtLmHA==
X-CSE-MsgGUID: cwbOx61XQHiHZtz6zKbH1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="95524970"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 21 Nov 2024 18:53:58 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 2/2] drm/xe: Add mutex locking to devcoredump
Date: Thu, 21 Nov 2024 18:53:57 -0800
Message-ID: <20241122025357.1398385-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241122025357.1398385-1-John.C.Harrison@Intel.com>
References: <20241122025357.1398385-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 32 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ++-
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index f4c77f525819..376583a4a42e 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -207,16 +207,24 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
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
 
@@ -230,6 +238,8 @@ static void xe_devcoredump_free(void *data)
 
 	cancel_work_sync(&coredump->snapshot.work);
 
+	mutex_lock(&coredump->lock);
+
 	xe_devcoredump_snapshot_free(&coredump->snapshot);
 	kvfree(coredump->snapshot.read.buffer);
 
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
@@ -343,6 +359,18 @@ static void xe_driver_devcoredump_fini(void *arg)
 
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
+		might_lock(&xe->devcoredump->lock);
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

