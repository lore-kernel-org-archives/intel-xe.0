Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3008AC55190
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 10:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A8610E7E1;
	Fri, 20 Feb 2026 10:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TfZDPWwE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F2E10E7DD
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 10:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771582618; x=1803118618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kk4FntnxT0rg1/pm9CLE7Ok/q8XZOyufBfFd0yGtFNc=;
 b=TfZDPWwEA/4+mCSIUb9MONl8JHyqZ9NMVr5cyfON3qKbcMEk12GhLAES
 zm4jA62pEclKfj31ARKX1C0gj2EtbDFexnNrLvS6yBjt4u1ez6dcW6aIU
 QGxpFEUbcEHIrc8hBGz2uBtpZmb8vPn/cZxyTraCaqRvpmgl3T0xHXq3m
 LrsO5UJa+QOQSTl2KM6NRYu93umo7+W9skyQlYNqx7ZywXCtBSie75DyU
 +TaIkh+BkxpPNBNj1pdSsUfxpLBEncDIsGD2GyU6zywNEFMEUMWoTjpt7
 xOizj/KCwSRabOh9UAVU6mmkFct3/0h9vBnV3aFY3Z4NWghTVxQlA+GKk A==;
X-CSE-ConnectionGUID: jgjCbDreQMeMckibATY+Lg==
X-CSE-MsgGUID: 8OKreo9OR32QjnoQ6akxAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72579909"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72579909"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 02:16:58 -0800
X-CSE-ConnectionGUID: Zq9WIvYEQv+gAnpj9SdYBg==
X-CSE-MsgGUID: NNKnkRt6Q6SA51IPSlCTpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="214666670"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 02:16:56 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V3 3/4] drm/xe/xe3p_lpg: Enable L2 flush optimization feature
Date: Fri, 20 Feb 2026 15:46:42 +0530
Message-ID: <20260220101638.1609775-9-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220101638.1609775-6-tejas.upadhyay@intel.com>
References: <20260220101638.1609775-6-tejas.upadhyay@intel.com>
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

When set, the L2 flush optimization feature will control
whether L2 is in Persistent or Transient mode through
monitoring of media activity.

To enable L2 flush optimization include new feature flag
GUC_CTL_ENABLE_L2FLUSH_OPT for Novalake platforms when
media type is detected.

Also, restrict userptr, svm and dmabuf mappings to be
either 2WAY or XA+1WAY

V2(MattA): validate dma-buf bos and madvise pat-index

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        |  3 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h   |  1 +
 drivers/gpu/drm/xe/xe_vm.c         |  9 +++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 18 ++++++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index cbbb4d665b8f..97c33c3dd520 100644
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
index a33ea288b907..39ff7b3e960b 100644
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
index c06fd250e037..e2e4c9648d05 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3474,6 +3474,11 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
+		    XE_IOCTL_DBG(xe, xe_device_is_l2_flush_optimized(xe) &&
+				 (op == DRM_XE_VM_BIND_OP_MAP_USERPTR ||
+				  /* svm */
+				  op == (DRM_XE_VM_BIND_OP_MAP && is_cpu_addr_mirror)) &&
+				 (pat_index != 19 || coh_mode != XE_COH_2WAY)) ||
 		    XE_IOCTL_DBG(xe, comp_en &&
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&
@@ -3608,6 +3613,10 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
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
index 1a1ad8c07d49..2a35dbeba2d8 100644
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
@@ -447,6 +448,15 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	if (err || !madvise_range.num_vmas)
 		goto madv_fini;
 
+	pat_index = array_index_nospec(args->pat_index.val, xe->pat.n_entries);
+	coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
+	if (XE_IOCTL_DBG(xe, madvise_range.has_svm_userptr_vmas &&
+			 xe_device_is_l2_flush_optimized(xe) &&
+			 (pat_index != 19 || coh_mode != XE_COH_2WAY))) {
+		err = -EINVAL;
+		goto madv_fini;
+	}
+
 	if (madvise_range.has_bo_vmas) {
 		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
 			if (!check_bo_args_are_sane(vm, madvise_range.vmas,
@@ -464,6 +474,14 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 
 				if (!bo)
 					continue;
+
+				if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach &&
+						 xe_device_is_l2_flush_optimized(xe) &&
+						 (pat_index != 19 || coh_mode != XE_COH_2WAY))) {
+					err = -EINVAL;
+					goto err_fini;
+				}
+
 				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
 				drm_exec_retry_on_contention(&exec);
 				if (err)
-- 
2.52.0

