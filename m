Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE510C3DA66
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 11:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9903810E664;
	Fri, 25 Aug 2023 11:53:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F2610E663
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 11:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692964395; x=1724500395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hxRRj/56wEIW41HrG38IzthWDwFkvWP9wFhyDssQybQ=;
 b=ev/Ti92mQHyZ3723kpoqhi//xuL6lskd9Rzt9MBaK0QMWgg1NFM9EBzk
 B/OYywpEIgekdDvftIz4a5Obmr1tW2Yk2Nr2+8ih6XRl/L7aSfxq4EqI+
 j0IeiDJJwHKuPTcfqNWZ+EnZlFsdJ09ZseE9g5m/joKbNW79N8722auqs
 X3eDurN6mp+YS7bAhJQX64e1C7qReLaFCn4v6ooQysx74i3xgbkSepBrF
 c6PD4IZBvS0oYaRp9l6/P/CdFifjVRU+QCc8jjb2eYowhoq8WR8Twpdmz
 JoSnBUTgq8pVxDzNEX6WolbgkL/UFohmalBpr619eqkNVc69iElqNgxHX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="405696130"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="405696130"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="827569053"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="827569053"
Received: from janlundk-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.56.87])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:53:14 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 14:52:54 +0300
Message-Id: <20230825115255.1319907-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825115255.1319907-1-jouni.hogander@intel.com>
References: <20230825115255.1319907-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/5] drm/xe: Add i915_gem.h compatibility header
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
empty GEM_BUG_ON definition for fbc code.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 1 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h | 9 +++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 6607c5a374cc..55d0d5c7a386 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -15,6 +15,7 @@
 #include "xe_bo.h"
 #include "xe_pm.h"
 #include "xe_step.h"
+#include "i915_gem.h"
 #include "i915_gem_stolen.h"
 #include "i915_reg_defs.h"
 #include "i915_utils.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
new file mode 100644
index 000000000000..06b723a479c5
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
+#define GEM_BUG_ON
+#endif
-- 
2.34.1

