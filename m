Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071D4C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 11:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B732B10EB82;
	Tue,  8 Sep 2026 11:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHF8zOxr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B1A10EB7E
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 11:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788867959; x=1820403959;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HGQSMnu6x4I66AYiqN+yxMye6EfMR9ReuuvCJNRk4nk=;
 b=mHF8zOxr9j1dxeEhUUpnOy8kcU/p0MrzL5S4unyn8J9OV88hHkFfNY0m
 jp2Hosh06faAeDs+1TtQw/Y4a+DA9RVvcG/+9GCzAR7Zhb+/qsJ9VKCqz
 o1wTlP+/0aVd9thLqKeP7cOUt7oXVbkI7TTPPqBQ62gpaSh6lO4MsSluk
 DS0VvwvR3x4smOtICHugPIzgbKWrxdXdetWl6M+OxQYD5Tu8t3aYLdZSo
 OQnvTrHZarhga7AKSrmhST4u4FzW046++mxyuQpNuJzLrRzVAVv8AM2P8
 kS9L3I+rpYrSxEq2zwnmm98f1l5pJjCrV2p2TvUH8B/PgrQ2e4tJdOXJe Q==;
X-CSE-ConnectionGUID: 37JaqediTfOo+AiYl3JqGg==
X-CSE-MsgGUID: DtOlhZVQTVeUG13hgMOOEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="76827126"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="76827126"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 04:45:58 -0700
X-CSE-ConnectionGUID: VAfH76R9R9qZQqZMTHO+dQ==
X-CSE-MsgGUID: LdN8zmJFTDCdu0W0o19lDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="267722787"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 04:45:57 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [V3] drm/xe: Skip clearing purged page-table BOs
Date: Tue,  8 Sep 2026 17:15:46 +0530
Message-ID: <20260908114545.915049-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

VRAM page offlining can clear a page-table BO's vmap before VM teardown
calls xe_pt_clear(). Check for a purged BO under its dma-resv lock before
writing to the mapping.

v3(Sashiko):
- Validate NULL vmap
v2(Sashiko):
- Fix lock ordering

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 6 ++++--
 drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 7fb2fe1f826c..4b351dbf6572 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -236,9 +236,11 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
  */
 void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
 {
-	struct iosys_map *map = &pt->bo->vmap;
+	struct xe_bo *bo = pt->bo;
 
-	xe_map_memset(xe, map, 0, 0, SZ_4K);
+	xe_bo_assert_held(bo);
+	if (!iosys_map_is_null(&bo->vmap))
+		xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9e71567b27cc..e77ff3cf3ca3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1876,10 +1876,13 @@ static void xe_vm_close(struct xe_vm *vm)
 	bound = drm_dev_enter(&xe->drm, &idx);
 
 	down_write(&vm->lock);
+	xe_vm_lock(vm, false);
+
 	if (xe_vm_in_fault_mode(vm))
 		xe_svm_notifier_lock(vm);
-
 	vm->size = 0;
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_notifier_unlock(vm);
 
 	if (!((vm->flags & XE_VM_FLAG_MIGRATION))) {
 		struct xe_tile *tile;
@@ -1901,8 +1904,7 @@ static void xe_vm_close(struct xe_vm *vm)
 		}
 	}
 
-	if (xe_vm_in_fault_mode(vm))
-		xe_svm_notifier_unlock(vm);
+	xe_vm_unlock(vm);
 	up_write(&vm->lock);
 
 	if (bound)
-- 
2.52.0

