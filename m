Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F157FC624D6
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 04:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8745F10E210;
	Mon, 23 Feb 2026 04:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjWctT5F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A163510E20F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 04:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771819686; x=1803355686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tHkfe/E9Kp08H/hAFhXkfeosLDUxjx7Mitr4uQ3EIeg=;
 b=QjWctT5Fq/gNSouHLFZboVzeOVx5vZfS05xzZncfwJGfPU94lJnBsAFp
 OH4xTBBRhL6bv5WYOBlf31xrcsjqgxIsf1UkqF+iSXdA0dkW4HfKm30Tq
 XOsUWmN9SOxgc+QijhTe18qkw64XYpI+MtKJ6aMIlItkFfUEazPWdSVGY
 07vMv04BDF+1fBnne+/S5EKjVrgRcSpup27E+WlUOuuJb3sb59P4oJ1m/
 RJpsyvKpnjUJlPvFAVuEZYKbuWhzteNtsC4yW7X9KP2CyFj2lYSz+lQJM
 /2eNYgrlpHhAYT6+u168+j9nDndhU/5NqBJqGjq/6sC73DLmDjgiGUoge g==;
X-CSE-ConnectionGUID: Zf9FrNyDQ3i+Rj9E4zuPPQ==
X-CSE-MsgGUID: LGRq/jY3SYaGTV0yxUAOLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72515902"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72515902"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:08:06 -0800
X-CSE-ConnectionGUID: VxMY98zWQ/+lhoCORdQXnQ==
X-CSE-MsgGUID: AlUhm4L7T4+awJHNgauXPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="246032029"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:08:04 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.d.roper@intel.com,
 himal.prasad.ghimiray@intel.com, priyanka.dandamudi@intel.com,
 stuart.summers@intel.com
Subject: [PATCH v5 2/2] drm/xe: Add prefetch fault support for Xe3p
Date: Mon, 23 Feb 2026 09:37:29 +0530
Message-ID: <20260223040729.1157739-3-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223040729.1157739-1-varun.gupta@intel.com>
References: <20260223040729.1157739-1-varun.gupta@intel.com>
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

Xe3p hardware prefetches memory ranges and notifies software via an
additional bit (bit 11) in the page fault descriptor that the fault
was caused by prefetch.

Extract the prefetch bit from the fault descriptor and echo it in the
response (bit 6) only when the page fault handling fails. This allows
the HW to suppress CAT errors for unsuccessful prefetch faults.

For prefetch faults that fail, increment stats counter without verbose
logging to avoid spamming the log. The prefetch flag is packed into
BIT(7) of the access_type field to avoid growing the consumer struct.

Based on original patches by Brian Welty <brian.welty@intel.com> and
Priyanka Dandamudi <priyanka.dandamudi@intel.com>.

Bspec: 59311
Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Varun Gupta <varun.gupta@intel.com>

---
v5:
 - Read prefetch from producer msg in guc_ack_fault, not consumer field (Matt Brost)
 - Pack prefetch flag into BIT(7) of access_type instead of separate u8 field (Matt Brost)

v4:
 - Downgrade prefetch error log to xe_gt_dbg to avoid spam (Matt Brost/ Stuart)

v3:
 - Drop the rename patch, keep xe_pagefault_print() unchanged (Matt Brost)
 - Move prefetch check to caller instead of inside print function (Matt Brost)
 - Remove XE3P_ prefix from prefetch bit defines and add platform comment (Matt Brost)
 - Show prefetch bit in error messages for debugging (Matt Brost)
 - Split stats counter into separate patch (Matt Brost)

v2:
 - Changed comment wording from "repairs" to "handling" for clarity (Matt Roper)
