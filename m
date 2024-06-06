Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08BBC27C6D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 22:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADC410EB25;
	Thu,  6 Jun 2024 22:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4FAJ5yQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A497B10EB1C
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 22:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717713595; x=1749249595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RBWbSGCJnGHun1tHn3nO5vK+PEzuX5N7xeV/WaZmM3Q=;
 b=W4FAJ5yQtxl4taro87Y0tFgGiO1tQA/LGPvLjVRVUrwUA0qO/kQxPaVe
 ET/rQHEXomoFVC+cP7Dg7lErUyrNzQurVvHHXQwd4TSRy3v9nPWEmpZXY
 se6HAOPYAXqHvreA9PL4xW6HKirDYkJvQeP9ygnpj7tOaa+u+WjjNxWAS
 /K33Dl5QZcTF6z37oSMqi9io9VcVyTpRgZ5oJaeb7FziAXEg2Lo4ANPsh
 aaM7jxJ7xVagysfZ+QYFRnnjZCSncZsoebeoVAg3SfayV5vnIGjoHeLGQ
 jb6REGkmyN+o/h4Qe7RFDqGuCink3i0gxd4lYViaoKrwfvrVs+fDQyWoA Q==;
X-CSE-ConnectionGUID: JcPpL6mxQk6xDXE73CBv6w==
X-CSE-MsgGUID: feeQkAtrSYSFB2lE8HIIig==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="17346519"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="17346519"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 15:39:54 -0700
X-CSE-ConnectionGUID: LapQu2sBQEypjQdbQgsE5w==
X-CSE-MsgGUID: xGME0rcGTM+9XON5jcwD/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="37966764"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 15:39:53 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 3/6] drm/xe/trace: Print device_id in xe_trace_bo events
Date: Thu,  6 Jun 2024 15:38:16 -0700
Message-Id: <20240606223819.3545560-4-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606223819.3545560-1-radhakrishna.sripada@intel.com>
References: <20240606223819.3545560-1-radhakrishna.sripada@intel.com>
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

In multi-gpu environments it is important to know the device
bo/vm belongs to. The tracing information includes the device_id
to indicate the device the event is associated with.

v2: Use variable sized variant to display dev name(Gustavo)
v3: Pass single argument to __assign_str to fix kunit error

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/xe/xe_trace_bo.h | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index c8bd746d9d41..4f45408c3cce 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -9,6 +9,7 @@
 #if !defined(_XE_TRACE_BO_H_) || defined(TRACE_HEADER_MULTI_READ)
 #define _XE_TRACE_BO_H_
 
+#include <linux/string_helpers.h>
 #include <linux/tracepoint.h>
 #include <linux/types.h>
 
@@ -16,24 +17,31 @@
 #include "xe_bo_types.h"
 #include "xe_vm.h"
 
+#define __dev_name_bo(bo)	dev_name(xe_bo_device((bo))->drm.dev)
+#define __dev_name_vm(vm)	dev_name((vm)->xe->drm.dev)
+#define __dev_name_vma(vma)	__dev_name_vm(xe_vma_vm(vma))
+
 DECLARE_EVENT_CLASS(xe_bo,
 		    TP_PROTO(struct xe_bo *bo),
 		    TP_ARGS(bo),
 
 		    TP_STRUCT__entry(
+			     __string(dev, __dev_name_bo(bo))
 			     __field(size_t, size)
 			     __field(u32, flags)
 			     __field(struct xe_vm *, vm)
 			     ),
 
 		    TP_fast_assign(
+			   __assign_str(dev);
 			   __entry->size = bo->size;
 			   __entry->flags = bo->flags;
 			   __entry->vm = bo->vm;
 			   ),
 
-		    TP_printk("size=%zu, flags=0x%02x, vm=%p",
-			      __entry->size, __entry->flags, __entry->vm)
+		    TP_printk("dev=%s, size=%zu, flags=0x%02x, vm=%p",
+			      __get_str(dev), __entry->size,
+			      __entry->flags, __entry->vm)
 );
 
 DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
@@ -50,7 +58,7 @@ TRACE_EVENT(xe_bo_move,
 		     __field(size_t, size)
 		     __field(u32, new_placement)
 		     __field(u32, old_placement)
-		     __array(char, device_id, 12)
+		     __string(device_id, __dev_name_bo(bo))
 		     __field(bool, move_lacks_source)
 			),
 
@@ -59,13 +67,13 @@ TRACE_EVENT(xe_bo_move,
 		   __entry->size = bo->size;
 		   __entry->new_placement = new_placement;
 		   __entry->old_placement = old_placement;
-		   strscpy(__entry->device_id, dev_name(xe_bo_device(__entry->bo)->drm.dev), 12);
+		   __assign_str(device_id);
 		   __entry->move_lacks_source = move_lacks_source;
 		   ),
 	    TP_printk("move_lacks_source:%s, migrate object %p [size %zu] from %s to %s device_id:%s",
 		      __entry->move_lacks_source ? "yes" : "no", __entry->bo, __entry->size,
 		      xe_mem_type_to_name[__entry->old_placement],
-		      xe_mem_type_to_name[__entry->new_placement], __entry->device_id)
+		      xe_mem_type_to_name[__entry->new_placement], __get_str(device_id))
 );
 
 DECLARE_EVENT_CLASS(xe_vma,
@@ -73,6 +81,7 @@ DECLARE_EVENT_CLASS(xe_vma,
 		    TP_ARGS(vma),
 
 		    TP_STRUCT__entry(
+			     __string(dev, __dev_name_vma(vma))
 			     __field(struct xe_vma *, vma)
 			     __field(u32, asid)
 			     __field(u64, start)
@@ -81,6 +90,7 @@ DECLARE_EVENT_CLASS(xe_vma,
 			     ),
 
 		    TP_fast_assign(
+			   __assign_str(dev);
 			   __entry->vma = vma;
 			   __entry->asid = xe_vma_vm(vma)->usm.asid;
 			   __entry->start = xe_vma_start(vma);
@@ -88,8 +98,8 @@ DECLARE_EVENT_CLASS(xe_vma,
 			   __entry->ptr = xe_vma_userptr(vma);
 			   ),
 
-		    TP_printk("vma=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, userptr=0x%012llx,",
-			      __entry->vma, __entry->asid, __entry->start,
+		    TP_printk("dev=%s, vma=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, userptr=0x%012llx,",
+			      __get_str(dev), __entry->vma, __entry->asid, __entry->start,
 			      __entry->end, __entry->ptr)
 )
 
@@ -173,17 +183,19 @@ DECLARE_EVENT_CLASS(xe_vm,
 		    TP_ARGS(vm),
 
 		    TP_STRUCT__entry(
+			     __string(dev, __dev_name_vm(vm))
 			     __field(struct xe_vm *, vm)
 			     __field(u32, asid)
 			     ),
 
 		    TP_fast_assign(
+			   __assign_str(dev);
 			   __entry->vm = vm;
 			   __entry->asid = vm->usm.asid;
 			   ),
 
-		    TP_printk("vm=%p, asid=0x%05x",  __entry->vm,
-			      __entry->asid)
+		    TP_printk("dev=%s, vm=%p, asid=0x%05x", __get_str(dev),
+			      __entry->vm,  __entry->asid)
 );
 
 DEFINE_EVENT(xe_vm, xe_vm_kill,
-- 
2.34.1

