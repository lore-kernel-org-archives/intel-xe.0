Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3464C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 02:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790C810E27D;
	Tue, 20 Aug 2024 02:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hd/9bq15";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393D710E27D
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 02:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724119905; x=1755655905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nRGOe/W+SdWIJPjituprLpVt3nQtaQT1EzvkG0/f5IQ=;
 b=hd/9bq15fxRos7UReoQvxFymjGr91pwGJegI6cyhnh8mx6NtKtoDG3uI
 ROQ84j7TEvggeCYBlAodxnkZQpUV3jbD28Z5Hk8/p1dKeK3eG5voSFGv1
 eW01VrwIK7FMjEeQRYL5jny2t1oSd44VWQ0FCfpFh2yx8rRS2zZD7OC1t
 GjUWNDGDCT+1irgwR2yDN53kgUYB7yzfMEKCX98cqULqni+Oo9fnlR4YH
 ERusaUshV5dSmZoEBFRGFaVn3WmiNiOwkXN9ZL+nv9aOBqBNwX4oFhr0V
 55gzBvTWJ0YHRfN7VwsfqnBeh+kU+ebVAunfUBZQEQe0gdmliYNGBZ+S5 Q==;
X-CSE-ConnectionGUID: PoPCFEnvQbCnLUy21tvzmw==
X-CSE-MsgGUID: fe+VfwslS/eCzObi+gxFPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33780400"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="33780400"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 19:11:44 -0700
X-CSE-ConnectionGUID: Qktm9K4OSS6TKMQCUo9tJw==
X-CSE-MsgGUID: LE4+5UgLTP2ji4EUwj8+ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="61126098"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa007.jf.intel.com with ESMTP; 19 Aug 2024 19:11:45 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v16 2/7] drm/xe/guc: Add XE_LP steered register lists
Date: Mon, 19 Aug 2024 19:11:37 -0700
Message-Id: <20240820021142.436536-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820021142.436536-1-zhanjun.dong@intel.com>
References: <20240820021142.436536-1-zhanjun.dong@intel.com>
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

Add the ability for runtime allocation and freeing of
steered register list extentions that depend on the
detected HW config fuses.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c           |   1 +
 drivers/gpu/drm/xe/xe_guc_capture.c       | 195 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_capture.h       |   1 +
 drivers/gpu/drm/xe/xe_guc_capture_types.h |   2 +
 4 files changed, 188 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index d7dc47061535..3f3a911f4d3d 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -863,6 +863,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
 	guc_mmio_reg_state_init(ads);
 	guc_prep_golden_lrc_null(ads);
 	guc_mapping_table_init(gt, &info_map);
