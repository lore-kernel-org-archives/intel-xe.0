Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455F8CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 14:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0958210E0D6;
	Mon,  6 Oct 2025 14:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfH9ujjM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D49710E341
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 14:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759762623; x=1791298623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ePSDMMR7wsYU5dWs9vYyUgJV3+TfoEmH48pYJcAcpus=;
 b=YfH9ujjMaIFmH4+NbjX+BPbgdjT7z6wM9Nz2UMFEwZPLG2T1NWDblRP8
 MqxurrET15hypThnXOegvyfFIMUd5CXv04OGL6fSq0Xvbb1eOlOC20GM+
 VQzGM4OZcqB83Yh6E6davtot33Hn8Vxkd1SpRHr7Y3JB+HGCwvwsCM5JK
 h0sGOIorItM2LsNauNfnrgeSk8fQmjFUFMFBA//POEj8fWPVXCUhJrA/x
 f6r6z/Pr0kfnyGdOHA/qKIFTZm436WvynDs7f2f2L82J0pDjCPgUXLbPs
 kqgyY3dwyK6FLnULbnDYvi9N7WDrPMNAzt3hWHbrM65LHMcy9BYB+MavV g==;
X-CSE-ConnectionGUID: r8bHn/6NT0Sd4ROMxnS57w==
X-CSE-MsgGUID: YLe4/i0aSEiByH7M9NWTdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61143184"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61143184"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:57:03 -0700
X-CSE-ConnectionGUID: Tac+msvqTmmcYjkaeE2KPw==
X-CSE-MsgGUID: 3Rpy9hXsR0GOC+PSpqOXRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179507684"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by orviesa009.jf.intel.com with ESMTP; 06 Oct 2025 07:57:00 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 jani.nikula@intel.com, ashutosh.dixit@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v5 8/8] Hack patch: Do not merge
Date: Mon,  6 Oct 2025 14:20:29 +0000
Message-ID: <20251006142034.674435-9-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
References: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
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

This patch is only added so that our files are built and tested
on the CI

Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
---
 drivers/gpu/drm/xe/Makefile     |  2 +-
 drivers/gpu/drm/xe/xe_user.h    |  2 +-
 drivers/gpu/trace/Kconfig       | 12 +++++++
 include/trace/gpu_work_period.h | 59 +++++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 include/trace/gpu_work_period.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 738e47afbe89..b078834ec762 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -336,7 +336,7 @@ ifeq ($(CONFIG_DEBUG_FS),y)
 
 	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
 
-	xe-$(CONFIG_TRACE_GPU_WORK_PERIOD) += xe_user.o
+	xe-y += xe_user.o
 
 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
 		i915-display/intel_display_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
index d7ac58cb3db8..f8c5e261a563 100644
--- a/drivers/gpu/drm/xe/xe_user.h
+++ b/drivers/gpu/drm/xe/xe_user.h
@@ -68,7 +68,7 @@ struct xe_user {
 	u64 last_timestamp_ns;
 };
 
-#if IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)
+#if 1
 
 int xe_user_init(struct xe_device *xe, struct xe_file *xef, unsigned int uid);
 
diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
index cd3d19c4a201..33ffe865739b 100644
--- a/drivers/gpu/trace/Kconfig
+++ b/drivers/gpu/trace/Kconfig
@@ -11,3 +11,15 @@ config TRACE_GPU_MEM
 	  Tracepoint availability varies by GPU driver.
 
 	  If in doubt, say "N".
+
+config TRACE_GPU_WORK_PERIOD
+        bool "Enable GPU work period tracepoint"
+        default n
+        help
+          Choose this option to enable tracepoint for tracking
+          GPU usage based on the UID. Intended for performance
+          profiling and required for Android.
+
+          Tracepoint availability varies by GPU driver.
+
+          If in doubt, say "N".
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

