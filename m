Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F061AC83F01
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 09:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C613910E5E7;
	Thu, 31 Aug 2023 09:52:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C022710E5E7
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 09:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693475534; x=1725011534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hxRRj/56wEIW41HrG38IzthWDwFkvWP9wFhyDssQybQ=;
 b=fH8+kpmI+kzEX0f558Gs/IjxIAg/wg34OOnhcF/ezo7nLy/xOSqROT9U
 M826wOphTGB6io2RvTOlA0WUmCfCgskQhUEz/hEhtSfzhWhlfuNe9Ik5S
 rRPnLSAT9PHpZD7V9ERt2LW0ILqkUkx0+bvo0qhYembKo6BbtX23yBT+4
 Z01Tad0wqExViP0ToDpkefRH2o6nu6kAJcZq9c8EE8g6gMXdwlGqunSu3
 rHB8w2+cT9DAdB1E1ykB8ckQchpg2p81DBDTtID7Rcz8DGh/CTv47kqgO
 k1im1Xkt+bX331+m2WntambSSH5K6lOiMsQOHg91Ls/JZF8as3ztnBJNr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="373284407"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="373284407"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 02:52:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739440794"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="739440794"
Received: from zlevit-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.47.221])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 02:52:13 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 31 Aug 2023 12:51:53 +0300
Message-Id: <20230831095154.3121578-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831095154.3121578-1-jouni.hogander@intel.com>
References: <20230831095154.3121578-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/5] drm/xe: Add i915_gem.h compatibility
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

