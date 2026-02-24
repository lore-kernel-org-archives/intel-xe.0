Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0CCEFB7E1
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 02:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A69F10E481;
	Tue, 24 Feb 2026 02:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7veSbhz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32D810E481
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 02:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771900437; x=1803436437;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qtsqCgH/hpl+yCMmSIsp1vXMlPkv1irlSg1MG7tPHpQ=;
 b=l7veSbhzlrH6oC8yB0c+iQEQxoIHH/SUpL5Iw9aO5s7b4VfjSnABn/p9
 3Sys/g5zJymeB8V8YXBOu50of8j0yy6UIrsjptgrvXazfAtGhAKBIhqqJ
 NDc4vhOZFgJbuUihgA7SbbZ5Dtj7H23fDYuhan7Zb13JZMvAueyWSiQv6
 v2ugFMRoFd7DUUaR7MOZ+LTc8ezYOBRKXUjXdnpn0950+Bpf20W0nmaZQ
 ElZokM6GTuANWSIT/AGsyppi5NUlQ4ZFcj0mxxdTwAiwQtG70+XBf12lV
 exhk9NxRMVr5C5MR1QDEKkLB0ZkQDudAMeqzOk235g8LEyXc+0fc/+nJW Q==;
X-CSE-ConnectionGUID: nFEdNKwQQfqGzsrjYj0Edg==
X-CSE-MsgGUID: mwXnOHffRZuK43W0ffChJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72614741"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72614741"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 18:33:56 -0800
X-CSE-ConnectionGUID: lUMo4wcpRZu/FmjZRF5pMw==
X-CSE-MsgGUID: jvfRQb6DSwCd0XXGH2Bj/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214996385"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by orviesa010.jf.intel.com with ESMTP; 23 Feb 2026 18:33:57 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3] drm/xe: restrict multi-lrc to VCS/VECS engines
Date: Mon, 23 Feb 2026 18:33:54 -0800
Message-ID: <20260224023354.182306-1-x.wang@intel.com>
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
 drivers/gpu/drm/xe/xe_pci.c          | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 4 files changed, 25 insertions(+)

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
index e1f569235d8a..fe63387d4077 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -194,6 +194,7 @@ static const struct xe_device_desc tgl_desc = {
 	.has_llc = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 1,
+	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 3,
@@ -208,6 +209,7 @@ static const struct xe_device_desc rkl_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.max_gt_per_tile = 1,
+	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 3,
@@ -225,6 +227,7 @@ static const struct xe_device_desc adl_s_desc = {
 	.has_llc = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 1,
+	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
 		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
@@ -246,6 +249,7 @@ static const struct xe_device_desc adl_p_desc = {
 	.has_llc = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 1,
+	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
 		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
@@ -283,6 +287,7 @@ static const struct xe_device_desc dg1_desc = {
 	.has_gsc_nvm = 1,
 	.has_heci_gscfi = 1,
 	.max_gt_per_tile = 1,
+	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 3,
@@ -313,6 +318,8 @@ static const struct xe_device_desc ats_m_desc = {
 	.pre_gmdid_media_ip = &media_ip_xehpm,
 	.dma_mask_size = 46,
 	.max_gt_per_tile = 1,
+	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
+			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
 	.require_force_probe = true,
 
 	DG2_FEATURES,
@@ -325,6 +332,8 @@ static const struct xe_device_desc dg2_desc = {
 	.pre_gmdid_media_ip = &media_ip_xehpm,
 	.dma_mask_size = 46,
 	.max_gt_per_tile = 1,
+	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
+			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
 	.require_force_probe = true,
 
 	DG2_FEATURES,
@@ -358,6 +367,7 @@ static const struct xe_device_desc mtl_desc = {
 	.has_display = true,
 	.has_pxp = true,
 	.max_gt_per_tile = 2,
+	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
 	.va_bits = 48,
 	.vm_max_level = 3,
 };
@@ -393,6 +403,8 @@ static const struct xe_device_desc bmg_desc = {
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
+	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
+			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
 	.needs_scratch = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
 		{ XE_SUBPLATFORM_BATTLEMAGE_G21, "G21", bmg_g21_ids },
@@ -445,6 +457,8 @@ static const struct xe_device_desc cri_desc = {
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
+	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
+			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
 	.require_force_probe = true,
 	.va_bits = 57,
 	.vm_max_level = 4,
@@ -459,6 +473,8 @@ static const struct xe_device_desc nvlp_desc = {
 	.has_page_reclaim_hw_assist = true,
 	.has_pre_prod_wa = true,
 	.max_gt_per_tile = 2,
+	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
+			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 4,
@@ -746,6 +762,7 @@ static int xe_info_init_early(struct xe_device *xe,
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

