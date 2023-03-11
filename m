Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CFBC61DA4
	for <intel-xe@archiver.kernel.org>; Sat, 11 Mar 2023 17:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3892310E269;
	Sat, 11 Mar 2023 17:16:05 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04DF10E269
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Mar 2023 17:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678554963; x=1710090963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WgF8L7nEUIkgOUB1HKXXCxf9yT/Sq+84EvZF36J+vQ8=;
 b=mmjS7lUO27EN7JMWCYVcaD7sxo1JSdq/G9WDvJEfGs5oXqn3a9ExSgxM
 BBv/DI6voqRNEk7b/V/UCL7+JyAVtIdsZSCxEnJlBmaC3n055kWjZKeWu
 2ukzNhzUtkB5Xb7AU2OfqMHwCQG6HX3oECxQuxpjhTncpEd+yy7X4FAPq
 FJ8GKhnFtW75+1qwal8Sc3YDoJ9x6rGDexWt6Ua49XRRAp5YpvGyPKaai
 mE9eahVF3q7j2tmLTOvUCUlpgmqKCa79U71kuN1yz8+ANn3GUi7XDUlPx
 mIoco5cqPcTtAVGQr/uUVnrcsrninnvkhkR/aDZTfntqYHfzqOV7gAqR6 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="423188239"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; d="scan'208";a="423188239"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2023 09:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="671418948"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; d="scan'208";a="671418948"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2023 09:16:01 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat, 11 Mar 2023 09:15:51 -0800
Message-Id: <20230311171551.2394555-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230311001049.GY1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230311001049.GY1175070@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Move policy on preemption from WAs to
 tunings
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The fake WA FtrPerCtxtPreemptionGranularityControl is documented in i915
and is not a true WA: it's a policy chosen to allow preemption settings
to be controlled on a per-context basis by userspace. Move it to
xe_tuning.c since it's more in line with what his is doing. However
since it's not something suggested by the spec, prefix it with "Policy"
rather than "Tuning".

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c |  2 ++
 drivers/gpu/drm/xe/xe_tuning.c    | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tuning.h    |  1 +
 drivers/gpu/drm/xe/xe_wa.c        |  6 ------
 4 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 63a4efd5edcc..53dc342cc3a3 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -22,6 +22,7 @@
 #include "xe_mmio.h"
 #include "xe_reg_sr.h"
 #include "xe_sched_job.h"
+#include "xe_tuning.h"
 #include "xe_wa.h"
 
 #define MAX_MMIO_BASES 3
@@ -293,6 +294,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 
 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
 	xe_wa_process_engine(hwe);
+	xe_tuning_process_engine(hwe);
 
 	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
 	xe_reg_whitelist_process_engine(hwe);
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 2861a014c85c..5d3febd0b97e 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -23,6 +23,15 @@ static const struct xe_rtp_entry gt_tunings[] = {
 	{}
 };
 
+static const struct xe_rtp_entry engine_tunings[] = {
+	{ XE_RTP_NAME("Policy: FtrPerCtxtPreemptionGranularityControl"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(GEN7_FF_SLICE_CS_CHICKEN1,
+			     GEN9_FFSC_PERCTX_PREEMPT_CTRL,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+};
+
 static const struct xe_rtp_entry lrc_tunings[] = {
 	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
@@ -39,6 +48,19 @@ void xe_tuning_process_gt(struct xe_gt *gt)
 	xe_rtp_process(gt_tunings, &gt->reg_sr, gt, NULL);
 }
 
+/**
+ * xe_tuning_process_engine - process engine tuning table
+ * @hwe: engine instance to process tunings for
+ *
+ * Process engine table for this platform, saving in @hwe all the
+ * tunings that need to be applied at the engine level that match this
+ * engine.
+ */
+void xe_tuning_process_engine(struct xe_hw_engine *hwe)
+{
+	xe_rtp_process(engine_tunings, &hwe->reg_sr, hwe->gt, hwe);
+}
+
 /**
  * xe_tuning_process_lrc - process lrc tunings
  * @hwe: engine instance to process tunings for
diff --git a/drivers/gpu/drm/xe/xe_tuning.h b/drivers/gpu/drm/xe/xe_tuning.h
index 2b95b0c8effc..4f9c3ac3b516 100644
--- a/drivers/gpu/drm/xe/xe_tuning.h
+++ b/drivers/gpu/drm/xe/xe_tuning.h
@@ -10,6 +10,7 @@ struct xe_gt;
 struct xe_hw_engine;
 
 void xe_tuning_process_gt(struct xe_gt *gt);
+void xe_tuning_process_engine(struct xe_hw_engine *hwe);
 void xe_tuning_process_lrc(struct xe_hw_engine *hwe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 67539f9d70b4..76c603dfc030 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -236,12 +236,6 @@ static const struct xe_rtp_entry engine_was[] = {
 	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, ENABLE_SMALLPL,
 			     XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
-	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(GEN7_FF_SLICE_CS_CHICKEN1,
-			     GEN9_FFSC_PERCTX_PREEMPT_CTRL,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
-	},
 	{}
 };
 
-- 
2.39.0

