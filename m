Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4101C47074
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 18:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC9010E52F;
	Thu,  4 Jan 2024 18:39:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C5110E4D7
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 18:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704393569; x=1735929569;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/3jHMG13GmYrT+AlxJM1GsFantk3DrnoAfKQPb1W4ZU=;
 b=ZxtgceYvl9FAeV9/uSQc7GhThHcJOOV5BXLpd6h30pTL/47NuZSF5S8h
 GXSdeX2AmGZ12AgpZLAnM0UMZ5bPcm/I4++W+bKihW95i7HURLK1z+0LC
 WWi+2HHXcJ/FKBz2kQxFFpFSiv1XeK/JPOMUXeJmDTjHq+VTpP4Kaa6rW
 cp1rkUijyfKPXbX52HC6SBWNt0kV4osmLSZXU8QfXln/jJMS/WL/8fMm9
 WFOn5tAkFoXIyk0kI7A/RvrSqzQeO9Gi3MiVujIXKNK5H0pfHjI1UaRqs
 Eb/9gUGC4eCQueinopHdt0nQcnebtilPdmQSaAOj0l6iYnXrS1KGEXx1s A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="400094759"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="400094759"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 10:39:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="814732590"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="814732590"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 10:39:28 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3] drm/xe/xe2: synchronise CS_CHICKEN1 with WMTP support
Date: Thu,  4 Jan 2024 19:26:15 +0100
Message-ID: <20240104182615.21327-1-nirmoy.das@intel.com>
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
disable WMTP using CS_CHICKEN1, if disabled by HW. Userspace is still
free to set CS_CHICKEN1 to whatever they want later.

v2: remove redundant version check and also add descriptive name(Matt)
v3: remove usage of REG_FIELD_GET(Matt)

Cc: Matt Roper <matthew.d.roper@intel.com>
Co-developed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c    | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 1dd361046b5d..378d8e37702b 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -146,6 +146,7 @@
 
 /* Fuse readout registers for GT */
 #define XEHP_FUSE4				XE_REG(0x9114)
+#define   CFEG_WMTP_DISABLE			REG_BIT(20)
 #define   CCS_EN_MASK				REG_GENMASK(19, 16)
 #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1fa5cf5eea97..d1a89d8db2f3 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -289,6 +289,19 @@ static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
 	       xe_rtp_match_first_render_or_compute(gt, hwe);
 }
 
+static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_gt *gt,
+				      const struct xe_hw_engine *hwe)
+{
+	if (GRAPHICS_VER(gt_to_xe(gt)) < 20)
+		return false;
+
+	if (hwe->class != XE_ENGINE_CLASS_COMPUTE &&
+	    hwe->class != XE_ENGINE_CLASS_RENDER)
+		return false;
+
+	return xe_mmio_read32(hwe->gt, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
+}
+
 void
 xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 {
@@ -319,6 +332,14 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
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

