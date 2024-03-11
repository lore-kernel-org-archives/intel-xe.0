Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C34C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 14:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F4F10E7C9;
	Mon, 11 Mar 2024 14:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnle/x/c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FBD112470
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 14:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710168480; x=1741704480;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tfK57NWUSNQPFXDp/9zSAQ0bR0E5v9lFtcumAxc/bEA=;
 b=nnle/x/cI+1QXwUvQqOXA6mc7UUzXDHqx7BORcIzRkTxeITuLafVduE+
 IvWFL1uRTKZTGNhiTxDNCuu6mJy4lFSvtS7MGqZJPVlpVVx7SP9HffYbx
 JA/Ec9jJXB/7SBUjC5yMbWOl4/ih0cYCBpGjAmfSMS+uZrwuXUyx2ujo6
 w1GchFPDzdf6+EWGeSQV3QbXA4QV4Gr6QtcFxUJHqFGLIxPDs6PwAYc3k
 ol4lH+T+coUmWw+JFOh6/rWx/OZOwP3SnotRiTrHkp2dPkzUgMcNypU42
 kNutTJ1EdAYOZqLun7b68VUs+WVnINih9DXHvnpPTA6mMAQtAp8T7yLqc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="5013615"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="5013615"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 07:47:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15760351"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 07:47:58 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Remove unused cpu_atomic bo flag
Date: Mon, 11 Mar 2024 15:34:15 +0100
Message-ID: <20240311143415.6509-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

cpu_atomic is not set so remove it and also related dead
code.

Fixes: ddfa2d6a846a ("drm/xe/uapi: Kill VM_MADVISE IOCTL")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 22 +++-------------------
 drivers/gpu/drm/xe/xe_bo_types.h |  5 -----
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b89ac6db68a1..edf78505091e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1118,13 +1118,6 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
 	}
 }
 
-static bool should_migrate_to_system(struct xe_bo *bo)
-{
-	struct xe_device *xe = xe_bo_device(bo);
-
-	return xe_device_in_fault_mode(xe) && bo->props.cpu_atomic;
-}
-
 static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
@@ -1133,7 +1126,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_CREATE_VRAM_MASK;
 	vm_fault_t ret;
-	int idx, r = 0;
+	int idx;
 
 	if (needs_rpm)
 		xe_device_mem_access_get(xe);
@@ -1145,17 +1138,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	if (drm_dev_enter(ddev, &idx)) {
 		trace_xe_bo_cpu_fault(bo);
 
-		if (should_migrate_to_system(bo)) {
-			r = xe_bo_migrate(bo, XE_PL_TT);
-			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
-				ret = VM_FAULT_NOPAGE;
-			else if (r)
-				ret = VM_FAULT_SIGBUS;
-		}
-		if (!ret)
-			ret = ttm_bo_vm_fault_reserved(vmf,
-						       vmf->vma->vm_page_prot,
-						       TTM_BO_VM_NUM_PREFAULT);
+		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
+					       TTM_BO_VM_NUM_PREFAULT);
 		drm_dev_exit(idx);
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 14ef13b7b421..f62a130fc948 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -64,11 +64,6 @@ struct xe_bo {
 		s16 preferred_gt;
 		/** @preferred_mem_type: preferred memory type */
 		s32 preferred_mem_type;
-		/**
-		 * @cpu_atomic: the CPU expects to do atomics operations to
-		 * this BO
-		 */
-		bool cpu_atomic;
 		/**
 		 * @device_atomic: the device expects to do atomics operations
 		 * to this BO
-- 
2.42.0

