Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1357CC1B0FF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 15:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D135910EB26;
	Thu, 27 Feb 2025 15:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bawGNOEl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F52B10EB26
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 15:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740671631; x=1772207631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8PZ/m9r3pEKtjQZ6/JgSDHbkP5/r72HYjP/ZvlbYDpQ=;
 b=bawGNOElKme9xYEutSKS6JIbG7z1QxtlCq6gRm2pHMreNaIvB313M5fM
 /3SlDDcyAH3K5Bg9ngXKFKYwE9QpGZlwSrpYy3FxB/JMX91qsvQcUeoMJ
 qmKIjo/4cFlA8Sn64gZpjGGWC+BXfDAf9vXBIEdAFB9q3X1PgeyiyWZ/v
 3Hskj3oyc/LwzHkxskn0alLJXO4D6r9/ITA7dO1ByoQuMZM1uRZp+Sv8x
 NtU1ZIAibGxAjHlwzGxK38tYHMTEivxQd/F3V42H70lvALmHqDe7JB8uI
 jJSeXywM1aGEnsBApvXT8afMBkY//DUv53kFuienBBI/I8F63rpr1OWNX w==;
X-CSE-ConnectionGUID: KYs0I1jaSOSByd1/WOo6fw==
X-CSE-MsgGUID: t93JcoP1SymzZYM8DR1hjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41273513"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="41273513"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 07:53:50 -0800
X-CSE-ConnectionGUID: zduT6DjeSLeolh5thYjipg==
X-CSE-MsgGUID: Cfxf4CwvShybsgUWQcjFlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121188684"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 07:53:50 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com
Subject: [PATCH v6 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
Date: Thu, 27 Feb 2025 11:09:52 -0500
Message-Id: <20250227160952.807885-4-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250227160952.807885-1-oak.zeng@intel.com>
References: <20250227160952.807885-1-oak.zeng@intel.com>
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
---
 drivers/gpu/drm/xe/xe_vm.c | 3 ++-
 include/uapi/drm/xe_drm.h  | 6 +++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6f50394dd877..3148899298c3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1791,7 +1791,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
-			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
+			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
+			 !xe->info.needs_scratch))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 76a462fae05f..7471eaa669bc 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -911,7 +911,11 @@ struct drm_xe_gem_mmap_offset {
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

