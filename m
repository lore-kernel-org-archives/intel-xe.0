Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF29FC83F17
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 19:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E34310E34B;
	Mon, 14 Jul 2025 19:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRCCJqmX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D401610E34B
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 19:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752521818; x=1784057818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B5WDioM3SbKL4tqJtmT9HnGov7s6rMI5gLPTcYUhxMI=;
 b=XRCCJqmXPrJA1MmWkBEwtB8lfohMqTpIEwlq9e1KvrJJ5I41wTpadr0B
 kuS6K3OgDKYbIg7Vf97Wh3JcsW+ZtL+/VzXTVqdXufV2kjh+V3HkH5Bn1
 bL3aXZEmL3sJRa3WYC0wZzevvVdWJRZ2sPXbXpm5+B27RkV+EgdE2AnNH
 LBGu5RuNckG7o4mtsbx+6a4OQSL9zZsNwsr2BUd8WqAMB5cgtLxQLhBHP
 fYU4wJqo98zZzHHjSHfkqugKzapYRvktv+mQb6I02o0aIzpD0Escd6mtG
 QTjiazmC5rHuH1neO6DrOob/3AsGEVesXHhcHjXmLYm0dtFz5OPKsYjJc w==;
X-CSE-ConnectionGUID: f690hmTDQb+2yXTrNLbruQ==
X-CSE-MsgGUID: VShwEbJCRTuZHBbAmQGGhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65298416"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="65298416"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 12:36:57 -0700
X-CSE-ConnectionGUID: +1RvcjOTQUyQutf328h+dw==
X-CSE-MsgGUID: +CKhMueySLub6k+Erfvopw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="188006816"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 12:36:55 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Move debugfs GT attributes under tile directory
Date: Mon, 14 Jul 2025 21:36:45 +0200
Message-Id: <20250714193645.763-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

While in sysfs we are correctly trying to reflect the hardware
architecture and we expose GT attributes in per tile hierarchy,
in debugfs we expose GT attributes at flat level, without tiles.

Create debugfs directories to represent each tile and move GT
attributes under matching parent tile directory. To not break
existing debugfs tools, create symlink under old location:

 /sys/kernel/debug/dri/0000:00:02.0/
 ├── ...
 ├── gt0 -> tile0/gt0
 ├── gt1 -> tile0/gt1
 ├── tile0
 │   ├── gt0
 │   │   ├── ...
 │   ├── gt1
 │   │   ├── ...

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 14 +++++++++++++-
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 26e9d146ccbf..129186f4193b 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -247,14 +247,33 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
 	.write = atomic_svm_timeslice_ms_set,
 };
 
+static void create_tile_debugfs(struct xe_tile *tile, struct dentry *root)
+{
+	char name[8];
+
+	snprintf(name, sizeof(name), "tile%u", tile->id);
+	tile->debugfs = debugfs_create_dir(name, root);
+	if (IS_ERR(tile->debugfs))
+		return;
+
+	/*
+	 * Store the xe_tile pointer as private data of the tile/ directory
+	 * node so other tile specific attributes under that directory may
+	 * refer to it by looking at its parent node private data.
+	 */
+	tile->debugfs->d_inode->i_private = tile;
+}
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
 	struct drm_minor *minor = xe->drm.primary;
 	struct dentry *root = minor->debugfs_root;
 	struct ttm_resource_manager *man;
+	struct xe_tile *tile;
 	struct xe_gt *gt;
 	u32 mem_type;
+	u8 tile_id;
 	u8 id;
 
 	drm_debugfs_create_files(debugfs_list,
@@ -288,6 +307,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	if (man)
 		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
 
+	for_each_tile(tile, xe, tile_id)
+		create_tile_debugfs(tile, root);
+
 	for_each_gt(gt, xe, id)
 		xe_gt_debugfs_register(gt);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index d4d2c6854790..98ce1255f1d0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -255,6 +255,9 @@ struct xe_tile {
 
 	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
 	struct kobject *sysfs;
+
+	/** @debugfs: debugfs directory associated with this tile */
+	struct dentry *debugfs;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 848618acdca8..061a81f82e76 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -388,13 +388,18 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct drm_minor *minor = gt_to_xe(gt)->drm.primary;
+	struct dentry *parent = gt->tile->debugfs;
 	struct dentry *root;
+	char symlink[16];
 	char name[8];
 
 	xe_gt_assert(gt, minor->debugfs_root);
 
+	if (IS_ERR(parent))
+		return;
+
 	snprintf(name, sizeof(name), "gt%d", gt->info.id);
-	root = debugfs_create_dir(name, minor->debugfs_root);
+	root = debugfs_create_dir(name, parent);
 	if (IS_ERR(root)) {
 		drm_warn(&xe->drm, "Create GT directory failed");
 		return;
@@ -426,4 +431,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 		xe_gt_sriov_pf_debugfs_register(gt, root);
 	else if (IS_SRIOV_VF(xe))
 		xe_gt_sriov_vf_debugfs_register(gt, root);
+
+	/*
+	 * Backwards compatibility only: create a link for the legacy clients
+	 * who may expect gt/ directory at the root level, not the tile level.
+	 */
+	snprintf(symlink, sizeof(symlink), "tile%u/%s", gt->tile->id, name);
+	debugfs_create_symlink(name, minor->debugfs_root, symlink);
 }
-- 
2.47.1

