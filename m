Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19FECD129C
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 17:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988EA113423;
	Wed, 10 Apr 2024 17:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gy/o8t4n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A8210E7E8
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 17:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712768645; x=1744304645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hGPxIT2PSTTK43tuopb0tMB4WOocvcc8xfYtIuLt4Wc=;
 b=gy/o8t4nBpIWXLiUzV2q38y/LpsfIped3B3X34P+TuNWaDOFUkoZYvjs
 7pHdZWpDQ40X9eDEcbvUB6FNaWWsia8oTJizrH0whCLtmU+1bJI2GTqmY
 2EtLbvG1NVW0x3hPixWRvSLOr9IT+S76xlUG7dw/pX8QN0ZoomxnS3K+s
 TMdisH1UQqXOinAxFDDhGiTI9dkL1cYcvG7LHZFUF+XtS65PxfnEtjWC6
 CWfV8ni9Y+eTC6wda5rKdAOuaeFoMZk1Etl/LvheR9U3U1G4b/8DghBkT
 vJnrLXsSDuOItvxTc5iIR9+DkT7LUBb65zo419m71M04xwf2SfsbMuWgM w==;
X-CSE-ConnectionGUID: 1uleE1IIQpyqryOKnfy5Bw==
X-CSE-MsgGUID: lHcFmuavQMSEpvngLM1acA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18707635"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18707635"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:04:05 -0700
X-CSE-ConnectionGUID: i/DOYZtSSf+iR6cw27kH3g==
X-CSE-MsgGUID: tIDHzxF4STyehuOfCWN4Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25401939"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.42.161])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:04:03 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 3/5] drm/xe/guc: Add PF2GUC_UPDATE_VGT_POLICY to ABI
Date: Wed, 10 Apr 2024 19:03:36 +0200
Message-Id: <20240410170338.1199-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240410170338.1199-1-michal.wajdeczko@intel.com>
References: <20240410170338.1199-1-michal.wajdeczko@intel.com>
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

In upcoming patches the PF driver will add support to change GuC
policies and will need to use PF2GUC_UPDATE_VGT_POLICY messages.
Add necessary definitions to our GuC firmware ABI header.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: typo (Piotr)
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index 12ee5e9e831f..2d829e812c61 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -213,6 +213,53 @@
 #define   GUC_PF_NOTIFY_VF_PAUSE_DONE			3u
 #define   GUC_PF_NOTIFY_VF_FIXUP_DONE			4u
 
+/**
+ * DOC: PF2GUC_UPDATE_VGT_POLICY
+ *
+ * This message is used by the PF to set `GuC VGT Policy KLVs`_.
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

