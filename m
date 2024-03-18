Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C1EC54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 21:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D210B10F2DA;
	Mon, 18 Mar 2024 21:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EruD2zJm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B23A10F2DA
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 21:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710795770; x=1742331770;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=apWb3SVl0Xc8zS9BLiP5eXT8+38g8PMYjoRAtqAj5E4=;
 b=EruD2zJmF/KzN2b1Hirhi1doL5yCwdGrqwPCC0YFLVthVm48/KLpPnRb
 p14RcSpdm11hlZ0tHZcqfQwcsEhj7sxiBRMOuFpWHP7f2ZY8+kUalhmFL
 1NYNUQMnhGNW2f1jJ4Aa6v8Wvx4NASFAkoYiS9qkpZ3ZpLYv78Gts6gge
 0ekF+8hTSBB6E8e2I6fAebY6ke6rgbfcYMdO4Yq6e2bftw29yZqB571rZ
 GRi92li3Jv94mHUWoEJ+Zrs3u/I9x4m/uxewWeyT8AEjR1rQwd5CjwxBJ
 g1OvaiJF6EDn+edJd4HOBgymjXv2o5ppxKh7leEycCsoUWscUemxxyyJe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5763266"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5763266"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 14:02:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18162581"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 14:02:49 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2] drm/xe/xelpg: Add Wa_14020495402
Date: Mon, 18 Mar 2024 14:01:20 -0700
Message-Id: <20240318210120.564692-1-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Disable clockgating for TDL SVHS fub.

v2: Extend the Wa to 1274(MattR)

Bspec: 46045
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 15ac2d284d48..acf7bbe8cc8d 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -364,6 +364,7 @@
 #define   DISABLE_EARLY_READ			REG_BIT(14)
 #define   ENABLE_LARGE_GRF_MODE			REG_BIT(12)
 #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
+#define   DISABLE_TDL_SVHS_GATING		REG_BIT(1)
 #define   DISABLE_DOP_GATING			REG_BIT(0)
 
 #define RT_CTRL					XE_REG_MCR(0xe530)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 2460c570e628..a8d0e7534aac 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -396,6 +396,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(XEHP_HDC_CHICKEN0, DIS_ATOMIC_CHAINING_TYPED_WRITES,
 			     XE_RTP_NOCHECK))
 	},
+	{ XE_RTP_NAME("14020495402"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_TDL_SVHS_GATING))
+	},
 
 	/* Xe2_LPG */
 
-- 
2.34.1

