Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C59C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 22:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74CF10E025;
	Tue, 28 Jan 2025 22:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sg0KPvLP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A13010E3EF
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 22:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738101993; x=1769637993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=coTpS6V+PUlpvflwFdDP6Sces+ezjYwwfW+sJ4XyZSQ=;
 b=Sg0KPvLPWY+Y88KAqL+PUx3BH3ZXTANYrdbYOcU2CO0pQhJXYIcA/+ZQ
 lYKSt9j/Jc6tuSkK9m/LbeCjqAxeG2O9iZCdG4esjHon54TyLliuUbHPr
 Ov/LzoBb2oaQe+dQLxGfnaqRVy4NEenp8Iy/gVQgC/FkQzGfqaUfBuZJr
 g8Df2l+tM0DBJwvzbXlth6OuMizIuvZ5zemrpw5udeMGFMYkDdrfhRYha
 Du9HzAPyrxj1+FuinMtf8A7XiphdZvg2x+gsf346UhHuv1OiPm3Lt++Jl
 GcSRBZ5xXYfw4Z8fUtvN2DPbwuSX53fGBbVHXxLPmjMGOUSwINYyWokKE w==;
X-CSE-ConnectionGUID: GMOdzoqWRayQBoL6MmmjJg==
X-CSE-MsgGUID: 2iJ6yu2cQCapuIMpcuVJrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38488944"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38488944"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 14:06:32 -0800
X-CSE-ConnectionGUID: PbQJ/mKDTGaMJc39ZuCiYA==
X-CSE-MsgGUID: XJpIzD6bRlmb6HIqLMMfFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="108665462"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 14:06:31 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: joonas.lahtinen@linux.intel.com,
	Thomas.Hellstrom@linux.intel.com
Subject: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
Date: Tue, 28 Jan 2025 17:21:44 -0500
Message-Id: <20250128222145.3849874-2-oak.zeng@intel.com>
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

When a vm runs under fault mode, if scratch page is enabled, we need
to clear the scratch page mapping before vm_bind for the vm_bind
address range. Under fault mode, we depend on recoverable page fault
to establish mapping in page table. If scratch page is not cleared,
GPU access of address won't cause page fault because it always hits
the existing scratch page mapping.

When vm_bind with IMMEDIATE flag, there is no need of clearing as
immediate bind can overwrite the scratch page mapping.

So far only is xe2 and xe3 products are allowed to enable scratch page
under fault mode. On other platform we don't allow scratch page under
fault mode, so no need of such clearing.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 690330352d4c..196d347c6ac0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -38,6 +38,7 @@
 #include "xe_trace_bo.h"
 #include "xe_wa.h"
 #include "xe_hmm.h"
+#include "i915_drv.h"
 
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
 {
@@ -2917,6 +2918,34 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 	return 0;
 }
 
+static bool __xe_vm_needs_clear_scratch_pages(struct xe_device *xe,
+					      struct xe_vm *vm, u32 bind_flags)
+{
+	if (!xe_vm_in_fault_mode(vm))
+		return false;
+
+	if (!xe_vm_has_scratch(vm))
+		return false;
+
+	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
+		return false;
+
+	if (!(IS_LUNARLAKE(xe) || IS_BATTLEMAGE(xe) || IS_PANTHERLAKE(xe)))
+		return false;
+
+	return true;
+}
+
+static void __xe_vm_clear_scratch_pages(struct xe_device *xe, struct xe_vm *vm,
+					u64 start, u64 end)
+{
+	struct xe_tile *tile;
+	u8 id;
+
+	for_each_tile(tile, xe, id)
+		xe_pt_zap_range(tile, vm, start, end);
+}
+
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -3062,6 +3091,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
 		u16 pat_index = bind_ops[i].pat_index;
 
+		if (__xe_vm_needs_clear_scratch_pages(xe, vm, flags))
+			__xe_vm_clear_scratch_pages(xe, vm, addr, addr + range);
+
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
 						  addr, range, op, flags,
 						  prefetch_region, pat_index);
-- 
2.26.3

