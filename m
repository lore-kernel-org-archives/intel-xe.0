Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE5FCD6E62
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 12:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E742610E793;
	Wed, 11 Oct 2023 12:26:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8576D10E78F
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 12:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697027209; x=1728563209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U/eszdMe3q+1AS/SJjm6OVMdvlySB3eJV8vky8hsm8I=;
 b=LEXhlUIqktMQHmAtoHaFruFbk61IvdK1OE8KSDlnRvH9O7/9PhJBccfa
 /WqHxXBVJ+VxDy7otpN7znz8ZHxSGpp5OUYcuRFc5Nonh4IpZC207PWzN
 u6RedtTiSY9qqa8M4fuqD73XDYfFITCnqOmIKOF8l3uEc+HJWaK0xY2a5
 4SQjkhYrtDiJjdFcrwCvR0gI47+MDn2x/UNrr7WOkhVG6uyuPEewlCkHg
 BD9OyRxiOG0+w1iClliwLKsCDi4K4uhekUbPHSEyJR30+D+WKi+G9qtul
 0RvV2GzbcsXsMScELz2sIJiCVk8BBjei2zLFt3vypNdHk9KCrGLzYwPtA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364010336"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="364010336"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:26:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="844543914"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="844543914"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Oct 2023 05:26:47 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 17:52:14 +0530
Message-Id: <20231011122215.2025850-6-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231011122215.2025850-1-chaitanya.kumar.borah@intel.com>
References: <20231011122215.2025850-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] drm/xe: Add i915_gpu_error.h compatibility
 header
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

Add empty definitions for i915_error_printf to get rid of ifdefs from
intel_dmc code

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h  |  1 +
 .../xe/compat-i915-headers/i915_gpu_error.h    | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 494409849a7d..56a9de859bf9 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -17,6 +17,7 @@
 #include "xe_step.h"
 #include "i915_gem.h"
 #include "i915_gem_stolen.h"
+#include "i915_gpu_error.h"
 #include "i915_reg_defs.h"
 #include "i915_utils.h"
 #include "intel_gt_types.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
new file mode 100644
index 000000000000..01c1e8d6927d
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _I915_GPU_ERROR_H_
+#define _I915_GPU_ERROR_H_
+
+struct drm_i915_error_state_buf;
+
+__printf(2, 3)
+static inline void
+i915_error_printf(struct drm_i915_error_state_buf *e, const char *f, ...)
+{
+}
+
+#endif
+
-- 
2.25.1

