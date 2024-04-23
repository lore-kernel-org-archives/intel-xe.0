Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8D5C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 23:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744C311376A;
	Tue, 23 Apr 2024 23:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAAyoUd9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C7311376A
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 23:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713916028; x=1745452028;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iJ7piSpjoL5c5vq1Z/nhbSSTLzTxm6ZSaOG0XyXjolw=;
 b=DAAyoUd9zuJTNSruHZ/eRDAkB8bZ5p60zStq8A1sUR1kFT65aQ4eJS3Q
 wH+mHkzFsbFQ5gyTauV1VURTm2ebX8rWLmFB2fqjfaJ8CPC98ZT81ePT5
 OyWL9j0cbJwXA1XWWmW1HOnDmhdzT4xEYgoya3jED0hDzzJPSrwARgCeQ
 lTSX0fm2W0z9qI+OfjuVBlb5j9iMiS5kSsJHUWCAGwMv4OzENVXlQj9+S
 OOvwBJBKvfTzTUhEtzjdXyBaWkYwkUoWvMThGYHX59HS+BupSmHokR9vK
 niNdh06/GvRBUyFaVqbm+MtmVeJlfptQDK8GaEZBrrlWYGlsTWVGNOQbP w==;
X-CSE-ConnectionGUID: MrLrqbRNQJOhqRxPO1pxdw==
X-CSE-MsgGUID: h8ARWOARRXCIfWGg6GOPZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9634772"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9634772"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:47:08 -0700
X-CSE-ConnectionGUID: oTm7lrf3SemUJAxJG+Ncug==
X-CSE-MsgGUID: wowsri1ZQP2I6Z2dcqT+xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="25039861"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:47:08 -0700
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Use distinct error code in VM_CREATE for device fault
 mode checks
Date: Tue, 23 Apr 2024 16:47:07 -0700
Message-ID: <20240423234707.6587-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.43.0
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

vm_create_ioctl doesn't allow creating new VM in fault_mode while existing
VMs are in non-fault mode, and vice-versa.
This is not necessarily the user doing anything wrong if others are sharing
the system. Instead of returning -EINVAL which suggests the user provided a
bad argument, return distinct error code of -EBUSY for this class of errors
so the user knows they can retry the vm_create when system is idle.

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 85d6f359142d..e8628a982db6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1840,16 +1840,16 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
 		return -EINVAL;
 
+	if (XE_IOCTL_DBG(xe, args->extensions))
+		return -EINVAL;
+
 	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
 			 xe_device_in_non_fault_mode(xe)))
-		return -EINVAL;
+		return -EBUSY;
 
 	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) &&
 			 xe_device_in_fault_mode(xe)))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, args->extensions))
-		return -EINVAL;
+		return -EBUSY;
 
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
 		flags |= XE_VM_FLAG_SCRATCH_PAGE;
-- 
2.43.0

