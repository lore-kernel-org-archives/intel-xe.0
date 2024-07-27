Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64424C3DA70
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 18:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237B310E2F0;
	Fri, 26 Jul 2024 18:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOGZPRAB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B90710E2C3
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 18:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722017361; x=1753553361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gtPdNUKmjt75Psmx2xoMuPrnYiSdt7qecAHuT02CJWg=;
 b=iOGZPRABTdVP1FPkVArIRt7upa21dVbqKiVhAsQctSw3pXCy1SD9jYy4
 64lEZEDwkpHqhZoOO8IPmqE3vCA/EaEnrka/dwXwLIXacZFBZ3YS/q3Fy
 ih5yRmObvjmflUwWzhhy6iCvn6jnkndSgoVVz7Z4fc/qtD84gDUs/Pq30
 3fxcVbI3eOUjzYBTQrD6SavaQNJtfF0DeexB/IUn5MgBe3R+AwGcrSI43
 xkmZQJ+KtxlXYYqx31FGaTo7zYAysebUVkMFJNDSWQEHr/rWp83bBdhrK
 +0Llcl/Ii6WRsEUJ5z4HQmsuOx2TAB9FBB7Xg0SGcveT5I+3e4sa+4XOD w==;
X-CSE-ConnectionGUID: jUf+ywfgSyyxuVI1C3CNBA==
X-CSE-MsgGUID: 4A3rog4nTLOibCekkmGeQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19667920"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="19667920"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 11:09:21 -0700
X-CSE-ConnectionGUID: qDsvuAyqQnKALL78OgSK6w==
X-CSE-MsgGUID: yD9bc/j/RF2xfUuOW8AjWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="53255965"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.155])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 11:09:21 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 1/1] drm/xe/xe2: Introduce performance changes
Date: Fri, 26 Jul 2024 23:20:23 -0700
Message-Id: <ca8c3c9a5dc3c822d403d8fcce3861ffdc47fb3f.1722060742.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722060742.git.akshata.jahagirdar@intel.com>
References: <cover.1722060742.git.akshata.jahagirdar@intel.com>
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

Add Compression Performance Improvement Changes in Xe2

Bspec: 70559, 59928, 59927, 59251

v2: Rebase

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 10 ++++++++++
 drivers/gpu/drm/xe/xe_tuning.c       | 13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 8a94a94d2267..28f13362a3df 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -80,6 +80,9 @@
 #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
 #define   LE_CACHEABILITY(value)		REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
 
+#define STATELESS_COMPRESSION_CTRL		XE_REG_MCR(0x4148)
+#define UNIFIED_COMPRESSION_FORMAT		REG_GENMASK(3, 0)
+
 #define XE2_GAMREQSTRM_CTRL			XE_REG(0x4194)
 #define   CG_DIS_CNTLBUS			REG_BIT(6)
 
@@ -192,6 +195,7 @@
 #define GSCPSMI_BASE				XE_REG(0x880c)
 
 #define CCCHKNREG1				XE_REG_MCR(0x8828)
+#define COMPOVFDIS				REG_BIT(25)
 #define   ENCOMPPERFFIX				REG_BIT(18)
 
 /* Fuse readout registers for GT */
@@ -366,6 +370,12 @@
 #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
 #define   XEHP_LNESPARE				REG_BIT(19)
 
+#define L3SQCREG2				XE_REG_MCR(0xb104)
+#define MEMRDNONCOMPOVRFETCHDIS			REG_BIT(26)
+#define COMPMEMRD256BOVRFETCHEN			REG_BIT(20)
+#define MEMRDOVRFETCHDIS			REG_BIT(17)
+#define	MEMRD256BOVRFETCHEN			REG_BIT(14)
+
 #define L3SQCREG3				XE_REG_MCR(0xb108)
 #define   COMPPWOVERFETCHEN			REG_BIT(28)
 
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index d4e6fa918942..f338be24f859 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -45,6 +45,19 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
 	},
+	{ XE_RTP_NAME("Tuning: Change Stateless Compression Control register default to R8 (0x0)"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(CLR(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT))
+	},
+	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(L3SQCREG2, COMPMEMRD256BOVRFETCHEN),
+			 CLR(L3SQCREG2,
+			     MEMRD256BOVRFETCHEN |
+			     MEMRDOVRFETCHDIS |
+			     MEMRDNONCOMPOVRFETCHDIS),
+			 CLR(CCCHKNREG1, COMPOVFDIS))
+	},
 	{}
 };
 
-- 
2.34.1

