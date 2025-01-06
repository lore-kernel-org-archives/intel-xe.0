Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7DEE77198
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 07:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA00510E5A8;
	Mon,  6 Jan 2025 07:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8vcm4+W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56AD10E5A9
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 07:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736149006; x=1767685006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nZzAWkfaD/dRtm4OoNuxcAd8MyFmF0/v0dNp2tNfjG4=;
 b=Q8vcm4+WDgl3TR8QvFbH9rxAZv2VPabBZTp3XQtE5CN2fq4eoREI4UKR
 6zVLsSPbCVOTxACZFrSndukoBxMIpXG39KWdKPxEJyJOoJmtz0knL8uuO
 Fq+eamNlFeZRfUQy56DpuvlczSoPYGKAjzhcfE9B7hwEQjwxAl+axS4jk
 PyZtrGKXMRJsKjMlWPBswQ5ucVR1jMlNp/vFMK5VncDCay6rokmQSlp+X
 up5ew1DURT9PThoBNCPJXTfADa4jEOqdAtzICqA52qwS86ALGM/q4RIBt
 v5bhN2D9Yw/5K71gToGCGPlsIqvuHlhF2njxBx4NjKPh3EJz6/5iofOIV Q==;
X-CSE-ConnectionGUID: eDvgoUKDSTCFbzPNNBGuXA==
X-CSE-MsgGUID: d7yq8MjTR8iH/hjONV2/WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="46873082"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="46873082"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 23:36:46 -0800
X-CSE-ConnectionGUID: 0sbqTCh1SHq9F9B9h6C9VA==
X-CSE-MsgGUID: inhT1SE0RGyl8QbBy1BA5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="125650769"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 23:36:42 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, ashutosh.dixit@intel.com,
 john.c.harrison@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 08/10] drm/xe/guc: Expose engine activity only for
 supported GuC version
Date: Mon,  6 Jan 2025 13:25:57 +0530
Message-ID: <20250106075600.852080-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106075600.852080-1-riana.tauro@intel.com>
References: <20250106075600.852080-1-riana.tauro@intel.com>
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

v2: use guc submission version (John)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_engine_activity.c | 31 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_engine_activity.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 14950b42d1b1..5aea42f0cded 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -255,6 +255,9 @@ u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
 {
 	struct xe_guc *guc =  &hwe->gt->uc.guc;
 
+	if (!xe_guc_engine_activity_supported(guc))
+		return 0;
+
 	return get_engine_active_ticks(guc, hwe);
 }
 
@@ -268,9 +271,31 @@ u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
 {
 	struct xe_guc *guc =  &hwe->gt->uc.guc;
 
+	if (!xe_guc_engine_activity_supported(guc))
+		return 0;
+
 	return get_engine_total_ticks(guc, hwe);
 }
 
+/**
+ * xe_guc_engine_activity_enable_stats - Enable engine activity stats
+ * @guc: The GuC object
+ *
+ * Engine activity stats is supported from GuC submission version
+ * (1.14.1)
+ *
+ * Return: true if engine activity stats supported, false otherwise
+ */
+bool xe_guc_engine_activity_supported(struct xe_guc *guc)
+{
+	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 14, 1))
+		return true;
+
+	drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
+			 "Engine busyness not supported in this GuC version\n");
+	return false;
+}
+
 /**
  * xe_guc_engine_activity_enable_stats - Enable engine activity stats
  * @guc: The GuC object
@@ -281,6 +306,9 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
 {
 	int ret;
 
+	if (!xe_guc_engine_activity_supported(guc))
+		return;
+
 	ret = enable_engine_activity_stats(guc);
 	if (ret)
 		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
@@ -307,6 +335,9 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
 	struct xe_gt *gt = guc_to_gt(guc);
 	int ret;
 
+	if (!xe_guc_engine_activity_supported(guc))
+		return 0;
+
 	ret = allocate_engine_activity_group(guc);
 	if (ret) {
 		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
index 6cd435b81bbe..e2c2f1bb2b59 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
@@ -12,6 +12,7 @@ struct xe_hw_engine;
 struct xe_guc;
 
 int xe_guc_engine_activity_init(struct xe_guc *guc);
+bool xe_guc_engine_activity_supported(struct xe_guc *guc);
 void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
 u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
 u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
-- 
2.47.1

