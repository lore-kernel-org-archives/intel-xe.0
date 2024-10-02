Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDDBCF8543
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 21:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC74710E0D6;
	Wed,  2 Oct 2024 21:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RidmhFKd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAC210E009
 for <Intel-Xe@lists.freedesktop.org>; Wed,  2 Oct 2024 21:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727903664; x=1759439664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xD4DyeIo5PRgEvCLOrYhagEDuHgfBg/nhDKXwYzusYs=;
 b=RidmhFKdK8R+zwX9JySKTUQM1bXH/fSOIKZ6dgLdn8SC4WNaUC+xMd4r
 BnEoqpKWbUZMYHk4cNHR6Sj4Fy3yzwyUptMwLJ5eGYTCS3/mGhiC/sCBg
 VhSLvRgRvpDqTo80BLWY7zE604LLvfAY46qDbEuQtqKyEWJOa/ZEO6Okz
 YouB+eFmAiQk2eWmN8oJQaH9Eb2qoD2TQ+Sy87NtHW8+QMeqvJD2A/sk4
 u+cuiPltrz6a8ptFOntSNa8b9ETDJ0e6vNOQYTneEdFzBLUDAibXVyL3R
 qWjDZeqJz/u6qj8wehayFUQ0cUuPNVPiSeRu3t1pEnihQjHYyECkRhVlO A==;
X-CSE-ConnectionGUID: LHJ8cy8wQju9TnRRCAd3Ww==
X-CSE-MsgGUID: KK5hkj5sQf6/TEHrqof6Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30879592"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="30879592"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 14:14:24 -0700
X-CSE-ConnectionGUID: 3aa69AltQw+1sQYnqpdQxA==
X-CSE-MsgGUID: L4AcZsz4QeejttvusxMTLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="111584915"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa001.jf.intel.com with ESMTP; 02 Oct 2024 14:14:23 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v9 02/11] drm/xe/devcoredump: Use drm_puts and already cached
 local variables
Date: Wed,  2 Oct 2024 14:14:13 -0700
Message-ID: <20241002211422.2135130-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241002211422.2135130-1-John.C.Harrison@Intel.com>
References: <20241002211422.2135130-1-John.C.Harrison@Intel.com>
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

There are a bunch of calls to drm_printf with static strings. Switch
them to drm_puts instead.

There are also a bunch of 'coredump->snapshot.XXX' references when
'coredump->snapshot' has alread been cached locally as 'ss'. So use
'ss->XXX' instead.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 40 ++++++++++++++---------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index bdb76e834e4c..d23719d5c2a3 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -85,9 +85,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 
 	p = drm_coredump_printer(&iter);
 
-	drm_printf(&p, "**** Xe Device Coredump ****\n");
-	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
-	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
+	drm_puts(&p, "**** Xe Device Coredump ****\n");
+	drm_puts(&p, "kernel: " UTS_RELEASE "\n");
+	drm_puts(&p, "module: " KBUILD_MODNAME "\n");
 
 	ts = ktime_to_timespec64(ss->snapshot_time);
 	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
@@ -96,20 +96,20 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	drm_printf(&p, "Process: %s\n", ss->process_name);
 	xe_device_snapshot_print(xe, &p);
 
-	drm_printf(&p, "\n**** GuC CT ****\n");
-	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
-	xe_guc_exec_queue_snapshot_print(coredump->snapshot.ge, &p);
+	drm_puts(&p, "\n**** GuC CT ****\n");
+	xe_guc_ct_snapshot_print(ss->ct, &p);
+	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
-	drm_printf(&p, "\n**** Job ****\n");
-	xe_sched_job_snapshot_print(coredump->snapshot.job, &p);
+	drm_puts(&p, "\n**** Job ****\n");
+	xe_sched_job_snapshot_print(ss->job, &p);
 
-	drm_printf(&p, "\n**** HW Engines ****\n");
+	drm_puts(&p, "\n**** HW Engines ****\n");
 	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
-		if (coredump->snapshot.hwe[i])
-			xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
-						    &p);
-	drm_printf(&p, "\n**** VM state ****\n");
-	xe_vm_snapshot_print(coredump->snapshot.vm, &p);
+		if (ss->hwe[i])
+			xe_hw_engine_snapshot_print(ss->hwe[i], &p);
+
+	drm_puts(&p, "\n**** VM state ****\n");
+	xe_vm_snapshot_print(ss->vm, &p);
 
 	return count - iter.remain;
 }
@@ -247,18 +247,18 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
 		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 
-	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
-	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(q);
-	coredump->snapshot.job = xe_sched_job_snapshot_capture(job);
-	coredump->snapshot.vm = xe_vm_snapshot_capture(q->vm);
+	ss->ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
+	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
+	ss->job = xe_sched_job_snapshot_capture(job);
+	ss->vm = xe_vm_snapshot_capture(q->vm);
 
 	for_each_hw_engine(hwe, q->gt, id) {
 		if (hwe->class != q->hwe->class ||
 		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
-			coredump->snapshot.hwe[id] = NULL;
+			ss->hwe[id] = NULL;
 			continue;
 		}
-		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
+		ss->hwe[id] = xe_hw_engine_snapshot_capture(hwe);
 	}
 
 	queue_work(system_unbound_wq, &ss->work);
-- 
2.46.0

