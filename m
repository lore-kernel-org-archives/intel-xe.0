Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A81C001DF
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 18:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA7E10E049;
	Thu,  3 Aug 2023 18:52:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC09810E049
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Aug 2023 18:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691088738; x=1722624738;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jqg+nBKQ11P5Wk7Y65SwgGaSlaJrM93kxRjBIczrpS4=;
 b=GgLf6u25FuziavcgWdOtAzPxI/Zr+pYHVwq9/lJQEL3xM7Zp7LOaMTmj
 c9bHtotnN2khnLfaDRGWKNc2AKz505JP6iukx3sBYwI111HgITjXUFIgD
 dUAwrlkGZEvDNZ0AZBfPBvwey+ylbLhIb8d2+xBekyW953iEnTOkJTggu
 IRjm+AaW2kkjsDDuPOztv+Efg+Ut95jNhrgsnnaxhaNHGHsTMJMRIjEEm
 lnJSoKNC1N0QJk4Rn3vBPdQmhfTrHoGa4nxjXHRR10ZhTKLWG4xTky7GU
 14GV9XyvmuNXdHK9cZhU89WhuBPWkuRFJKIGWrBnvlGz8gBvtv6FB2IGE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="400927271"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="400927271"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 11:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="873060790"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 11:52:20 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  3 Aug 2023 15:01:49 -0400
Message-Id: <20230803190149.2637666-1-oak.zeng@intel.com>
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

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/Makefile        | 2 +-
 drivers/gpu/drm/xe/xe_vm.c         | 5 +++++
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e79624ab2cb3..e6a05d35c931 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -37,7 +37,7 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
 $(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
-$(obj)/xe_guc.o $(obj)/xe_wa.o $(obj)/xe_ring_ops.o: $(generated_oob)
+$(obj)/xe_guc.o $(obj)/xe_wa.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o: $(generated_oob)
 
 # Please keep these build lists sorted!
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cb28dbc2bdbb..b045bb341a5c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -29,6 +29,8 @@
 #include "xe_res_cursor.h"
 #include "xe_sync.h"
 #include "xe_trace.h"
+#include "generated/xe_wa_oob.h"
+#include "xe_wa.h"
 
 #define TEST_VM_ASYNC_OPS_ERROR
 
@@ -1235,6 +1237,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	INIT_LIST_HEAD(&vm->extobj.list);
 
+	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
+		flags |= XE_VM_FLAG_SCRATCH_PAGE;
+
 	if (!(flags & XE_VM_FLAG_MIGRATION))
 		xe_device_mem_access_get(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 15c23813398a..6fc68c592ca8 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -15,3 +15,4 @@
 18020744125	PLATFORM(PVC)
 1509372804	PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
 1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
+14016763929	PLATFORM(DG2)
-- 
2.26.3

