Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A68C77B6F
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB00A10E82A;
	Wed, 12 Apr 2023 14:20:55 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE0C10E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309254; x=1712845254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1rHhVDuPLplEhNLrreQwrCzYuvO/F+y9TYoxdrO6N3I=;
 b=fqK/j4Fj/btZfCzI3A/d6asOXVOLDwlqIwobMAzrZBtJwRrFNG5RxMcS
 mQMAd5IlVYlMPZnjUyI/JaR3120V8+T9U2iP1DHcYwcbzsIdUvgq4gWny
 3j3hvsELYDmXA4kaH8C/GQbtVWcYGp5IOutpt53C4w7ZCFg7ftdzoIC5U
 echX1P8ggxJTvBERW3lN4mStHL9XY+/TjV4hlYIZWtQCayNt/8reqNnH0
 HO81AUlHMJtMvsraRIP1v0yw8YoUwK+dZXfpLIqSuY034jh5P6nvRUQsC
 wMTKu9NIyB+1QRlaevpxvJSlT6JXRjFw6UEv0Zkzm2/wAxco0DgDVcE1I w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="328020163"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="328020163"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="753544234"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="753544234"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:20:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:30 +0300
Message-Id: <20230412142006.877109-6-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 05/41] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add proper stubs for i915_vgpu.h.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/xe/compat-i915-headers/i915_vgpu.h    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h
new file mode 100644
index 000000000000..80b024d435dc
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _I915_VGPU_H_
+#define _I915_VGPU_H_
+
+#include <linux/types.h>
+
+struct drm_i915_private;
+struct i915_ggtt;
+
+static inline void intel_vgpu_detect(struct drm_i915_private *i915)
+{
+}
+static inline bool intel_vgpu_active(struct drm_i915_private *i915)
+{
+	return false;
+}
+static inline void intel_vgpu_register(struct drm_i915_private *i915)
+{
+}
+static inline bool intel_vgpu_has_full_ppgtt(struct drm_i915_private *i915)
+{
+	return false;
+}
+static inline bool intel_vgpu_has_hwsp_emulation(struct drm_i915_private *i915)
+{
+	return false;
+}
+static inline bool intel_vgpu_has_huge_gtt(struct drm_i915_private *i915)
+{
+	return false;
+}
+static inline int intel_vgt_balloon(struct i915_ggtt *ggtt)
+{
+	return 0;
+}
+static inline void intel_vgt_deballoon(struct i915_ggtt *ggtt)
+{
+}
+
+#endif /* _I915_VGPU_H_ */
-- 
2.39.2

