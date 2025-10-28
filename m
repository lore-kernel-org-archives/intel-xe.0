Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7871CCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 13:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9529710E3E5;
	Tue, 28 Oct 2025 13:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ba5GhCoT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EE210E3E5
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 13:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761657352; x=1793193352;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c96vjxLI05HS+P90CHUS+o88h6EelyRfxSr4CNASLQc=;
 b=Ba5GhCoTMan1RkBryorChIahlLjWxOVRbFRA5nZjAuezaSRfPy7UI6Zk
 hhHdTTQobWp9V81ny+o4yKD9ywt+Cxp+3eZ4epViVurlKAZ4tP9XSUA8Y
 WsOTxUPT3zN8ZNiZa3/eapg2XWZbdoTHYjZMwRSuPFrdVnm0+WwB8VGlo
 5E6LOji668DxXyZ84ZztmE9jwYzok1blNd24hzxRsw0SIZDuZRDttd9D4
 c/mSc/AOTQfN4unsQsDDOT6mq71kU8qXTqQoeNhcr/MjMRiv6AY8BBBuc
 1a5/hU5vZ2zIyLXmkMKCBCMOhu5TxxQYud9/WHszaJFQWREoFgW57QJny A==;
X-CSE-ConnectionGUID: U1qteTWZQ1SUdJ2P2NIvKw==
X-CSE-MsgGUID: npELfi2SRF6xNDpw/HF4LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74041793"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="74041793"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 06:15:51 -0700
X-CSE-ConnectionGUID: MvKm2WlaSdKT/U4Gjefu7g==
X-CSE-MsgGUID: DSbf78XaR/atSP4yr7/+MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189658380"
Received: from sanjay-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 06:15:49 -0700
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	jose.souza@intel.com
Subject: [PATCH] drm/xe/uapi: Implement DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION
 flag
Date: Tue, 28 Oct 2025 18:40:32 +0530
Message-ID: <20251028131031.2052163-2-sanjay.kumar.yadav@intel.com>
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

Let userspace opt out of CCS compression on a per-BO basis. When set,
the driver maps this to XE_BO_FLAG_NO_COMPRESSION, skips CCS metadata
allocation/clearing, and rejects compressed PAT indices at vm_bind.
This avoids extra memory ops and manual CCS state handling for buffer.

Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c  | 15 +++++++++++++--
 drivers/gpu/drm/xe/xe_bo.h  |  1 +
 drivers/gpu/drm/xe/xe_pat.c |  9 ++++++++-
 drivers/gpu/drm/xe/xe_pat.h | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c  |  6 ++++++
 include/uapi/drm/xe_drm.h   | 13 +++++++++++++
 6 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7b6502081873..1421537ef9fc 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3160,7 +3160,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->flags &
 			 ~(DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
 			   DRM_XE_GEM_CREATE_FLAG_SCANOUT |
-			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)))
+			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
+			   DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION)))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, args->handle))
@@ -3182,6 +3183,12 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
 		bo_flags |= XE_BO_FLAG_SCANOUT;
 
+	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION) {
+		if (GRAPHICS_VER(xe) < 20)
+			return -EINVAL;
+		bo_flags |= XE_BO_FLAG_NO_COMPRESSION;
+	}
+
 	bo_flags |= args->placement << (ffs(XE_BO_FLAG_SYSTEM) - 1);
 
 	/* CCS formats need physical placement at a 64K alignment in VRAM. */
@@ -3503,8 +3510,12 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 	 * Compression implies coh_none, therefore we know for sure that WB
 	 * memory can't currently use compression, which is likely one of the
 	 * common cases.
+	 * Additionally, userspace may explicitly request no compression via the
+	 * DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION flag, which should also disable
+	 * CCS usage.
 	 */
-	if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)
+	if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB ||
+	    bo->flags & XE_BO_FLAG_NO_COMPRESSION)
 		return false;
 
 	return true;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 353d607d301d..1217e386e697 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -50,6 +50,7 @@
 #define XE_BO_FLAG_GGTT3		BIT(23)
 #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
 #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
