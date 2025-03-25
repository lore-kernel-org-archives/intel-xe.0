Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9442C35FFC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 06:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D93610E12E;
	Tue, 25 Mar 2025 06:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcmklgKU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2C810E12E
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 06:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742885243; x=1774421243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ugu4Owr8WRgKAANPZZJwlWOa9GKKpiqAbmTS08NKXzQ=;
 b=LcmklgKUcTyXFpSickEt+BgG75Ut0ygvwEzaw4scmbJxUHbIYi0qAhM/
 FyibuathQnaATxnvjg8n36cuByP/zalH1dHKuyEMfC2UiKHw38dfZT20Y
 UAhSIGDtrfGO2riio0jm/jNofbMokqXxrvpWClix62Eskebd6whLSLMqW
 EUR/o5qVJkjz4eEa5WW2JQjoSUuVM0m2QslX1hu0PLhwk0aDERkejup8l
 tZXlhMq+xHEBplqIkZ5LHDkZsQ9FlaRpzvss8+oboi8PplxBhoYBuV0K/
 YGfn7CUFVHgsONjGODdlYx7Rm6Ol0P3nZg5WWwVXJsmZZhaM7TYzEqPuL Q==;
X-CSE-ConnectionGUID: o0Of+C18Qc2Go0v3MZzyCg==
X-CSE-MsgGUID: deuefC82Rt6rWrmrEaLghw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54320217"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="54320217"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 23:47:23 -0700
X-CSE-ConnectionGUID: Bn+DEg9wQ+6kg33t1rl75w==
X-CSE-MsgGUID: 2bUIAKQYQEKu7v4t3vO7Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124305915"
Received: from unknown (HELO aradhyab-desk.iind.intel.com) ([10.190.216.90])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 23:47:22 -0700
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH] drm/xe/xe2hpg: Add Wa_16025250150
Date: Tue, 25 Mar 2025 12:14:34 +0530
Message-Id: <20250325064434.970748-1-aradhya.bhatia@intel.com>
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

Add Wa_16025250150 for the Xe2_HPG (graphics version: 20.01) platforms.
It is a permanent workaround, and applicable on all the steppings.

Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_wa.c           | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index da1f198ac107..5c1946f92e0c 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -392,6 +392,18 @@
 #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
 #define   XEHP_LNESPARE				REG_BIT(19)
 
+#define LSN_VC_REG2				XE_REG(0xb0c8)
+#define   LSN_LNI_WGT_MASK			REG_GENMASK(31, 28)
+#define   LSN_LNI_WGT(value)			REG_FIELD_PREP(LSN_LNI_WGT_MASK, value)
+#define   LSN_LNE_WGT_MASK			REG_GENMASK(27, 24)
+#define   LSN_LNE_WGT(value)			REG_FIELD_PREP(LSN_LNE_WGT_MASK, value)
+#define   LSN_DIM_X_WGT_MASK			REG_GENMASK(23, 20)
+#define   LSN_DIM_X_WGT(value)			REG_FIELD_PREP(LSN_DIM_X_WGT_MASK, value)
+#define   LSN_DIM_Y_WGT_MASK			REG_GENMASK(19, 16)
+#define   LSN_DIM_Y_WGT(value)			REG_FIELD_PREP(LSN_DIM_Y_WGT_MASK, value)
+#define   LSN_DIM_Z_WGT_MASK			REG_GENMASK(15, 12)
+#define   LSN_DIM_Z_WGT(value)			REG_FIELD_PREP(LSN_DIM_Z_WGT_MASK, value)
+
 #define L3SQCREG2				XE_REG_MCR(0xb104)
 #define   COMPMEMRD256BOVRFETCHEN		REG_BIT(20)
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 24f644c0a673..6f6563cc7430 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -230,6 +230,18 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
 
+	/* Xe2_HPG */
+
+	{ XE_RTP_NAME("16025250150"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001)),
+	  XE_RTP_ACTIONS(SET(LSN_VC_REG2,
+			     LSN_LNI_WGT(1) |
+			     LSN_LNE_WGT(1) |
+			     LSN_DIM_X_WGT(1) |
+			     LSN_DIM_Y_WGT(1) |
+			     LSN_DIM_Z_WGT(1)))
+	},
+
 	/* Xe2_HPM */
 
 	{ XE_RTP_NAME("16021867713"),

base-commit: 9a42bdcde0f77b2c1e947e283cc3b267b1ce2056
-- 
2.34.1

