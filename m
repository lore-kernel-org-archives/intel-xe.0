Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60DFC2BD09
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 21:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4760310E155;
	Mon, 24 Jun 2024 21:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVBcVow5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F8710E1EC
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 21:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719266050; x=1750802050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MNgcALnOCgrBFE4+X1keFoSKqHAaVHCMSlc3oZxy+XA=;
 b=QVBcVow5N9hjLuttQ6i3k3KoCy+3FczOzfHHMlscASp5KwS8Ql/om54A
 2ejxUiF0EbI3SmAjpkWCRE6+Q4YcTHWATkY+A9qR7gFEbAOOmfN9lTsaJ
 l99ZCvHei9HuV58DAfmJt5w3ChHC+d8XUlSNZEGiDp7azc7OtDAM2uYUe
 iNS7Gu/2Wv/FgqHSccyEELRYHV/iBerHNdgdxjbymu+PeeRGJ/gmt6YbN
 GnlVxyTA5s/UKwtk5xIJyDQrpR6LlAobsB2Xjtgo82CtAX9or8aE+QVPK
 eTBT0tumVatmVZ3DjlgtXNn+amyUDSu4JGjpzF2TQWLnA2HXxn092Hj2G g==;
X-CSE-ConnectionGUID: 2RMlixq5SPm1xONEZvyxsw==
X-CSE-MsgGUID: f89xtC8eTsKOr/w73c9A5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="20073725"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="20073725"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 14:54:09 -0700
X-CSE-ConnectionGUID: M2Au1+1MSkOX+qH53w2DmQ==
X-CSE-MsgGUID: rXeUBj9DSu+ECOHtWSZYpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="43532245"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa010.fm.intel.com with ESMTP; 24 Jun 2024 14:54:07 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH v11 2/5] drm/xe/guc: Add XE_LP steered register lists
Date: Mon, 24 Jun 2024 14:54:01 -0700
Message-Id: <20240624215404.3213075-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624215404.3213075-1-zhanjun.dong@intel.com>
References: <20240624215404.3213075-1-zhanjun.dong@intel.com>
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
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c       | 155 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_capture.h       |   1 +
 drivers/gpu/drm/xe/xe_guc_capture_types.h |   8 ++
 3 files changed, 162 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 172edcfd7c00..9c473aceb402 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -106,6 +106,7 @@ static const struct __guc_mmio_reg_descr empty_regs_list[] = {
 		TO_GCAP_DEF_OWNER(regsowner), \
 		TO_GCAP_DEF_TYPE(regstype), \
 		class, \
+		NULL, \
 	}
 
 /* List of lists */
@@ -156,9 +157,138 @@ guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
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
 
@@ -166,9 +296,11 @@ static int
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
@@ -184,6 +316,17 @@ guc_capture_list_init(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
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
@@ -195,12 +338,20 @@ static int
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
index 232f60fc9a20..ead5a1d2b5ad 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -33,6 +33,7 @@ struct __guc_mmio_reg_descr_group {
 	u32 owner; /* see enum guc_capture_owner */
 	u32 type; /* see enum guc_capture_type */
 	u32 engine; /* as per MAX_ENGINE_CLASS */
+	struct __guc_mmio_reg_descr *extlist; /* only used for steered registers */
 };
 
 int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr);
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_types.h b/drivers/gpu/drm/xe/xe_guc_capture_types.h
index b2e78ab53e2e..0eedb539348a 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture_types.h
@@ -35,6 +35,14 @@ struct xe_guc_state_capture {
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

