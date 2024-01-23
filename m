Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB31C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 05:06:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6A410E0DF;
	Tue, 23 Jan 2024 05:06:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4A710E0DF
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 05:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705986364; x=1737522364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HxFbCWcAqiLd3lZYtygKl5pNePHtfAVt2VM8e+7qSWA=;
 b=GiE6FEcCnhSSoLz+8+N7VbSSHq/q2I9Cl94AeaxtQUVRJj4Hgca5b4/B
 43prkH607Ucry83sqtOHEfHqrbfnWZFgvJiWZoKWJpNqL6ZLdmjzEVfdb
 6MyuvPKIKAoEfovygczMlcdSZVQpfIwHAIMPoC9fshdvYrHuyJCpbYJ9d
 +bO+/JYKBUXlOQaWn1H9jlzOHL8voWUtXAqX5pFHMuE0m9tb8q5MSB+D+
 sYO3+wFjFDjn5B12wgS3CkI0LpjQ6ebwTxDcJOXPNGRdnqlNwIEVkTycb
 aNWD+uVwtFCxgYShyIMcnduZKU9L3u5Z0ihdqciRBo0uwR8egre75sWQU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="398565297"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; d="scan'208";a="398565297"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 21:06:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="819964375"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; d="scan'208";a="819964375"
Received: from shekharc-desk.iind.intel.com ([10.190.239.16])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 21:06:02 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 1/1] drm/xe/xe2_lpg: Introduce performance guide changes
Date: Tue, 23 Jan 2024 10:35:52 +0530
Message-Id: <20240123050552.2250699-2-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240123050552.2250699-1-shekhar.chauhan@intel.com>
References: <20240123050552.2250699-1-shekhar.chauhan@intel.com>
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add performance guide changes to Xe2_LPG.

BSpec: 72161
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 6 ++++++
 drivers/gpu/drm/xe/xe_tuning.c       | 9 ++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 0d4bfc35ff37..cd27480f6486 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -144,6 +144,9 @@
 
 #define GSCPSMI_BASE				XE_REG(0x880c)
 
+#define CCCHKNREG1				XE_REG_MCR(0x8828)
+#define   ENCOMPPERFFIX				REG_BIT(18)
+
 /* Fuse readout registers for GT */
 #define XEHP_FUSE4				XE_REG(0x9114)
 #define   CFEG_WMTP_DISABLE			REG_BIT(20)
@@ -289,6 +292,9 @@
 #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
 #define   XEHP_LNESPARE				REG_BIT(19)
 
+#define L3SQCREG3				XE_REG_MCR(0xb108)
+#define   COMPPWOVERFETCHEN			REG_BIT(28)
+
 #define XEHP_L3SQCREG5				XE_REG_MCR(0xb158)
 #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
 
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 53ccd338fd8c..5c83c75bc497 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -37,7 +37,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_ACTIONS(FIELD_SET(XE2LPM_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
-
+	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX)),
+	},
+	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
+	},
 	{}
 };
 
-- 
2.34.1

