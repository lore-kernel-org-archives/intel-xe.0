Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD044D11196
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 18:59:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690B910E6E2;
	Wed, 26 Nov 2025 18:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdyc4Sll";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4756410E666
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764183598; x=1795719598;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=s0ypJo8bhuyw7a4BiIjiQ4oJLHO92U4s8nrRXgJ+M08=;
 b=mdyc4SllwTEodNk87Z2GV28tuALCddS7FWnK6OXfAf35EQUUf/tVL42m
 mQN6/wBiGlgdSaAnNDGhA5WI/fdBMqCwb5PdZE8dLMxs+BM8E2lU+3sEC
 oja4aKN6hGQyFfDkl7YC+c5PwxNUvkuJKnps6MR6XM3c33CyoDiv0LAec
 yebxlGICUjttZ8W9zFChrYVxdR953zHvaYqr8rWlOnrzd8peAwOdsFJTv
 eseterMTGMutR9f4EtL4bUjkrciptd2TUQ6JXLw6B9yFewMMctbqrX/sx
 YLV3jHUy6TIuuyISg26SL1dpViJM5abM5FZbwY5lACOc3dALfWcNC/mSR Q==;
X-CSE-ConnectionGUID: aY+bSS7zRlGFBXW61iwlfg==
X-CSE-MsgGUID: xPoPxRodTqWenXjb3iRWfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66269521"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66269521"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:57 -0800
X-CSE-ConnectionGUID: 74EjybM6SlWr/t6Uh/UgOA==
X-CSE-MsgGUID: EZjSwaEbRA2WP9+0lCBXnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193121213"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 5/9] drm/xe: Add cpu_caching to properties line in VM
 snapshot capture
Date: Wed, 26 Nov 2025 10:59:48 -0800
Message-Id: <20251126185952.546277-6-matthew.brost@intel.com>
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

Add CPU caching to properties line in VM snapshot capture indicating
the BO caching properites. This is useful information for debug and
will help build a robust GPU hang replay tool.

The current format is:

[<vma address>]: <permissions>|<type>|mem_region=0x%x|pat_index=%d|cpu_caching=%d

Permissions has two options, either "read_only" or "read_write".

Type has three options, either "userptr", "null_sparse", or "bo".

Memory region is a bit mask of where the memory is located.

Pat index corresponds to the value setup upon VM bind.

CPU caching corresponds to the value of BO setup upon creation.

v2:
 - Save off cpu_caching value rather than looking at BO (Carlos)
v4:
 - Fix NULL ptr dereference (Carlos)

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b298953d2eed..8bf3f9d3d644 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4053,6 +4053,7 @@ struct xe_vm_snapshot {
 		unsigned long flags;
 		int uapi_mem_region;
 		int pat_index;
+		int cpu_caching;
 		struct xe_bo *bo;
 		void *data;
 		struct mm_struct *mm;
@@ -4097,6 +4098,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 			XE_VM_SNAP_FLAG_READ_ONLY : 0;
 		snap->snap[i].pat_index = vma->attr.pat_index;
 		if (bo) {
+			snap->snap[i].cpu_caching = bo->cpu_caching;
 			snap->snap[i].bo = xe_bo_get(bo);
 			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
 			switch (bo->ttm.resource->mem_type) {
@@ -4197,7 +4199,7 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 	for (i = 0; i < snap->num_snaps; i++) {
 		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
 
-		drm_printf(p, "[%llx].properties: %s|%s|mem_region=0x%lx|pat_index=%d\n",
+		drm_printf(p, "[%llx].properties: %s|%s|mem_region=0x%lx|pat_index=%d|cpu_caching=%d\n",
 			   snap->snap[i].ofs,
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
 			   "read_only" : "read_write",
@@ -4207,7 +4209,8 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 			   "userptr" : "bo",
 			   snap->snap[i].uapi_mem_region == -1 ? 0 :
 			   BIT(snap->snap[i].uapi_mem_region),
-			   snap->snap[i].pat_index);
+			   snap->snap[i].pat_index,
+			   snap->snap[i].cpu_caching);
 
 		if (IS_ERR(snap->snap[i].data)) {
 			drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,
-- 
2.34.1

