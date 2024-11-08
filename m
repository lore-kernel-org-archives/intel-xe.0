Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2757D5C0FD
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 16:13:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A302D10E9F8;
	Fri,  8 Nov 2024 16:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FpuUmHPw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DB510E9F8
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 16:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731082421; x=1762618421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oDs9eZAEWYILIA7EKs2x1E8lTdJ/LrizN49v25yugzw=;
 b=FpuUmHPw3AtA+yVKcMRYdx2XVI08VxsNCZQC2DBY4elZgyuMwmUyKRvJ
 nUQ3FmvJ2oCrFFAHG8FKPBo6KUIfJxdBibFfZohpYbUpkouCyZI2m/wD9
 J/ylRTuSEuuTDheeYZupXZiu56I7Z6Ym88Duc4hlKKN1h3yf+6ViOo3Ng
 p6BEcQqyeMTueZO2vR4pkmjy1XJ8CCU3gDR4EsnKCGATieOrL3tu2N6Ph
 W42eOYUPfTB04w6NEy7eJd6o89ozWZ4A1wwswc1ubhOHKfu8S/VFefWES
 YJxFne758xhg9Ieu3/TAzmwMC04H0vNc2SWjCe/+oAMzoem8P5CzBqjXn A==;
X-CSE-ConnectionGUID: d+eviYiMQ0OmJHM6VwjZlA==
X-CSE-MsgGUID: BKeDWWANTsq5r5k2iZUMAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="31077286"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="31077286"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:13:40 -0800
X-CSE-ConnectionGUID: l8D8ZAaYRTSDwQBTIUrV/A==
X-CSE-MsgGUID: 8fJ4ReXURSyL9y8Vr5Ii+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85612824"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.246])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:13:39 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [RFC v1 1/1] drm/xe: Allow fault injection in vm create and vm bind
 IOCTLs
Date: Fri,  8 Nov 2024 17:11:56 +0100
Message-ID: <20241108161307.1203967-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108161307.1203967-1-francois.dugast@intel.com>
References: <20241108161307.1203967-1-francois.dugast@intel.com>
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

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 1 +
 drivers/gpu/drm/xe/xe_pt.c         | 1 +
 drivers/gpu/drm/xe/xe_vm.c         | 4 ++++
 3 files changed, 6 insertions(+)

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
index f27f579f4d85..e111698abbd9 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -136,6 +136,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 	xe_pt_free(pt);
 	return ERR_PTR(err);
 }
+ALLOW_ERROR_INJECTION(xe_pt_create, ERRNO);
 
 /**
  * xe_pt_populate_empty() - Populate a page-table bo with scratch- or zero
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

