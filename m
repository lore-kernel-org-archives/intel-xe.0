Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942FFC7115A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 10:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADEF10E9F6;
	Thu, 19 Jun 2025 10:49:35 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBEE10E9FB
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Jun 2025 10:49:32 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 02/11] drm/xe/sriov: Move VF bootstrap and query_config to
 vf_guc_init
Date: Thu, 19 Jun 2025 12:49:01 +0200
Message-ID: <20250619104858.418440-15-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619104858.418440-13-dev@lankhorst.se>
References: <20250619104858.418440-13-dev@lankhorst.se>
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

We want to split up GUC init to an alloc and noalloc part to keep the
init path the same for VF and !VF as much as possible.

Everything in vf_guc_init should be done as early as possible, otherwise
VRAM probing becomes impossible.

Also move xe_gt_mmio_init to the end of xe_gt_init_early(), cleaning up
the init in xe_device slightly.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_device.c      | 17 -----------------
 drivers/gpu/drm/xe/xe_gt.c          |  7 +++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  1 -
 drivers/gpu/drm/xe/xe_guc.c         |  9 +++++++++
 4 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a1d3b861ff9c6..2bc7fbf15d058 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -790,23 +790,6 @@ int xe_device_probe(struct xe_device *xe)
 		err = xe_gt_init_early(gt);
 		if (err)
 			return err;
-
-		/*
-		 * Only after this point can GT-specific MMIO operations
-		 * (including things like communication with the GuC)
-		 * be performed.
-		 */
-		xe_gt_mmio_init(gt);
-
-		if (IS_SRIOV_VF(xe)) {
-			xe_guc_comm_init_early(&gt->uc.guc);
-			err = xe_gt_sriov_vf_bootstrap(gt);
-			if (err)
-				return err;
-			err = xe_gt_sriov_vf_query_config(gt);
-			if (err)
-				return err;
-		}
 	}
 
 	for_each_tile(tile, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 9752a38c0162a..4370a4db95e05 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -419,6 +419,13 @@ int xe_gt_init_early(struct xe_gt *gt)
 
 	xe_mocs_init_early(gt);
 
+	/*
+	 * Only after this point can GT-specific MMIO operations
+	 * (including things like communication with the GuC)
+	 * be performed.
+	 */
+	xe_gt_mmio_init(gt);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 9b2fc9db55b8c..93cd26dca070f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -966,7 +966,6 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
 	struct vf_runtime_reg *rr;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
-	xe_gt_assert(gt, gt->sriov.vf.pf_version.major);
 	xe_gt_assert(gt, !reg.vf);
 
 	if (reg.addr == GMD_ID.addr) {
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 209e5d53c290c..81b22b6fb2493 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -629,6 +629,7 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
 
 static int vf_guc_init(struct xe_guc *guc)
 {
+	struct xe_gt *gt = guc_to_gt(guc);
 	int err;
 
 	xe_guc_comm_init_early(guc);
@@ -641,6 +642,14 @@ static int vf_guc_init(struct xe_guc *guc)
 	if (err)
 		return err;
 
+	err = xe_gt_sriov_vf_bootstrap(gt);
+	if (err)
+		return err;
+
+	err = xe_gt_sriov_vf_query_config(gt);
+	if (err)
+		return err;
+
 	return 0;
 }
 
-- 
2.45.2

