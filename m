Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC427C3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 19:36:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77E510E7AE;
	Wed, 24 Jul 2024 19:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ht13nINm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB56E10E7A8
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 19:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721849715; x=1753385715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dvN+/jFLpBLNXA9ddOlUhPSqCxvmoBgxTYSKGpWe9YQ=;
 b=ht13nINmqUGL1qyLIXBsXChoa5L1g7wesBUalT6R1DJud0itccOCNO+c
 s58G7ZQ6UAhWpEcwB54FJEXWQmEVXBprgaTq5cEDkjjy16eYFHh9fwhpm
 2CSnL8vVCYMAYSbdOsFIxfYhyqZXMZl7Mo/A85qJiOxUuLoy5x7kZ/P2C
 C4KU2lb/gKX+hxd2BNPsYaDf/yq2PUNgQI6FJ3yS0j0htrTG/rDLEr3Cm
 gXpraL2Jw9QnQw03xzF1VGo3V7xLaYk1b+wIraUCX/27mXthWaCxLOXuJ
 RUPV2S1slRN6KezcVadrQHldLxr88zpr4P4lACJKQz0hqj5ql4iGOLN4z g==;
X-CSE-ConnectionGUID: jCZuzN9YSFGwrRvqpMS/aQ==
X-CSE-MsgGUID: olvRCz5dRk+diZPW8Xx1ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19691145"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19691145"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:35:15 -0700
X-CSE-ConnectionGUID: 5x/YN5m4TVqncL9VihPkJA==
X-CSE-MsgGUID: lPiIVCHAT0mF09iAvH236Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83292325"
Received: from ntgaliba-mobl2.amr.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.180])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:35:14 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 11/12] drm/xe/vm: Remove restriction that all VMs must be
 faulting if one is
Date: Wed, 24 Jul 2024 21:33:04 +0200
Message-ID: <20240724193431.2685833-12-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240724193431.2685833-1-francois.dugast@intel.com>
References: <20240724193431.2685833-1-francois.dugast@intel.com>
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
---
 drivers/gpu/drm/xe/xe_vm.c | 8 --------
 1 file changed, 8 deletions(-)

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

