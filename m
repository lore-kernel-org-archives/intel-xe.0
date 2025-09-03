Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AC6CA0FF2
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 07:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE42C10E44F;
	Wed,  3 Sep 2025 07:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="beBvDWhB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FB210E44F
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 07:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756885942; x=1788421942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8rjOY4Y6cNdEtSowN3dgr77KEsO7PGGJYLnHg1nC+B4=;
 b=beBvDWhBacQBaXE2q4ad3WDrT8hqjLJSXzG9t8too5Wz/k+hPs+OGJSh
 6Gwegc3CQOYzML440a6HXqCJdzuu6c9WuqEwyquUR/D9VbylaYzVmsqVT
 Cgff7aqANCkQGEaJBk0TWLwT9V5oH4dA+WMg1bUebCEpmQl+Nk2jcAIHv
 EvQoUEmWEWo7gA09NECDxu6KCG+NuC2uBGYIRqwLAcEvBdHw8cAmJpT1Q
 YqJcu38J6LrzRYhLKx24XxlQbc2yXWWC4yihEzLP8k5zmnYPXednS5EiP
 hOsfB2JGKeUp4J5HxCKZNjzc0GGgG3WMrENgpcc0Zg77IfgRF8wjkiGXx g==;
X-CSE-ConnectionGUID: cha24a52SgmzHShHoq722A==
X-CSE-MsgGUID: NqvtECVlRK2NxJM+qvzyUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59126087"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59126087"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 00:52:21 -0700
X-CSE-ConnectionGUID: BkjV2e+hRmevIEnPVwf0vA==
X-CSE-MsgGUID: /nK4hZnOTnimRlQ9PCkhvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171396721"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa007.jf.intel.com with ESMTP; 03 Sep 2025 00:52:19 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH 2/2] drm/xe: Add DRM GPU frequency tracepoint to Xe
Date: Wed,  3 Sep 2025 13:15:28 +0530
Message-Id: <20250903074528.69159-3-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903074528.69159-1-s.sebinraj@intel.com>
References: <20250903074528.69159-1-s.sebinraj@intel.com>
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

Integrate xe PMU with the DRM-level GPU frequency tracepoint to provide
efficient frequency monitoring with change detection.

Key changes:
- Add frequency change detection
- Implement per-GT frequency tracking using last_act_freq array
- Only trace when GPU frequency actually changes per GT

The integration traces actual GPU frequency changes from xe_pmu during
XE_PMU_EVENT_GT_ACTUAL_FREQUENCY reads.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_freq_trace.h | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.c            | 26 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pmu_types.h      |  4 ++++
 3 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_freq_trace.h

diff --git a/drivers/gpu/drm/xe/xe_gpu_freq_trace.h b/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
new file mode 100644
index 000000000000..f188d529ae60
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * GPU frequency trace wrapper for xe_pmu.c
+ * This header provides access to the gpu_frequency tracepoint
+ */
+#ifndef _XE_GPU_FREQ_TRACE_H_
+#define _XE_GPU_FREQ_TRACE_H_
+
+#include "../drm_gpu_frequency_trace.h"
+
+/* Convert MHz to KHz for tracepoint */
+#define MHZ_TO_KHZ(freq_mhz)	((freq_mhz) * 1000)
+
+#endif /* _XE_GPU_FREQ_TRACE_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index cab51d826345..7d5a6e149247 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -5,9 +5,11 @@
 
 #include <drm/drm_drv.h>
 #include <linux/device.h>
+#include <linux/types.h>
 
 #include "xe_device.h"
 #include "xe_force_wake.h"
+#include "xe_gpu_freq_trace.h"
 #include "xe_gt_idle.h"
 #include "xe_guc_engine_activity.h"
 #include "xe_guc_pc.h"
@@ -291,6 +293,19 @@ static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
 	return val;
 }
 
+static void xe_pmu_trace_frequency_change(struct xe_gt *gt, u32 act_freq)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_pmu *pmu = &xe->pmu;
+	u32 gt_id = gt->info.id;
+
+	/* Only trace if frequency changed for this GT */
+	if (gt_id < XE_PMU_MAX_GT && pmu->last_act_freq[gt_id] != act_freq) {
+		trace_gpu_frequency(MHZ_TO_KHZ(act_freq), gt_id);
+		pmu->last_act_freq[gt_id] = act_freq;
+	}
+}
+
 static u64 __xe_pmu_event_read(struct perf_event *event)
 {
 	struct xe_gt *gt = event_to_gt(event);
@@ -304,8 +319,12 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
 		return read_engine_events(gt, event);
-	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
-		return xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
+	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY: {
+		u32 act_freq = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
+
+		xe_pmu_trace_frequency_change(gt, act_freq);
+		return act_freq;
+	}
 	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
 		return xe_guc_pc_get_cur_freq_fw(&gt->uc.guc.pc);
 	}
@@ -572,6 +591,9 @@ int xe_pmu_register(struct xe_pmu *pmu)
 	pmu->base.stop		= xe_pmu_event_stop;
 	pmu->base.read		= xe_pmu_event_read;
 
+	/* Initialize frequency tracking array */
+	memset(pmu->last_act_freq, 0, sizeof(pmu->last_act_freq));
+
 	set_supported_events(pmu);
 
 	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index f5ba4d56622c..630da8442387 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -34,6 +34,10 @@ struct xe_pmu {
 	 * @supported_events: Bitmap of supported events, indexed by event id
 	 */
 	u64 supported_events;
+	/**
+	 * @last_act_freq: Last actual frequency for each GT (for tracing changes only)
+	 */
+	u32 last_act_freq[XE_PMU_MAX_GT];
 };
 
 #endif
-- 
2.34.1

