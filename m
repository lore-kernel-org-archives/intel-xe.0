Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D38C77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 10:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4288D10E65B;
	Fri,  2 Jun 2023 10:43:18 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB87510E65E
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 10:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685702596; x=1717238596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SDtHUwcLNns/LI5aS91QnVxulx78uZl7YPAzUFsgP44=;
 b=Vu54AVDISaQC6u1jV3rlRn5HkOoU8EVU0vRlAcvKn26/PBk/1d9E7Hk1
 2ILKft4tcdguukG9kI1ox8WTNPX/iA0gKRIEwF2YE/lgFnxLu89OT9ivF
 iIGxQilife5Ie3qIdrEb5FlvZ20qnsKzupMxBKOlzCjdwBDxBVjOjhIF0
 EQSpq1ldh9/ue7P1zZhqVf30SbtgmHwTvQz9vCX0RHFzdQTH0eztLK9vG
 IPsBjWBN3PmayqiI17WeDECS1G4KxDuK4A1uylKsyeRkbHe4PLcd1ngdE
 aazn/YfUIlOtALDfwrbk7798y+sQCw0hgzGX7kgEeEhK33az82gV/BXPV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="442215575"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="442215575"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="658237926"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="658237926"
Received: from amelillo-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.251.209.93])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:43:14 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 13:42:37 +0300
Message-Id: <20230602104237.1014684-11-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602104237.1014684-1-jouni.hogander@intel.com>
References: <20230602104237.1014684-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 10/10] drm/xe: Add Xe implementation for fence
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
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h     |  2 ++
 .../gpu/drm/xe/compat-i915-headers/intel_gt_types.h   | 11 +++++++++++
 3 files changed, 14 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 513b570d4895..88cbffaeadee 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -19,6 +19,7 @@
 #include "i915_reg_defs.h"
 #include "intel_pch.h"
 #include "i915_utils.h"
+#include "intel_gt_types.h"
 #include "intel_uncore.h"
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index c40bb27ac72a..45ea0e44073d 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -11,4 +11,6 @@ struct i915_vma {
 	struct drm_mm_node node;
 };
 
+#define i915_vma_fence_id(vma) -1
+
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

