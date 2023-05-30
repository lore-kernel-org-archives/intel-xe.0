Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100B7C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B7910E379;
	Tue, 30 May 2023 10:47:38 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E8B10E140
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685443653; x=1716979653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QP5uKHGylRKmY2ZfLwk8DP6Brvw6C870zgx17a90n88=;
 b=eTsD3F/qjPtLyvZuqKJUew+Yb240ZcgM0BKIWw1ubzSsJ5PFIlKKFm/z
 NuvrLGr6CknyA5REQk6k4gKWdIBEpsE3VoCSMXRpfphT/EH+1HaqaP1/M
 c3HUNdcBvewc3tV7KKNWVGbaye1HdyHWEaJqercWJP4Eu0HIeRKBeAJ1z
 vIO+wpbtMxxMnWGpRFbwHeyqqUxZiXqO5xhNv3O4RfW6zcdwzUECsqXQs
 viYklN7y3wgCSRmhtVnBrAJKgwrWASfEU8t4O1gdZZprzGOhUZbD3Hvve
 Xy4j7yfWvmNqgx1H0oOR96GVAJsNkphRMFNp3OuSHOMW2cCyl78eHX0OL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420638348"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="420638348"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:47:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="656804753"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="656804753"
Received: from aravind2-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.46.36])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:47:32 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 13:47:06 +0300
Message-Id: <20230530104713.2570554-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530104713.2570554-1-jouni.hogander@intel.com>
References: <20230530104713.2570554-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/9] drivers/xe: Add new type for compressed fb
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

We want to remove details of stolen memory handling from intel_fbc
code. Add new type for compressed fb which will be the only common thing
with i915 and Xe stolen memory handling.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h      |  1 +
 .../gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h   | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 74e6f063f741..89c718de0eab 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -14,6 +14,7 @@
 #include "xe_bo.h"
 #include "xe_pm.h"
 #include "xe_step.h"
+#include "i915_gem_stolen.h"
 #include "i915_reg_defs.h"
 #include "intel_pch.h"
 #include "i915_utils.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
new file mode 100644
index 000000000000..b6eeeba1087b
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
@@ -0,0 +1,10 @@
+#ifndef _I915_GEM_OBJECT_H_
+#define _I915_GEM_OBJECT_H_
+
+struct xe_bo;
+
+struct i915_stolen_fb {
+	struct xe_bo *bo;
+};
+
+#endif
-- 
2.34.1

