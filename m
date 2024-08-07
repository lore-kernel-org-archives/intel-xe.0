Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380A3C52D73
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 16:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0683E10E589;
	Wed,  7 Aug 2024 16:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCS17YXh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263C610E58B
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 16:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723047897; x=1754583897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JXdA8yhjNWYV8zuYVe0QpmxXf2LB1zCuBX6lKf5cIvE=;
 b=lCS17YXhwQdtef+ZxewJzDiJYF9ZRqZ4ffCzxhyTtmvifu6dWEfXKo3S
 GyvfTG+HDYfqc89Gb5oPKsBmp2G0Hfjn6Qdi7Kw+ih4OcHGE+ZNzbXwiU
 ik8/7yyezh1QunFVDXyUwE7XaQ2HIZaOtKKSq4/EA08p7Zk8r4L2w13+l
 VT4KE0OvMbDO5frss/h1UtzKnJkIuHE3cVsgcyCbEOlUENNAzIdmaU0uG
 K0ZNYqsG6Lyl8o4226cliLkUn60fPF6Fkd8OGnWdDx8HnoXUtrYWV0Zg8
 WxlZcnEglfc8mE2YEUPGAius/LD7FwOEAmuPoUxUIt1tNzqu2Hhioyk3b g==;
X-CSE-ConnectionGUID: wtXHbbpjTDeW3BWkwdJjSA==
X-CSE-MsgGUID: kCE7zOKGRTyx1GkG31jaQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24040468"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="24040468"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:24:57 -0700
X-CSE-ConnectionGUID: 5afI7liEQzS0srnuDb6NZw==
X-CSE-MsgGUID: 5+MD6H6jS5+smiz41X+FgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="61791079"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.120])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:24:56 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v7 13/13] drm/xe/device: Remove unused
 xe_device::usm::num_vm_in_*
Date: Wed,  7 Aug 2024 18:23:42 +0200
Message-ID: <20240807162416.1307061-14-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807162416.1307061-1-francois.dugast@intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
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
index db6cc8d0d6b8..5551912da74e 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -134,16 +134,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 
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
index 5b7292a9a66d..5fb39d991167 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -361,10 +361,6 @@ struct xe_device {
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
index 7a88c65759c9..d2001a08084b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1508,13 +1508,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
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
@@ -1628,11 +1621,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
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

