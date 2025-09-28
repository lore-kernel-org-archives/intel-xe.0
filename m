Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673B5CAC5BB
	for <intel-xe@archiver.kernel.org>; Sun, 28 Sep 2025 14:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A9410E127;
	Sun, 28 Sep 2025 14:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DePAAeCe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7D010E149
 for <intel-xe@lists.freedesktop.org>; Sun, 28 Sep 2025 14:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759068054; x=1790604054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hKCj8oGIHIN6e2WFy7UAoUuZY/n8J4fXgsV6LcxftHk=;
 b=DePAAeCepPYMtAPzAC2Dwjnh/S5nM+7p8+HyotFmuePwl+7lUVx7a8kH
 iJnHe7hD1TxED/DskQm7Hmj4J2dEtxlDpMpfQ9gGQ6tXcvwV7FGhEoac2
 mCJxkST37rENBDxGwrQZcF0OHesXlK2n/ko/Z1LFkS5pGtHt1IWiQQRrQ
 aCEzKsNUfGnyYRA+5oeGpSE1pamrEFyEY9/BHQJ6dnfTLAN+MGS24immU
 pF/gc0ziszVxuFgx7vjutKlJw1BFFwIrq24SgnCPkvvgxLQL+zyiYH4mJ
 Nyhy/VkVe0nh1WPRhoiFCK70CtscnuZtiImZ0JKBuZ8sys08NCxvC2x6K Q==;
X-CSE-ConnectionGUID: fsQtywYsSSuNO/RP+N+NMg==
X-CSE-MsgGUID: K+SEISRwQSmMVpaJA+dw2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="48893891"
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; d="scan'208";a="48893891"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 07:00:54 -0700
X-CSE-ConnectionGUID: kHqBG/qYQNeYe84KJQtzWQ==
X-CSE-MsgGUID: PYiXggJzQfOxXhfq4Rkatw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; d="scan'208";a="178761866"
Received: from jkhalil-mobl.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.85])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 07:00:53 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 6/6] drm/xe/pf: Make GGTT/LMEM debugfs files per-tile
Date: Sun, 28 Sep 2025 16:00:28 +0200
Message-ID: <20250928140029.198847-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250928140029.198847-1-michal.wajdeczko@intel.com>
References: <20250928140029.198847-1-michal.wajdeczko@intel.com>
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

Due to initial design of the Xe debugfs, the GGTT and LMEM files
were defined on the primary GT, instead of being per-tile.

While PF provisioning code is now still maintaining GGTT and LMEM
also on the per primary-GT level, this will be refactored soon,
but we can fix debugfs layout now, as part of the new SR-IOV tree.

For backward compatibility we will provide some symlinks that can
be removed once our tools will be fully converted.

As we are making all those changes in the user facing interface,
take this as apportunity to also start replacing the "LMEM" term,
used by the SR-IOV code, with the "VRAM" term, used by Xe driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> #v1
---
v2: use VRAM where possible (Lucas, Rodrigo)
    s/deprecated/compat (Lucas)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  92 ++++--------
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 136 ++++++++++++++++++
 2 files changed, 163 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index fbb3cb3200fb..44fec2aae536 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -100,46 +100,6 @@ static const struct drm_info_list pf_info[] = {
 	},
 };
 
