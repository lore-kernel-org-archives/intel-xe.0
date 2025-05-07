Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40156C3ABC5
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:14:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072C710E1C4;
	Wed,  7 May 2025 20:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdKuYlE4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3113B10E1C4
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746648856; x=1778184856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pFA3CvFCHc+YsWIm/ccBaiqK2sGEo4nia5WePu04hN0=;
 b=bdKuYlE4f+k5d7IAeD1DfUzCrNPcWLRLd4h/ApcEmxpoCBLzlGSwlHtp
 1AgIb/eIIizV1oPW71YrLmCQXgnreFy8IuHJJxpbU/hvS1eMQljhdX9Mf
 KylqFmAJ2Z+LkRy06ul3HdsEekGzdMhdUOvuWXFtHosqO0T9DrgQVdT6e
 VxjyYX4b9YZ/Zvvkk6Y/McUJ77oUAe8esSVgPeOUjC4C213v6XCf4+BkZ
 ciN63Mwub7/eEc1VU13aBrq28m5/29VLqvLTONkkjCvUCVI51ZCOwuge2
 1l+0JJUZrm1Uc0P923W/t64TxVx2YGt6fjI0vBEXLuSTF0eNYLGs0IRjo g==;
X-CSE-ConnectionGUID: HDfy6runTsKlIrW4dAmI6A==
X-CSE-MsgGUID: qGjJsXC7Sfe1DOx0kZ+dLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65935081"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="65935081"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:14:16 -0700
X-CSE-ConnectionGUID: n8bAm4WhR8GKsl4vINmL/A==
X-CSE-MsgGUID: zPQBf/EVSJetkOD1vHF5hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="136570994"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:14:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, carlos.santa@intel.com,
 sushma.venkatesh.reddy@intel.com
Subject: [PATCH v4 1/9] drm/xe: Add properties line to VM snapshot capture
Date: Wed,  7 May 2025 13:15:31 -0700
Message-Id: <20250507201539.1316770-2-matthew.brost@intel.com>
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

Add properties line to VM snapshot capture which includes additional
information about VMA being dumped. This is helpful for debug purposes
but also to build a robust GPU hang replay tool.

The current format is:

[<vma address>]: <permissions>|<type>

Permissions has two options, either "read_only" or "read_write".

Type has two options, either "userptr" or "bo".

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 79323c78130f..ddeec681f71f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3727,6 +3727,9 @@ struct xe_vm_snapshot {
 	struct {
 		u64 ofs, bo_ofs;
 		unsigned long len;
+#define XE_VM_SNAP_FLAG_USERPTR		BIT(0)
+#define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
+		unsigned long flags;
 		struct xe_bo *bo;
 		void *data;
 		struct mm_struct *mm;
@@ -3767,6 +3770,8 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 		snap->snap[i].ofs = xe_vma_start(vma);
 		snap->snap[i].len = xe_vma_size(vma);
+		snap->snap[i].flags = xe_vma_read_only(vma) ?
+			XE_VM_SNAP_FLAG_READ_ONLY : 0;
 		if (bo) {
 			snap->snap[i].bo = xe_bo_get(bo);
 			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
@@ -3780,6 +3785,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 				snap->snap[i].data = ERR_PTR(-EFAULT);
 
 			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
+			snap->snap[i].flags |= XE_VM_SNAP_FLAG_USERPTR;
 		} else {
 			snap->snap[i].data = ERR_PTR(-ENOENT);
 		}
@@ -3849,6 +3855,12 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
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

