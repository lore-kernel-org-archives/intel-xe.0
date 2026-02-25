Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4EFF55434
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 02:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8D410E077;
	Wed, 25 Feb 2026 02:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhRvAXV3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467F610E077
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 02:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771986017; x=1803522017;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/XL7rshKeiveXj/Arc0Z/OqySUR3DUQvf16hPTGZx6Y=;
 b=DhRvAXV3obzJ/5rkDFGnmz+cYGdWuxOc6U7p8lsX8KWBTfTZSiCWOXV6
 xlhL8n7Bl2I3Bm2TpIE+5bv6ckurvPXJnxim4rkNv7TDiTyqpH4lm20yU
 Oxe4U5gesOgZOBGkHaktd9idIM04k1kVklYO6+oHkm4LUUGtzLGiBNVwN
 UxeHeWK4sVAqiktLBJ99ZTDwTGTMv0aHUs5JJhDZwNvu87ZktRet52s93
 XsM1qjzbmdK25AMIB5q61XeU1khb9oTIBuMTphnV5o8vgt0TelVqw4Kgq
 A5/RpOFMTXXyxoEO2VpMgqKFGAwje6hXeLxsA8yYQd/AV3nexexE/Pqmh w==;
X-CSE-ConnectionGUID: XVASU0uzQ8m27fG5aBEvnA==
X-CSE-MsgGUID: yXHJBPFaRDC17GvMyL9ClQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76882783"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="76882783"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 18:20:17 -0800
X-CSE-ConnectionGUID: yjS1p7PmTtKO2EnRiJIi5Q==
X-CSE-MsgGUID: zAfut3Y5R9G4koY7txc4RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="215972211"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by orviesa009.jf.intel.com with ESMTP; 24 Feb 2026 18:20:17 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4] drm/xe: restrict multi-lrc to VCS/VECS engines
Date: Tue, 24 Feb 2026 18:20:14 -0800
Message-ID: <20260225022014.45394-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
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

Tighten uapi validation to restrict multi-lrc support to VIDEO_DECODE and
VIDEO_ENHANCE engines only. This check should have been in place from the
start, as the driver typically avoids allowing uapi cases that we have
no userspace consumer for.

Additionally, the GuC firmware on ModSched platforms no longer supports
multi-lrc on non-media engines.

V4:
 - use a unified mask for all platforms since engine instance count
   is an independent runtime check (Matt Roper, Matthew Brost)

V3:
 - store a multi-lrc enable class mask in xe->info and populate from
   xe_device_desc in xe_pci.c (Matthew Brost)

