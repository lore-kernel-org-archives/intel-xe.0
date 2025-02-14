Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3658DC021A4
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 09:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDAD10EC2B;
	Fri, 14 Feb 2025 09:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exaMCw5m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF06C10EC33
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 09:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739526471; x=1771062471;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c3HchMb3skm3msKiSjtsukzNVaYvHy4IF0huP30q/zE=;
 b=exaMCw5ms35v2H+QUiduBAARiFrpUbxgDhGEk9Jx4NNBsyyw4qTOSkIb
 spTMvQUYvD9q157mijAZ3hiEPRW/VlNWXHwIkUJBEzYuve/NB49/TfeCy
 xEWn8qdT/vaL1uWZuea/3khxcQMUr2iLJLmE3Z8zbQQImATC7x0X60DZd
 XAi5U0u3EV0BjuGulnn/8uVJE9I3SHPbIUzEHHtrdlmrZfjZ9y/WQiIxT
 hpTBOO+38sUhnqctmUlK/ERwglA1xjP0w7ewOWVns3JgL/21UxpaPqNDb
 oC5CJ8iwMBUAmRPd7djC8c6oLWgvdEsSudnfPjFLc3T/IQl+YmXUSK7Ub w==;
X-CSE-ConnectionGUID: CT0Qy1DMS5qf+xgnbNyMlg==
X-CSE-MsgGUID: hpMk8OXHRPWqs1xNTQlbYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="39498819"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="39498819"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:47:51 -0800
X-CSE-ConnectionGUID: UbMzph1tR0+0WXEFHdpRhQ==
X-CSE-MsgGUID: H0QJrslxSMWAmRIy2ezZSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117542512"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:47:48 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v7 3/5] drm/xe/guc: Expose engine activity only for supported
 GuC version
Date: Fri, 14 Feb 2025 15:38:11 +0530
Message-ID: <20250214100819.798544-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250214100819.798544-1-riana.tauro@intel.com>
References: <20250214100819.798544-1-riana.tauro@intel.com>
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
v3: use debug log (Umesh)
v4: use variable for supported and use gt logs
    use a friendlier log message (Michal)
v5: fix kernel-doc
    do not continue in init if not supported (Michal)
v6: remove hardcoding values (Michal)

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 51 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  1 +
 .../gpu/drm/xe/xe_guc_engine_activity_types.h |  3 ++
 3 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index a424527eddb6..2a457dcf31d5 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -95,6 +95,29 @@ static void free_engine_activity_buffers(struct engine_activity_buffer *buffer)
 	xe_bo_unpin_map_no_vm(buffer->activity_bo);
 }
 
+static bool is_engine_activity_supported(struct xe_guc *guc)
+{
+	struct xe_uc_fw_version *version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
+	struct xe_uc_fw_version required = { 1, 14, 1 };
+	struct xe_gt *gt = guc_to_gt(guc);
+
+	if (IS_SRIOV_VF(gt_to_xe(gt))) {
+		xe_gt_info(gt, "engine activity stats not supported on VFs\n");
+		return false;
+	}
+
+	/* engine activity stats is supported from GuC interface version (1.14.1) */
+	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER_STRUCT(required)) {
+		xe_gt_info(gt,
+			   "engine activity stats unsupported in GuC interface v%u.%u.%u, need v%u.%u.%u or higher\n",
+			   version->major, version->minor, version->patch, required.major,
+			   required.minor, required.patch);
+		return false;
+	}
+
+	return true;
+}
+
 static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
 {
 	struct xe_guc *guc = &hwe->gt->uc.guc;
@@ -251,6 +274,9 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
  */
 u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 {
+	if (!xe_guc_engine_activity_supported(guc))
+		return 0;
+
 	return get_engine_active_ticks(guc, hwe);
 }
 
@@ -263,9 +289,27 @@ u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine
  */
 u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 {
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
@@ -276,6 +320,9 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
 {
 	int ret;
 
+	if (!xe_guc_engine_activity_supported(guc))
+		return;
+
 	ret = enable_engine_activity_stats(guc);
 	if (ret)
 		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
@@ -301,10 +348,10 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
 {
 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
 	struct xe_gt *gt = guc_to_gt(guc);
-	struct xe_device *xe = gt_to_xe(gt);
 	int ret;
 
-	if (IS_SRIOV_VF(xe))
+	engine_activity->supported = is_engine_activity_supported(guc);
+	if (!engine_activity->supported)
 		return 0;
 
 	ret = allocate_engine_activity_group(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
index e92d2456698d..a042d4cb404c 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
@@ -12,6 +12,7 @@ struct xe_hw_engine;
 struct xe_guc;
 
 int xe_guc_engine_activity_init(struct xe_guc *guc);
+bool xe_guc_engine_activity_supported(struct xe_guc *guc);
 void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
 u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
 u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
index a2ab327d3eec..5cdd034b6b70 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
@@ -79,6 +79,9 @@ struct xe_guc_engine_activity {
 	/** @num_activity_group: number of activity groups */
 	u32 num_activity_group;
 
+	/** @supported: indicates support for engine activity stats */
+	bool supported;
+
 	/** @eag: holds the device level engine activity data */
 	struct engine_activity_group *eag;
 
-- 
2.47.1

