Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03417D75BBF
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 06:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB75310E189;
	Thu, 21 Nov 2024 06:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BWHjKhhk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F8610E872
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 06:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732170232; x=1763706232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QmBPzpP/IUv8LGNSntIEVTEysqgUgOwotHFDv1jOAmc=;
 b=BWHjKhhkM7zKEjkxIbfBEtteazs+svDpua9dTJ6A2T6Io2tk8VAPdOqX
 yZoKaxCxWYCPaTsGqYzc9w4y4U5/HZCrDkkIFmwzUlUX+n0V3BdTJtVLv
 mBYbTXf6uCNWKEwstXPBTZRG8fd5J5HKxSiHlDNtSZyMfTFzYD7o52+ru
 r1hy1bLv5tPznxogWKnX87/gV7QCvEZQeBBih580Fc9KXEXpg45W6Z4EY
 OeAj5dXBiozRmGPHJSDGjd0oS+XxsSK6KrsLNjnuKWJp2Obk2FEtfWmJT
 12e5h1o3EnXtQ5qzCyItix7G/ICo2nQbe5FscwvqbTJ0QJ2w9K46ItrIM g==;
X-CSE-ConnectionGUID: gy7WAzYuSriB3fb5jOH4ug==
X-CSE-MsgGUID: bkrsmJWMTaaCV90yxf85Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="36173558"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="36173558"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 22:23:52 -0800
X-CSE-ConnectionGUID: E1Ta4Lw+QFS/LKb1RxPfPw==
X-CSE-MsgGUID: 6lie/lRIQoq3OkxwHr4Nvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="94219804"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 22:23:49 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 john.c.harrison@intel.com, ashutosh.dixit@intel.com,
 soham.purkait@intel.com
Subject: [PATCH v2 4/8] drm/xe: add function to convert xe hw engine class to
 user class
Date: Thu, 21 Nov 2024 12:09:00 +0530
Message-Id: <20241121063904.3033754-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241121063904.3033754-1-riana.tauro@intel.com>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
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

Avoid duplication of code in PMU by moving hw engine to user class
to a separate function. Refactor existing code to use
this new function.

v2: replace with array (Umesh)
    fix commit message (Rodrigo)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
 drivers/gpu/drm/xe/xe_query.c     | 12 ++----------
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c4b0dc3be39c..c41b4038dbb3 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -979,6 +979,27 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
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
+	const u16 xe_to_user_engine_class[] = {
+		[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
+		[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
+		[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
+		[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
+		[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
+	};
+
+	WARN_ON(engine_class >= ARRAY_SIZE(xe_to_user_engine_class));
+
+	return xe_to_user_engine_class[engine_class];
+}
+
 u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
 {
 	return xe_mmio_read64_2x32(&hwe->gt->mmio, RING_TIMESTAMP(hwe->mmio_base));
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 6b5f9fa2a594..06b39cb1a434 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -74,6 +74,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 
 const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
 u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
+u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class);
 enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
 
 void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 3eda616f1502..a260c43f13f4 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -27,14 +27,6 @@
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
@@ -207,7 +199,7 @@ static int query_engines(struct xe_device *xe,
 				continue;
 
 			engines->engines[i].instance.engine_class =
-				xe_to_user_engine_class[hwe->class];
+				xe_hw_engine_to_user_class(hwe->class);
 			engines->engines[i].instance.engine_instance =
 				hwe->logical_instance;
 			engines->engines[i].instance.gt_id = gt->info.id;
@@ -678,7 +670,7 @@ static int query_oa_units(struct xe_device *xe,
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

