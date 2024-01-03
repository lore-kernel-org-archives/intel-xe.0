Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D217C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 13:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A991A10E2A2;
	Wed,  3 Jan 2024 13:18:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C8910E2A2
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 13:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704287909; x=1735823909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hHAsXgqKTI1VRnd7x+2BBlnDbKxcj189oYHiLEDcjmk=;
 b=bukCqONgHNsgbsZ4qbOglZmHyVw1D/f+9p66m//L5AZjrRVqYHq7b/Yj
 cotrz7Aqo6n7ENcKjQ6eUTMNNTHfR1FbAjMheysa2BEgpgt4bAWZFMaiM
 IxTl2lXSJ+aisPyDg56Jc0Ri0QPKXfZUl8Xgr4BPEaVMq1Moiy1kAVbvk
 Dk5/yX1L/YaAP4wTFYOCD6x0zcWERg0pcQ0hD7ErGaMUaYc0B+Tz2evIv
 QkWcw6WpicwHFyRMesZI9SHPGJLlMNkk1VHuIsseICOGIOviZyEiFTtMO
 95JzNm8ZMdSPe3V6HVfD1PIgvHmsvuWFf9kHObVsk6TO3Lj/ugq9gy2z7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4089438"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="4089438"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 05:18:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="756216390"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="756216390"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 05:18:27 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe/xe2: synchronise CS_CHICKEN1 with WMTP support
Date: Wed,  3 Jan 2024 14:05:17 +0100
Message-ID: <20240103130517.25903-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Recommendation is to read FUSE4 register to check if WMTP has been
enabled/disabled by HW. If enabled we don't need to do anything special,
however if disabled recommendation is to also disable the WMTP mode in
the FF_SLICE_CS_CHICKEN2 register, falling back to thread-group and
mid-batch preemption only. However on Linux, the per-context CS_CHICKEN1
is how userspace controls pre-emption, so instead use the default lrc to
disable WMPT using CS_CHICKEN1, if disabled by HW. Userspace is still
free to set CS_CHICKEN1 to whatever they want later.

v2: remove redundant version check and also add descriptive name(Matt)

Cc: Matt Roper <matthew.d.roper@intel.com>
Co-developed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c    | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 6aaaf1f63c72..6dfad86aaea6 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -146,6 +146,7 @@
 
 /* Fuse readout registers for GT */
 #define XEHP_FUSE4				XE_REG(0x9114)
+#define   CFEG_WMTP_DISABLE			REG_BIT(20)
 #define   CCS_EN_MASK				REG_GENMASK(19, 16)
 #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 832989c83a25..88dcb8cc8beb 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -316,6 +316,26 @@ static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
 	       xe_rtp_match_first_render_or_compute(gt, hwe);
 }
 
+static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_gt *gt,
+				      const struct xe_hw_engine *hwe)
+{
+
+	bool mtp_disabled;
+
+	if (GRAPHICS_VER(gt_to_xe(gt)) < 20)
+		return false;
+
+	if (hwe->class != XE_ENGINE_CLASS_COMPUTE &&
+	    hwe->class != XE_ENGINE_CLASS_RENDER)
+		return false;
+
+	mtp_disabled = REG_FIELD_GET(CFEG_WMTP_DISABLE,
+				     xe_mmio_read32(hwe->gt,
+						    XEHP_FUSE4));
+	return mtp_disabled;
+
+}
+
 void
 xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 {
@@ -346,6 +366,14 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
 					   RCU_MODE_FIXED_SLICE_CCS_MODE))
 		},
+		/* Disable WMTP if HW doesn't support it */
+		{ XE_RTP_NAME("DISABLE_WMTP_ON_UNSUPPORTED_HW"),
+		  XE_RTP_RULES(FUNC(xe_rtp_cfeg_wmtp_disabled)),
+		  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1(0),
+					   PREEMPT_GPGPU_LEVEL_MASK,
+					   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
+		  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
+		},
 		{}
 	};
 
-- 
2.42.0

