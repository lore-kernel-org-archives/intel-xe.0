Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EEBD75BBB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 06:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8CF10E191;
	Thu, 21 Nov 2024 06:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0/HAfnK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B6910E3D9
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 06:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732170242; x=1763706242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R9YrCX99rTiJC275Ad6WSYCw/3xncYhayi2S0LAiYys=;
 b=I0/HAfnKtxaTx0ryT18O0TwlucjIYx5jUAHGD9/betek2+n3xw/2Qb54
 1hYhJYZvQZ3FxNYL2/yhq4LHGSTivSp6yHCJ66yhY/3+o8CF+WfUn5sRb
 2MBKe4HXDw9UsUDmHXappYQy7HyyUKE3ht1dnAMRH2Yh+1N7MA2ltrOfT
 cxGy2jhKptqN9MmxWvkCVn2gqXSRCMGt2ZzQJ4H+HwACmUW71qtds0ZMA
 fKrODRIra94B7cHj9U0F5a7AVl16IJPE1lWxbluzKfsw/gVCHlLXx19Lf
 3zwuC45BoB2ADcLpxndMIedxSDWkvy+1rofhJm37tcqtC+AMGinC3xG/d Q==;
X-CSE-ConnectionGUID: RSEJEYwPS2Cv0CRrQQ5bdw==
X-CSE-MsgGUID: aRTUwheUQ/2e41NkZyFUgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="36173600"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="36173600"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 22:24:01 -0800
X-CSE-ConnectionGUID: vjMrnwXASsCEp1WCU8RJfw==
X-CSE-MsgGUID: CWv4AYb4THGQ1ADjZMGvAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="94219832"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 22:23:59 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 john.c.harrison@intel.com, ashutosh.dixit@intel.com,
 soham.purkait@intel.com
Subject: [PATCH v2 7/8] drm/xe/guc: Expose engine busyness only for supported
 GuC version
Date: Thu, 21 Nov 2024 12:09:03 +0530
Message-Id: <20241121063904.3033754-8-riana.tauro@intel.com>
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

Engine busyness is supported only on GuC versions >= 70.32.0
Allow enabling/reading engine busyness only on supported
GuC versions. Warn once if not supported.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_engine_activity.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_engine_activity.c b/drivers/gpu/drm/xe/xe_engine_activity.c
index cbafd42f7f2f..9d569fea8fda 100644
--- a/drivers/gpu/drm/xe/xe_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_engine_activity.c
@@ -245,6 +245,16 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
 	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
 }
 
+static bool guc_engine_activity_supported(struct xe_guc *guc)
+{
+	if (GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 32, 0))
+		return true;
+
+	drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
+			 "Engine busyness not supported in this GuC version\n");
+	return false;
+}
+
 /**
  * xe_engine_activity_get_active_ticks - Get engine active ticks
  * @hwe: The hw_engine object
@@ -255,6 +265,9 @@ u64 xe_engine_activity_get_active_ticks(struct xe_hw_engine *hwe)
 {
 	struct xe_guc *guc =  &hwe->gt->uc.guc;
 
+	if (!guc_engine_activity_supported(guc))
+		return 0;
+
 	return get_engine_active_ticks(guc, hwe);
 }
 
@@ -268,6 +281,9 @@ u64 xe_engine_activity_get_total_ticks(struct xe_hw_engine *hwe)
 {
 	struct xe_guc *guc =  &hwe->gt->uc.guc;
 
+	if (!guc_engine_activity_supported(guc))
+		return 0;
+
 	return get_engine_total_ticks(guc, hwe);
 }
 
@@ -281,6 +297,9 @@ void xe_engine_activity_enable_stats(struct xe_guc *guc)
 {
 	int ret;
 
+	if (!guc_engine_activity_supported(guc))
+		return;
+
 	ret = enable_engine_activity_stats(guc);
 	if (ret)
 		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
@@ -307,6 +326,9 @@ int xe_engine_activity_init(struct xe_guc *guc)
 	struct xe_gt *gt = guc_to_gt(guc);
 	int ret;
 
+	if (!guc_engine_activity_supported(guc))
+		return 0;
+
 	ret = allocate_activity_group(engine_busy);
 	if (ret) {
 		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
-- 
2.40.0

