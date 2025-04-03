Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06EAC3601A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 16:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C16610E28D;
	Thu,  3 Apr 2025 16:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/JOg/Nk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1BD10E29E
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 16:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743698194; x=1775234194;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+HF0zKjBzsuw0FLP7BOTEs9nh8hrlO8A6F0ebakiBHI=;
 b=m/JOg/Nk4k+D0AMOIAOsmXK+YnDLkjvCKgAM5TkCNCo93g1M9R8iSNDG
 AgmDXxBVMDtUFdTeBrTEAnERWO7XJSATouYQ23pc/j17T0FBhh8Zu1Inm
 Yji492plGYiKBCH02em5bVRUH+ggZtAaoWdh4Eth6mjVA7q/wPC/BJfeN
 oKigigWUZF9eAWbRq2HHKYfreISNru0tC8sD0V993JNyeC6sKHIlBIWJ0
 8pLRU3tu4po6MHxMjqdp8Yy44CtJIUBTEMCBP1Jv1Ve5cxsSfeI4hpXSz
 jBF9UVS8UHM0UHHBp2w+EDU8s8001tffKUsXS3RSRlMjzkDKzuK3gZ+AW A==;
X-CSE-ConnectionGUID: unXXqkzFRKivH4c7lkLoqQ==
X-CSE-MsgGUID: 9MTo2fd8QRKApyYAyNhh/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="62521596"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="62521596"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 09:36:32 -0700
X-CSE-ConnectionGUID: QtpC/ZmqT6WqU0TKHZcw8A==
X-CSE-MsgGUID: RQg6Nd7LS5OoRuFggJwSqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126864617"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 09:36:32 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
Date: Thu,  3 Apr 2025 12:53:28 -0400
Message-Id: <20250403165328.2438690-4-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250403165328.2438690-1-oak.zeng@intel.com>
References: <20250403165328.2438690-1-oak.zeng@intel.com>
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

Normally scratch page is not allowed when a vm is operate under page
fault mode, i.e., in the existing codes, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
and DRM_XE_VM_CREATE_FLAG_FAULT_MODE are mutual exclusive. The reason
is fault mode relies on recoverable page to work, while scratch page
can mute recoverable page fault.

On xe2 and xe3, out of bound prefetch can cause page fault and further
system hang because xekmd can't resolve such page fault. SYCL and OCL
language runtime requires out of bound prefetch to be silently dropped
without causing any functional problem, thus the existing behavior
doesn't meet language runtime requirement.

At the same time, HW prefetching can cause page fault interrupt. Due to
page fault interrupt overhead (i.e., need Guc and KMD involved to fix
the page fault), HW prefetching can be slowed by many orders of magnitude.

Fix those problems by allowing scratch page under fault mode for xe2 and
xe3. With scratch page in place, HW prefetching could always hit scratch
page instead of causing interrupt.

A side effect is, scratch page could hide application program error.
Application out of bound accesses are hided by scratch page mapping,
instead of get reported to user.

v2: Refine commit message (Thomas)

v3: Move the scratch page flag check to after scratch page wa (Thomas)

v4: drop NEEDS_SCRATCH macro (matt)
    Add a comment to DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 ++-
 include/uapi/drm/xe_drm.h  | 6 +++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index aa70076e9218..9aa1c5cf1fa1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2049,7 +2049,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
-			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
+			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
+			 !xe->info.needs_scratch))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 616916985e3f..9c08738c3b91 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -917,7 +917,11 @@ struct drm_xe_gem_mmap_offset {
  * struct drm_xe_vm_create - Input of &DRM_IOCTL_XE_VM_CREATE
  *
  * The @flags can be:
- *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
+ *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE - Map the whole virtual address
+ *    space of the VM to scratch page. A vm_bind would overwrite the scratch
+ *    page mapping. This flag is mutually exclusive with the
+ *    %DRM_XE_VM_CREATE_FLAG_FAULT_MODE flag, with an exception of on x2 and
+ *    xe3 platform.
  *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM accepts
  *    exec submissions to its exec_queues that don't have an upper time
  *    limit on the job execution time. But exec submissions to these
-- 
2.26.3

