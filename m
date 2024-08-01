Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4C0C52D6F
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 12:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206A910E967;
	Thu,  1 Aug 2024 12:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bHXIojUT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F4F10E965
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722517109; x=1754053109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wV24pnWU4D4CzkH3UarHZXPkkiSa64SRR/1OM+fYick=;
 b=bHXIojUTCSNLn17QhA/FewWJRQQkncNFJoPd+RyNURlYZjm/J58nEx52
 7jJ+F5ICUD0vEv4RHyVUOuMd4TI85RQ++n9AJTO+e9aUzkmVYlHy3xgA8
 5Vls931V+5l/qJGSdB89PJYqTQfCNrgCRxwlD5hnnO/MEsC6t56meXxlK
 D0Yh4lH63thf1WOQB49dBy9Yh58qazLtC9fV2ncsU0l0LQfn0xaRlKkED
 fEYmlSo1zw/Ppd+BC1xxU4N/OH21ZIDHnanFt2RrdCSwlJnO3EvxBZlEp
 kZaRTMv4Ae8inmnGMTyh+UzajJXbDl/5RgTUWe8O0HOjM0rxxPBman6TH g==;
X-CSE-ConnectionGUID: zHghx7IrRiiDmbs4b/0swQ==
X-CSE-MsgGUID: A8Ur/ap/QDWSmO4D65Doxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20357170"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20357170"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:26 -0700
X-CSE-ConnectionGUID: bffTtM+aSs2NNIseO1SWjQ==
X-CSE-MsgGUID: QwFQCGXoR2OkolIpJ4KGfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55110122"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.243])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:25 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 12/13] drm/xe/vm: Remove restriction that all VMs must be
 faulting if one is
Date: Thu,  1 Aug 2024 14:56:53 +0200
Message-ID: <20240801125748.355078-13-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801125748.355078-1-francois.dugast@intel.com>
References: <20240801125748.355078-1-francois.dugast@intel.com>
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

