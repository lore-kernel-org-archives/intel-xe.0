Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F854C25B7A
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 08:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1B810E0D9;
	Wed, 15 May 2024 08:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjwKYXSj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C597110E0D9
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 08:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715760917; x=1747296917;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jEqYldsIOWebkaVaNZr1rNRRD+LmAXFHJyetRA08ZEQ=;
 b=GjwKYXSjVkkbmlUnccom4psDSXJVpIOKCltIq0PzQ5m/nqkKoXrNdBQ7
 1rC2BtXG2HIRiEWi8OLgqz9ZqsKIWAPIhanxS4hqegTudRMGFBfW3tfxY
 GWTT++yZb80Wtga2n7upcAoeeYJfPiWhuVZKDh8laRQRzBnhpxRMg252n
 q7CHIB9AObH/NLjRSZ4s3hVq/HEcxhUsID/MATqvY4nLK+vJyty/bSW9v
 u8fVYmhzPj6l1irmZfUkfNOE8wwHxCqQ81BaTHlt7ADVvVrlp7ek+Grxr
 t4rLCZUEji6dVG7RT9PJa9em3BKtVM3nLmO9gJIAfDLSD9h+Zpx5QaDSQ A==;
X-CSE-ConnectionGUID: 19WlP4LcTweD/Y4g0lu6bA==
X-CSE-MsgGUID: jJjhct2iRN+54gQZ7GOdFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23193324"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="23193324"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:15:17 -0700
X-CSE-ConnectionGUID: kIcbVz4pSkWoloip0o1pgw==
X-CSE-MsgGUID: KoqdYftDQkyquZFe+pScxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="30977488"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.147])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:15:16 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 19/21] drm/xe: Use drm_exec for fault locking
Date: Wed, 15 May 2024 10:14:47 +0200
Message-ID: <20240515081449.46646-20-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240515081449.46646-1-thomas.hellstrom@linux.intel.com>
References: <20240515081449.46646-1-thomas.hellstrom@linux.intel.com>
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

