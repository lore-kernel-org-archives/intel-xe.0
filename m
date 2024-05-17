Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80511C25B7E
	for <intel-xe@archiver.kernel.org>; Fri, 17 May 2024 07:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BF110EE26;
	Fri, 17 May 2024 07:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MC2p3PHa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0393210EE22
 for <intel-xe@lists.freedesktop.org>; Fri, 17 May 2024 07:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715931717; x=1747467717;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jEqYldsIOWebkaVaNZr1rNRRD+LmAXFHJyetRA08ZEQ=;
 b=MC2p3PHa7j2PsnuuXYP/szlMM6IECs7odqdPQ5CWeDDz1EEAQz1UzbIi
 Sco+9vKMxX3WYln0Nba3ILHOKDFsYMATmK3VxZYSXx4b6w14nnCtg7bv5
 hEV9eK2glHj5qZUxpfT3MLDWwFrFuzfGFi/jIPIYhkeNSWjpSBte4OsDT
 PNnAabtaIafyWM1D02SWu/jHIIk123iTwJ2c1WIlQTu1eXlbQhxbwsvf9
 iDkyRzejlBKyaZjsm+KW9X3zxxHyjU2cvFHeOGWh2YycL6ARPbIwViD+N
 T9CNOjN8o9AtPNKx1Fa2bfZvb5oiUNTE1d8TnSWfILcBtsQ3TqEpQU9x2 w==;
X-CSE-ConnectionGUID: HmS+cibDQwiyis5ZXgww7A==
X-CSE-MsgGUID: eJ+Omji4TISgSn8eqN3Vkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11897604"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="11897604"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 00:41:57 -0700
X-CSE-ConnectionGUID: 4LUhMHdXQay5cB5Pif//yA==
X-CSE-MsgGUID: b3UK5BMFTOGlKj1/vpqABg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="36213136"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 00:41:56 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v4 19/21] drm/xe: Use drm_exec for fault locking
Date: Fri, 17 May 2024 09:41:28 +0200
Message-ID: <20240517074130.2908-20-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240517074130.2908-1-thomas.hellstrom@linux.intel.com>
References: <20240517074130.2908-1-thomas.hellstrom@linux.intel.com>
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

