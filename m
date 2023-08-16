Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408FDC04E69
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 18:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA9810E3A1;
	Wed, 16 Aug 2023 18:05:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250BF10E39F
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 18:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692209111; x=1723745111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NuAQF0Uf4rO3ka3BOeTXgR836nisGOioarsvh9MFMyM=;
 b=cCWJ3ua1kCroqQwHECVyKibHxxL2/K71W4uCPYd9lAGHUbbx4HYnfqWw
 clt+Ez/MHOQrHsCzA5fgqDyVGpAF+na7shdKvz0MnxP37xpB1zC8h2cuE
 TUB9lrqdAgnfR98VzERhqw2TcG0QA6IsPhbsdm+FIL0EFs/079tdAuKPC
 xTV1L/Jhy6gQXtNi9zMb1gqI3y8HvsGW67RiUrasqdn4HNnG0ywVA7fsm
 EvEd3RkwZcxfugY8t+YVWakaGZsoICtGRTXENhvjPODUxHcRXEFaShUy9
 I/bF6maHJ7/tvXoJ5htgV3CJ2LG6G8tYgrXUy7kR9l675W+Gl6IQM2l2U A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="458956578"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="458956578"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 11:04:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="980816345"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="980816345"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 11:04:34 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 16 Aug 2023 11:04:21 -0700
Message-ID: <20230816180425.1481448-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816180425.1481448-1-daniele.ceraolospurio@intel.com>
References: <20230816180425.1481448-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/6] drm/xe: base definitions for the GSCCS
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

The first step in introducing the GSCCS is to add all the basic defs for
it (name, mmio base, class/instance, lrc size etc).

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h    | 1 +
 drivers/gpu/drm/xe/regs/xe_regs.h       | 1 +
 drivers/gpu/drm/xe/xe_exec_queue.c      | 3 +++
 drivers/gpu/drm/xe/xe_guc.h             | 1 +
 drivers/gpu/drm/xe/xe_guc_ads.c         | 8 ++------
 drivers/gpu/drm/xe/xe_hw_engine.c       | 7 +++++++
 drivers/gpu/drm/xe/xe_hw_engine_types.h | 2 ++
 drivers/gpu/drm/xe/xe_lrc.c             | 1 +
 8 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index c93d8f8cd93a..69c188999e73 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -379,6 +379,7 @@
 #define   INTR_ENGINE_CLASS(x)			REG_FIELD_GET(GENMASK(18, 16), x)
 #define   INTR_ENGINE_INTR(x)			REG_FIELD_GET(GENMASK(15, 0), x)
 #define   OTHER_GUC_INSTANCE			0
+#define   OTHER_GSC_INSTANCE			6
 
 #define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
 #define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index ec45b1ba9db1..39d7b0740bf0 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -33,6 +33,7 @@
 #define XEHPC_BCS6_RING_BASE			0x3ea000
 #define XEHPC_BCS7_RING_BASE			0x3ec000
 #define XEHPC_BCS8_RING_BASE			0x3ee000
+#define GSCCS_RING_BASE				0x11a000
 #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
 #define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
 #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index bf40154ddd6f..ae5730b2175c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -195,6 +195,9 @@ void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance)
 	case XE_ENGINE_CLASS_COMPUTE:
 		sprintf(q->name, "ccs%d", instance);
 		break;
+	case XE_ENGINE_CLASS_OTHER:
+		sprintf(q->name, "gsccs%d", instance);
+		break;
 	default:
 		XE_WARN_ON(q->class);
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index f64f22e97169..3addd8fc674a 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -51,6 +51,7 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
 	case XE_ENGINE_CLASS_COMPUTE:
 		return GUC_COMPUTE_CLASS;
 	case XE_ENGINE_CLASS_OTHER:
+		return GUC_GSC_OTHER_CLASS;
 	default:
 		XE_WARN_ON(class);
 		return -1;
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 7d1244df959d..5edee24b97c9 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -253,9 +253,6 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 	int class;
 
 	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
-		if (class == XE_ENGINE_CLASS_OTHER)
-			continue;
-
 		if (!engine_enable_mask(gt, class))
 			continue;
 
@@ -350,6 +347,8 @@ static void fill_engine_enable_masks(struct xe_gt *gt,
 		       engine_enable_mask(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE));
 	info_map_write(xe, info_map, engine_enabled_masks[GUC_COMPUTE_CLASS],
 		       engine_enable_mask(gt, XE_ENGINE_CLASS_COMPUTE));
+	info_map_write(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS],
+		       engine_enable_mask(gt, XE_ENGINE_CLASS_OTHER));
 }
 
 static void guc_prep_golden_lrc_null(struct xe_guc_ads *ads)
@@ -638,9 +637,6 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
 	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
 		u8 guc_class;
 
-		if (class == XE_ENGINE_CLASS_OTHER)
-			continue;
-
 		guc_class = xe_engine_class_to_guc_class(class);
 
 		if (!info_map_read(xe, &info_map,
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b8fcc6e985cf..7ce3e740c508 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -219,6 +219,13 @@ static const struct engine_info engine_infos[] = {
 		.domain = XE_FW_RENDER,
 		.mmio_base = COMPUTE3_RING_BASE,
 	},
+	[XE_HW_ENGINE_GSCCS0] = {
+		.name = "gsccs0",
+		.class = XE_ENGINE_CLASS_OTHER,
+		.instance = OTHER_GSC_INSTANCE,
+		.domain = XE_FW_GSC,
+		.mmio_base = GSCCS_RING_BASE,
+	},
 };
 
 static void hw_engine_fini(struct drm_device *drm, void *arg)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 97d9ba31b5fc..cd4bc1412a3f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -53,6 +53,8 @@ enum xe_hw_engine_id {
 	XE_HW_ENGINE_CCS2,
 	XE_HW_ENGINE_CCS3,
 #define XE_HW_ENGINE_CCS_MASK	GENMASK_ULL(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
+	XE_HW_ENGINE_GSCCS0,
+#define XE_HW_ENGINE_GSCCS_MASK	GENMASK_ULL(XE_HW_ENGINE_GSCCS0, XE_HW_ENGINE_GSCCS0)
 	XE_NUM_HW_ENGINES,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 09db8da261a3..7a7fdcdadf37 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -46,6 +46,7 @@ size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class class)
 	case XE_ENGINE_CLASS_COPY:
 	case XE_ENGINE_CLASS_VIDEO_DECODE:
 	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+	case XE_ENGINE_CLASS_OTHER:
 		return 2 * SZ_4K;
 	}
 }
-- 
2.41.0

