Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775E9CFD37A
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 09:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B350A10E3A2;
	Tue, 25 Nov 2025 09:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="goVZhZGQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D9410E39C
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 09:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764063843; x=1795599843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jWVoiW/105HO3LbTX+eR+UAeaqEVnpOGWnLmd9zQdUE=;
 b=goVZhZGQ1YrOtXExHJnG0S9sD9jDQ/AAUQAkwtSU4eMhZ5YxoTQ3iYMf
 RF/kLpdg/A/MUi27R320hNzTLkuXuPgB7iCm1S7xu9P92PtWqec+gALS8
 9CdFBmTULewuE8OJ/ZkZQQoQHzjmL1TnJSQ5AfV6+5PSC0LYDSgwwWqJF
 himhe+pMKgMyhuvyax4c+DHKmnVDX2mwq8uQvngw0PRbxbwCjn7wZ8UsK
 eAUL6RMti2CI0htdcTdVHF2s1TU7uTGIbQswQ8F6m1FGhlxlTWsEQJjcV
 uxwf19WSfX0adbKl1sI4RAj38Gt0abtfAEcDFO2GhfX2cqDA/38TwT1IS g==;
X-CSE-ConnectionGUID: D4hwzsALQWSGE/3oa0Lwqw==
X-CSE-MsgGUID: BmqXF5/ISiOTObGIiyoZLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69934127"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="69934127"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:43:59 -0800
X-CSE-ConnectionGUID: 0pzICdHnS5GRc052OqLKjw==
X-CSE-MsgGUID: c8IBvAY/S9CwLJ0iLIVPPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="192405212"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk..)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:43:58 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo cachelines
 manually
Date: Tue, 25 Nov 2025 15:13:33 +0530
Message-Id: <20251125094335.12028-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125094335.12028-1-tejas.upadhyay@intel.com>
References: <20251125094335.12028-1-tejas.upadhyay@intel.com>
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

Starting NVL, HW will flush cachelines marked with XA only
when media is off. We have few cases where kernel will have
non-XA cachelines which needs manual flush as we postpone
the invalidation. Flush asap from correctness POV to ensure
non accelerated CPU copy to swap/shmem file will see coherent
view of memory, but also from security POV where later flush
can't corrupt the next user of those pages.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      |  3 ++-
 drivers/gpu/drm/xe/xe_device.c  | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h  |  1 +
 drivers/gpu/drm/xe/xe_userptr.c |  3 ++-
 4 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 465cf9fc7ce9..97e1e9d40e96 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -689,7 +689,8 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 
 		if (!xe_vm_in_fault_mode(vm)) {
 			drm_gpuvm_bo_evict(vm_bo, true);
-			continue;
+			if (!xe_device_needs_cache_flush(xe))
+				continue;
 		}
 
 		if (!idle) {
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 92f883dd8877..6e8335b493e8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1079,6 +1079,26 @@ void xe_device_l2_flush(struct xe_device *xe)
 	spin_unlock(&gt->global_invl_lock);
 }
 
+/**
+ * xe_device_needs_cache_flush - Whether the cache needs to be flushed
+ * @xe: The device to check.
+ *
+ * Return: true if the device needs cache flush, false otherwise.
+ */
+bool xe_device_needs_cache_flush(struct xe_device *xe)
+{
+	/*
+	 * Starting NVL, HW will flush cachelines marked with XA only when media is off. We have
+	 * few cases where kernel will have non-XA cachelines which needs manual flush and this is
+	 * one of them as we postpone the invalidation. Flush asap from correctness POV to ensure
+	 * non accelerated CPU copy to swap/shmem file will see coherent view of memory, but also
+	 * from security POV where later flush can't corrupt the next user of those pages.
+	 */
+	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe))
+		return true;
+	return false;
+}
+
 /**
  * xe_device_td_flush() - Flush transient L3 cache entries
  * @xe: The device
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 32cc6323b7f6..15e67db44b56 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -179,6 +179,7 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
+bool xe_device_needs_cache_flush(struct xe_device *xe);
 void xe_device_td_flush(struct xe_device *xe);
 void xe_device_l2_flush(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 0d9130b1958a..a93c7e887cca 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -114,7 +114,8 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
 				    false, MAX_SCHEDULE_TIMEOUT);
 	XE_WARN_ON(err <= 0);
 
-	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
+	if ((xe_vm_in_fault_mode(vm) || xe_device_needs_cache_flush(vm->xe)) &&
+	    userptr->initial_bind) {
 		err = xe_vm_invalidate_vma(vma);
 		XE_WARN_ON(err);
 	}
-- 
2.34.1

