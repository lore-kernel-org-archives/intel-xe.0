Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85CAD172CC
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 05:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E25D10E228;
	Mon,  2 Feb 2026 05:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POMD6/lT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B54610E228
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 05:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770009266; x=1801545266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gpMmtHPt3gYAkjoPmGEtAYTNIr5JXvREdfe4Et/Lxnw=;
 b=POMD6/lTVcnsLHuVblXfKNaTCBTjb0fIEFJvdex539juIdF3cqYkbGa9
 2Q1GSQyeiTquH8UawUmRT0AZscLFFZeX4xEr53ubsP8wbNdBroFzsBaeX
 6f9xb7BgczqbCx5eAF6Jb94V9kY5VUk7eMuf7VpA7GsIvqNB9HLG4tfaO
 EF5kvGqnlsg3uDD5NxLNvQZmoWv8tzzLzNyOJo34qzaWEKeDdpc1w1/IR
 Ha9sr02TpASqf9fH0x1zXQ3912t8r9W287ejw4lnyWX39fg+2Ot6ToIz7
 WkgZ09p+WWZK9jaGvnucNBfrKboMSukV1jhkulWdeg0KYrld6PYkgWehJ g==;
X-CSE-ConnectionGUID: liaRxMXOQ9C7xYOvDRf7TQ==
X-CSE-MsgGUID: mFqc0y+zQMuuD23ZWnTZAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="58745192"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="58745192"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 21:14:26 -0800
X-CSE-ConnectionGUID: F34OkQZvRyiBBfKWAygbEA==
X-CSE-MsgGUID: 8nc/nhhZS7uFCK/RIHLU5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="213953068"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 21:14:24 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.d.roper@intel.com,
 himal.prasad.ghimiray@intel.com, priyanka.dandamudi@intel.com
Subject: [PATCH v3 2/2] drm/xe: Add prefetch fault support for Xe3p
Date: Mon,  2 Feb 2026 10:44:04 +0530
Message-ID: <20260202051404.835714-3-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202051404.835714-1-varun.gupta@intel.com>
References: <20260202051404.835714-1-varun.gupta@intel.com>
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

Extract the prefetch bit from the fault descriptor. When page fault
handling fails, echo the prefetch bit in the response (bit 6) to allow
the HW to suppress CAT errors for unsuccessful prefetch faults. On
successful handling, clear the prefetch bit so it's not echoed.

For failed prefetch faults, increment a stats counter and print a
single-line error message with the prefetch bit value to reduce
excessive logging.

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
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  2 ++
 drivers/gpu/drm/xe/xe_pagefault.c       | 16 +++++++++++++---
 drivers/gpu/drm/xe/xe_pagefault_types.h |  8 +++++++-
 4 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index a33ea288b907..1a8674daa26e 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -261,7 +261,8 @@ struct xe_guc_pagefault_desc {
 #define PFD_ACCESS_TYPE		GENMASK(1, 0)
 #define PFD_FAULT_TYPE		GENMASK(3, 2)
 #define PFD_VFID		GENMASK(9, 4)
-#define PFD_RSVD_1		GENMASK(11, 10)
+#define PFD_RSVD_1		BIT(10)
+#define PFD_PREFETCH		BIT(11)	/* Only valid on Xe3+, reserved on prior platforms */
 #define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
 #define PFD_VIRTUAL_ADDR_LO_SHIFT 12
 
@@ -281,7 +282,7 @@ struct xe_guc_pagefault_reply {
 
 	u32 dw1;
 #define PFR_VFID		GENMASK(5, 0)
-#define PFR_RSVD_1		BIT(6)
+#define PFR_PREFETCH		BIT(6)	/* Only valid on Xe3+, reserved on prior platforms */
 #define PFR_ENG_INSTANCE	GENMASK(12, 7)
 #define PFR_ENG_CLASS		GENMASK(15, 13)
 #define PFR_PDATA		GENMASK(31, 16)
diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 719a18187a31..ca7f769848a9 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -27,6 +27,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
 		FIELD_PREP(PFR_ASID, pf->consumer.asid),
 
 		FIELD_PREP(PFR_VFID, vfid) |
+		FIELD_PREP(PFR_PREFETCH, pf->consumer.prefetch) |
 		FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
 		FIELD_PREP(PFR_ENG_CLASS, engine_class) |
 		FIELD_PREP(PFR_PDATA, pdata),
@@ -77,6 +78,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
 	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
 	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
+	pf.consumer.prefetch = FIELD_GET(PFD_PREFETCH, msg[2]);
 	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
 		pf.consumer.fault_level = XE_PAGEFAULT_LEVEL_NACK;
 	else
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 6bee53d6ffc3..733d4ad28914 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -259,9 +259,19 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 
 		err = xe_pagefault_service(&pf);
 		if (err) {
-			xe_pagefault_print(&pf);
-			xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
-				   ERR_PTR(err));
+			if (!pf.consumer.prefetch) {
+				xe_pagefault_print(&pf);
+			} else {
+				xe_gt_stats_incr(pf.gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
+			}
+			xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe, prefetch=%d\n",
+				   ERR_PTR(err), pf.consumer.prefetch);
+		} else {
+			/*
+			 * Clear prefetch bit - only needed to suppress CAT errors
+			 * on unsuccessful handling.
+			 */
+			pf.consumer.prefetch = 0;
 		}
 
 		pf.producer.ops->ack_fault(&pf, err);
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index d3b516407d60..9e38d6e2dac5 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -84,8 +84,14 @@ struct xe_pagefault {
 		u8 engine_class;
 		/** @consumer.engine_instance: engine instance */
 		u8 engine_instance;
+		/**
+		 * @consumer.prefetch: fault is caused by HW prefetch.
+		 * Echo in response to suppress CAT errors on
+		 * unsuccessful handling.
+		 */
+		u8 prefetch;
 		/** consumer.reserved: reserved bits for future expansion */
-		u8 reserved[7];
+		u8 reserved[6];
 	} consumer;
 	/**
 	 * @producer: State for the producer (i.e., HW/FW interface). Populated
-- 
2.43.0

