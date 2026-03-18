Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C78FCD0BE
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B5410E2E9;
	Wed, 18 Mar 2026 07:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MItncXyD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DDD10E2E9
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773817828; x=1805353828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wdYn2IxWDaa1zioTkt5pD7wPRZOIBJCFZILap8WZl2c=;
 b=MItncXyDPPYg/+7vzSPlFp3wJylkKww6Z7oBEcHe+MZoWsrczCCzXi82
 QdSWRgq8ZKsSK0/Hsji6WFYb8eidxrgTySSH6jP/A9NawkQMWG7N6aIZb
 Gf7KghmivlulRT26HhbnCQmJK0RX76Tcidb4P/bzk92A+W1qEvEjg+E7H
 vUubUArXB4L3SIWgDsquBdDwLTzLSpURpvtLc+TYc3uw6g5qTGNZKXbaK
 h3FU57+thUXeejf5Kaj/fPlTzo9+Em20HGag+oYtEJgK6r9tEB6BCHgUH
 jiwFIhFsOeCguCLnJSw5C5Ll+c0kzCYh5E3uiI5V/Fg1HAQuNy97TLmkV g==;
X-CSE-ConnectionGUID: OLw8CPGVRHK43oHjR5qGxw==
X-CSE-MsgGUID: q9HHVITtRGuXLzAuUdk+VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78764270"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78764270"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:10:28 -0700
X-CSE-ConnectionGUID: zccDVk26R+qSZ8v8YNIXZA==
X-CSE-MsgGUID: IDt4JTCWQ7a6JAbvSzMlzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260424056"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 00:10:26 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stuart.summers@intel.com, arvind.yadav@intel.com, tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 09/15] drm/xe/trace: Add xe_vma_acc trace event for access
 counter notifications
Date: Wed, 18 Mar 2026 13:14:50 +0530
Message-Id: <20260318074456.2839499-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
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

Trace VMA access counter notifications with asid, address range, and
counter type (TRIGGER or NOTIFY) to aid debugging of migration hints.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_access_counter.c |  7 ++++--
 drivers/gpu/drm/xe/xe_trace_bo.h       | 32 +++++++++++++++++++++++---
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
index 9eb9917d8da7..f93618faab02 100644
--- a/drivers/gpu/drm/xe/xe_access_counter.c
+++ b/drivers/gpu/drm/xe/xe_access_counter.c
@@ -13,6 +13,7 @@
 #include "xe_device.h"
 #include "xe_gt_printk.h"
 #include "xe_hw_engine.h"
+#include "xe_trace_bo.h"
 #include "xe_usm_queue.h"
 #include "xe_vm.h"
 
@@ -109,6 +110,8 @@ static int xe_access_counter_service(struct xe_access_counter *ac)
 		goto unlock_vm;
 	}
 
+	trace_xe_vma_acc(vma, ac->consumer.counter_type);
+
 	/* TODO: Handle svm vma's  */
 	if (xe_vma_has_no_bo(vma))
 		goto unlock_vm;
@@ -153,7 +156,7 @@ static void xe_access_counter_queue_work_func(struct work_struct *w)
 #define USM_QUEUE_MAX_RUNTIME_MS	20
 	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
 
-	while (xe_usm_queue_pop(ac_queue, &ac, xe_access_counter_entry_size())) {
+	while (xe_usm_queue_pop(ac_queue, &ac, sizeof(struct xe_access_counter))) {
 		int err;
 
 		if (!ac.gt)	/* Access counter squashed during reset */
@@ -239,7 +242,7 @@ int xe_access_counter_handler(struct xe_device *xe, struct xe_access_counter *ac
 	spin_lock_irqsave(&ac_queue->lock, flags);
 	full = xe_usm_queue_full(ac_queue, sizeof(struct xe_access_counter));
 	if (!full) {
-		xe_usm_queue_push(ac_queue, ac, xe_access_counter_entry_size());
+		xe_usm_queue_push(ac_queue, ac, sizeof(struct xe_access_counter));
 		queue_work(xe->usm.pf_wq, &ac_queue->worker);
 	} else {
 		drm_warn(&xe->drm,
diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 86323cf3be2c..eae5a5d0dbdc 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -12,6 +12,7 @@
 #include <linux/tracepoint.h>
 #include <linux/types.h>
 
+#include "xe_access_counter_types.h"
 #include "xe_bo.h"
 #include "xe_bo_types.h"
 #include "xe_vm.h"
@@ -125,9 +126,34 @@ DEFINE_EVENT(xe_vma, xe_vma_pagefault,
 	     TP_ARGS(vma)
 );
 
-DEFINE_EVENT(xe_vma, xe_vma_acc,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
+TRACE_EVENT(xe_vma_acc,
+	    TP_PROTO(struct xe_vma *vma, u8 counter_type),
+	    TP_ARGS(vma, counter_type),
+
+	    TP_STRUCT__entry(
+		     __string(dev, __dev_name_vma(vma))
+		     __field(struct xe_vma *, vma)
+		     __field(struct xe_vm *, vm)
+		     __field(u32, asid)
+		     __field(u64, start)
+		     __field(u64, end)
+		     __field(u8, counter_type)
+		     ),
+
+	    TP_fast_assign(
+		   __assign_str(dev);
+		   __entry->vma = vma;
+		   __entry->vm = xe_vma_vm(vma);
+		   __entry->asid = xe_vma_vm(vma)->usm.asid;
+		   __entry->start = xe_vma_start(vma);
+		   __entry->end = xe_vma_end(vma) - 1;
+		   __entry->counter_type = counter_type;
+		   ),
+
+	    TP_printk("dev=%s, vma=%p, vm=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, type=%s",
+		      __get_str(dev), __entry->vma, __entry->vm,
+		      __entry->asid, __entry->start, __entry->end,
+		      __entry->counter_type == XE_ACCESS_COUNTER_TYPE_NOTIFY ? "NOTIFY" : "TRIGGER")
 );
 
 DEFINE_EVENT(xe_vma, xe_vma_bind,
-- 
2.34.1

