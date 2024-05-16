Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A56C25B7C
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 18:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5D010EDA0;
	Thu, 16 May 2024 18:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTZnuG/T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BA510E39A
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 18:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715883849; x=1747419849;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jEqYldsIOWebkaVaNZr1rNRRD+LmAXFHJyetRA08ZEQ=;
 b=XTZnuG/TOpDqfOQYWEHsGow7a1YI2rxW9qLYDg1sW5Wch6TCr9BZR2aI
 pV0GTGr9QmabK+6hwBo1PWrDQIbGMJMDAAYGOmmLWLlIESZxFd+NEm85E
 fVUSh5olixVdiklu9Hr5u9yY7DfB2KtbZVOsU3Z4ddLYUYelQGn9CBBud
 kYD336U+5P1kzVlXJ20UEvdZKEfoK3xVVcw5/p9c1U4uR5jOB3SdGVhNN
 yzQ4ss0HphZa1rFju+U3PoU6THa2RgT02l/rLV/CEeQ0qMWayDOvpeTdA
 fQTT4F9Ro5nU13O7R4bkYZa+589y8SW+XQ/leyLyVfPOqD+ok1vK93i82 A==;
X-CSE-ConnectionGUID: iRbDO0UMR6Kz7HM8fQG4bw==
X-CSE-MsgGUID: 9VDKpcpNTX+HrjFXdWVflw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23159958"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="23159958"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:24:09 -0700
X-CSE-ConnectionGUID: CjTlCzBERaaBmwz5PeVTaw==
X-CSE-MsgGUID: E71D4XzNRgWa57mxtt3g4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="32065505"
Received: from unknown (HELO fedora..) ([10.245.246.241])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:24:08 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 19/21] drm/xe: Use drm_exec for fault locking
Date: Thu, 16 May 2024 20:23:37 +0200
Message-ID: <20240516182339.3482-20-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516182339.3482-1-thomas.hellstrom@linux.intel.com>
References: <20240516182339.3482-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3c56858e0751..27d7d36401b5 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1217,29 +1217,37 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_device *xe = to_xe_device(ddev);
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
+	struct drm_exec exec;
 	vm_fault_t ret;
-	int idx;
+	int idx, err;
 
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
 
-	ret = ttm_bo_vm_reserve(tbo, vmf, NULL);
-	if (ret)
-		goto out;
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 16);
+	drm_exec_until_all_locked(&exec) {
+		ret = ttm_bo_vm_reserve(tbo, vmf, &exec);
+		err = drm_exec_retry_on_contention(&exec, 0);
+		if (err)
+			ret = VM_FAULT_NOPAGE;
+		if (ret)
+			goto out;
 
-	if (drm_dev_enter(ddev, &idx)) {
-		trace_xe_bo_cpu_fault(bo);
+		if (drm_dev_enter(ddev, &idx)) {
+			trace_xe_bo_cpu_fault(bo);
 
-		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-					       TTM_BO_VM_NUM_PREFAULT,
-					       NULL);
-		drm_dev_exit(idx);
-	} else {
-		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
+			ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
+						       TTM_BO_VM_NUM_PREFAULT,
+						       &exec);
+			drm_dev_exit(idx);
+			err = drm_exec_retry_on_contention(&exec, 0);
+			if (err)
+				ret = VM_FAULT_NOPAGE;
+		} else {
+			ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
+		}
 	}
 
-	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
-		goto out;
 	/*
 	 * ttm_bo_vm_reserve() already has dma_resv_lock.
 	 */
@@ -1250,8 +1258,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 		mutex_unlock(&xe->mem_access.vram_userfault.lock);
 	}
 
-	dma_resv_unlock(tbo->base.resv);
 out:
+	drm_exec_fini(&exec);
 	if (needs_rpm)
 		xe_pm_runtime_put(xe);
 
-- 
2.44.0

