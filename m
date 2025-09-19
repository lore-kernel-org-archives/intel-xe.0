Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8CCCAC592
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 16:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442C510EA51;
	Fri, 19 Sep 2025 16:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7IlSdVG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF1C10EA51
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 16:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758297886; x=1789833886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MtqzwbfxYFPfXQzPKIBP20Ypii8q0cIxJQUWPz8hJ2Y=;
 b=B7IlSdVGAVHbr2VE7CAPlS7/e+wQQk0wy/mJGgv9fUymBQKBBcAdMeIS
 6g5UYNoQr1qVxGj58ZEu5aa1MbrvQmvzz6rE6yESkUiNjbEsmiCtRq8V3
 rKDHjy+QYIQkyKP4BCZcBa01iAo3r5moUTBYm9+5bTgnzCteWyhudk3dn
 QAA0wxLrlTFTgSamFoApFHTS6OppKcPMkKOBohxm8EEfsuBse9Gi+zadG
 bBZvl7b5ltci47/yxpU0pn8FhG+dMlcFx6F3udVMEsTzl7OWXxGY5DDng
 ZmdhUtloPLCxk/8BRFYKh8a8Y/z6/gQr//QKHFx6daXgVExMHrKCso93x w==;
X-CSE-ConnectionGUID: ZVAVXevhRHKwJ4wJSk1N1Q==
X-CSE-MsgGUID: ohF6y5Q2QAGX67tY3M6obg==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="48224701"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="48224701"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 09:04:46 -0700
X-CSE-ConnectionGUID: L5nsUL2WQcW/6tkUguOiEw==
X-CSE-MsgGUID: sl8/svbASUWlB7Rc+Jskvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="179890122"
Received: from pczakx-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.84.166])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 09:04:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/2] drm/xe/debugfs: Improve .show() helper for GT-based
 attributes
Date: Fri, 19 Sep 2025 18:04:30 +0200
Message-ID: <20250919160430.573-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919160430.573-1-michal.wajdeczko@intel.com>
References: <20250919160430.573-1-michal.wajdeczko@intel.com>
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

Like we did for tile-based attributes, introduce separate show()
helper that implicitly takes an RPM reference prior to the call
to the actual print() function. This translates into some savings.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
Here is a report from the scripts/bloat-o-meter:

  add/remove: 2/2 grow/shrink: 0/14 up/down: 114/-581 (-467)
  Function                                     old     new   delta
  xe_gt_debugfs_show_with_rpm                    -      98     +98
  __pfx_xe_gt_debugfs_show_with_rpm              -      16     +16
  __pfx_powergate_info                          16       -     -16
  register_save_restore                        317     288     -29
  vecs_default_lrc                              73      42     -31
  vcs_default_lrc                               73      42     -31
  rcs_default_lrc                               70      39     -31
  ccs_default_lrc                               73      42     -31
  bcs_default_lrc                               73      42     -31
  hw_engines                                   179     145     -34
  hwconfig                                      70      33     -37
  workarounds                                   66      26     -40
  tunings                                       66      26     -40
  topology                                      66      26     -40
  steering                                      66      26     -40
  pat                                           66      26     -40
  mocs                                          66      26     -40
  powergate_info                                70       -     -70
  Total: Before=2870434, After=2869967, chg -0.02%
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 116 +++++++++++------------------
 drivers/gpu/drm/xe/xe_gt_debugfs.h |   1 +
 2 files changed, 46 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index e4eba91cb83d..b9176d4398e1 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -35,6 +35,11 @@
 #include "xe_uc_debugfs.h"
 #include "xe_wa.h"
 