V2:
 - correct the typo (Shuicheng)
 - move the check earlier to avoid VM lookup (Shuicheng, Matt Roper)
 - remove the graphics version check (Matt Roper)
 - input more details in the commit info (Matt Roper)

Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_exec_queue.c   |  5 +++++
 drivers/gpu/drm/xe/xe_pci.c          | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 4 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8f3ef836541e..caa8f34a6744 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -138,6 +138,8 @@ struct xe_device {
 		u8 tile_count;
 		/** @info.max_gt_per_tile: Number of GT IDs allocated to each tile */
 		u8 max_gt_per_tile;
+		/** @info.multi_lrc_mask: bitmask of engine classes which support multi-lrc */
+		u8 multi_lrc_mask;
 		/** @info.gt_count: Total number of GTs for entire device */
 		u8 gt_count;
 		/** @info.vm_max_level: Max VM level */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 66d0e10ee2c4..5abb29454d1f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1184,6 +1184,11 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		if (XE_IOCTL_DBG(xe, !hwe))
 			return -EINVAL;
 
+		/* multi-lrc is only supported on select engine classes */
+		if (XE_IOCTL_DBG(xe, args->width > 1 &&
+				 !(xe->info.multi_lrc_mask & BIT(hwe->class))))
+			return -EOPNOTSUPP;
+
 		vm = xe_vm_lookup(xef, args->vm_id);
 		if (XE_IOCTL_DBG(xe, !vm))
 			return -ENOENT;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e1f569235d8a..3ac99472d6dd 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -184,6 +184,10 @@ static const struct xe_ip media_ips[] = {
 	{ 3503, "Xe3p_HPM", &media_xelpmp },
 };
 
+#define MULTI_LRC_MASK \
+	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) | \
+			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE)
+
 static const struct xe_device_desc tgl_desc = {
 	.pre_gmdid_graphics_ip = &graphics_ip_xelp,
 	.pre_gmdid_media_ip = &media_ip_xem,
@@ -194,6 +198,7 @@ static const struct xe_device_desc tgl_desc = {
 	.has_llc = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 1,
+	MULTI_LRC_MASK,
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 3,
@@ -208,6 +213,7 @@ static const struct xe_device_desc rkl_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.max_gt_per_tile = 1,
+	MULTI_LRC_MASK,
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 3,
@@ -225,6 +231,7 @@ static const struct xe_device_desc adl_s_desc = {
 	.has_llc = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 1,
+	MULTI_LRC_MASK,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
 		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
@@ -246,6 +253,7 @@ static const struct xe_device_desc adl_p_desc = {
 	.has_llc = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 1,
+	MULTI_LRC_MASK,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
 		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
@@ -265,6 +273,7 @@ static const struct xe_device_desc adl_n_desc = {
 	.has_llc = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 1,
+	MULTI_LRC_MASK,
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 3,
@@ -283,6 +292,7 @@ static const struct xe_device_desc dg1_desc = {
 	.has_gsc_nvm = 1,
 	.has_heci_gscfi = 1,
 	.max_gt_per_tile = 1,
+	MULTI_LRC_MASK,
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 3,
@@ -313,6 +323,7 @@ static const struct xe_device_desc ats_m_desc = {
 	.pre_gmdid_media_ip = &media_ip_xehpm,
 	.dma_mask_size = 46,
 	.max_gt_per_tile = 1,
+	MULTI_LRC_MASK,
 	.require_force_probe = true,
 
 	DG2_FEATURES,
@@ -325,6 +336,7 @@ static const struct xe_device_desc dg2_desc = {
 	.pre_gmdid_media_ip = &media_ip_xehpm,
 	.dma_mask_size = 46,
 	.max_gt_per_tile = 1,
+	MULTI_LRC_MASK,
 	.require_force_probe = true,
 
 	DG2_FEATURES,
@@ -343,6 +355,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.has_heci_gscfi = 1,
 	.max_gt_per_tile = 1,
 	.max_remote_tiles = 1,
+	MULTI_LRC_MASK,
 	.require_force_probe = true,
 	.va_bits = 57,
 	.vm_max_level = 4,
@@ -358,6 +371,7 @@ static const struct xe_device_desc mtl_desc = {
 	.has_display = true,
 	.has_pxp = true,
 	.max_gt_per_tile = 2,
+	MULTI_LRC_MASK,
 	.va_bits = 48,
 	.vm_max_level = 3,
 };
@@ -369,6 +383,7 @@ static const struct xe_device_desc lnl_desc = {
 	.has_flat_ccs = 1,
 	.has_pxp = true,
 	.max_gt_per_tile = 2,
+	MULTI_LRC_MASK,
 	.needs_scratch = true,
 	.va_bits = 48,
 	.vm_max_level = 4,
@@ -393,6 +408,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
+	MULTI_LRC_MASK,
 	.needs_scratch = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
 		{ XE_SUBPLATFORM_BATTLEMAGE_G21, "G21", bmg_g21_ids },
@@ -411,6 +427,7 @@ static const struct xe_device_desc ptl_desc = {
 	.has_pre_prod_wa = 1,
 	.has_pxp = true,
 	.max_gt_per_tile = 2,
+	MULTI_LRC_MASK,
 	.needs_scratch = true,
 	.needs_shared_vf_gt_wq = true,
 	.va_bits = 48,
@@ -424,6 +441,7 @@ static const struct xe_device_desc nvls_desc = {
 	.has_flat_ccs = 1,
 	.has_pre_prod_wa = 1,
 	.max_gt_per_tile = 2,
+	MULTI_LRC_MASK,
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 4,
@@ -445,6 +463,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
+	MULTI_LRC_MASK,
 	.require_force_probe = true,
 	.va_bits = 57,
 	.vm_max_level = 4,
@@ -459,6 +478,7 @@ static const struct xe_device_desc nvlp_desc = {
 	.has_page_reclaim_hw_assist = true,
 	.has_pre_prod_wa = true,
 	.max_gt_per_tile = 2,
+	MULTI_LRC_MASK,
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 4,
@@ -746,6 +766,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.skip_pcode = desc->skip_pcode;
 	xe->info.needs_scratch = desc->needs_scratch;
 	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
+	xe->info.multi_lrc_mask = desc->multi_lrc_mask;
 
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 470d31a1f0d6..47e8a1552c2b 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -30,6 +30,7 @@ struct xe_device_desc {
 	u8 dma_mask_size;
 	u8 max_remote_tiles:2;
 	u8 max_gt_per_tile:2;
+	u8 multi_lrc_mask;
 	u8 va_bits;
 	u8 vm_max_level;
 	u8 vram_flags;
-- 
2.43.0

