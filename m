Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF97C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 23:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8CA10E196;
	Mon, 10 Feb 2025 23:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VzsAaFRS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D889910E196
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 23:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739228401; x=1770764401;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ocIVDmthsX7mT+dlva2MbiK4EHsGYRh1UA9wmAadtAA=;
 b=VzsAaFRSiRfqeAy8sfBNkx+xiflGMeuxHDY19PdKGY5TyLp/ZSD444zE
 eohbgY3hv0hjkygsunkB74ChrQGFFSsjygPj47bGibBA3lu0uC9vNuQYh
 E9y1b0wTE+LBRGT1MSLGUTMF3KtFTEJ95ukmMcLJtb1B2t1G4vvWVnKx5
 GdTijOt4YtiRHzdHl0+mQO292Oyc7C+ixr57Xguwx7KMZW6l8Jh2u371m
 e2nrHePJl6ZqbSqCcPMF0nGJ5lhItcRqGAFwCVjfxcWUI6EE/g2S0UbKc
 gvBcipk9Fe8EuJABwb1UI9itBJYiVZhhynqHy0q49q82Cc2lSrG9purj7 w==;
X-CSE-ConnectionGUID: aIlaX/+RQfGYj4dVkufNsQ==
X-CSE-MsgGUID: 1f5YWfbxTZCkEQRaLv1xfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="51223925"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="51223925"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 15:00:00 -0800
X-CSE-ConnectionGUID: IMmOO7dTSDeoqw+j7QFmxA==
X-CSE-MsgGUID: Zw0a5dm+Q2e82CXbVUwn/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149512281"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 15:00:00 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Release all VFs configs on device removal
Date: Mon, 10 Feb 2025 23:59:44 +0100
Message-Id: <20250210225944.984-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c        |  6 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 25 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 3 files changed, 32 insertions(+)

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
index 88bd9d97ba5c..3e2446277e48 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2356,6 +2356,31 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
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
+	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, fini_config, gt);
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

