Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1396DC28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 15:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD7210E7B5;
	Wed,  2 Apr 2025 15:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfDhu4FZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4632710E7B5
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 15:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743607747; x=1775143747;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+HF0zKjBzsuw0FLP7BOTEs9nh8hrlO8A6F0ebakiBHI=;
 b=RfDhu4FZtmpdX0cmFGCar9R/z1hDEgkLy/ddN6XdRZgnGDYOSLuZQFPz
 B+8ByoZhm/DmDYSXAPDJpSdKX0xn7ewVb3EKA5wrSlzkszK5D/guQ6OdL
 ujjM0n9O55hlba5sBIb9iyQ94NVaG1JrYk9rgupgniJ0slNiNzGTi/SAE
 347tlkYVELpRuyZGSb1i8RjM/0OtPcNEN7EPiw0NvSV7YpkJ5y52AsWtL
 P23J9SZyi9ETivRQSb7tpFdlSVWiJekwMoIe8YIyAckoVZ+cnymk6FlW2
 8ABoS/DRnVWVYVfvS4MEXWyqLE+8fXr0o/ty24uVdilSinN9O4H4sID5g Q==;
X-CSE-ConnectionGUID: 8LKqU+khQ72JXTl0yf/t4g==
X-CSE-MsgGUID: dmhzTDInTSa1KtJ5MJDSUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="67447227"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="67447227"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:29:06 -0700
X-CSE-ConnectionGUID: eaainGtkStSfiU06db5w2g==
X-CSE-MsgGUID: 6LyF2g07SxWVOyF9xPfPlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="163969966"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:29:06 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
Date: Wed,  2 Apr 2025 11:46:02 -0400
Message-Id: <20250402154602.2431681-4-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250402154602.2431681-1-oak.zeng@intel.com>
References: <20250402154602.2431681-1-oak.zeng@intel.com>
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

