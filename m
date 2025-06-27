Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CC4C7EE3A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 12:49:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004FB10EA17;
	Fri, 27 Jun 2025 12:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmF0NN32";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EB910EA16
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 12:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751028572; x=1782564572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ljHv6CIKYSPkdS5sx6vev1EXm8UqLIXAq69Q7CDTdkE=;
 b=UmF0NN32cFckWYlB/h0b1CrXefL/thFU/kIFbJ0rJT2zXyMzumv7T5yN
 LtnO9SmjAJLU6oHM3swFtZdPiW/4KgGYREKB8hU3oC+kuJ0JVViIl0dXV
 41/XbbOfHdHHRybnagmUd3RBwUz+aDhq8BtNzjZnp9bMfm7ffvuTWuG8f
 A8K8LGifIUxA7Lc4sCrtzuPHtyXUvI17lhOESmcbfISBKjgsLl5D9zMxi
 zstHc9quLA0AwMnWoxx+6sM1vP+GAdzA8LKd45dkxxiHp25LWq20ZrH6O
 ANMUZ/6nmG/wjJ1GlYOZ8gKjN1bAzKbvlSo7BjOIYORAejOcQqcfThSe0 Q==;
X-CSE-ConnectionGUID: Hl5oJJjpRQKq5FA56LLzUA==
X-CSE-MsgGUID: kfKwto/jRAij4Lw1AlP8Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64031918"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="64031918"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:49:32 -0700
X-CSE-ConnectionGUID: Zr893LyWT4qWLllfzmFOqg==
X-CSE-MsgGUID: RHsJ5yW4R3KTTx9/5m4MvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152969716"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:49:31 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 4/7] drm/xe: Introduce xe_gt_is_main_type helper
Date: Fri, 27 Jun 2025 14:49:13 +0200
Message-Id: <20250627124916.1392-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250627124916.1392-1-michal.wajdeczko@intel.com>
References: <20250627124916.1392-1-michal.wajdeczko@intel.com>
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

Instead of checking for not being a media type GT provide a small
helper to explicitly express our intentions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
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
index 9752a38c0162..387535748aa9 100644
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
@@ -442,7 +442,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (!fw_ref)
 		return -ETIMEDOUT;
 
-	if (!xe_gt_is_media_type(gt)) {
+	if (xe_gt_is_main_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
 		if (err)
 			goto err_force_wake;
@@ -518,7 +518,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	if (!xe_gt_is_media_type(gt)) {
+	if (xe_gt_is_main_type(gt)) {
 		/*
 		 * USM has its only SA pool to non-block behind user operations
 		 */
@@ -534,7 +534,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		}
 	}
 
-	if (!xe_gt_is_media_type(gt)) {
+	if (xe_gt_is_main_type(gt)) {
 		struct xe_tile *tile = gt_to_tile(gt);
 
 		tile->migrate = xe_migrate_init(tile);
@@ -554,7 +554,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		xe_gt_apply_ccs_mode(gt);
 	}
 
-	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
+	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_is_main_type(gt))
 		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
 
 	if (IS_SRIOV_PF(gt_to_xe(gt))) {
@@ -784,7 +784,7 @@ static int do_gt_restart(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
+	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_is_main_type(gt))
 		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
 
 	if (IS_SRIOV_PF(gt_to_xe(gt)))
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 187fa6490eaf..b9591e8a5634 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -107,6 +107,11 @@ static inline bool xe_gt_has_indirect_ring_state(struct xe_gt *gt)
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
index 3556c41c041b..6f51c09b0451 100644
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
index 9b2fc9db55b8..09dc19177a7d 100644
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
@@ -1037,7 +1037,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 
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
index 4829ed46a8b4..02dd8ddbbab3 100644
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

