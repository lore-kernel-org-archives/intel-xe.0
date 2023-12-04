Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E98C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 14:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8CD10E1D3;
	Mon,  4 Dec 2023 14:18:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3EF10E1D3
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 14:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701699490; x=1733235490;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PC7gyLgsdxJEDDc2L8n3WLI+qTfHxePCAknQzeO6LG8=;
 b=nWQ7Fwx5qyT1+/O18QetNi3ha6ni7Q6KgmT0+UkeKBdOYsugvzIHotkp
 fvPOheaZF7S/Ns5YtPgOa5Nxm/FCFdPosndBS+yZRwt9Iyqmg+pfdD//N
 /+6iHkbZV6S13K2xgc8cZmmxXLhQpt0DrDdd+RU7ppgUnU4xJYIG65GkU
 +2qb5cbz12/AWqU2/iXarpGQHgSvxdMXZVOEQJpoUpHM7pfUMwinkuOhH
 0fbMG5pOGldX3dudd1ctsadGSCCiDy1E2SJusvN+d+n3CgUFQSx0/+sFv
 gWWwYUZVOSA4px5peDCqQdKB09B44TfgnYe+sKYHwjwFth3pVOrJUmpts g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="458060300"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="458060300"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 06:18:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="888541713"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="888541713"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga002.fm.intel.com with ESMTP; 04 Dec 2023 06:18:08 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Dec 2023 19:57:38 +0530
Message-Id: <20231204142738.794980-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 18032095049
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This workaround applies to graphics 20.04 A0 step and on
render engine

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  9 +++++++++
 drivers/gpu/drm/xe/xe_wa.c               | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 444ff9b83bb1..5f70eb62db70 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -40,6 +40,10 @@
 #define RING_NOPID(base)			XE_REG((base) + 0x94)
 
 #define RING_IMR(base)				XE_REG((base) + 0xa8)
+#define   RENDER_INTR_VEC			REG_GENMASK(15, 0)
+#define   RENDER_INTR_VEC_PIPE_CONTROL_NOTIFY	REG_BIT(4)
+#define   RENDER_INTR_VEC_MI_USER_INTERRUPT	REG_BIT(0)
+
 #define   RING_MAX_NONPRIV_SLOTS  12
 
 #define RING_EIR(base)				XE_REG((base) + 0xb0)
@@ -47,6 +51,11 @@
 #define RING_ESR(base)				XE_REG((base) + 0xb8)
 
 #define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
+
+#define CSFE_CHICKEN1_REG(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
+#define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
+#define   GHWSP_CSB_REPORT_DISABLE		REG_BIT(15)
+
 /*
  * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
  * The lsb of each can be considered a separate enabling bit for encryption.
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 63bd4bb1af03..c5c640dcb427 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -596,6 +596,16 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
 	},
+	{ XE_RTP_NAME("18032095049"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(FIELD_SET(RING_IMR(0),
+				   RENDER_INTR_VEC,
+				   RENDER_INTR_VEC_PIPE_CONTROL_NOTIFY |
+				   RENDER_INTR_VEC_MI_USER_INTERRUPT,
+				   XE_RTP_ACTION_FLAG(ENGINE_BASE)),
+			 SET(CSFE_CHICKEN1_REG(0), PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS |
+			     GHWSP_CSB_REPORT_DISABLE))
+	},
 
 	{}
 };
-- 
2.25.1

