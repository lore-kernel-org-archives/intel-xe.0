Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602FAC7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408A910E823;
	Wed, 12 Apr 2023 14:21:09 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6B610E838
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309265; x=1712845265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2GStYWWyfsQHSd2Gu0vhkO27Ue+6DMpLjkbfgKCjNus=;
 b=V3W+0h1ixwAdk/ixdPaRnTckp9uylDNhfG6HHjUsMB9IbSW0EZpB1bHE
 dR/LVAbyvvtepG4AJ2W4/c694m3KKtJweqHYQ8Ao8P9iGmlQ53w8jmLRc
 c4+3itqD8YSVNE0p6zn2TdPzYsIULuX14VZiApIJzRkqScXoUTYnSAIgo
 n9kTjPyhOmX/+wqNzqrEca+EVBkz4/sCbUkUj2+G/bp5sPBjzEWEI2fg0
 8/V1sBOGPfQVhoRrCt6rvM1sFAtHXM5oIJZRMrmBpD8OQ+mhnbxsLfHva
 9k97/Jys0nHFn/LhCCsmyCuH3kMRJ/Pe1lKkByzFpmG7J+P6ZvrRItxay w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="343915260"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="343915260"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:21:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="688955635"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="688955635"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:21:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:33 +0300
Message-Id: <20230412142006.877109-9-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 08/41] fixup! drm/xe/display: Implement display
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

None of this is supported by xe.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/xe/compat-i915-headers/vlv_sideband.h | 132 ++++++++++++++++++
 .../xe/compat-i915-headers/vlv_sideband_reg.h |   1 +
 2 files changed, 133 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h b/drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h
new file mode 100644
index 000000000000..ec6f12de5727
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h
@@ -0,0 +1,132 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2013-2021 Intel Corporation
+ */
+
+#ifndef _VLV_SIDEBAND_H_
+#define _VLV_SIDEBAND_H_
+
+#include <linux/types.h>
+
+#include "vlv_sideband_reg.h"
+
+enum pipe;
+struct drm_i915_private;
+
+enum {
+	VLV_IOSF_SB_BUNIT,
+	VLV_IOSF_SB_CCK,
+	VLV_IOSF_SB_CCU,
+	VLV_IOSF_SB_DPIO,
+	VLV_IOSF_SB_FLISDSI,
+	VLV_IOSF_SB_GPIO,
+	VLV_IOSF_SB_NC,
+	VLV_IOSF_SB_PUNIT,
+};
+
+static inline void vlv_iosf_sb_get(struct drm_i915_private *i915, unsigned long ports)
+{
+}
+static inline u32 vlv_iosf_sb_read(struct drm_i915_private *i915, u8 port, u32 reg)
+{
+	return 0;
+}
+static inline void vlv_iosf_sb_write(struct drm_i915_private *i915,
+				     u8 port, u32 reg, u32 val)
+{
+}
+static inline void vlv_iosf_sb_put(struct drm_i915_private *i915, unsigned long ports)
+{
+}
+static inline void vlv_bunit_get(struct drm_i915_private *i915)
+{
+}
+static inline u32 vlv_bunit_read(struct drm_i915_private *i915, u32 reg)
+{
+	return 0;
+}
+static inline void vlv_bunit_write(struct drm_i915_private *i915, u32 reg, u32 val)
+{
+}
+static inline void vlv_bunit_put(struct drm_i915_private *i915)
+{
+}
+static inline void vlv_cck_get(struct drm_i915_private *i915)
+{
+}
+static inline u32 vlv_cck_read(struct drm_i915_private *i915, u32 reg)
+{
+	return 0;
+}
+static inline void vlv_cck_write(struct drm_i915_private *i915, u32 reg, u32 val)
+{
+}
+static inline void vlv_cck_put(struct drm_i915_private *i915)
+{
+}
+static inline void vlv_ccu_get(struct drm_i915_private *i915)
+{
+}
+static inline u32 vlv_ccu_read(struct drm_i915_private *i915, u32 reg)
+{
+	return 0;
+}
+static inline void vlv_ccu_write(struct drm_i915_private *i915, u32 reg, u32 val)
+{
+}
+static inline void vlv_ccu_put(struct drm_i915_private *i915)
+{
+}
+static inline void vlv_dpio_get(struct drm_i915_private *i915)
+{
+}
+static inline u32 vlv_dpio_read(struct drm_i915_private *i915, int pipe, int reg)
+{
+	return 0;
+}
+static inline void vlv_dpio_write(struct drm_i915_private *i915,
+				  int pipe, int reg, u32 val)
+{
+}
+static inline void vlv_dpio_put(struct drm_i915_private *i915)
+{
+}
+static inline void vlv_flisdsi_get(struct drm_i915_private *i915)
+{
+}
+static inline u32 vlv_flisdsi_read(struct drm_i915_private *i915, u32 reg)
+{
+	return 0;
+}
+static inline void vlv_flisdsi_write(struct drm_i915_private *i915, u32 reg, u32 val)
+{
+}
+static inline void vlv_flisdsi_put(struct drm_i915_private *i915)
+{
+}
+static inline void vlv_nc_get(struct drm_i915_private *i915)
+{
+}
+static inline u32 vlv_nc_read(struct drm_i915_private *i915, u8 addr)
+{
+	return 0;
+}
+static inline void vlv_nc_put(struct drm_i915_private *i915)
+{
+}
+static inline void vlv_punit_get(struct drm_i915_private *i915)
+{
+}
+static inline u32 vlv_punit_read(struct drm_i915_private *i915, u32 addr)
+{
+	return 0;
+}
+static inline int vlv_punit_write(struct drm_i915_private *i915, u32 addr, u32 val)
+{
+	return 0;
+}
+static inline void vlv_punit_put(struct drm_i915_private *i915)
+{
+}
+
+#endif /* _VLV_SIDEBAND_H_ */
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h b/drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
new file mode 100644
index 000000000000..83166479ffb5
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
@@ -0,0 +1 @@
+#include "../../i915/vlv_sideband_reg.h"
-- 
2.39.2

