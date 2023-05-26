Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025CCC77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 21:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD93710E805;
	Fri, 26 May 2023 21:16:04 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB6610E1F7
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 21:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685135756; x=1716671756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F3U7LpTl4sawFhb1H9PZ7SrugIMRKvXyHZwP9PIMVts=;
 b=YVKAlxB2XeXujfwDpLfbDPRsvIIKu8VKuYHzJB5gaqP88iCqAYyYuQrk
 fDa453fVEZ8dmNKVk3ib1Yezmo8ch8uT/eKGVRWBdI8TixJdt+dSSdwVL
 oJ+sCKtGOPWUJF9ScEELYSg6Be9iau9V3V3ZuJ+PPDCMk9Qi2eLaiJ7Jm
 WWU5gWjVFKZH7TUpxCTd9VKvXqnxDbB+XAHnjg/S0sITMsIsnBWkWvavF
 AGvIuLmeqJj8tFFXXe/n4UOdZqNuJ8/N5jaE3oyTCBVhfAzdKmcFl9ssJ
 K0vBFJgA+esdEI7eLcOvn8jPSwZ3vK+15GO3e2Sm3WVZcY4/pspM+NNac g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382555226"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="382555226"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 14:15:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="1035495047"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="1035495047"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 14:15:56 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 14:17:27 -0700
Message-Id: <20230526211730.2774851-3-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526211730.2774851-1-anusha.srivatsa@intel.com>
References: <20230526211730.2774851-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/5] drm/i915/adlp: s/ADLP/ALDERLAKE_P
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

Refer to platform with the same consistent name.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 2 +-
 drivers/gpu/drm/i915/i915_drv.h            | 2 +-
 drivers/gpu/drm/i915/intel_step.c          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index f6223d8f13b8..bb0d8cd7034e 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -3409,7 +3409,7 @@ void intel_init_cdclk_hooks(struct drm_i915_private *dev_priv)
 		/* Wa_22011320316:adl-p[a0] */
 		if (IS_ADLP_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0))
 			dev_priv->display.cdclk.table = adlp_a_step_cdclk_table;
-		else if (IS_ADLP_RPLU(dev_priv))
+		else if (IS_ALDERLAKE_P_RPLU(dev_priv))
 			dev_priv->display.cdclk.table = rplu_cdclk_table;
 		else
 			dev_priv->display.cdclk.table = adlp_cdclk_table;
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 14c5338c96a6..e870dd412a75 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -578,7 +578,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_S, INTEL_SUBPLATFORM_RPL)
 #define IS_ADLP_N(i915) \
 	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_P, INTEL_SUBPLATFORM_N)
-#define IS_ADLP_RPLP(i915) \
+#define IS_ALDERLAKE_P_RPLU(i915) \
 	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_P, INTEL_SUBPLATFORM_RPL)
 #define IS_ADLP_RPLU(i915) \
 	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_P, INTEL_SUBPLATFORM_RPLU)
diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
index 84a6fe736a3b..6a8816fbc15a 100644
--- a/drivers/gpu/drm/i915/intel_step.c
+++ b/drivers/gpu/drm/i915/intel_step.c
@@ -191,7 +191,7 @@ void intel_step_init(struct drm_i915_private *i915)
 	} else if (IS_ADLP_N(i915)) {
 		revids = adlp_n_revids;
 		size = ARRAY_SIZE(adlp_n_revids);
-	} else if (IS_ADLP_RPLP(i915)) {
+	} else if (IS_ALDERLAKE_P_RPLU(i915)) {
 		revids = adlp_rplp_revids;
 		size = ARRAY_SIZE(adlp_rplp_revids);
 	} else if (IS_ALDERLAKE_P(i915)) {
-- 
2.25.1

