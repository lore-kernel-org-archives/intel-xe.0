Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A73C05023
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 17:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7D8112745;
	Mon, 15 Apr 2024 17:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XEj+C+7e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055B811273E
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 17:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713202790; x=1744738790;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KBLR//k1E1v8am4DjkuidTBs9v8o7EFQ/Qg0JWe4M5c=;
 b=XEj+C+7enKwAq+4l23+De7Ajf+NjIbGUuXeRPQlmpdUlmkgdDWvc7334
 Bd/XGGsHVLTvri+MNl0mVPgyIVQhdFHkPeA33gMMQ0Qx/CiI8QnSCpuCq
 nIgTw3xS56j5uQvDQJb0/DDGos8xhwPBjAEith3IYojOc+kliDlwJQ7XR
 nc9YG2xDl2qcZyQvQ1ojAz125j9OBIha0Jes8T16LEE753LyWopxR6btI
 A/nwDfwXvjiKaZqzKX/6Vjvz1bWA2XAHmDu73dQVstJcB/AHdcIbUhHXN
 2u2KpOcT2JS5K+o/GFLzcfuZpU8JL/FIk35Xw7yfIIVW7dANz4ssA8oTg g==;
X-CSE-ConnectionGUID: pEmgl+4vQ5mfVyOoPksqag==
X-CSE-MsgGUID: ZRmOtcRNRqiE7Ml1gfSeVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19998706"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19998706"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 10:39:50 -0700
X-CSE-ConnectionGUID: TevlbG2qQxWspG1lkam9yg==
X-CSE-MsgGUID: 7MEcpBhQSlKLp5GN5hzadA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22082780"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.45.29])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 10:39:49 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 4/6] drm/xe/guc: Add PF2GUC_UPDATE_VF_CFG to ABI
Date: Mon, 15 Apr 2024 19:39:35 +0200
Message-Id: <20240415173937.1287-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240415173937.1287-1-michal.wajdeczko@intel.com>
References: <20240415173937.1287-1-michal.wajdeczko@intel.com>
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

In upcoming patches the PF driver will add support to change VFs
configuration and will need to use PF2GUC_UPDATE_VF_CFG messages.
Add necessary definitions to our GuC firmware ABI header.

Definitions of the GuC VF Configuration KLVs used by this action
are already present in abi/guc_klvs_abi.h

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index 2d829e812c61..c1ad09b36453 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -260,6 +260,61 @@
 #define PF2GUC_UPDATE_VGT_POLICY_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
 #define PF2GUC_UPDATE_VGT_POLICY_RESPONSE_MSG_0_COUNT		GUC_HXG_RESPONSE_MSG_0_DATA0
 
+/**
+ * DOC: PF2GUC_UPDATE_VF_CFG
+ *
+ * The `PF2GUC_UPDATE_VF_CFG`_ message is used by PF to provision single VF in GuC.
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
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_PF2GUC_UPDATE_VF_CFG` = 0x5503         |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | **VFID** - identifier of the VF that the KLV                 |
+ *  |   |       | configurations are being applied to                          |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 2 |  31:0 | **CFG_ADDR_LO** - dword aligned GGTT offset that represents  |
+ *  |   |       | the start of a list of virtualization related KLV configs    |
+ *  |   |       | that are to be applied to the VF.                            |
+ *  |   |       | If this parameter is zero, the list is not parsed.           |
+ *  |   |       | If full configs address parameter is zero and configs_size is|
+ *  |   |       | zero associated VF config shall be reset to its default state|
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 3 |  31:0 | **CFG_ADDR_HI** - upper 32 bits of configs address.          |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 4 |  31:0 | **CFG_SIZE** - size (in dwords) of the config buffer         |
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
+#define GUC_ACTION_PF2GUC_UPDATE_VF_CFG			0x5503u
+
+#define PF2GUC_UPDATE_VF_CFG_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 4u)
+#define PF2GUC_UPDATE_VF_CFG_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
+#define PF2GUC_UPDATE_VF_CFG_REQUEST_MSG_1_VFID		GUC_HXG_REQUEST_MSG_n_DATAn
+#define PF2GUC_UPDATE_VF_CFG_REQUEST_MSG_2_CFG_ADDR_LO	GUC_HXG_REQUEST_MSG_n_DATAn
+#define PF2GUC_UPDATE_VF_CFG_REQUEST_MSG_3_CFG_ADDR_HI	GUC_HXG_REQUEST_MSG_n_DATAn
+#define PF2GUC_UPDATE_VF_CFG_REQUEST_MSG_4_CFG_SIZE	GUC_HXG_REQUEST_MSG_n_DATAn
+
+#define PF2GUC_UPDATE_VF_CFG_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
+#define PF2GUC_UPDATE_VF_CFG_RESPONSE_MSG_0_COUNT	GUC_HXG_RESPONSE_MSG_0_DATA0
+
 /**
  * DOC: PF2GUC_VF_CONTROL
  *
-- 
2.43.0

