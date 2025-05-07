Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDD8C3ABC9
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CD410E894;
	Wed,  7 May 2025 20:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5nIeZUP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56F810E88D
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746648857; x=1778184857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K7P7O5xXSmWBvqvs7CullBw36yZgeLm6zAItIXQFwI0=;
 b=L5nIeZUPvxV+AdoxDXwpWsobk3P78ZItwGx5lGkdwRuINRrchqDk5EJ5
 PTvoUDfe8VzcTsR2WU2jCqVTfyfJv/Z7gpMaJo4uNBNLLzzYz4zBc72eo
 C8r8/Td69GsxHFVvrAVCKmvIrFmcajUmKIUz0y6RbD5zwhbaRxfhqIFcy
 dUviaZAIIMJ3jRUqLHhHfHccC5RJw5I20TYSJZjY95FeIr6DPA2tZ6iRi
 pjy0jRrw+jUs5WS5j2x0qeC6MgKufkuqLaGmxpbsiVo603Sc20u6A+C+0
 1Y8WVNdz456d5KJrjhC/1kqNIwq0E64fg+99MkASYok0IYkCoZ2RP0BLZ g==;
X-CSE-ConnectionGUID: r+dC+QLLQCGdKr5KXVj/9g==
X-CSE-MsgGUID: c0T1YtrCTTWTgRQf31TsbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65935087"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="65935087"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:14:17 -0700
X-CSE-ConnectionGUID: qwQx80PvRpyv4UtQxGILqw==
X-CSE-MsgGUID: JNa7ocusR/6tuzUp6OTb3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="136571013"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:14:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, carlos.santa@intel.com,
 sushma.venkatesh.reddy@intel.com
Subject: [PATCH v4 5/9] drm/xe: Add cpu_caching to properties line in VM
 snapshot capture
Date: Wed,  7 May 2025 13:15:35 -0700
Message-Id: <20250507201539.1316770-6-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_vm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0675c46b7c63..5af2e79ae34e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3733,6 +3733,7 @@ struct xe_vm_snapshot {
 		unsigned long flags;
 		int uapi_mem_region;
 		int pat_index;
+		int cpu_caching;
 		struct xe_bo *bo;
 		void *data;
 		struct mm_struct *mm;
@@ -3777,6 +3778,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 			XE_VM_SNAP_FLAG_READ_ONLY : 0;
 		snap->snap[i].pat_index = vma->pat_index;
 		if (bo) {
+			snap->snap[i].cpu_caching = bo->cpu_caching;
 			snap->snap[i].bo = xe_bo_get(bo);
 			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
 			switch (bo->ttm.resource->mem_type) {
@@ -3877,7 +3879,7 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 	for (i = 0; i < snap->num_snaps; i++) {
 		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
 
-		drm_printf(p, "[%llx].properties: %s|%s|mem_region=0x%lx|pat_index=%d\n",
+		drm_printf(p, "[%llx].properties: %s|%s|mem_region=0x%lx|pat_index=%d|cpu_caching=%d\n",
 			   snap->snap[i].ofs,
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
 			   "read_only" : "read_write",
@@ -3887,7 +3889,8 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
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

