Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B68C021A0
	for <intel-xe@archiver.kernel.org>; Sun,  9 Feb 2025 12:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C447510E2FF;
	Sun,  9 Feb 2025 12:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="deRXHqyU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B75410E2D2
 for <intel-xe@lists.freedesktop.org>; Sun,  9 Feb 2025 12:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739103155; x=1770639155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DaDxfvYms86ukSb1CPZrF+zyMWtf3KdBn5VipKZXW3c=;
 b=deRXHqyU/ii5GGRLhbVzsMvzGLAp1XOlLgIG2bPQzurC4fkin7aBICuD
 U07gNcliSafs9tfsEuRb2M6CxGI4KWXCWxzdulKu5ImlaQfcPO+EQaYfL
 VNhtaIaTbMWikbQYBXXDdunx/n+aWC5XExdbtFwWJzJrKCwY+/48vzjS0
 XtkbszJfnRw4N42x7Oz28rzI4sJWXKd/lYQpUd0X0v/ePcv1z21QVwDMT
 Q9LMgmqt/pDt6rNIu7bIuqJnqClIC7r5Bz4JHVfK/mIC4fAwC7HLSzsKj
 i/9UK7sIM9DHZnB332xAebOkGMpZChVXILfolwXBvqLa6HB6yk1OI8jSy w==;
X-CSE-ConnectionGUID: Py/HiFUeTc26ldROlprw5w==
X-CSE-MsgGUID: WVpXstkCRGuLlyrKVghBNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50320488"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; d="scan'208";a="50320488"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 04:12:35 -0800
X-CSE-ConnectionGUID: 5LqrChGMTgG8B/0uhTSVLw==
X-CSE-MsgGUID: NTsfExxCTeaPmvjNTNL2Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135194968"
Received: from intelmailrelay-01.habana-labs.com ([10.111.11.20])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 04:12:33 -0800
Received: internal info suppressed
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 519CCPQq1604475
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sun, 9 Feb 2025 14:12:25 +0200
Received: (from dhirschfeld@localhost)
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id
 519CCPTm1604474; Sun, 9 Feb 2025 14:12:25 +0200
From: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
Subject: [PATCH 1/2] drm/xe: move page fault descriptors to uc types file
Date: Sun,  9 Feb 2025 14:12:16 +0200
Message-Id: <20250209121217.1604458-1-dafna.hirschfeld@intel.com>
X-Mailer: git-send-email 2.34.1
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

