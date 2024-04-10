Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B2ACD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 12:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1410F1129D2;
	Wed, 10 Apr 2024 12:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvYpoPKN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A4810E704
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712752300; x=1744288300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P1ruJtHD2fpBYnpoXvqhCWq/o52AFt3saZ9sSwImB7o=;
 b=BvYpoPKNMGqzmkCXA9XmZ48KsL+V3F7DosC+5EZHF7H/zqz3UzAxitG8
 qDsRc1Zb4gngjmkl/N2c+rHdEbXkWymgf2C11pHi4SYAgTsFaTonAcDpi
 fjkUm6qVV/U1Ne4LB1nNMZjLTaEqq1DGIvQKgco792apQtJdIp1G0TgwB
 FNqLWBeA+dvS4CA90LcBYg8qxpRNRuyB/9A0ThH8ODf9R7F7jmRV5ne7y
 bkJRXG16hmTVUj0eiF/EW6xagU6lXKvqAc6j/uWzGNKtBEcizSYTWAVVN
 uMoYwFcCKFOxMxQZ6OOCoHNaR8OTcRe1I4cC9XjWZY9WULNAjHcUEtETP Q==;
X-CSE-ConnectionGUID: /sDqOkJ9Rg6fCzUhmBKcYA==
X-CSE-MsgGUID: K2Ui22vRS4ayGCT5wq+xHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8212414"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8212414"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 05:31:40 -0700
X-CSE-ConnectionGUID: lhnFBSwsSCeu+G3pUMIj8Q==
X-CSE-MsgGUID: f75SUF5lTkWk3Lyk0/9zFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="57986344"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.42.161])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 05:31:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/5] drm/xe/guc: Add PF2GUC_UPDATE_VGT_POLICY to ABI
Date: Wed, 10 Apr 2024 14:31:23 +0200
Message-Id: <20240410123125.1155-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240410123125.1155-1-michal.wajdeczko@intel.com>
References: <20240410123125.1155-1-michal.wajdeczko@intel.com>
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

In upcoming patches the PF driver will add support to change GuC
policies and will need to use PF2GUC_UPDATE_VGT_POLICY messages.
Add necessary definitions to our GuC firmware ABI header.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index 12ee5e9e831f..5051e3b866df 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -213,6 +213,53 @@
 #define   GUC_PF_NOTIFY_VF_PAUSE_DONE			3u
 #define   GUC_PF_NOTIFY_VF_FIXUP_DONE			4u
 
+/**
+ * DOC: PF2GUC_UPDATE_VGT_POLICY
+ *
+ * This message is optionaly used by the PF to set `GuC VGT Policy KLVs`_.
+ *
+ * This message must be sent as `CTB HXG Message`_.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | MBZ                                                          |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_PF2GUC_UPDATE_VGT_POLICY` = 0x5502     |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | **CFG_ADDR_LO** - dword aligned GGTT offset that             |
+ *  |   |       | represents the start of `GuC VGT Policy KLVs`_ list.         |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 2 |  31:0 | **CFG_ADDR_HI** - upper 32 bits of above offset.             |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 3 |  31:0 | **CFG_SIZE** - size (in dwords) of the config buffer         |
+ *  +---+-------+--------------------------------------------------------------+
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  27:0 | **COUNT** - number of KLVs successfully applied              |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+#define GUC_ACTION_PF2GUC_UPDATE_VGT_POLICY			0x5502u
+
+#define PF2GUC_UPDATE_VGT_POLICY_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 3u)
+#define PF2GUC_UPDATE_VGT_POLICY_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
+#define PF2GUC_UPDATE_VGT_POLICY_REQUEST_MSG_1_CFG_ADDR_LO	GUC_HXG_REQUEST_MSG_n_DATAn
+#define PF2GUC_UPDATE_VGT_POLICY_REQUEST_MSG_2_CFG_ADDR_HI	GUC_HXG_REQUEST_MSG_n_DATAn
+#define PF2GUC_UPDATE_VGT_POLICY_REQUEST_MSG_3_CFG_SIZE		GUC_HXG_REQUEST_MSG_n_DATAn
+
+#define PF2GUC_UPDATE_VGT_POLICY_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
+#define PF2GUC_UPDATE_VGT_POLICY_RESPONSE_MSG_0_COUNT		GUC_HXG_RESPONSE_MSG_0_DATA0
+
 /**
  * DOC: PF2GUC_VF_CONTROL
  *
-- 
2.43.0

