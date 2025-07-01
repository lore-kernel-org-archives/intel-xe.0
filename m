Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB06C8303A
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 12:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848F710E58E;
	Tue,  1 Jul 2025 12:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7JPa7m2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D91D10E59F
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751374621; x=1782910621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NRV7PiaHELRXD3k/xK2wC1haMPrNlmL/EYxhUAoCnPw=;
 b=Q7JPa7m2FNayvQ5PKi0rP5O4Z6E2abNCoHPhRRODlsbEokbKa4obm5m1
 uDJ+P5n6USfkf5N2W2A4WyhqmjZ3+WuPOGza/VJYeD/cFa6c77eWLNsV7
 E7vzze95qkKQ2dqyyF+ZnLxQSu1PsHhKsS09rkmfX/n4EA17Br/ivsTgj
 EP8qcYO2E9ayUw0yfdt6IyfloKAjpr3iXoiNOPFFZaMXoUHzhxf7mAdGx
 POlSuuAtwSURmoGOh/YHvX5El4OmIWU6ivofMYIMsDGAW+1sk34iH3dvp
 vc9EjqAvVdZPvazhkEfvwt6OHrgdT+n6qNN6QrGfkLOXeH3S0fSLKSD4C w==;
X-CSE-ConnectionGUID: 0+G915PnS8aPNCvbEYnrzw==
X-CSE-MsgGUID: nWQwgisLSeCSIPe0AWguhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53745199"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53745199"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:57:01 -0700
X-CSE-ConnectionGUID: +XLh4HWQR9WSVwlJuQJ8Vw==
X-CSE-MsgGUID: wt3Z1nYIQmu7maMQ76j7FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153236560"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.176])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:57:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 4/7] drm/xe: Introduce xe_gt_is_main_type helper
Date: Tue,  1 Jul 2025 14:56:43 +0200
Message-Id: <20250701125646.1568-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250701125646.1568-1-michal.wajdeczko@intel.com>
References: <20250701125646.1568-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Instead of checking for not being a media type GT provide a small
helper to explicitly express our intentions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: rebased
---
 drivers/gpu/drm/xe/xe_bb.c                  |  2 +-
 drivers/gpu/drm/xe/xe_force_wake.c          |  2 +-
 drivers/gpu/drm/xe/xe_gt.c                  | 12 ++++-----
 drivers/gpu/drm/xe/xe_gt.h                  |  5 ++++
 drivers/gpu/drm/xe/xe_gt_idle.c             |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 30 ++++++++++-----------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  4 +--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |  6 ++---
 drivers/gpu/drm/xe/xe_irq.c                 |  4 +--
 drivers/gpu/drm/xe/xe_oa.c                  |  6 ++---
 10 files changed, 39 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 9570672fce33..5ce0e26822f2 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -19,7 +19,7 @@ static int bb_prefetch(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (GRAPHICS_VERx100(xe) >= 1250 && !xe_gt_is_media_type(gt))
+	if (GRAPHICS_VERx100(xe) >= 1250 && xe_gt_is_main_type(gt))
 		/*
 		 * RCS and CCS require 1K, although other engines would be
 		 * okay with 512.
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 8a5cba22b586..c59a9b330697 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -64,7 +64,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 {
 	int i, j;
 
-	if (!xe_gt_is_media_type(gt))
+	if (xe_gt_is_main_type(gt))
 		init_domain(fw, XE_FW_DOMAIN_ID_RENDER,
 			    FORCEWAKE_RENDER,
 			    FORCEWAKE_ACK_RENDER);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d397df056e4c..e57e0a351224 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -112,7 +112,7 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 	if (!fw_ref)
 		return;
 
-	if (!xe_gt_is_media_type(gt)) {
+	if (xe_gt_is_main_type(gt)) {
 		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
 		reg |= CG_DIS_CNTLBUS;
 		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
@@ -470,7 +470,7 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	xe_gt_mcr_init(gt);
 	xe_gt_enable_host_l2_vram(gt);
 
-	if (!xe_gt_is_media_type(gt)) {
+	if (xe_gt_is_main_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
 		if (err)
 			goto err_force_wake;
@@ -547,7 +547,7 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	if (!xe_gt_is_media_type(gt)) {
+	if (xe_gt_is_main_type(gt)) {
 		/*
 		 * USM has its only SA pool to non-block behind user operations
 		 */
@@ -563,7 +563,7 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 		}
 	}
 
