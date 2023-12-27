Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD42C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 15:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B64010E112;
	Wed, 27 Dec 2023 15:36:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D4310E0EF
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 15:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703691360; x=1735227360;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EH7QHBqwpWxgIv6JkjU2AK64lC9+BlCi/HCCZUiyqhM=;
 b=JLhD7Zq90ABhfgnqMHU/k8JRlUWv4mR7FKTlOreYoT87QJojrF/1USxb
 uc33YR5uzvU/nwbpHqZPlCL5vtkPX2psKFJS77j2VcpYrYchao7AwuPt/
 mlqI2sFWj6KcQiFq0cADSzN4J1nwwvaijsc7z5WN3N3q3NrsA26/WoMme
 zFuD9NiuDOIOdLO0PUK+tR1VWPp1fOYhZt+qA4kssq5Y3KDLhGfzCJ02Z
 2BKdwCBC2ZfmOHQSOpBj+WqYcqsVvN+hx8zNv75HOFQZ+bgbDM1qRO60u
 aN/ZhJGjRezfXYnv3HJnZOuK7vKHepKRrQV1+DGp6jdlOHu4uxhIgO6eW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3759996"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="3759996"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 07:36:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="771455601"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; d="scan'208";a="771455601"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 07:35:58 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/xe2: synchronise CS_CHICKEN1 with WMTP support
Date: Wed, 27 Dec 2023 16:22:49 +0100
Message-ID: <20231227152249.3570-1-nirmoy.das@intel.com>
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

HSD: 16016466292
Cc: Matt Roper <matthew.d.roper@intel.com>
Co-developed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c    | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 6aaaf1f63c72..37bb54187d1d 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -148,6 +148,7 @@
 #define XEHP_FUSE4				XE_REG(0x9114)
 #define   CCS_EN_MASK				REG_GENMASK(19, 16)
 #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
+#define   CFEG_WMTP_DISABLE			REG_BIT(20)
 
 #define	MIRROR_FUSE3				XE_REG(0x9118)
 #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 832989c83a25..c212ca2c8625 100644
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
+		{ XE_RTP_NAME("16016466292"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
+			       FUNC(xe_rtp_cfeg_wmtp_disabled)),
+		  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1(0),
+					   PREEMPT_GPGPU_LEVEL_MASK,
+					   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
+		  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
+		},
 		{}
 	};
 
-- 
2.42.0

