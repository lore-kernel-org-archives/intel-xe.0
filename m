Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B74CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 12:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F67110E32A;
	Wed,  8 Oct 2025 12:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnVRkpYa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7CC10E32A
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 12:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759928261; x=1791464261;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UqBfFwM1Ec3w1RSHuzax17lR01CIWuw643QokHiHRb8=;
 b=HnVRkpYaZpAro7bV4wY0qBDuMl0m6ST4k+OPvScz+WUcfvlOT2gx/tLj
 sgkjPHPvI742VJvOqT+u93DOgPKCcbtnp9hZX6k+CuFXOc12PcLW5Bf/r
 rqrggZxoyYlK7QFNKwtdmwM9OVl+YASu09vIe+2chvJsZ7Fm1kPvftHX2
 gCVoA2LJu0QMA7KrBR216IWYTux8UtkqXErvNJMRXDVSv3Pe4XEi4Ermp
 Gv2hi5HfNDhgxdy3JJqIyu20kbWp26RGzt6VHAZkT35JslBebzx+pZ4fb
 Cwl+ESvSIENA6ERXmYxwIZIaFhZ/Rr+uf9duLLnHXWEMkHyoJYUamUFpz w==;
X-CSE-ConnectionGUID: R5hLZCT+TDeNh69QomdlvA==
X-CSE-MsgGUID: hVRxvpb2SjO3wniZGx0+rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="65971977"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="65971977"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 05:57:41 -0700
X-CSE-ConnectionGUID: m0NrhbXRT+S24NNnIbSbZg==
X-CSE-MsgGUID: 0X7BcgvwTOqTqwbdx+3kig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="185724066"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 05:57:39 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH] drm/xe/pf: Always expose VRAM provisioning data on discrete
 GPUs
Date: Wed,  8 Oct 2025 14:57:12 +0200
Message-Id: <20251008125712.10299-1-lukasz.laguna@intel.com>
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
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

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

