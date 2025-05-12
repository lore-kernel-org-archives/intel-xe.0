Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1646C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 11:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3DF10E381;
	Mon, 12 May 2025 11:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHEdMyAH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC6910E381
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 11:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747050024; x=1778586024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M5crRC8wVEQi0UDXknJiZkFMPMOCvBp8EL4XoGHmN5M=;
 b=IHEdMyAHlsCFmylyYEjkusmG7mhLgLg3ruPnG54ddjbr/1nqaMz+bAA5
 X3VHB8U667Xxg5uVLZ6R474V7guAXlfXNhOyVnDeLcwBZEvN9G0W/JL2X
 LKwm3EJJAvduGLX+/RJ3h77LZtnZWB7xP08GAVj8emqkwbPoMRHHGiua6
 sJRPy0ziKO0jp1Lr9dQ9xVwPWsGyvZoV0Dx0uE9oQWHgOIDsDVZxVlSP0
 rCGpcy7xO2reM9joohtGgWyWekerkPHZn3eKWRyuWiX8myF8zDU/tIU9F
 FUBEJmKB19RCxfOezqmwvPCf77gsRrkpX9G6k8JF0jHJoK2YPq6wr/rDu A==;
X-CSE-ConnectionGUID: S2ZMIw5nRNKHVXpvw+87Yg==
X-CSE-MsgGUID: cAtgoEkfRP2SQ28lnwmLdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66250688"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="66250688"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 04:40:24 -0700
X-CSE-ConnectionGUID: QghFHG8UQKqgh33eaLDyEw==
X-CSE-MsgGUID: QPdUusyyQcmswmiqWlZKuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142241212"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa005.fm.intel.com with ESMTP; 12 May 2025 04:40:23 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v14 3/4] drm/xe/guc: Introduce enum with offsets for context
 register H2Gs
Date: Mon, 12 May 2025 13:40:17 +0200
Message-Id: <20250512114018.361843-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250512114018.361843-1-tomasz.lis@intel.com>
References: <20250512114018.361843-1-tomasz.lis@intel.com>
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
v5: Renamed MULTI_LRC_MSG_LEN to MULTI_LRC_MSG_MIN_LEN

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h | 31 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 17 +++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 448afb86e05c..ff4f412c28d8 100644
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
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_MIN_LEN = 11,
+};
+
 enum xe_guc_report_status {
 	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
 	XE_GUC_REPORT_STATUS_ACKED = 0x1,
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 369be36f7dc5..06e2998b0e21 100644
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

