Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4036BC7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1708A10E134;
	Tue, 30 May 2023 10:35:21 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37DA10E134
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685442919; x=1716978919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x77+oF/ScpIq2AnnI+0tAJWZD3FV5a9wEzsrvARQzWY=;
 b=CAZ/ZtJnQtmFr3vE8p44k5oECR+I2L/nfyldDmIRTD2mbmbhJsIDEdiT
 PoGqrM6rwYlOMfFj+2qBemAq9hSFvJbsCf0bFFa1blIJGQtDwUA6P63An
 s8N2j/z4Ll33P1Pln3vixdV6EK653LXkz2JTXlM6sek+LZW2t7BZ9qkwU
 e+ICGf3pG76Z+AmcftlZGJmKGN3oyiryFUQa5vlq5Em95OuEaQdZ4ZIEw
 eHL9hMq2VdsQOkJpNqz323Um9s0+EhpzDKbPliKEvUWXSEtY1lFb/RbHt
 a4zi7/Rvduu+u/oN+9rVa9lOlcL72R7hl6dW2PHGXikLaHq1tmYUvZDf2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="352378076"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="352378076"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:34:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="796226081"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="796226081"
Received: from aravind2-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.46.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:34:53 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 13:34:15 +0300
Message-Id: <20230530103420.2561722-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530103420.2561722-1-jouni.hogander@intel.com>
References: <20230530103420.2561722-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/9] drm/xe: Add i915_gem.h compatibility header
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

