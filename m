Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DD9C7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C36A10E379;
	Tue, 30 May 2023 10:34:53 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848E210E379
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685442891; x=1716978891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QP5uKHGylRKmY2ZfLwk8DP6Brvw6C870zgx17a90n88=;
 b=EE/mmZezi6WGLxYhbEJtskJVQztUVHD8gIjjQLMifeJCmxED2JAEVQk+
 myu4JGJGCdCAUIFPQDWBRn55BWvKUBpDKEVv71s8GqVJtBpoEf8cZiKL2
 JpJ/nr+xJ1S3T+iFQQOldtKtzE76W/k405IIA3way9PSIF2DlN8S3TzKq
 OETBfj+AKXmpMZ0brmIDfCLJRgIQkAf8p0gr+b9ng94iqohXiJYCgBvTd
 PfU+8BkzfWVv/vU3LkhZZC3Lv6VfBS7hS/VX8T+6ZxGZ06GR/gMfDDXjy
 jnKrWHGDmdjiTEI8RgFL4TbFK7vmYNA5GKuh570wCMXejPnd+3xFe8EkY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="352378047"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="352378047"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="796226035"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="796226035"
Received: from aravind2-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.46.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:34:49 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 13:34:13 +0300
Message-Id: <20230530103420.2561722-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530103420.2561722-1-jouni.hogander@intel.com>
References: <20230530103420.2561722-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/9] drivers/xe: Add new type for compressed fb
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

