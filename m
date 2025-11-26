Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA138D11193
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 19:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E0E10E6FA;
	Wed, 26 Nov 2025 19:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8cnQRME";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CBB10E6F8
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 18:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764183598; x=1795719598;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pKaDNxgkjcRC5zf/ZhV8v9ZhxDOQNirwTKp+s+X620A=;
 b=F8cnQRMEVBYiDolk/ac1GAP8VK/2nB/sqb0UbHnXQGAIAq0LZwmJbhub
 nQ4kzNuqubV1PzlzLFrslBFq4s9EssCLiFvjwyEwmDkhnShpapE1DGflk
 X0APaxuF766V66QzT2acxTJ0d1WLiavBIy3RtPXR2geirXFSPOrNVvQwV
 nDpHBi2g6iNKqhJwKq6c6TBl6yKvwu3Dvzrq+M/tEQylr5AdM7xvsRaBR
 dhTBZGDtReXk4uXznogNg0fXRXLK8HT0BpG18bR/FIsSvhuJplGr/lMZz
 U7S2BMp+9AvCNk+c3ESgMYj+p6nbf69XO/vc8XQz2ZW7Nru3G/0GzyQOI A==;
X-CSE-ConnectionGUID: M1Zdv1SHRt6tkqeif4+lvw==
X-CSE-MsgGUID: nEC6aXgbTPycHpp30WNumA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66269517"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66269517"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:57 -0800
X-CSE-ConnectionGUID: VoEXQixMS9evbRSLZpZV7Q==
X-CSE-MsgGUID: RidIXLN+RvG2Bvv/Qjbz2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193121209"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 1/9] drm/xe: Add properties line to VM snapshot capture
Date: Wed, 26 Nov 2025 10:59:44 -0800
Message-Id: <20251126185952.546277-2-matthew.brost@intel.com>
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

Add properties line to VM snapshot capture which includes additional
information about VMA being dumped. This is helpful for debug purposes
but also to build a robust GPU hang replay tool.

The current format is:

[<vma address>]: <permissions>|<type>

Permissions has two options, either "read_only" or "read_write".

Type has two options, either "userptr" or "bo".

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8ab726289583..880877b10d91 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4047,6 +4047,9 @@ struct xe_vm_snapshot {
 	struct {
 		u64 ofs, bo_ofs;
 		unsigned long len;
+#define XE_VM_SNAP_FLAG_USERPTR		BIT(0)
+#define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
+		unsigned long flags;
 		struct xe_bo *bo;
 		void *data;
 		struct mm_struct *mm;
@@ -4087,6 +4090,8 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 		snap->snap[i].ofs = xe_vma_start(vma);
 		snap->snap[i].len = xe_vma_size(vma);
+		snap->snap[i].flags = xe_vma_read_only(vma) ?
+			XE_VM_SNAP_FLAG_READ_ONLY : 0;
 		if (bo) {
 			snap->snap[i].bo = xe_bo_get(bo);
 			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
@@ -4100,6 +4105,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 				snap->snap[i].data = ERR_PTR(-EFAULT);
 
 			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
+			snap->snap[i].flags |= XE_VM_SNAP_FLAG_USERPTR;
 		} else {
 			snap->snap[i].data = ERR_PTR(-ENOENT);
 		}
@@ -4169,6 +4175,12 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 	for (i = 0; i < snap->num_snaps; i++) {
 		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
 
+		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
+			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
+			   "read_only" : "read_write",
+			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
+			   "userptr" : "bo");
+
 		if (IS_ERR(snap->snap[i].data)) {
 			drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,
 				   PTR_ERR(snap->snap[i].data));
-- 
2.34.1

