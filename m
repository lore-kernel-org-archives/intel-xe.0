Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14084C77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 14:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2A210E2C2;
	Mon,  8 May 2023 14:47:19 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAFA10E2E5
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 14:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683557234; x=1715093234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eQoACET5Vym5VOomZemQSaBSkUlgw3PpmTo7cgfpa8w=;
 b=c61NAu0p6UG9/lMp4W2bWtnV1fkA2s0FscgBlGfujFK3VMgmrkkFg7Fx
 oOtejaEjYi0NM5wa3MZ+qeB/XlaPfIURUvY2MpFYh1BJ6GePI/dIy7In8
 qndOdLay7V7V2i6Y/UdB92PBVQdhr4X6ApfRPJL/IjZS+0vO0aij6R3ou
 3fdYuecneXulQz+eHB/qX0m4kMrEkPbNRW0KtSBk0CpuDhl4HrvMsTXS2
 UecfIS/IRaw95qNFLz+5fALxn98POKVafIfXicKiscFXuy0G//ojO05BA
 CuwoEhVS+JuIozLIYeEMr8rbzrX45MND5fCdE5umR5G9IftIE6JB8PSuD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="347129971"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="347129971"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 07:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="1028433494"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="1028433494"
Received: from heid-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.78])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 07:46:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 17:46:04 +0300
Message-Id: <20230508144618.162140-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508144618.162140-1-jani.nikula@intel.com>
References: <20230508144618.162140-1-jani.nikula@intel.com>
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
index b6c41cd7dbe3..e5130613a943 100644
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

