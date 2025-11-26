Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC64DD11195
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 19:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DED10E6E6;
	Wed, 26 Nov 2025 19:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SDHzP94k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E83E10E661
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764183598; x=1795719598;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SihcvJVS/OniLJOv/RmeKj80aXwgvt8JNDhj4ufJ2uc=;
 b=SDHzP94k8WWxHyC8ETdYr5ScshUBV6QhuTOV+lio2l7wv02UeyaFruPb
 SuPNV2zpkK3NI0UMVXQmz1O+ZXbTmwp9+NFXdeoi1EKaesZeMwk35vQir
 F3gZinDu4FwBAypHtYIdIl6yCS5eLMn7auqrbkUztz0l2gqvgUVxq9yPv
 OPemidqXqLVMRz0MwKOXVVHCX+0AC9ymJo1gk9BIC51RdigXhqWkkhHCJ
 wn09a2P6BOn/BrxBYckpD6ZQfbMdcY8wYfDBL0d2b4v1JnslwbCcQ6zp/
 xw/I0GySJ/dVVLXdf0O5qqPUeA7L4ATWKXhetUg2yj46IgxV/p+6DYXhg w==;
X-CSE-ConnectionGUID: ZNKST99VQsiJtHIB1B7GFA==
X-CSE-MsgGUID: /yMqNB9CSCuYizOV+0h1xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66269520"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66269520"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:57 -0800
X-CSE-ConnectionGUID: Zb5/pe08Reihx7Jj2cs4Zw==
X-CSE-MsgGUID: fuM+9eEbTeCrRggOtFx1tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193121212"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 4/9] drm/xe: Add pat_index to properties line in VM
 snapshot capture
Date: Wed, 26 Nov 2025 10:59:47 -0800
Message-Id: <20251126185952.546277-5-matthew.brost@intel.com>
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

Add pat index to properties line in VM snapshot capture indicating
the VMA caching properites. This is useful information for debug and
will help build a robust GPU hang replay tool.

The current format is:

[<vma address>]: <permissions>|<type>|mem_region=0x%x|pat_index=%d

Permissions has two options, either "read_only" or "read_write".

Type has three options, either "userptr", "null_sparse", or "bo".

Memory region is a bit mask of where the memory is located.

Pat index corresponds to the value setup upon VM bind.

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f2cf95d23bd0..b298953d2eed 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4052,6 +4052,7 @@ struct xe_vm_snapshot {
 #define XE_VM_SNAP_FLAG_IS_NULL		BIT(2)
 		unsigned long flags;
 		int uapi_mem_region;
+		int pat_index;
 		struct xe_bo *bo;
 		void *data;
 		struct mm_struct *mm;
@@ -4094,6 +4095,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 		snap->snap[i].len = xe_vma_size(vma);
 		snap->snap[i].flags = xe_vma_read_only(vma) ?
 			XE_VM_SNAP_FLAG_READ_ONLY : 0;
+		snap->snap[i].pat_index = vma->attr.pat_index;
 		if (bo) {
 			snap->snap[i].bo = xe_bo_get(bo);
 			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
@@ -4195,7 +4197,7 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 	for (i = 0; i < snap->num_snaps; i++) {
 		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
 
-		drm_printf(p, "[%llx].properties: %s|%s|mem_region=0x%lx\n",
+		drm_printf(p, "[%llx].properties: %s|%s|mem_region=0x%lx|pat_index=%d\n",
 			   snap->snap[i].ofs,
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
 			   "read_only" : "read_write",
@@ -4204,7 +4206,8 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
 			   "userptr" : "bo",
 			   snap->snap[i].uapi_mem_region == -1 ? 0 :
-			   BIT(snap->snap[i].uapi_mem_region));
+			   BIT(snap->snap[i].uapi_mem_region),
+			   snap->snap[i].pat_index);
 
 		if (IS_ERR(snap->snap[i].data)) {
 			drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,
-- 
2.34.1