-/*
- *      /sys/kernel/debug/dri/BDF/
- *      ├── sriov
- *      :   ├── pf
- *          :   ├── tile0
- *              :   ├── gt0
- *                  :   ├── ggtt_available
- *                      ├── ggtt_provisioned
- */
-
-static const struct drm_info_list pf_ggtt_info[] = {
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
-};
-
-/*
- *      /sys/kernel/debug/dri/BDF/
- *      ├── sriov
- *      :   ├── pf
- *          :   ├── tile0
- *              :   ├── gt0
- *                  :   ├── lmem_provisioned
- */
-
-static const struct drm_info_list pf_lmem_info[] = {
-	{
-		"lmem_provisioned",
-		.show = xe_gt_debugfs_simple_show,
-		.data = xe_gt_sriov_pf_config_print_lmem,
-	},
-};
-
 /*
  *      /sys/kernel/debug/dri/BDF/
  *      ├── sriov
@@ -199,9 +159,7 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
  *      :   ├── pf
  *          │   ├── tile0
  *          │   :   ├── gt0
- *          │       :   ├── ggtt_spare
- *          │           ├── lmem_spare
- *          │           ├── doorbells_spare
+ *          │       :   ├── doorbells_spare
  *          │           ├── contexts_spare
  *          │           ├── exec_quantum_ms
  *          │           ├── preempt_timeout_us
@@ -209,9 +167,7 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
  *          ├── vf1
  *          :   ├── tile0
  *              :   ├── gt0
- *                  :   ├── ggtt_quota
- *                      ├── lmem_quota
- *                      ├── doorbells_quota
+ *                  :   ├── doorbells_quota
  *                      ├── contexts_quota
  *                      ├── exec_quantum_ms
  *                      ├── preempt_timeout_us
@@ -249,8 +205,6 @@ static int CONFIG##_get(void *data, u64 *val)					\
 										\
 DEFINE_DEBUGFS_ATTRIBUTE(CONFIG##_fops, CONFIG##_get, CONFIG##_set, FORMAT)
 
-DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(ggtt, u64, "%llu\n");
-DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(lmem, u64, "%llu\n");
 DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(ctxs, u32, "%llu\n");
 DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(dbs, u32, "%llu\n");
 DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(exec_quantum, u32, "%llu\n");
@@ -331,13 +285,6 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
 	xe_gt_assert(gt, gt == extract_gt(parent));
 	xe_gt_assert(gt, vfid == extract_vfid(parent));
 
-	if (xe_gt_is_main_type(gt)) {
-		debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
-					   0644, parent, parent, &ggtt_fops);
-		if (xe_device_has_lmtt(gt_to_xe(gt)))
-			debugfs_create_file_unsafe(vfid ? "lmem_quota" : "lmem_spare",
-						   0644, parent, parent, &lmem_fops);
-	}
 	debugfs_create_file_unsafe(vfid ? "doorbells_quota" : "doorbells_spare",
 				   0644, parent, parent, &dbs_fops);
 	debugfs_create_file_unsafe(vfid ? "contexts_quota" : "contexts_spare",
@@ -558,6 +505,28 @@ static const struct file_operations config_blob_ops = {
 	.llseek		= default_llseek,
 };
 
+static void pf_add_compat_attrs(struct xe_gt *gt, struct dentry *dent, unsigned int vfid)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!xe_gt_is_main_type(gt))
+		return;
+
+	if (vfid) {
+		debugfs_create_symlink("ggtt_quota", dent, "../ggtt_quota");
+		if (xe_device_has_lmtt(xe))
+			debugfs_create_symlink("lmem_quota", dent, "../vram_quota");
+	} else {
+		debugfs_create_symlink("ggtt_spare", dent, "../ggtt_spare");
+		debugfs_create_symlink("ggtt_available", dent, "../ggtt_available");
+		debugfs_create_symlink("ggtt_provisioned", dent, "../ggtt_provisioned");
+		if (xe_device_has_lmtt(xe)) {
+			debugfs_create_symlink("lmem_spare", dent, "../vram_spare");
+			debugfs_create_symlink("lmem_provisioned", dent, "../vram_provisioned");
+		}
+	}
+}
+
 static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int vfid)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -583,17 +552,10 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 		pf_add_policy_attrs(gt, dent);
 
 		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
-
-		if (xe_gt_is_main_type(gt)) {
-			drm_debugfs_create_files(pf_ggtt_info,
-						 ARRAY_SIZE(pf_ggtt_info),
-						 dent, minor);
-			if (xe_device_has_lmtt(xe))
-				drm_debugfs_create_files(pf_lmem_info,
-							 ARRAY_SIZE(pf_lmem_info),
-							 dent, minor);
-		}
 	}
+
+	/* for backward compatibility only */
+	pf_add_compat_attrs(gt, dent, vfid);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
index 335a79d09639..c8df18af4d00 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
@@ -8,9 +8,13 @@
 
 #include "xe_device.h"
 #include "xe_device_types.h"
