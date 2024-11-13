Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715F1D462D0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 16:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB5310E739;
	Wed, 13 Nov 2024 16:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlRQjvO2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E5710E739
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 16:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731514943; x=1763050943;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2DIC3wKN2gQDcJlEPqDBAeqygbiwXhZ33caq+yS30og=;
 b=ZlRQjvO2duRl3UCgACoWWr4idz/62tcM06N1KgKg6hCXsuJjAdOkTTj0
 5SKuuN3itCd2W4TBjQ8d+rHd8sYg4qmTxWmfGUJrRhBzFlVRzXBJ5PYw0
 x5TIcSaMjyR0oH1QtU0TqFMhU71NUKlQB/wwuK3MzsagmrmwWb8wEYm1N
 kzAA+XoQtn2QpVzGd2Qqy6Y/WK94EFZgcqQEO/0EWW/qkDdcX7MPa+dbo
 7XqF0ATEAxTlYQoSKYy+TNlpuLmdGzFCK+cWLZj3jC/UiwYQRVhZtbIjj
 5eqVdiFg0HPG9GDYgHAB4PCVBMG2KLHmAafbcPffQbRrvLFysE/iQP5iO A==;
X-CSE-ConnectionGUID: 0ECRs0fNTw2ckrqrJr9HxQ==
X-CSE-MsgGUID: gJfqyuD/SziHnEt82k6jaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31381701"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31381701"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 08:22:21 -0800
X-CSE-ConnectionGUID: tq/XH/sHTIuwy9vtz0DOfQ==
X-CSE-MsgGUID: GMrRknCcRCuXKEPw8driAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="88727891"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.175])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 08:22:20 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Allow fault injection in vm create and vm bind IOCTLs
Date: Wed, 13 Nov 2024 17:22:12 +0100
Message-ID: <20241113162212.2154103-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Use fault injection infrastructure to allow specific functions to
be configured over debugfs for failing during the execution of
xe_vm_create_ioctl() and xe_vm_bind_ioctl(). This allows more
thorough testing from user space by going through code paths for
error handling and unwinding which cannot be reached by simply
injecting errors in IOCTL arguments. This can help increase code
robustness.

v2: Add xe_pt_update_ops_{prepare,run} (Matthew Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 1 +
 drivers/gpu/drm/xe/xe_pt.c         | 3 +++
 drivers/gpu/drm/xe/xe_vm.c         | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fd0f3b3c9101..b999db5f5c19 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -240,6 +240,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 
 	return q;
 }
+ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
 
 void xe_exec_queue_destroy(struct kref *ref)
 {
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f27f579f4d85..684dc075deac 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -136,6 +136,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 	xe_pt_free(pt);
 	return ERR_PTR(err);
 }
+ALLOW_ERROR_INJECTION(xe_pt_create, ERRNO);
 
 /**
  * xe_pt_populate_empty() - Populate a page-table bo with scratch- or zero
@@ -1851,6 +1852,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_pt_update_ops_prepare, ERRNO);
 
 static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			   struct xe_vm_pgtable_update_ops *pt_update_ops,
@@ -2131,6 +2133,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	return ERR_PTR(err);
 }
+ALLOW_ERROR_INJECTION(xe_pt_update_ops_run, ERRNO);
 
 /**
  * xe_pt_update_ops_fini() - Finish PT update operations
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 624133fae5f5..2e67648ed512 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -740,6 +740,7 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
 
 static void xe_vma_ops_fini(struct xe_vma_ops *vops)
 {
@@ -1352,6 +1353,7 @@ static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *tile,
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_vm_create_scratch, ERRNO);
 
 static void xe_vm_free_scratch(struct xe_vm *vm)
 {
@@ -1978,6 +1980,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 
 	return ops;
 }
+ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			      u16 pat_index, unsigned int flags)
@@ -2697,6 +2700,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	drm_exec_fini(&exec);
 	return err;
 }
+ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 
 #define SUPPORTED_FLAGS_STUB  \
 	(DRM_XE_VM_BIND_FLAG_READONLY | \
-- 
2.43.0

