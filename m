Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37546C88E42
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D556410F115;
	Wed,  9 Sep 2026 12:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IihrW1NB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E31910F12A
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957725; x=1820493725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g3oUKAqHYaO9UndFKxvQelUJhVEWOav8HS6NiO29HNI=;
 b=IihrW1NBPT4Mz9EVqAcgMF2/v5QWc0p86vC9fSLWZKd/5U0YWRsT7tYk
 Zt12yU54aa5n5An78EMJyL6VuIr/eJ5hsiGUFqRtHoW6E6O3PgbvLaPll
 H1hXvic7KiCzwO/+uWQrY+Rh7OFkMGsk07jwE6aJT/iopWuR3qozTgaOO
 EbMy8kjDhCsCpMtMtkEAQQXxhzO1MH84N/yz0J7vvydjk3aoshaPwocLu
 RuwBVOopOLP1bAP70yPDScbcTAttALy9g7ztJksOA+Av8Oivy9Sd/rsQL
 QnNUGksElVjsgB0v9XDJJlLvOkDUIb+xSdeCfRCiRSzWYiWj85ZzwquxH Q==;
X-CSE-ConnectionGUID: zxRq/7y+T6eKQXjtVLrlKw==
X-CSE-MsgGUID: 54MPL36WRtmDFrVKAIZYkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715545"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715545"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:42:05 -0700
X-CSE-ConnectionGUID: /aXxn8lvQNK6gFBc65uPJg==
X-CSE-MsgGUID: hiLKQs6GQM+YG+K5/GM8zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246615"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:42:03 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 10/21] drm/xe/trace: Add xe_vma_acc trace event for access
 counter notifications
Date: Wed,  9 Sep 2026 18:15:04 +0530
Message-ID: <20260909124457.1610890-33-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
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

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_access_counter.c       |  3 ++
 drivers/gpu/drm/xe/xe_access_counter_types.h |  8 +++++
 drivers/gpu/drm/xe/xe_trace_bo.h             | 32 ++++++++++++++++++--
 3 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
index 60595f93cd74..c386b3585b20 100644
--- a/drivers/gpu/drm/xe/xe_access_counter.c
+++ b/drivers/gpu/drm/xe/xe_access_counter.c
@@ -13,6 +13,7 @@
 #include "xe_device.h"
 #include "xe_gt_printk.h"
 #include "xe_hw_engine.h"
+#include "xe_trace_bo.h"
 #include "xe_usm_queue.h"
 #include "xe_vm.h"
 
@@ -80,6 +81,8 @@ static int xe_access_counter_service(struct xe_access_counter *ac)
 		goto unlock_vm;
 	}
 
+	trace_xe_vma_acc(vma, ac->consumer.counter_type);
+
 	/* TODO: Handle svm vma's  */
 	if (xe_vma_has_no_bo(vma))
 		goto unlock_vm;
diff --git a/drivers/gpu/drm/xe/xe_access_counter_types.h b/drivers/gpu/drm/xe/xe_access_counter_types.h
index 343365776037..deecd25b990a 100644
--- a/drivers/gpu/drm/xe/xe_access_counter_types.h
+++ b/drivers/gpu/drm/xe/xe_access_counter_types.h
@@ -14,6 +14,14 @@ struct xe_device;
 struct xe_gt;
 struct xe_access_counter;
 
+/** enum xe_access_counter_type - Xe access counter type */
+enum xe_access_counter_type {
+	/** @XE_ACCESS_COUNTER_TYPE_TRIGGER */
+	XE_ACCESS_COUNTER_TYPE_TRIGGER		= 0,
+	/** @XE_ACCESS_COUNTER_TYPE_NOTIFY*/
+	XE_ACCESS_COUNTER_TYPE_NOTIFY	= 1,
+};
+
 /**
  * struct xe_access_counter - Xe access counter
  *
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
2.43.0

