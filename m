Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EA2D3B996
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 20:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F211610E641;
	Tue,  9 Dec 2025 20:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LP8OZSzc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7192810E641
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 20:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765310909; x=1796846909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NltCWjn9MKzwgUM7NQrjB1U3o7qUFFe0QJSYhd9+hc8=;
 b=LP8OZSzcEtIhtR7Lo7cd15x95XVieAJO8rih0486r58+PyxSsBKudQ/p
 uu5UaktlRrQQTUUl+eGs/HysxFVQExTqTdWumOTr7AtR2uSl0JdKOxqce
 OsLuTBQX25JpfBpYN5e/av0ZVZB8htO1dBsi7lh7+osOGnIyu4yR3md4c
 eqG43wICHFDukPrrQeoIls+RCmXRsCgCdWMZVlOlibfrCak4QE6Nha04G
 GPLxrT28z4rMlGhCOLvuPs7hyi9dkkb1h/zIFW/AGHAK/zx8Xwyj7PV5/
 kdy12/Rl08DVv7XHl+X5ms6u2nGrIfWeWS0/ol2vgqzdSjQMreFQcGZES w==;
X-CSE-ConnectionGUID: Vx4AjQVaSiuWerAM+Xc8wg==
X-CSE-MsgGUID: kflnL2RFRPW5Lxk5kL12RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67328708"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67328708"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:08:29 -0800
X-CSE-ConnectionGUID: 4WBwJIMGQWuQ3LmRZlE5Vg==
X-CSE-MsgGUID: O+KiXGAcSBOViGOB+FIYEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="195563893"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa010.jf.intel.com with ESMTP; 09 Dec 2025 12:08:27 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com
Subject: [PATCH v4 04/10] drm/xe/guc: Add page reclamation interface to GuC
Date: Wed, 10 Dec 2025 04:08:20 +0800
Message-ID: <20251209200815.2570770-16-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209200815.2570770-12-brian3.nguyen@intel.com>
References: <20251209200815.2570770-12-brian3.nguyen@intel.com>
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

