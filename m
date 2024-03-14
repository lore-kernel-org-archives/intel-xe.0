Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB8FC54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE47410FC48;
	Thu, 14 Mar 2024 17:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMkTDy/X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B34A10FC40
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710437529; x=1741973529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t0lrzbDTYIlg3ssLjrbQgJyG9rc8xbEIm6Nj/vcP5Ng=;
 b=kMkTDy/XWPbZn079JdURqpY6xk9ZM95pJpCkyMWO34w357iolE7ZWpsU
 xr08wlwrZpcURGyVQVO2HQKwW0Yz0PJt13GqwIG52l2pCq5bsg1FKbfRf
 HKsHYx/8LWJtOVeV5bt9moAnwmYtWKnX8xKanaGPK1/mGMVVdNhHOKzke
 veiZu45GTwLTSo6A8wPv8I0fknmoPvaTiMACbwT7ZpZrLIysQG49qpUzB
 CaVLeI70jcsgM5zRHi2KO1tuoIcxrA5jeoiabhh3ExDo5Y+ypq0+rkPi2
 nYASW/9bTC6G8LeH8ZKcmUwk/5p9G1BBIvAsFte0WFvooERsaiej+kj3E w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22791713"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="22791713"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12388865"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.155.117])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:31:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 5/6] drm/xe: Mark VF accessible interrupt registers
Date: Thu, 14 Mar 2024 18:31:29 +0100
Message-Id: <20240314173130.1177-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240314173130.1177-1-michal.wajdeczko@intel.com>
References: <20240314173130.1177-1-michal.wajdeczko@intel.com>
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

Interrupt registers 1900xx are VF accessible but only until version
12.50 as on newer platforms VFs are using memory-based interrupts.

To avoid complexity, we mark those registers with XE_REG_OPTION_VF
unconditionally, as IRQ handling on newer VFs is different anyway.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
v2: explain when those regs are really VFs accessible (Matt)
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 40 ++++++++++++++++------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 15ac2d284d48..9513a11c5236 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -439,7 +439,13 @@
 #define GT_PERF_STATUS				XE_REG(0x1381b4)
 #define   VOLTAGE_MASK				REG_GENMASK(10, 0)
 
-#define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
+/*
+ * Note: Interrupt registers 1900xx are VF accessible only until version 12.50.
+ *       On newer platforms, VFs are using memory-based interrupts instead.
+ *       However, for simplicity we keep this XE_REG_OPTION_VF tag intact.
+ */
+
+#define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4), XE_REG_OPTION_VF)
 #define   INTR_GSC				REG_BIT(31)
 #define   INTR_GUC				REG_BIT(25)
 #define   INTR_MGUC				REG_BIT(24)
@@ -450,16 +456,16 @@
 #define   INTR_VECS(x)				REG_BIT(31 - (x))
 #define   INTR_VCS(x)				REG_BIT(x)
 
-#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
-#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
-#define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
+#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030, XE_REG_OPTION_VF)
+#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034, XE_REG_OPTION_VF)
+#define GUC_SG_INTR_ENABLE			XE_REG(0x190038, XE_REG_OPTION_VF)
 #define   ENGINE1_MASK				REG_GENMASK(31, 16)
 #define   ENGINE0_MASK				REG_GENMASK(15, 0)
-#define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c)
-#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044)
-#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048)
+#define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c, XE_REG_OPTION_VF)
+#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044, XE_REG_OPTION_VF)
+#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048, XE_REG_OPTION_VF)
 
-#define INTR_IDENTITY_REG(x)			XE_REG(0x190060 + ((x) * 4))
+#define INTR_IDENTITY_REG(x)			XE_REG(0x190060 + ((x) * 4), XE_REG_OPTION_VF)
 #define   INTR_DATA_VALID			REG_BIT(31)
 #define   INTR_ENGINE_INSTANCE(x)		REG_FIELD_GET(GENMASK(25, 20), x)
 #define   INTR_ENGINE_CLASS(x)			REG_FIELD_GET(GENMASK(18, 16), x)
@@ -468,16 +474,16 @@
 #define   OTHER_GSC_HECI2_INSTANCE		3
 #define   OTHER_GSC_INSTANCE			6
 
-#define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4))
-#define RCS0_RSVD_INTR_MASK			XE_REG(0x190090)
-#define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0)
-#define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8)
-#define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac)
-#define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0)
+#define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4), XE_REG_OPTION_VF)
+#define RCS0_RSVD_INTR_MASK			XE_REG(0x190090, XE_REG_OPTION_VF)
+#define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0, XE_REG_OPTION_VF)
+#define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8, XE_REG_OPTION_VF)
+#define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac, XE_REG_OPTION_VF)
+#define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0, XE_REG_OPTION_VF)
 #define HECI2_RSVD_INTR_MASK			XE_REG(0x1900e4)
-#define GUC_SG_INTR_MASK			XE_REG(0x1900e8)
-#define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec)
-#define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4)
+#define GUC_SG_INTR_MASK			XE_REG(0x1900e8, XE_REG_OPTION_VF)
+#define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec, XE_REG_OPTION_VF)
+#define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4, XE_REG_OPTION_VF)
 #define CCS0_CCS1_INTR_MASK			XE_REG(0x190100)
 #define CCS2_CCS3_INTR_MASK			XE_REG(0x190104)
 #define XEHPC_BCS1_BCS2_INTR_MASK		XE_REG(0x190110)
-- 
2.43.0

