Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC58CEE33E
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9253210E4FB;
	Tue, 18 Nov 2025 16:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ql/cyUM2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD75910E4FC
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484232; x=1795020232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dWETXRkMEnkDJRzBRd1l797+8sUzt10bBKt3si7NFd8=;
 b=Ql/cyUM2UCteDMAtBfozdzMP89D/WwwYAbzq3FO5kFqKxm2WisSYChmo
 8ayBG0PlIGum2SXhTW5RiPraO2UPrr2595smG/0NzXB9C+hx1zfk0jnq8
 DMtEpRG8hUWdG65x0yncFYCDh3ojLnPNrkTUgB3UpDoT1ebto5PlyiSB1
 XwOAwk60lMnJmvmZ3mWaw3yhqCZZKhzDKz79oWO583FvnmRTSIgAyRMg0
 x4y+7NlTqqGw35Z1Ql33fAstToBX+FrVw/ASTcaCWaqOlGYDxTe9S4w67
 8S7b5dD4c3y0ljV5uLBRU6va95H66hY9QD0JkNf2Kkmcey9Xxq4p57SyH Q==;
X-CSE-ConnectionGUID: bR7zT9WWT+yqaJGm6fx4Wg==
X-CSE-MsgGUID: GhlLBnKlQnOPkYAQd6TxMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544794"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544794"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:52 -0800
X-CSE-ConnectionGUID: qZWGvgHbR0+6QMjQuVln0A==
X-CSE-MsgGUID: hxmtf11sQbKs5YqW6gTR2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952280"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:52 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 27/27] drm/xe/debugfs: Use scope-based runtime PM
Date: Tue, 18 Nov 2025 08:44:06 -0800
Message-ID: <20251118164338.3572146-56-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118164338.3572146-29-matthew.d.roper@intel.com>
References: <20251118164338.3572146-29-matthew.d.roper@intel.com>
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

Switch the debugfs code to use scope-based runtime PM where possible,
for consistency with other parts of the driver.

v2:
 - Drop unnecessary 'ret' variables.  (Gustavo)

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c             | 16 +++++-----------
 drivers/gpu/drm/xe/xe_gsc_debugfs.c         |  3 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 12 ++++--------
 drivers/gpu/drm/xe/xe_guc_debugfs.c         |  8 ++------
 drivers/gpu/drm/xe/xe_huc_debugfs.c         |  3 +--
 drivers/gpu/drm/xe/xe_tile_debugfs.c        |  8 ++------
 6 files changed, 15 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index e91da9589c5f..1d5a2a43a9d7 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -68,7 +68,7 @@ static int info(struct seq_file *m, void *data)
 	struct xe_gt *gt;
 	u8 id;
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 
 	drm_printf(&p, "graphics_verx100 %d\n", xe->info.graphics_verx100);
 	drm_printf(&p, "media_verx100 %d\n", xe->info.media_verx100);
@@ -95,7 +95,6 @@ static int info(struct seq_file *m, void *data)
 			   gt->info.engine_mask);
 	}
 
-	xe_pm_runtime_put(xe);
 	return 0;
 }
 
@@ -110,9 +109,8 @@ static int sriov_info(struct seq_file *m, void *data)
 
 static int workarounds(struct xe_device *xe, struct drm_printer *p)
 {
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	xe_wa_device_dump(xe, p);
-	xe_pm_runtime_put(xe);
 
 	return 0;
 }
@@ -134,7 +132,7 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 
 	xe = node_to_xe(m->private);
 	p = drm_seq_file_printer(m);
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	mmio = xe_root_tile_mmio(xe);
 	static const struct {
 		u32 offset;
@@ -151,7 +149,6 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
 		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
 
-	xe_pm_runtime_put(xe);
 	return 0;
 }
 
@@ -163,7 +160,7 @@ static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
 
 	xe = node_to_xe(m->private);
 	p = drm_seq_file_printer(m);
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	mmio = xe_root_tile_mmio(xe);
 
 	static const struct {
@@ -178,7 +175,6 @@ static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
 	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
 		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
 
-	xe_pm_runtime_put(xe);
 	return 0;
 }
 
@@ -277,16 +273,14 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 
 	xe->wedged.mode = wedged_mode;
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	for_each_gt(gt, xe, id) {
 		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
 		if (ret) {
 			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
-			xe_pm_runtime_put(xe);
 			return -EIO;
 		}
 	}
-	xe_pm_runtime_put(xe);
 
 	return size;
 }
