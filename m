Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E019DC52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 15:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF37C10E971;
	Fri,  9 Aug 2024 15:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="auH39VQ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F66610E970
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 15:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723218746; x=1754754746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K3O3Ja+TV5iUpjogN2VZcmD+VypjtghSlnoZVzlREc4=;
 b=auH39VQ9XBHkNlNmwuPo2Q0AsCi1t8A6u8xYAIvfbFdHjnICqmgSHq+d
 MVraT7ZN4uemoynxMwm7GVv8C2qw7MC+SslN/jvpiBVu0JPK3HezLCCCb
 Ouej96EBj/JsgjAvDGLGMDA4S82UPnVzRMR9zLQSNFqnEhpMaZcWtqcLz
 O41NngiDmy3eIUpt9JfK+4mmMRK4jspi0Roe0UUuVhIUHdlXk6vA+n3J1
 OQOjZvDj15uC3Tfuy0jCy+CjgDqE3jhfHyL9q4wStOlbMS8nBcl8G0f3s
 rfsbM6zjjLP6g/xHRfEZ3wS8/zc8AK4FfBV2djR/OJNormQ7EnZrfPvMU g==;
X-CSE-ConnectionGUID: H96NXpO4RgedifLUE0s/xw==
X-CSE-MsgGUID: qAW90GgaTJq4xw2ixn+CPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21207413"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21207413"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:52:26 -0700
X-CSE-ConnectionGUID: vJhDSQaYQIOwhZXL4f7EFg==
X-CSE-MsgGUID: 9X022/oZRQaR2vZ6Po2UlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="61728859"
Received: from sbutnari-mobl1.ti.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.16])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:52:24 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v9 10/11] drm/xe/vm: Remove restriction that all VMs must be
 faulting if one is
Date: Fri,  9 Aug 2024 17:51:35 +0200
Message-ID: <20240809155156.1955925-11-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809155156.1955925-1-francois.dugast@intel.com>
References: <20240809155156.1955925-1-francois.dugast@intel.com>
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
index dab2a3b2e17f..a4f867d4e233 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1770,14 +1770,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
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

