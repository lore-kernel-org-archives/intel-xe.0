Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D54C001DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 20:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EAFA10E11A;
	Fri,  4 Aug 2023 20:35:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA4910E11A
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 20:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691181305; x=1722717305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=baNlYhdkAlxigs0vuslIeNpOy82zAnxYYE1lhGYmxbU=;
 b=LnBuYHgpuXUHUKv0ZOK1SY4+9PzLp4ZmwpW/ZfmW6v69sx1e17GI3omB
 KNGuK09IK22domMrwCGy7SUj13CjRzynmHZjZQ4eSc36fSEZMnEm8ALMF
 M4H1EA4VRqh+r/Dtmlktbzc7jTFPVGvLUiq6CTQ/iI401Tee9AVgfxxqG
 k7tahCKh6JduMhWFRcic9oyTj+xswe7O0cQPIYm0KSmiVh50LGvi6O4fu
 m2lKnOZE6TRZt2jc23mXRdVjpfAP1VPAQOsqYtKoWCay+iQfu2488xBUD
 5+qJ2M7zuk8w6iqoCT+eTtODBHMc+gJKyvZfhdPXiOVDoBJo/aRmgq0Al Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="372988458"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; d="scan'208";a="372988458"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 13:35:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="844227672"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="844227672"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 13:34:45 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  4 Aug 2023 16:44:22 -0400
Message-Id: <20230804204422.2656586-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Implement HW workaround 14016763929
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
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

To workaround a HW bug on DG2, driver is required to map the whole
ppgtt virtual address space before GPU workload submission. Thus
set the XE_VM_FLAG_SCRATCH_PAGE flag during vm create so the whole
address space is mapped to point to scratch page.

v1:
  - Move the workaround implementation from xe_vm_create to
    xe_vm_create_ioctl - Brian
  - Reorder error checking in xe_vm_create_ioctl - Jose
  - Implement WA only for DG2-G10 and DG2-G12

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |  2 +-
 drivers/gpu/drm/xe/xe_vm.c         | 13 +++++++++----
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 ++
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1b59702cd9f9..c91bb7ddcf1d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -37,7 +37,7 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
 $(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
-$(obj)/xe_guc.o $(obj)/xe_wa.o $(obj)/xe_ring_ops.o: $(generated_oob)
+$(obj)/xe_guc.o $(obj)/xe_wa.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o: $(generated_oob)
 
 # Please keep these build lists sorted!
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cb28dbc2bdbb..394bd23dc18e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -29,6 +29,8 @@
 #include "xe_res_cursor.h"
 #include "xe_sync.h"
 #include "xe_trace.h"
+#include "generated/xe_wa_oob.h"
+#include "xe_wa.h"
 
 #define TEST_VM_ASYNC_OPS_ERROR
 
@@ -1982,6 +1984,13 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	int err;
 	u32 flags = 0;
 
+	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
+		args->flags |= DRM_XE_VM_CREATE_SCRATCH_PAGE;
+
+	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
+			 !xe->info.supports_usm))
+		return -EINVAL;
+
 	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
@@ -2004,10 +2013,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 			 xe_device_in_fault_mode(xe)))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
-			 !xe->info.supports_usm))
-		return -EINVAL;
-
 	if (args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE)
 		flags |= XE_VM_FLAG_SCRATCH_PAGE;
 	if (args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE)
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 15c23813398a..ea90dcc933b5 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -15,3 +15,5 @@
 18020744125	PLATFORM(PVC)
 1509372804	PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
 1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
+14016763929	SUBPLATFORM(DG2, G10)
+		SUBPLATFORM(DG2, G12)
-- 
2.26.3