diff --git a/drivers/gpu/drm/xe/xe_gsc_debugfs.c b/drivers/gpu/drm/xe/xe_gsc_debugfs.c
index 461d7e99c2b3..b13928b50eb9 100644
--- a/drivers/gpu/drm/xe/xe_gsc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gsc_debugfs.c
@@ -37,9 +37,8 @@ static int gsc_info(struct seq_file *m, void *data)
 	struct xe_device *xe = gsc_to_xe(gsc);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	xe_gsc_print_info(gsc, &p);
-	xe_pm_runtime_put(xe);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 5278ea4fd655..0fd863609848 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -123,11 +123,10 @@ static int POLICY##_set(void *data, u64 val)					\
 	if (val > (TYPE)~0ull)							\
 		return -EOVERFLOW;						\
 										\
-	xe_pm_runtime_get(xe);							\
+	guard(xe_pm_runtime)(xe);							\
 	err = xe_gt_sriov_pf_policy_set_##POLICY(gt, val);			\
 	if (!err)								\
 		xe_sriov_pf_provision_set_custom_mode(xe);			\
-	xe_pm_runtime_put(xe);							\
 										\
 	return err;								\
 }										\
@@ -189,12 +188,11 @@ static int CONFIG##_set(void *data, u64 val)					\
 	if (val > (TYPE)~0ull)							\
 		return -EOVERFLOW;						\
 										\
-	xe_pm_runtime_get(xe);							\
+	guard(xe_pm_runtime)(xe);							\
 	err = xe_sriov_pf_wait_ready(xe) ?:					\
 	      xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
 	if (!err)								\
 		xe_sriov_pf_provision_set_custom_mode(xe);			\
-	xe_pm_runtime_put(xe);							\
 										\
 	return err;								\
 }										\
@@ -249,11 +247,10 @@ static int set_threshold(void *data, u64 val, enum xe_guc_klv_threshold_index in
 	if (val > (u32)~0ull)
 		return -EOVERFLOW;
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	err = xe_gt_sriov_pf_config_set_threshold(gt, vfid, index, val);
 	if (!err)
 		xe_sriov_pf_provision_set_custom_mode(xe);
-	xe_pm_runtime_put(xe);
 
 	return err;
 }
@@ -358,9 +355,8 @@ static ssize_t control_write(struct file *file, const char __user *buf, size_t c
 		xe_gt_assert(gt, sizeof(cmd) > strlen(control_cmds[n].cmd));
 
 		if (sysfs_streq(cmd, control_cmds[n].cmd)) {
-			xe_pm_runtime_get(xe);
+			guard(xe_pm_runtime)(xe);
 			ret = control_cmds[n].fn ? (*control_cmds[n].fn)(gt, vfid) : 0;
-			xe_pm_runtime_put(xe);
 			break;
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index 0b102ab46c4d..efaca259d3e8 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -70,13 +70,9 @@ static int guc_debugfs_show(struct seq_file *m, void *data)
 	struct xe_gt *gt = grandparent->d_inode->i_private;
 	struct xe_device *xe = gt_to_xe(gt);
 	int (*print)(struct xe_guc *, struct drm_printer *) = node->info_ent->data;
-	int ret;
 
-	xe_pm_runtime_get(xe);
-	ret = print(&gt->uc.guc, &p);
-	xe_pm_runtime_put(xe);
-
-	return ret;
+	guard(xe_pm_runtime)(xe);
+	return print(&gt->uc.guc, &p);
 }
 
 static int guc_log(struct xe_guc *guc, struct drm_printer *p)
diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_huc_debugfs.c
index 3a888a40188b..df9c4d79b710 100644
--- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
@@ -37,9 +37,8 @@ static int huc_info(struct seq_file *m, void *data)
 	struct xe_device *xe = huc_to_xe(huc);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	xe_huc_print_info(huc, &p);
-	xe_pm_runtime_put(xe);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.c b/drivers/gpu/drm/xe/xe_tile_debugfs.c
index fff242a5ae56..39eeca75dded 100644
--- a/drivers/gpu/drm/xe/xe_tile_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_debugfs.c
@@ -82,13 +82,9 @@ int xe_tile_debugfs_show_with_rpm(struct seq_file *m, void *data)
 	struct drm_info_node *node = m->private;
 	struct xe_tile *tile = node_to_tile(node);
 	struct xe_device *xe = tile_to_xe(tile);
-	int ret;
 
-	xe_pm_runtime_get(xe);
-	ret = xe_tile_debugfs_simple_show(m, data);
-	xe_pm_runtime_put(xe);
-
-	return ret;
+	guard(xe_pm_runtime)(xe);
+	return xe_tile_debugfs_simple_show(m, data);
 }
 
 static int ggtt(struct xe_tile *tile, struct drm_printer *p)
-- 
2.51.1

