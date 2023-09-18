Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7759CC46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 07:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4887A10E1AC;
	Mon, 18 Sep 2023 07:07:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2061D10E1AC
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 07:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695020841; x=1726556841;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GHFbrTuyH2XA4c7ux4rMRPdKVRK4xiM0ieDZDo3Lq+4=;
 b=bGGkK61wQHk/ap/+O9YRLmJg7F+PSSzHpux+r6vLH4CJPCJvMEiwp7oa
 yajCTa6DKxoBQkH+VIMQ5CQFf1zGTv4zn4+HDA4JL5LsTF07szX0gWc87
 MttoUyee1NhQKpAJ2X5UGw+5O/vDsd3B9h53y59KTUt3qLxyfxVO1FraS
 F5fHfEMGPDGlBkWXlzNWOlXNHJl9BKisIE7h+qFGoSZl+a0vNbCj2YcuL
 VHUOhL68yYvFEgVvNwIdmbiJHQJ3WkyXkUORvsQX+i0rV+KInTQuXVuvl
 Zb+A8f4vMBXxL+p5+4r/J1uKzD8AwB7flLbnYMcWvV8OWc02o5Xmo9vam A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="383405206"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="383405206"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 00:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="1076481627"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="1076481627"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga005.fm.intel.com with ESMTP; 18 Sep 2023 00:07:18 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 12:47:57 +0530
Message-Id: <20230918071757.1132362-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/regs: Add definition for the
 PERF_LIMIT_REASONS register
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Adding the definitions for the perf limit reasons register. This will
be extensively used in frequency testing as well as the definition of
several sysfs attributes.

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index e13fbbdf6929..f9ba57c3bc4b 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -410,4 +410,17 @@
 #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
 #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
 
+#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
+#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
+#define   PROCHOT_MASK				REG_BIT(0)
+#define   THERMAL_LIMIT_MASK			REG_BIT(1)
+#define   RATL_MASK				REG_BIT(5)
+#define   VR_THERMALERT_MASK			REG_BIT(6)
+#define   VR_TDC_MASK				REG_BIT(7)
+#define   POWER_LIMIT_4_MASK			REG_BIT(8)
+#define   POWER_LIMIT_1_MASK			REG_BIT(10)
+#define   POWER_LIMIT_2_MASK			REG_BIT(11)
+#define   GT0_PERF_LIMIT_REASONS_LOG_MASK	REG_GENMASK(31, 16)
+#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
+
 #endif
-- 
2.25.1

