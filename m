Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409ECCDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 05:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C81410E410;
	Thu, 12 Oct 2023 05:11:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBB910E40F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 05:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697087479; x=1728623479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c1iRZz+KtSfMLfkcKwo/IKF1SPSMqooR5d0wYyG79v0=;
 b=iFL+3wGW2zhufaDrY2NTsP1fsqE+kMwKe6x02QUFQxS9UZwxikrqQPL2
 KQmFRyIx7Ye6wd3+lfNNQDyW/fO7rkgN8/AqPT6RhIWwq1JbfOn21vr15
 GICeQu8wTe5BoWOMqj4b7JqGERdTo7WSFHBnj62sD2T+uS9I5Lz+ZzqQy
 HUNozzFcUaNB1ruMbigA/Mo3ucxWCyfegQGaNP26b1r5swwKHM8YVtIS0
 bl0Bzo+6y6hH3QNDLCikxLoc4Qtn0AYeiDBwwjGalvNK19OSBpmeRcfpF
 TWnOMYWxyMIQQYIg0EDFu/hdYvIR/uIs0YkV0S4+33DC9oese+ixrsQdH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="415883632"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="415883632"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 22:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="747740802"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="747740802"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orsmga007.jf.intel.com with ESMTP; 11 Oct 2023 22:11:16 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 10:36:44 +0530
Message-Id: <20231012050645.2058219-6-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231012050645.2058219-1-chaitanya.kumar.borah@intel.com>
References: <20231012050645.2058219-1-chaitanya.kumar.borah@intel.com>
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
index ed7c39b4f770..9cbe16863be2 100644
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

