Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFAFCAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 09:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F18810EBEE;
	Fri, 12 Sep 2025 09:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iffRw7GO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72B810EBEE
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 09:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757669797; x=1789205797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yGjSZ1/fhciKDx9Ow2dMXe8UnuajkidO20rngXAdorM=;
 b=iffRw7GOYOgIYbREFQwSkkpC7xI7UGzavHgc58lrLGBY1awpu0lDyLDC
 RK01Gxt5e1qVGWt65sWzuF2eFbY7ikOlhKrfDQLp0bVnFDvDp1wSNOqGr
 edMyROOByMWqLRMaWSiEvOSd8ISAOJZbWdhURgLRdUNs1ZwGoNOSjkFSr
 bRG6eobZ5MFHzDj7WQs0Q9uvpCIB1+iGlhEt5mlcb7kQxmDXMHqLqZGaU
 Abe1RQMbSlIoBiiAjXo0R2Q4ajBi8kSUWQgI9NE2ED7NXjkhCszhpHWnM
 323MrKuebyGCywSWwWuAN0+0DJNjw3M9nTt/aH8wGXxY9uMSYBQTwxcff g==;
X-CSE-ConnectionGUID: /PXEPL6ESoCcKV9lUIU5VQ==
X-CSE-MsgGUID: f4HVXvwYRDuv5EW4BTVONQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="60159838"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="60159838"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 02:36:36 -0700
X-CSE-ConnectionGUID: 9Grw8kwvS+alQhg2/NBeqw==
X-CSE-MsgGUID: t4GqurHOSCyPssB1+C+7tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="174311696"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa008.fm.intel.com with ESMTP; 12 Sep 2025 02:36:34 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v2 3/9] Add a trace point for GPU work period
Date: Fri, 12 Sep 2025 09:03:46 +0000
Message-ID: <20250912090354.2619418-4-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
References: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The GPU work period event is required to have the following format:

Defines the structure of the kernel tracepoint:
/sys/kernel/tracing/events/power/gpu_work_period

A value that uniquely identifies the GPU within the system.
  uint32_t gpu_id;

The UID of the application (i.e. persistent, unique ID of the Android
app) that submitted work to the GPU.
  uint32_t uid;

The start time of the period in nanoseconds. The clock must be
CLOCK_MONOTONIC_RAW, as returned by the ktime_get_raw_ns(void) function.
  uint64_t start_time_ns;

The end time of the period in nanoseconds. The clock must be
CLOCK_MONOTONIC_RAW, as returned by the ktime_get_raw_ns(void) function.
  uint64_t end_time_ns;

The amount of time the GPU was running GPU work for |uid| during the
period, in nanoseconds, without double-counting parallel GPU work for the
same |uid|. For example, this might include the amount of time the GPU
spent performing shader work (vertex work, fragment work, etc.) for
|uid|.
  uint64_t total_active_duration_ns;

Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
---
 .../drm/xe/xe_power_gpu_work_period_trace.h   | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h

diff --git a/drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h b/drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h
new file mode 100644
index 000000000000..2de05f1b64f3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _TRACE_POWER_GPU_WORK_PERIOD_INTEL
+#define _TRACE_POWER_GPU_WORK_PERIOD_INTEL
+#endif
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM power
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE xe_power_gpu_work_period_trace
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#if !defined(_TRACE_POWER_GPU_WORK_PERIOD_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_POWER_GPU_WORK_PERIOD_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(gpu_work_period,
+
+	TP_PROTO(
+		u32 gpu_id,
+		u32 uid,
+		u64 start_time_ns,
+		u64 end_time_ns,
+		u64 total_active_duration_ns
+	),
+
+	TP_ARGS(gpu_id, uid, start_time_ns, end_time_ns, total_active_duration_ns),
+
+	TP_STRUCT__entry(
+		__field(u32, gpu_id)
+		__field(u32, uid)
+		__field(u64, start_time_ns)
+		__field(u64, end_time_ns)
+		__field(u64, total_active_duration_ns)
+	),
+
+	TP_fast_assign(
+		__entry->gpu_id = gpu_id;
+		__entry->uid = uid;
+		__entry->start_time_ns = start_time_ns;
+		__entry->end_time_ns = end_time_ns;
+		__entry->total_active_duration_ns = total_active_duration_ns;
+	),
+
+	TP_printk("gpu_id=%u uid=%u start_time_ns=%llu end_time_ns=%llu total_active_duration_ns=%llu",
+		__entry->gpu_id,
+		__entry->uid,
+		__entry->start_time_ns,
+		__entry->end_time_ns,
+		__entry->total_active_duration_ns)
+);
+
+#endif /* _TRACE_POWER_GPU_WORK_PERIOD_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.49.0

