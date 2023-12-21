Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E33C46CD3
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 04:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B91B10E671;
	Thu, 21 Dec 2023 04:28:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1571F10E653;
 Thu, 21 Dec 2023 04:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132903; x=1734668903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a0CyKgI90QVtJzTmA2DuaoGo2T/vpJ7XqCsA6jXeFbo=;
 b=XpaSkZFyFkvcAdSl0sksFKyOI4E2xNW2n6ZD4B0pOnv6agv0hRKWhoUV
 xIlDU79JVhIIG4my6x2d/WlhXmWhnahlvEt1aW2ruSZyoC+Rz6Klv3Vtz
 qpT2f4pBmtnjLPOXQ+beXVoK9PXGCxbdTNwd/0j/tr5X1pT9v80hKh+zl
 MGjYv//nka0XYBY39iVg7EM7OBtBzP7ZRuxB10oc5z1p+NrzxpuP/ocl6
 its10y4ngxFsOh6y1Z4Rnk10HTLRTpY6NIfSpras5aY1wggJKP4DBq/W7
 RnxoynEswvWr3DMo8HuJCvPMqg/CuEoiKd/jHy4M4eqDtu1nlSSuaITjx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069774"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069774"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481378"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481378"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:20 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 14/22] drm/xe/svm: trace svm range migration
Date: Wed, 20 Dec 2023 23:38:04 -0500
Message-Id: <20231221043812.3783313-15-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231221043812.3783313-1-oak.zeng@intel.com>
References: <20231221043812.3783313-1-oak.zeng@intel.com>
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

Add function to trace svm range migration, either
from vram to sram, or sram to vram

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_svm_migrate.c |  1 +
 drivers/gpu/drm/xe/xe_trace.h       | 30 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c b/drivers/gpu/drm/xe/xe_svm_migrate.c
index 3be26da33aa3..b4df411e04f3 100644
--- a/drivers/gpu/drm/xe/xe_svm_migrate.c
+++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
@@ -201,6 +201,7 @@ vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
 	if (!migrate_vma.cpages)
 		goto free_buf;
 
+	trace_xe_svm_migrate_vram_to_sram(range);
 	for (i = 0; i < npages; i++) {
 		ret = migrate_page_vram_to_ram(vma, addr, migrate_vma.src[i],
 							migrate_vma.dst + i);
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 50380f5173ca..960eec38aee5 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -21,6 +21,7 @@
 #include "xe_guc_exec_queue_types.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
+#include "xe_svm.h"
 
 DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
@@ -601,6 +602,35 @@ DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
 
 );
 
+DECLARE_EVENT_CLASS(xe_svm_migrate,
+		    TP_PROTO(struct xe_svm_range *range),
+		    TP_ARGS(range),
+
+		    TP_STRUCT__entry(
+			     __field(u64, start)
+			     __field(u64, end)
+			     ),
+
+		    TP_fast_assign(
+			   __entry->start = range->start;
+			   __entry->end = range->end;
+			   ),
+
+		    TP_printk("Migrate svm range [0x%016llx,0x%016llx)",  __entry->start,
+			      __entry->end)
+);
+
+DEFINE_EVENT(xe_svm_migrate, xe_svm_migrate_vram_to_sram,
+		    TP_PROTO(struct xe_svm_range *range),
+		    TP_ARGS(range)
+);
+
+
+DEFINE_EVENT(xe_svm_migrate, xe_svm_migrate_sram_to_vram,
+		    TP_PROTO(struct xe_svm_range *range),
+		    TP_ARGS(range)
+);
+
 DECLARE_EVENT_CLASS(xe_buddy_block,
                TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),
                TP_ARGS(block, size, pfn),
-- 
2.26.3

