Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E942C3DA50
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 16:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486B010ED61;
	Fri, 12 Jul 2024 16:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jf1XL6Dz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2927110ED59
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720802858; x=1752338858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/JPqszU0XIaUloGQIaG0Xcqj75MBzLsTknSnXs0N7BI=;
 b=Jf1XL6Dz0NGGnnCvC7Rojk6kxJ1viN1+pPSQ7tqWiamt16ge7bE8rYz+
 Mm+PBmfa5O5xXy3vPUy+qcDTqJLVODd0KznSG+Scgjx4sEcDwlT+xj4g7
 P3q8Teypl6TFD9USf1PE47zuq7I5LCiE+5YseWJtnUCXuQk6zgxh8JvQh
 aIj7ZnlXmJYBTA0+pkc3uWAjYG8FXqKrMxyp0vnigOoH6rA/J6Y5Ybh5I
 f6vSBvXN+CWz3BuosvcZiwZQLa0fC8sLwL9YrQuD66hmFYtGQLS74Xvpx
 RB59vD4T8WWhC1Mm2oA/kqg5om650iU2WdbpfsCwBLwO+q2gazkQYlmtM w==;
X-CSE-ConnectionGUID: /nYvIRtOQvGTdoEX/1U/SQ==
X-CSE-MsgGUID: 50ttJ7ztS5OsLcwleSsfYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18382502"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="18382502"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 09:47:27 -0700
X-CSE-ConnectionGUID: XvrK6Z3pRpygxT+X+73QYg==
X-CSE-MsgGUID: m60AWhB9TcWmdozZZh60TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="72162016"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa002.fm.intel.com with ESMTP; 12 Jul 2024 09:47:27 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v12 2/5] drm/xe/guc: Add XE_LP steered register lists
Date: Fri, 12 Jul 2024 09:47:21 -0700
Message-Id: <20240712164724.677393-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240712164724.677393-1-zhanjun.dong@intel.com>
References: <20240712164724.677393-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_capture.c       | 159 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_capture_types.h |   2 +
 2 files changed, 159 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index f520c5fe0363..bf11cd2aaf25 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -106,6 +106,7 @@ static const struct __guc_mmio_reg_descr empty_regs_list[] = {
 		TO_GCAP_DEF_OWNER(regsowner), \
 		TO_GCAP_DEF_TYPE(regstype), \
 		class, \
+		NULL, \
 	}
 
 /* List of lists */
@@ -147,6 +148,11 @@ struct __guc_capture_ads_cache {
 
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
@@ -172,9 +178,137 @@ guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
 	return NULL;
 }
 
+static struct __guc_mmio_reg_descr_group *
+guc_capture_get_one_ext_list(struct __guc_mmio_reg_descr_group *reglists,
+			     u32 owner, u32 type, u32 id)
+{
+	int i;
+
+	if (!reglists)
+		return NULL;
+
+	for (i = 0; reglists[i].extlist; ++i) {
+		if (reglists[i].owner == owner && reglists[i].type == type &&
+		    (reglists[i].engine == id || reglists[i].type == GUC_STATE_CAPTURE_TYPE_GLOBAL))
+			return &reglists[i];
+	}
+
+	return NULL;
+}
+
+struct __ext_steer_reg {
+	const char *name;
+	struct xe_reg_mcr reg;
+};
+
+static const struct __ext_steer_reg xe_extregs[] = {
+	{"SAMPLER_INSTDONE",	SAMPLER_INSTDONE},
+	{"ROW_INSTDONE",	ROW_INSTDONE}
+};
+
+static const struct __ext_steer_reg xehpg_extregs[] = {
+	{"XEHPG_INSTDONE_GEOM_SVGUNIT", XEHPG_INSTDONE_GEOM_SVGUNIT}
+};
+
+static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
+			   const struct __ext_steer_reg *extlist,
+			   int slice_id, int subslice_id)
+{
+	ext->reg = XE_REG(extlist->reg.__reg.addr);
+	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
+	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, subslice_id);
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
+	newlist->extlist = list;
+	newlist->num_regs = num_regs;
+	newlist->owner = rootlist->owner;
+	newlist->engine = rootlist->engine;
+	newlist->type = rootlist->type;
+
+	return 0;
+}
+
+static void
+guc_capture_alloc_steered_lists(struct xe_guc *guc, const struct __guc_mmio_reg_descr_group *lists)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	u16 slice, subslice;
+	int iter, i, num_steer_regs, num_tot_regs = 0;
+	const struct __guc_mmio_reg_descr_group *list;
+	struct __guc_mmio_reg_descr_group *extlists;
+	struct __guc_mmio_reg_descr *extarray;
+	bool has_xehpg_extregs;
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
+	has_xehpg_extregs = GRAPHICS_VERx100(gt_to_xe(gt)) >= 1255;
+
+	num_steer_regs = ARRAY_SIZE(xe_extregs);
+	if (has_xehpg_extregs)
+		num_steer_regs += ARRAY_SIZE(xehpg_extregs);
+
+	num_tot_regs = num_steer_regs * bitmap_weight(gt->fuse_topo.g_dss_mask,
+						       sizeof(gt->fuse_topo.g_dss_mask) * 8);
+	if (!num_tot_regs)
+		return;
+
+	/* allocate an extra for an end marker */
+	extlists = drmm_kzalloc(drm, 2 * sizeof(struct __guc_mmio_reg_descr_group), GFP_KERNEL);
+	if (!extlists)
+		return;
+
+	if (__alloc_ext_regs(drm, &extlists[0], list, num_tot_regs)) {
+		drmm_kfree(drm, extlists);
+		return;
+	}
+
+	extarray = extlists[0].extlist;
+	for_each_dss_steering(iter, gt, slice, subslice) {
+		for (i = 0; i < ARRAY_SIZE(xe_extregs); ++i) {
+			__fill_ext_reg(extarray, &xe_extregs[i], slice, subslice);
+			++extarray;
+		}
+
+		if (has_xehpg_extregs) {
+			for (i = 0; i < ARRAY_SIZE(xehpg_extregs); ++i) {
+				__fill_ext_reg(extarray, &xehpg_extregs[i], slice, subslice);
+				++extarray;
+			}
+		}
+	}
+
+	xe_gt_dbg(guc_to_gt(guc), "capture found %d ext-regs.\n", num_tot_regs);
+	guc->capture->extlists = extlists;
+}
+
 static const struct __guc_mmio_reg_descr_group *
 guc_capture_get_device_reglist(struct xe_guc *guc)
 {
+	/*
+	 * For certain engine classes, there are slice and subslice
+	 * level registers requiring steering. We allocate and populate
+	 * these at init time based on hw config add it as an extension
+	 * list at the end of the pre-populated render list.
+	 */
+	guc_capture_alloc_steered_lists(guc, xe_lp_lists);
+
 	return xe_lp_lists;
 }
 
