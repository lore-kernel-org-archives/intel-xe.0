Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A7BC5479A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 20:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C293010E0E2;
	Thu, 17 Aug 2023 20:18:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8424210E090
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 20:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692303530; x=1723839530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+si/YdUgW3+h8w+37x8EXbeQ5jChmgUiIXd/Eu+cDDg=;
 b=N7X0kN61+iNyi3kFZhnaEYaOMH9Z9u4yUAIwKmDps5ZAjfMGiVcND9N7
 5cpc3Euv6P9A04T2IpH5uiJWt4Uxa3zjcNzWhmOO/a0sMGJFZCd/LIIkn
 kBUY1vboZDd27n8iRU9viWbVjT8D87JD6gzUkjMPKsvx85dvGXsftojHy
 0dykJQPZnnNnGaWcPtWNH+9t7JMTzD7A29YVFo0LqFmX6loulltBhLfIs
 vPPpMTSdj5rz0tUEHj7OjkEYRS7mxZLi91X5UVUHm0egjEARJqTwkn55o
 ePg3CRkTzzJlP5pmbxYSHVJEFU57C5ADgWFMEEYSBB2CXZbKHVdtgNcT4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363077720"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="363077720"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:18:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="878379319"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:18:49 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 13:18:27 -0700
Message-ID: <20230817201831.1583172-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
References: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/7] drm/xe: add GSCCS irq support
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The GSCCS has its own enable and mask registers. The interrupt identity
for the GSCCS shows OTHER_CLASS instance 6.

Bspec: 54029, 54030
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_irq.c          | 25 ++++++++++++++++++-------
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index a7904bbee605..db4208399cda 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -380,6 +380,7 @@
 
 #define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
 #define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
+#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044)
 #define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048)
 #define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4))
 #define RCS0_RSVD_INTR_MASK			XE_REG(0x190090)
@@ -389,6 +390,7 @@
 #define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0)
 #define GUC_SG_INTR_MASK			XE_REG(0x1900e8)
 #define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec)
+#define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4)
 #define CCS0_CCS1_INTR_MASK			XE_REG(0x190100)
 #define CCS2_CCS3_INTR_MASK			XE_REG(0x190104)
 #define XEHPC_BCS1_BCS2_INTR_MASK		XE_REG(0x190110)
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 2022a5643e01..1dee3e832eb5 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -176,6 +176,11 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 		xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK, ~dmask);
 		xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK, ~dmask);
 		xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK, ~dmask);
+
+		if (xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER)) {
+			xe_mmio_write32(gt, GUNIT_GSC_INTR_ENABLE, irqs);
+			xe_mmio_write32(gt, GUNIT_GSC_INTR_MASK, ~irqs);
+		}
 	}
 }
 
@@ -244,7 +249,7 @@ static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
 		return tile->media_gt;
 
 	if (class == XE_ENGINE_CLASS_OTHER &&
-	    instance == OTHER_MEDIA_GUC_INSTANCE)
+	    (instance == OTHER_MEDIA_GUC_INSTANCE || instance == OTHER_GSC_INSTANCE))
 		return tile->media_gt;
 
 	return tile->primary_gt;
@@ -281,16 +286,16 @@ static void gt_irq_handler(struct xe_tile *tile,
 
 			engine_gt = pick_engine_gt(tile, class, instance);
 
-			if (class == XE_ENGINE_CLASS_OTHER) {
-				gt_other_irq_handler(engine_gt, instance, intr_vec);
+			hwe = xe_gt_hw_engine(engine_gt, class, instance, false);
+			if (hwe) {
+				xe_hw_engine_handle_irq(hwe, intr_vec);
 				continue;
 			}
 
-			hwe = xe_gt_hw_engine(engine_gt, class, instance, false);
-			if (!hwe)
+			if (class == XE_ENGINE_CLASS_OTHER) {
+				gt_other_irq_handler(engine_gt, instance, intr_vec);
 				continue;
-
-			xe_hw_engine_handle_irq(hwe, intr_vec);
+			}
 		}
 	}
 
@@ -465,6 +470,12 @@ static void gt_irq_reset(struct xe_tile *tile)
 	if (ccs_mask & (BIT(2)|BIT(3)))
 		xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~0);
 
+	if (tile->media_gt &&
+	    xe_hw_engine_mask_per_class(tile->media_gt, XE_ENGINE_CLASS_OTHER)) {
+		xe_mmio_write32(mmio, GUNIT_GSC_INTR_ENABLE, 0);
+		xe_mmio_write32(mmio, GUNIT_GSC_INTR_MASK, ~0);
+	}
+
 	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
 	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
 	xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE,	 0);
-- 
2.41.0

