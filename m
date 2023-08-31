Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CACC83F10
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 09:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3654210E5E3;
	Thu, 31 Aug 2023 09:52:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D0910E5E7
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 09:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693475536; x=1725011536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Fd2KdoCWosxGXquM7S9XTWtp+xi19xu3U7G65PEMx8=;
 b=ncU/dqL7n719IXKYgEBhlkS1kJ+yzYCwnZ2otA142mNteLOhJ5YVmMeE
 9N2L4/gnBSqDSRYnb9Fy8LJTwSFPtWhi2xDCJNh30EKP+Ght7ZFBNDcws
 Ec68suacwcRb9K+PBnpZ8vba1LYtHevns32WgSy5BHHNwu+MHHWu8CPPb
 h5PTKGiZo3A76AsPOu0lfwZagi+SOgjjbtKMiFh7N6nPRzTRyAifeg3Be
 4SM6hru8KjtfQqXSuIYVdEzqVFLf1XqzRbGKyXLWO30x4cGdI1+WYoM+w
 KpAwsWoG2iHfSC3+DA4iKIrvrfwxpLFcxMHk2T+K2+Gybn7sWkTkfmUyR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="373284414"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="373284414"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 02:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739440802"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="739440802"
Received: from zlevit-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.47.221])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 02:52:14 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 31 Aug 2023 12:51:54 +0300
Message-Id: <20230831095154.3121578-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831095154.3121578-1-jouni.hogander@intel.com>
References: <20230831095154.3121578-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/5] drm/xe: Add Xe implementation for fence
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
index 4547aac8b6fa..b008fc4fd66d 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -16,4 +16,5 @@ struct i915_vma {
 	struct drm_mm_node node;
 };
 
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

