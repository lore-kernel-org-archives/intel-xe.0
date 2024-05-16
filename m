Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3EBC25B78
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 11:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1E910EC6E;
	Thu, 16 May 2024 11:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDRrQAhP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1BC10EC6A
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 11:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715857564; x=1747393564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uIt8Of2BC7F+HBHrs3jLHCTGOJL2bikEyECH2F/JFzM=;
 b=GDRrQAhPI2JnQYlFXBJyffRl1L65uSl3LOEmJXU4zFxclthSWBC7RWQI
 JmezJo2Aq20Xu3p35IvaM1IrsiLM/HT28SEmhVdWbosDajoVdob3LEHab
 3nMeIIIFfIoTdPLjqIJWftYjZKzLcJTKCFloQ6WB7wN4c4gS/aD4BtEld
 dPUXywLPY6rL+7gas4WMBXWJ5IICqxm1ASSlRLDhlcX30VR/PXo1lADJR
 NTSaslZdSeL66oGj95oaKayqNgvXuoLfr3LcKtOVxHTduoramLWWPeus9
 78OzCp0IB154Ja9bOwuX8Ygu/2Lfqsho7h+To5UOaoOONpV6FDEH6ZCbL w==;
X-CSE-ConnectionGUID: +7eBJH93QpG0HqeO/D8enA==
X-CSE-MsgGUID: /ikuPCg6QRKlitg+m4kcQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12082118"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="12082118"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 04:06:04 -0700
X-CSE-ConnectionGUID: Zq7fr+lLT1ikoPTsSR1QlQ==
X-CSE-MsgGUID: i7JpeC6DRmeAAFg329DLYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="62229149"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 04:06:03 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 2/6] drm/xe/guc: Add VF2GUC_VF_RESET to ABI
Date: Thu, 16 May 2024 13:05:42 +0200
Message-Id: <20240516110546.2216-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240516110546.2216-1-michal.wajdeczko@intel.com>
References: <20240516110546.2216-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The version negotiation between the VF driver and the GuC firmware
must start with explicit soft reset of the GuC state initiated by
the VF driver. Add VF2GUC action definitions to the ABI header.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index fb1c402a1cb3..cc792edb2b86 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -434,4 +434,41 @@
 #define   GUC_PF_TRIGGER_VF_FLR_START			4u
 #define   GUC_PF_TRIGGER_VF_FLR_FINISH			5u
 
+/**
+ * DOC: VF2GUC_VF_RESET
+ *
+ * This action is used by VF to reset GuC's VF state.
+ *
+ * This message must be sent as `MMIO HXG Message`_.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | DATA0 = MBZ                                                  |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_VF_RESET` = 0x5507              |
+ *  +---+-------+--------------------------------------------------------------+
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  27:0 | DATA0 = MBZ                                                  |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+#define GUC_ACTION_VF2GUC_VF_RESET			0x5507u
+
+#define VF2GUC_VF_RESET_REQUEST_MSG_LEN			GUC_HXG_REQUEST_MSG_MIN_LEN
+#define VF2GUC_VF_RESET_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
+
+#define VF2GUC_VF_RESET_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
+#define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
+
 #endif
-- 
2.43.0

