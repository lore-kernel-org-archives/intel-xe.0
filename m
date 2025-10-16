Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EBCCCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 12:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FDC10E9CB;
	Thu, 16 Oct 2025 12:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0IpMX+8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A371910E9CB
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 12:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760617360; x=1792153360;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oB8wlpFTWeBFlY28UJBFEXyRGTX5RAUeUCLAqEhQedM=;
 b=A0IpMX+8zmXWo7iMK1pq2OQOMXP0FAymEgsL85ZPXmXr3vrHtiLokNSm
 D75GT4qDqIeFR1O6IrmCZioufAOSxUWRSTaxy9ByPcOyb+aShPz/nnQu5
 lvcNJVVai2wOU08+DG1ZqoMaJGlVuZJtmWVnQ8Hy2p8mRl+jWPr07mX9v
 tg3556Jv4yckBpjbbk+BvGnFfO5JxOuv1n33VONjycVaFDfvskELGcdbI
 +qFRzWdYq/xAkQOQgVP648SOiUC41IrD46NAq+dUywBqle50m+sUlwcNI
 9UWkv/+RJHulDgGZP27BXwL5d1lNKuUN8jAVGZlmauGfcwuBCW04zqVEU A==;
X-CSE-ConnectionGUID: 1nzpS1vUQI+kqMITu/dPkA==
X-CSE-MsgGUID: SXKBnhhKRvic1rt8YJ9Dcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="80248378"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="80248378"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 05:22:39 -0700
X-CSE-ConnectionGUID: ztwXj33vTIyeZ46/YpxKHg==
X-CSE-MsgGUID: 8xGMHp32R6igjinz0tsgHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186843466"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 05:22:38 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2] drm/xe/pf: Always expose VRAM provisioning data on
 discrete GPUs
Date: Thu, 16 Oct 2025 14:22:33 +0200
Message-Id: <20251016122233.3789-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Currently, VRAM provisioning data is only exposed if the device supports
LMTT. While it should not be possible to modify VRAM provisioning on
platforms without LMTT, it is still useful to be able to read the VRAM
provisioning data on all discrete GPU platforms.

Expose the VRAM debugfs attributes whenever running on dGFX, adjusting
file permissions to read only when LMTT is not available.

Fixes: 921ddb37d87c ("drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't available on the device")
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2:
 - add extra protection against changing the LMEM provisioning (Piotr)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 3 ++-
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 9 ++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index b2e5c52978e6..c0c0215c0703 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1548,7 +1548,8 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
 {
 	int err;
 
-	xe_gt_assert(gt, xe_device_has_lmtt(gt_to_xe(gt)));
+	if (!xe_device_has_lmtt(gt_to_xe(gt)))
+		return -EPERM;
 
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 	if (vfid)
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
index c8df18af4d00..6ba2332c77d4 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
@@ -165,14 +165,17 @@ DEFINE_SRIOV_TILE_CONFIG_DEBUGFS_ATTRIBUTE(vram, lmem, u64, "%llu\n");
 
 static void pf_add_config_attrs(struct xe_tile *tile, struct dentry *dent, unsigned int vfid)
 {
+	struct xe_device *xe = tile->xe;
+
 	xe_tile_assert(tile, tile == extract_tile(dent));
 	xe_tile_assert(tile, vfid == extract_vfid(dent));
 
 	debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
 				   0644, dent, dent, &ggtt_fops);
-	if (xe_device_has_lmtt(tile->xe))
+	if (IS_DGFX(xe))
 		debugfs_create_file_unsafe(vfid ? "vram_quota" : "vram_spare",
-					   0644, dent, dent, &vram_fops);
+					   xe_device_has_lmtt(xe) ? 0644 : 0444,
+					   dent, dent, &vram_fops);
 }
 
 static void pf_populate_tile(struct xe_tile *tile, struct dentry *dent, unsigned int vfid)
@@ -188,7 +191,7 @@ static void pf_populate_tile(struct xe_tile *tile, struct dentry *dent, unsigned
 		drm_debugfs_create_files(pf_ggtt_info,
 					 ARRAY_SIZE(pf_ggtt_info),
 					 dent, minor);
-		if (xe_device_has_lmtt(xe))
+		if (IS_DGFX(xe))
 			drm_debugfs_create_files(pf_vram_info,
 						 ARRAY_SIZE(pf_vram_info),
 						 dent, minor);
-- 
2.40.0

