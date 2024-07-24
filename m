Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36467C3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 19:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D269D10E7A7;
	Wed, 24 Jul 2024 19:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmdxdECL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9EB10E795
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 19:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721849719; x=1753385719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ufSX1LObC/nInsH40VA2kKaev8F5ISgE+K3v9btlWnY=;
 b=QmdxdECL+b169E9/+TIA9HFUj3gcFe5FeDx3zci/sFKs8427NNS77IQo
 VJdtMv9XKxdGUa/yEyong/L+I1gOSrpaR+3dPBmkFlslKKQ2c6RgDVwz9
 mmk7ZMuAAi1O1Lji8Sju5kTf2AoX6PNwSww/NSE7OIMQh6acx/VoFU9iL
 yG9g7kOY4s+Dg8xdERiAwSLHSwbCjBE7iKRfgc+0KgmLK1MtnMKKXZew1
 Lk0BtNvx2P601Hs3zl1hLsTZdJ+CH8diwTnZ6TM+kSdje9W6sW1v5dyKm
 kBh8hyMLs60wJf+WCyTFHfnemEpSy0UC5E0bMgWi8AUzuRyeBW9rQQmUz g==;
X-CSE-ConnectionGUID: eHBrixoYQ+GOCp9FxDCVWA==
X-CSE-MsgGUID: UhHkVBy0TOu73pIci/fzSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19691148"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19691148"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:35:16 -0700
X-CSE-ConnectionGUID: tmrjhdeURIK6NEHO5M49xw==
X-CSE-MsgGUID: 3PTrlCFhRcC1p4QpRk6WxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83292335"
Received: from ntgaliba-mobl2.amr.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.180])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:35:15 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 12/12] drm/xe/device: Remove unused
 xe_device::usm::num_vm_in_*
Date: Wed, 24 Jul 2024 21:33:05 +0200
Message-ID: <20240724193431.2685833-13-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240724193431.2685833-1-francois.dugast@intel.com>
References: <20240724193431.2685833-1-francois.dugast@intel.com>
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

Those counters were used to keep track of the numbers VMs in fault mode
and in non-fault mode, to determine if the whole device was in fault mode
or not. This is no longer needed so remove those variables and their
usages.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h       | 10 ----------
 drivers/gpu/drm/xe/xe_device_types.h |  4 ----
 drivers/gpu/drm/xe/xe_vm.c           | 12 ------------
 3 files changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index bb07f5669dbb..cb69ecf02c25 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -129,16 +129,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 
 void xe_device_assert_mem_access(struct xe_device *xe);
 
-static inline bool xe_device_in_fault_mode(struct xe_device *xe)
-{
-	return xe->usm.num_vm_in_fault_mode != 0;
-}
-
-static inline bool xe_device_in_non_fault_mode(struct xe_device *xe)
-{
-	return xe->usm.num_vm_in_non_fault_mode != 0;
-}
-
 static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
 {
 	return xe->info.has_flat_ccs;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 3bca6d344744..ad736e2f4d5f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -354,10 +354,6 @@ struct xe_device {
 		struct xarray asid_to_vm;
 		/** @usm.next_asid: next ASID, used to cyclical alloc asids */
 		u32 next_asid;
-		/** @usm.num_vm_in_fault_mode: number of VM in fault mode */
-		u32 num_vm_in_fault_mode;
-		/** @usm.num_vm_in_non_fault_mode: number of VM in non-fault mode */
-		u32 num_vm_in_non_fault_mode;
 		/** @usm.lock: protects UM state */
 		struct mutex lock;
 	} usm;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f0d2dc41a25d..48f092236ece 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1437,13 +1437,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	if (number_tiles > 1)
 		vm->composite_fence_ctx = dma_fence_context_alloc(1);
 
-	mutex_lock(&xe->usm.lock);
-	if (flags & XE_VM_FLAG_FAULT_MODE)
-		xe->usm.num_vm_in_fault_mode++;
-	else if (!(flags & XE_VM_FLAG_MIGRATION))
-		xe->usm.num_vm_in_non_fault_mode++;
-	mutex_unlock(&xe->usm.lock);
-
 	trace_xe_vm_create(vm);
 
 	return vm;
@@ -1556,11 +1549,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	up_write(&vm->lock);
 
 	mutex_lock(&xe->usm.lock);
-	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
-		xe->usm.num_vm_in_fault_mode--;
-	else if (!(vm->flags & XE_VM_FLAG_MIGRATION))
-		xe->usm.num_vm_in_non_fault_mode--;
-
 	if (vm->usm.asid) {
 		void *lookup;
 
-- 
2.43.0

