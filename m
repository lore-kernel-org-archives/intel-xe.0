Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCEAC46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 20:03:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C38A10E3E2;
	Tue, 30 Jan 2024 20:03:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1474210E3E2
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 20:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706645001; x=1738181001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iK/f668+FcXew2ilKtevEqx3K8+N4WXWAi1dj3i1AOI=;
 b=UuYIIiCBfCsT8I3lz0v0eA3p7OpodOoXb/uLlxx8I3vqhblmzNEqLZHq
 E7CrqF2FRBW89j6cMlO4s/nQpskUMh7O0tlQO4KwwZlSB7OKlYHwAlGUR
 Tp3+R2b/G5DDIvio9u8uyec0VZF4wZ0LD9WmVo4W6oKF6XwP7bn04VbZe
 ZAVRmL4zysI2B6iEzkXsUiNbFfoPnGpC0m6WjkADbWfnxdJ+Ljp67RUkD
 4246a26ehHy+q48312dt0G4OKSANJWaF4csElPSb65StrsVb8NRM0cpQo
 icRHNngshr6o1zNBUzZtPIEYn1r//PG/mCrUZiQAn7NledtKpReQH1ntb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="21908378"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="21908378"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 12:03:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119385544"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="1119385544"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.132])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 12:03:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe: Convert job timeouts from assert to warning
Date: Tue, 30 Jan 2024 12:03:09 -0800
Message-ID: <20240130200308.1429134-2-matthew.d.roper@intel.com>
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

xe_assert() is intended to be used only for "impossible" situations that
should never be hit (and if they are hit it means there's a driver bug
somewhere); assertions are only compiled into debug builds.

Although we expect jobs submitted by the kernel to be well-behaved and
run without error, timeouts are a legitimate possibility for reasons
beyond our control (bad firmware, flaky hardware, etc.).  We should use
a real WARN if we encounter these, even for non-debug builds, to ensure
the issue is being properly highlighted in bug reports and such.

Also give the WARNs more human-readable messages and move them below the
general notice-level message that gets printed for any kind of timeout
to make the errors a bit more understandable.

v2:
 - Convert the VM / exec_queue_killed assertion as well.  (MattB)

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 2b008ec1b6de..4744668ef60a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -23,6 +23,7 @@
 #include "xe_force_wake.h"
 #include "xe_gpu_scheduler.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_exec_queue_types.h"
@@ -928,11 +929,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	int i = 0;
 
 	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
-		xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
-		xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)));
-
 		drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
 			   xe_sched_job_seqno(job), q->guc->id, q->flags);
+		xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
+			   "Kernel-submitted job timed out\n");
+		xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
+			   "VM job timed out on non-killed execqueue\n");
+
 		simple_error_capture(q);
 		xe_devcoredump(job);
 	} else {
-- 
2.43.0

