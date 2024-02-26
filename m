Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79330C54E4A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 16:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB3310E7B0;
	Mon, 26 Feb 2024 16:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUKsbfaH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A762510E7C0
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708965910; x=1740501910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kBK08k+7dd1o7Gg57+rv+6QCsIXFh4HglHcFMJCSOow=;
 b=VUKsbfaHpM6K8T4lnaszqL1L3+ooVRKQGkcBknatLikPMdr5CGPucAru
 81wihCt3nOGGQm9hJh/C8966VDZ1aMGKlCiGGrQzq8gKX//csWAUMTh0N
 +pIaeb3ucIK9a1Ksofc7skUitgSfHKFOjAXHl2Aqjm+4ZEl1UcSbwvqHE
 62ldcYOtLqIpoalAgUYpBJ5WUwYzlZVlAQbGBPRYRDWWsB/kSLD4+U+9Q
 RMytv+32SBjijkcXDw0qBTDpxFP9mYiRncxfsNkZ3NVyudAgba7v3+Rwj
 wtYGuUzImy2fm7YLJ/vXj/f+HZkAQsxr4cOhzap4DZi7A+Q76pZUgRUof Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25730054"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; d="scan'208";a="25730054"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 08:45:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="6751883"
Received: from shunter1-mobl.ger.corp.intel.com (HELO fedora..) ([10.252.3.88])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 08:45:08 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH 1/3] drm/xe/bo: Forward the decision to evict local objects
 during validation
Date: Mon, 26 Feb 2024 17:44:53 +0100
Message-ID: <20240226164455.10179-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
References: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
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

Currently we refuse evicting the VM's local objects. However that
is necessary for some objects. Most notably completely unbound objects.
Forward this decision to be per-object based in the TTM
eviction_valuable() callback.

Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 17 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec.c     |  2 ++
 drivers/gpu/drm/xe/xe_vm.c       |  8 ++++++--
 drivers/gpu/drm/xe/xe_vm_types.h | 10 ++++++++++
 4 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 76dfaf1cd200..143d93632253 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1049,6 +1049,21 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 	}
 }
 
+static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
+				    const struct ttm_place *place)
+{
+	if (xe_bo_is_xe_bo(ttm_bo)) {
+		struct xe_bo *xe_bo = ttm_to_xe_bo(ttm_bo);
+		struct xe_vm *vm = xe_bo->vm;
+
+		if (vm && !drm_gpuvm_is_extobj(&vm->gpuvm, &ttm_bo->base) &&
+		    vm->is_validating)
+			return false;
+	}
+
+	return ttm_bo_eviction_valuable(ttm_bo, place);
+}
+
 const struct ttm_device_funcs xe_ttm_funcs = {
 	.ttm_tt_create = xe_ttm_tt_create,
 	.ttm_tt_populate = xe_ttm_tt_populate,
@@ -1059,7 +1074,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
 	.io_mem_reserve = xe_ttm_io_mem_reserve,
 	.io_mem_pfn = xe_ttm_io_mem_pfn,
 	.release_notify = xe_ttm_bo_release_notify,
-	.eviction_valuable = ttm_bo_eviction_valuable,
+	.eviction_valuable = xe_bo_eviction_valuable,
 	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 952496c6260d..e8eb09993485 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -102,7 +102,9 @@ static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
 	int num_fences;
 	int ret;
 
+	vm->is_validating = true;
 	ret = drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
+	vm->is_validating = false;
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e3bde897f6e8..07b0cda12d52 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -474,7 +474,7 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 		list_move_tail(&gpuva_to_vma(gpuva)->combined_links.rebind,
 			       &vm->rebind_list);
 
-	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false);
+	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, true);
 	if (ret)
 		return ret;
 
@@ -515,7 +515,11 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	if (err)
 		return err;
 
-	return drm_gpuvm_validate(&vm->gpuvm, exec);
+	vm->is_validating = true;
+	err = drm_gpuvm_validate(&vm->gpuvm, exec);
+	vm->is_validating = false;
+
+	return err;
 }
 
 static void preempt_rebind_work_func(struct work_struct *w)
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 7d4f810f9c04..76c49fba9cd3 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -286,6 +286,16 @@ struct xe_vm {
 
 	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
 	bool batch_invalidate_tlb;
+
+	/**
+	 * @is_validaing: Whether we are validating the vm's local objects.
+	 * This field is protected by the vm's resv. Note that this
+	 * is needed only since TTM doesn't forward the ttm_operation_ctx to the
+	 * eviction_valuable() callback, so if / when that is in place, this
+	 * should be removed.
+	 */
+	bool is_validating;
+
 	/** @xef: XE file handle for tracking this VM's drm client */
 	struct xe_file *xef;
 };
-- 
2.43.0

