Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DECC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 22:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A0310E2A4;
	Fri, 10 Nov 2023 22:47:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407FA10E2A4
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 22:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699656421; x=1731192421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9ywIGfOit8evOkZyK37X11Mn4otQCUWpsgwAkHz8ns4=;
 b=PIimL5GBVoDRLt50rSXc5njnU3Njkyerr0VUO9rbWX+PPJsVH3GIaU6m
 /TvH5DSrXDpYULZgyJsvBcfrIYUfGBoL5jLpTi8COfQa9BPGr1lkk722R
 Xenb5lZR7ICVGKh1qlp7UMBW7U8vy6UkWDCnAsT4/D733GslijERQot9h
 lxXQIpGzDK4JCAiUXOAuYyOCKO3GatqrPT7JQQGgXEmzK6Pm5oF6nIStf
 3Ylm4s//eMQLJrVKXaL7XF13pv1KFb9j17s3rnwR57Tf6wkOj2IqScdAe
 hQMnYa4J+UehAPKL80+AusErE8Xy5sE5jJBW8H74Qlob21jNCTHiG5Bmd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="387404364"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; d="scan'208";a="387404364"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 14:47:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="792943619"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; d="scan'208";a="792943619"
Received: from sschumil-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.54.111])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 14:46:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat, 11 Nov 2023 00:46:40 +0200
Message-Id: <20231110224640.3570307-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110224640.3570307-1-jani.nikula@intel.com>
References: <20231110224640.3570307-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 4/4] fixup! drm/xe/display: Implement display support
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
Cc: jani.nikula@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Wrappers for pxp.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

