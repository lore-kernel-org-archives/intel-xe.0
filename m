Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EC6C369A5
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 21:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF2A10E326;
	Wed,  9 Apr 2025 21:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cedVNAy5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7A710E321
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 21:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744233230; x=1775769230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ql/zf6eULcbNdmgkhE8xdElwJni0sMba+SEbnSXA4U4=;
 b=cedVNAy5WLEOArC/q2Bkpz/d9ASbBdHfN1dxiq8N0UWRm/WItilbPGht
 CzlNkHS/Q1O0mT0o3TkH8k6Nt5/JlVykBLyw1ljPhKDAexmeaV5DE9FJg
 fQcfQraUIJxMgwxH3iuL6Q1Ns3qXG62jxo5aRKm2xfNhhKqwqp1eyGbRu
 oUd3cNQx+5uji7fA7iGZGW1CvHGav0YnGz/s6bQ+uoGaPlX58GEF6qSBq
 OBR7p1Vl9wY8GkilVIdDzr4k/ACj94RMhN6jMMLUOQ7AoY+jGQyv5i/FH
 GT5bk251leO8rF72nHDRxJsEB6TSCWn5c6QCUb7+4bmKOSuWFT3ev+5Yx g==;
X-CSE-ConnectionGUID: 7v+wcdeGSaqeLOtLb11y8A==
X-CSE-MsgGUID: U1hCTT6vRA2aaon/fxjKLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49572497"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="49572497"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 14:13:50 -0700
X-CSE-ConnectionGUID: vXz3wPg4QtiR/dsqq2EAbw==
X-CSE-MsgGUID: uenOKx87Q9CqoVRuatwQ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="133677284"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 09 Apr 2025 14:13:49 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v8 3/4] drm/xe/guc: Introduce enum with offsets for context
 register H2Gs
Date: Wed,  9 Apr 2025 23:13:39 +0200
Message-Id: <20250409211340.3046931-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409211340.3046931-1-tomasz.lis@intel.com>
References: <20250409211340.3046931-1-tomasz.lis@intel.com>
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

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h | 29 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 17 ++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 448afb86e05c..64c71526356e 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -161,6 +161,35 @@ enum xe_guc_preempt_options {
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

