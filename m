Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6114C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 18:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918711131FE;
	Tue, 30 Jan 2024 18:05:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3029D113233
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 18:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706637918; x=1738173918;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9660IT99iKk4M+Mp+CaZ66nW69EcJbTW3L35IZF3Uwk=;
 b=S4dQjtFqI3huSE2ktWgx+UcjQh66Gnw3jrXHUQhV5wQMHIiYL00/oRfn
 7IbQ0JVX+wxcEXyojgquwHZvaxTENujVweYbOx8CByHfw8H+cw4uGjrZ1
 6ZxP48mWVij7/fJftOQ4d1tge8Celk44PLZtHzW24YTwLbzGCIp5GI7pI
 OnBrQR1wHsWMCaTB5VmnCoITKECWdx5yVBlgHqOW9hbbPHUZaCSaQKyIo
 0Hn/jZ45owepEsn57NPMYvR08CDqkfIuxy/VQqMgibNTb50PiXuHV4nZI
 en0PYx26r2SlsT+QyFiR2bidcEcXfB3Xeerw+jjYHTnIWpcDtAr5P+0nv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434532626"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="434532626"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 10:05:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="29980255"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 10:05:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Convert kernel job timeout from assert to warning
Date: Tue, 30 Jan 2024 10:04:53 -0800
Message-ID: <20240130180452.1416603-2-matthew.d.roper@intel.com>
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

Also give the WARN a more human-readable message and move it below the
general notice-level message that gets printed for any kind of timeout
to make the errors a bit more understandable.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 2b008ec1b6de..4efc9601e050 100644
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
@@ -928,11 +929,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	int i = 0;
 
 	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
-		xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
 		xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)));
 
 		drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
 			   xe_sched_job_seqno(job), q->guc->id, q->flags);
+		xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
+			   "Kernel-submitted job timed out");
 		simple_error_capture(q);
 		xe_devcoredump(job);
 	} else {
-- 
2.43.0

