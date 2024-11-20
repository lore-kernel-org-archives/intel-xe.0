Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE43D743ED
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 23:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1791010E7D5;
	Wed, 20 Nov 2024 23:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AAyPwrdD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF79D10E2DA
 for <Intel-Xe@lists.freedesktop.org>; Wed, 20 Nov 2024 23:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732144978; x=1763680978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Eg1oFSImYjlcaZ/dLpPxWSXp4Zsb93Pf5zT0sleYpKs=;
 b=AAyPwrdDhO2ipsRmDSCmZudjtV6Mm/P0kAj16uVlO/UffEE9JgfL4niD
 C4hOtPXvLTf2VwIg8X4gupk3h52SmbolqP8FJAFRZUA69uVfPgRdg0QOB
 zYSw2G1Up9YYfbDQvXTslR97enK6Rk3dtzjOpFd4hD9s6vapzD8m7cSvB
 9IT/YMR/CRK9puwWwJYOq0eaBOmsmxm1v3MwHR5NhV7m+VVeBH3QTkTpM
 Q1nB4V4Apc6UtEmsP1rkWVPkxaan0duTFSdPPwhSn4yMuNS1P18wPfI0f
 WcFCC+ex230IJ8hoKgt4cF/kdvl250zCSHhRvQ1MkIAmyng1IcasK01fp Q==;
X-CSE-ConnectionGUID: HbYY6kpmRh209gDEvcrkSQ==
X-CSE-MsgGUID: 5OR5fV+fTS+ufhNjZbz3EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32481211"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="32481211"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:22:58 -0800
X-CSE-ConnectionGUID: 29m2bOT+QfymT9/nzrFWCg==
X-CSE-MsgGUID: JnswL/g0QluzvlPMxKFufQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="90863999"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 20 Nov 2024 15:22:58 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/2] drm/xe: Add lock around devcoredump capture status
Date: Wed, 20 Nov 2024 15:22:57 -0800
Message-ID: <20241120232257.1025282-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120232257.1025282-1-John.C.Harrison@Intel.com>
References: <20241120232257.1025282-1-John.C.Harrison@Intel.com>
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
to a crashed kernel. So add the lock.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 18 ++++++++++++++----
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 ++
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index b5aebe8fb06d..05f3c9185ef3 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -235,9 +235,13 @@ static void xe_devcoredump_free(void *data)
 
 	/* To prevent stale data on next snapshot, clear everything */
 	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
-	coredump->captured = false;
+
 	drm_info(&coredump_to_xe(coredump)->drm,
 		 "Xe device coredump has been deleted.\n");
+
+	spin_lock_irq(&coredump->lock);
+	coredump->captured = false;
+	spin_unlock_irq(&coredump->lock);
 }
 
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
@@ -310,14 +314,18 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
 	struct xe_device *xe = gt_to_xe(q->gt);
 	struct xe_devcoredump *coredump = &xe->devcoredump;
 	va_list varg;
+	bool captured;
 
-	if (coredump->captured) {
+	spin_lock_irq(&coredump->lock);
+	captured = coredump->captured;
+	coredump->captured = true;
+	spin_unlock_irq(&coredump->lock);
+
+	if (captured) {
 		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
 		return;
 	}
 
-	coredump->captured = true;
-
 	va_start(varg, fmt);
 	coredump->snapshot.reason = kvasprintf(GFP_KERNEL, fmt, varg);
 	va_end(varg);
@@ -342,6 +350,8 @@ static void xe_driver_devcoredump_fini(void *arg)
 
 int xe_devcoredump_init(struct xe_device *xe)
 {
+	spin_lock_init(&xe->devcoredump.lock);
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index e6234e887102..6b776abd8bf4 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -80,6 +80,8 @@ struct xe_devcoredump_snapshot {
  * for reading the information.
  */
 struct xe_devcoredump {
+	/** @lock: protects access to 'captured' to prevent concurrent captures */
+	spinlock_t lock;
 	/** @captured: The snapshot of the first hang has already been taken. */
 	bool captured;
 	/** @snapshot: Snapshot is captured at time of the first crash */
-- 
2.47.0

