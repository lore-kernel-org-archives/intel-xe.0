Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB495CD1296
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 12:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744CA10F4EC;
	Tue,  2 Apr 2024 12:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1/JkuUm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3387210F4EC
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 12:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712062062; x=1743598062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B23CE0E+2AcuaS2vcuJvXRuZdEk5Hqmf2+8vLIQcMg8=;
 b=X1/JkuUmh+d8Ok4OY/Jdc/IJFQY7G+QkXd1vSkD/4qg0LysniVv+VRfa
 Ekyz64kwc8NGTpmKLY2GC6GBMU4IlkdNz1eu6wBU0pHYXr00Ma4vyo3Ki
 ll6AY5Nk/ppNTaff4oGpnr1J9hufKlPQnoMg0qqFCwbPKnuS/uv81fTLU
 C05me/UdvL1ZLu7rlPDe8cD4MOzhD0pV1rP0q46b1UMuu2eGONQNbe9L0
 SA196pDfYhCgt960eZwW8ganHpHSh6k4GCs856qCjRmHXQ2iYNyqOkoow
 cb8AinSUP90ziCgc1Y299vHEhRrbZjtvz+4k8C/YCGFUDKE5BnpVwI6Qp g==;
X-CSE-ConnectionGUID: 92S9SVIqT7ibgsySNXrFNg==
X-CSE-MsgGUID: T8K2h4geRLuHE7WVmZeYCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7098099"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7098099"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:47:37 -0700
X-CSE-ConnectionGUID: dnJJxfYlTEenWEKQX/5qSg==
X-CSE-MsgGUID: Tm7l46pGTUyXLPuJLUlq/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18111244"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:47:35 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 11/11] drm/xe/xe2hpm: Add initial set of workarounds
Date: Tue,  2 Apr 2024 18:17:24 +0530
Message-Id: <20240402124724.1238122-12-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
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

From: Gustavo Sousa <gustavo.sousa@intel.com>

Define the initial set of workarounds for Xe2_HPM.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++++
 drivers/gpu/drm/xe/xe_wa.c           | 32 ++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 17cc9b6c9536..126baed6a99f 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -279,6 +279,10 @@
 #define FORCEWAKE_GT				XE_REG(0xa188)
 
 #define PG_ENABLE				XE_REG(0xa210)
+#define   VD2_MFXVDENC_POWERGATE_ENABLE		REG_BIT(8)
+#define   VD2_HCP_POWERGATE_ENABLE		REG_BIT(7)
+#define   VD0_MFXVDENC_POWERGATE_ENABLE		REG_BIT(4)
+#define   VD0_HCP_POWERGATE_ENABLE		REG_BIT(3)
 
 #define CTC_MODE				XE_REG(0xa26c)
 #define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a163a764d25e..824481cd2247 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -228,6 +228,28 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
 
+	/* Xe2_HPM */
+
+	{ XE_RTP_NAME("16021867713"),
+	  XE_RTP_RULES(MEDIA_VERSION(1301),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+	{ XE_RTP_NAME("14020316580"),
+	  XE_RTP_RULES(MEDIA_VERSION(1301)),
+	  XE_RTP_ACTIONS(CLR(PG_ENABLE,
+			     VD0_HCP_POWERGATE_ENABLE |
+			     VD0_MFXVDENC_POWERGATE_ENABLE |
+			     VD2_HCP_POWERGATE_ENABLE |
+			     VD2_MFXVDENC_POWERGATE_ENABLE)),
+	},
+	{ XE_RTP_NAME("14019449301"),
+	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+
 	{}
 };
 
@@ -508,6 +530,16 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
 	},
 
+	/* Xe2_HPM */
+
+	{ XE_RTP_NAME("16021639441"),
+	  XE_RTP_RULES(MEDIA_VERSION(1301)),
+	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
+			     GHWSP_CSB_REPORT_DIS |
+			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
+			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
+
 	{}
 };
 
-- 
2.25.1

