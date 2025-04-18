Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AC5C369AB
	for <intel-xe@archiver.kernel.org>; Fri, 18 Apr 2025 14:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B414A10EBAE;
	Fri, 18 Apr 2025 14:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwSX7zoI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F87D10EBAE
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Apr 2025 14:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744985443; x=1776521443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h9ZKuIwjklqGYEi2Ye9OCLYmw14JRSz4uFUvu6WNgNg=;
 b=MwSX7zoI6vk7/lV2tu+Jw+kMUhs377ZkSTDgWhZKaVmiGbcOtH+HPjHL
 Ms4dISsAggFWVbIzAdoanzIHfbjtaootMq+qfvrZ8fv/TJTqSCqC+ncUZ
 St4oG8KH0xgdPV4igiKe7E4X5OW3JgK3ddIPRfaCn2XZYGDRKGY8cVoGS
 dskvtbYEfT6JsycGTe+YvtFl2S5ihPYT6Ptm8oBcWMkahEkPPTp4mhLkl
 ZtnWssUQXta9e27BNgXCE4NGuo8234yniOLtp4Wc4gnHlD8jh0wRjgxzy
 XdLttMWb4Hhpuk5dtiCMLALofjLRlRUI6WWa/tYRvS3Ielb81Fwz0v//Y g==;
X-CSE-ConnectionGUID: r9CPZTX7RoCd4NB6aJCv+w==
X-CSE-MsgGUID: mJNlevwxRYiOFFxd6d5ZAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50442643"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="50442643"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 07:10:43 -0700
X-CSE-ConnectionGUID: hQ1YzPaGSc6zyX1MVx1vbA==
X-CSE-MsgGUID: WIoU9OveQi2+kV9VvCWFsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="154294803"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa002.fm.intel.com with ESMTP; 18 Apr 2025 07:10:41 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v12 3/4] drm/xe/guc: Introduce enum with offsets for context
 register H2Gs
Date: Fri, 18 Apr 2025 16:10:34 +0200
Message-Id: <20250418141035.3841296-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250418141035.3841296-1-tomasz.lis@intel.com>
References: <20250418141035.3841296-1-tomasz.lis@intel.com>
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

