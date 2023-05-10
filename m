Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33407C77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D2810E48A;
	Wed, 10 May 2023 12:13:11 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAD410E48A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720789; x=1715256789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JpccoOPKXL3VKMWVuWlzmZgyEwQDEb49+4fjB+afe3c=;
 b=hmnPr3TVHaj2eYdjkyv2fFXlniNP+W4r+JT46du+u/tNBNkrNq56GRA9
 fc7LoItANDXaRZVk6yWIA0Sqazw19qzlw0hBrgeEd2TUlWWo/ifH66hmX
 psMVa8jHBi/M5BSGf+zDVxUn3Jxutb/zkiZErTS4LlTRMKffUzmyOwYei
 Cv+Hof606HR2/OoDW+6wvsPttMLFG5uVEmMmZdbeS9HIJ1CuOZRTHI3g8
 3wF5DaOEXNe9fmD10/MSJcb7wEPifPd79rxirS/WDyqsdxyTcUnHMuHEm
 MdEusl86fZV26w6kkNpTJyBUtcsry45mnU3Ec8EbbUKrD+l6xSg64ISam g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268272"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268272"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:13:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906423"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906423"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:13:05 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:49 +0300
Message-Id: <20230510121152.736148-21-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 20/23] drm/xe/display: Use frontbuffer
 tracking for Xe as well
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
Cc: jani.nikula@intel.com, rodrigo.vivi@kernel.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use frontbuffer tracking for Xe as well as needed. We still need to
perform flush for PSR, FBC and DRRS. For this purpose use frontbuffer
tracking for Xe as well.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_drrs.c          | 1 +
 drivers/gpu/drm/i915/display/intel_fb.c            | 3 +++
 drivers/gpu/drm/i915/display/intel_psr.c           | 1 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 1 +
 4 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
index 760e63cdc0c8..59527a4667f4 100644
--- a/drivers/gpu/drm/i915/display/intel_drrs.c
+++ b/drivers/gpu/drm/i915/display/intel_drrs.c
@@ -9,6 +9,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_drrs.h"
+#include "intel_frontbuffer.h"
 #include "intel_panel.h"
 
 /**
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index e62e1e12758d..fa4464d433b7 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -13,6 +13,7 @@
 #include "intel_display_types.h"
 #include "intel_dpt.h"
 #include "intel_fb.h"
+#include "intel_frontbuffer.h"
 
 #ifdef I915
 /*
@@ -1923,11 +1924,13 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	int i;
 #ifdef I915
 	unsigned tiling, stride;
+#endif
 
 	intel_fb->frontbuffer = intel_frontbuffer_get(obj);
 	if (!intel_fb->frontbuffer)
 		return -ENOMEM;
 
+#ifdef I915
 	i915_gem_object_lock(obj, NULL);
 	tiling = i915_gem_object_get_tiling(obj);
 	stride = i915_gem_object_get_stride(obj);
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index ea0389c5f656..2ecc902a85a2 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -32,6 +32,7 @@
 #include "intel_display_types.h"
 #include "intel_dp.h"
 #include "intel_dp_aux.h"
+#include "intel_frontbuffer.h"
 #include "intel_hdmi.h"
 #include "intel_psr.h"
 #include "intel_psr_regs.h"
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 71ba544eda71..0f1e4e61d32e 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -16,6 +16,7 @@
 #include "intel_display_types.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
+#include "intel_frontbuffer.h"
 #include "intel_psr.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
-- 
2.34.1

