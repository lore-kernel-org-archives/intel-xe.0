Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1191ECAC5B9
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 11:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F1010EA27;
	Fri, 26 Sep 2025 11:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lp/1hO2x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37C110EA27
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 11:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758885604; x=1790421604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sqodDSXOW1ZfRNXDbhItfARd/WvwDJPeeIWKJwVtW6s=;
 b=Lp/1hO2xrn19EV+bkp5ctKG0rAn+bOaO/ykrz1rBXwkgQBPbOEtn9SmP
 jkM80xGi6N1isFPlR3KSKV0FdL4suDTHS6eC7cl/vHxq3rFBmqh0Q1xFb
 phZMkTSjE1Nd8g9Ldpkd9UII1gVTZhNJqCoWxcJqkDGT5YlR4yieyeHOo
 B/dnnJ/Ek/uwhlqW/pasrAcBRd3Lbf0yG7sxYbmmrLm9N07F7ZNsqabVu
 Ah9FqzzLmWDBD2E5q8LKpIDwCbO754HbJhFrNi4e5voGE4OfUb7pLmiYE
 uJJNde2OvtZjmZ1hkfe9rYK2kAWg54K7qDFpYPyfoCJMYblBZX9cC/n/j w==;
X-CSE-ConnectionGUID: ijLFQMeeS5qnKiG3KJA88w==
X-CSE-MsgGUID: m3FAl+4eTjOLjalPAt2CiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72314400"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72314400"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:20:04 -0700
X-CSE-ConnectionGUID: JvWoRA+UTqOxvTXpiotGyw==
X-CSE-MsgGUID: 3Eg/UDjbTrafLakHJr5N6g==
X-ExtLoop1: 1
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa003.fm.intel.com with ESMTP; 26 Sep 2025 04:20:01 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v4 3/9] drm/xe: Add a trace point for GPU work period
Date: Fri, 26 Sep 2025 10:45:14 +0000
Message-ID: <20250926104521.1815428-4-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
References: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
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
 include/trace/gpu_work_period.h | 59 +++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 include/trace/gpu_work_period.h

diff --git a/include/trace/gpu_work_period.h b/include/trace/gpu_work_period.h
new file mode 100644
index 000000000000..e06467625705
--- /dev/null
+++ b/include/trace/gpu_work_period.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM power
+
+#if !defined(_TRACE_GPU_WORK_PERIOD_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_GPU_WORK_PERIOD_H
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
+#endif /* _TRACE_GPU_WORK_PERIOD_H */
+
+/* This part must be outside protection */
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE gpu_work_period
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#include <trace/define_trace.h>
-- 
2.49.0

