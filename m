Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB98D41C01
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 04:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A303F10E682;
	Wed, 13 Nov 2024 04:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L1YUgVtO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D9D10E682
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 04:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731472857; x=1763008857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=biR3uq+8Gq+ODDAN59QJLi4JpXVA+iicnroxC9ZPuSA=;
 b=L1YUgVtOkZZkzO9qMkpCCIKAqhWRink62noZ5XfzUhQZGGNoSK0lev9+
 zp8LbKzpzYBWBWG1Ybp+2KmLtdjwYf5VE/E/Jih/DuFQIZy8FbKohdJoY
 JTOkuM/ha977oxoDVk3PfNisdklv2zwlIoZZfySzXaeU9gLVvmAK5R9Cs
 ImpelKqrn167d72R+P/yteuUWGXyvrCU8dA9yF/bBnNOjagFbwf4YhiP/
 7sUbJ/FOXZUosT9IT3HO+EmSRrAnzhBbK6n/4kUR+kVbyoCUh4aFr3haT
 xUwZOmLR2O0zAJ/JpIvTnJeRtgh7Or0anu+vc38NEndhyfT47sL9K16U8 A==;
X-CSE-ConnectionGUID: eKg41sHrQQu30wRssJgRcA==
X-CSE-MsgGUID: eTyK7KlCT92lfn77qDAtzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30742205"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="30742205"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 20:40:56 -0800
X-CSE-ConnectionGUID: eCp1pR9FRxuTj7v0SOnUVA==
X-CSE-MsgGUID: kQziEulIQbKhTg7QODQ0vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="87489518"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 20:40:53 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 john.c.harrison@intel.com, ashutosh.dixit@intel.com,
 soham.purkait@intel.com
Subject: [PATCH 6/7] drm/xe/guc: Expose engine busyness only for supported GuC
 version
Date: Wed, 13 Nov 2024 10:25:48 +0530
Message-Id: <20241113045549.2390980-7-riana.tauro@intel.com>
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

Engine busyness is supported only on GuC versions >= 70.32.0
Allow enabling/reading engine busyness only on supported
GuC versions. Warn once if not supported.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_engine_activity.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_engine_activity.c b/drivers/gpu/drm/xe/xe_engine_activity.c
index 7a2ae09d23de..fc34dcf3057a 100644
--- a/drivers/gpu/drm/xe/xe_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_engine_activity.c
@@ -236,6 +236,16 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
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
@@ -246,6 +256,9 @@ u64 xe_engine_activity_get_active_ticks(struct xe_hw_engine *hwe)
 {
 	struct xe_guc *guc =  &hwe->gt->uc.guc;
 
+	if (!guc_engine_activity_supported(guc))
+		return 0;
+
 	return get_engine_active_ticks(guc, hwe);
 }
 
@@ -259,6 +272,9 @@ u64 xe_engine_activity_get_total_ticks(struct xe_hw_engine *hwe)
 {
 	struct xe_guc *guc =  &hwe->gt->uc.guc;
 
+	if (!guc_engine_activity_supported(guc))
+		return 0;
+
 	return get_engine_total_ticks(guc, hwe);
 }
 
@@ -272,6 +288,9 @@ void xe_engine_activity_enable_stats(struct xe_guc *guc)
 {
 	int ret;
 
+	if (!guc_engine_activity_supported(guc))
+		return;
+
 	ret = enable_engine_activity_stats(guc);
 	if (ret)
 		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
@@ -298,6 +317,9 @@ int xe_engine_activity_init(struct xe_guc *guc)
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