Future asic will have different firmware to handle page faults.
Meanwhile future asic will have the same pf descriptor as guc
so we should move the descriptors to xe_uc_fw_types.c

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 14 ++---
 drivers/gpu/drm/xe/xe_guc_fwif.h     | 82 ---------------------------
 drivers/gpu/drm/xe/xe_uc_fw_types.h  | 83 ++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index d331a8d02975..7a103e7cd3d0 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -251,7 +251,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 }
 
 static int send_pagefault_reply(struct xe_guc *guc,
-				struct xe_guc_pagefault_reply *reply)
+				struct xe_uc_pagefault_reply *reply)
 {
 	u32 action[] = {
 		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
@@ -284,12 +284,12 @@ static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
 
 static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
 {
-	const struct xe_guc_pagefault_desc *desc;
+	const struct xe_uc_pagefault_desc *desc;
 	bool ret = false;
 
 	spin_lock_irq(&pf_queue->lock);
 	if (pf_queue->tail != pf_queue->head) {
-		desc = (const struct xe_guc_pagefault_desc *)
+		desc = (const struct xe_uc_pagefault_desc *)
 			(pf_queue->data + pf_queue->tail);
 
 		pf->fault_level = FIELD_GET(PFD_FAULT_LEVEL, desc->dw0);
@@ -369,7 +369,7 @@ static void pf_queue_work_func(struct work_struct *w)
 	struct pf_queue *pf_queue = container_of(w, struct pf_queue, worker);
 	struct xe_gt *gt = pf_queue->gt;
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_guc_pagefault_reply reply = {};
+	struct xe_uc_pagefault_reply reply = {};
 	struct pagefault pf = {};
 	unsigned long threshold;
 	int ret;
@@ -395,7 +395,7 @@ static void pf_queue_work_func(struct work_struct *w)
 
 		reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
 			FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
-			FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
+			FIELD_PREP(PFR_REPLY, PFR_TYPE_ACCESS) |
 			FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
 			FIELD_PREP(PFR_ASID, pf.asid);
 
@@ -617,12 +617,12 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 
 static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
 {
-	const struct xe_guc_acc_desc *desc;
+	const struct xe_uc_acc_desc *desc;
 	bool ret = false;
 
 	spin_lock(&acc_queue->lock);
 	if (acc_queue->tail != acc_queue->head) {
-		desc = (const struct xe_guc_acc_desc *)
+		desc = (const struct xe_uc_acc_desc *)
 			(acc_queue->data + acc_queue->tail);
 
 		acc->granularity = FIELD_GET(ACC_GRANULARITY, desc->dw2);
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index f4ec8428ef64..0678375e8ced 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -266,91 +266,9 @@ struct guc_um_init_params {
 	struct guc_um_queue_params queue_params[GUC_UM_HW_QUEUE_MAX];
 } __packed;
 
-enum xe_guc_fault_reply_type {
-	PFR_ACCESS = 0,
-	PFR_ENGINE,
-	PFR_VFID,
-	PFR_ALL,
-	PFR_INVALID
-};
-
 enum xe_guc_response_desc_type {
 	TLB_INVALIDATION_DESC = 0,
 	FAULT_RESPONSE_DESC
 };
 
-struct xe_guc_pagefault_desc {
-	u32 dw0;
-#define PFD_FAULT_LEVEL		GENMASK(2, 0)
-#define PFD_SRC_ID		GENMASK(10, 3)
-#define PFD_RSVD_0		GENMASK(17, 11)
-#define XE2_PFD_TRVA_FAULT	BIT(18)
-#define PFD_ENG_INSTANCE	GENMASK(24, 19)
-#define PFD_ENG_CLASS		GENMASK(27, 25)
-#define PFD_PDATA_LO		GENMASK(31, 28)
-
-	u32 dw1;
-#define PFD_PDATA_HI		GENMASK(11, 0)
-#define PFD_PDATA_HI_SHIFT	4
-#define PFD_ASID		GENMASK(31, 12)
-
-	u32 dw2;
-#define PFD_ACCESS_TYPE		GENMASK(1, 0)
-#define PFD_FAULT_TYPE		GENMASK(3, 2)
-#define PFD_VFID		GENMASK(9, 4)
-#define PFD_RSVD_1		BIT(10)
-#define XE3P_PFD_PREFETCH	BIT(11)
-#define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
-#define PFD_VIRTUAL_ADDR_LO_SHIFT 12
-
-	u32 dw3;
-#define PFD_VIRTUAL_ADDR_HI	GENMASK(31, 0)
-#define PFD_VIRTUAL_ADDR_HI_SHIFT 32
-} __packed;
-
-struct xe_guc_pagefault_reply {
-	u32 dw0;
-#define PFR_VALID		BIT(0)
-#define PFR_SUCCESS		BIT(1)
-#define PFR_REPLY		GENMASK(4, 2)
-#define PFR_RSVD_0		GENMASK(9, 5)
-#define PFR_DESC_TYPE		GENMASK(11, 10)
-#define PFR_ASID		GENMASK(31, 12)
-
-	u32 dw1;
-#define PFR_VFID		GENMASK(5, 0)
-#define XE3P_PFR_PREFETCH	BIT(6)
-#define PFR_ENG_INSTANCE	GENMASK(12, 7)
-#define PFR_ENG_CLASS		GENMASK(15, 13)
-#define PFR_PDATA		GENMASK(31, 16)
-
-	u32 dw2;
-#define PFR_RSVD_2		GENMASK(31, 0)
-} __packed;
-
-struct xe_guc_acc_desc {
-	u32 dw0;
-#define ACC_TYPE	BIT(0)
-#define ACC_TRIGGER	0
-#define ACC_NOTIFY	1
-#define ACC_SUBG_LO	GENMASK(31, 1)
-
-	u32 dw1;
-#define ACC_SUBG_HI	BIT(0)
-#define ACC_RSVD0	GENMASK(2, 1)
-#define ACC_ENG_INSTANCE	GENMASK(8, 3)
-#define ACC_ENG_CLASS	GENMASK(11, 9)
-#define ACC_ASID	GENMASK(31, 12)
-
-	u32 dw2;
-#define ACC_VFID	GENMASK(5, 0)
-#define ACC_RSVD1	GENMASK(7, 6)
-#define ACC_GRANULARITY	GENMASK(10, 8)
-#define ACC_RSVD2	GENMASK(16, 11)
-#define ACC_VIRTUAL_ADDR_RANGE_LO	GENMASK(31, 17)
-
-	u32 dw3;
-#define ACC_VIRTUAL_ADDR_RANGE_HI	GENMASK(31, 0)
-} __packed;
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index 90a451d03518..0755d0b61227 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -81,6 +81,89 @@ enum xe_uc_fw_version_types {
 	XE_UC_FW_VER_TYPE_COUNT
 };
 
+/* currently only guc uses this */
+struct xe_uc_pagefault_reply {
+	u32 dw0;
+#define PFR_VALID		BIT(0)
+#define PFR_SUCCESS		BIT(1)
+#define PFR_REPLY		GENMASK(4, 2)
+#define PFR_RSVD_0		GENMASK(9, 5)
+#define PFR_DESC_TYPE		GENMASK(11, 10)
+#define PFR_ASID		GENMASK(31, 12)
+
+	u32 dw1;
+#define PFR_VFID		GENMASK(5, 0)
+#define XE3P_PFR_PREFETCH	BIT(6)
+#define PFR_ENG_INSTANCE	GENMASK(12, 7)
+#define PFR_ENG_CLASS		GENMASK(15, 13)
+#define PFR_PDATA		GENMASK(31, 16)
+
+	u32 dw2;
+#define PFR_RSVD_2		GENMASK(31, 0)
+} __packed;
+
+struct xe_uc_pagefault_desc {
+	u32 dw0;
+#define PFD_FAULT_LEVEL		GENMASK(2, 0)
+#define PFD_SRC_ID		GENMASK(10, 3)
+#define PFD_RSVD_0		GENMASK(17, 11)
+#define XE2_PFD_TRVA_FAULT	BIT(18)
+#define PFD_ENG_INSTANCE	GENMASK(24, 19)
+#define PFD_ENG_CLASS		GENMASK(27, 25)
+#define PFD_PDATA_LO		GENMASK(31, 28)
+
+	u32 dw1;
+#define PFD_PDATA_HI		GENMASK(11, 0)
+#define PFD_PDATA_HI_SHIFT	4
+#define PFD_ASID		GENMASK(31, 12)
+
+	u32 dw2;
+#define PFD_ACCESS_TYPE		GENMASK(1, 0)
+#define PFD_FAULT_TYPE		GENMASK(3, 2)
+#define PFD_VFID		GENMASK(9, 4)
+#define PFD_RSVD_1		BIT(10)
+#define XE3P_PFD_PREFETCH	BIT(11)
+#define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
+#define PFD_VIRTUAL_ADDR_LO_SHIFT 12
+
+	u32 dw3;
+#define PFD_VIRTUAL_ADDR_HI	GENMASK(31, 0)
+#define PFD_VIRTUAL_ADDR_HI_SHIFT 32
+} __packed;
+
+struct xe_uc_acc_desc {
+	u32 dw0;
+#define ACC_TYPE	BIT(0)
+#define ACC_TRIGGER	0
+#define ACC_NOTIFY	1
+#define ACC_SUBG_LO	GENMASK(31, 1)
+
+	u32 dw1;
+#define ACC_SUBG_HI	BIT(0)
+#define ACC_RSVD0	GENMASK(2, 1)
+#define ACC_ENG_INSTANCE	GENMASK(8, 3)
+#define ACC_ENG_CLASS	GENMASK(11, 9)
+#define ACC_ASID	GENMASK(31, 12)
+
+	u32 dw2;
+#define ACC_VFID	GENMASK(5, 0)
+#define ACC_RSVD1	GENMASK(7, 6)
+#define ACC_GRANULARITY	GENMASK(10, 8)
+#define ACC_RSVD2	GENMASK(16, 11)
+#define ACC_VIRTUAL_ADDR_RANGE_LO	GENMASK(31, 17)
+
+	u32 dw3;
+#define ACC_VIRTUAL_ADDR_RANGE_HI	GENMASK(31, 0)
+} __packed;
+
+enum xe_uc_fault_reply_type {
+	PFR_TYPE_ACCESS = 0,
+	PFR_TYPE_ENGINE,
+	PFR_TYPE_VFID,
+	PFR_TYPE_ALL,
+	PFR_TYPE_INVALID
+};
+
 /**
  * struct xe_uc_fw - XE micro controller firmware
  */
-- 
2.34.1

