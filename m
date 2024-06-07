Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1665DC27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 18:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD27C10E1D3;
	Fri,  7 Jun 2024 18:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="np55LeMC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E11010E1D3
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 18:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717785068; x=1749321068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6wtsB2Dk55insGNrgKATIjb7DkMYwWBVthKIHjb/sDM=;
 b=np55LeMCtzr/ttcNMFdrgdtzmfJzFUxDNmrZp2NaErKulaotFG5f2t77
 owk/Vf4Pxf/uWjgrWnWucVuI6VV/bSlJLh41in/TQYOvsPSk2hGrQ9BBQ
 U48Y+i7SP6ZfA7JPg3e90o1nF5Okgz+DW2XKpguXFbAAIDt6Q0Mml61q1
 P9krxeAxRe64ofRKgd+Pxmic6QqYMPJ5FMuB+mrU7fL7MZSwyAl1xevcI
 FE0A2COAupvYEcHQsXUdYbiZ4pqni3OfUoVq+rfIJl/sPO5d1v8oGP8Yg
 yJoGqms20VF4RpOuRLLzt0rC4ttR+QlH93cFCBUBNjnuPPOkFpkBAyCN1 Q==;
X-CSE-ConnectionGUID: vkSFZh9jSUCW675RHInd6g==
X-CSE-MsgGUID: FlMrV7d0RamIokUvEPzbhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18314398"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="18314398"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 11:31:08 -0700
X-CSE-ConnectionGUID: 0udWE4ubSym8y/qWnfkfcA==
X-CSE-MsgGUID: rl+ETxgIRViHOLlTZsSErA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="43342154"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 11:31:08 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v6 3/6] drm/xe/trace: Print device_id in xe_trace_bo events
Date: Fri,  7 Jun 2024 11:29:40 -0700
Message-Id: <20240607182943.3572524-4-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607182943.3572524-1-radhakrishna.sripada@intel.com>
References: <20240607182943.3572524-1-radhakrishna.sripada@intel.com>
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
v4: Minor cleanups(Gustavo)

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/xe/xe_trace_bo.h | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index c8bd746d9d41..f39f09ed3495 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -16,24 +16,31 @@
 #include "xe_bo_types.h"
 #include "xe_vm.h"
 
+#define __dev_name_bo(bo)	dev_name(xe_bo_device(bo)->drm.dev)
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
@@ -50,7 +57,7 @@ TRACE_EVENT(xe_bo_move,
 		     __field(size_t, size)
 		     __field(u32, new_placement)
 		     __field(u32, old_placement)
-		     __array(char, device_id, 12)
+		     __string(device_id, __dev_name_bo(bo))
 		     __field(bool, move_lacks_source)
 			),
 
@@ -59,13 +66,13 @@ TRACE_EVENT(xe_bo_move,
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
@@ -73,6 +80,7 @@ DECLARE_EVENT_CLASS(xe_vma,
 		    TP_ARGS(vma),
 
 		    TP_STRUCT__entry(
+			     __string(dev, __dev_name_vma(vma))
 			     __field(struct xe_vma *, vma)
 			     __field(u32, asid)
 			     __field(u64, start)
@@ -81,6 +89,7 @@ DECLARE_EVENT_CLASS(xe_vma,
 			     ),
 
 		    TP_fast_assign(
+			   __assign_str(dev);
 			   __entry->vma = vma;
 			   __entry->asid = xe_vma_vm(vma)->usm.asid;
 			   __entry->start = xe_vma_start(vma);
@@ -88,8 +97,8 @@ DECLARE_EVENT_CLASS(xe_vma,
 			   __entry->ptr = xe_vma_userptr(vma);
 			   ),
 
-		    TP_printk("vma=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, userptr=0x%012llx,",
-			      __entry->vma, __entry->asid, __entry->start,
+		    TP_printk("dev=%s, vma=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, userptr=0x%012llx,",
+			      __get_str(dev), __entry->vma, __entry->asid, __entry->start,
 			      __entry->end, __entry->ptr)
 )
 
@@ -173,17 +182,19 @@ DECLARE_EVENT_CLASS(xe_vm,
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

