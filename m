Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44B7CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 12:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8632C10E4D8;
	Thu, 12 Oct 2023 12:58:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2084510E4D1
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 12:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697115526; x=1728651526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cNZ9c6443Tnfbgq9TZO8zjnwM+FvvBEfM7Zv6K8+Q6g=;
 b=isLdd+2YZqh/nt4i/NhBHoMG6AKPPfrZDOI60UVYmXtAIkWQY+vQrtmg
 b8Gz45eGxMUd3RLvEk4IF364pNOS4eTaU6brZ+thnbReTfYyOI31KJjye
 gvI+Hj9zSxrGSUxzVp/yKIoLgY+tuD3ocMeJHrCbeM/zRe/vaRhF5Xzqj
 tKTHi2kW4GNBOmG6ev9ow/BPtve/hVrEMuyIF7j5GMRW2316kUD69lpeu
 02y7tKqmzY/2OrbgAiPtpPRQJtA6At/zvoPUzYJVTTI4zbNTDnaDTNH5I
 AJOiPqhar1vxwVNcJYXKtwEsHQWD9iLJQghhOxTXhuSxtzLZ+xDFpobRm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375259081"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="375259081"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 05:58:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001541514"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="1001541514"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 05:58:44 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 18:24:08 +0530
Message-Id: <20231012125410.2127337-5-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
References: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/6] fixup! drm/xe/display: Implement display
 support
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
index 8f55f63ff28b..ed7c39b4f770 100644
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

