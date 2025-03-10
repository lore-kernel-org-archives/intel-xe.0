Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A0EC35FF1
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 20:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C9510E4DF;
	Mon, 10 Mar 2025 20:07:23 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4AB10E4DE
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 20:07:21 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 2/8] drm/xe/sriov: Move VF bootstrap and query_config to
 vf_guc_init
Date: Mon, 10 Mar 2025 21:06:47 +0100
Message-ID: <20250310200653.89731-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250310200653.89731-1-dev@lankhorst.se>
References: <20250310200653.89731-1-dev@lankhorst.se>
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

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  1 -
 drivers/gpu/drm/xe/xe_guc.c         | 17 +++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index a439261bf4d72..a43dc3844274d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -974,7 +974,6 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
 	struct vf_runtime_reg *rr;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
-	xe_gt_assert(gt, gt->sriov.vf.pf_version.major);
 	xe_gt_assert(gt, !reg.vf);
 
 	if (reg.addr == GMD_ID.addr) {
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index bc1ff0a4e1e7d..ecf597f9d80c6 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -628,6 +628,7 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
 
 static int vf_guc_init(struct xe_guc *guc)
 {
+	struct xe_gt *gt = guc_to_gt(guc);
 	int err;
 
 	xe_guc_comm_init_early(guc);
@@ -640,6 +641,14 @@ static int vf_guc_init(struct xe_guc *guc)
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
 
@@ -1097,14 +1106,6 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
 	struct xe_gt *gt = guc_to_gt(guc);
 	int ret;
 
-	ret = xe_gt_sriov_vf_bootstrap(gt);
-	if (ret)
-		return ret;
-
-	ret = xe_gt_sriov_vf_query_config(gt);
-	if (ret)
-		return ret;
-
 	ret = xe_guc_hwconfig_init(guc);
 	if (ret)
 		return ret;
-- 
2.45.2

