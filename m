Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84060D6409E
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 01:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485B410E33D;
	Sat,  9 Nov 2024 01:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTKJ07pV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F20E10E339
 for <Intel-Xe@lists.freedesktop.org>; Sat,  9 Nov 2024 01:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731117577; x=1762653577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4shDHUuFoErineLpSg7Vq/CuMY0JACaW62sccacclfY=;
 b=DTKJ07pVsOadl1BNdFzRdjNs6Kggs6blcBN4iC4qtTICyBXzYnKClK3I
 yz1OPP6GgYwP7+5u5mGRPBnJVMWMEKSWyvlu++ug++haxFtrCDgZhvrF0
 kKmBoMxzy6TulGJv8dZUODNg155qZrrXGlDBKQOR/vQQ67ImtP++Q4NYE
 CnnVzEW47oIrq+L5d6tgKsETjDHp8Yvo3JtzoFe2TJs2KHtY+7nV0QHlP
 tCGS2EfTZucTc5jLZZoIkCquXsCZUUJ440mLHN8rHJMMLQsF3GUgWJJGS
 TA0YSBrOotC8jidrpxyL3LE7kGxhEvz0oz1LUN8E7+gGmGDf3FfVvpoei A==;
X-CSE-ConnectionGUID: zGNW7se/Tpmq5EIXekExVg==
X-CSE-MsgGUID: lWUyog3bShSlSe0sQ8HaEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34799513"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="34799513"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 17:59:36 -0800
X-CSE-ConnectionGUID: NCBLwK3fQNiMMZkKz72tBA==
X-CSE-MsgGUID: jCuiwnDNSMu/gTTlxl9DqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="90369014"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 08 Nov 2024 17:59:35 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [RFC 4/5] drm/xe: Make coredump printing to in-memory cache optional
Date: Fri,  8 Nov 2024 17:59:33 -0800
Message-ID: <20241109015934.2203462-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
References: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
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

The devcoredump printing via sysfs is a multi-stage process. After a
binary capture is created, a worker thread is scheduled to convert
the binary data into human readable text stored in a memory
buffer. That buffer is then read via sysfs at a later point.

However, internal driver debug usage of devcoredumps does not
necessarily want to use the in memory buffer and sysfs output method.
E.g. when needing to dump via dmesg for various reasons.

So make the worker thread optional and allow the printing code to be
called with other targets. Also, move blank lines into separate prints
as some print targets need to add per line prefixes.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 98 +++++++++++++++++------------
 drivers/gpu/drm/xe/xe_devcoredump.h |  2 +
 2 files changed, 59 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 53dc79506094..146b5cd4fbe6 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -74,56 +74,69 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
 	return &q->gt->uc.guc;
 }
 
