Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798FFCA0EC4
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AE410E6F1;
	Tue,  5 Aug 2025 23:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LshH46h+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C741D10E2C9
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437326; x=1785973326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DMicHZXvzCbO7WNpknrz5UNyyDYlDEn+mqE/+i6I0SM=;
 b=LshH46h+SXmpNtlcrV99bpxPAyNGYD8LGOZOcQnohfd7RSqpaqnO8c9n
 jhvECq85djLTO7iCHN/meQ+J5V/SNHA5JWEOww2jr40a2HkXTDS3j0Oaf
 0ncLwObIlBBcgm2bxvYvV1OBSukkxtIBcyYhQysP8+2tiXJkWz0sjWY84
 PJnADpoc7H+3LHLWoYRkxT9TdsdLtI+BKulrIbDZaLbY8EcJGKRKUMwup
 Meb9Ec7SE1zBeIb/ip7OQyv6g8WgE7XOIaTRhV7FT6o2Va4YdIPrOIPyR
 MqPOGjXEBm1uI61NEVna4seMfl1NGz+Cx4P8lbPiAtawL1D3Y36poG4ir Q==;
X-CSE-ConnectionGUID: 3aGTcC2mQd2sUHXWjGsMyQ==
X-CSE-MsgGUID: Dz3m6CwAQ424dCWYpPGSfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68119069"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68119069"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:05 -0700
X-CSE-ConnectionGUID: 7+qxYDl4RW+HIUlrHXXCWA==
X-CSE-MsgGUID: FgA9EWsBSU25Mic4nHFojA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164641632"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 13/15] drm/xe: Enter ULLS for migration jobs upon page
 fault or SVM prefetch
Date: Tue,  5 Aug 2025 16:41:58 -0700
Message-Id: <20250805234200.1035609-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805234200.1035609-1-matthew.brost@intel.com>
References: <20250805234200.1035609-1-matthew.brost@intel.com>
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

Call xe_migration_ulls_enter upon page fault or SVM prefetch in an
effort speed up these critical paths.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 2 ++
 drivers/gpu/drm/xe/xe_vm.c           | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index ab43dec52776..434ad8341cbc 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -201,6 +201,8 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
+	xe_migrate_ulls_enter(gt_to_tile(gt)->migrate);
+
 	/*
 	 * TODO: Change to read lock? Using write lock for simplicity.
 	 */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6601c0650298..e3daff39d589 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2398,8 +2398,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			ctx.devmem_possible = IS_DGFX(vm->xe) &&
 					      IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
 
-			for_each_tile(tile, vm->xe, id)
+			for_each_tile(tile, vm->xe, id) {
+				xe_migrate_ulls_enter(tile->migrate);
 				tile_mask |= 0x1 << id;
+			}
 
 			xa_init_flags(&op->prefetch_range.range, XA_FLAGS_ALLOC);
 			op->prefetch_range.region = prefetch_region;
-- 
2.34.1

