Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C7AD3B9B7
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 01:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7804D10E64B;
	Wed, 10 Dec 2025 01:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="inH6QLnu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C35010E64B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 01:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765331128; x=1796867128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NltCWjn9MKzwgUM7NQrjB1U3o7qUFFe0QJSYhd9+hc8=;
 b=inH6QLnuuK+Qqd9h4ofm/HcrKu3Ap72b+57t0/jgvMgvzpskMaYK8R29
 K/A1KOI++AXKA4OUS4VhVZpcSPgwQTq3az2GMN0HuHODPFeGpC+s1NKcH
 1BFOQyyEX33ITUIf7QDGQxJg7Ik6PeJt8rQi4tI2CJrGcFW/BdHDkh7b1
 tRYKxs1qq0nv5XKv2MDLZRlQyOsCCS8Pe2a7s23CLFLcuWXEpwDpiyX6W
 /pkhnPi4ocnUrnBpfstaKPD0IM6uSYgIz+fkrOujlqaJaqtb678QYYvpZ
 5lAysTp4+LUuK0NaWVMimFXAySaOXoK1+xfFkhAykapTicdGCdYrZRH6M A==;
X-CSE-ConnectionGUID: VcRbyfQHS+KlmIc8OvWSkw==
X-CSE-MsgGUID: 1NNyBiiEROepflnzYLTI7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66302106"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="66302106"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 17:45:28 -0800
X-CSE-ConnectionGUID: F27WhT+ZQziospgGzXsZkg==
X-CSE-MsgGUID: RzFbSl0eRi+pwKS61SF5yw==
X-ExtLoop1: 1
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa003.fm.intel.com with ESMTP; 09 Dec 2025 17:45:27 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com
Subject: [PATCH v5 04/10] drm/xe/guc: Add page reclamation interface to GuC
Date: Wed, 10 Dec 2025 09:45:22 +0800
Message-ID: <20251210014517.3184135-16-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210014517.3184135-12-brian3.nguyen@intel.com>
References: <20251210014517.3184135-12-brian3.nguyen@intel.com>
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

v2:
 - Moved send_page_reclaim to first patch usage.
 - Add comments explaining shared done handler. (Matthew B)
 - Add FW version fallback to disable page reclaim
   on older versions. (Matthew B, Shuicheng)

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  2 ++
 drivers/gpu/drm/xe/xe_guc.c              |  4 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c           | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_fwif.h         |  1 +
 4 files changed, 24 insertions(+)

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
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index f0407bab9a0c..7daae3294665 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -767,6 +767,10 @@ int xe_guc_init(struct xe_guc *guc)
 	if (!xe_uc_fw_is_enabled(&guc->fw))
 		return 0;
 
+	/* Disable page reclaim if GuC FW does not support */
+	if (GUC_FIRMWARE_VER(guc) < MAKE_GUC_VER(70, 31, 0))
+		xe->info.has_page_reclaim_hw_assist = false;
+
 	if (IS_SRIOV_VF(xe)) {
 		ret = xe_guc_ct_init(&guc->ct);
 		if (ret)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 648f0f523abb..1c2acdec151a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1405,6 +1405,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
 	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
+	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
 		g2h_release_space(ct, len);
 	}
 
@@ -1591,6 +1592,15 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
 		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
+	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
+		/*
+		 * Page reclamation is an extension of TLB invalidation. Both
+		 * operations share the same seqno and fence. When either
+		 * action completes, we need to signal the corresponding
+		 * fence. Since the handling logic (lookup fence by seqno,
+		 * fence signalling) is identical, we use the same handler
+		 * for both G2H events.
+		 */
 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
 		break;
 	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
@@ -1756,6 +1766,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 		switch (action) {
 		case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
 		case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
+		case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
 			break;	/* Process these in fast-path */
 		default:
 			return 0;
@@ -1792,6 +1803,12 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
 		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
+	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
+		/*
+		 * Seqno and fence handling of page reclamation and TLB
+		 * invalidation is identical, so we can use the same handler
+		 * for both actions.
+		 */
 		__g2h_release_space(ct, len);
 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 7d93c2749485..5aa6fb249be9 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -16,6 +16,7 @@
 #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
 #define G2H_LEN_DW_TLB_INVALIDATE		3
 #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
+#define G2H_LEN_DW_PAGE_RECLAMATION		3
 
 #define GUC_ID_MAX			65535
 #define GUC_ID_UNKNOWN			0xffffffff
-- 
2.52.0

