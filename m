Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36928C7618B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 00:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E80210E6A8;
	Tue, 14 Mar 2023 00:30:54 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4F610E6B1
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 00:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678753847; x=1710289847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ErVfzVsJtYXwmoKle+52AgPrcpJp8SRrkyxs5tXsOD4=;
 b=VgOO50ExN0laFHFN06g1wGGD+sotsGcudk0jUUZ+XsEKy55xOyqZd7h4
 XF6pETC2iUygBtR9k4sbhf86c97XmjONbWBymAlI9vrfehB13LooCrnd+
 uatVxRXrO7/amqhbuKyZrunwxV68Ls8IpN9ODDBhAKfutTyoX/oC92M21
 IQndmp95leFd0tItv0F3fJTsvHQEXw80ES4wgAD1R6FWhwUEsBAsN+ab0
 PO94c/tafjhDCCHPARY7lTHPs6BNM1KBjaYr9deVY6sWSQF+NP0xvZJ8z
 aefQmwtPLPE1KIIzzRT4Pef4pFl5cZYsLv2CKkKLlKIb4hbRaRV4Hv3M7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="402168038"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="402168038"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789116720"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="789116720"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 17:30:12 -0700
Message-Id: <20230314003012.2600353-15-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230314003012.2600353-1-lucas.demarchi@intel.com>
References: <20230314003012.2600353-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 14/14] drm/xe: Move policy on preemption from
 WAs to tunings
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

Also, there's no reason to apply this policy only between graphics
version 1200 and 1250. Apply it to all versions, like i915.

v2: Apply for all graphics versions, not only [1200, 1250]

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c |  2 ++
 drivers/gpu/drm/xe/xe_tuning.c    | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tuning.h    |  1 +
 drivers/gpu/drm/xe/xe_wa.c        |  6 ------
 4 files changed, 26 insertions(+), 6 deletions(-)

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
index 7ff5eb762da5..c8045872c0a1 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -27,6 +27,16 @@ static const struct xe_rtp_entry gt_tunings[] = {
 	{}
 };
 
+static const struct xe_rtp_entry engine_tunings[] = {
+	{ XE_RTP_NAME("Policy: FtrPerCtxtPreemptionGranularityControl"),
+	  XE_RTP_RULES(ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(GEN7_FF_SLICE_CS_CHICKEN1,
+			     GEN9_FFSC_PERCTX_PREEMPT_CTRL,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{}
+};
+
 static const struct xe_rtp_entry lrc_tunings[] = {
 	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
@@ -63,6 +73,19 @@ void xe_tuning_process_gt(struct xe_gt *gt)
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
index 59d2daab5929..a607f476a6ed 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -272,12 +272,6 @@ static const struct xe_rtp_entry engine_was[] = {
 	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, ENABLE_SMALLPL,
 			     XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
-	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(GEN7_FF_SLICE_CS_CHICKEN1,
-			     GEN9_FFSC_PERCTX_PREEMPT_CTRL,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
-	},
 
 	/* TGL */
 
-- 
2.39.0

