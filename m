Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27FBC27C65
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 00:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BDD10EB26;
	Fri,  7 Jun 2024 00:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maWCVBcd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F1B10E12B
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 00:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717718854; x=1749254854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zu1eYk041Zg3UGQssLbJ2MzVL14vvEJr1wMQOUqCZLU=;
 b=maWCVBcdJ6NSrS5sQbti0DtAcLgFmF4Hi8K0XkH5FfFi8XG3VhohMnB3
 oHWhfZZgPQ4RciaxFTSPjV0MjMrCjihczTrPuwOUT9XQQMXPvPrGdzzIR
 6gdoBoCdyOwt0h2PU7L3QhSohwDsAt8ynisAED7lhT+ZxfnHzvrJDLLGt
 8+euVTP8iNj0hIex0Ww92lcpG3bXXnmyL0hOzx5VLRD8bBKJQYJn9B81r
 k4U6klKt6TJQQCIwXBWUs58M5nHPHD1joMKkQ6mttIB/fwPZbvuwOtW+L
 3m3QRrX2/l+nsHoczYuq/FzHAQ7sV9BnPrnPr1poOQu5gkDR8Khlsk6o7 g==;
X-CSE-ConnectionGUID: 1LLmsJ5dTvSBH+uuiiParw==
X-CSE-MsgGUID: 4il9Kf2gSEGDQg5hxMlDmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="39826249"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="39826249"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 17:07:32 -0700
X-CSE-ConnectionGUID: olh+t6vKQDGIFxK554+xtQ==
X-CSE-MsgGUID: MFE4BBwOTaSS3Ah5MWFzSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="43241374"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa004.jf.intel.com with ESMTP; 06 Jun 2024 17:07:33 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v9 2/4] drm/xe/guc: Add XE_LP steered register lists
Date: Thu,  6 Jun 2024 17:07:17 -0700
Message-Id: <20240607000719.1012422-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607000719.1012422-1-zhanjun.dong@intel.com>
References: <20240607000719.1012422-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_capture.c      | 155 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_capture.h      |   1 +
 drivers/gpu/drm/xe/xe_guc_capture_fwif.h |   8 ++
 3 files changed, 162 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 19bd79285061..951408846c97 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -105,6 +105,7 @@ static const struct __guc_mmio_reg_descr empty_regs_list[] = {
 		TO_GCAP_DEF_OWNER(regsowner), \
 		TO_GCAP_DEF_TYPE(regstype), \
 		class, \
+		NULL, \
 	}
 
 /* List of lists */
@@ -165,9 +166,138 @@ guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
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
+		    (reglists[i].engine == id || reglists[i].type == GUC_CAPTURE_LIST_TYPE_GLOBAL))
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
+					GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
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
 
@@ -175,9 +305,11 @@ static int
 guc_capture_list_init(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
 		      struct guc_mmio_reg *ptr, u16 num_entries)
 {
-	u32 i = 0;
+	u32 i = 0, j = 0;
 	const struct __guc_mmio_reg_descr_group *reglists = guc->capture->reglists;
+	struct __guc_mmio_reg_descr_group *extlists = guc->capture->extlists;
 	const struct __guc_mmio_reg_descr_group *match;
+	struct __guc_mmio_reg_descr_group *matchext;
 
 	if (!reglists)
 		return -ENODEV;
@@ -193,6 +325,17 @@ guc_capture_list_init(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
 		ptr[i].mask = match->list[i].mask;
 	}
 
+	matchext = guc_capture_get_one_ext_list(extlists, owner, type, classid);
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
@@ -204,12 +347,20 @@ static int
 guc_cap_list_num_regs(struct xe_guc_state_capture *gc, u32 owner, u32 type, u32 classid)
 {
 	const struct __guc_mmio_reg_descr_group *match;
+	struct __guc_mmio_reg_descr_group *matchext;
+	int num_regs;
 
 	match = guc_capture_get_one_list(gc->reglists, owner, type, classid);
 	if (!match)
 		return 0;
 
-	return match->num_regs;
+	num_regs = match->num_regs;
+
+	matchext = guc_capture_get_one_ext_list(gc->extlists, owner, type, classid);
+	if (matchext)
+		num_regs += matchext->num_regs;
+
+	return num_regs;
 }
 
 static int
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index ba3e0aabee01..a62b1dbd47a6 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -33,6 +33,7 @@ struct __guc_mmio_reg_descr_group {
 	u32 owner; /* see enum guc_capture_owner */
 	u32 type; /* see enum guc_capture_type */
 	u32 engine; /* as per MAX_ENGINE_CLASS */
+	struct __guc_mmio_reg_descr *extlist; /* only used for steered registers */
 };
 
 int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr);
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
index 1b08388b0b94..199e3c0108a4 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
@@ -100,6 +100,14 @@ struct xe_guc_state_capture {
 	 */
 	const struct __guc_mmio_reg_descr_group *reglists;
 
+	/**
+	 * @extlists: allocated table of steered register lists used for error-capture state.
+	 *
+	 * NOTE: steered registers have multiple instances depending on the HW configuration
+	 * (slices or dual-sub-slices) and thus depends on HW fuses discovered at startup
+	 */
+	struct __guc_mmio_reg_descr_group *extlists;
+
 	/**
 	 * @ads_cache: cached register lists that is ADS format ready
 	 */
-- 
2.34.1

