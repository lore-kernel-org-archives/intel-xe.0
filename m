Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD66CD1288
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 17:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2570410EA3D;
	Mon,  1 Apr 2024 17:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GgfXEDx1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA3710EA3D
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 17:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711993114; x=1743529114;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=17GiUitrP6MSxit+PvpFqbgDygOCPFEZIoVQXybEgyQ=;
 b=GgfXEDx1WpFD3+El7K6YXN/4YCIblk5T3lSKgi6KCt9F4c4jod5FuX2t
 M5HQaagM+CXiVNSOCcJIm+MCW0bvWde8tSYQNdfzxVR+g30SXXKawxI14
 gIsyoMqqjNvfuh9Kf0p6sl/JU8YjuOKef3VAg+4qYXLdSXibkj0e6DwKQ
 FVZtCeB4EW7BIHjuQ3rO0UYR+NU72rfcAwpHbILm1CsrHDC/luezfi+4q
 XfM2ZzAWLhb6mUm4DqKQtqSVsvBP9A0Gq6bA4dHFoSTEzzU2lAJpVgn9l
 y0Y+lMavJy0qnt1vgqikbrdCzwHf5IC0QkskVV39LWLjwEzTOKd+a0xWN Q==;
X-CSE-ConnectionGUID: +TNu77zySbCDiih3INXaIQ==
X-CSE-MsgGUID: MJ1oxABvQHycC37wU3F+xA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="32533817"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="32533817"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 10:38:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="17674564"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 01 Apr 2024 10:38:32 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe/xe_migrate: Cast to output precision before
 multiplying operands.
Date: Mon,  1 Apr 2024 23:22:06 +0530
Message-Id: <20240401175206.3823519-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

Addressing potential overflow in result of  multiplication of two lower
precision (u32) operands before widening it to higher precision
(u64).

-v2
Fix commit message and description. (Rodrigo)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ee1bb938c493..2ba4fb9511f6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -227,7 +227,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		if (vm->flags & XE_VM_FLAG_64K && level == 1)
 			flags = XE_PDE_64K;
 
-		entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (level - 1) *
+		entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (u64)(level - 1) *
 						  XE_PAGE_SIZE, pat_index);
 		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
 			  entry | flags);
@@ -235,7 +235,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 	/* Write PDE's that point to our BO. */
 	for (i = 0; i < num_entries - num_level; i++) {
-		entry = vm->pt_ops->pde_encode_bo(bo, i * XE_PAGE_SIZE,
+		entry = vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_SIZE,
 						  pat_index);
 
 		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
@@ -291,7 +291,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 #define VM_SA_UPDATE_UNIT_SIZE		(XE_PAGE_SIZE / NUM_VMUSA_UNIT_PER_PAGE)
 #define NUM_VMUSA_WRITES_PER_UNIT	(VM_SA_UPDATE_UNIT_SIZE / sizeof(u64))
 	drm_suballoc_manager_init(&m->vm_update_sa,
-				  (map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
+				  (size_t)(map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
 				  NUM_VMUSA_UNIT_PER_PAGE, 0);
 
 	m->pt_bo = bo;
@@ -490,7 +490,7 @@ static void emit_pte(struct xe_migrate *m,
 	struct xe_vm *vm = m->q->vm;
 	u16 pat_index;
 	u32 ptes;
-	u64 ofs = at_pt * XE_PAGE_SIZE;
+	u64 ofs = (u64)at_pt * XE_PAGE_SIZE;
 	u64 cur_ofs;
 
 	/* Indirect access needs compression enabled uncached PAT index */
-- 
2.25.1

