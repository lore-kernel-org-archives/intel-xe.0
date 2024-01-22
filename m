Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F944C48287
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C97F10EFCE;
	Mon, 22 Jan 2024 21:26:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4788010EFBD
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705958763; x=1737494763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QoG4zEE2LZN4nRNGNMmKMLDD3ijQdwve0pf5ez2VEcQ=;
 b=nrCtDfFH7ibj+qW+ENoDuMPyPnTJhgGUfC9fb29iSUQi0QeVvXHNx1Xq
 naVqWOtxWyGmwLCoNR3GDomUm62nm3OG5xMC7/pY+0j/FsUvtY5BFDlGJ
 OCuRNDIwVWwQpSklOJzfMJc+QZ5ywrCuAtaK/QcxNTXvqt6aEwaQvWMLb
 zwPkw1Qt6LOnye4N44imnpkX/uMPi4ktFA68HKqMhrrltBagl3+X2DMq2
 n4Lydqt/TmHm8lFNeD/zntEcWdJLPpvOOhZ0x7r2goFc3/jqpPcL77Ozu
 x9j2EV6Al/aYJ+pGl6XfHy+DOIgsLgXE+GnvYP00bMOXXqs/2AMTZPvMZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432488198"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="432488198"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:26:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1432757"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa004.fm.intel.com with ESMTP; 22 Jan 2024 13:26:02 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 4/9] drm/xe/guc: Add XE_LP steered register lists
Date: Mon, 22 Jan 2024 13:25:52 -0800
Message-Id: <20240122212557.55929-5-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122212557.55929-1-zhanjun.dong@intel.com>
References: <20240122212557.55929-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_capture.c | 187 +++++++++++++++++++++++++++-
 1 file changed, 185 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 088dad7e53d8..7c647ad2cad5 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -94,6 +94,81 @@
 	{ SFC_DONE(2),		    0,      0, "SFC_DONE[2]" }, \
 	{ SFC_DONE(3),		    0,      0, "SFC_DONE[3]" }
 
+/* XE_LP Global */
+static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
+	COMMON_XELP_BASE_GLOBAL,
+};
+
+/* XE_LP Render / Compute Per-Class */
+static const struct __guc_mmio_reg_descr xe_lp_rc_class_regs[] = {
+	COMMON_XELP_BASE_RENDER,
+};
+
+/* Pre-Xe Render / Compute Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr pre_xe_rc_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/* Pre-Xe Media Decode/Encode Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr pre_xe_vd_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/* XE_LP Video Enhancement Per-Class */
+static const struct __guc_mmio_reg_descr xe_lp_vec_class_regs[] = {
+	COMMON_XELP_BASE_VEC,
+};
+
+/* Pre-Xe Video Enhancement Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr pre_xe_vec_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/* Pre-Xe Blitter Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr pre_xe_blt_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/* XE_LP - GSC Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/*
+ * Empty list to prevent warnings about unknown class/instance types
+ * as not all class/instanace types have entries on all platforms.
+ */
+static const struct __guc_mmio_reg_descr empty_regs_list[] = {
+};
+
+#define TO_GCAP_DEF_OWNER(x) (GUC_CAPTURE_LIST_INDEX_##x)
+#define TO_GCAP_DEF_TYPE(x) (GUC_CAPTURE_LIST_TYPE_##x)
+#define MAKE_REGLIST(regslist, regsowner, regstype, class) \
+	{ \
+		regslist, \
+		ARRAY_SIZE(regslist), \
+		TO_GCAP_DEF_OWNER(regsowner), \
+		TO_GCAP_DEF_TYPE(regstype), \
+		class, \
+		NULL, \
+	}
+
+/* List of lists */
+static const struct __guc_mmio_reg_descr_group xe_lp_lists[] = {
+	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
+	MAKE_REGLIST(xe_lp_rc_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(pre_xe_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
+	MAKE_REGLIST(pre_xe_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
+	MAKE_REGLIST(xe_lp_vec_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(pre_xe_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(pre_xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
+	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
+	{}
+};
+
 static const char * const capture_list_type_names[] = {
 	"Global",
 	"Class",
@@ -181,11 +256,119 @@ guc_capture_get_one_ext_list(struct __guc_mmio_reg_descr_group *reglists,
 	return NULL;
 }
 
+struct __ext_steer_reg {
+	const char *name;
+	struct xe_reg_mcr reg;
+};
+
+static const struct __ext_steer_reg pre_xe_extregs[] = {
+	{"SAMPLER_INSTDONE",	SAMPLER_INSTDONE},
+	{"ROW_INSTDONE",	ROW_INSTDONE}
+};
+
+static const struct __ext_steer_reg xehpg_extregs[] = {
+	{"XEHPG_INSTDONE_GEOM_SVG", XEHPG_INSTDONE_GEOM_SVG}
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
+__alloc_ext_regs(struct __guc_mmio_reg_descr_group *newlist,
+		 const struct __guc_mmio_reg_descr_group *rootlist, int num_regs)
+{
+	struct __guc_mmio_reg_descr *list;
+
+	list = kcalloc(num_regs, sizeof(struct __guc_mmio_reg_descr), GFP_KERNEL);
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
+	int slice, subslice, iter, i, num_steer_regs, num_tot_regs = 0;
+	const struct __guc_mmio_reg_descr_group *list;
+	struct __guc_mmio_reg_descr_group *extlists;
+	struct __guc_mmio_reg_descr *extarray;
+	bool has_xehpg_extregs;
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
+	num_steer_regs = ARRAY_SIZE(pre_xe_extregs);
+	if (has_xehpg_extregs)
+		num_steer_regs += ARRAY_SIZE(xehpg_extregs);
+
+	num_tot_regs += num_steer_regs * bitmap_weight(gt->fuse_topo.g_dss_mask,
+						       sizeof(gt->fuse_topo.g_dss_mask) * 8);
+	if (!num_tot_regs)
+		return;
+
+	/* allocate an extra for an end marker */
+	extlists = kcalloc(2, sizeof(struct __guc_mmio_reg_descr_group), GFP_KERNEL);
+	if (!extlists)
+		return;
+
+	if (__alloc_ext_regs(&extlists[0], list, num_tot_regs)) {
+		kfree(extlists);
+		return;
+	}
+
+	extarray = extlists[0].extlist;
+	for_each_ss_steering(iter, gt, slice, subslice) {
+		for (i = 0; i < ARRAY_SIZE(pre_xe_extregs); ++i) {
+			__fill_ext_reg(extarray, &pre_xe_extregs[i], slice, subslice);
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
-	//FIXME: add register list
-	return NULL;
+	/*
+	 * For certain engine classes, there are slice and subslice
+	 * level registers requiring steering. We allocate and populate
+	 * these at init time based on hw config add it as an extension
+	 * list at the end of the pre-populated render list.
+	 */
+	guc_capture_alloc_steered_lists(guc, xe_lp_lists);
+
+	return xe_lp_lists;
 }
 
 static int
-- 
2.34.1

