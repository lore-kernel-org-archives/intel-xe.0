Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EF7C28B2F
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 02:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBE710E06B;
	Wed, 12 Mar 2025 02:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ArfHOzwM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F20910E06B
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 02:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741747030; x=1773283030;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fzIT/E+5Mp3OMDXAtg0WO1QbFYNAeTFFTc21TOLiLJs=;
 b=ArfHOzwM73WNbyxqmb0sS7oTPS9RqU3k13teN62D2aYUc+zm8dEPk8x4
 GRy0mLzSpTmRGQYPF68Lqeh0i/2FrNNtvAuuPSXbeT2knNDGtBmis3L0a
 Qr6RHHn3ffar9HRAysZhmNmOPMJVtCp+iK97JiwXcWHMAoWjmkjeYLDJF
 JytOK6bbWYHvBq4UhUhPWY559lw/MWjed+iJY29a0ZbZDlII/PKeGfjQR
 87x3sgTwId2+7ulQvwZaOs2ROqvo//6AKbxYgJBz6cZigSLZ+swTw4XZp
 PN8odrMIw3aYbkgT1s4jybGevlUVaKviXokVzu0s9h7vdAVmze/SpV8He A==;
X-CSE-ConnectionGUID: ye5ZwFzoQnyaKhuehbNIdQ==
X-CSE-MsgGUID: pKmjN84YSRmWSHlTi0V/sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="60213732"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="60213732"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 19:37:10 -0700
X-CSE-ConnectionGUID: r+AE4H6mQLm8zskXFhkkEA==
X-CSE-MsgGUID: glYoH96lSwiVJ0790amZ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="120451724"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 19:37:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dan.carpenter@linaro.org
Subject: [PATCH] drm/xe: Fix uninitialized variable in xe_vm_bind_ioctl()
Date: Tue, 11 Mar 2025 19:38:16 -0700
Message-Id: <20250312023816.3641312-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

The error handling assumes that vm_bind_ioctl_check_args() will
initialize "bind_ops" but there are a couple early returns where that's
not true.  Initialize "bind_ops" to NULL from the start.

Also if vm_bind_ioctl_check_args, fails set bind_ops to NULL after
freeing.

Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 60303998bd61..2e6db5759d26 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3177,8 +3177,10 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 	return 0;
 
 free_bind_ops:
-	if (args->num_binds > 1)
+	if (args->num_binds > 1) {
 		kvfree(*bind_ops);
+		*bind_ops = NULL;
+	}
 	return err;
 }
 
@@ -3284,7 +3286,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct xe_exec_queue *q = NULL;
 	u32 num_syncs, num_ufence = 0;
 	struct xe_sync_entry *syncs = NULL;
-	struct drm_xe_vm_bind_op *bind_ops;
+	struct drm_xe_vm_bind_op *bind_ops = NULL;
 	struct xe_vma_ops vops;
 	struct dma_fence *fence;
 	int err;
-- 
2.34.1

