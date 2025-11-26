Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EB1D11196
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 19:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7F810E6FE;
	Wed, 26 Nov 2025 19:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KR5VpMf2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2557410E6FE
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764183598; x=1795719598;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=u/SvafNKyR6n/UqwSzHMz9ZZXWLwV1F6eydB4AqrzbM=;
 b=KR5VpMf28ga0Vb1Mfj4PCkh5SMXhAu/fK4GFjXovu2dp4IoXZe5z6ylJ
 wrodKjZ3GD9IaYvnfurLr8ZCw0EzaBRmYst2JVcokffUOdCz0rlh/Pfhb
 hKKWvjudZlWydddrkcAMlsR730hWa7PpFxwRtVC7UIzdKItHuupQYDdMs
 FrTfgsj8WmGZii0AaJsjR95VKxM37WDYSmMpHzo1mAnpcvrocyFmBryqM
 Gcb36tQSyoCFgaegeg+M4mfe/4DJFsLDygSIS1Eo2tiqW+6XU9JCt8QWo
 2960381M/LipDAzrFdL9vSD6dF9FxWfmdCtASA/Waxwg2OEpvAIy0688U g==;
X-CSE-ConnectionGUID: opjF6VW4SoyhoXgxRjUFkA==
X-CSE-MsgGUID: ZK+OzS7CSj2MQE4dQtlRQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66269519"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66269519"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:57 -0800
X-CSE-ConnectionGUID: cgl4parGQbW7HL8A8t1zpg==
X-CSE-MsgGUID: fZbXE3lYRTqda5zB2mQq2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193121211"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 3/9] drm/xe: Add mem_region to properties line in VM
 snapshot capture
Date: Wed, 26 Nov 2025 10:59:46 -0800
Message-Id: <20251126185952.546277-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126185952.546277-1-matthew.brost@intel.com>
References: <20251126185952.546277-1-matthew.brost@intel.com>
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
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 95bf328382bb..f2cf95d23bd0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4051,6 +4051,7 @@ struct xe_vm_snapshot {
 #define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
 #define XE_VM_SNAP_FLAG_IS_NULL		BIT(2)
 		unsigned long flags;
+		int uapi_mem_region;
 		struct xe_bo *bo;
 		void *data;
 		struct mm_struct *mm;
@@ -4096,6 +4097,18 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
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
@@ -4107,10 +4120,13 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
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
@@ -4179,13 +4195,16 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
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