+#include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_debugfs.h"
+#include "xe_pm.h"
+#include "xe_tile_debugfs.h"
 #include "xe_tile_sriov_pf_debugfs.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf.h"
 
 /*
  *      /sys/kernel/debug/dri/BDF/
@@ -53,11 +57,143 @@ static unsigned int extract_vfid(struct dentry *d)
 	return pp == extract_xe(d) ? PFID : (uintptr_t)pp;
 }
 
+/*
+ *      /sys/kernel/debug/dri/BDF/
+ *      ├── sriov
+ *      :   ├── pf
+ *          :   ├── tile0
+ *              :   ├── ggtt_available
+ *                  ├── ggtt_provisioned
+ */
+
+static int pf_config_print_available_ggtt(struct xe_tile *tile, struct drm_printer *p)
+{
+	return xe_gt_sriov_pf_config_print_available_ggtt(tile->primary_gt, p);
+}
+
+static int pf_config_print_ggtt(struct xe_tile *tile, struct drm_printer *p)
+{
+	return xe_gt_sriov_pf_config_print_ggtt(tile->primary_gt, p);
+}
+
+static const struct drm_info_list pf_ggtt_info[] = {
+	{
+		"ggtt_available",
+		.show = xe_tile_debugfs_simple_show,
+		.data = pf_config_print_available_ggtt,
+	},
+	{
+		"ggtt_provisioned",
+		.show = xe_tile_debugfs_simple_show,
+		.data = pf_config_print_ggtt,
+	},
+};
+
+/*
+ *      /sys/kernel/debug/dri/BDF/
+ *      ├── sriov
+ *      :   ├── pf
+ *          :   ├── tile0
+ *              :   ├── vram_provisioned
+ */
+
+static int pf_config_print_vram(struct xe_tile *tile, struct drm_printer *p)
+{
+	return xe_gt_sriov_pf_config_print_lmem(tile->primary_gt, p);
+}
+
+static const struct drm_info_list pf_vram_info[] = {
+	{
+		"vram_provisioned",
+		.show = xe_tile_debugfs_simple_show,
+		.data = pf_config_print_vram,
+	},
+};
+
+/*
+ *      /sys/kernel/debug/dri/BDF/
+ *      ├── sriov
+ *      │   ├── pf
+ *      │   │   ├── tile0
+ *      │   │   │   ├── ggtt_spare
+ *      │   │   │   ├── vram_spare
+ *      │   │   ├── tile1
+ *      │   │   :   :
+ *      │   ├── vf1
+ *      │   :   ├── tile0
+ *      │       │   ├── ggtt_quota
+ *      │       │   ├── vram_quota
+ *      │       ├── tile1
+ *      │       :   :
+ */
+
+#define DEFINE_SRIOV_TILE_CONFIG_DEBUGFS_ATTRIBUTE(NAME, CONFIG, TYPE, FORMAT)	\
+										\
+static int NAME##_set(void *data, u64 val)					\
+{										\
+	struct xe_tile *tile = extract_tile(data);				\
+	unsigned int vfid = extract_vfid(data);					\
+	struct xe_gt *gt = tile->primary_gt;					\
+	struct xe_device *xe = tile->xe;					\
+	int err;								\
+										\
+	if (val > (TYPE)~0ull)							\
+		return -EOVERFLOW;						\
+										\
+	xe_pm_runtime_get(xe);							\
+	err = xe_sriov_pf_wait_ready(xe) ?:					\
+	      xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
+	xe_pm_runtime_put(xe);							\
+										\
+	return err;								\
+}										\
+										\
+static int NAME##_get(void *data, u64 *val)					\
+{										\
+	struct xe_tile *tile = extract_tile(data);				\
+	unsigned int vfid = extract_vfid(data);					\
+	struct xe_gt *gt = tile->primary_gt;					\
+										\
+	*val = xe_gt_sriov_pf_config_get_##CONFIG(gt, vfid);			\
+	return 0;								\
+}										\
+										\
+DEFINE_DEBUGFS_ATTRIBUTE(NAME##_fops, NAME##_get, NAME##_set, FORMAT)
+
+DEFINE_SRIOV_TILE_CONFIG_DEBUGFS_ATTRIBUTE(ggtt, ggtt, u64, "%llu\n");
+DEFINE_SRIOV_TILE_CONFIG_DEBUGFS_ATTRIBUTE(vram, lmem, u64, "%llu\n");
+
+static void pf_add_config_attrs(struct xe_tile *tile, struct dentry *dent, unsigned int vfid)
+{
+	xe_tile_assert(tile, tile == extract_tile(dent));
+	xe_tile_assert(tile, vfid == extract_vfid(dent));
+
+	debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
+				   0644, dent, dent, &ggtt_fops);
+	if (xe_device_has_lmtt(tile->xe))
+		debugfs_create_file_unsafe(vfid ? "vram_quota" : "vram_spare",
+					   0644, dent, dent, &vram_fops);
+}
+
 static void pf_populate_tile(struct xe_tile *tile, struct dentry *dent, unsigned int vfid)
 {
+	struct xe_device *xe = tile->xe;
+	struct drm_minor *minor = xe->drm.primary;
 	struct xe_gt *gt;
 	unsigned int id;
 
+	pf_add_config_attrs(tile, dent, vfid);
+
+	if (!vfid) {
+		drm_debugfs_create_files(pf_ggtt_info,
+					 ARRAY_SIZE(pf_ggtt_info),
+					 dent, minor);
+		if (xe_device_has_lmtt(xe))
+			drm_debugfs_create_files(pf_vram_info,
+						 ARRAY_SIZE(pf_vram_info),
+						 dent, minor);
+	}
+
 	for_each_gt_on_tile(gt, tile, id)
 		xe_gt_sriov_pf_debugfs_populate(gt, dent, vfid);
 }
-- 
2.47.1

