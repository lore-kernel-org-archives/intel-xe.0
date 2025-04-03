Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5548CC3601A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 18:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AB410EA58;
	Thu,  3 Apr 2025 18:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mxKw+h5B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD33A10EA58
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 18:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743705664; x=1775241664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jnTszkEwALylkUN+0vs0vm2UWpATKZShvsrCEx7y/Rw=;
 b=mxKw+h5BE0nMq0Ukfi/L8MM8dw6e8u9BLNWFd2Zmy1v7vJKJicxH7jRf
 wQuOLivMOT8Cc4k3TagE8A6lESKRCTGa9MvEWQJtorxAB4uw6Lwiuc2FD
 UOVSwLxZcUugtVSnzwPnKemR+ZgrE/+zvgWQKztW+jZmjCFI7lmHEvlNa
 8slBSTfsoDVosx2jblkc+zdQA6UApjTVV8a+mLY6hTocmZMB8e5uEuE9h
 vSXX1ZGAlKIubR/okDRXQmzqDmNF9R0xzRNXGcbzFDmXV/9siIARTLR9h
 aEHWEFk6pmuf0IAmInNQ80NXXFROnnu4gKSfAj+JICpFGUmY+YxlDFIF2 Q==;
X-CSE-ConnectionGUID: H4NeJ1P+T/axW88XGcmUcA==
X-CSE-MsgGUID: cRUVBlYuTrmrRWowmTwGpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="67604284"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="67604284"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 11:41:04 -0700
X-CSE-ConnectionGUID: 7VKB9kIwThWkBNqbMY4KqQ==
X-CSE-MsgGUID: xU2ZAHFDRxWou5h9SmMNyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="132216410"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2025 11:41:02 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v7 3/4] drm/xe/guc: Introduce enum with offsets for context
 register H2Gs
Date: Thu,  3 Apr 2025 20:40:54 +0200
Message-Id: <20250403184055.2317409-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403184055.2317409-1-tomasz.lis@intel.com>
References: <20250403184055.2317409-1-tomasz.lis@intel.com>
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

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h | 29 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 22 ++++++++++++++++++
 2 files changed, 51 insertions(+)

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
index 31bc2022bfc2..63ef06d3a28f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -485,6 +485,18 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
 		action[len++] = upper_32_bits(xe_lrc_descriptor(lrc));
 	}
 
+	xe_gt_assert(guc_to_gt(guc),
+		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER]
+		     == info->wq_desc_lo);
+	xe_gt_assert(guc_to_gt(guc),
+		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER]
+		     == info->wq_base_lo);
+	xe_gt_assert(guc_to_gt(guc),
+		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS]
+		     == q->width);
+	xe_gt_assert(guc_to_gt(guc),
+		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR]
+		     == info->hwlrca_lo);
 	xe_gt_assert(guc_to_gt(guc), len <= MAX_MLRC_REG_SIZE);
 #undef MAX_MLRC_REG_SIZE
 
@@ -509,6 +521,16 @@ static void __register_exec_queue(struct xe_guc *guc,
 		info->hwlrca_hi,
 	};
 
+	xe_gt_assert(guc_to_gt(guc),
+		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]
+		     == info->wq_desc_lo);
+	xe_gt_assert(guc_to_gt(guc),
+		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]
+		     == info->wq_base_lo);
+	xe_gt_assert(guc_to_gt(guc),
+		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]
+		     == info->hwlrca_lo);
+
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
-- 
2.25.1

