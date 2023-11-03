Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DBDC001B2
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB76310EA12;
	Fri,  3 Nov 2023 14:36:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F65210EA04
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022160; x=1730558160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JGAKekjW5bw+9m8aNiN9wzgkCqGB2xcLmgtmchW2zck=;
 b=ZyL29vyfjpnA3rZVGYRT8uNl1U/sTged9tYcEDCN3bnqJnkE2eescTl5
 Ls1dKCWHwKYdYtwIMedmcBZz7QHLjhPGwofv82wK4Q/BQ4G+dtDfpZcLK
 myVYN3PP7BOL7LG6/2PpXkDncVUPaN30o4cpHoNNd4v1Wkhbza7dp6tBk
 eCs+vXpw/dJ2J7M3Jr7+ncYu8tN8W8YFIjLjeCZVr9HkKwA2U3QecxTNQ
 IXPBL+0O+L6RGXHZsjtpeS+nmrtU4fBWDsqQA/pweHr1WiVBl+0eEF4bB
 Jk1+ErrpfD/L5AKiFHQk2EuFbW1vnDUY+jwqXx3Mmw/GzmBpGTC1vCNr2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843499"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843499"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832528"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832528"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:52 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:42 +0000
Message-Id: <20231103143456.7-37-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 36/50] drm/xe/uapi: Be more specific about the
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Let's bring a bit of clarity on this 'region' field that is
part of vm_bind operation struct. Rename and document to make
it more than obvious that it is a region instance and not a
mask and also that it should only be used with the prefetch
operation itself.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 15 ++++++++-------
 include/uapi/drm/xe_drm.h  |  8 ++++++--
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 447fecf3bd2d..5538b0ed81e8 100644
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
@@ -2870,7 +2871,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u32 flags = (*bind_ops)[i].flags;
 		u32 obj = (*bind_ops)[i].obj;
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
-		u32 region = (*bind_ops)[i].region;
+		u32 prefetch_region = (*bind_ops)[i].prefetch_mem_region_instance;
 		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 
 		if (i == 0) {
@@ -2904,9 +2905,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
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
@@ -3088,11 +3089,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index 83832c40e614..35ce3605fc0b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -870,8 +870,12 @@ struct drm_xe_vm_bind_op {
 	/** @flags: Bind flags */
 	__u32 flags;
 
-	/** @region: Memory region to prefetch VMA to, instance not a mask */
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

