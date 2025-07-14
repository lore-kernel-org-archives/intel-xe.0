Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6793DC83F17
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 17:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC0310E2A8;
	Mon, 14 Jul 2025 17:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O5MvjTWj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E5D10E221
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 17:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752514320; x=1784050320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=irVf2ALZZ45Fi2gHLU0xLZpxd9UJJ8fnUo722Myr+Dg=;
 b=O5MvjTWjhxoNC5kR6w0zPNaB0LYgh5ucHBGYKpM+pfY34S/sBts4sdGR
 FW/zXHXNw8JI2qT4t97BifBHBMgBTg2JmdUXZ9QcOdBD6gs7+QS9RDUUT
 5Rb2tSE1r0tbWbdssM62CEuM1v8HMHybwiD37VMLX1xeeIQT1vgGKDVCk
 LP3R6acsfgrlcO8D64uaD1Z/Gx8jHhWw+XPPJGR6uzhhvTQcvdQRml2XR
 NuriquLTF3LXAEqFHsuJYWl/9mJFgwWN0B/UuJc5qGPXtavyrHlOnekp3
 6Fk8FZgP4ywyRRJ4ODls8rh3UQFHakrnaszAmuHwLBRqj4DCW53aHSUOG Q==;
X-CSE-ConnectionGUID: TitTdGMGSQ+dhL129wg6nQ==
X-CSE-MsgGUID: LnMRXcsCQ1+I/TTY2eCQpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72167072"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="72167072"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:31:59 -0700
X-CSE-ConnectionGUID: /P5VdeMXQmuAkY/KGpxIOA==
X-CSE-MsgGUID: piOXxsycTMCQdsvqhsv9Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="180689776"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:31:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.mrozek@intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 matthew.auld@intel.com
Subject: [PATCH 3/3] drm/xe: Enable compressed memory for SVM
Date: Mon, 14 Jul 2025 10:33:42 -0700
Message-Id: <20250714173342.2997396-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714173342.2997396-1-matthew.brost@intel.com>
References: <20250714173342.2997396-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 10 ++++++++--
 drivers/gpu/drm/xe/xe_vm.c      |  5 +----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 936daa2b363d..0519b9025e0f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1723,8 +1723,11 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     dma_addr_t *src_addr,
 				     u64 dst_addr)
 {
+	struct xe_device *xe = gt_to_xe(m->tile->primary_gt);
+
 	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, src_addr, dst_addr,
-			       XE_MIGRATE_COPY_TO_VRAM, false);
+			       XE_MIGRATE_COPY_TO_VRAM,
+			       xe_migrate_needs_ccs_emit(xe));
 }
 
 /**
@@ -1744,8 +1747,11 @@ struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
 				       u64 src_addr,
 				       dma_addr_t *dst_addr)
 {
+	struct xe_device *xe = gt_to_xe(m->tile->primary_gt);
+
 	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, dst_addr, src_addr,
-			       XE_MIGRATE_COPY_TO_SRAM, false);
+			       XE_MIGRATE_COPY_TO_SRAM,
+			       xe_migrate_needs_ccs_emit(xe));
 }
 
 static void xe_migrate_dma_unmap(struct xe_device *xe, dma_addr_t *dma_addr,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 73cb981c0956..2035604121e6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2362,10 +2362,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			op->map.is_cpu_addr_mirror = flags &
 				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
-			if (op->map.is_cpu_addr_mirror)
-				op->map.pat_index = 0;
-			else
-				op->map.pat_index = pat_index;
+			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
-- 
2.34.1

