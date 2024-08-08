Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507AEC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 18:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2114310E7D7;
	Thu,  8 Aug 2024 18:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jzwixbeM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD1210E7DA
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 18:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723142568; x=1754678568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RCYrRBsasdbhxdf/gxM82+NFKIypTcxcuQEoPKQl3Bs=;
 b=jzwixbeMMMPuOrBhhwwAzAFxruvr7bSBpBKgKVKIEY4tZRE81PxSiq+A
 s9b0w3KpVsMsNNlQpvu+rDF8C9xayKW1ujBq44LVB4tglvDM7u2EzFA97
 Tf4Er1qJ838aiiKKiO6nLKAHC1hBfwS+yAdTZ2U712Z8rqFJ/wISPMAnh
 UkUH6eLkukjY/64WdB5twoWHvcDx6VZx8MZvWICiynGWW/RaCaihWJh7x
 beazBuZjC7qTJPJyVOsKRR94bhSj2kE2OtwE2qlFTy00kCNfsOvC//JRc
 ffOQyMy3/XXcCkdt/niIWbsghrWbs3Cf3Kn5mrQNhkfDyk1mEg4yXLL7c Q==;
X-CSE-ConnectionGUID: hGolxgrXRSeKMBqsrjpuVg==
X-CSE-MsgGUID: uhJ/mE3JS52jm4yapFgrzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31921614"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="31921614"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:48 -0700
X-CSE-ConnectionGUID: M2r7+s0pRnSoOKKHTc127A==
X-CSE-MsgGUID: YmIkieCDQLqRYkJTtHLLSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="56975938"
Received: from ettammin-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.209])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:46 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v8 10/11] drm/xe/vm: Remove restriction that all VMs must be
 faulting if one is
Date: Thu,  8 Aug 2024 20:40:28 +0200
Message-ID: <20240808184220.1715625-11-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808184220.1715625-1-francois.dugast@intel.com>
References: <20240808184220.1715625-1-francois.dugast@intel.com>
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

With this restriction, all VMs on the device must be faulting VMs if there
is already one faulting VM, in which case the device is considered in
fault mode. This prevents for example an application from running 3D jobs
for the compositor while submitting a SVM compute job on the same device.

Now that mutual exclusion of faulting LR jobs and dma fence jobs is
ensured on the hw engine group, remove this restriction to allow running
faulting and non-faulting VMs on the same device.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b715883f40d8..7a88c65759c9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1769,14 +1769,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
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

