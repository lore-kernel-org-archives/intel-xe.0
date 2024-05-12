Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EA6C25B4F
	for <intel-xe@archiver.kernel.org>; Sun, 12 May 2024 15:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE9A10E2C4;
	Sun, 12 May 2024 15:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XzU+gVNU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8861410E2C4
 for <intel-xe@lists.freedesktop.org>; Sun, 12 May 2024 15:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715528968; x=1747064968;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pXbCkLuvzCvhXwgG6bbiJ1N3PQsgdzHP7YbHZM3lKog=;
 b=XzU+gVNUSPIKBodzpWeA7ZLPI6oJRuLA0PQ4CpoYzXRY2h1slPDUfpOs
 efolem8DILpdmTLh9wiKaEdecttP0pCZQcpg67+uyy+W4fZwoZaH5Wqtz
 kxN7FDSPJEIU9egMxmerZpdW3jmoCQrZNrUCvl/LUJqosV9aCdGMFinsD
 gjh0+lIR6Xf0pMVQYm0h+MQG3sEklXl9k4lsYXtwXjLI6vyYAo5jyp1u/
 plZZEWTUwpPevHiGhv1+Nd1UbGyfs9sNb0G5CTiuTGxiPwusLR6s7Qjs9
 mtD8mRHALQ4THACFQiP/sTFuRhK5yU5muk6AGIhxkxbrAWmN2YI7oo7xp g==;
X-CSE-ConnectionGUID: 7FNBQSVYSSmNFft1WOKLYg==
X-CSE-MsgGUID: s/6Wt973SIKvFO0JKJpPRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22039943"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="22039943"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:49:28 -0700
X-CSE-ConnectionGUID: z0ptdQL2SUW8C6VI1LUvPg==
X-CSE-MsgGUID: Cwf6tSOETW2RNXkVJWuRCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="53332490"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:49:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/6] drm/xe/guc: Add VF2GUC_VF_RESET to ABI
Date: Sun, 12 May 2024 17:49:11 +0200
Message-Id: <20240512154915.2040-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240512154915.2040-1-michal.wajdeczko@intel.com>
References: <20240512154915.2040-1-michal.wajdeczko@intel.com>
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

The version negotiation between the VF driver and the GuC firmware
must start with explicit soft reset of the GuC state initiated by
the VF driver. Add VF2GUC action definitions to the ABI header.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index 49ed5fbd4ced..dbe6eb47dd31 100644
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

