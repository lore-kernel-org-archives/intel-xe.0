Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D880CC02193
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 22:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CBB10E3EF;
	Tue, 28 Jan 2025 22:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gpUmnrGt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5640F10E3F2
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 22:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738101993; x=1769637993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eYzDwRVaXushQJgwAEX3tw0ZjJxT8bMmmPb5W/FdC6A=;
 b=gpUmnrGtNBBmaH3SGQAh1ub69tDH8wvzMDQHn0KhOiSb8bkhh6VeoX26
 7iNT3qnhf0B4+XJ3qpK5wkpI8LgPIN7cz7trRKaqATu6DHaS9/Z1q6D0w
 4/Y/vEzJWQPXk+QBkvHEhMyyu5Iu6Xk9fImzbPE4y4ah2uPHx960lOjHV
 zNYBRUkVkAqkoJYWMv8eXlOQqK+WFDxc+a+MHUszfzyUmPnbCaoZA+iAD
 MtkmU9IpDwzMExDHYREdEN9J1aPUQKCN9C4UujnhDEm6T20xj+fTDqIW3
 Id//29w3mZFYVj3XVFCNFIWw+7r/TRU0JdICmHG3rUjlv2fRiIPOkU7On g==;
X-CSE-ConnectionGUID: hyRdpfbHQ4uVsbKRbSv3WQ==
X-CSE-MsgGUID: 1rSkj8IARF+NBRjVlskqEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38488945"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38488945"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 14:06:32 -0800
X-CSE-ConnectionGUID: 45E9rEgtQIar/ZNmKO4Mtg==
X-CSE-MsgGUID: 2XHCsAVCTNa51CpTBbfEWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="108665467"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 14:06:31 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: joonas.lahtinen@linux.intel.com,
	Thomas.Hellstrom@linux.intel.com
Subject: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for certain
 platform
Date: Tue, 28 Jan 2025 17:21:45 -0500
Message-Id: <20250128222145.3849874-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250128222145.3849874-1-oak.zeng@intel.com>
References: <20250128222145.3849874-1-oak.zeng@intel.com>
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

On xe2 and xe3, HW prefetching can cause page fault interrupt. Due to
page fault interrupt overhead (i.e., need Guc and KMD involved to fix
the page fault), HW prefetching can be slowed by many orders of magnitude.

Fix this problem by allowing scratch page under fault mode for xe2 and xe3.
With scratch page in place, HW prefetching could always hit scratch page
instead of causing interrupt.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 196d347c6ac0..3346f88f284a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1732,6 +1732,11 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->extensions))
 		return -EINVAL;
 
+	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
+			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
+			 !(IS_LUNARLAKE(xe) || IS_BATTLEMAGE(xe) || IS_PANTHERLAKE(xe))))
+		return -EINVAL;
+
 	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
 		args->flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
 
@@ -1745,10 +1750,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
-			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
-		return -EINVAL;
-
 	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
 			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
 		return -EINVAL;
-- 
2.26.3

