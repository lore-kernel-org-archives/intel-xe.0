Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB37EC3ABC5
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B9E10E898;
	Wed,  7 May 2025 20:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbbjqXBb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7054D10E1C4
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746648857; x=1778184857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wOVPgqsBYYjB/otwrrFYTZN8xosZ61jb3f1q1cxQBiY=;
 b=FbbjqXBblsyZPndThJIL3Euk8kWpyicMc/MG3OW+6Qdn+ZkTge4K2SrD
 rDbkCRSfyhgAZsAyYRdeAwSeANSV4ovFsO1o8y0nKGzBGvJPPBAm0CGmU
 xvnbwNT+pAf4jfOoi0LU9xQSqTtK1fiLUkODzm89n6kdUswfpqEc3rNT1
 6desQ05YTKLYaTms1BacqDiXNetV/lKeHEMV1+8XIwNG9VbEceJBRN9oZ
 bAKnc+4bxgtgGBbD1Qo7EibNBQpmwrTVrfhsL59Rlvzu9HEtNuCRPSu45
 Crau/jpcxG3VFwAFRgflW2CwjAI4MSIW9uDeETL8Qjm+lGpMCYvzW3+ax w==;
X-CSE-ConnectionGUID: KVhS10JzQbKJndfJwmxmmw==
X-CSE-MsgGUID: R2db+ZzLR1yA0SPPmS/Ilw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65935083"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="65935083"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:14:16 -0700
X-CSE-ConnectionGUID: BdlggQcZQtu+JUNWUGWnCA==
X-CSE-MsgGUID: v7AdVP4LRW2oKPwZ1hMSeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="136571002"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:14:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, carlos.santa@intel.com,
 sushma.venkatesh.reddy@intel.com
Subject: [PATCH v4 3/9] drm/xe: Add mem_region to properties line in VM
 snapshot capture
Date: Wed,  7 May 2025 13:15:33 -0700
Message-Id: <20250507201539.1316770-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507201539.1316770-1-matthew.brost@intel.com>
References: <20250507201539.1316770-1-matthew.brost@intel.com>
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

Add memory region to properties line in VM snapshot capture indicating
where the memory is located. The memory region corresponds to regions in
the uAPI. This is useful information for debug and will help build a
robust GPU hang replay tool.

The current format is:

[<vma address>]: <permissions>|<type>|mem_region=0x%x

Permissions has two options, either "read_only" or "read_write".

Type has three options, either "userptr", "null_sparse", or "bo".

Memory region is a bit mask of where the memory is located.

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 95c51834c620..842e482b60b2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3731,6 +3731,7 @@ struct xe_vm_snapshot {
 #define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
 #define XE_VM_SNAP_FLAG_IS_NULL		BIT(2)
 		unsigned long flags;
+		int uapi_mem_region;
 		struct xe_bo *bo;
 		void *data;
 		struct mm_struct *mm;
@@ -3776,6 +3777,18 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 		if (bo) {
 			snap->snap[i].bo = xe_bo_get(bo);
 			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
+			switch (bo->ttm.resource->mem_type) {
+			case XE_PL_SYSTEM:
+			case XE_PL_TT:
+				snap->snap[i].uapi_mem_region = 0;
+				break;
+			case XE_PL_VRAM0:
+				snap->snap[i].uapi_mem_region = 1;
+				break;
+			case XE_PL_VRAM1:
+				snap->snap[i].uapi_mem_region = 2;
+				break;
+			}
 		} else if (xe_vma_is_userptr(vma)) {
 			struct mm_struct *mm =
 				to_userptr_vma(vma)->userptr.notifier.mm;
@@ -3787,10 +3800,13 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
 			snap->snap[i].flags |= XE_VM_SNAP_FLAG_USERPTR;
+			snap->snap[i].uapi_mem_region = 0;
 		} else if (xe_vma_is_null(vma)) {
 			snap->snap[i].flags |= XE_VM_SNAP_FLAG_IS_NULL;
+			snap->snap[i].uapi_mem_region = -1;
 		} else {
 			snap->snap[i].data = ERR_PTR(-ENOENT);
+			snap->snap[i].uapi_mem_region = -1;
 		}
 		i++;
 	}
@@ -3859,13 +3875,16 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 	for (i = 0; i < snap->num_snaps; i++) {
 		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
 
-		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
+		drm_printf(p, "[%llx].properties: %s|%s|mem_region=0x%lx\n",
+			   snap->snap[i].ofs,
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
 			   "read_only" : "read_write",
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL ?
 			   "null_sparse" :
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
-			   "userptr" : "bo");
+			   "userptr" : "bo",
+			   snap->snap[i].uapi_mem_region == -1 ? 0 :
+			   BIT(snap->snap[i].uapi_mem_region));
 
 		if (IS_ERR(snap->snap[i].data)) {
 			drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,
-- 
2.34.1

