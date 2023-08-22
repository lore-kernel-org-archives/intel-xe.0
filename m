Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4FEEE49A5
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 20:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F4110E0B5;
	Tue, 22 Aug 2023 20:37:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4140310E0B5
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 20:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692736677; x=1724272677;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RKFWb/dX1dn1V+nHD541wYcIBsCHcaMH9Q7CkwAcPZ8=;
 b=lACsViix0QKTVhqK6h1/QL9IbaHkXLBJwVp9htcidXn8CFA032Iu2b/B
 C2wdspGLGdpMhPO8nO3o4yhWGgzQ50lyF7cYhFoj6PXKXMS/lKV9bBzaz
 2w1VEut46tGLDcrreHjS3mviE6ZQYf2nqTxqblyH9V6t/N9OVwdiuFRJW
 4cyYfapymkpduNOtiAj44vG0DYroTPf+HIol/JGNw3ZvE8b6Le94J8BZl
 K7W1iIypg5XuABfhie0rSbMxALqclVIgXB/bMTJll3y9KoKdNnYqmuCSR
 r+mbYqeauWtrSO3r31NXmjLnRapdSrUyvL0zZrJTDwUadXv3ceVZ9IkKw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404989652"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="404989652"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 13:37:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="910222658"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="910222658"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 13:37:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 22 Aug 2023 13:37:20 -0700
Message-Id: <20230822203720.1005893-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/guc_pc: Replace platform check with IP
 version
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Instead of checking for MTL to decide what RPS registers to use, check
for IP version, assuming new platforms will use the more recent
functions rather than the oldest.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index c03bb58e7049..b01ac684d631 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -340,7 +340,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (xe->info.platform == XE_METEORLAKE)
+	if (GRAPHICS_VERx100(xe) >= 1270)
 		mtl_update_rpe_value(pc);
 	else
 		tgl_update_rpe_value(pc);
@@ -365,7 +365,7 @@ static ssize_t freq_act_show(struct device *dev,
 	xe_device_mem_access_get(gt_to_xe(gt));
 
 	/* When in RC6, actual frequency reported will be 0. */
-	if (xe->info.platform == XE_METEORLAKE) {
+	if (GRAPHICS_VERx100(xe) >= 1270) {
 		freq = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
 		freq = REG_FIELD_GET(MTL_CAGF_MASK, freq);
 	} else {
@@ -680,7 +680,7 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (xe->info.platform == XE_METEORLAKE)
+	if (GRAPHICS_VERx100(xe) >= 1270)
 		mtl_init_fused_rp_values(pc);
 	else
 		tgl_init_fused_rp_values(pc);
-- 
2.40.1

