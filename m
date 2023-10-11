Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CA5CD6E5D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 12:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169D410E78F;
	Wed, 11 Oct 2023 12:26:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557F610E785
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 12:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697027207; x=1728563207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QP6yBCUZPLn4Vg2QhSwrBiHNPf+3sDVdxdPxYnv7K1Q=;
 b=Pta9NXn+oDRxhYugBx4Fd5XqiVkMTq2Ut/o8OJUJB6uMINzrkjrWobvs
 de2IXrsLDOZcroBUofCoHr/liOZ+Hy2NoWILqpN3MlSWRu9NT9n/lcGYT
 JaH9MrgWitOzof8DnKX4t0RoiO3yziE04lFBW81QgpJXO9oHxvp1nRCpL
 rVd8DF0mmVTNAAxtN9kAnjpiLwudf0+6lTtvW5oZmBF9xN6wwfIjAH7AH
 /4IqifR57hyiPuCwBC0jjXhfGZppiHAUZ3RC0oM7VuW18ZhxVsG9R53hZ
 CmLxNIDzk6xxTL3D4Bua9Xwsx2YvvB99emIMbhj7e8OYL8E38zNZBUDad w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364010324"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="364010324"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:26:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="844543882"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="844543882"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Oct 2023 05:26:45 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 17:52:13 +0530
Message-Id: <20231011122215.2025850-5-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231011122215.2025850-1-chaitanya.kumar.borah@intel.com>
References: <20231011122215.2025850-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/6] drm/xe: Add intel_step.h compatibility header
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

Add compatibility header with helpers to get display step name. This
is needed to maintain compatibility with intel_dmc code.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  1 +
 .../drm/xe/compat-i915-headers/intel_step.h   | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_step.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 1223619f5bbf..494409849a7d 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -20,6 +20,7 @@
 #include "i915_reg_defs.h"
 #include "i915_utils.h"
 #include "intel_gt_types.h"
+#include "intel_step.h"
 #include "intel_uncore.h"
 #include "intel_runtime_pm.h"
 #include <linux/pm_runtime.h>
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
new file mode 100644
index 000000000000..0006ef812346
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __INTEL_STEP_H__
+#define __INTEL_STEP_H__
+
+#include "xe_device_types.h"
+#include "xe_step.h"
+
+#define intel_display_step_name xe_display_step_name
+
+static inline
+const char *xe_display_step_name(struct xe_device *xe)
+{
+	return xe_step_name(xe->info.step.display);
+}
+
+#endif /* __INTEL_STEP_H__ */
-- 
2.25.1

