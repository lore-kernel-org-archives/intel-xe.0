Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB981D11195
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 18:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E2210E704;
	Wed, 26 Nov 2025 18:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5xyHeMd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBD510E666
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 18:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764183598; x=1795719598;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=u452VzTqfP3Qf6vHtTWcuTQbWd8/0PYxHMCypkZmzV4=;
 b=D5xyHeMd+kLq/Ir3JXLHRlZQz4adD8veJf04JAYUlpJ+qjC53SpyFC2w
 6ZF2dzttEBYu6BDrpYLoluvg39ch8FnqS10P8ULmy4nZSDrRWOVHMzRef
 15s8MM7Ddo1cCfsK2fkjx0v3PBMNYYemWFonHF3Xs3VgvrU7l0UZYrisY
 a8SMsEWVrsozLo2j0HOoGnDcxIBs3HrpRuyf2+TeO99/17xk98BSU+Jyd
 GdZjwmqQbvQ8KzenO9KsP6hA66owLfSwU874lYcb3wrFQGPGp8MsXXrFd
 mbRPEGoSN2iZ1u6MK6Oq++Z1XnF31XfWS9ztp3eYwW/mVJnq/kE5qt3Py w==;
X-CSE-ConnectionGUID: DA0W60mTQc6GKPCNlsdI9Q==
X-CSE-MsgGUID: iEE5amC5SYeqAWZGBVXzig==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66269518"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66269518"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:57 -0800
X-CSE-ConnectionGUID: JSqK0xvESa6xqvvwUBt3UQ==
X-CSE-MsgGUID: ZoZWUl+FSMKM4KiCfGgv/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193121210"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 2/9] drm/xe: Add "null_sparse" type to VM snap properties
Date: Wed, 26 Nov 2025 10:59:45 -0800
Message-Id: <20251126185952.546277-3-matthew.brost@intel.com>
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

Add "null_sparse" type to VM snap properties indicating the VMA reads
zero and writes are droppped. This is useful information for debug and
will help build a robust GPU hang replay tool.

The current format is:

[<vma address>]: <permissions>|<type>

Permissions has two options, either "read_only" or "read_write".

Type has three options, either "userptr", "null_sparse", or "bo".

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 880877b10d91..95bf328382bb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4049,6 +4049,7 @@ struct xe_vm_snapshot {
 		unsigned long len;
 #define XE_VM_SNAP_FLAG_USERPTR		BIT(0)
 #define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
+#define XE_VM_SNAP_FLAG_IS_NULL		BIT(2)
 		unsigned long flags;
 		struct xe_bo *bo;
 		void *data;
@@ -4106,6 +4107,8 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
 			snap->snap[i].flags |= XE_VM_SNAP_FLAG_USERPTR;
+		} else if (xe_vma_is_null(vma)) {
+			snap->snap[i].flags |= XE_VM_SNAP_FLAG_IS_NULL;
 		} else {
 			snap->snap[i].data = ERR_PTR(-ENOENT);
 		}
@@ -4126,7 +4129,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 		struct xe_bo *bo = snap->snap[i].bo;
 		int err;
 
-		if (IS_ERR(snap->snap[i].data))
+		if (IS_ERR(snap->snap[i].data) ||
+		    snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL)
 			continue;
 
 		snap->snap[i].data = kvmalloc(snap->snap[i].len, GFP_USER);
@@ -4178,6 +4182,8 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
 			   "read_only" : "read_write",
+			   snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL ?
+			   "null_sparse" :
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
 			   "userptr" : "bo");
 
@@ -4187,6 +4193,9 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 			continue;
 		}
 
+		if (snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL)
+			continue;
+
 		drm_printf(p, "[%llx].data: ", snap->snap[i].ofs);
 
 		for (j = 0; j < snap->snap[i].len; j += sizeof(u32)) {
-- 
2.34.1

