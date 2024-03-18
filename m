Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C086EC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 19:38:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E4A10F3D4;
	Mon, 18 Mar 2024 19:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ero+VWt2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E5510F3D4
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 19:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710790719; x=1742326719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3qUTCznBcem8jfjyKkpC8RoBMMHxD7K1kz4qVwh179M=;
 b=ero+VWt27g1JYNkkz5Qb2FdLaZaf88H56eel0NgQVuv6Dvk7Y0LKfCEp
 qEAFVYkA8DksEpKbTPMUgiKFZ4iGLVnaaoGiL27A43H0A9q/Dpa3hACoG
 mQFXzgO5Uep9amOLp1Y63LzQbJwrsV1BwAenwhXqoftosTjLpqxasCtRp
 gPrQHdUfsrm5c3K3XwwvYbnkEhUlhJyCEFTIGq2G5dQFppxf07WvUpiAQ
 mZTY5LpOSXYWXusTZr9IY+9+JhXM+yloZPXrvVbYGUMLH9WWrzjeNCNlW
 vifuQ89sY9lxt5YKT3dNA7STdZ6ZOcKPVQ/SNjxglcpO7qpF7feG3Dica g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5492944"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5492944"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 12:38:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="13602022"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 12:38:39 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/xelpg: Add Wa_14020495402
Date: Mon, 18 Mar 2024 12:37:06 -0700
Message-Id: <20240318193706.389803-1-radhakrishna.sripada@intel.com>
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

Bspec: 46045
Cc: Matt Roper <matthew.d.roper@intel.com>
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
index 2460c570e628..6ab06f029aa9 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -396,6 +396,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(XEHP_HDC_CHICKEN0, DIS_ATOMIC_CHAINING_TYPED_WRITES,
 			     XE_RTP_NOCHECK))
 	},
+	{ XE_RTP_NAME("14020495402"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_TDL_SVHS_GATING))
+	},
 
 	/* Xe2_LPG */
 
-- 
2.34.1

