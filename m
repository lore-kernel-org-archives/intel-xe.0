Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15031CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 09:33:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5C110EAAD;
	Fri, 22 Aug 2025 09:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f1IkCtBP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E4E10EAAD
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 09:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755855222; x=1787391222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JewFJZImXoOL2gnD+GoYuDTdCZx5lZIOasLi0Kcfbew=;
 b=f1IkCtBPVgRlhCnZ5q2Z8zv9q39hjWcHmKaSTsypw3gmbHfTQam2t59r
 S0bQZPjVV8HPBaIDlPKHon1SgFHZvR14FT/jXbJlDbkPq/RR1z4edzo1L
 6Z+vbRqdaU0pfLWidj+r3+t3OYm9Avy+aAu8tOECOXdHZyuWGMCo7V6HD
 J/On76yOI7ChfuzEWlCIrQ1GYZIAJuGCfhyXTkU6Sh+JeBfgViZnI9jUQ
 jQc87jr432EdKf5aAhSaE6SArQDS7gatenLHQ5DTxgDdkA1lXQpjHmKG/
 0T7+ysDB/54S3zYVk4xSnkxKd6Cd0+3LX2NoqK4xlyzTicLdnUsyb9Y/r A==;
X-CSE-ConnectionGUID: pR8bpxIyQ3Sa2JdkdoPYPQ==
X-CSE-MsgGUID: YlIf8SU3R6ijxHJ58Bn1OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80759907"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="80759907"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:33:42 -0700
X-CSE-ConnectionGUID: i7dzbY2eShOuLtmDoLubmA==
X-CSE-MsgGUID: puQ+6lu9TzSvFUmd17zrWQ==
X-ExtLoop1: 1
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa003.fm.intel.com with ESMTP; 22 Aug 2025 02:33:40 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, carlos.santa@intel.com,
 rodrigo.vivi@intel.com, matthew.brost@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v2 4/8] [ANDROID]: Modify xe_exec_queue_update_run_ticks
Date: Fri, 22 Aug 2025 08:59:26 +0000
Message-ID: <20250822085932.2221054-5-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250822085932.2221054-1-aakash.deep.sarkar@intel.com>
References: <20250822085932.2221054-1-aakash.deep.sarkar@intel.com>
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

For GPU work period event we need to record the run time of a
context on the GPU in nanosecs. In the present xe driver code,
we only record the run time in clock ticks and separately for
each engine class.

So, we are adding a uint64 variable |active_duration_ns| in
the xe file structure where we can record the cumulative
run time in ns of all the engines for this context. The
intent here is to add up the |active_duration_ns| in
all the xe files belonging to a given user id to derive
the run time for that user id.

Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 3 +++
 drivers/gpu/drm/xe/xe_exec_queue.c   | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 01e8fa0d2f9f..c4f076a26291 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -656,6 +656,9 @@ struct xe_file {
 	/** @run_ticks: hw engine class run time in ticks for this drm client */
 	u64 run_ticks[XE_ENGINE_CLASS_MAX];
 
+	/** @active_duration_ns: total run time in ns for this xe file */
+	u64 active_duration_ns;
+
 	/** @client: drm client */
 	struct xe_drm_client *client;
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 2d10a53f701d..2ee8a475f5ed 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -15,6 +15,7 @@
 #include "xe_dep_scheduler.h"
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_clock.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_hw_engine_group.h"
 #include "xe_hw_fence.h"
@@ -879,6 +880,8 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 {
 	struct xe_device *xe = gt_to_xe(q->gt);
 	struct xe_lrc *lrc;
+	struct xe_gt *gt = q->gt;
+
 	u64 old_ts, new_ts;
 	int idx;
 
@@ -904,6 +907,10 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
 	q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
 
+	// Accumulate the runtime in nanosec for this queue into the xe file.
+	q->xef->active_duration_ns +=
+		xe_gt_clock_interval_to_ns(gt, (new_ts - old_ts));
+
 	drm_dev_exit(idx);
 }
 
-- 
2.49.0

