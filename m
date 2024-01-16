Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487B6C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 14:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0890410E37C;
	Tue, 16 Jan 2024 14:56:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65BC310E538
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705416993; x=1736952993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/NJsz9jx72MtkpR3+kH49gteg54amRkeiZ7EYWM+gkE=;
 b=WcGNymASnbKyBPH8kWL/Xx7eQyrQN4Y86P6zl3dF195m6IYOBzL9K07w
 nhQpOC8ZvmWM/m8NzB9uJhavgj+ao82H/QcA850J0TMqgpArhO13kKobC
 +LdCYJSjGMKRGwa7IWDtgKaeGeCWJzCNdceiErjA8fju2fz/0xd8JtlL9
 xD7c5R0N1N0WJivQrje3/T3GMwmEN9Nwa1pdSXQ4mFgCifmDgzNWDOD7k
 lY3g8QPje/t4XgCoA+eWTD/ZkSXQQ5ymw/uXhctmUdyrwUrHNk0qFPJFt
 /D8Ive1cD4BBi/pJz61w+ACUV5gUTxFNd/58v/a2YMOh72d+MNAUy2+rr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466262471"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="466262471"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="854374887"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="854374887"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.50.177])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:56:32 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/6] drm/xe: Mark VF accessible GT registers
Date: Tue, 16 Jan 2024 15:56:16 +0100
Message-Id: <20240116145617.1177-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240116145617.1177-1-michal.wajdeczko@intel.com>
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
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

Only selected registers are available for Virtual Functions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 46 ++++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 4017319c6300..500d96392e8a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -433,7 +433,7 @@
 #define GT_PERF_STATUS				XE_REG(0x1381b4)
 #define   VOLTAGE_MASK				REG_GENMASK(10, 0)
 
-#define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
+#define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4), XE_REG_OPTION_VF)
 #define   INTR_GSC				REG_BIT(31)
 #define   INTR_GUC				REG_BIT(25)
 #define   INTR_MGUC				REG_BIT(24)
@@ -444,16 +444,16 @@
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
@@ -461,21 +461,21 @@
 #define   OTHER_GUC_INSTANCE			0
 #define   OTHER_GSC_INSTANCE			6
 
-#define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4))
-#define RCS0_RSVD_INTR_MASK			XE_REG(0x190090)
-#define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0)
-#define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8)
-#define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac)
-#define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0)
-#define GUC_SG_INTR_MASK			XE_REG(0x1900e8)
-#define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec)
-#define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4)
-#define CCS0_CCS1_INTR_MASK			XE_REG(0x190100)
-#define CCS2_CCS3_INTR_MASK			XE_REG(0x190104)
-#define XEHPC_BCS1_BCS2_INTR_MASK		XE_REG(0x190110)
-#define XEHPC_BCS3_BCS4_INTR_MASK		XE_REG(0x190114)
-#define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
-#define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
+#define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4), XE_REG_OPTION_VF)
+#define RCS0_RSVD_INTR_MASK			XE_REG(0x190090, XE_REG_OPTION_VF)
+#define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0, XE_REG_OPTION_VF)
+#define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8, XE_REG_OPTION_VF)
+#define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac, XE_REG_OPTION_VF)
+#define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0, XE_REG_OPTION_VF)
+#define GUC_SG_INTR_MASK			XE_REG(0x1900e8, XE_REG_OPTION_VF)
+#define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec, XE_REG_OPTION_VF)
+#define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4, XE_REG_OPTION_VF)
+#define CCS0_CCS1_INTR_MASK			XE_REG(0x190100, XE_REG_OPTION_VF)
+#define CCS2_CCS3_INTR_MASK			XE_REG(0x190104, XE_REG_OPTION_VF)
+#define XEHPC_BCS1_BCS2_INTR_MASK		XE_REG(0x190110, XE_REG_OPTION_VF)
+#define XEHPC_BCS3_BCS4_INTR_MASK		XE_REG(0x190114, XE_REG_OPTION_VF)
+#define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118, XE_REG_OPTION_VF)
+#define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c, XE_REG_OPTION_VF)
 #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
 #define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
 #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
-- 
2.25.1

