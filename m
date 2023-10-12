Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3CFCDB482
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 12:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C6810E4E4;
	Thu, 12 Oct 2023 12:58:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3302510E4D8
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 12:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697115528; x=1728651528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M8ywyucXSebbro2kqVvJQS1Cm5YM+ovm9UfvzoLl2j0=;
 b=G0d87PMHS8a/BfnpDsWcbPm4CmCGhf1/jHxtVRdGhdrnllGRmpM4UNN3
 xuYVG//zEx7BtiQnv9OxSl8uayVoQmSKRUqIalxPZsR+bbJYt5ZxeZ/vx
 EOJouhmuf5wKIUfikFJQBerEVn3ZSpMSPvciDYYrhFL/TKgm6q6LTX147
 q15qKPwg1ukLnFXX4KlZvAoVKZp5amEWuZiNcELjjVrfPkE4fZyV5xHI+
 HDxA6YGzrvzXZwEG8KQbNI3yckx/mw0kGyGgsDFyIjVV3Uu2O3wCsImq6
 QdUTxnplVvbK2FPyJVn8eZF/U/aWU/1GUN3qbmQ88v2fF3qClPmWs2NCe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375259082"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="375259082"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 05:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001541538"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="1001541538"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 05:58:46 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 18:24:09 +0530
Message-Id: <20231012125410.2127337-6-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
References: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] fixup! drm/xe/display: Implement display
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

Add empty definitions for i915_error_printf to get rid of ifdefs from
intel_dmc code

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h   |  1 +
 .../drm/xe/compat-i915-headers/i915_gpu_error.h | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
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
index 000000000000..98e9dd78f670
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
@@ -0,0 +1,17 @@
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
-- 
2.25.1

