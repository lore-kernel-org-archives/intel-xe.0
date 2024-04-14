Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54ECC001CC
	for <intel-xe@archiver.kernel.org>; Sun, 14 Apr 2024 19:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F380112327;
	Sun, 14 Apr 2024 19:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K092Vd3h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3472A112323
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Apr 2024 19:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713121325; x=1744657325;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kmz6tvM99ZR7F8ZGGHP2U6s/JAzYHuh/gVy8LbLSgfo=;
 b=K092Vd3hSNyyXq43cbBvrz+R5viMd44CYS9IB/ixXgwM4Qxn7bLp7SXp
 vcfEpYGUhWwmGmEkiq2h1do4oWrBKKlOS0zwenY/O1z5T6KbEStILKs/c
 mPCMjxN2mHms12kVNpwUu75LoRJnPfwLzObhtfPl784VxHlA1L7A1rPtK
 VoysbTaz5OK4rgs3Deqk6kXRbDPHkZf4WqRbrXDA1CLp9NscFTzuWMVL0
 RK3WEkZpg6AYJR5997zzHVJlKXwzSw8Z5+jMsSlCzDCjvlCbwp3+fUQkC
 PFVhSYmAdzeUmmoi9/MR4/CNxYs8zC7sL3+n1oDeJBPTcgkpq+RrwJed4 g==;
X-CSE-ConnectionGUID: BgcZTyzhSyaH6Fso5+gW6Q==
X-CSE-MsgGUID: 6v25PkzASU6FnWermi/qEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="30983595"
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; d="scan'208";a="30983595"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 12:02:05 -0700
X-CSE-ConnectionGUID: PdSYZ6czQo+nbxvW/S69ww==
X-CSE-MsgGUID: 8j/qL261SSWSWf/FyiF+Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; d="scan'208";a="26383434"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.61.42])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 12:02:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/6] drm/xe/guc: Add PF2GUC_UPDATE_VF_CFG to ABI
Date: Sun, 14 Apr 2024 21:01:35 +0200
Message-Id: <20240414190137.1243-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240414190137.1243-1-michal.wajdeczko@intel.com>
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
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

In upcoming patches the PF driver will add support to change VFs
configuration and will need to use PF2GUC_UPDATE_VF_CFG messages.
Add necessary definitions to our GuC firmware ABI header.

Definitions of the GuC VF Configuration KLVs used by this action
are already present in abi/guc_klvs_abi.h

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