+	xe_guc_capture_steered_list_init(ads_to_guc(ads));
 	guc_capture_prep_lists(ads);
 	guc_doorbell_init(ads);
 	guc_waklv_init(ads);
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 0e75d1553730..78670ebf43d6 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -199,6 +199,11 @@ struct __guc_capture_ads_cache {
 
 struct xe_guc_state_capture {
 	const struct __guc_mmio_reg_descr_group *reglists;
+	/**
+	 * NOTE: steered registers have multiple instances depending on the HW configuration
+	 * (slices or dual-sub-slices) and thus depends on HW fuses discovered
+	 */
+	struct __guc_mmio_reg_descr_group *extlists;
 	struct __guc_capture_ads_cache ads_cache[GUC_CAPTURE_LIST_INDEX_MAX]
 						[GUC_STATE_CAPTURE_TYPE_MAX]
 						[GUC_CAPTURE_LIST_CLASS_MAX];
@@ -233,14 +238,132 @@ guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
 	return NULL;
 }
 
+struct __ext_steer_reg {
+	const char *name;
+	struct xe_reg_mcr reg;
+};
+
+static const struct __ext_steer_reg xe_extregs[] = {
+	{"SAMPLER_INSTDONE",		SAMPLER_INSTDONE},
+	{"ROW_INSTDONE",		ROW_INSTDONE}
+};
+
+static const struct __ext_steer_reg xehpg_extregs[] = {
+	{"SC_INSTDONE",			XEHPG_SC_INSTDONE},
+	{"SC_INSTDONE_EXTRA",		XEHPG_SC_INSTDONE_EXTRA},
+	{"SC_INSTDONE_EXTRA2",		XEHPG_SC_INSTDONE_EXTRA2},
+	{"INSTDONE_GEOM_SVGUNIT",	XEHPG_INSTDONE_GEOM_SVGUNIT}
+};
+
+static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
+			   const struct __ext_steer_reg *extlist,
+			   int slice_id, int subslice_id)
+{
+	if (!ext || !extlist)
+		return;
+
+	ext->reg = XE_REG(extlist->reg.__reg.addr);
+	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
+	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, subslice_id);
+	ext->regname = extlist->name;
+}
+
+static int
+__alloc_ext_regs(struct drm_device *drm, struct __guc_mmio_reg_descr_group *newlist,
+		 const struct __guc_mmio_reg_descr_group *rootlist, int num_regs)
+{
+	struct __guc_mmio_reg_descr *list;
+
+	list = drmm_kzalloc(drm, num_regs * sizeof(struct __guc_mmio_reg_descr), GFP_KERNEL);
+	if (!list)
+		return -ENOMEM;
+
+	newlist->list = list;
+	newlist->num_regs = num_regs;
+	newlist->owner = rootlist->owner;
+	newlist->engine = rootlist->engine;
+	newlist->type = rootlist->type;
+
+	return 0;
+}
+
+static int guc_capture_get_steer_reg_num(struct xe_device *xe)
+{
+	int num = ARRAY_SIZE(xe_extregs);
+
+	if (GRAPHICS_VERx100(xe) >= 1255)
+		num += ARRAY_SIZE(xehpg_extregs);
+
+	return num;
+}
+
+static void guc_capture_alloc_steered_lists(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	u16 slice, subslice;
+	int iter, i, total = 0;
+	const struct __guc_mmio_reg_descr_group *lists = guc->capture->reglists;
+	const struct __guc_mmio_reg_descr_group *list;
+	struct __guc_mmio_reg_descr_group *extlists;
+	struct __guc_mmio_reg_descr *extarray;
+	bool has_xehpg_extregs = GRAPHICS_VERx100(gt_to_xe(gt)) >= 1255;
+	struct drm_device *drm = &gt_to_xe(gt)->drm;
+
+	/* steered registers currently only exist for the render-class */
+	list = guc_capture_get_one_list(lists, GUC_CAPTURE_LIST_INDEX_PF,
+					GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
+					GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE);
+	/* skip if extlists was previously allocated */
+	if (!list || guc->capture->extlists)
+		return;
+
+	total = bitmap_weight(gt->fuse_topo.g_dss_mask, sizeof(gt->fuse_topo.g_dss_mask) * 8) *
+		guc_capture_get_steer_reg_num(guc_to_xe(guc));
+
+	if (!total)
+		return;
+
+	/* allocate an extra for an end marker */
+	extlists = drmm_kzalloc(drm, 2 * sizeof(struct __guc_mmio_reg_descr_group), GFP_KERNEL);
+	if (!extlists)
+		return;
+
+	if (__alloc_ext_regs(drm, &extlists[0], list, total)) {
+		drmm_kfree(drm, extlists);
+		return;
+	}
+
+	/* For steering registers, the list is generated at run-time */
+	extarray = (struct __guc_mmio_reg_descr *)extlists[0].list;
+	for_each_dss_steering(iter, gt, slice, subslice) {
+		for (i = 0; i < ARRAY_SIZE(xe_extregs); ++i) {
+			__fill_ext_reg(extarray, &xe_extregs[i], slice, subslice);
+			++extarray;
+		}
+
+		if (has_xehpg_extregs)
+			for (i = 0; i < ARRAY_SIZE(xehpg_extregs); ++i) {
+				__fill_ext_reg(extarray, &xehpg_extregs[i], slice, subslice);
+				++extarray;
+			}
+	}
+
+	extlists[0].num_regs = total;
+
+	xe_gt_dbg(guc_to_gt(guc), "capture found %d ext-regs.\n", total);
+	guc->capture->extlists = extlists;
+}
+
 static int
 guc_capture_list_init(struct xe_guc *guc, u32 owner, u32 type,
 		      enum guc_capture_list_class_type capture_class, struct guc_mmio_reg *ptr,
 		      u16 num_entries)
 {
-	u32 i = 0;
+	u32 ptr_idx = 0, list_idx = 0;
 	const struct __guc_mmio_reg_descr_group *reglists = guc->capture->reglists;
+	struct __guc_mmio_reg_descr_group *extlists = guc->capture->extlists;
 	const struct __guc_mmio_reg_descr_group *match;
+	u32 list_num;
 
 	if (!reglists)
 		return -ENODEV;
@@ -249,15 +372,27 @@ guc_capture_list_init(struct xe_guc *guc, u32 owner, u32 type,
 	if (!match)
 		return -ENODATA;
 
-	for (i = 0; i < num_entries && i < match->num_regs; ++i) {
-		ptr[i].offset = match->list[i].reg.addr;
-		ptr[i].value = 0xDEADF00D;
-		ptr[i].flags = match->list[i].flags;
-		ptr[i].mask = match->list[i].mask;
+	list_num = match->num_regs;
+	for (list_idx = 0; ptr_idx < num_entries && list_idx < list_num; ++list_idx, ++ptr_idx) {
+		ptr[ptr_idx].offset = match->list[list_idx].reg.addr;
+		ptr[ptr_idx].value = 0xDEADF00D;
+		ptr[ptr_idx].flags = match->list[list_idx].flags;
+		ptr[ptr_idx].mask = match->list[list_idx].mask;
 	}
 
-	if (i < num_entries)
-		xe_gt_dbg(guc_to_gt(guc), "Got short capture reglist init: %d out %d.\n", i,
+	match = guc_capture_get_one_list(extlists, owner, type, capture_class);
+	if (match)
+		for (ptr_idx = list_num, list_idx = 0; ptr_idx < num_entries &&
+		     ptr_idx < (list_num + match->num_regs) && list_idx < match->num_regs;
+		     ++ptr_idx, ++list_idx) {
+			ptr[ptr_idx].offset = match->list[list_idx].reg.addr;
+			ptr[ptr_idx].value = 0xDEADF00D;
+			ptr[ptr_idx].flags = match->list[list_idx].flags;
+			ptr[ptr_idx].mask = match->list[list_idx].mask;
+		}
+
+	if (ptr_idx < num_entries)
+		xe_gt_dbg(guc_to_gt(guc), "Got short capture reglist init: %d out %d.\n", ptr_idx,
 			  num_entries);
 
 	return 0;
@@ -268,12 +403,17 @@ guc_cap_list_num_regs(struct xe_guc_state_capture *gc, u32 owner, u32 type,
 		      enum guc_capture_list_class_type capture_class)
 {
 	const struct __guc_mmio_reg_descr_group *match;
+	int num_regs = 0;
 
 	match = guc_capture_get_one_list(gc->reglists, owner, type, capture_class);
-	if (!match)
-		return 0;
+	if (match)
+		num_regs = match->num_regs;
+
+	match = guc_capture_get_one_list(gc->extlists, owner, type, capture_class);
+	if (match)
+		num_regs += match->num_regs;
 
-	return match->num_regs;
+	return num_regs;
 }
 
 static int
@@ -472,6 +612,16 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
 						       GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
 						       j, &class_size) < 0)
 				class_size = 0;
+
+			/* Estimate steering register size for rcs/ccs */
+			if (j == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
+				int total = guc_capture_get_steer_reg_num(guc_to_xe(guc)) *
+					    XE_MAX_DSS_FUSE_BITS;
+
+				class_size += PAGE_ALIGN((sizeof(struct guc_debug_capture_list)) +
+							 (total * sizeof(struct guc_mmio_reg)));
+			}
+
 			if (xe_guc_capture_getlistsize(guc, i,
 						       GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE,
 						       j, &instance_size) < 0)
@@ -488,6 +638,29 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
 	return PAGE_ALIGN(total_size);
 }
 
+/*
+ * xe_guc_capture_steered_list_init - Init steering register list
+ * @guc: The GuC object
+ *
+ * Init steering register list for GuC register capture, alloc memory for
+ * capture data structure. Create pre-alloc node
+ *
+ * Returns: 0 if success.
+	    -ENOMEM if out of memory
+ */
+int xe_guc_capture_steered_list_init(struct xe_guc *guc)
+{
+	/*
+	 * For certain engine classes, there are slice and subslice
+	 * level registers requiring steering. We allocate and populate
+	 * these based on hw config and add it as an extension list at
+	 * the end of the pre-populated render list.
+	 */
+	guc_capture_alloc_steered_lists(guc);
+
+	return 0;
+}
+
 /**
  * xe_guc_capture_init - Init for GuC register capture
  * @guc: The GuC object
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index 55c1cedcb923..c2091c6ddb68 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -43,6 +43,7 @@ int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type,
 			       enum guc_capture_list_class_type capture_class, size_t *size);
 int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
 size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
+int xe_guc_capture_steered_list_init(struct xe_guc *guc);
 int xe_guc_capture_init(struct xe_guc *guc);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_types.h b/drivers/gpu/drm/xe/xe_guc_capture_types.h
index 2057125b1bfa..804731c2ee04 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture_types.h
@@ -63,6 +63,8 @@ struct __guc_mmio_reg_descr_group {
 	u32 type;
 	/** @engine: The engine class, see enum guc_capture_list_class_type */
 	u32 engine;
+	/** @extlist: the list for steered registers */
+	struct __guc_mmio_reg_descr *extlist;
 };
 
 #endif
-- 
2.34.1

