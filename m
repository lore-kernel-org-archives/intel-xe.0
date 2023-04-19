Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B96C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 12:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C914A10E96B;
	Wed, 19 Apr 2023 12:40:21 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67C410E96B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 12:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681908019; x=1713444019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=odkH7/XyNKQ6Xr0y9wjSGx5jhnI+uPZbFlJTAbre4RA=;
 b=OHoJ7OnfkHr2JQPMaZmozBBhxkuLDIHDkjNWoYec4OSxq97yS6x58/cH
 4lJnypoPNYkQiX8iPvzhTxA1qMwbjT7h6lqB12NGHARXSVslL6kpoyVle
 5OZNYdSsgrj/rBbY7BwR2NgdISjjA4DCUSGKXUCVOFKJ+vOcd+LfZSxNL
 N2IeOnhnF2EVrK4MxmXN+FU7br9xKFstoshEdRmN+QpnzVTKSrAYB7f2f
 YVohxuuU+ABfX/3Z0WAIm+RwPRUi1QC2Zq8uJ4ZTG/fT97RfsCZv29eJv
 CUosgJTmcjxzUkeaT5TXtIM3YtJFQJ8AfAh1dVP0T/UrsVn0v/flWE6Ld Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="348189445"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="348189445"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="937660258"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="937660258"
Received: from yedidyal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.37])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:40:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 15:39:42 +0300
Message-Id: <20230419123947.543175-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230419123947.543175-1-jani.nikula@intel.com>
References: <20230419123947.543175-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/9] fixup! drm/xe/display: Implement display
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

With i9xx_wm.h conditional build, this is now unnecessary.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile              |  1 -
 drivers/gpu/drm/xe/display/ext/i9xx_wm.c | 24 ------------------------
 drivers/gpu/drm/xe/display/ext/i9xx_wm.h | 20 --------------------
 3 files changed, 45 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/display/ext/i9xx_wm.c
 delete mode 100644 drivers/gpu/drm/xe/display/ext/i9xx_wm.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 9fa4aaad6b8f..61739cacbc5b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -120,7 +120,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/xe_plane_initial.o \
 	display/xe_display_rps.o \
 	display/ext/i915_irq.o \
-	display/ext/i9xx_wm.o \
 	display/ext/intel_device_info.o \
 	display/ext/intel_dram.o \
 	display/ext/intel_pch.o \
diff --git a/drivers/gpu/drm/xe/display/ext/i9xx_wm.c b/drivers/gpu/drm/xe/display/ext/i9xx_wm.c
deleted file mode 100644
index 8fae4215be20..000000000000
--- a/drivers/gpu/drm/xe/display/ext/i9xx_wm.c
+++ /dev/null
@@ -1,24 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#include "i9xx_wm.h"
-
-bool ilk_disable_lp_wm(struct drm_i915_private *i915)
-{
-	return false;
-}
-
-void ilk_wm_sanitize(struct drm_i915_private *i915)
-{
-}
-
-bool intel_set_memory_cxsr(struct drm_i915_private *i915, bool enable)
-{
-	return true;
-}
-
-void i9xx_wm_init(struct drm_i915_private *i915)
-{
-}
diff --git a/drivers/gpu/drm/xe/display/ext/i9xx_wm.h b/drivers/gpu/drm/xe/display/ext/i9xx_wm.h
deleted file mode 100644
index b87ae369685a..000000000000
--- a/drivers/gpu/drm/xe/display/ext/i9xx_wm.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#ifndef __I9XX_WM_H__
-#define __I9XX_WM_H__
-
-#include <linux/types.h>
-
-struct drm_i915_private;
-struct intel_crtc_state;
-struct intel_plane_state;
-
-bool ilk_disable_lp_wm(struct drm_i915_private *i915);
-void ilk_wm_sanitize(struct drm_i915_private *i915);
-bool intel_set_memory_cxsr(struct drm_i915_private *i915, bool enable);
-void i9xx_wm_init(struct drm_i915_private *i915);
-
-#endif /* __I9XX_WM_H__ */
-- 
2.39.2

