Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C675CA0EE9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 06:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FF010E125;
	Tue, 19 Aug 2025 06:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dBNZPgfM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CD210E53C
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 06:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755585573; x=1787121573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UEgVP5dCsukhfuHlONcAvrH+1/wEyFjifc/eDxGwEGU=;
 b=dBNZPgfMQafwkwuTUqXWSvC4ahFfKgY47yy9kcCiJh4bUZFUqb3DWq+F
 9Zd5GgLMERqZenb10oPcsi+Ak/svXQBUV2usf74hZbvgPSswIzVrmdF0a
 hA+rT4S7yyL+ebKJ8nLwyBBgES06r8xgh9S0gOHRUnPfsEet2G6z5b3gt
 SuV3GlpxbD9UrazcbUC6GN/TTVkdPQa3915sCSLyxe+XHcKwQjo0k5RcY
 9E8aIRPUidiR54PRKldH45ppkYF5NTyn711HRmSvFllpsVkH9ebf+HxC7
 IfwdNuWFWPh1ebStx5Cw87G370b/xmfRUOiTIZ8AcdpsNKodcc0W6lkWZ Q==;
X-CSE-ConnectionGUID: T0FLs8DJQ1atUAoY7VbjIQ==
X-CSE-MsgGUID: RsYBXn6dSm6JIqvO8ORcKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57966984"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57966984"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 23:39:33 -0700
X-CSE-ConnectionGUID: C+RT1TXHRma3nw49cqG+kQ==
X-CSE-MsgGUID: icFU9+paQBSVRtCFIisCVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172009509"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa003.jf.intel.com with ESMTP; 18 Aug 2025 23:39:32 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH 5/8] drm/xe: Add basic GPU frequency tracer implementation
Date: Tue, 19 Aug 2025 12:04:14 +0530
Message-Id: <20250819063417.918666-6-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819063417.918666-1-s.sebinraj@intel.com>
References: <20250819063417.918666-1-s.sebinraj@intel.com>
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

Add the foundation for GPU frequency tracing with:

- Data structures for per-GT and per-device tracking
- Parameter validation for monitoring intervals
- Basic initialization function for device setup
- Memory allocation using DRM managed resources

This commit provides the core infrastructure without the actual
monitoring logic, establishing the foundation for subsequent
functionality.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 drivers/gpu/drm/xe/xe_gpufreqtracer.c | 112 ++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.c

diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer.c b/drivers/gpu/drm/xe/xe_gpufreqtracer.c
new file mode 100644
index 000000000000..3e4c1375aebd
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gpufreqtracer.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_gpufreqtracer.h"
+
+#include <linux/workqueue.h>
+#include <linux/slab.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/moduleparam.h>
+#include <linux/types.h>
+#include <linux/container_of.h>
+#include <linux/gfp.h>
+#include <linux/atomic.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_drv.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_gt_types.h"
+#include "xe_guc_pc.h"
+#include "xe_module.h"
+#include "xe_force_wake.h"
+#include "xe_pm.h"
+
+/* GPU frequency monitoring interval constants (in milliseconds) */
+#define XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS	100
+#define XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS	10000
+#define XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS	5000
+
+#define CREATE_TRACE_POINTS
+#include "xe_gpufreqtracer_trace.h"
+
+/**
+ * struct xe_gpufreqtracer_gt_data - Per-GT frequency monitoring data
+ * @gt: Reference to the GT
+ * @delayed_work: Delayed work for periodic monitoring
+ * @last_frequency: Last reported frequency to avoid duplicate reports
+ * @monitoring_active: Whether monitoring is currently active
+ */
+struct xe_gpufreqtracer_gt_data {
+	struct xe_gt *gt;
+	struct delayed_work delayed_work;
+	u32 last_frequency;
+	atomic_t monitoring_active;
+};
+
+/**
+ * struct xe_gpufreqtracer_data - Per-device frequency tracer data
+ * @xe: Reference to the XE device
+ * @gt_data: Array of per-GT monitoring data
+ */
+struct xe_gpufreqtracer_data {
+	struct xe_device *xe;
+	struct xe_gpufreqtracer_gt_data *gt_data;
+};
+
+
+/**
+ * xe_gpufreqtracer_validate_params - Validate GPU frequency monitoring parameters
+ *
+ * Validates and corrects the GPU frequency monitoring interval parameter.
+ * If the parameter is out of range, it will be reset to the default value.
+ */
+static void xe_gpufreqtracer_validate_params(void)
+{
+	if (xe_modparam.gpufreq_monitoring_interval_ms < XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS ||
+	    xe_modparam.gpufreq_monitoring_interval_ms > XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS) {
+		pr_warn("xe: gpufreq_monitoring_interval_ms %u out of range [%u, %u], using default %u ms\n",
+			xe_modparam.gpufreq_monitoring_interval_ms,
+			XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS,
+			XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS,
+			XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS);
+		xe_modparam.gpufreq_monitoring_interval_ms =
+			XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS;
+	}
+}
+
+/**
+ * xe_gpufreqtracer_init - Initialize GPU frequency tracer for a device
+ * @xe: The XE device
+ *
+ * Sets up the frequency tracer infrastructure for all GTs in the device.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int xe_gpufreqtracer_init(struct xe_device *xe)
+{
+	struct xe_gpufreqtracer_data *tracer_data;
+
+	/* Validate module parameters first */
+	xe_gpufreqtracer_validate_params();
+
+	tracer_data = drmm_kzalloc(&xe->drm, sizeof(*tracer_data), GFP_KERNEL);
+	if (!tracer_data)
+		return -ENOMEM;
+
+	tracer_data->xe = xe;
+
+	/* Allocate GT data array based on actual GT count */
+	tracer_data->gt_data = drmm_kcalloc(&xe->drm, xe->info.gt_count,
+				       sizeof(*tracer_data->gt_data),
+				       GFP_KERNEL);
+	if (!tracer_data->gt_data)
+		return -ENOMEM;
+
+	xe->gpufreqtracer_data = tracer_data;
+
+	return 0;
+}
-- 
2.34.1

