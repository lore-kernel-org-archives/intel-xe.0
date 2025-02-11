Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E03BC021A1
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 15:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C936A10E0EE;
	Tue, 11 Feb 2025 15:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPujbBWk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035EA10E0EE
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739289049; x=1770825049;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n81af0y7m4LjllL/K+JwJudAiRFkW/fomDDK7LGgPPU=;
 b=TPujbBWk5Iguo0whY2rVvlB/UnzAD3nLmB/4VthkJUr4M27B4bnNuDvH
 VCCq7qp7CtcztYGQO2QXhpNLH2QizUp+gu70Udow+eATMzQQ+c67ZvlnS
 I5lkSOTcM3SGxwZt89yok8l182PJ62OPb+kG3NJWVHGZGIlszlMAtgLQ/
 q/9N1HVw7t2dmqYkp1Djcy9MxnixW79VJjLf/vmXrJwoAov0xNjC78Mog
 p7Au+3UsfCJP6piuVsCvBsvkzafYyUquJc0rn22PDuG+92OXsTfiXxIHJ
 vrYNe3L2AtCXGL+2prby3HpTaDdw2mvV36DPRyBy5fIv3VxcaNrZvkKvj A==;
X-CSE-ConnectionGUID: CfBHD9MbR0ieqrWkfy0nOQ==
X-CSE-MsgGUID: 08Y7k1yUQQGcXvy5bM0DXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="40038379"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="40038379"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 07:50:49 -0800
X-CSE-ConnectionGUID: KU3GW34OTbKWN996c/TPTA==
X-CSE-MsgGUID: PjdL12IMQqSs6AE5wb415Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="117561658"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.81.227])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 07:50:47 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2] drm/xe/pf: Release all VFs configs on device removal
Date: Tue, 11 Feb 2025 16:50:34 +0100
Message-Id: <20250211155034.1028-1-michal.wajdeczko@intel.com>
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

If we try to manually provision VFs using debugfs and then we
try to unload the driver, we will see complains like:

 [ ] Memory manager not clean during takedown.
 [ ] RIP: 0010:drm_mm_takedown+0x3f/0x100
 [ ] [drm:drm_mm_takedown] *ERROR* node [fedff000 + 00001000]: inserted at
      drm_mm_insert_node_in_range+0x2bd/0x520
      xe_ggtt_node_insert+0x52/0x90 [xe]
      pf_provision_vf_ggtt+0x1fa/0xac0 [xe]
      xe_gt_sriov_pf_config_set_ggtt+0x79/0x7a0 [xe]
      ggtt_set+0x53/0x80 [xe]
      simple_attr_write_xsigned.isra.0+0xd2/0x150
      simple_attr_write+0x14/0x30
      debugfs_attr_write+0x4e/0x80

 [ ] xe 0000:00:02.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
 [ ] xe 0000:00:02.0: [drm] GT0:      total 65535
 [ ] xe 0000:00:02.0: [drm] GT0:      used 1
 [ ] xe 0000:00:02.0: [drm] GT0:      range 65534..65534 (1)

 [ ] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC doorbells manager unclean (1/256)
 [ ] xe 0000:00:02.0: [drm] GT0:      count: 256
 [ ] xe 0000:00:02.0: [drm] GT0:      available range: 1..255 (255)
 [ ] xe 0000:00:02.0: [drm] GT0:      available total: 255
 [ ] xe 0000:00:02.0: [drm] GT0:      reserved range: 0..0 (1)
 [ ] xe 0000:00:02.0: [drm] GT0:      reserved total: 1

This could be easily fixed by adding config release action.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: add explicit assert to check PF mode (Piotr)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c        |  6 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 29 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 3 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index d66478deab98..c08efca6420e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -89,6 +89,12 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
  */
 int xe_gt_sriov_pf_init(struct xe_gt *gt)
 {
+	int err;
+
+	err = xe_gt_sriov_pf_config_init(gt);
+	if (err)
+		return err;
+
 	return xe_gt_sriov_pf_migration_init(gt);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 88bd9d97ba5c..10be109bf357 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2356,6 +2356,35 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
 	return err;
 }
 
+static void fini_config(void *arg)
+{
+	struct xe_gt *gt = arg;
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(xe);
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	for (n = 1; n <= total_vfs; n++)
+		pf_release_vf_config(gt, n);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+}
+
+/**
+ * xe_gt_sriov_pf_config_init - Initialize SR-IOV configuration data.
+ * @gt: the &xe_gt
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	xe_gt_assert(gt, IS_SRIOV_PF(xe));
+
+	return devm_add_action_or_reset(xe->drm.dev, fini_config, gt);
+}
+
 /**
  * xe_gt_sriov_pf_config_restart - Restart SR-IOV configurations after a GT reset.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index f894e9d4abba..513e6512a575 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -63,6 +63,7 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
 
 bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
 
+int xe_gt_sriov_pf_config_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_config_restart(struct xe_gt *gt);
 
 int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p);
-- 
2.47.1

