Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93DDE728F3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8514010E71C;
	Fri, 29 Sep 2023 20:45:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7E010E715
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696020324; x=1727556324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=60eVVIRglOfEb4O5Vsr41Y/y76LyuGaelFpHidm/OkQ=;
 b=AnwOtHgrp6osU+d8EN89A8R/uH0gO36zGfnC2NFq2H5clbcXKyknhI2S
 Rb8k0ytxVpXHfnOBLpRJRkxG2piugUFhCQaZ/wxgWhpVqmPpOPiSgwNo8
 50g+Ovl2sI/sYqA/RcOxdEaYWKF6yg7+AsnI10A2zRuyYChyRlrDuSrmj
 EGo0IfDvFLxA2TVHDl+wF7YTLX4wJ3Upar2bsVciMMwDXglwAUDSKN1Qp
 sbGNeavNHyL6dvvdZh+JNoI4DC5PVIaWM2R9vbKo/E7qRkJceziykoOEa
 PLWvTnBEmqxCL0IbIu1uV2x52R3rCpUqo4oQn6jO02Y4nQxutGRKvHrDU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="367427387"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="367427387"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:18:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="726691230"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="726691230"
Received: from anushasr-simics.jf.intel.com ([10.165.21.200])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:18:55 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 13:16:55 -0700
Message-Id: <20230929201659.2840724-2-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230929201659.2840724-1-anusha.srivatsa@intel.com>
References: <20230929201659.2840724-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/5] drm/xe/rplu: s/ADLP/ALDERLAKE_P
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

i915 now uses full names for platforms. So we now have
ALDERLAKE instead of ADL. Extend this to xe driver as well.
This will make it easier for macro magic usages.

v2: Do not make changes to compat-i915-headers/i915_drv.h
file with the rest of the changes (Jani)

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c            | 2 +-
 drivers/gpu/drm/xe/xe_platform_types.h | 2 +-
 drivers/gpu/drm/xe/xe_step.c           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 0da752b3c9cb..b2d6213b034b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -240,7 +240,7 @@ static const struct xe_device_desc adl_p_desc = {
 	.has_llc = true,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
-		{ XE_SUBPLATFORM_ADLP_RPLU, "RPLU", adlp_rplu_ids },
+		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
 		{},
 	},
 };
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index e378a64a0f86..b6fe4342f9f6 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -27,7 +27,7 @@ enum xe_platform {
 enum xe_subplatform {
 	XE_SUBPLATFORM_UNINITIALIZED = 0,
 	XE_SUBPLATFORM_NONE,
-	XE_SUBPLATFORM_ADLP_RPLU,
+	XE_SUBPLATFORM_ALDERLAKE_P_RPLU,
 	XE_SUBPLATFORM_DG2_G10,
 	XE_SUBPLATFORM_DG2_G11,
 	XE_SUBPLATFORM_DG2_G12,
diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index 371cac951e0f..903c65405d3a 100644
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

