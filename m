Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E827E9A048
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 11:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6383E10E6E2;
	Thu, 19 Feb 2026 11:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWeJkfP3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8749610E6DB
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 11:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771501103; x=1803037103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qfBnrgSVM0lHlMHidbwuMnLGstrk6TzYOCC1zOzUzds=;
 b=NWeJkfP3+p1hYpFV2feEjQabOLBTc4/E+/M27olf96g5njmvGGb/HkyP
 iaC8dVbQbVCEZt19ziDs8RFNyKzDqH4Y3rh4bxIzWSye5Dz28JfFpmbDI
 XgPqaPDE5Ttv16de0z+xaVjYT2SpreHnHRzT3qirXeg5fkDZLuqgPsgso
 7LmC99V11kc5aqBbiP95ZX0GABIUM7F3OVmYICZeWzFnLgaCgxyrEEI66
 PrsB+IdK3kDHhiP15XSBZzOAiTZfgbbcK6akyagRa2sItXfx89et2xnAq
 yQuSQqz7u4d9ZxMNLL/oaNe1/vLMjfd9n/J9wkNjbh/P4BHTMmCv51eh1 Q==;
X-CSE-ConnectionGUID: YE/Z+xPRTV2ZTL1hxsw2vA==
X-CSE-MsgGUID: LOP+EIatRayLUHTQVzCA5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76199668"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="76199668"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 03:38:23 -0800
X-CSE-ConnectionGUID: o3YYSKDRSn2m5f7pSODB5w==
X-CSE-MsgGUID: mUx67vVbRZiVd+Zg9gdYHw==
X-ExtLoop1: 1
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 03:38:21 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 3/4] drm/xe/xe3p_lpg: Enable L2 flush optimization feature
Date: Thu, 19 Feb 2026 17:07:47 +0530
Message-ID: <20260219113743.1588081-9-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260219113743.1588081-6-tejas.upadhyay@intel.com>
References: <20260219113743.1588081-6-tejas.upadhyay@intel.com>
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        | 3 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h   | 1 +
 drivers/gpu/drm/xe/xe_vm.c         | 7 +++++++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 4 ++++
 4 files changed, 15 insertions(+)

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
index c06fd250e037..091825a34138 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3474,6 +3474,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
+		    XE_IOCTL_DBG(xe, xe_device_is_l2_flush_optimized(xe) &&
+				 (op == DRM_XE_VM_BIND_OP_MAP_USERPTR ||
+				  /* dmabuf */
+				  op == DRM_XE_VM_BIND_OP_MAP ||
+				  /* svm */
+				  op == (DRM_XE_VM_BIND_OP_MAP && is_cpu_addr_mirror)) &&
+				 (pat_index != 19 || coh_mode != XE_COH_2WAY)) ||
 		    XE_IOCTL_DBG(xe, comp_en &&
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 1a1ad8c07d49..e68ee5b092d6 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -304,6 +304,10 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 		if (XE_WARN_ON(coh_mode > XE_COH_2WAY))
 			return false;
 
+		if (XE_IOCTL_DBG(xe, xe_device_is_l2_flush_optimized(xe) &&
+				 (pat_index != 19 || coh_mode != XE_COH_2WAY)))
+			return false;
+
 		if (XE_IOCTL_DBG(xe, args->pat_index.pad))
 			return false;
 
-- 
2.52.0

