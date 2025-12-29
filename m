Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05345E8FDB1
	for <intel-xe@archiver.kernel.org>; Mon, 29 Dec 2025 11:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B261110E40F;
	Mon, 29 Dec 2025 11:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJv8QG8U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5915F10E415;
 Mon, 29 Dec 2025 11:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767009305; x=1798545305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tHJj2B42o53T7wn4vugmhhO8X2mfccMXKDH210Jeh2g=;
 b=JJv8QG8USCe0ePnOEqj6dcjJsRN93Td5oggGnZ2SZv/4oCyqMnuo+OPq
 enYVdwJtuiX74XDtD28U3nW9Nt2Xw8ueHIedBrVMAlPXSpetItUW7vqRq
 FT+eq74qByoOQIzF1VY+vyfOyXurtGtEHRyiYIHvzJCK8uALEPwmVbgKc
 bIOfGaGN136GUlC7bkyhzLmrpE76n9UpyU2Z168ZLY2/fljPG0XdxYjea
 CakdADK9nuMDx7yDNvBYZ+dnXXhBvPTP1boZODHlB4RHEAgfNP6TOXcSm
 8b1jFRcNW14k9cnnrrC9hofnY/MTEgkjBeKYi35tmuFn9WEdlb7kU5TYO Q==;
X-CSE-ConnectionGUID: WNMgrPDtTt+tPXMJF8N/rg==
X-CSE-MsgGUID: XV2UAHf3SauyfAk6CcRCdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68593155"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="68593155"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 03:55:05 -0800
X-CSE-ConnectionGUID: FQaH0IBKSDueFr/sMQzJyA==
X-CSE-MsgGUID: x3AIIAwCSvCiWxoGXLCg9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="201176753"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.147])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 03:55:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH 2/3] drm/xe: remove compat i915_drv.h and
 -Ddrm_i915_private=xe_device hack
Date: Mon, 29 Dec 2025 13:54:44 +0200
Message-ID: <8d2da5404439ed334d7682922b599f36eeb60e9d.1767009044.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1767009044.git.jani.nikula@intel.com>
References: <cover.1767009044.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The xe display build no longer needs the compat i915_drv.h or the ugly
-Ddrm_i915_private=xe_device hack. Remove them, with great pleasure.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |  3 +--
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h | 22 -------------------
 2 files changed, 1 insertion(+), 24 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3315f93a35b2..2b20c79d7ec9 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -200,8 +200,7 @@ endif
 # i915 Display compat #defines and #includes
 subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
 	-I$(src)/compat-i915-headers \
-	-I$(srctree)/drivers/gpu/drm/i915/display/ \
-	-Ddrm_i915_private=xe_device
+	-I$(srctree)/drivers/gpu/drm/i915/display/
 
 # Rule to build display code shared with i915
 $(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
deleted file mode 100644
index 04d1925f9a19..000000000000
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-#ifndef _XE_I915_DRV_H_
-#define _XE_I915_DRV_H_
-
-/*
- * "Adaptation header" to allow i915 display to also build for xe driver.
- * TODO: refactor i915 and xe so this can cease to exist
- */
-
-#include <drm/drm_drv.h>
-
-#include "xe_device_types.h"
-
-static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
-{
-	return container_of(dev, struct drm_i915_private, drm);
-}
-
-#endif
-- 
2.47.3

