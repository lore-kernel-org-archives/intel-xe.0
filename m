Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8089CC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 21:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F75210E081;
	Thu,  1 Aug 2024 21:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BciJUF2e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A2310E081
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 21:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722547716; x=1754083716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JL4OIPpj2h78myg7tQMlp+Hp59PT/DFJt+d9lIUA2Ks=;
 b=BciJUF2elg6b5JgvbaVJ2F6Xek6jaXsW7CjKjasDlw1imN9o/m01UYcH
 kZA1a5G3PgyeUrCm0aQ0qVFjWT3V74Z8Zp9uSSLCobTJKO360adBMrmzi
 Kf/YU7dNpnt65Zx6UqBp/JWZqXlerssQCRZj03efvEYAGXemWNtM0AYjd
 vWbFKaKXYRNHIHs4IOzOyotJEI9jAjOJHlu3BTOD+9TYm+JdosviSrUwi
 c5W0fkqKldACXPJX+J7Rj6RgjHVtE0Pe9IU61cZ6QH42mnQ+xlkuI1jF9
 ppGBv7EHhNkBC8lwkLUP4FLjbVXKIXxV+qauCdIrrJBO3RJL1IaDxXPho w==;
X-CSE-ConnectionGUID: QZGhIk9LR+eIxTWsabIodQ==
X-CSE-MsgGUID: BCeJq2XBQl6jWhDO+17BkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20359483"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="20359483"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 14:28:35 -0700
X-CSE-ConnectionGUID: RJbmPR2VRe+cKBBIhUeBZg==
X-CSE-MsgGUID: 3z0YrBjLQH6XxLUPggT11w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="60024517"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.155])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 14:28:36 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, tejas.upadhyay@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH v3 1/1] drm/xe/xe2: Introduce performance changes
Date: Fri,  2 Aug 2024 02:39:29 -0700
Message-Id: <3e8ff481eeba3f9b20bd542fa8d304e5736bb704.1722591343.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722591343.git.akshata.jahagirdar@intel.com>
References: <cover.1722591343.git.akshata.jahagirdar@intel.com>
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

v2: Rebase

v3: Rebase, updated as per latest changes on bspec,
    Removed unnecessary default actions (Matt)
    formatting nits (Tejas)

Bspec: 72161
Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 4 ++++
 drivers/gpu/drm/xe/xe_tuning.c       | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 3b87f95f9ecf..0d6a73a3c8c7 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -367,6 +367,10 @@
 #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
 #define   XEHP_LNESPARE				REG_BIT(19)
 
+#define L3SQCREG2				XE_REG_MCR(0xb104)
+#define   COMPMEMRD256BOVRFETCHEN		REG_BIT(20)
+#define	  MEMRD256BOVRFETCHEN			REG_BIT(14)
+
 #define L3SQCREG3				XE_REG_MCR(0xb108)
 #define   COMPPWOVERFETCHEN			REG_BIT(28)
 
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 77d4eec0118d..b41fdb350411 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -45,6 +45,12 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
 	},
+	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(L3SQCREG2,
+	  		     COMPMEMRD256BOVRFETCHEN |
+	  		     MEMRD256BOVRFETCHEN))
+	},
 	{}
 };
 
-- 
2.34.1

