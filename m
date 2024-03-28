Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5807DCD11DF
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 18:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D421112517;
	Thu, 28 Mar 2024 18:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B/n78mwW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4161120CD
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 18:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711650723; x=1743186723;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4CFE3hXyYHc2FBMNV5sQ5PYReoRADbYt3t/ULOlG330=;
 b=B/n78mwWqX2iOJNpe9mhZMZjcoxB7QIsWcq6ihttuUlq5t/TJIRW5mro
 MKSxkC4IHOH0mKC4zT13hORr3ncLtGadsRxL30rRm6o66cdTuR5gHxKQg
 TAgikE3phUr9QTSKg7zfsbExM4CUyw1xuiAa7jAJFCo8oQx/DcORN7hTh
 iOlGRIfWuXORUcw296RpeeUNgtulZddaUlayoOHUBxh+0XBY92imNHVr3
 VhNXzRJdMwTE7coywV++z8HfnHiUn8EjNZ7/J0HdcKdQTmqjrc8gbE0nj
 JyO9pALTxknRIEk9x56Pdl0A4zb4TZRJJjncLb6nL/Eus7dPnVXhBAFLm w==;
X-CSE-ConnectionGUID: rX5O/iYHQKODad6X1vBEqg==
X-CSE-MsgGUID: SpR5BRvzTwuw3aOxDR2q8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18205412"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="18205412"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:32:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="47700441"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.157.82])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:32:02 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/7] drm/xe/guc: Add VF2GUC_QUERY_SINGLE_KLV to ABI
Date: Thu, 28 Mar 2024 19:31:46 +0100
Message-Id: <20240328183147.495-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240328183147.495-1-michal.wajdeczko@intel.com>
References: <20240328183147.495-1-michal.wajdeczko@intel.com>
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

In upcoming patches the VF driver will add support to read its
configuration from the GuC using special H2G actions.
Add necessary definitions to our GuC firmware ABI header.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index 7de6c87410ce..31a9c4b13b35 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -498,4 +498,60 @@
 #define VF2GUC_VF_RESET_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
 #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
 
+/**
+ * DOC: VF2GUC_QUERY_SINGLE_KLV
+ *
+ * This action is used by VF to query value of the single KLV data.
+ *
+ * This action must be sent over MMIO.
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
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV` = 0x5509      |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 | 31:16 | MBZ                                                          |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | **KEY** - key for which value is requested                   |
+ *  +---+-------+--------------------------------------------------------------+
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | MBZ                                                          |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | **LENGTH** - length of data in dwords                        |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | **VALUE32** - bits 31:0 of value if **LENGTH** >= 1          |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 2 |  31:0 | **VALUE64** - bits 63:32 of value if **LENGTH** >= 2         |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 3 |  31:0 | **VALUE96** - bits 95:64 of value if **LENGTH** >= 3         |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+#define GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV		0x5509u
+
+#define VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 1u)
+#define VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
+#define VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_MBZ	(0xffffu << 16)
+#define VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY	(0xffffu << 0)
+
+#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_MIN_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
+#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_MAX_LEN	(GUC_HXG_RESPONSE_MSG_MIN_LEN + 3u)
+#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_MBZ	(0xfffu << 16)
+#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_LENGTH	(0xffffu << 0)
+#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32	GUC_HXG_REQUEST_MSG_n_DATAn
+#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_2_VALUE64	GUC_HXG_REQUEST_MSG_n_DATAn
+#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_3_VALUE96	GUC_HXG_REQUEST_MSG_n_DATAn
+
 #endif
-- 
2.43.0