-	if (!xe_gt_is_media_type(gt)) {
+	if (xe_gt_is_main_type(gt)) {
 		struct xe_tile *tile = gt_to_tile(gt);
 
 		tile->migrate = xe_migrate_init(tile);
@@ -583,7 +583,7 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 		xe_gt_apply_ccs_mode(gt);
 	}
 
-	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
+	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_is_main_type(gt))
 		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
 
 	if (IS_SRIOV_PF(gt_to_xe(gt))) {
@@ -780,7 +780,7 @@ static int do_gt_restart(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
+	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_is_main_type(gt))
 		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
 
 	if (IS_SRIOV_PF(gt_to_xe(gt)))
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 8128ddfdd788..e9ccab8aedbe 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -106,6 +106,11 @@ static inline bool xe_gt_has_indirect_ring_state(struct xe_gt *gt)
 	       xe_device_uc_enabled(gt_to_xe(gt));
 }
 
+static inline bool xe_gt_is_main_type(struct xe_gt *gt)
+{
+	return gt->info.type == XE_GT_TYPE_MAIN;
+}
+
 static inline bool xe_gt_is_media_type(struct xe_gt *gt)
 {
 	return gt->info.type == XE_GT_TYPE_MEDIA;
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index c11206410a4d..ffb210216aa9 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -121,7 +121,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	if (vcs_mask || vecs_mask)
 		gtidle->powergate_enable = MEDIA_POWERGATE_ENABLE;
 
-	if (!xe_gt_is_media_type(gt))
+	if (xe_gt_is_main_type(gt))
 		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
 
 	if (xe->info.platform != XE_DG1) {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index d186f780885d..df19008c45c5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -376,7 +376,7 @@ static u64 pf_get_spare_ggtt(struct xe_gt *gt)
 {
 	u64 spare;
 
-	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
@@ -388,7 +388,7 @@ static u64 pf_get_spare_ggtt(struct xe_gt *gt)
 
 static int pf_set_spare_ggtt(struct xe_gt *gt, u64 size)
 {
-	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
@@ -443,7 +443,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	int err;
 
 	xe_gt_assert(gt, vfid);
-	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 
 	size = round_up(size, alignment);
@@ -492,7 +492,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 	struct xe_ggtt_node *node = config->ggtt_region;
 
-	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
 }
 
@@ -560,7 +560,7 @@ int xe_gt_sriov_pf_config_set_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size
 {
 	int err;
 
-	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 	if (vfid)
@@ -622,7 +622,7 @@ int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt, unsigned int vfid,
 	int err = 0;
 
 	xe_gt_assert(gt, vfid);
-	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 
 	if (!num_vfs)
 		return 0;
@@ -693,7 +693,7 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
 
 	xe_gt_assert(gt, vfid);
 	xe_gt_assert(gt, num_vfs);
-	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 	fair = pf_estimate_fair_ggtt(gt, num_vfs);
@@ -1406,7 +1406,7 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 static void pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_config *config)
 {
 	xe_gt_assert(gt, IS_DGFX(gt_to_xe(gt)));
-	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
 	if (config->lmem_obj) {
@@ -1425,7 +1425,7 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 
 	xe_gt_assert(gt, vfid);
 	xe_gt_assert(gt, IS_DGFX(xe));
-	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 
 	size = round_up(size, pf_get_lmem_alignment(gt));
 
@@ -1552,7 +1552,7 @@ int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid,
 	int err = 0;
 
 	xe_gt_assert(gt, vfid);
-	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 
 	if (!num_vfs)
 		return 0;
@@ -1629,7 +1629,7 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 
 	xe_gt_assert(gt, vfid);
 	xe_gt_assert(gt, num_vfs);
-	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 
 	if (!xe_device_has_lmtt(gt_to_xe(gt)))
 		return 0;
@@ -1663,7 +1663,7 @@ int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, vfid);
 	xe_gt_assert(gt, num_vfs);
 
-	if (!xe_gt_is_media_type(gt)) {
+	if (xe_gt_is_main_type(gt)) {
 		err = xe_gt_sriov_pf_config_set_fair_ggtt(gt, vfid, num_vfs);
 		result = result ?: err;
 		err = xe_gt_sriov_pf_config_set_fair_lmem(gt, vfid, num_vfs);
@@ -1991,7 +1991,7 @@ static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (!xe_gt_is_media_type(gt)) {
+	if (xe_gt_is_main_type(gt)) {
 		pf_release_vf_config_ggtt(gt, config);
 		if (IS_DGFX(xe)) {
 			pf_release_vf_config_lmem(gt, config);
@@ -2082,7 +2082,7 @@ static int pf_sanitize_vf_resources(struct xe_gt *gt, u32 vfid, long timeout)
 	 * Only GGTT and LMEM requires to be cleared by the PF.
 	 * GuC doorbell IDs and context IDs do not need any clearing.
 	 */
-	if (!xe_gt_is_media_type(gt)) {
+	if (xe_gt_is_main_type(gt)) {
 		pf_sanitize_ggtt(config->ggtt_region, vfid);
 		if (IS_DGFX(xe))
 			err = pf_sanitize_lmem(tile, config->lmem_obj, timeout);
@@ -2149,7 +2149,7 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt *primary_gt = gt_to_tile(gt)->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
-	bool is_primary = !xe_gt_is_media_type(gt);
+	bool is_primary = xe_gt_is_main_type(gt);
 	bool valid_ggtt, valid_ctxs, valid_dbs;
 	bool valid_any, valid_all;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 13970d5a2867..9b7772928d62 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -305,7 +305,7 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
 	xe_gt_assert(gt, gt == extract_gt(parent));
 	xe_gt_assert(gt, vfid == extract_vfid(parent));
 
-	if (!xe_gt_is_media_type(gt)) {
+	if (xe_gt_is_main_type(gt)) {
 		debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
 					   0644, parent, parent, &ggtt_fops);
 		if (xe_device_has_lmtt(gt_to_xe(gt)))
@@ -554,7 +554,7 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 	pfdentry->d_inode->i_private = gt;
 
 	drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), pfdentry, minor);
-	if (!xe_gt_is_media_type(gt)) {
+	if (xe_gt_is_main_type(gt)) {
 		drm_debugfs_create_files(pf_ggtt_info,
 					 ARRAY_SIZE(pf_ggtt_info),
 					 pfdentry, minor);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 93cd26dca070..d65eafd91b17 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -552,7 +552,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
-	if (IS_DGFX(xe) && !xe_gt_is_media_type(gt)) {
+	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
 		err = vf_get_lmem_info(gt);
 		if (unlikely(err))
 			return err;
@@ -649,7 +649,7 @@ s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
-	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 
 	return config->ggtt_shift;
 }
@@ -1036,7 +1036,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 
 	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
 
-	if (IS_DGFX(xe) && !xe_gt_is_media_type(gt)) {
+	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
 		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
 		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
 	}
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 1e6540ce9914..14bbc6aae40c 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -160,7 +160,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 	dmask = irqs << 16 | irqs;
 	smask = irqs << 16;
 
-	if (!xe_gt_is_media_type(gt)) {
+	if (xe_gt_is_main_type(gt)) {
 		/* Enable interrupts for each engine class */
 		xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
 		if (ccs_mask)
@@ -260,7 +260,7 @@ gt_engine_identity(struct xe_device *xe,
 static void
 gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
 {
-	if (instance == OTHER_GUC_INSTANCE && !xe_gt_is_media_type(gt))
+	if (instance == OTHER_GUC_INSTANCE && xe_gt_is_main_type(gt))
 		return xe_guc_irq_handler(&gt->uc.guc, iir);
 	if (instance == OTHER_MEDIA_GUC_INSTANCE && xe_gt_is_media_type(gt))
 		return xe_guc_irq_handler(&gt->uc.guc, iir);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a3379d39f76d..d991fbd90f20 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2493,7 +2493,7 @@ int xe_oa_register(struct xe_device *xe)
 
 static u32 num_oa_units_per_gt(struct xe_gt *gt)
 {
-	if (!xe_gt_is_media_type(gt) || GRAPHICS_VER(gt_to_xe(gt)) < 20)
+	if (xe_gt_is_main_type(gt) || GRAPHICS_VER(gt_to_xe(gt)) < 20)
 		return 1;
 	else if (!IS_DGFX(gt_to_xe(gt)))
 		return XE_OAM_UNIT_SCMI_0 + 1; /* SAG + SCMI_0 */
@@ -2506,7 +2506,7 @@ static u32 __hwe_oam_unit(struct xe_hw_engine *hwe)
 	if (GRAPHICS_VERx100(gt_to_xe(hwe->gt)) < 1270)
 		return XE_OA_UNIT_INVALID;
 
-	xe_gt_WARN_ON(hwe->gt, !xe_gt_is_media_type(hwe->gt));
+	xe_gt_WARN_ON(hwe->gt, xe_gt_is_main_type(hwe->gt));
 
 	if (GRAPHICS_VER(gt_to_xe(hwe->gt)) < 20)
 		return 0;
@@ -2589,7 +2589,7 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
 	for (i = 0; i < num_units; i++) {
 		struct xe_oa_unit *u = &gt->oa.oa_unit[i];
 
-		if (!xe_gt_is_media_type(gt)) {
+		if (xe_gt_is_main_type(gt)) {
 			u->regs = __oag_regs();
 			u->type = DRM_XE_OA_UNIT_TYPE_OAG;
 		} else {
-- 
2.47.1

