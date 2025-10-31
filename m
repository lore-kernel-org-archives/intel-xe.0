Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642ABCCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 12:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FC410E0BE;
	Fri, 31 Oct 2025 12:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgCo+7kj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5027210E0BE
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 12:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761915521; x=1793451521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ourHWST3/37A2VUbNVYXTqf1NnNwZqiaxY6BpZ9Qbj0=;
 b=NgCo+7kjwkCziLGhqszN/kZe9rR+N7KoCZbSlICVFuVm+m5p4+aBlJFo
 qxebNuO5LXUWlD2Zkos9VX53V2NCB8xmfD3/VG4TrcAxfKiR6LydRI+c+
 TfoQ5sn6SUHfdPNiYEH+KoATq+nkZHC5IEnyYJxwQfV/LFXN9LKBHPcXz
 V79W2LFjWcptgfUXEjXTSZwasR+IWA2bnux5AvvoRaVZFc5daQqnlHC9n
 0/k+vybBJQEny4GX/iQXLUNK17taxqlWPL8bybqvHRuk+FGLILl+dnBHK
 BMuNRqhy2AWUqm9MKIc4nzk6vsDq8Gk2cUaj6nvZb3Si8X0btnxtx2acl Q==;
X-CSE-ConnectionGUID: t8FuLx96TbiZR2khd7+ZOg==
X-CSE-MsgGUID: 9ep2gem6QsaAtx9YKgcfvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="51647378"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="51647378"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:58:41 -0700
X-CSE-ConnectionGUID: 31BbaPuURx2ORf76XX6ItA==
X-CSE-MsgGUID: 5/v1XL4NTySpIJEzZQicYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="190312643"
Received: from sanjay-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:58:31 -0700
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	jose.souza@intel.com
Subject: [PATCH v2] drm/xe/uapi: Implement
 DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION flag
Date: Fri, 31 Oct 2025 18:22:25 +0530
Message-ID: <20251031125224.2479520-2-sanjay.kumar.yadav@intel.com>
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

v2
- Changed error code from -EINVAL to -EOPNOTSUPP for unsupported flag
  usage on pre-Xe2 platforms
- Fixed checkpatch warning in xe_vm.c
- Fixed kernel-doc formatting in xe_drm.h

Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c  | 15 +++++++++++++--
 drivers/gpu/drm/xe/xe_bo.h  |  1 +
 drivers/gpu/drm/xe/xe_pat.c |  9 ++++++++-
 drivers/gpu/drm/xe/xe_pat.h | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c  |  5 +++++
 include/uapi/drm/xe_drm.h   | 12 ++++++++++++
 6 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b0bd31d14bb9..c969c2bc4249 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3183,7 +3183,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->flags &
 			 ~(DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
 			   DRM_XE_GEM_CREATE_FLAG_SCANOUT |
-			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)))
+			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
+			   DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION)))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, args->handle))
@@ -3205,6 +3206,12 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
 		bo_flags |= XE_BO_FLAG_SCANOUT;
 
+	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION) {
+		if (GRAPHICS_VER(xe) < 20)
+			return -EOPNOTSUPP;
+		bo_flags |= XE_BO_FLAG_NO_COMPRESSION;
+	}
+
 	bo_flags |= args->placement << (ffs(XE_BO_FLAG_SYSTEM) - 1);
 
 	/* CCS formats need physical placement at a 64K alignment in VRAM. */
@@ -3526,8 +3533,12 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
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
index 911d5b90461a..8ab4474129c3 100644
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
index 7649b554942a..ead372e96640 100644
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
@@ -195,6 +196,12 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
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
index 00f3520dec38..8d39b229aea3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3467,6 +3467,11 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 {
 	u16 coh_mode;
 
+	/* Reject compressed PAT index for BO with NO_COMPRESSION flag */
+	if ((bo->flags & XE_BO_FLAG_NO_COMPRESSION) &&
+	    xe_pat_index_has_compression(xe, pat_index))
+		return -EINVAL;
+
 	if (XE_IOCTL_DBG(xe, range > xe_bo_size(bo)) ||
 	    XE_IOCTL_DBG(xe, obj_offset >
 			 xe_bo_size(bo) - range)) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 47853659a705..c1456299772b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -791,6 +791,17 @@ struct drm_xe_device_query {
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
  *
  * @cpu_caching supports the following values:
  *  - %DRM_XE_GEM_CPU_CACHING_WB - Allocate the pages with write-back
@@ -837,6 +848,7 @@ struct drm_xe_gem_create {
 #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
 #define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
 #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
+#define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION		(1 << 3)
 	/**
 	 * @flags: Flags, currently a mask of memory instances of where BO can
 	 * be placed
-- 
2.43.0

