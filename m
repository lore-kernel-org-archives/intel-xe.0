Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF19C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 05:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBBB10E0BA;
	Tue,  9 Jan 2024 05:56:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F4210E0BA
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 05:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704779766; x=1736315766;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gWcQg3v4V/RzOEeOAe4WTzlP7yl2me5M48Dyq5SvSd8=;
 b=Jt9Q5wveunvJXn2EGy/Df/Znv4O9MyUAoq2ZWx9R2ZGhSReMNXDbUYRh
 nrPZegsLjg8Ar0nvExJ6SbWCz4u2v5AlxyMYLIBMvsbo/3L0DRk4Qcxes
 SNijlWLEzHBOLnFM/9umcDXv/Z9uGW8BxQUrnCeWc68k8+fMLqNwxtjUp
 6WWe+jgYcuZv7/dKlW+UL2t+XGYHDbzoRVhI9XfBYpkO1qCCRB9acw+Fv
 PnYrgviF63n/+iAg3zAl3HadB5F/x3d5NExI7/IK8IIULcky3I3GEQUJB
 4+tGxavTdwOOti7dkg0V5lFJJDROxFRTxWETwAXRDDu7WBoOhAkjK4R1k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4869216"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="4869216"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 21:56:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="731358981"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; d="scan'208";a="731358981"
Received: from shekharc-desk.iind.intel.com ([10.190.239.16])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 21:56:03 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/xe2_lpg: Add Wa_16018610683
Date: Tue,  9 Jan 2024 11:25:50 +0530
Message-Id: <20240109055550.679289-1-shekhar.chauhan@intel.com>
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Force max 128KB SLM during WMTP PASS1 Restore.

BSpec: 70202
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_wa.c           | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 6dfad86aaea6..4017319c6300 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -345,6 +345,9 @@
 #define ROW_CHICKEN3				XE_REG_MCR(0xe49c, XE_REG_OPTION_MASKED)
 #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
 
+#define TDL_TSL_CHICKEN				XE_REG_MCR(0xe4c4, XE_REG_OPTION_MASKED)
+#define   SLM_WMTP_RESTORE			REG_BIT(11)
+
 #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
 #define   UGM_BACKUP_MODE			REG_BIT(13)
 #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index b77d406e083e..3299130ba10a 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -455,7 +455,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
-
+	{ XE_RTP_NAME("16018610683"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, SLM_WMTP_RESTORE))
+	},
 	{}
 };
 
-- 
2.34.1

