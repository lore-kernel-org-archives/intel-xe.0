Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B08AD68B31
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 15:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545C510E7FE;
	Thu, 14 Nov 2024 15:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEC8t1ty";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032D510E7FF
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 15:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731597778; x=1763133778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3DPv8B2Z38taW+Nb638iwIBZYTmQT/C5ngziYFJQXEE=;
 b=ZEC8t1tyYFtOlIn81OmjYV8M9phpd9yxAcPmnABF4nZfMmo07Eds6aFd
 O/dQUeD8pQpam8jBtxWN+besXnfEkhPcMmdaXwIWqKZwDFxl2dydazJFL
 n6dvWHIBc+4d96/DIPoxKHivfvAe6CuakSGKS9l1rgEJZWfRGJnXdR+AG
 uiJvxzwcz5BDy33aUuWTKPYt1NoZUIDeXeVIDQs0+o9mjZl/54LCbd0t3
 lcHeCQbAiPkQ17GLZLcUBiP2jH7urJqprds4N9JcUVlmsjgknhbwIsmrz
 fWkvqkNl+Pfjkf362rBIqX7YAfTMNmWjd/P1tz5ViijzNxB4xjw9y7WC2 Q==;
X-CSE-ConnectionGUID: yLWmcV4WRJGfm58ppDvg4w==
X-CSE-MsgGUID: QO2/8LWGQxaN/ECBAiMTuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="49004057"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="49004057"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:22:58 -0800
X-CSE-ConnectionGUID: xBITdJ9nRnKJDsN7la+VUA==
X-CSE-MsgGUID: hOfVVMugSqGP7vlq06r7sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="93189395"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:22:57 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 4/4] drm/xe: Split xe_gt_stat.h
Date: Thu, 14 Nov 2024 07:21:48 -0800
Message-ID: <20241114152148.572447-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114152148.572447-1-lucas.demarchi@intel.com>
References: <20241114152148.572447-1-lucas.demarchi@intel.com>
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

Follow what's done for the other headers, with the types split into a
separate header that can be included by other *_types.h headers.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.h       |  8 ++------
 drivers/gpu/drm/xe/xe_gt_stats_types.h | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h       |  2 +-
 3 files changed, 18 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_stats_types.h

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
index 91d944f6c4e43..38325ef536176 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats.h
@@ -6,15 +6,11 @@
 #ifndef _XE_GT_STATS_H_
 #define _XE_GT_STATS_H_
 
+#include "xe_gt_stats_types.h"
+
 struct xe_gt;
 struct drm_printer;
 
-enum xe_gt_stats_id {
-	XE_GT_STATS_ID_TLB_INVAL,
-	/* must be the last entry */
-	__XE_GT_STATS_NUM_IDS,
-};
-
 #ifdef CONFIG_DEBUG_FS
 int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr);
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
new file mode 100644
index 0000000000000..2fc055e39f273
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_STATS_TYPES_H_
+#define _XE_GT_STATS_TYPES_H_
+
+enum xe_gt_stats_id {
+	XE_GT_STATS_ID_TLB_INVAL,
+	/* must be the last entry */
+	__XE_GT_STATS_NUM_IDS,
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 20901c01ba29a..6e66bf0e8b3f7 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -11,7 +11,7 @@
 #include "xe_gt_idle_types.h"
 #include "xe_gt_sriov_pf_types.h"
 #include "xe_gt_sriov_vf_types.h"
-#include "xe_gt_stats.h"
+#include "xe_gt_stats_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
 #include "xe_oa_types.h"
-- 
2.47.0

