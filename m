Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486A3C02193
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 09:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1807E10E77A;
	Wed, 29 Jan 2025 09:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0oHXdkC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C94310E77A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 09:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738144615; x=1769680615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I8qWRfP549LZHhBg48rSxZkDqQVt3WBXcyOYvHIQAuY=;
 b=f0oHXdkC6ZpSpu1A2acf834Bn7SLBHKwHNwbRB/7fHAsQVMkuMJEnLEa
 SM7+gaRBIzP5MQqpFm18Tbaj2mai0xJMwcbz3xNYgmPdXFcZhSuo9uC+J
 1keNGf7WGgOJ1s0pfK+/NjcXu7GeiyrUJ8B1owZAIICvd+gToRyoU74hR
 +amePNauMyYR5mM8UFUDlacHgvPEWt1l5j2FjgsuXI0asxWgOVwXPHLAB
 M85UzhD1KQIX/7FhqW77ce32ARI/XzUyQeD5yxQHdsCQkAHB8+8+EzUZV
 c8vyK0JylZI1HMIziDCGZm2oiLVsG7E8GMtjifmtN7vk18wd4WNmEcGMJ A==;
X-CSE-ConnectionGUID: MN/OLr4mSw6c7POsNpcFzg==
X-CSE-MsgGUID: Gy6vK33LRgOgq5THxz026g==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42579495"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="42579495"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 01:56:35 -0800
X-CSE-ConnectionGUID: 58bd7D7/Qsa+smp7Y8H62Q==
X-CSE-MsgGUID: Mr82Z/H8QUKm2i/dJKqp/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="108958131"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 01:56:32 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH v4 3/8] drm/xe/guc: Expose engine activity only for supported
 GuC version
Date: Wed, 29 Jan 2025 15:46:46 +0530
Message-ID: <20250129101653.1976699-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250129101653.1976699-1-riana.tauro@intel.com>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
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
v3: use drm_warn_once to avoid stacktrace (Umesh)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_engine_activity.c | 32 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_engine_activity.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 9c08af273397..4d720afd12ac 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -250,6 +250,9 @@ u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
 {
 	struct xe_guc *guc =  &hwe->gt->uc.guc;
 
+	if (!xe_guc_engine_activity_supported(guc))
+		return 0;
+
 	return get_engine_active_ticks(guc, hwe);
 }
 
@@ -263,9 +266,32 @@ u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
 {
 	struct xe_guc *guc =  &hwe->gt->uc.guc;
 
+	if (!xe_guc_engine_activity_supported(guc))
+		return 0;
+
 	return get_engine_total_ticks(guc, hwe);
 }
 
+/**
+ * xe_guc_engine_activity_supported - Check support for Engine activity stats
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
+	drm_warn_once(&guc_to_xe(guc)->drm,
+		      "per-engine-class activity not supported for this GuC version\n");
+
+	return false;
+}
+
 /**
  * xe_guc_engine_activity_enable_stats - Enable engine activity stats
  * @guc: The GuC object
@@ -276,6 +302,9 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
 {
 	int ret;
 
+	if (!xe_guc_engine_activity_supported(guc))
+		return;
+
 	ret = enable_engine_activity_stats(guc);
 	if (ret)
 		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
@@ -302,6 +331,9 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
 	struct xe_gt *gt = guc_to_gt(guc);
 	int ret;
 
+	if (!xe_guc_engine_activity_supported(guc))
+		return 0;
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
-- 
2.47.1

