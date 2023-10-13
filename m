Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C90CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 06:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE47810E5C4;
	Fri, 13 Oct 2023 06:58:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E35510E5C6
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 06:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697180280; x=1728716280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RCzYcRtnm8BwTPdI+7Upq9I6XXO9fbavigbzo9JJk7I=;
 b=h3VRl7UEhKROSGW/o77bX/u8fmbEFG+gkNASidoowcw3vekk4FoIDEU9
 Boyq4oSqsF8L05obmWI5wnLyF3BaX7ic+0RfuuUyWLp5KpokJ/D0lciZw
 HfFcjBWGEOnqiZfJ6EWY4gm5yCFrDJXBm7Kts6G1pvhcegttAf9xInORj
 nQe7nsN0bAlLiE4jUcHbp9JPn3O9iWs9XzgBUqpP1GNf8hl5T4eiaxwlt
 394WUO/h4QSxif7kWPEMQhob6mAOeyHZifbDi2fW+eMmSOzX6eB6SxSYe
 gOyGiFRxHyq4z/2ROEtYWMK5pzoA1XF+U4hLmFY2fbhsqtxOXow96OV7y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="384954564"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="384954564"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 23:58:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731243512"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="731243512"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orsmga006.jf.intel.com with ESMTP; 12 Oct 2023 23:57:57 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 12:23:21 +0530
Message-Id: <20231013065323.2233783-5-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231013065323.2233783-1-chaitanya.kumar.borah@intel.com>
References: <20231013065323.2233783-1-chaitanya.kumar.borah@intel.com>
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add compatibility header with helpers to get display step name. This
is needed to maintain compatibility with intel_dmc code.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

