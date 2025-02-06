Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB29C02196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 10:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669F910E801;
	Thu,  6 Feb 2025 10:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3zijVeY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A4310E801
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 10:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738837482; x=1770373482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T7Nvp/mtwtJ2kTI3zixxZzbT7rhW8rp322YibRHdmxA=;
 b=J3zijVeYo+BKZMIIejnIKsJaJIKPBfF3zZ1zTAXeXdpvR36r+nGFoTsw
 5kFBaWRVFothus7kTTbzLzJ/BNt+x8AgOgN0emQJ9o1mklRvsC9qSEdNm
 UbOdOynMkLnm9McVYe//8AH9nUbkWijJgMd8X2aKOXi7C7nsTGDyFamRW
 Dam21Omn9E7QWvpTo74PlzXVgWIC1Re23zOpeultpfRIyxVDQJcsis6g8
 DLmu2xs5/blg3EO/NYFjXFBcFwuJ64+wBt9pD/bJWdKy6p67tKCVLFpRE
 dDTmj60jQSLn9vlJqWUZy9xPASNOwufyV6+BwlYwzDTDKYfHKC8gJJpzV g==;
X-CSE-ConnectionGUID: ZccyFjBWSx2dMq44HNLJXg==
X-CSE-MsgGUID: BwNFFiWVS9KmlHWaMtB1tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64786940"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="64786940"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 02:24:42 -0800
X-CSE-ConnectionGUID: uvcy1BxtRb+IvooWu+19Vg==
X-CSE-MsgGUID: MS4Bm1dqQC6lKDzwS+CoWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="110997713"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 02:24:39 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 3/8] drm/xe/guc: Expose engine activity only for supported
 GuC version
Date: Thu,  6 Feb 2025 16:13:52 +0530
Message-ID: <20250206104358.3436519-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206104358.3436519-1-riana.tauro@intel.com>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
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

Engine activity is supported only on GuC submission version >= 1.14.1
Allow enabling/reading engine activity only on supported
GuC versions. Warn once if not supported.

v2: use guc interface version (John)
v3: do not use drm_WARN (Umesh)
v4: use variable for supported and use gt logs
    use a friendlier log message (Michal)

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 42 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  1 +
 .../gpu/drm/xe/xe_guc_engine_activity_types.h |  3 ++
 3 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 9c08af273397..5d67fe38639a 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -89,6 +89,22 @@ static int allocate_engine_activity_buffers(struct xe_guc *guc,
 	return 0;
 }
 
+static bool engine_activity_supported(struct xe_guc *guc)
+{
+	struct xe_uc_fw_version *version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
+	struct xe_gt *gt = guc_to_gt(guc);
+
+	/* engine activity stats is supported from GuC interface version (1.14.1) */
+	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 14, 1))
+		return true;
+
+	xe_gt_warn(gt,
+		   "engine activity stats unsupported in GuC interface v%u.%u.%u, v%u.%u.%u or newer required\n",
+		   version->major, version->minor, version->patch, 1, 14, 1);
+
+	return false;
+}
+
 static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
 {
 	struct xe_guc *guc = &hwe->gt->uc.guc;
@@ -250,6 +266,9 @@ u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
 {
 	struct xe_guc *guc =  &hwe->gt->uc.guc;
 
+	if (!xe_guc_engine_activity_supported(guc))
+		return 0;
+
 	return get_engine_active_ticks(guc, hwe);
 }
 
@@ -263,9 +282,27 @@ u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
 {
 	struct xe_guc *guc =  &hwe->gt->uc.guc;
 
+	if (!xe_guc_engine_activity_supported(guc))
+		return 0;
+
 	return get_engine_total_ticks(guc, hwe);
 }
 
+/**
+ * xe_guc_engine_activity_supported - Check support for engine activity stats
+ * @guc: The GuC object
+ *
+ * Engine activity stats is supported from GuC interface version (1.14.1)
+ *
+ * Return: true if engine activity stats supported, false otherwise
+ */
+bool xe_guc_engine_activity_supported(struct xe_guc *guc)
+{
+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
+
+	return engine_activity->supported;
+}
+
 /**
  * xe_guc_engine_activity_enable_stats - Enable engine activity stats
  * @guc: The GuC object
@@ -276,6 +313,9 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
 {
 	int ret;
 
+	if (!xe_guc_engine_activity_supported(guc))
+		return;
+
 	ret = enable_engine_activity_stats(guc);
 	if (ret)
 		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
@@ -302,6 +342,8 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
 	struct xe_gt *gt = guc_to_gt(guc);
 	int ret;
 
+	engine_activity->supported = engine_activity_supported(guc);
+
 	ret = allocate_engine_activity_group(guc);
 	if (ret) {
 		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
index c00f3da5513d..9d3ea3f67b6a 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
@@ -12,6 +12,7 @@ struct xe_hw_engine;
 struct xe_guc;
 
 int xe_guc_engine_activity_init(struct xe_guc *guc);
+bool xe_guc_engine_activity_supported(struct xe_guc *guc);
 void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
 u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
 u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
index a2ab327d3eec..81002c83d65e 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
@@ -79,6 +79,9 @@ struct xe_guc_engine_activity {
 	/** @num_activity_group: number of activity groups */
 	u32 num_activity_group;
 
+	/** @supported: checks if engine activity is supported */
+	bool supported;
+
 	/** @eag: holds the device level engine activity data */
 	struct engine_activity_group *eag;
 
-- 
2.47.1

