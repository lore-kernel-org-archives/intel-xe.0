Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2146DC369A2
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 19:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA23A10EC6B;
	Fri, 11 Apr 2025 19:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VibJVomY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE8110EC6B
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 19:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744399853; x=1775935853;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yzaOTWbMPjjYp2cmraVWjBpI2UqG5SIq0P6ippvvaNI=;
 b=VibJVomYSkfykpBLSNntCPh72Ot6ibaOYwYBp7QNx16RSafXLi8+Cfvm
 JM+3ojOkB2+fAYXgWTaui22uWIBj+gbItlKX6mLK3A+jb9CIPoLwAwHyu
 wD2b16ppAwQO6HHk+YM+atP5u+jNczrjLkeOMRXp4FuY+aCp1w+kEPU7/
 bWDdQNTnTNf2VUNeFSIemWmwQVizgduXN0AQ0twdk56intTAuoCURaXgF
 4X/8fM4Ah7017M0YDINP4u/Q5327vra81tgjaPTSVMhtNDjkF/dExmak6
 HwkOmtUizoqHXhUm4XOPoU/mz+3qgrxjYcJmYz9p2Du6ga//o75lzU9/b A==;
X-CSE-ConnectionGUID: wRpWJCjBRVmcGW74EdB64Q==
X-CSE-MsgGUID: l88pgVWWSNWoNIroDxQM1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="48667803"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; d="scan'208";a="48667803"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 12:30:53 -0700
X-CSE-ConnectionGUID: zX60w1KlSjGdE4dzfsmdHQ==
X-CSE-MsgGUID: MJoz3/A8RMaLdFpybl4pww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; d="scan'208";a="129622798"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.73])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 12:30:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Don't show GGTT/LMEM debugfs files under media GT
Date: Fri, 11 Apr 2025 21:30:30 +0200
Message-Id: <20250411193030.1865-1-michal.wajdeczko@intel.com>
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

Most of the PF's debugfs files (and their implementations) are
based on the GT hierarchy even if files are related to GGTT or
LMEM data, that are related to the tile.

While we could reach the tile data from any GT, to avoid potential
misuse, some functions allow to be used on the primary GT only,
and may use asserts to enforce that.

In our case, the following assert could be seen when reading the
/sys/kernel/debug/dri/0000:00:02.0/gt1/pf/ggtt_available

 [ ] xe 0000:00:02.0: [drm] Assertion `!xe_gt_is_media_type(gt)` failed!
 [ ] WARNING: CPU: 4 PID: 10609 at drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:379 pf_get_spare_ggtt+0x256/0x4e0 [xe]
 [ ] RIP: 0010:pf_get_spare_ggtt+0x256/0x4e0 [xe]
 [ ] Call Trace:
 [ ]  <TASK>
 [ ]  xe_gt_sriov_pf_config_print_available_ggtt+0xb7/0x480 [xe]
 [ ]  ? __memcg_slab_post_alloc_hook+0x12f/0x3f0
 [ ]  xe_gt_debugfs_simple_show+0x7b/0xb0 [xe]
 [ ]  ? __pfx___drm_printfn_seq_file+0x10/0x10
 [ ]  ? __pfx___drm_puts_seq_file+0x10/0x10
 [ ]  seq_read_iter+0x139/0x4e0
 [ ]  seq_read+0x11d/0x160
 [ ]  full_proxy_read+0x6b/0xb0
 [ ]  vfs_read+0xfa/0x390

Fix that by moving GGTT/LMEM debugfs attributes to separate lists
and register them only when applicable (on primary GT, on DGFX).

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 66 +++++++++++++++------
 1 file changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index b2521dd6ec42..0fe47f41b63c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -51,26 +51,17 @@ static unsigned int extract_vfid(struct dentry *d)
  *      /sys/kernel/debug/dri/0/
  *      ├── gt0
  *      │   ├── pf
- *      │   │   ├── ggtt_available
- *      │   │   ├── ggtt_provisioned
  *      │   │   ├── contexts_provisioned
  *      │   │   ├── doorbells_provisioned
  *      │   │   ├── runtime_registers
  *      │   │   ├── negotiated_versions
  *      │   │   ├── adverse_events
+ *      ├── gt1
+ *      │   ├── pf
+ *      │   │   ├── ...
  */
 
 static const struct drm_info_list pf_info[] = {
-	{
-		"ggtt_available",
-		.show = xe_gt_debugfs_simple_show,
-		.data = xe_gt_sriov_pf_config_print_available_ggtt,
-	},
-	{
-		"ggtt_provisioned",
-		.show = xe_gt_debugfs_simple_show,
-		.data = xe_gt_sriov_pf_config_print_ggtt,
-	},
 	{
 		"contexts_provisioned",
 		.show = xe_gt_debugfs_simple_show,
@@ -81,11 +72,6 @@ static const struct drm_info_list pf_info[] = {
 		.show = xe_gt_debugfs_simple_show,
 		.data = xe_gt_sriov_pf_config_print_dbs,
 	},
-	{
-		"lmem_provisioned",
-		.show = xe_gt_debugfs_simple_show,
-		.data = xe_gt_sriov_pf_config_print_lmem,
-	},
 	{
 		"runtime_registers",
 		.show = xe_gt_debugfs_simple_show,
@@ -103,6 +89,42 @@ static const struct drm_info_list pf_info[] = {
 	},
 };
 
+/*
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0
+ *      │   ├── pf
+ *      │   │   ├── ggtt_available
+ *      │   │   ├── ggtt_provisioned
+ */
+
+static const struct drm_info_list pf_ggtt_info[] = {
+	{
+		"ggtt_available",
+		.show = xe_gt_debugfs_simple_show,
+		.data = xe_gt_sriov_pf_config_print_available_ggtt,
+	},
+	{
+		"ggtt_provisioned",
+		.show = xe_gt_debugfs_simple_show,
+		.data = xe_gt_sriov_pf_config_print_ggtt,
+	},
+};
+
+/*
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0
+ *      │   ├── pf
+ *      │   │   ├── lmem_provisioned
+ */
+
+static const struct drm_info_list pf_lmem_info[] = {
+	{
+		"lmem_provisioned",
+		.show = xe_gt_debugfs_simple_show,
+		.data = xe_gt_sriov_pf_config_print_lmem,
+	},
+};
+
 /*
  *      /sys/kernel/debug/dri/0/
  *      ├── gt0
@@ -532,6 +554,16 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 	pfdentry->d_inode->i_private = gt;
 
 	drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), pfdentry, minor);
+	if (!xe_gt_is_media_type(gt)) {
+		drm_debugfs_create_files(pf_ggtt_info,
+					 ARRAY_SIZE(pf_ggtt_info),
+					 pfdentry, minor);
+		if (IS_DGFX(gt_to_xe(gt)))
+			drm_debugfs_create_files(pf_lmem_info,
+						 ARRAY_SIZE(pf_lmem_info),
+						 pfdentry, minor);
+	}
+
 	pf_add_policy_attrs(gt, pfdentry);
 	pf_add_config_attrs(gt, pfdentry, PFID);
 
-- 
2.47.1

