Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F2CC77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A6510E382;
	Tue, 30 May 2023 10:47:41 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6672810E379
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685443656; x=1716979656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x77+oF/ScpIq2AnnI+0tAJWZD3FV5a9wEzsrvARQzWY=;
 b=Zf1juv0QQG25ilUqRrhCE2qzPREBnYnhJVQcY/ju+IDsXYEfETZO7DKW
 VruY2r/NqB/Z+cSckLFFbnjTXuBH2KKstHo0jNFz0etbd6xj9jH49pwLS
 vksq3xiexkeSxSRrg6PAL/DZZgdDvSM6J4+PZ/YAVpYNQd678hYB+qyQt
 k9fmQtIqF4heOVita5vzK1pk4zQdmyYEcMgvjkUH2/OnVf1kg781gYRIg
 1+L6y+DH8zFFFUW81tOOLOwq7IXi5LngLzZBoPgYQBfSZHyJUvA6uZH4J
 YURVim3VbfzapwM2s26mS8uvyvcULoANIfxmtCI7FA40KCMun6wJS2hhb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420638361"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="420638361"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:47:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="656804767"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="656804767"
Received: from aravind2-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.46.36])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:47:35 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 13:47:08 +0300
Message-Id: <20230530104713.2570554-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530104713.2570554-1-jouni.hogander@intel.com>
References: <20230530104713.2570554-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/9] drm/xe: Add i915_gem.h compatibility
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add i915_gem.h compatibility header and include it in i915_drv.h. Add
GEM_BUG_ON definition for fbc code.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 1 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h | 9 +++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 89c718de0eab..0ccc97fb9e90 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -14,6 +14,7 @@
 #include "xe_bo.h"
 #include "xe_pm.h"
 #include "xe_step.h"
+#include "i915_gem.h"
 #include "i915_gem_stolen.h"
 #include "i915_reg_defs.h"
 #include "intel_pch.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
new file mode 100644
index 000000000000..4f1f5e175625
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __I915_GEM_H__
+#define __I915_GEM_H__
+#define GEM_BUG_ON XE_BUG_ON
+#endif
-- 
2.34.1

