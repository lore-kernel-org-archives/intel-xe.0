Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FD9C4167D
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 10:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C2010E966;
	Fri, 10 Nov 2023 10:16:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F38D10E966
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 10:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699611383; x=1731147383;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iK4Cm3v9eTNB/yk9/epkIB3UP0cNaGsRMym3clPI4KY=;
 b=FUjhuBtkNaYOXCZIVKDeuHyCbJLqbSvRAszR3QWv5WQgEcST521VDUCb
 5+8rduNz5nBDFyadYTwUSKhTFCmcbnFryQyjDjlhNEd7039Uid0gMuVhF
 dm0SdwL4hEONZmB+d5SY3sFNdkvuyuHFD1/L/3MJZkFNI02seQSKijINQ
 r2HikvzdI1rDX4qXF8feuRq/lEoqKrs4wV8h9wy+nJv+LV2J8NtEUBWdN
 Ia6YysQ5mksj35MHodw95ZzsrkzpeWLjtA5r7tAwNY133YnUHEFGsQGKT
 Xmy7XM2wGm141fGa9yPBi/xhJx6qvwNWuS3pt6uy+TuBohOuPwt5oE72v g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="369496609"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="369496609"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:16:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="1010921062"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="1010921062"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga006.fm.intel.com with ESMTP; 10 Nov 2023 02:16:19 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Nov 2023 15:55:18 +0530
Message-Id: <20231110102518.3130411-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 14019449301
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

This workaround applies to Xe2_LPM media-15, stepping-A0

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_wa.c           | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 902c60543de0..cac6e9e3098c 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -446,6 +446,9 @@
 #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
 #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
 
+#define XEHP_HRS_UNIT_LEVEL_CLKGATE		XE_REG(0x1c3f08)
+#define HRSUNIT_CLKGATE_DIS			REG_BIT(5)
+
 #define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
 #define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
 #define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index d03e6674519f..5040d3841125 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -259,6 +259,13 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
 	},
 
+	/* Xe2_LPM */
+
+	{ XE_RTP_NAME("14019449301"),
+	  XE_RTP_RULES(MEDIA_VERSION(1500), MEDIA_STEP(A0, B0)),
+	  XE_RTP_ACTIONS(SET(XEHP_HRS_UNIT_LEVEL_CLKGATE, HRSUNIT_CLKGATE_DIS))
+	},
+
 	/* Xe2_LPG */
 
 	{ XE_RTP_NAME("16020975621"),
-- 
2.25.1

