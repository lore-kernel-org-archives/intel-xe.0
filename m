Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096E1C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6F410E206;
	Tue, 14 Nov 2023 13:35:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D929B10E44D
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699968898; x=1731504898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P/Pcl4vIlPJ1CVjMXci4R1E59ANQuW8lO1YIGngAc+4=;
 b=P2UokqM8bq4F8jvYhzIvCGYQZuk6GBuzyN0Ktsfs5+jc5fl7VhhBV4SB
 pLazwVTTeren0mHP5kvRkI27FvFKHh2nxSa/eByeLL37GtOwdz87m1yu/
 gVOu3cneDx/P2Xd30DsMq2lUvSoI/PRu1iX196Vfv7dMtlbmNX5OthXbc
 uEkFHakQuAlFIq5HLloS/hOBMRUoUDWJijhIFaNYV+ZX6IKzlA2Tuz54e
 Y4kI3eHLnWSKPyjlyK/x9AL9h/ltNOqOkSmOjIioKyfsath+b7ir/dcSJ
 5X6/ZGfTVJqXZf/JdEaOhBhY4RlpHh/28F+wE3jJTDCzL2V75pRfR/beu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="9293993"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="9293993"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="764661310"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="764661310"
Received: from kdijkstr-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.218.123])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:34:56 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 13:34:34 +0000
Message-Id: <20231114133434.7-9-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114133434.7-1-francois.dugast@intel.com>
References: <20231114133434.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 8/8] drm/xe/uapi: Be more specific about the
 vm_bind prefetch region
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Let's bring a bit of clarity on this 'region' field that is
part of vm_bind operation struct. Rename and document to make
it more than obvious that it is a region instance and not a
mask and also that it should only be used with the prefetch
operation itself.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 15 ++++++++-------
 include/uapi/drm/xe_drm.h  |  8 ++++++--
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 76926ee756c7..f8559ebad9bc 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2167,7 +2167,8 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 static struct drm_gpuva_ops *
 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			 u64 bo_offset_or_userptr, u64 addr, u64 range,
-			 u32 operation, u32 flags, u8 tile_mask, u32 region)
+			 u32 operation, u32 flags, u8 tile_mask,
+			 u32 prefetch_region)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
 	struct drm_gpuva_ops *ops;
@@ -2221,7 +2222,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
 			op->tile_mask = tile_mask;
-			op->prefetch.region = region;
+			op->prefetch.region = prefetch_region;
 		}
 		break;
 	case DRM_XE_VM_BIND_OP_UNMAP_ALL:
@@ -2881,7 +2882,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u32 flags = (*bind_ops)[i].flags;
 		u32 obj = (*bind_ops)[i].obj;
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
-		u32 region = (*bind_ops)[i].region;
+		u32 prefetch_region = (*bind_ops)[i].prefetch_mem_region_instance;
 		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 
 		if (i == 0) {
@@ -2915,9 +2916,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_DBG(xe, region &&
+		    XE_IOCTL_DBG(xe, prefetch_region &&
 				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_DBG(xe, !(BIT(region) &
+		    XE_IOCTL_DBG(xe, !(BIT(prefetch_region) &
 				       xe->info.mem_region_mask)) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
@@ -3099,11 +3100,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u32 flags = bind_ops[i].flags;
 		u64 obj_offset = bind_ops[i].obj_offset;
 		u8 tile_mask = bind_ops[i].tile_mask;
-		u32 region = bind_ops[i].region;
+		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
 						  addr, range, op, flags,
-						  tile_mask, region);
+						  tile_mask, prefetch_region);
 		if (IS_ERR(ops[i])) {
 			err = PTR_ERR(ops[i]);
 			ops[i] = NULL;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 675194886851..d66e8dc72e96 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -672,8 +672,12 @@ struct drm_xe_vm_bind_op {
 	/** @flags: Bind flags */
 	__u32 flags;
 
-	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
-	__u32 region;
+	/**
+	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
+	 * It is a region instance, not a mask.
+	 * To be used only with %DRM_XE_VM_BIND_OP_PREFETCH operation.
+	 */
+	__u32 prefetch_mem_region_instance;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
-- 
2.34.1

