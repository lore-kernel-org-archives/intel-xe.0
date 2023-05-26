Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F31C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 21:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1B410E1F7;
	Fri, 26 May 2023 21:15:57 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65BF10E1F7
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 21:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685135755; x=1716671755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=efIQgSJ7wAkuvit6CytdugU4ZCrLJHnHM1G4ul994Y4=;
 b=I7b4WQABsScKN+zWxj0xRaHrP+8MxnSHDP2lopKrA8zBIHL4yf67yehO
 3KOI8QI9GyfiTNB28kTPvVp7/dFKIN0Kx3Hg/dk3qOWOJtly599Q05bBq
 Diy6TuUa/Ibd7GwpIa3as6lDqKRPKk63MP3jkQlluvlRxRbob8mn1RwUT
 gMPk3AKVGu1Aha+6rx+mOMF1Wvr8pa+a16t3ly2vZwI3BuMRBJHvjdrWL
 tzbXhzyzMuPqBji7bh81h/XZD5rhhRwoPEpbKuAIq9vWIJLjXGKMlgwUL
 J0mh96tVBZl1B5hkewvgcU3CFF9N7tUTyPykdAUK/87/H2dWXnWLy2ZFf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382555223"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="382555223"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 14:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="1035495044"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="1035495044"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 14:15:55 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 14:17:26 -0700
Message-Id: <20230526211730.2774851-2-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526211730.2774851-1-anusha.srivatsa@intel.com>
References: <20230526211730.2774851-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/5] drm/xe/adlp: s/ADLP/ALDERLAKE_P
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Inconsistent usage of platform names across the driver.
Changing to use the name convention throughout - ALDERLAKE_P.
This will make it easier for macro magic usages.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 2 +-
 drivers/gpu/drm/xe/xe_pci.c                       | 2 +-
 drivers/gpu/drm/xe/xe_platform_types.h            | 2 +-
 drivers/gpu/drm/xe/xe_step.c                      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 74e6f063f741..9d212fbbce26 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -160,7 +160,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define IS_DG2_G10(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G10)
 #define IS_DG2_G11(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G11)
 #define IS_DG2_G12(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G12)
-#define IS_ADLP_RPLU(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU)
+#define IS_ALDERLAKE_P_RPLU(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ALDERLAKE_P_RPLU)
 #define IS_ICL_WITH_PORT_F(xe) (xe && 0)
 #define HAS_LSPCON(xe) (xe && 0)
 #define HAS_MSO(xe) (xe || 1)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d8f1213ae1d6..33027091cc30 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -213,7 +213,7 @@ static const struct xe_device_desc adl_p_desc = {
 	.has_llc = true,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
-		{ XE_SUBPLATFORM_ADLP_RPLU, "RPLU", adlp_rplu_ids },
+		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
 		{},
 	},
 };
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index abbb8a1f29a8..cb50e9b77816 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -26,7 +26,7 @@ enum xe_platform {
 enum xe_subplatform {
 	XE_SUBPLATFORM_UNINITIALIZED = 0,
 	XE_SUBPLATFORM_NONE,
-	XE_SUBPLATFORM_ADLP_RPLU,
+	XE_SUBPLATFORM_ALDERLAKE_P_RPLU,
 	XE_SUBPLATFORM_DG2_G10,
 	XE_SUBPLATFORM_DG2_G11,
 	XE_SUBPLATFORM_DG2_G12,
diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index 1baf79ba02ad..cb0811c8bf22 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -143,7 +143,7 @@ struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe)
 	} else if (xe->info.platform == XE_ALDERLAKE_N) {
 		revids = adln_revids;
 		size = ARRAY_SIZE(adln_revids);
-	} else if (xe->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU) {
+	} else if (xe->info.subplatform == XE_SUBPLATFORM_ALDERLAKE_P_RPLU) {
 		revids = adlp_rpl_revids;
 		size = ARRAY_SIZE(adlp_rpl_revids);
 	} else if (xe->info.platform == XE_ALDERLAKE_P) {
-- 
2.25.1

