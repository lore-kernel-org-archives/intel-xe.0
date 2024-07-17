Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3BEC3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 13:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9B410EAF6;
	Wed, 17 Jul 2024 13:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ka6gxaut";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6C410EAEE
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 13:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721221734; x=1752757734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RU21r8MmpKd9FUJMNLwsnph2qc7UdYo9G9JLzQ01Pa4=;
 b=Ka6gxautqg/S1JcKn96wEmlfmacKJK8LUOvcWiuxX2cDgFem1SAezxoa
 ZROw3Rulev9hXT0F9kZO8WhEhZAyPc8o4R9286+KVBOurQzRpcjI7ps/x
 tUy5fwsqxr81hPJT86GcnY32kb0z3+nh1hoa9C8aCpfHL8KZcgiriINQk
 nH+w9QuiPA0U6NzmYlqSfS2GurOAAKhfWK4PfxKCXqLzb+hvWPWVhCAF3
 r+O2umm2aiqPgsrx8WUP8pkQtwc31nw2bYZaG89Y5Ny2UEpAQZHUUDx3i
 k7FzFFZSvUUKtdaPddkGHmUjO14weQ1rfE6QXLxdQIKjnm9uuCqYSeg2k A==;
X-CSE-ConnectionGUID: Ey4YdSidQbyRN50xuAv5BQ==
X-CSE-MsgGUID: gx4ZUBjYR/mmmfMEd9TD4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18832089"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18832089"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:54 -0700
X-CSE-ConnectionGUID: cmDRyzllRmC/f6tDM4kuaA==
X-CSE-MsgGUID: kmrsufTHQdSTuZWR34XIPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="55532083"
Received: from rajritu-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:53 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [RFC v1 9/9] drm/xe/vm: Remove restriction that all VMs must be
 faulting if one is
Date: Wed, 17 Jul 2024 15:07:30 +0200
Message-ID: <20240717130821.1073379-10-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717130821.1073379-1-francois.dugast@intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
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

With this restriction, all VMs on the device must be faulting VMs
if there is already one faulting VM, in which case the device is
considered in fault mode. This prevents for example an application
from running 3D jobs for the compositor while submitting a SVM
compute job on the same device.

Now that mutual exclusion of LR jobs and dma fence jobs is ensured
on the hw engine group, remove this restriction to allow running
faulting and non-faulting VMs on the same device.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 10 ----------
 drivers/gpu/drm/xe/xe_vm.c     |  8 --------
 2 files changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index bb07f5669dbb..cb69ecf02c25 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -129,16 +129,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 
 void xe_device_assert_mem_access(struct xe_device *xe);
 
-static inline bool xe_device_in_fault_mode(struct xe_device *xe)
-{
-	return xe->usm.num_vm_in_fault_mode != 0;
-}
-
-static inline bool xe_device_in_non_fault_mode(struct xe_device *xe)
-{
-	return xe->usm.num_vm_in_non_fault_mode != 0;
-}
-
 static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
 {
 	return xe->info.has_flat_ccs;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5b166fa03684..f0d2dc41a25d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1875,14 +1875,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
-			 xe_device_in_non_fault_mode(xe)))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) &&
-			 xe_device_in_fault_mode(xe)))
-		return -EINVAL;
-
 	if (XE_IOCTL_DBG(xe, args->extensions))
 		return -EINVAL;
 
-- 
2.43.0

