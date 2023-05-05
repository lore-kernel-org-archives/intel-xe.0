Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D499C77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2025410E5A6;
	Fri,  5 May 2023 08:31:26 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3656F10E5AE
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683275485; x=1714811485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jMJ8LMSc+6cUobDyXTbSN1WRq2M0oUHH6HmIsLJbmyU=;
 b=j0lLUYct1MHFrY2fOYVBfbyajrdeyfz9A4ZjMP6goeAwwKopZdh6G6jF
 J5yFKPFYKD/OmAoynF3hztfubWE+lcpXFTxt95p7w5G2J0EWfQRwe2lQ3
 OnfusawgADYza2za30nf1W0Bx+lSuTEkMH158eiCAEId7ObIs0Z0fIPlq
 TujKbNOnYrn7uO10xpgn6TGICtZTzeFZ2ZvAOeL1cZ3tyENJFBeCYim2y
 3UaHjAoN5ICjlrTSU4rfoLfsw0zlrXY1+d2nw4HEn/IWi5ex1d6sJ8ThA
 uaggi0UAudHWwh8q25CPchDv7GSKgBYmAf74RpXkTNk2ScvTsNOX1vatu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328783334"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328783334"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943749681"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943749681"
Received: from pklosowski.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.36.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:22 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 11:29:53 +0300
Message-Id: <20230505082956.2247875-18-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505082956.2247875-1-jouni.hogander@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 17/20] drm/xe/display: Use frontbuffer
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
Cc: jani.nikula@intel.com,
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
 drivers/gpu/drm/xe/xe_bo_types.h                   | 2 ++
 5 files changed, 8 insertions(+)

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
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 229fedc8ea72..df5be030991a 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -68,6 +68,8 @@ struct xe_bo {
 	struct llist_node freed;
 	/** @created: Whether the bo has passed initial creation */
 	bool created;
+
+	struct intel_frontbuffer *frontbuffer;
 };
 
 #define intel_bo_to_drm_bo(bo) ((bo)->ttm.base)
-- 
2.34.1

