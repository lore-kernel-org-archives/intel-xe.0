Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41D4E67A6E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 06:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8325610E63E;
	Tue,  3 Mar 2026 06:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9MvL+9M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5782610E63E
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 06:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772519101; x=1804055101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iYtBt6vtMW/lCrH+QEZpTKQ+wxG/bSswn01PPC38wgM=;
 b=a9MvL+9MpJN1mQMriXJlFJ+lAe18XHepZMdjoKocyLd9fPoh9QeFKHRd
 n8UhJiA/C+QIFJqlQ1gRj5v7DwumaPHEGnsoj0lhBtzKe0KjqEwAJRuLj
 UCbXiMkFkDuHdHV4YSN1b2eKvvSy4H/zanaIodDZF9CyknEOCRoTeg9v8
 y+L+34MhUznQLdLDAR5v2xzfdhwFOkjXuPIW7xziqiD0b4TM8lmHCLaQS
 OBOjqoK3SBalNJgQ9CjGW4T+C3olci7myL3UXstZe9LHZ9Vbnmmn+gtt4
 5yJelYvNfv+/ahWo2SpKLGB7NpJLl9y0iGP+BGbdFKL/bJ4l9Z8kBQiON A==;
X-CSE-ConnectionGUID: R8NaoQlgQzKnfscZfN7tfQ==
X-CSE-MsgGUID: aVTCkNPzSDuDitleyLTN4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="85008904"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="85008904"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 22:25:01 -0800
X-CSE-ConnectionGUID: VN983FvuSnuSQCtvIBE6BA==
X-CSE-MsgGUID: hj2XcC5jTGOhqn1q/TuPpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="222383725"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 22:24:57 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 carl.zhang@intel.com, jose.souza@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: [PATCH V5 3/4] drm/xe/xe3p_lpg: Restrict UAPI to enable L2 flush
 optimization
Date: Tue,  3 Mar 2026 11:54:45 +0530
Message-ID: <20260303062441.1860959-9-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260303062441.1860959-6-tejas.upadhyay@intel.com>
References: <20260303062441.1860959-6-tejas.upadhyay@intel.com>
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

When set, starting xe3p_lpg, the L2 flush optimization
feature will control whether L2 is in Persistent or
Transient mode through monitoring of media activity.

To enable L2 flush optimization include new feature flag
GUC_CTL_ENABLE_L2FLUSH_OPT for Novalake platforms when
media type is detected.

Tighten UAPI validation to restrict userptr, svm and
dmabuf mappings to be either 2WAY or XA+1WAY

V4(MattA): Modify uapi doc and commit
V3(MattA): check valid op and pat_index value
V2(MattA): validate dma-buf bos and madvise pat-index

Acked-by: Michal Mrozek <michal.mrozek@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        |  3 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h   |  1 +
 drivers/gpu/drm/xe/xe_vm.c         |  8 ++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 23 +++++++++++++++++++++++
 include/uapi/drm/xe_drm.h          |  4 +++-
 5 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 54d2fc780127..43dc4353206f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -98,6 +98,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 	if (xe_guc_using_main_gamctrl_queues(guc))
 		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
 
+	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe) && xe_gt_is_media_type(guc_to_gt(guc)))
+		flags |= GUC_CTL_ENABLE_L2FLUSH_OPT;
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index bb8f71d38611..b73fae063fac 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -67,6 +67,7 @@ struct guc_update_exec_queue_policy {
 #define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
 #define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
 #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
+#define   GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
 
 #define GUC_CTL_DEBUG			3
 #define   GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index da0ce0b3704c..424e1c742b95 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3481,6 +3481,10 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
+		    XE_IOCTL_DBG(xe, xe_device_is_l2_flush_optimized(xe) &&
+				 (op == DRM_XE_VM_BIND_OP_MAP_USERPTR ||
+				  is_cpu_addr_mirror) &&
+				 (pat_index != 19 || coh_mode != XE_COH_2WAY)) ||
 		    XE_IOCTL_DBG(xe, comp_en &&
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&
@@ -3615,6 +3619,10 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach && comp_en))
 		return -EINVAL;
 
+	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach && xe_device_is_l2_flush_optimized(xe) &&
+			 (pat_index != 19 || coh_mode != XE_COH_2WAY)))
+		return -EINVAL;
+
 	/* If a BO is protected it can only be mapped if the key is still valid */
 	if ((bind_flags & DRM_XE_VM_BIND_FLAG_CHECK_PXP) && xe_bo_is_protected(bo) &&
 	    op != DRM_XE_VM_BIND_OP_UNMAP && op != DRM_XE_VM_BIND_OP_UNMAP_ALL)
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 1a1ad8c07d49..e669e578618b 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -411,6 +411,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
 							 .range =  args->range, };
 	struct xe_madvise_details details;
+	u16 pat_index, coh_mode;
 	struct xe_vm *vm;
 	struct drm_exec exec;
 	int err, attr_type;
@@ -447,6 +448,17 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	if (err || !madvise_range.num_vmas)
 		goto madv_fini;
 
+	if (args->type == DRM_XE_MEM_RANGE_ATTR_PAT) {
+		pat_index = array_index_nospec(args->pat_index.val, xe->pat.n_entries);
+		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
+		if (XE_IOCTL_DBG(xe, madvise_range.has_svm_userptr_vmas &&
+				 xe_device_is_l2_flush_optimized(xe) &&
+				 (pat_index != 19 || coh_mode != XE_COH_2WAY))) {
+			err = -EINVAL;
+			goto madv_fini;
+		}
+	}
+
 	if (madvise_range.has_bo_vmas) {
 		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
 			if (!check_bo_args_are_sane(vm, madvise_range.vmas,
@@ -464,6 +476,17 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 
 				if (!bo)
 					continue;
+
+				if (args->type == DRM_XE_MEM_RANGE_ATTR_PAT) {
+					if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach &&
+							 xe_device_is_l2_flush_optimized(xe) &&
+							 (pat_index != 19 ||
+							  coh_mode != XE_COH_2WAY))) {
+						err = -EINVAL;
+						goto err_fini;
+					}
+				}
+
 				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
 				drm_exec_retry_on_contention(&exec);
 				if (err)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ef2565048bdf..862fed3cf1ed 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1103,7 +1103,9 @@ struct drm_xe_vm_bind_op {
 	 * incoherent GT access is possible.
 	 *
 	 * Note: For userptr and externally imported dma-buf the kernel expects
-	 * either 1WAY or 2WAY for the @pat_index.
+	 * either 1WAY or 2WAY for the @pat_index. Starting from NVL-P, for
+	 * userptr, svm, madvise and externally imported dma-buf the kernel expects
+	 * either 2WAY or 1WAY and XA @pat_index.
 	 *
 	 * For DRM_XE_VM_BIND_FLAG_NULL bindings there are no KMD restrictions
 	 * on the @pat_index. For such mappings there is no actual memory being
-- 
2.52.0

