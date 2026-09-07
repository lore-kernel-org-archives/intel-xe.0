Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C92C79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 15:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6696010E50E;
	Mon,  7 Sep 2026 15:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JS55bjAG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EC710E50E
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 15:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788795449; x=1820331449;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=efpbtjTOGXAjgK/hgmajCN/s/48pJYa7u8di/Hw/y0E=;
 b=JS55bjAGemrD6QpGpi8ugcZt/oOuvd7hI/mJ/8Nwe6y3fI2pQamVvSO1
 9ad+m4OOypFEp1cT2BIOGjz0FP277OK7fhcLTlZ79fEUIfGFFh7Vr/Z5u
 LN+DzM690XoYU/4wQ+ozr/QuFG+vQlihGkBXbNAwzZOL5nGEZB0GRwR+X
 1m81Trj7M4zCzsndXaxECRsx44IjI17yzS3W8JurnIJkLhjqwwlmVGQbY
 GlhCHxc3KX6+RnMnvSWz5TnzPAp0L6n9LkistIrEBWuv8l2a/HWHRkER+
 1UoCwk9RyflsM0+6l0i7Xgs8JBdSr73AiAQyv8TrGFztvAvSMfZycbn5q w==;
X-CSE-ConnectionGUID: MyQXiMk8QNyXN+zpaSO5Ew==
X-CSE-MsgGUID: gBgATehgTzGvqOb1Ggl4hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89248112"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89248112"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 08:37:28 -0700
X-CSE-ConnectionGUID: tSLGJfMqQCm5otvDAdRF1w==
X-CSE-MsgGUID: yPt3BeFNSsqxKD+zGdtjuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="270228799"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 08:37:27 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [V2] drm/xe: Skip clearing purged page-table BOs
Date: Mon,  7 Sep 2026 21:07:07 +0530
Message-ID: <20260907153706.888679-2-tejas.upadhyay@intel.com>
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

v2(Sashiko):
- Fix lock ordering

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 6 ++++--
 drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5d990c1c3740..a9b9cd7ac2c8 100644
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
+	if (!xe_bo_is_purged(bo))
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