+#define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 6e48ff84ad0a..991eeb551a72 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -115,7 +115,8 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
 			REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
 			REG_FIELD_PREP(XE2_COH_MODE, __coh_mode), \
 		.coh_mode = (BUILD_BUG_ON_ZERO(__coh_mode && comp_en) || __coh_mode) ? \
-			XE_COH_AT_LEAST_1WAY : XE_COH_NONE \
+			XE_COH_AT_LEAST_1WAY : XE_COH_NONE, \
+		.compressed = comp_en, \
 	}
 
 static const struct xe_pat_table_entry xe2_pat_table[] = {
@@ -160,6 +161,12 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
 	return xe->pat.table[pat_index].coh_mode;
 }
 
+bool xe_pat_index_has_compression(struct xe_device *xe, u16 pat_index)
+{
+	xe_assert(xe, pat_index < xe->pat.n_entries);
+	return xe->pat.table[pat_index].compressed;
+}
+
 static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 			int n_entries)
 {
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 268c9a899f56..07319fca5f4c 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -29,6 +29,11 @@ struct xe_pat_table_entry {
 #define XE_COH_NONE          1
 #define XE_COH_AT_LEAST_1WAY 2
 	u16 coh_mode;
+
+	/**
+	 * @compressed: Whether compression is enabled or not with @value.
+	 */
+	bool compressed;
 };
 
 /**
@@ -53,4 +58,14 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
  */
 u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
 
+/**
+ * xe_pat_index_has_compression - Check if the given pat_index enables
+ * compression.
+ * @xe: xe device
+ * @pat_index: The pat_index to query
+ *
+ * Note: Only applicable to Xe2+, where compression is part of the PAT index.
+ */
+bool xe_pat_index_has_compression(struct xe_device *xe, u16 pat_index);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 179758ca7cb8..98990ab14c85 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3486,6 +3486,12 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 {
 	u16 coh_mode;
 
+	/* Reject compressed PAT index for BO with NO_COMPRESSION flag */
+	if ((bo->flags & XE_BO_FLAG_NO_COMPRESSION) &&
+	    xe_pat_index_has_compression(xe, pat_index))
+		return -EINVAL;
+
+
 	if (XE_IOCTL_DBG(xe, range > xe_bo_size(bo)) ||
 	    XE_IOCTL_DBG(xe, obj_offset >
 			 xe_bo_size(bo) - range)) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 40ff19f52a8d..07dea4a9dfd3 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -787,6 +787,18 @@ struct drm_xe_device_query {
  *    need to use VRAM for display surfaces, therefore the kernel requires
  *    setting this flag for such objects, otherwise an error is thrown on
  *    small-bar systems.
+ *  - %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION - Allows userspace to
+ *    hint that compression (CCS) should be disabled for the buffer being
+ *    created. This can avoid unnecessary memory operations and CCS state
+ *    management.
+ *    On pre-Xe2 platforms, this flag is currently rejected as compression
+ *    control is not supported via PAT index. On Xe2+ platforms, compression
+ *    is controlled via PAT entries. If this flag is set, the driver will reject
+ *    any VM bind that requests a PAT index enabling compression for this BO.
+ *    Note: On dGPU platforms, there is currently no change in behavior with
+ *    this flag, but future improvements may leverage it. The current benefit is
+ *    primarily applicable to iGPU platforms.
+
  *
  * @cpu_caching supports the following values:
  *  - %DRM_XE_GEM_CPU_CACHING_WB - Allocate the pages with write-back
@@ -833,6 +845,7 @@ struct drm_xe_gem_create {
 #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
 #define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
 #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
+#define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION		(1 << 3)
 	/**
 	 * @flags: Flags, currently a mask of memory instances of where BO can
 	 * be placed
-- 
2.43.0

