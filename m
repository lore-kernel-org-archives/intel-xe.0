Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E46C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 20:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3E010E38B;
	Thu, 10 Jul 2025 20:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzL9QTH0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF29F10E38B
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 20:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752180750; x=1783716750;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fJOFkF1TXXS0Lwzl6KRMlwgDTipmSJ0sQTvAH5dpDRQ=;
 b=dzL9QTH0ITaTfadKaLjJ+qH1SCW0QHLCDMFw526jbIIJ8AK74yYcqU7e
 w0LXGcu/MsjloWyX6BMeipV803Um7gDIW9eciyc0Co1lgF53YXe0fUu/j
 DxN6SBDZdzg8XVV5UnX/NPb0243zFp/BYYCA3Yzv79Ed0gGY7s0YI1/b9
 bJeQfXi7XYg8VUY4K37ce0q6AgnpbjAOV3TggZx4M5xo6d1ArIOdDOgGI
 bbs5UmQVDTZH8XM9JP1ogKC/XWEUyWQbfhQEeX3EEj30yVK2pWOgqPs7R
 V6alVaDIauJWiTo8GaCM7qNDC5jzofTmiA6LsXk8ghBUZOVII0toqIscO Q==;
X-CSE-ConnectionGUID: NX9FMOx4SyKBml8pl/MElg==
X-CSE-MsgGUID: 29N2g7ULRMqLToEWxhy2OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53583810"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="53583810"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:52:30 -0700
X-CSE-ConnectionGUID: +hU7wbJKQY2soGLyZW0cLw==
X-CSE-MsgGUID: zW0qTQimRyeTJfB4gTzvXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156676894"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:52:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Remove references to CONFIG_DRM_XE_DEVMEM_MIRROR
Date: Thu, 10 Jul 2025 13:54:13 -0700
Message-Id: <20250710205413.1105595-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The prefetch code was referencing CONFIG_DRM_XE_DEVMEM_MIRROR, which has
been replaced by CONFIG_DRM_XE_PAGEMAP. As a result, prefetches were
limited to SRAM. Update the code to use CONFIG_DRM_XE_PAGEMAP instead of
the deprecated option.

Fixes: f86ad0ed620c ("drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e875ea4658a9..2035604121e6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2380,7 +2380,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 			ctx.read_only = xe_vma_read_only(vma);
 			ctx.devmem_possible = IS_DGFX(vm->xe) &&
-					      IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
+					      IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
 
 			for_each_tile(tile, vm->xe, id)
 				tile_mask |= 0x1 << id;
@@ -2887,7 +2887,7 @@ static int check_ufence(struct xe_vma *vma)
 
 static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 {
-	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
+	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
 	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
 	int err = 0;
 
-- 
2.34.1

