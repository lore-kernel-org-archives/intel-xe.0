Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD85C41535
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7016E10E2D9;
	Mon,  6 Nov 2023 11:22:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2AB10E2CE
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269754; x=1730805754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ccv5eC6/2uYfzMIAo7wNWuELtCe7H65f9v+bGYJt1uA=;
 b=EJxC8C5nQBgEh/ueAKhj5wW0MXSDuMzWXpqF64xDPl0Hz09FL8QsxEMe
 ONbUSDhmGofDJ76YOqXV33sNNTlI5sBQhk9wIcRtc+44MMZMVn1H6gU9Y
 WLLu3zdJ66gmuhmWcbx6L99MVZiXggB3me0yxGgbh1kFhAFE/U6HFlzM/
 irbQOCm6CpB60cb7+beye2s5EKF5ik21MAPXm902gEgi3PSVtcNz0mazf
 82nfQbpQbdj1GIeX3UbltdSINYlDmD+tlEhcGm6sKeMJhNj5JFXk2c0fG
 jhkWMulQvk57NNwCuspNXed+1PRGg9i0TyRDYAlY60US0R6e/pQZFizUY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646782"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646782"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411565"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411565"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:19 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:26 +0200
Message-Id: <20231106111845.2333093-7-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 06/25] drm/xe: Introduce for_each_dss_steering loop
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Implement macro allowing to loop over each DSS (both compute and
geometry) and get mcr steering for each.

v2: - Respect pre-XE_Hp platforms (with HSW-style slice).

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_mcr.h | 15 +++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 77925b35cf8d..2994adf7e605 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -683,3 +683,30 @@ void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p)
 		}
 	}
 }
+
+/**
+ * xe_gt_mcr_get_dss_steering - returns the group/instance steering for a SS
+ * @gt: GT structure
+ * @dss: DSS ID to obtain steering for
+ * @group: pointer to storage for steering group ID
+ * @instance: pointer to storage for steering instance ID
+ *
+ * Returns the steering IDs (via the @group and @instance parameters) that
+ * correspond to a specific subslice/DSS ID.
+ */
+void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, int dss,
+				int *group, int *instance)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int dss_per_grp;
+
+	if (xe->info.platform == XE_PVC)
+		dss_per_grp = 8;
+	else if (GRAPHICS_VERx100(xe) >= 1250)
+		dss_per_grp = 4;
+	else
+		dss_per_grp = 6;
+
+	*group = dss / dss_per_grp;
+	*instance = dss % dss_per_grp;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 27ca1bc880a0..71716f0f7cde 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -7,6 +7,7 @@
 #define _XE_GT_MCR_H_
 
 #include "regs/xe_reg_defs.h"
+#include "xe_gt_types.h"
 
 struct drm_printer;
 struct xe_gt;
@@ -26,4 +27,18 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 
 void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
 
+void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, int dss, int *group, int *instance);
+
+/* Loop over each DSS (inlc. geometry and compute) and determine the group and instance IDs that
+ * should be used to steer MCR accesses toward this DSS. Fused-off subslices
+ * are skipped.
+ */
+#define for_each_dss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_dss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(test_bit(ss_, gt_->fuse_topo.c_dss_mask) || \
+			    test_bit(ss_, gt_->fuse_topo.g_dss_mask))
+
+
 #endif /* _XE_GT_MCR_H_ */
-- 
2.34.1

