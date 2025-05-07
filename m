Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83D6C3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:14:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF8C10E892;
	Wed,  7 May 2025 20:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ku/BGtUS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E06D10E1B0
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746648856; x=1778184856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vuDpdZcVZRXlcZrmYgP1tLJ4+8PCeGtjV+YBdBL7C5o=;
 b=ku/BGtUSeU6C76ae64dnhH1944/V1TTWKnZTPmX4aNsLsrtpCR6xjtrF
 uDfmP6VKca5xTPrYb4m2tL8oSGikSAby6eqBiV643dHV7vN30o5oEyXsU
 ZLmvOgNtCQSedhS82QgHs+fozHRNDWE1bwFJgOgGUjItT0mCcqkOHDxny
 pVDRaNKqmfEsyAkV3aA6Gb6MZHxyyvjA/Hnzi6RLsQGpVPS5AwmOKrLVY
 HgESYjsSitNvuAGmt944Pq2+O98nWehCC8djKvDu5pF4EnsEDbd1j9wd8
 iguOE2sygPvhfsZPNwvv7eQ/93ObtRNoQsGW7eD5yYkz7/hWW3bJpgw9V Q==;
X-CSE-ConnectionGUID: ftg7B4oFSn6lORnGrPP4vg==
X-CSE-MsgGUID: ss9dY4JWTk6W0pPogRTdfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65935082"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="65935082"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:14:16 -0700
X-CSE-ConnectionGUID: 7hKipxF2Sgm1wX7hsmg8SA==
X-CSE-MsgGUID: FFrOVkNuTJS90j8EFPHuLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="136570998"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:14:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, carlos.santa@intel.com,
 sushma.venkatesh.reddy@intel.com
Subject: [PATCH v4 2/9] drm/xe: Add "null_sparse" type to VM snap properties
Date: Wed,  7 May 2025 13:15:32 -0700
Message-Id: <20250507201539.1316770-3-matthew.brost@intel.com>
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

Add "null_sparse" type to VM snap properties indicating the VMA reads
zero and writes are droppped. This is useful information for debug and
will help build a robust GPU hang replay tool.

The current format is:

[<vma address>]: <permissions>|<type>

Permissions has two options, either "read_only" or "read_write".

Type has three options, either "userptr", "null_sparse", or "bo".

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ddeec681f71f..95c51834c620 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3729,6 +3729,7 @@ struct xe_vm_snapshot {
 		unsigned long len;
 #define XE_VM_SNAP_FLAG_USERPTR		BIT(0)
 #define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
+#define XE_VM_SNAP_FLAG_IS_NULL		BIT(2)
 		unsigned long flags;
 		struct xe_bo *bo;
 		void *data;
@@ -3786,6 +3787,8 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
 			snap->snap[i].flags |= XE_VM_SNAP_FLAG_USERPTR;
+		} else if (xe_vma_is_null(vma)) {
+			snap->snap[i].flags |= XE_VM_SNAP_FLAG_IS_NULL;
 		} else {
 			snap->snap[i].data = ERR_PTR(-ENOENT);
 		}
@@ -3806,7 +3809,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 		struct xe_bo *bo = snap->snap[i].bo;
 		int err;
 
-		if (IS_ERR(snap->snap[i].data))
+		if (IS_ERR(snap->snap[i].data) ||
+		    snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL)
 			continue;
 
 		snap->snap[i].data = kvmalloc(snap->snap[i].len, GFP_USER);
@@ -3858,6 +3862,8 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
 			   "read_only" : "read_write",
+			   snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL ?
+			   "null_sparse" :
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
 			   "userptr" : "bo");
 
@@ -3867,6 +3873,9 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 			continue;
 		}
 
+		if (snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL)
+			continue;
+
 		drm_printf(p, "[%llx].data: ", snap->snap[i].ofs);
 
 		for (j = 0; j < snap->snap[i].len; j += sizeof(u32)) {
-- 
2.34.1

