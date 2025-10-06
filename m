Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C03CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 14:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69AC10E341;
	Mon,  6 Oct 2025 14:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JBpM9w8s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D8410E341
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 14:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759762607; x=1791298607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R3vm7TD5DWfNkVqaEmyAjWxWtMemaRQf/ay1wlblpBU=;
 b=JBpM9w8sFFnOGw7dz6mogZGSofEVWffpHcEXmysENW+BjMU3dhokEsOa
 3WB4Z6eEs2FSjdJpKIsI34WMZ4V3EYKvPUS9+yG9s2qovPwGLiMZ7IWPR
 pyYTKBwN4jutHoZg6SbvfzhUSfA74HF+9xxcnV/6rm09Ixy9I3IceS5Bk
 3QQpbaqiUdo4ddMeqjRXqWh/8E+whGiOjsChkGDYyfj3c/iGYAiR8D0mX
 4S2h9KeFhy4ovVGKmRzQw80czZdhuOrCrLwgzoNnaUJMQxBxtYsd7wMQD
 hhGipTQOzSYLUwdeFkoz6lDwbW+CoPQMocemJHl34vsTMy4F0JuYJ7/Gn Q==;
X-CSE-ConnectionGUID: Hc0hzYk4R4WP4jm4a3murQ==
X-CSE-MsgGUID: dYSQmJLLSPiURXuH/5N0DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61143162"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61143162"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:56:47 -0700
X-CSE-ConnectionGUID: kqJvEzfhRqyIcX1G1sSGJw==
X-CSE-MsgGUID: VgpXr6JRTp2ufKavmQpWKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179507643"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by orviesa009.jf.intel.com with ESMTP; 06 Oct 2025 07:56:44 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 jani.nikula@intel.com, ashutosh.dixit@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v5 3/8] drm/xe: Modify xe_exec_queue_update_run_ticks
Date: Mon,  6 Oct 2025 14:20:24 +0000
Message-ID: <20251006142034.674435-4-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
References: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
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
index 53264b2bb832..54a612787289 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -681,6 +681,9 @@ struct xe_file {
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

