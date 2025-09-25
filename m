Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03972CAC5A7
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 12:21:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BF310E8FA;
	Thu, 25 Sep 2025 12:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nckx29mH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0BE10E8FB
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 12:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758802901; x=1790338901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qljS75dl3ofL6DGjSbIelO+EksczFPpYbXB1z85PTTQ=;
 b=nckx29mHuvjsC6ZPJi8jKjR/n7a2dtvVGIOnpl+syuufV2qSZgOHAGyk
 wJ/TwBdmdGrFHwzNTQc6z9WLrrCFrZxGbPTH6Vv1moCkKw7T4KQwryvwp
 Zrz9OrB/9MP3os/SboIoMRn7v9NXWlWllYeUwMlbBCH/yqf11G+B32Z3+
 p88VI1EnxGpXQ6DLo3KGa1MPri1cGhXQpDQqQ5sMAnGdLlNw0zl/HDQ9s
 QUt7in9x8z4iPoE1jNkvXdnqv5ascAEn9zGS5DUIAQyrl3fk8IWrPe+bd
 QzGUufEMr3YANI6xWazJ6r94TXvqk/NcvGjuexZKj37ED03skmo7sonJS g==;
X-CSE-ConnectionGUID: LOT/Zc9TT+KelHRSLPOT/w==
X-CSE-MsgGUID: ie3gQtfVTGy8Tvz7St97CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60818056"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="60818056"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:21:40 -0700
X-CSE-ConnectionGUID: v3a6TPu8STOHsdZffGlO2A==
X-CSE-MsgGUID: p9GGv7p7TYOBfe4L0qynmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="181328307"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by orviesa003.jf.intel.com with ESMTP; 25 Sep 2025 05:21:38 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v4 4/8] drm/xe: Modify xe_exec_queue_update_run_ticks
Date: Thu, 25 Sep 2025 11:46:54 +0000
Message-ID: <20250925114700.68090-5-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250925114700.68090-1-aakash.deep.sarkar@intel.com>
References: <20250925114700.68090-1-aakash.deep.sarkar@intel.com>
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
index a6c361db11d9..e6ecfb3f7f38 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -678,6 +678,9 @@ struct xe_file {
 	/** @run_ticks: hw engine class run time in ticks for this drm client */
 	u64 run_ticks[XE_ENGINE_CLASS_MAX];
 
+	/** @active_duration_ns: total run time in ns for this xe file */
+	u64 active_duration_ns;
+
 	/** @client: drm client */
 	struct xe_drm_client *client;
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 37b2b93b73d6..6eb34c62c779 100644
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
@@ -887,6 +888,8 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 {
 	struct xe_device *xe = gt_to_xe(q->gt);
 	struct xe_lrc *lrc;
+	struct xe_gt *gt = q->gt;
+
 	u64 old_ts, new_ts;
 	int idx;
 
@@ -912,6 +915,10 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
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