@@ -183,9 +317,11 @@ guc_capture_list_init(struct xe_guc *guc, u32 owner, u32 type,
 		      enum guc_capture_list_class_type capture_class, struct guc_mmio_reg *ptr,
 		      u16 num_entries)
 {
-	u32 i = 0;
+	u32 i = 0, j = 0;
 	const struct __guc_mmio_reg_descr_group *reglists = guc->capture->reglists;
+	struct __guc_mmio_reg_descr_group *extlists = guc->capture->extlists;
 	const struct __guc_mmio_reg_descr_group *match;
+	struct __guc_mmio_reg_descr_group *matchext;
 
 	if (!reglists)
 		return -ENODEV;
@@ -201,6 +337,17 @@ guc_capture_list_init(struct xe_guc *guc, u32 owner, u32 type,
 		ptr[i].mask = match->list[i].mask;
 	}
 
+	matchext = guc_capture_get_one_ext_list(extlists, owner, type, capture_class);
+	if (matchext) {
+		for (i = match->num_regs, j = 0; i < num_entries &&
+		     i < (match->num_regs + matchext->num_regs) &&
+			j < matchext->num_regs; ++i, ++j) {
+			ptr[i].offset = matchext->extlist[j].reg.addr;
+			ptr[i].value = 0xDEADF00D;
+			ptr[i].flags = matchext->extlist[j].flags;
+			ptr[i].mask = matchext->extlist[j].mask;
+		}
+	}
 	if (i < num_entries)
 		xe_gt_dbg(guc_to_gt(guc), "Got short capture reglist init: %d out %d.\n", i,
 			  num_entries);
@@ -213,12 +360,20 @@ guc_cap_list_num_regs(struct xe_guc_state_capture *gc, u32 owner, u32 type,
 		      enum guc_capture_list_class_type capture_class)
 {
 	const struct __guc_mmio_reg_descr_group *match;
+	struct __guc_mmio_reg_descr_group *matchext;
+	int num_regs;
 
 	match = guc_capture_get_one_list(gc->reglists, owner, type, capture_class);
 	if (!match)
 		return 0;
 
-	return match->num_regs;
+	num_regs = match->num_regs;
+
+	matchext = guc_capture_get_one_ext_list(gc->extlists, owner, type, capture_class);
+	if (matchext)
+		num_regs += matchext->num_regs;
+
+	return num_regs;
 }
 
 static int
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_types.h b/drivers/gpu/drm/xe/xe_guc_capture_types.h
index 839148c9fa0f..63cb4d7cf518 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture_types.h
@@ -50,6 +50,8 @@ struct __guc_mmio_reg_descr_group {
 	u32 type; /* see enum guc_state_capture_type */
 	/** @engine: The engine class */
 	u32 engine; /* see enum guc_capture_list_class_type */
+	/** @extlist: the list for steered registers */
+	struct __guc_mmio_reg_descr *extlist;
 };
 
 #endif
-- 
2.34.1

