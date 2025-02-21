Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AE5C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 11:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D8110E2CC;
	Fri, 21 Feb 2025 11:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3PtV2dO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAFF10E2CC
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 11:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740136520; x=1771672520;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ziFSl5+djpTX9exWsjcew/Qdv9eWJ5Jevz7e5ukOiYU=;
 b=F3PtV2dOZ+srZGflNQFZa7GM+9TicGGnvLDMD6MEsozIHlHUNZ4tnBo5
 eHQd+fo8OslI8jrHqTYXWWBWSVclWixgNb/Gn+1rmwYIgYa5JqroG5QdR
 p07JYgoAIXCgYjPop/NnUSTJ9FpJtLEQiPArjbPQ9YHrqoW72iHqlZyyG
 0fK8/3k7DSvbzIcshDG2EnRmpzBYkBD8Xu3r518Bk4xN3lVTyoGLLLXWW
 9kVHr2mF1ID6AYGRljdnOaChI4+2gFn2+PlGnn1yQPOtfAEM4lM2w4nRY
 a5bQieFmFhR1rwERmRkUkJZusj6oN76r+zRYLznlO9axUSd7zGecMAmgL w==;
X-CSE-ConnectionGUID: CKeE/ik5Q5GRLy24/tabNw==
X-CSE-MsgGUID: Q+9TKGrlRQ2w/6ErCHkOrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51943326"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="51943326"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 03:15:20 -0800
X-CSE-ConnectionGUID: nj63GZVqSUe4QposdAhggQ==
X-CSE-MsgGUID: QwfgrdObT+yCBFPKexPQUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115179149"
Received: from unknown (HELO tejas-super-server..) ([10.190.239.37])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 03:15:18 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/xe3lpg: Add Wa_13012615864
Date: Fri, 21 Feb 2025 16:52:00 +0530
Message-Id: <20250221112200.388612-1-tejas.upadhyay@intel.com>
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

Wa_13012615864 applies to  xe3lpg

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 096859072396..a3ad2ad7a03b 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -478,6 +478,7 @@
 #define TDL_TSL_CHICKEN				XE_REG_MCR(0xe4c4, XE_REG_OPTION_MASKED)
 #define   STK_ID_RESTRICT			REG_BIT(12)
 #define   SLM_WMTP_RESTORE			REG_BIT(11)
+#define   RES_CHK_SPR_DIS			REG_BIT(6)
 
 #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
 #define   UGM_BACKUP_MODE			REG_BIT(13)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 744dba4fdb58..7b3eed278483 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -618,6 +618,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
 	},
+	{ XE_RTP_NAME("13012615864"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
+	},
 
 	{}
 };
-- 
2.34.1

