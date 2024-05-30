Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61985C27C43
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 15:14:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144C210E8DB;
	Thu, 30 May 2024 15:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ienuxsLW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27FA10E8DB
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 15:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717082087; x=1748618087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jqpq4cAHTrGStqFsqVY/epcUeO1hhsV5duAHnk+7TmI=;
 b=ienuxsLWNQ3RivBH1beeQTrtK/peKbKCMpKRsL/8HBcbmBsXp8UOapkr
 dnDUqhjieWTxlhhfzAKuu651TpKfK76oN7hSoeivETjWZvXV9kNyG0BsS
 n1le0gn6rtNcYdWN3mdCMqLz9/wkvx2ATu+AZYzGOhw52VkS7pGo4OcmK
 3NE8rotuSk4o08nxNHes55EbMAi4HjXdhbtmUIgmLGAXc9yeFD2TVXamM
 ME0yaszAGF+FJkL3muU5trtjqeYg3zB8M7tMYyH5mPwtkDCdeo/J1zQiK
 CnA4KdyS23bYVMg4620r/WM2zE+ZZgrg0ijVAnCyVe4dK+xMLOIO5ON9e A==;
X-CSE-ConnectionGUID: TXtJ3aiTRg+r+8/lXycxwA==
X-CSE-MsgGUID: k4pEEPbNRMqrJNOnaX0TNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24695861"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24695861"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:14:41 -0700
X-CSE-ConnectionGUID: Vh37OBlxSlqBo7QLhzRduQ==
X-CSE-MsgGUID: JbLWxeeBRZmhndUDtjAyMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="36326443"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:14:41 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v3 3/6] drm/xe/trace: Print device_id in xe_trace_bo events
Date: Thu, 30 May 2024 08:13:10 -0700
Message-Id: <20240530151313.2284182-4-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
References: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
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

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/xe/xe_trace_bo.h | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 6d90f3f42d54..88204d4988fd 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -24,16 +24,20 @@ DECLARE_EVENT_CLASS(xe_bo,
 			     __field(size_t, size)
 			     __field(u32, flags)
 			     __field(struct xe_vm *, vm)
+			     __array(char, device_id, 12)
 			     ),
 
 		    TP_fast_assign(
 			   __entry->size = bo->size;
 			   __entry->flags = bo->flags;
 			   __entry->vm = bo->vm;
+			   strscpy(__entry->device_id,
+				   dev_name(xe_bo_device(bo)->drm.dev), 12);
 			   ),
 
-		    TP_printk("size=%zu, flags=0x%02x, vm=%p",
-			      __entry->size, __entry->flags, __entry->vm)
+		    TP_printk("dev: %s: size=%zu, flags=0x%02x, vm=%p",
+			      __entry->device_id, __entry->size,
+			      __entry->flags, __entry->vm)
 );
 
 DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
@@ -78,6 +82,7 @@ DECLARE_EVENT_CLASS(xe_vma,
 			     __field(u64, start)
 			     __field(u64, end)
 			     __field(u64, ptr)
+			     __array(char, device_id, 12)
 			     ),
 
 		    TP_fast_assign(
@@ -86,10 +91,11 @@ DECLARE_EVENT_CLASS(xe_vma,
 			   __entry->start = xe_vma_start(vma);
 			   __entry->end = xe_vma_end(vma) - 1;
 			   __entry->ptr = xe_vma_userptr(vma);
+			   strscpy(__entry->device_id, dev_name(xe_vma_vm(vma)->xe->drm.dev), 12);
 			   ),
 
-		    TP_printk("vma=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, userptr=0x%012llx,",
-			      __entry->vma, __entry->asid, __entry->start,
+		    TP_printk("dev: %s: vma=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, userptr=0x%012llx,",
+			      __entry->device_id, __entry->vma, __entry->asid, __entry->start,
 			      __entry->end, __entry->ptr)
 )
 
@@ -175,15 +181,17 @@ DECLARE_EVENT_CLASS(xe_vm,
 		    TP_STRUCT__entry(
 			     __field(struct xe_vm *, vm)
 			     __field(u32, asid)
+			     __array(char, device_id, 12)
 			     ),
 
 		    TP_fast_assign(
 			   __entry->vm = vm;
 			   __entry->asid = vm->usm.asid;
+			   strscpy(__entry->device_id, dev_name(vm->xe->drm.dev), 12);
 			   ),
 
-		    TP_printk("vm=%p, asid=0x%05x",  __entry->vm,
-			      __entry->asid)
+		    TP_printk("dev: %s: vm=%p, asid=0x%05x", __entry->device_id,
+			      __entry->vm,  __entry->asid)
 );
 
 DEFINE_EVENT(xe_vm, xe_vm_kill,
-- 
2.34.1

