Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEF9C001B2
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 16:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C41510E8E4;
	Thu,  9 Nov 2023 16:18:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD6510E8EC
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699546709; x=1731082709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=05HdgHaj/oBVDxkPTmHWVVgFYO2iVcfKBuC7FHFn9XM=;
 b=ES1YedIOw7E3g03ET9SXm0mGgGQ+ohLKKqqWz/mVxkMAkZFAQ2TgrIJJ
 bcSSd0838YkGnXMSS9ZaQxWo+ZaRvBdNsha5cKcB+ox0ER7m0PILElRyr
 UmH2ttc0B2zETaRAARCLaH0tNLU/PVO8a6+HKEwFUCj34ZvqLWbpz7a1Y
 7+OFmI3/IEW9mGwpIjKAbRPEq0pfHYyqFvZxf+MsAU4Cbsd+3Kd4VAD39
 7cEPngq+KtT/MPmjAuPt4mB88FdfpIX0NeREZpJIsCMS7v6yLqKqLYxOz
 UVbfy1tCyr3mLGrffEuR/AcVcFz5+AoiFAAt4cJHfw8ujSr3tuBSKVY5+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11563344"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11563344"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 08:18:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4764633"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 08:18:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 18:17:58 +0200
Message-Id: <9eb1508874e9a20d9891aeea5732df1226708bb2.1699546565.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1699546565.git.jani.nikula@intel.com>
References: <cover.1699546565.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Wrappers for pxp.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../xe/compat-i915-headers/pxp/intel_pxp.h    | 28 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
new file mode 100644
index 000000000000..c2c30ece8f77
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __INTEL_PXP_H__
+#define __INTEL_PXP_H__
+
+#include <linux/errno.h>
+#include <linux/types.h>
+
+struct drm_i915_gem_object;
+struct intel_pxp;
+
+static inline int intel_pxp_key_check(struct intel_pxp *pxp,
+				      struct drm_i915_gem_object *obj,
+				      bool assign)
+{
+	return -ENODEV;
+}
+
+static inline bool
+i915_gem_object_is_protected(const struct drm_i915_gem_object *obj)
+{
+	return false;
+}
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4119ef03fb7e..be11cadccbd4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -480,6 +480,8 @@ struct xe_device {
 	struct {
 		const char *dmc_firmware_path;
 	} params;
+
+	void *pxp;
 #endif
 };
 
-- 
2.39.2

