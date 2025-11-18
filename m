Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4540CCD19A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 09:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF4110E45B;
	Tue, 18 Nov 2025 09:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2/mc4Aj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBA110E45B
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 09:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456765; x=1794992765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8LyXuZIekwlTefw39aJFU0tU3F2N5mXxCBZbjmnK/hU=;
 b=Y2/mc4Aj18n+R2rYSavk4fgS5qZzH0wMI4kJek8CBm0KPIGpvZhIpQfq
 jIn0JxBP3zNQ5R7a7y92oeCu4Lmsxg/VWl8Y9Te0SOc/PxtZFAGl/Lkqc
 FqanL6LcNTnkuG7Y9VDkg9YApLSmLSPwxUt5cWGwowTim/ka8Amce9iPx
 J0OwLXJeL4J0Rz/LrPx+LtQKl8950IxOnJCmRW1cBkaG9rp/9lf/slA1a
 Zs6zlCiYm0wH8rmjbeM4igFAdlP21cMOWGAopj9r7cEMd58+wk6lgSBZ0
 Rrum2BpT0YhikbxO737qDndCpKdVPx4gR7kETwXCtpe5pRcLy7SIs8DIq w==;
X-CSE-ConnectionGUID: pbUi6jEFRDmpCYbEdXyROw==
X-CSE-MsgGUID: MutYf3maR++9B7QbQjJygA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="83097768"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="83097768"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:06:04 -0800
X-CSE-ConnectionGUID: pqEQ6Eq9Tci1Aczzlr+uBQ==
X-CSE-MsgGUID: 5KisD0K2SPGztpRmPbdhNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190500854"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa009.jf.intel.com with ESMTP; 18 Nov 2025 01:06:03 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 05/11] drm/xe/guc: Add page reclamation interface to GuC
Date: Tue, 18 Nov 2025 17:05:46 +0800
Message-ID: <20251118090552.246243-6-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118090552.246243-1-brian3.nguyen@intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
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

Add page reclamation related changes to GuC interface, handlers, and
senders to support page reclamation.

Currently TLB invalidations will perform an entire PPC flush in order to
prevent stale memory access for noncoherent system memory. Page
reclamation is an extension of the typical TLB invalidation
workflow, allowing disabling of full PPC flush and enable selective PPC
flushing. Selective flushing will be decided by a list of pages whom's
address is passed to GuC at time of action.

Page reclamation interfaces require at least GuC FW ver 70.31.0.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_ct.c           |  4 ++++
 drivers/gpu/drm/xe/xe_guc_fwif.h         |  1 +
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c    | 14 ++++++++++++++
 4 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 47756e4674a1..11de3bdf69b5 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -151,6 +151,8 @@ enum xe_guc_action {
 	XE_GUC_ACTION_TLB_INVALIDATION = 0x7000,
 	XE_GUC_ACTION_TLB_INVALIDATION_DONE = 0x7001,
 	XE_GUC_ACTION_TLB_INVALIDATION_ALL = 0x7002,
+	XE_GUC_ACTION_PAGE_RECLAMATION = 0x7003,
+	XE_GUC_ACTION_PAGE_RECLAMATION_DONE = 0x7004,
 	XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION = 0x8002,
 	XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
 	XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004,
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 2697d711adb2..e13704e61032 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1311,6 +1311,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
 	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
+	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
 		g2h_release_space(ct, len);
 	}
 
@@ -1546,6 +1547,7 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
 		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
+	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
 		break;
 	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
@@ -1711,6 +1713,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 		switch (action) {
 		case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
 		case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
+		case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
 			break;	/* Process these in fast-path */
 		default:
 			return 0;
@@ -1747,6 +1750,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
 		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
+	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
 		__g2h_release_space(ct, len);
 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index c90dd266e9cf..34d74a71c4f0 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -16,6 +16,7 @@
 #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
 #define G2H_LEN_DW_TLB_INVALIDATE		3
 #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
+#define G2H_LEN_DW_PAGE_RECLAMATION		3
 
 #define GUC_ID_MAX			65535
 #define GUC_ID_UNKNOWN			0xffffffff
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index c05709a5bc98..3185f8dc00c4 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -95,6 +95,20 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 	return -ECANCELED;
 }
 
+static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
+			     u64 gpu_addr)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_PAGE_RECLAMATION,
+		seqno,
+		lower_32_bits(gpu_addr),
+		upper_32_bits(gpu_addr),
+	};
+
+	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
+			      G2H_LEN_DW_PAGE_RECLAMATION, 1);
+}
+
 /*
  * Ensure that roundup_pow_of_two(length) doesn't overflow.
  * Note that roundup_pow_of_two() operates on unsigned long,
-- 
2.51.2

