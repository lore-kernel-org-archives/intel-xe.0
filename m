Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1F9E7F145
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 22:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E3110E45C;
	Tue, 26 Sep 2023 22:36:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0942E10E45D
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 22:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695767786; x=1727303786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IWMqQ1ThMDxz/hrX4CsZypYswXDr6zDWy6twx2AbVOI=;
 b=IWQWH4anR6z+MTkI5pBTtYEPB82PMPvT89bxOyiAlOQ5sDf0uNeUedAi
 pvYXvwvRdyw2i+FbvzoZUSnJMautlREdne57cGfPtrLXksLh864ZwXBF7
 65yvW5+mMucb24djwqMraSxdKGlkX8b9pNTIlXb60cONyZelD+2Pns6Nm
 f3yhHfnEnPxx7HE3gd/FecZFPBnpaokVyi2Jfjr1bp8d52IcsIbe4dFBL
 gllOTDUx9eqcl7l9r05aHr8V58RPF7rdzcr4WiFr56zxI7yEZ7dQft5jM
 M42wLEMwcJ5/bCi+FkTGVKjq5OQUNiZFHWrf4XnrtTJphwCO0ppj29MBc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412597210"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="412597210"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752343374"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="752343374"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:36:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 15:36:25 -0700
Message-Id: <20230926223631.2807873-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230926223631.2807873-1-lucas.demarchi@intel.com>
References: <20230926223631.2807873-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 05/11] drm/xe: Use vfunc to initialize PAT
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Split the PAT initialization between SW-only and HW. The _early() only
sets up the ops and data structure that are used later to program the
tables. This allows the PAT to be easily extended to other platforms.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  3 ++
 drivers/gpu/drm/xe/xe_device_types.h | 13 ++++++
 drivers/gpu/drm/xe/xe_pat.c          | 59 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_pat.h          | 11 ++++++
 4 files changed, 72 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 687dc3d79a66..046b7a087451 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -26,6 +26,7 @@
 #include "xe_irq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_pat.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_query.h"
@@ -276,6 +277,8 @@ int xe_device_probe(struct xe_device *xe)
 	int err;
 	u8 id;
 
+	xe_pat_init_early(xe);
+
 	xe->info.mem_region_mask = 1;
 	err = xe_display_init_nommio(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32ab0fea04ee..98835ee058f5 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -25,6 +25,7 @@
 #endif
 
 struct xe_ggtt;
+struct xe_pat_ops;
 
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
@@ -331,6 +332,18 @@ struct xe_device {
 		atomic_t ref;
 	} mem_access;
 
+	/**
+	 * @pat: Encapsulate PAT related stuff
+	 */
+	struct {
+		/** Internal operations to abstract platforms */
+		const struct xe_pat_ops *ops;
+		/** PAT table to program in the HW */
+		const u32 *table;
+		/** Number of PAT entries */
+		int n_entries;
+	} pat;
+
 	/** @d3cold: Encapsulate d3cold related stuff */
 	struct {
 		/** capable: Indicates if root port is d3cold capable */
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 71e0e047fff3..86386633e206 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -32,6 +32,11 @@
 #define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
 #define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
 
+struct xe_pat_ops {
+	void (*program_graphics)(struct xe_gt *gt, const u32 table[], int n_entries);
+	void (*program_media)(struct xe_gt *gt, const u32 table[], int n_entries);
+};
+
 static const u32 tgl_pat_table[] = {
 	[0] = TGL_PAT_WB,
 	[1] = TGL_PAT_WC,
@@ -80,24 +85,37 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
 	}
 }
 
-void xe_pat_init(struct xe_gt *gt)
-{
-	struct xe_device *xe = gt_to_xe(gt);
+static const struct xe_pat_ops tgl_pat_ops = {
+	.program_graphics = program_pat,
+};
+
+static const struct xe_pat_ops pvc_pat_ops = {
+	.program_graphics = program_pat_mcr,
+};
+
+/*
+ * SAMedia register offsets are adjusted by the write methods and they target
+ * registers that are not MCR, while for normal GT they are MCR
+ */
+static const struct xe_pat_ops mtl_pat_ops = {
+	.program_graphics = program_pat,
+	.program_media = program_pat_mcr,
+};
 
+void xe_pat_init_early(struct xe_device *xe)
+{
 	if (xe->info.platform == XE_METEORLAKE) {
-		/*
-		 * SAMedia register offsets are adjusted by the write methods
-		 * and they target registers that are not MCR, while for normal
-		 * GT they are MCR
-		 */
-		if (xe_gt_is_media_type(gt))
-			program_pat(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
-		else
-			program_pat_mcr(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
+		xe->pat.ops = &mtl_pat_ops;
+		xe->pat.table = mtl_pat_table;
+		xe->pat.n_entries = ARRAY_SIZE(mtl_pat_table);
 	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
-		program_pat_mcr(gt, pvc_pat_table, ARRAY_SIZE(pvc_pat_table));
+		xe->pat.ops = &pvc_pat_ops;
+		xe->pat.table = pvc_pat_table;
+		xe->pat.n_entries = ARRAY_SIZE(pvc_pat_table);
 	} else if (GRAPHICS_VERx100(xe) <= 1210) {
-		program_pat(gt, tgl_pat_table, ARRAY_SIZE(tgl_pat_table));
+		xe->pat.ops = &tgl_pat_ops;
+		xe->pat.table = tgl_pat_table;
+		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
 	} else {
 		/*
 		 * Going forward we expect to need new PAT settings for most
@@ -111,3 +129,16 @@ void xe_pat_init(struct xe_gt *gt)
 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
 	}
 }
+
+void xe_pat_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!xe->pat.ops)
+		return;
+
+	if (xe_gt_is_media_type(gt))
+		xe->pat.ops->program_media(gt, xe->pat.table, xe->pat.n_entries);
+	else
+		xe->pat.ops->program_graphics(gt, xe->pat.table, xe->pat.n_entries);
+}
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 659de4008131..744318cab69b 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -7,7 +7,18 @@
 #define _XE_PAT_H_
 
 struct xe_gt;
+struct xe_device;
 
+/**
+ * xe_pat_init_early - SW initialization, setting up data based on device
+ * @xe: xe device
+ */
+void xe_pat_init_early(struct xe_device *xe);
+
+/**
+ * xe_pat_init_early - Program HW PAT table
+ * @gt: GT structure
+ */
 void xe_pat_init(struct xe_gt *gt);
 
 #endif
-- 
2.40.1