+static struct xe_gt *node_to_gt(struct drm_info_node *node)
+{
+	return node->dent->d_parent->d_inode->i_private;
+}
+
 /**
  * xe_gt_debugfs_simple_show - A show callback for struct drm_info_list
  * @m: the &seq_file
@@ -77,8 +82,7 @@ int xe_gt_debugfs_simple_show(struct seq_file *m, void *data)
 {
 	struct drm_printer p = drm_seq_file_printer(m);
 	struct drm_info_node *node = m->private;
-	struct dentry *parent = node->dent->d_parent;
-	struct xe_gt *gt = parent->d_inode->i_private;
+	struct xe_gt *gt = node_to_gt(node);
 	int (*print)(struct xe_gt *, struct drm_printer *) = node->info_ent->data;
 
 	if (WARN_ON(!print))
@@ -87,15 +91,36 @@ int xe_gt_debugfs_simple_show(struct seq_file *m, void *data)
 	return print(gt, &p);
 }
 
+/**
+ * xe_gt_debugfs_show_with_rpm - A show callback for struct drm_info_list
+ * @m: the &seq_file
+ * @data: data used by the drm debugfs helpers
+ *
+ * Similar to xe_gt_debugfs_simple_show() but implicitly takes a RPM ref.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_debugfs_show_with_rpm(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = m->private;
+	struct xe_gt *gt = node_to_gt(node);
+	struct xe_device *xe = gt_to_xe(gt);
+	int ret;
+
+	xe_pm_runtime_get(xe);
+	ret = xe_gt_debugfs_simple_show(m, data);
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
 static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	unsigned int fw_ref;
 	int ret = 0;
 
-	xe_pm_runtime_get(xe);
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
 		ret = -ETIMEDOUT;
@@ -107,37 +132,19 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 
 fw_put:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	xe_pm_runtime_put(xe);
-
-	return ret;
-}
-
-static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
-{
-	int ret;
-
-	xe_pm_runtime_get(gt_to_xe(gt));
-	ret = xe_gt_idle_pg_print(gt, p);
-	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return ret;
 }
 
 static int topology(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_gt_topology_dump(gt, p);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
 	return 0;
 }
 
 static int steering(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_gt_mcr_steering_dump(gt, p);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
 	return 0;
 }
 
@@ -146,8 +153,6 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 
-	xe_pm_runtime_get(gt_to_xe(gt));
-
 	xe_reg_sr_dump(&gt->reg_sr, p);
 	drm_printf(p, "\n");
 
@@ -165,98 +170,66 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
 	for_each_hw_engine(hwe, gt, id)
 		xe_reg_whitelist_dump(&hwe->reg_whitelist, p);
 
-	xe_pm_runtime_put(gt_to_xe(gt));
-
 	return 0;
 }
 
 static int workarounds(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_wa_dump(gt, p);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
 	return 0;
 }
 
 static int tunings(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_tuning_dump(gt, p);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
 	return 0;
 }
 
 static int pat(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_pat_dump(gt, p);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
 	return 0;
 }
 
 static int mocs(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_mocs_dump(gt, p);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
 	return 0;
 }
 
 static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_RENDER);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
 	return 0;
 }
 
 static int ccs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_COMPUTE);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
 	return 0;
 }
 
 static int bcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_COPY);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
 	return 0;
 }
 
 static int vcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_VIDEO_DECODE);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
 	return 0;
 }
 
 static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
 	return 0;
 }
 
 static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_guc_hwconfig_dump(&gt->uc.guc, p);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
 	return 0;
 }
 
@@ -266,25 +239,26 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
  * - without access to the PF specific data
  */
 static const struct drm_info_list vf_safe_debugfs_list[] = {
-	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
-	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
-	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
-	{"tunings", .show = xe_gt_debugfs_simple_show, .data = tunings},
-	{"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data = rcs_default_lrc},
-	{"default_lrc_ccs", .show = xe_gt_debugfs_simple_show, .data = ccs_default_lrc},
-	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
-	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
-	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
-	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
+	{ "topology", .show = xe_gt_debugfs_show_with_rpm, .data = topology },
+	{ "register-save-restore",
+		.show = xe_gt_debugfs_show_with_rpm, .data = register_save_restore },
+	{ "workarounds", .show = xe_gt_debugfs_show_with_rpm, .data = workarounds },
+	{ "tunings", .show = xe_gt_debugfs_show_with_rpm, .data = tunings },
+	{ "default_lrc_rcs", .show = xe_gt_debugfs_show_with_rpm, .data = rcs_default_lrc },
+	{ "default_lrc_ccs", .show = xe_gt_debugfs_show_with_rpm, .data = ccs_default_lrc },
+	{ "default_lrc_bcs", .show = xe_gt_debugfs_show_with_rpm, .data = bcs_default_lrc },
+	{ "default_lrc_vcs", .show = xe_gt_debugfs_show_with_rpm, .data = vcs_default_lrc },
+	{ "default_lrc_vecs", .show = xe_gt_debugfs_show_with_rpm, .data = vecs_default_lrc },
+	{ "hwconfig", .show = xe_gt_debugfs_show_with_rpm, .data = hwconfig },
 };
 
 /* everything else should be added here */
 static const struct drm_info_list pf_only_debugfs_list[] = {
-	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
-	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
-	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
-	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
-	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
+	{ "hw_engines", .show = xe_gt_debugfs_show_with_rpm, .data = hw_engines },
+	{ "mocs", .show = xe_gt_debugfs_show_with_rpm, .data = mocs },
+	{ "pat", .show = xe_gt_debugfs_show_with_rpm, .data = pat },
+	{ "powergate_info", .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_idle_pg_print },
+	{ "steering", .show = xe_gt_debugfs_show_with_rpm, .data = steering },
 };
 
 static ssize_t write_to_gt_call(const char __user *userbuf, size_t count, loff_t *ppos,
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.h b/drivers/gpu/drm/xe/xe_gt_debugfs.h
index 05a6cc93c78c..32ee3264051b 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.h
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.h
@@ -11,5 +11,6 @@ struct xe_gt;
 
 void xe_gt_debugfs_register(struct xe_gt *gt);
 int xe_gt_debugfs_simple_show(struct seq_file *m, void *data);
+int xe_gt_debugfs_show_with_rpm(struct seq_file *m, void *data);
 
 #endif
-- 
2.47.1

