Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E410FCF8859
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 13:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50C510E74B;
	Thu, 20 Nov 2025 13:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpiZ59Ry";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CBE10E746
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 13:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763646125; x=1795182125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aEB+lFVUrcHtGG5XASdn49IxubnSr+1lIDiLnA/heuw=;
 b=YpiZ59RyVSS/JfL1I1Rm9wE00oJPr2yZ3VSv/x1bcdAGhaaX7LIDfCtE
 OU1WPMbQE63ylliIfsRj9CrQmYjr8sJaO0lA6tHrSMqhcponjV7mCRjpL
 qhGLPFZ10kORzvoSPzISVeUSXcW5FD5qDsDvlE/xrCIc5G6MmDdKqxBJ3
 e9YAKHsxOZb0KEVtsKQoZTrQRahl4Y/mle4ajvnS3ZUm6xPEIh+m9L5AE
 Dmkyn46EJLXwNmgaMGJYQR2Wg2CM8OOUQiNXDxAP/Tm9R9kuCmAnLh4oH
 f2DMFUagMjjuVYNjpS737pQtL0wXzlfsRI3S+Jxa8xWLl3oJy4kcvzKGP w==;
X-CSE-ConnectionGUID: QxD8BI5KS02Tc5dL7u9oKQ==
X-CSE-MsgGUID: D8tREkJLQlONu1xCNNze6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65742282"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65742282"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 05:42:05 -0800
X-CSE-ConnectionGUID: 7qT/ZB/VSjOchSUOTzrZEg==
X-CSE-MsgGUID: UkmanpIyTUW/u7UYMNb+oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="196509692"
Received: from ettammin-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.4])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 05:42:03 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 2/2] drm/xe/pagefault: Add tracepoints for page faults
Date: Thu, 20 Nov 2025 14:41:30 +0100
Message-ID: <20251120134148.1450441-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251120134148.1450441-1-francois.dugast@intel.com>
References: <20251120134148.1450441-1-francois.dugast@intel.com>
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

Add a new tracepoint when servicing VMA and SVM page faults to help UMD
and application debugging.

Here is a possible way to use it with bpftrace:

    sudo bpftrace -e 'tracepoint:xe:xe_pagefault_service {
        printf("%s page fault dev=%s addr=0x%llx asid=%u atomic=%u \
               access_type=%u fault_type=%u fault_level=%u \
               engine_class=%u engine_instance=%u vma_start=0x%llx \
               vma_size=0x%llx\n",
               args->cpu_addr_mirror ? "SVM" : "VMA", str(args->dev),
	       args->page_addr, args->asid, args->atomic,
               args->access_type, args->fault_type, args->fault_level,
               args->engine_class, args->engine_instance, args->vma_start,
               args->vma_size);
    }'

v2: Rebase after page fault refactor, expose more info (Stuart Summers)

Cc: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c |  7 +++-
 drivers/gpu/drm/xe/xe_trace.h     | 53 +++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index fe3e40145012..c04e064d8185 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -17,6 +17,7 @@
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
 #include "xe_svm.h"
+#include "xe_trace.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
 
@@ -163,6 +164,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	struct xe_vma *vma = NULL;
 	int err;
 	bool atomic;
+	bool cpu_addr_mirror;
 
 	/* Producer flagged this fault to be nacked */
 	if (pf->consumer.fault_level == XE_PAGEFAULT_LEVEL_NACK)
@@ -189,8 +191,11 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	}
 
 	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
+	cpu_addr_mirror = xe_vma_is_cpu_addr_mirror(vma);
 
-	if (xe_vma_is_cpu_addr_mirror(vma))
+	trace_xe_pagefault_service(xe, pf, vma, atomic, cpu_addr_mirror);
+
+	if (cpu_addr_mirror)
 		err = xe_svm_handle_pagefault(vm, vma, gt,
 					      pf->consumer.page_addr, atomic);
 	else
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 965b334bf348..08994e21f886 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -17,6 +17,7 @@
 #include "xe_gt_types.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_migrate.h"
+#include "xe_pagefault_types.h"
 #include "xe_sched_job.h"
 #include "xe_tlb_inval_types.h"
 #include "xe_vm.h"
@@ -496,6 +497,58 @@ DEFINE_EVENT(xe_migrate, xe_migrate_vram,
 	     TP_ARGS(xe, len, vram_addr, dir)
 );
 
+DECLARE_EVENT_CLASS(xe_pagefault,
+		    TP_PROTO(struct xe_device *xe, struct xe_pagefault *pf,
+			     struct xe_vma *vma, bool atomic,
+			     bool cpu_addr_mirror),
+		    TP_ARGS(xe, pf, vma, atomic, cpu_addr_mirror),
+
+		    TP_STRUCT__entry(
+			    __string(dev, __dev_name_xe(xe))
+			    __field(u64, page_addr)
+			    __field(u32, asid)
+			    __field(u8, access_type)
+			    __field(u8, fault_type)
+			    __field(u8, fault_level)
+			    __field(u8, engine_class)
+			    __field(u8, engine_instance)
+			    __field(u64, vma_start)
+			    __field(u64, vma_size)
+			    __field(u8, atomic)
+			    __field(u8, cpu_addr_mirror)
+			    ),
+
+		    TP_fast_assign(
+			    __assign_str(dev);
+			    __entry->page_addr = pf->consumer.page_addr;
+			    __entry->asid = pf->consumer.asid;
+			    __entry->access_type = pf->consumer.access_type;
+			    __entry->fault_type = pf->consumer.fault_type;
+			    __entry->fault_level = pf->consumer.fault_level;
+			    __entry->engine_class = pf->consumer.engine_class;
+			    __entry->engine_instance = pf->consumer.engine_instance;
+			    __entry->vma_start = xe_vma_start(vma);
+			    __entry->vma_size = xe_vma_size(vma);
+			    __entry->atomic = atomic;
+			    __entry->cpu_addr_mirror = cpu_addr_mirror;
+			    ),
+
+		    TP_printk("dev=%s addr=0x%llx asid=%u cpu_addr_mirror=%u atomic=%u access_type=%u fault_type=%u fault_level=%u engine_class=%u engine_instance=%u vma_start=0x%llx vma_size=0x%llx",
+			      __get_str(dev), __entry->page_addr,
+			      __entry->asid, __entry->cpu_addr_mirror,
+			      __entry->atomic, __entry->access_type,
+			      __entry->fault_type, __entry->fault_level,
+			      __entry->engine_class, __entry->engine_instance,
+			      __entry->vma_start, __entry->vma_size)
+);
+
+DEFINE_EVENT(xe_pagefault, xe_pagefault_service,
+	     TP_PROTO(struct xe_device *xe, struct xe_pagefault *pf,
+		      struct xe_vma *vma, bool atomic,
+		      bool cpu_addr_mirror),
+	     TP_ARGS(xe, pf, vma, atomic, cpu_addr_mirror)
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.43.0

