Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A70CA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 09:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447B210EBF0;
	Fri, 12 Sep 2025 09:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XxStXVpI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D8010EBF0
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 09:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757669799; x=1789205799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JewFJZImXoOL2gnD+GoYuDTdCZx5lZIOasLi0Kcfbew=;
 b=XxStXVpI/ROrDkeB3xKNw/MSPq+CndPl02xFjM61IEqdq9iGYsR0QUJ8
 0sHwoM/vuRNL5IEfz4l/oJOEsUMjQCVMHRtUn0m8b8AywK9jJb1m/xUq0
 ko0aF78YGYey/7DeFUtRCZWzd5GYW5s1TUK8tWP46OET1p07RIt+6gbfy
 aCm3e1lOkBW7NHf6zxFVnXllsiSBG2Es2Qj1hsrP3ZGAKMu0/ttVj4UVt
 9YABYfjkvTTBHTQmMu5t3co66tpotUAcHPBuVhkvnfwVueZ0eBRjQlqFs
 7uLGpBccoIiRrZtJJIV1qSWAlODa4SENlVfhBAkg+BGGbljQ1lmWxt99V A==;
X-CSE-ConnectionGUID: 2sMpylrxRDCZZFFmkZbw3Q==
X-CSE-MsgGUID: Y2i00SDMRKqA1U+/ml/8XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="60159840"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="60159840"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 02:36:39 -0700
X-CSE-ConnectionGUID: QZPZfsJ2RsyS2uaXITko3g==
X-CSE-MsgGUID: NY9flrYuTPywKCKFKQWGww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="174311705"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa008.fm.intel.com with ESMTP; 12 Sep 2025 02:36:36 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v2 4/9] Modify xe_exec_queue_update_run_ticks
Date: Fri, 12 Sep 2025 09:03:47 +0000
Message-ID: <20250912090354.2619418-5-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
References: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
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

