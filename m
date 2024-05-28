Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F217C25B7C
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 12:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14F510F26E;
	Tue, 28 May 2024 12:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jrr1j1t8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD3B10EA6F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 12:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716899651; x=1748435651;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XofbqjaR+hdOgbS4cIbvO7jI7rrfG/ooLzrPX1XV0qw=;
 b=Jrr1j1t8XOKR1FZ8WfP/8szEPjDtXCT0pZ5Nxdfq15XgKZRETcXPyuR3
 u6aG6WibgpdFWIBnfQ2vHwqYxvyuznumTZM5vgtnxqAufltOIwIwIj0PA
 Jamt6ab8MPKj9TfBmHv2FckcC/fR2kgp7CQs515fhI8OD8YX5foQQ8nZh
 /X8+WoDvA2iJauwNO8mjzpMgv/dPG/kkH/M2T6f8daR8p6W2TYGyl2QUk
 xVQU9e3OtE2OLhTfncXLI8SexZjJPQk01Z0+VgPTymhebhxrUYoujlt02
 WEU3MJdWjzDthUzC0EpjkmNo7XsjEm9HBlJpsfx3cwH1PxBv4EgTXgzLb g==;
X-CSE-ConnectionGUID: gQvgGL+5R2aeUGLEs8NkiA==
X-CSE-MsgGUID: bxSW8tO1SbiyVYbvOW7MiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13065045"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13065045"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:34:11 -0700
X-CSE-ConnectionGUID: YD+WdwsbQ8iM4q3Hf6jYDw==
X-CSE-MsgGUID: tg9bzdJgThSd+Q3+ZSJ2cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="39880470"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.233])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:34:11 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v5 17/22] drm/xe: Use drm_exec for fault locking
Date: Tue, 28 May 2024 14:33:38 +0200
Message-ID: <20240528123343.169970-18-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
References: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
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

Similar to how TTM vm does this, convert the drm/xe fault
handler to use drm_exec locking.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3c56858e0751..b84acf6c46da 100644
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
+		drm_exec_retry_on_contention(&exec);
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
+			drm_exec_retry_on_contention(&exec);
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

