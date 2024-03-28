Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FB6CD11DD
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 18:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7067D10F984;
	Thu, 28 Mar 2024 18:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0SVHmZ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D2010F984
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 18:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711650722; x=1743186722;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+hWKeCnrt9pztBOgedzq2flzjuA6RXJS0rk14aPgdZY=;
 b=T0SVHmZ/PrlkeT4N24sQc+Eo5TrQySdnA6BKSSIC208p+9eMW95z6+gc
 z3a7YuXlRxSuyUAgMSRE05KmfKgjzwZftEWW1ocxwi1qgq9xsmYazyWpG
 wIArmfPvgf0Spmx7l34o/w0nnsPDvuPhE09HNGAYcn9q4LVm4xjCt7eO2
 4LklOTYhTz+esQWs7o+dSB0uLNwHHvx8/hnKSwlDqdTdVcJs1MEd8bQwI
 ZE03ZR4jsqX+HjAeYAdGeOuAcHGI1x4Tqz0BAbRT+3CpUHxdqraERZypD
 4Ewb8aYz5reCfaUcZCo3htQDWZEl6wrLddAdxEkORJHJuegLojuXVdqv9 w==;
X-CSE-ConnectionGUID: lKXwZy6XSzaZ3h2GVnqSnQ==
X-CSE-MsgGUID: heY2AYM5TaGMDjeQkzTG8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18205409"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="18205409"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:32:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="47700407"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.157.82])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:32:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/7] drm/xe/guc: Add VF2GUC_VF_RESET to ABI
Date: Thu, 28 Mar 2024 19:31:45 +0100
Message-Id: <20240328183147.495-6-michal.wajdeczko@intel.com>
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

The process of version negotiation between the VF driver and the
GuC firmware mandates explicit soft reset of the GuC state.
Add necessary definitions to our GuC firmware ABI header.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index fcb1069ffec5..7de6c87410ce 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -461,4 +461,41 @@
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

