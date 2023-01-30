Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A81AC54EED
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jan 2023 16:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B05810E28C;
	Mon, 30 Jan 2023 16:17:36 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C966810E0F5
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jan 2023 16:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675095454; x=1706631454;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IVPYYKUZX/WeK6gS/8pha3L9aTcysRd7J2Lctigz4hM=;
 b=Ffk0fC5Bc4NqnghclyAaQ9oUjCGyaMEffXeD5h5K0RhVAzoSGNPC/Dhq
 4bT0gGdFZudaj+UFnMLRangeuWRnwbcnEBTqD7JB5mnkIs5bQuNsAXn2S
 mUos8LOZTkAOUYl3NprAt9CGjkzYaaIr3bCDdglqggqF7SwIN4TsiUX9X
 CmwIQNidS0cOJ2Tx4mb8qgg4KynkmYxhAXRgJjm0smQJWtZpdLyd951B4
 CESRLxH7i2/hJjYKXROidGSPhy9ph8939HIktb3lS7WbiUfrkgvNKWjlU
 4Q8k0ddrTuK+4C3ScGbd7aHONHYPjadM7z+HM6RyV0C0NAqf9abH1RcCu g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="325294424"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="325294424"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 08:17:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="694609644"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="694609644"
Received: from unknown (HELO josouza-mobl2.fso.intel.com) ([10.230.18.148])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 08:17:31 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 30 Jan 2023 08:17:23 -0800
Message-Id: <20230130161723.42602-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
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

i915 has the same fake workaround to return MI_BATCH_BUFFER_START
nested batch buffer behavior in DG2 and newer platforms to the same
behavior as older platforms.

So here cleaning up TGL_NESTED_BB_EN in MI_MODE to disable third level
chained batch buffer level.

v2:
- replace IP_VERSION_FOREVER by XE_RTP_END_VERSION_UNDEFINED
- move fake workaround to lrc_additional_programming table

Bspec: 45974, 45718
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c |  1 +
 drivers/gpu/drm/xe/xe_wa.c | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.h |  1 +
 3 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 84a73eeccd297..5d07e1e7bd506 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -311,6 +311,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 
 		xe_reg_sr_init(&hwe->reg_lrc, "LRC", xe);
 		xe_wa_process_lrc(hwe);
+		xe_wa_process_lrc_additional_programming(hwe);
 
 		default_lrc = drmm_kzalloc(&xe->drm,
 					   xe_lrc_size(xe, hwe->class),
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 3325de3edf691..744b7d0982683 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -288,6 +288,21 @@ static const struct xe_rtp_entry lrc_was[] = {
 	{}
 };
 
+static const struct xe_rtp_entry lrc_additional_programming[] = {
+	{ XE_RTP_NAME("FakeWaDisableNestedBBMode"),
+	  /*
+	   * This is a "fake" workaround defined by software to ensure we
+	   * maintain reliable, backward-compatible behavior for userspace with
+	   * regards to how nested MI_BATCH_BUFFER_START commands are handled.
+	   */
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_CLR(RING_MI_MODE(0),
+		     TGL_NESTED_BB_EN,
+		     XE_RTP_FLAG(MASKED_REG, ENGINE_BASE))
+	},
+	{}
+};
+
 static const struct xe_rtp_entry register_whitelist[] = {
 	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
@@ -362,6 +377,19 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
 	xe_rtp_process(lrc_was, &hwe->reg_lrc, hwe->gt, hwe);
 }
 
+/**
+ * xe_wa_process_lrc_additional_programming - process additional LRC programming
+ * table
+ * @hwe: engine instance to process workarounds for
+ *
+ * Process additional context programming table for this platform, saving in
+ * @hwe all the registers changes that need to be applied on context restore.
+ */
+void xe_wa_process_lrc_additional_programming(struct xe_hw_engine *hwe)
+{
+	xe_rtp_process(lrc_additional_programming, &hwe->reg_lrc, hwe->gt, hwe);
+}
+
 /**
  * xe_reg_whitelist_process_engine - process table of registers to whitelist
  * @hwe: engine instance to process whitelist for
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index 1a0659690a320..872f3e4ddc73c 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -12,6 +12,7 @@ struct xe_hw_engine;
 void xe_wa_process_gt(struct xe_gt *gt);
 void xe_wa_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_process_lrc(struct xe_hw_engine *hwe);
+void xe_wa_process_lrc_additional_programming(struct xe_hw_engine *hwe);
 
 void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
 void xe_reg_whitelist_apply(struct xe_hw_engine *hwe);
-- 
2.39.1

