Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BB8C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 11:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DBC10EC6A;
	Thu, 16 May 2024 11:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lr04lwy8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015F410EC6A
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 11:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715857562; x=1747393562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1pFJEUAq4d3voFHuiaVYGMYbJT5/mzeT52Z34ZZi57I=;
 b=Lr04lwy8P1K51vf7rlBTujfcbpvoP1k/27baU7A9o2Mm4zxCXJQguJ50
 mkeq/ZTc8xt2SwK37DRirqSjOvmu5eFhIoc7wG2XLheUw0g9vWSPoH8dp
 AD361DmgWknRUFmiOBX+x9r0U4t1Ol7czIw/o1HUuZkACYXVEDdVZmgmy
 zOB14PZqQEQPnpjZA01zfXqy46cw8s4fRv7cNo/Y2vqsnndBFxGye5/Yt
 xeyiAY3JIjtCZe/odxCrLpaJ6gpXlPa8vXigWmCnufbRXip12kcZH66mF
 17/lWUjzoue137hdK1eeSws0jbD26XAPjmgwJdAIqjM8ZB2TgZd+GCzi5 Q==;
X-CSE-ConnectionGUID: Iy2B1jeUSM+zbClb0f6PnQ==
X-CSE-MsgGUID: ery2eu3qRnatKJKK6lbv3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12082115"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="12082115"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 04:06:02 -0700
X-CSE-ConnectionGUID: ZZE6zlu3RKWeSF3nbk82/g==
X-CSE-MsgGUID: er9PR8kqQz2csA7CjTuTUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="62229140"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 04:06:01 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 1/6] drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
Date: Thu, 16 May 2024 13:05:41 +0200
Message-Id: <20240516110546.2216-2-michal.wajdeczko@intel.com>
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

In upcoming patches we will add a version negotiation between
the VF driver and the GuC firmware. Add necessary definitions
to our GuC firmware ABI header.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: explicitly refer to MMIO HXG Message (Piotr)
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index c1ad09b36453..fb1c402a1cb3 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -213,6 +213,73 @@
 #define   GUC_PF_NOTIFY_VF_PAUSE_DONE			3u
 #define   GUC_PF_NOTIFY_VF_FIXUP_DONE			4u
 
+/**
+ * DOC: VF2GUC_MATCH_VERSION
+ *
+ * This action is used to match VF interface version used by VF and GuC.
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
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_MATCH_VERSION` = 0x5500         |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 | 31:24 | **BRANCH** - branch ID of the VF interface                   |
+ *  |   |       | (use BRANCH_ANY to request latest version supported by GuC)  |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 23:16 | **MAJOR** - major version of the VF interface                |
+ *  |   |       | (use MAJOR_ANY to request latest version supported by GuC)   |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:8 | **MINOR** - minor version of the VF interface                |
+ *  |   |       | (use MINOR_ANY to request latest version supported by GuC)   |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |   7:0 | **MBZ**                                                      |
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
+ *  | 1 | 31:24 | **BRANCH** - branch ID of the VF interface                   |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 23:16 | **MAJOR** - major version of the VF interface                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:8 | **MINOR** - minor version of the VF interface                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |   7:0 | **PATCH** - patch version of the VF interface                |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+#define GUC_ACTION_VF2GUC_MATCH_VERSION			0x5500u
+
+#define VF2GUC_MATCH_VERSION_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 1u)
+#define VF2GUC_MATCH_VERSION_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
+#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH	(0xffu << 24)
+#define   GUC_VERSION_BRANCH_ANY			0
+#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR	(0xffu << 16)
+#define   GUC_VERSION_MAJOR_ANY				0
+#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR	(0xffu << 8)
+#define   GUC_VERSION_MINOR_ANY				0
+#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MBZ		(0xffu << 0)
+
+#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_LEN		(GUC_HXG_RESPONSE_MSG_MIN_LEN + 1u)
+#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
+#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH	(0xffu << 24)
+#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR	(0xffu << 16)
+#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR	(0xffu << 8)
+#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH	(0xffu << 0)
+
 /**
  * DOC: PF2GUC_UPDATE_VGT_POLICY
  *
-- 
2.43.0

