Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A1CC369BD
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 22:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39ECE10E396;
	Tue, 15 Apr 2025 22:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSxBiopE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A91B10E395
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 22:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744755640; x=1776291640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h9ZKuIwjklqGYEi2Ye9OCLYmw14JRSz4uFUvu6WNgNg=;
 b=MSxBiopE5S8paXPiXkWDZeEJ7TGdpsUEoMcWaau4aLhcwXYlx6iV5XNi
 nW9zNnaU5ChCjpQCr1O8L8XYN3473gOnrAMMQ75n3UUeD+PPWXPiZrddu
 MJnBNz6LQWa2kiEivHI/c0zcRIVrnbXSO7DW7I3I/hPYDnugyJTpxHzUP
 Mt3Niv1p+ViOPbYrzthGpEGY6vid1V/cvgWAVswQ1dnc0eCM5CpLQt0pD
 PbwiuWE6ghbkqPhF0vE75sNQZcka5axlMj3P0oNIpvTYKQywsZhsgFPmI
 4zn0oqLZ3ZlC0VhrEC4Vk5noAbIZAEZlW+Ee017Ol1lbg3kCE4K2Hqdfr w==;
X-CSE-ConnectionGUID: jHEqudT8Q7+diuA0dv4oqg==
X-CSE-MsgGUID: 7pJpCq8tTV2LkjC0l/DOSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="49936856"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="49936856"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 15:20:40 -0700
X-CSE-ConnectionGUID: q7OakuHiQ3+st48XpSHM9A==
X-CSE-MsgGUID: KGssb3ViQ6ilUq24eq74jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="131153914"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa009.fm.intel.com with ESMTP; 15 Apr 2025 15:20:39 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v10 3/4] drm/xe/guc: Introduce enum with offsets for context
 register H2Gs
Date: Wed, 16 Apr 2025 00:20:29 +0200
Message-Id: <20250415222030.3616494-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415222030.3616494-1-tomasz.lis@intel.com>
References: <20250415222030.3616494-1-tomasz.lis@intel.com>
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

Some GuC messages are constructed with incrementing dword counter
rather than referencing specific DWORDs, as described in GuC interface
specification.

This change introduces the definitions of DWORD numbers for parameters
which will need to be referenced in a CTB parser to be added in a
following patch. To ensure correctness of these DWORDs, verification
in form of asserts was added to the message construction code.

v2: Renamed enum members, added ones for single context registration,
  modified asserts to check values rather than indexes.
v3: Reordered assert args to take less lines
v4: Added lengths

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com> (v3)
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h | 31 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 17 +++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 448afb86e05c..3c2808fabc6a 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -161,6 +161,37 @@ enum xe_guc_preempt_options {
 	XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
 };
 
+enum xe_guc_register_context_param_offsets {
+	XE_GUC_REGISTER_CONTEXT_DATA_0_MBZ = 0,
+	XE_GUC_REGISTER_CONTEXT_DATA_1_FLAGS,
+	XE_GUC_REGISTER_CONTEXT_DATA_2_CONTEXT_INDEX,
+	XE_GUC_REGISTER_CONTEXT_DATA_3_ENGINE_CLASS,
+	XE_GUC_REGISTER_CONTEXT_DATA_4_ENGINE_SUBMIT_MASK,
+	XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER,
+	XE_GUC_REGISTER_CONTEXT_DATA_6_WQ_DESC_ADDR_UPPER,
+	XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER,
+	XE_GUC_REGISTER_CONTEXT_DATA_8_WQ_BUF_BASE_UPPER,
+	XE_GUC_REGISTER_CONTEXT_DATA_9_WQ_BUF_SIZE,
+	XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR,
+	XE_GUC_REGISTER_CONTEXT_MSG_LEN,
+};
+
+enum xe_guc_register_context_multi_lrc_param_offsets {
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_0_MBZ = 0,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_1_FLAGS,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_2_PARENT_CONTEXT,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_3_ENGINE_CLASS,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_4_ENGINE_SUBMIT_MASK,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_6_WQ_DESC_ADDR_UPPER,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_8_WQ_BUF_BASE_UPPER,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_9_WQ_BUF_SIZE,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_LEN = 11,
+};
+
 enum xe_guc_report_status {
 	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
 	XE_GUC_REPORT_STATUS_ACKED = 0x1,
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 813c3c0bb250..cfc65f21b2f7 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -487,6 +487,15 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
 		action[len++] = upper_32_bits(xe_lrc_descriptor(lrc));
 	}
 
+	/* explicitly checks some fields that we might fixup later */
+	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
+		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER]);
+	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
+		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER]);
+	xe_gt_assert(guc_to_gt(guc), q->width ==
+		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS]);
+	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
+		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR]);
 	xe_gt_assert(guc_to_gt(guc), len <= MAX_MLRC_REG_SIZE);
 #undef MAX_MLRC_REG_SIZE
 
@@ -511,6 +520,14 @@ static void __register_exec_queue(struct xe_guc *guc,
 		info->hwlrca_hi,
 	};
 
+	/* explicitly checks some fields that we might fixup later */
+	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
+		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]);
+	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
+		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]);
+	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
+		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]);
+
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
-- 
2.25.1

