Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226E0C7EE29
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009C810E140;
	Tue, 30 May 2023 10:47:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4811310E384
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685443662; x=1716979662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UjqcME0kn5FfM6RV+IbxPQAOtPSoVaaP95Co0lIXMpA=;
 b=Kn+GLdtCcy/CmUkr1mCGP/hMMeJ50MQk6A+P/CX3KfMRckW3orc09/gM
 9rg4XLP2moil8aa6HpIG8DqRQLM7XP5uXK2o9UlPTvqLAu0UMruYcuZu/
 38d2MRwv2+tbDQCP4BjDW66UGCXi0ueaBRmRgk3juPQlQ78C5YBwkqQ/A
 Nu8SlhE7bPHhon+iZY1DG/WZqr/A7CHaWAbaym/MYUVl81vP0BqV5MvJH
 VvYlP+7zcTrhEq9ZRkACZY9UdzwAZE4Ev0mya/Em3t7FRu/JMaUtPesM1
 8P3MQJ7yXD8aPjNpCKAVDf2s3JZKOkHcUwPxM491+vaLa1JLkTFMc3S7u A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420638381"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="420638381"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="656804788"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="656804788"
Received: from aravind2-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.46.36])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:47:40 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 13:47:12 +0300
Message-Id: <20230530104713.2570554-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530104713.2570554-1-jouni.hogander@intel.com>
References: <20230530104713.2570554-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 8/9] drm/i915/fbc: Add function to get number
 of fences for gt
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

Add new function to get number of fences for gt. This allows removing
couple of ifdefs.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c              |  4 +---
 drivers/gpu/drm/i915/gt/intel_gt_types.h              |  2 ++
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h     |  3 +++
 .../gpu/drm/xe/compat-i915-headers/intel_gt_types.h   | 11 +++++++++++
 4 files changed, 17 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 109f86bb19ef..2cb537504c2f 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -607,10 +607,8 @@ static void ivb_fbc_activate(struct intel_fbc *fbc)
 	else if (DISPLAY_VER(i915) == 9)
 		skl_fbc_program_cfb_stride(fbc);
 
-#ifdef I915
-	if (to_gt(i915)->ggtt->num_fences)
+	if (intel_gt_fence_count(to_gt(i915)))
 		snb_fbc_program_fence(fbc);
-#endif
 
 	intel_de_write(i915, ILK_DPFC_CONTROL(fbc->id),
 		       DPFC_CTL_EN | ivb_dpfc_ctl(fbc));
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index f08c2556aa25..76bc88d974b2 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -306,4 +306,6 @@ enum intel_gt_scratch_field {
 	INTEL_GT_SCRATCH_FIELD_COHERENTL3_WA = 256,
 };
 
+#define intel_gt_fence_count(gt) gt->ggtt->num_fences
+
 #endif /* __INTEL_GT_TYPES_H__ */
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 0ccc97fb9e90..89ff4e984e6b 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -19,9 +19,12 @@
 #include "i915_reg_defs.h"
 #include "intel_pch.h"
 #include "i915_utils.h"
+#include "intel_gt_types.h"
 #include "intel_uncore.h"
 #include <linux/pm_runtime.h>
 
+#define intel_gt_fence_count(gt) 0
+
 static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
 {
 	return container_of(dev, struct drm_i915_private, drm);
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h
new file mode 100644
index 000000000000..183f5c3a1bd1
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
+#define intel_gt_fence_count(gt) 0
+
+#endif
-- 
2.34.1

