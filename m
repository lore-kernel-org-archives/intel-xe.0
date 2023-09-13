Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC32CA5534
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 09:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F5F10E496;
	Wed, 13 Sep 2023 09:54:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F2D10E493
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 09:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694598890; x=1726134890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZPlVVNZVqWlSCkdpjEtbzqsCd85lPXVI+HeVYPhFV3o=;
 b=n2hgxOHDnikFLbOMx/0GqzfVSsGRxQLGz/g2HhAYTk7uplSAq+/cYuR0
 IgJsfJ5CvxLaF4s+pbnupB5cqoADxAsBxL43hokxdoQ8DydEGRdur61Hi
 T5A8hT5SkBECq3yyF3qJPi5KawEiJryobqiBtIuKRIJorSBSX1Tg7gM7z
 JofrKTVpbHb/41Y/qL1k8ocxjbYS9GP4ZBY8q8SVui+HK8RCqJUSvVmYS
 waqqMmBMk2d13nxH/GtL3I2MRJPPiBJeRW7aYxl6kdef51gTyFXL6U2wK
 eoXk4xt6lbuRhUjr9j2j+hpsoUvEN5u5OvkX3HSvhZ5kuiTAB4GMVWzCE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="409564890"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="409564890"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 02:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="720749315"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="720749315"
Received: from seanpaul-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.45.158])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 02:54:32 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 12:54:12 +0300
Message-Id: <20230913095412.3427407-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913095412.3427407-1-jouni.hogander@intel.com>
References: <20230913095412.3427407-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 5/5] drm/xe: Add Xe implementation for fence
 checks used by fbc code
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe doesn't support legacy fences. Implement legacy fence and fence
id checks accordingly.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h     |  1 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h     |  1 +
 .../gpu/drm/xe/compat-i915-headers/intel_gt_types.h   | 11 +++++++++++
 3 files changed, 13 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 55d0d5c7a386..94ab0354185e 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -19,6 +19,7 @@
 #include "i915_gem_stolen.h"
 #include "i915_reg_defs.h"
 #include "i915_utils.h"
+#include "intel_gt_types.h"
 #include "intel_uncore.h"
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index 3d8a1cc0b132..9424144b1b5a 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -18,4 +18,5 @@ struct i915_vma {
 
 #define i915_ggtt_clear_scanout(bo) do { } while (0)
 
+#define i915_vma_fence_id(vma) -1
 #endif
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h
new file mode 100644
index 000000000000..c15806d6c4f7
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __INTEL_GT_TYPES__
+#define __INTEL_GT_TYPES__
+
+#define intel_gt_support_legacy_fencing(gt) 0
+
+#endif
-- 
2.34.1

