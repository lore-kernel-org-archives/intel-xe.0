Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F416C369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 10:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F95310E41C;
	Tue, 29 Apr 2025 10:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvbLPiAO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3FA10E419
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745921868; x=1777457868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cONKl6gOEBndz7BVY7X87cwHfL6WIopZeHYGpHPe9ok=;
 b=SvbLPiAOl9UcH74vJpaltZKhBhleXzOvz4doaTrZXsagG07kvW2Y5GwA
 CYTRBPi+mt7Hyulfw+oQuQ//y30o7F4uTphS4OWa+8aGM6rjs8y3EOVFf
 0fFajcuYC4wxn2/1JzvIZSD2x2UkPyWuLkYMyUOGwtfdNJBO5q8Yl/yZv
 lE5/092fmOcl0Yg1OKvYJo2apHrku5f/3T2mJLaepfbv+1a1KByiwt3pg
 J9VFgFL+xD/ky0YP+27nWGbGOIXTMXPojte8tVaFGDK/xcImpcROUl7M1
 LS1IEyPl+eNn9KhMZ8/BJVkcogJ+rHNPUrxPseXeW4SbZ7OWIE0h0ghrr Q==;
X-CSE-ConnectionGUID: IE3Rn546T4mQQNeKDzu91g==
X-CSE-MsgGUID: aTTYAlGoQgazRAA3eES8ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47243194"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="47243194"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 03:17:48 -0700
X-CSE-ConnectionGUID: XrNMNtZVTiSN5j8rnDbZcQ==
X-CSE-MsgGUID: re/GYV7bTg6/+ci5bxyslg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="134287579"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 29 Apr 2025 03:17:46 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 12/20] drm/xe/vm: Add an identifier in xe_vma_ops for svm
 prefetch
Date: Tue, 29 Apr 2025 16:12:25 +0530
Message-Id: <20250429104233.215602-13-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
References: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
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

Add a flag in xe_vma_ops to determine whether it has svm prefetch ops or
not.

v2:
 - s/false/0 (Matthew Brost)

v3:
 - s/XE_VMA_OPS_HAS_SVM_PREFETCH/XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 1 +
 drivers/gpu/drm/xe/xe_vm_types.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2ce91aebf39a..655bcf88f760 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3240,6 +3240,7 @@ static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
 	vops->q = q;
 	vops->syncs = syncs;
 	vops->num_syncs = num_syncs;
+	vops->flags = 0;
 }
 
 static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 0afd0296a57e..bfc145baad49 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -445,6 +445,9 @@ struct xe_vma_ops {
 	u32 num_syncs;
 	/** @pt_update_ops: page table update operations */
 	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
+	/** @flag: signify the properties within xe_vma_ops*/
+#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
+	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
 	bool inject_error;
-- 
2.34.1

