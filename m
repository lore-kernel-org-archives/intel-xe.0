Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46765C7EE22
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 13:10:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2661710E29A;
	Wed,  3 May 2023 13:10:34 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E050310E29A
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 13:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683119432; x=1714655432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pxjgE0DlODNyMIrFF7orqcnKHMlkAy8Sgc7yhjzame4=;
 b=NScdW/PBNt7OSZPtLL1dkcQAwaM+oT56hKm7/e+ILbaTcqWWMfYJ1ENm
 INUDU5F3Qa7ocM2n7+TX3NCEPn2SPd70Qo+UcpJPicb8LyXK1m9G9seFE
 9ShBO/Xnt+TVJLj6DCIKg+lxoo9JBYz4gsIGLewcEG+6Z1fcdUswq2Tka
 LWy4j09Z8lKEZz/lz3VP/TR9Xcr0CzArjMmYn3RP425bla10YehsXwSni
 pBXbqQ2l06nAz597jDoPWr+L1REm7SS+CNN+kzCxwG4euzQU4wCCmH3Ll
 PyTFT6FEAWRWriwCH2JaQeIQLe7u4pIxmgJESufZYLAraFwe6r+I9NiKu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="434960702"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="434960702"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:10:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="820762291"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="820762291"
Received: from ebrosekx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.204])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:10:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 16:09:51 +0300
Message-Id: <20230503131005.1602412-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503131005.1602412-1-jani.nikula@intel.com>
References: <20230503131005.1602412-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 04/18] fixup! drm/xe/display: Rename intel_de.h
 to xe_de.h
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

Revert "drm/xe/display: Rename intel_de.h to xe_de.h". Remove the entire
commit from history. This is just to revert further changes cleanly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h            | 4 ++--
 drivers/gpu/drm/xe/Makefile                        | 1 +
 drivers/gpu/drm/xe/display/{xe_de.h => intel_de.h} | 8 ++++----
 3 files changed, 7 insertions(+), 6 deletions(-)
 rename drivers/gpu/drm/xe/display/{xe_de.h => intel_de.h} (97%)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 8ffe2a9e4913..5c223ff6b3ec 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -3,8 +3,8 @@
  * Copyright © 2019 Intel Corporation
  */
 
-#ifndef I915
-#include "xe_de.h"
+#ifdef BUILD_FOR_XE
+#include_next "intel_de.h"
 #else
 #ifndef __INTEL_DE_H__
 #define __INTEL_DE_H__
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 84ad0e949044..92cc9c9b3e86 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -103,6 +103,7 @@ subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
 	-I$(srctree)/$(src)/compat-i915-headers \
 	-I$(srctree)/drivers/gpu/drm/xe/display/ \
 	-I$(srctree)/drivers/gpu/drm/i915/display/ \
+	-DBUILD_FOR_XE=1 \
 	-Ddrm_i915_gem_object=xe_bo \
 	-Ddrm_i915_private=xe_device
 
diff --git a/drivers/gpu/drm/xe/display/xe_de.h b/drivers/gpu/drm/xe/display/intel_de.h
similarity index 97%
rename from drivers/gpu/drm/xe/display/xe_de.h
rename to drivers/gpu/drm/xe/display/intel_de.h
index 0c76b0d24d96..31322cf5e7af 100644
--- a/drivers/gpu/drm/xe/display/xe_de.h
+++ b/drivers/gpu/drm/xe/display/intel_de.h
@@ -1,10 +1,10 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2019-2022 Intel Corporation
+ * Copyright © 2019 Intel Corporation
  */
 
-#ifndef _XE_DE_H_
-#define _XE_DE_H_
+#ifndef __INTEL_DE_H__
+#define __INTEL_DE_H__
 
 #include "i915_drv.h"
 #include "xe_mmio.h"
@@ -160,4 +160,4 @@ static inline int intel_de_pcode_request(struct drm_i915_private *i915, u32 mbox
 				timeout_base_ms);
 }
 
-#endif
+#endif /* __INTEL_DE_H__ */
-- 
2.39.2