-static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
-				     struct xe_devcoredump *coredump)
+void xe_devcoredump_print(struct drm_printer *p, struct xe_devcoredump *coredump)
 {
 	struct xe_device *xe = coredump->xe;
 	struct xe_devcoredump_snapshot *ss;
-	struct drm_printer p;
-	struct drm_print_iterator iter;
 	struct timespec64 ts;
 	int i;
 
 	ss = &coredump->snapshot;
 
-	iter.data = buffer;
-	iter.start = 0;
-	iter.remain = count;
-
-	p = drm_coredump_printer(&iter);
-
-	drm_puts(&p, "**** Xe Device Coredump ****\n");
-	drm_puts(&p, "kernel: " UTS_RELEASE "\n");
-	drm_puts(&p, "module: " KBUILD_MODNAME "\n");
+	drm_puts(p, "**** Xe Device Coredump ****\n");
+	drm_puts(p, "kernel: " UTS_RELEASE "\n");
+	drm_puts(p, "module: " KBUILD_MODNAME "\n");
 
 	ts = ktime_to_timespec64(ss->snapshot_time);
-	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+	drm_printf(p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
 	ts = ktime_to_timespec64(ss->boot_time);
-	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
-	drm_printf(&p, "Process: %s\n", ss->process_name);
-	xe_device_snapshot_print(xe, &p);
-
-	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
-	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
+	drm_printf(p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+	drm_printf(p, "Process: %s\n", ss->process_name);
+	xe_device_snapshot_print(xe, p);
+
+	drm_puts(p, "\n");
+	drm_printf(p, "**** GT #%d ****\n", ss->gt->info.id);
+	drm_printf(p, "\tTile: %d\n", ss->gt->tile->id);
+
+	drm_puts(p, "\n");
+	drm_puts(p, "**** GuC Log ****\n");
+	xe_guc_log_snapshot_print(ss->guc.log, p);
+	drm_puts(p, "\n");
+	drm_puts(p, "**** GuC CT ****\n");
+	xe_guc_ct_snapshot_print(ss->guc.ct, p);
+
+	drm_puts(p, "\n");
+	drm_puts(p, "**** Contexts ****\n");
+	xe_guc_exec_queue_snapshot_print(ss->ge, p);
+
+	drm_puts(p, "\n");
+	drm_puts(p, "**** Job ****\n");
+	xe_sched_job_snapshot_print(ss->job, p);
+
+	drm_puts(p, "\n");
+	drm_puts(p, "**** HW Engines ****\n");
+	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
+		if (ss->hwe[i])
+			xe_engine_snapshot_print(ss->hwe[i], p);
 
-	drm_puts(&p, "\n**** GuC Log ****\n");
-	xe_guc_log_snapshot_print(ss->guc.log, &p);
-	drm_puts(&p, "\n**** GuC CT ****\n");
-	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
+	drm_puts(p, "\n");
+	drm_puts(p, "**** VM state ****\n");
+	xe_vm_snapshot_print(ss->vm, p);
+}
 
-	drm_puts(&p, "\n**** Contexts ****\n");
-	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
+static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
+				     struct xe_devcoredump *coredump)
+{
+	struct drm_printer p;
+	struct drm_print_iterator iter;
 
-	drm_puts(&p, "\n**** Job ****\n");
-	xe_sched_job_snapshot_print(ss->job, &p);
+	iter.data = buffer;
+	iter.start = 0;
+	iter.remain = count;
 
-	drm_puts(&p, "\n**** HW Engines ****\n");
-	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
-		if (ss->hwe[i])
-			xe_engine_snapshot_print(ss->hwe[i], &p);
+	p = drm_coredump_printer(&iter);
 
-	drm_puts(&p, "\n**** VM state ****\n");
-	xe_vm_snapshot_print(ss->vm, &p);
+	xe_devcoredump_print(&p, coredump);
 
 	return count - iter.remain;
 }
@@ -330,7 +343,8 @@ static void devcoredump_snapshot_xe(struct xe_devcoredump *coredump)
 }
 
 static void devcoredump_snapshot_for_thing(struct xe_devcoredump *coredump,
-					   struct xe_gt *gt, struct xe_sched_job *job)
+					   struct xe_gt *gt, struct xe_sched_job *job,
+					   bool want_work)
 {
 	struct xe_devcoredump_snapshot *ss;
 	struct xe_device *xe;
@@ -356,12 +370,14 @@ static void devcoredump_snapshot_for_thing(struct xe_devcoredump *coredump,
 	else
 		devcoredump_snapshot_xe(coredump);
 
-	queue_work(system_unbound_wq, &ss->work);
+	if (want_work)
+		queue_work(system_unbound_wq, &ss->work);
 
 	dma_fence_end_signalling(cookie);
 }
 
-static void devcoredump_for_thing(struct xe_device *_xe, struct xe_gt *gt, struct xe_sched_job *job)
+static void devcoredump_for_thing(struct xe_device *_xe, struct xe_gt *gt,
+				  struct xe_sched_job *job, bool want_work)
 {
 	struct xe_devcoredump *coredump;
 	struct xe_device *xe;
@@ -375,7 +391,7 @@ static void devcoredump_for_thing(struct xe_device *_xe, struct xe_gt *gt, struc
 	}
 
 	coredump->xe = xe;
-	devcoredump_snapshot_for_thing(coredump, gt, job);
+	devcoredump_snapshot_for_thing(coredump, gt, job, want_work);
 
 	drm_info(&xe->drm, "Xe device coredump has been created\n");
 	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
@@ -396,7 +412,7 @@ static void devcoredump_for_thing(struct xe_device *_xe, struct xe_gt *gt, struc
  */
 void xe_devcoredump_for_job(struct xe_sched_job *job)
 {
-	devcoredump_for_thing(NULL, NULL, job);
+	devcoredump_for_thing(NULL, NULL, job, true);
 }
 
 /**
@@ -409,7 +425,7 @@ void xe_devcoredump_for_job(struct xe_sched_job *job)
  */
 void xe_devcoredump_for_gt(struct xe_gt *gt)
 {
-	devcoredump_for_thing(NULL, gt, NULL);
+	devcoredump_for_thing(NULL, gt, NULL, true);
 }
 
 /**
@@ -422,7 +438,7 @@ void xe_devcoredump_for_gt(struct xe_gt *gt)
  */
 void xe_devcoredump_for_xe(struct xe_device *xe)
 {
-	devcoredump_for_thing(xe, NULL, NULL);
+	devcoredump_for_thing(xe, NULL, NULL, true);
 }
 
 static void xe_driver_devcoredump_fini(void *arg)
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
index a83c93d0e82c..1d2f9bbd4ebe 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -10,6 +10,7 @@
 
 struct drm_printer;
 struct xe_device;
+struct xe_devcoredump;
 struct xe_gt;
 struct xe_sched_job;
 
@@ -29,6 +30,7 @@ static inline int xe_devcoredump_init(struct xe_device *xe)
 }
 #endif
 
+void xe_devcoredump_print(struct drm_printer *p, struct xe_devcoredump *coredump);
 void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
 			   const void *blob, size_t offset, size_t size);
 
-- 
2.47.0

