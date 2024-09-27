Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB61ACDD1B5
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 14:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8BB10EC6C;
	Fri, 27 Sep 2024 14:14:04 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDAD10EC5F
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 14:14:02 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 04/14] drm/xe: Initialize UC after xe_display_init_noaccel.
Date: Fri, 27 Sep 2024 16:13:54 +0200
Message-ID: <20240927141404.163317-5-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927141404.163317-1-maarten.lankhorst@linux.intel.com>
References: <20240927141404.163317-1-maarten.lankhorst@linux.intel.com>
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

There shouldn't be any allocation to GGTT before display readout,
and the ucode allocations count.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  2 +-
 drivers/gpu/drm/xe/xe_gt.c     | 27 +++++++++++++--------------
 drivers/gpu/drm/xe/xe_gt.h     |  2 +-
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 2f9af45bf97f..0a9aa76bf8c4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -684,7 +684,7 @@ int xe_device_probe(struct xe_device *xe)
 	}
 
 	for_each_gt(gt, xe, id) {
-		err = xe_gt_init_hwconfig(gt);
+		err = xe_gt_init_early_tile(gt);
 		if (err)
 			return err;
 	}
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 9b0218109647..c14f18bf497e 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -466,6 +466,18 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_hw_fence_irq;
 
+	/*
+	 * Initialize GuC in order to obtain hwconfig and
+	 * enable CTB communication.
+	 */
+	err = xe_uc_init(&gt->uc);
+	if (err)
+		goto err_force_wake;
+
+	err = xe_uc_init_hwconfig(&gt->uc);
+	if (err)
+		goto err_force_wake;
+
 	xe_gt_mcr_set_implicit_defaults(gt);
 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
 
@@ -542,11 +554,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	return err;
 }
 
-/*
- * Initialize enough GT to be able to load GuC in order to obtain hwconfig and
- * enable CTB communication.
- */
-int xe_gt_init_hwconfig(struct xe_gt *gt)
+int xe_gt_init_early_tile(struct xe_gt *gt)
 {
 	int err;
 
@@ -557,19 +565,10 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 	xe_gt_mcr_init_early(gt);
 	xe_pat_init(gt);
 
-	err = xe_uc_init(&gt->uc);
-	if (err)
-		goto out_fw;
-
-	err = xe_uc_init_hwconfig(&gt->uc);
-	if (err)
-		goto out_fw;
-
 	xe_gt_topology_init(gt);
 	xe_gt_mcr_init(gt);
 	xe_gt_enable_host_l2_vram(gt);
 
-out_fw:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 out:
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 05c8351d0f39..d599c6a9e167 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -34,8 +34,8 @@ static inline bool xe_fault_inject_gt_reset(void)
 #endif
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
-int xe_gt_init_hwconfig(struct xe_gt *gt);
 int xe_gt_init_early(struct xe_gt *gt);
+int xe_gt_init_early_tile(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
 void xe_gt_mmio_init(struct xe_gt *gt);
 void xe_gt_declare_wedged(struct xe_gt *gt);
-- 
2.45.2

