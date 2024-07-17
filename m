Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268F3C3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 05:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA55C10E940;
	Wed, 17 Jul 2024 05:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMl4S/4m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AC710E941
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 05:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721194973; x=1752730973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+r9XPIdA+z+NV5ZkR8si1JS4yF0UqO8XXLe+OtFFA+c=;
 b=gMl4S/4m4G7BAJCO2sAFJmH/ShTQpr0wm4qBAga3woTRN0HzGtVJuXYz
 OiMa6JzIf/Zxy9qZNlJ9OvbpveYImjHsqOnQu4EhY3hijj2DUGHR9Jaqb
 vXYmTskeqn/nibSaRM82wVU809rVEKAlZZUJK7tkQ6mwtEVe3VmrKwYYO
 7SDsxOusBl6mEBoIt0DMowutAuGl0gzXCUkdAle/TXzIKk+oJnmqKl7im
 jpTT/U32qvIvLKtwNoS5On5gi8Y/CY82OwqJnLwZdliBejf7+Ser4Wu49
 MNK/jFWcFYf8gU30crGbeB3TFAF0+jrWTyMrhI0nOPwsL//3ORWAczWiE A==;
X-CSE-ConnectionGUID: 9DGJn4fQQniI0NGUZlKECA==
X-CSE-MsgGUID: LzQ4JuvITuGUSc8ZWxxqeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18289393"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="18289393"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:42:53 -0700
X-CSE-ConnectionGUID: lsWjvCPHQcei62c45bxqUQ==
X-CSE-MsgGUID: rb547/I1RxmNFCkIgAW06g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="49999951"
Received: from dut1107bmgfrd.igk.intel.com ([10.211.177.88])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:42:51 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com, matthew.d.roper@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 1/1] drm/xe/xe2: Introduce performance changes
Date: Wed, 17 Jul 2024 05:42:46 +0000
Message-Id: <7a8ccdad326d458d3e6bcec858bd829a2dd75835.1721194667.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721194667.git.akshata.jahagirdar@intel.com>
References: <cover.1721194667.git.akshata.jahagirdar@intel.com>
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