---
 drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  6 +++++-
 drivers/gpu/drm/xe/xe_pagefault.c       | 16 +++++++++++-----
 drivers/gpu/drm/xe/xe_pagefault_types.h |  6 ++++--
 4 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index a33ea288b907..bb8f71d38611 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -261,7 +261,8 @@ struct xe_guc_pagefault_desc {
 #define PFD_ACCESS_TYPE		GENMASK(1, 0)
 #define PFD_FAULT_TYPE		GENMASK(3, 2)
 #define PFD_VFID		GENMASK(9, 4)
-#define PFD_RSVD_1		GENMASK(11, 10)
+#define PFD_RSVD_1		BIT(10)
+#define PFD_PREFETCH		BIT(11) /* Only valid on Xe3+, reserved on prior platforms */
 #define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
 #define PFD_VIRTUAL_ADDR_LO_SHIFT 12
 
@@ -281,7 +282,7 @@ struct xe_guc_pagefault_reply {
 
 	u32 dw1;
 #define PFR_VFID		GENMASK(5, 0)
-#define PFR_RSVD_1		BIT(6)
+#define PFR_PREFETCH		BIT(6)  /* Only valid on Xe3+, reserved on prior platforms */
 #define PFR_ENG_INSTANCE	GENMASK(12, 7)
 #define PFR_ENG_CLASS		GENMASK(15, 13)
 #define PFR_PDATA		GENMASK(31, 16)
diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index d48f6ed103bb..607e32392f46 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -8,10 +8,12 @@
 #include "xe_guc_ct.h"
 #include "xe_guc_pagefault.h"
 #include "xe_pagefault.h"
+#include "xe_pagefault_types.h"
 
 static void guc_ack_fault(struct xe_pagefault *pf, int err)
 {
 	u32 vfid = FIELD_GET(PFD_VFID, pf->producer.msg[2]);
+	u32 prefetch = FIELD_GET(PFD_PREFETCH, pf->producer.msg[2]);
 	u32 engine_instance = FIELD_GET(PFD_ENG_INSTANCE, pf->producer.msg[0]);
 	u32 engine_class = FIELD_GET(PFD_ENG_CLASS, pf->producer.msg[0]);
 	u32 pdata = FIELD_GET(PFD_PDATA_LO, pf->producer.msg[0]) |
@@ -28,6 +30,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
 		FIELD_PREP(PFR_ASID, asid),
 
 		FIELD_PREP(PFR_VFID, vfid) |
+		FIELD_PREP(PFR_PREFETCH, err ? prefetch : 0) |
 		FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
 		FIELD_PREP(PFR_ENG_CLASS, engine_class) |
 		FIELD_PREP(PFR_PDATA, pdata),
@@ -76,7 +79,8 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		(FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
 		 PFD_VIRTUAL_ADDR_LO_SHIFT);
 	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
-	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
+	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]) |
+		(FIELD_GET(PFD_PREFETCH, msg[2]) ? XE_PAGEFAULT_ACCESS_PREFETCH : 0);
 	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
 		pf.consumer.fault_type_level = XE_PAGEFAULT_TYPE_LEVEL_NACK;
 	else
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 72f589fd2b64..a9a20c4a6b2b 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -136,7 +136,7 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 static bool
 xe_pagefault_access_is_atomic(enum xe_pagefault_access_type access_type)
 {
-	return access_type == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
+	return (access_type & XE_PAGEFAULT_ACCESS_TYPE_MASK) == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
 }
 
 static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
@@ -235,7 +235,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 		   lower_32_bits(pf->consumer.page_addr),
 		   FIELD_GET(XE_PAGEFAULT_TYPE_MASK,
 			     pf->consumer.fault_type_level),
-		   pf->consumer.access_type,
+		   pf->consumer.access_type & XE_PAGEFAULT_ACCESS_TYPE_MASK,
 		   FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
 			     pf->consumer.fault_type_level),
 		   pf->consumer.engine_class,
@@ -261,9 +261,15 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 
 		err = xe_pagefault_service(&pf);
 		if (err) {
-			xe_pagefault_print(&pf);
-			xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
-				   ERR_PTR(err));
+			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
+				xe_pagefault_print(&pf);
+				xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
+					   ERR_PTR(err));
+			} else {
+				xe_gt_stats_incr(pf.gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
+				xe_gt_dbg(pf.gt, "Prefetch Fault response: Unsuccessful %pe\n",
+					  ERR_PTR(err));
+			}
 		}
 
 		pf.producer.ops->ack_fault(&pf, err);
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index 0e378f41ede6..b3289219b1be 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -68,10 +68,12 @@ struct xe_pagefault {
 		/** @consumer.asid: address space ID */
 		u32 asid;
 		/**
-		 * @consumer.access_type: access type, u8 rather than enum to
-		 * keep size compact
+		 * @consumer.access_type: access type and prefetch flag packed
+		 * into a u8.
 		 */
 		u8 access_type;
+#define XE_PAGEFAULT_ACCESS_TYPE_MASK	GENMASK(1, 0)
+#define XE_PAGEFAULT_ACCESS_PREFETCH	BIT(7)
 		/**
 		 * @consumer.fault_type_level: fault type and level, u8 rather
 		 * than enum to keep size compact
-- 
2.43.0

