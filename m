Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BB4EE49A0
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 11:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB0D10E412;
	Wed, 23 Aug 2023 11:40:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2DC10E410
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692790847; x=1724326847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ACET/t5IDVA75OI8sgffxv6xVuV8qmQgEfjAiJFv1jk=;
 b=d1bA5GPUVGDyeG0JvMuED0ncoiJFut+QSXd6+fdjNIlq3tVZs78xh7Mk
 2zxY1IwooplpgNJQ2Zz4xfqKB2vbTeoVWTLh1yUwZnRfJtppW9stvoLu5
 CsqPrdPqNOlJj4k693URdB9WbWAo6UQZPVuIuer13wT9BErwFRIt6A/Iu
 Hzl+aDjgpe4T//QSPewyOjf3tJB+1/Twv6UIZqxpQEEFi1S96EW9C34fy
 waCKmQWXJV5dUtAbc8845Dy56sZ668VgdnZAmvjQebk0Zo26+BNg0+456
 cSaiaxelel01jbqnYsuv0RDGESA0EfRAry9WLuqR45WJHYSwMIGjjBU0A w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="460506111"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="460506111"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 04:40:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="910481350"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="910481350"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 04:40:45 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 23 Aug 2023 04:40:40 -0700
Message-Id: <20230823114040.31769-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
References: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/3] drm/xe/pvc: Use fast copy engines as
 migrate engine on PVC
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
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some copy hardware engine instances are faster than others on PVC.
Use a virtual engine of these plus the reserved instance for the migrate
engine on PVC. The idea being if a fast instance is available it will be
used and the throughput of kernel copies, clears, and pagefault
servicing will be higher.

v2: Use OOB WA, use all copy engines if no WA is required

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c    | 39 +++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 956a96b38346..60f4e0a60b71 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -12,6 +12,7 @@
 #include <drm/ttm/ttm_tt.h>
 #include <drm/xe_drm.h>
 
+#include "generated/xe_wa_oob.h"
 #include "regs/xe_gpu_commands.h"
 #include "tests/xe_test.h"
 #include "xe_bb.h"
@@ -29,6 +30,7 @@
 #include "xe_sync.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
+#include "xe_wa.h"
 
 /**
  * struct xe_migrate - migrate context.
@@ -298,6 +300,36 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	return 0;
 }
 
+/**
+ * xe_migrate_usm_logical_mask - Return logical mask for usm migrate engine.
+ * @gt: gt instance
+ *
+ * Due to workaround 16017236439, odd instance hardware copy engines are
+ * faster than even instance ones.
+ * This function returns the mask involving all faster copy engines and the
+ * reserved copy engine to be used as logical mask for migrate engine.
+ * Including the reserved copy engine is required to avoid deadlocks due to
+ * migrate jobs servicing the faults gets stuck behind the job that faulted.
+ */
+u32 xe_migrate_usm_logical_mask(struct xe_gt *gt)
+{
+	u32 logical_mask = 0;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	for_each_hw_engine(hwe, gt, id) {
+		if (hwe->class != XE_ENGINE_CLASS_COPY)
+			continue;
+
+		if (!XE_WA(gt, 16017236439) ||
+		    xe_gt_is_usm_hwe(gt, hwe) || hwe->instance & 1)
+			logical_mask |= BIT(hwe->logical_instance);
+	}
+
+	pr_info("NNV %s logical_mask 0x%x\n", __func__, logical_mask);
+	return logical_mask;
+}
+
 /**
  * xe_migrate_init() - Initialize a migrate context
  * @tile: Back-pointer to the tile we're initializing for.
@@ -338,11 +370,12 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 							   XE_ENGINE_CLASS_COPY,
 							   primary_gt->usm.reserved_bcs_instance,
 							   false);
-		if (!hwe)
+		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
+
+		if (!hwe || !logical_mask)
 			return ERR_PTR(-EINVAL);
 
-		m->q = xe_exec_queue_create(xe, vm,
-					    BIT(hwe->logical_instance), 1,
+		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1,
 					    hwe, EXEC_QUEUE_FLAG_KERNEL);
 	} else {
 		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index ea90dcc933b5..599e67169dae 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -17,3 +17,4 @@
 1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
 14016763929	SUBPLATFORM(DG2, G10)
 		SUBPLATFORM(DG2, G12)
+16017236439	PLATFORM(PVC)
-- 
2.21.0.rc0.32.g243a4c7e27

