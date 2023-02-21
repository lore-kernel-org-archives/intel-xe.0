Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47C0C636D7
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 23:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E8310E38E;
	Tue, 21 Feb 2023 23:34:07 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555FB10E39A
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 23:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677022446; x=1708558446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7taHEoAq2VjqwNFFnDWNuD13Lb3uhwc0tM8lX2AZL9k=;
 b=AetgPQH3Cxcp6SR4YhIotIWqq9CZVWsii39c8eeL1mHipsO4MgJEEjD9
 Kq83/qNESYzqEVmWeVNv4hpa8WA/GewbCs3b+KubY3iT/YNyzU2fZF/E2
 tBKhzCvW47qYyx4bJkVkkZk/apFtcFHFx4fyuWWMX615LXCbnQDf3nKpR
 Af1fp1ajM95SJAvOQNJKrDfzVrRulVbvYJgthfhjsK4hsF5SeKf0wFs8w
 IffM0x8VLWwmKx4HSq+vqzvjWTkCN2GcCOOipNo6Z8kI+rns4LlSQD1qz
 lSwkfRV5kmTDfBs+Gq/YykfYr4STrBBctmAywn3ZUmSuymBrn6ZzhJM9P Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="313156247"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="313156247"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 15:34:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="621691836"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="621691836"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 15:34:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 15:33:44 -0800
Message-Id: <20230221233348.883897-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230221233348.883897-1-lucas.demarchi@intel.com>
References: <20230221233348.883897-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/6] drm/xe: Fix application of LRC tunings
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

LRC tunings were added after the gt ones and didn't add the call
in xe_gt_record_default_lrcs() to process them like is done for
workarounds. Add such a function and call it from
xe_gt_record_default_lrcs().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     |  1 +
 drivers/gpu/drm/xe/xe_tuning.c | 15 ++++++++++++++-
 drivers/gpu/drm/xe/xe_tuning.h |  2 ++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 809e9b14c314..5a3c8fd5936a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -320,6 +320,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 
 		xe_reg_sr_init(&hwe->reg_lrc, "LRC", xe);
 		xe_wa_process_lrc(hwe);
+		xe_tuning_process_lrc(hwe);
 
 		default_lrc = drmm_kzalloc(&xe->drm,
 					   xe_lrc_size(xe, hwe->class),
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 3cc32e3e7a90..595eb2de90ad 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -24,7 +24,7 @@ static const struct xe_rtp_entry gt_tunings[] = {
 	{}
 };
 
-static const struct xe_rtp_entry context_tunings[] = {
+static const struct xe_rtp_entry lrc_tunings[] = {
 	{ XE_RTP_NAME("1604555607"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
 	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(XEHP_FF_MODE2,
@@ -38,3 +38,16 @@ void xe_tuning_process_gt(struct xe_gt *gt)
 {
 	xe_rtp_process(gt_tunings, &gt->reg_sr, gt, NULL);
 }
+
+/**
+ * xe_tuning_process_lrc - process lrc tunings
+ * @hwe: engine instance to process tunings for
+ *
+ * Process LRC table for this platform, saving in @hwe all the tunings that need
+ * to be applied on context restore. These are tunings touching registers that
+ * are part of the HW context image.
+ */
+void xe_tuning_process_lrc(struct xe_hw_engine *hwe)
+{
+	xe_rtp_process(lrc_tunings, &hwe->reg_lrc, hwe->gt, hwe);
+}
diff --git a/drivers/gpu/drm/xe/xe_tuning.h b/drivers/gpu/drm/xe/xe_tuning.h
index 66dbc93192bd..2b95b0c8effc 100644
--- a/drivers/gpu/drm/xe/xe_tuning.h
+++ b/drivers/gpu/drm/xe/xe_tuning.h
@@ -7,7 +7,9 @@
 #define _XE_TUNING_
 
 struct xe_gt;
+struct xe_hw_engine;
 
 void xe_tuning_process_gt(struct xe_gt *gt);
+void xe_tuning_process_lrc(struct xe_hw_engine *hwe);
 
 #endif
-- 
2.39.0

