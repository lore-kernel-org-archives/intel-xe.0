Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C03D41C01
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 04:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC29610E67E;
	Wed, 13 Nov 2024 04:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ytiy9syi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F111710E336
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 04:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731472857; x=1763008857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0xtoK5lRSntYx9UGAok+D3lAIpNYv4Vf6xQy06B+/d8=;
 b=Ytiy9syix11XWAfNzR9H/002g02yPF1pMXMlV3HiKP8IWlo99fXa6lCB
 N7eQAYCqWaNs3i7K6b5xqYWOMM29Uce+VwL0+aryiWvAL/XBg18YzBbkO
 D4PoV/0FBYKr43wojm9qdJMiarXecIx0bVINGzugn9dFFArF842Ghx8M+
 LovyOv6rkNCRC51Kmg4e7e4iWTqiLWxWPkWjSlZ1O/Zz5IbrHBsPlLFWK
 SNDRc4FM0/eDRxTZSqXxOpoTz1YDIQHm1NeNZPVEE88qPVvkUBOw9sqrf
 WZN2h39ka0/Ce1ufAUc5MAikSih42JlOGQeuvuHhLTp3V+9crsURy9Zfx g==;
X-CSE-ConnectionGUID: YE8cDt4yRsKW5MkQQO303g==
X-CSE-MsgGUID: MN5Hh5VaR3Sx2ZCyIT7w/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30742192"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="30742192"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 20:40:49 -0800
X-CSE-ConnectionGUID: 0uTe8vBeRn68gqrXySSeNw==
X-CSE-MsgGUID: v1drbumuQlil7xyqifvdgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="87489493"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 20:40:47 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 john.c.harrison@intel.com, ashutosh.dixit@intel.com,
 soham.purkait@intel.com
Subject: [PATCH 4/7] drm/xe: add function to convert xe hw engine class to
 user class
Date: Wed, 13 Nov 2024 10:25:46 +0530
Message-Id: <20241113045549.2390980-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241113045549.2390980-1-riana.tauro@intel.com>
References: <20241113045549.2390980-1-riana.tauro@intel.com>
MIME-Version: 1.0
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

add a function to convert xe hw engine class to
user engine class

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
 drivers/gpu/drm/xe/xe_query.c     | 12 ++----------
 3 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1557acee3523..ba40f2692f34 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -981,6 +981,31 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
 	return NULL;
 }
 
+/**
+ * xe_hw_engine_to_user_class - converts xe hw engine to user engine class
+ * @engine_class: hw engine class
+ *
+ * Returns: user engine class on success, -1 on error
+ */
+u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class)
+{
+	switch (engine_class) {
+	case XE_ENGINE_CLASS_RENDER:
+		return DRM_XE_ENGINE_CLASS_RENDER;
+	case XE_ENGINE_CLASS_COPY:
+		return DRM_XE_ENGINE_CLASS_COPY;
+	case XE_ENGINE_CLASS_VIDEO_DECODE:
+		return DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+	case XE_ENGINE_CLASS_COMPUTE:
+		return DRM_XE_ENGINE_CLASS_COMPUTE;
+	default:
+		XE_WARN_ON(engine_class);
+		return -1;
+	}
+}
+
 u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
 {
 	return xe_mmio_read64_2x32(&hwe->gt->mmio, RING_TIMESTAMP(hwe->mmio_base));
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index da0a6922a26f..3aca7751a482 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -74,6 +74,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 
 const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
 u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
+u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class);
 enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
 
 void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 170ae72d1a7b..98b036678eee 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -26,14 +26,6 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
 
-static const u16 xe_to_user_engine_class[] = {
-	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
-	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
-	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
-	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
-	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
-};
-
 static const enum xe_engine_class user_to_xe_engine_class[] = {
 	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
 	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
@@ -206,7 +198,7 @@ static int query_engines(struct xe_device *xe,
 				continue;
 
 			engines->engines[i].instance.engine_class =
-				xe_to_user_engine_class[hwe->class];
+				xe_hw_engine_to_user_class(hwe->class);
 			engines->engines[i].instance.engine_instance =
 				hwe->logical_instance;
 			engines->engines[i].instance.gt_id = gt->info.id;
@@ -677,7 +669,7 @@ static int query_oa_units(struct xe_device *xe,
 				if (!xe_hw_engine_is_reserved(hwe) &&
 				    xe_oa_unit_id(hwe) == u->oa_unit_id) {
 					du->eci[j].engine_class =
-						xe_to_user_engine_class[hwe->class];
+						xe_hw_engine_to_user_class(hwe->class);
 					du->eci[j].engine_instance = hwe->logical_instance;
 					du->eci[j].gt_id = gt->info.id;
 					j++;
-- 
2.40.0

