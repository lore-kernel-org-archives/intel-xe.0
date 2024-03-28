Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60B8CD11DD
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 18:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4BE10F3BB;
	Thu, 28 Mar 2024 18:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CV+D1sEa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C1510F984
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 18:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711650720; x=1743186720;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hYkO/3or+NoZKiO2MSAHAOXqwY9h1YiCfkPRRF6O6NA=;
 b=CV+D1sEa0BYIigEPBlowrX/ZADIJabB5pTpqz8gDGgxkcxoglaMTDOp7
 nEQLxvMl8iNyUbB1DkyPBeJeej6cS8fO6qEJIHFwe3lzTA7QYa5abxaRy
 Q9UxDMqtocktlRD33hHsLUu9JcPQLzgoa72yqJdv9m2X5z7dZtgJXu6yd
 GHnnVbGK0VN8qTgagIED1TBD5ujypwEhQC9//fdXTzKkuYixxICOFSnWm
 8P9FjcrNoF+DadCkQFIcgjPaMaR74bgB9dzyQVWAjcyRBo4G3AObxRwvf
 eZT/KAup3YORrMCHEE8EKwn7vq0Dj3ZMOIXXJNUlnc9Iksh20CpQQAkpi g==;
X-CSE-ConnectionGUID: bTVZi3b4TAK/zN9MJ386Cg==
X-CSE-MsgGUID: g9VoM+hxSTqsVcut3ZXr7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18205406"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="18205406"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:32:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="47700382"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.157.82])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:31:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/7] drm/xe/guc: Add GUC2PF_ADVERSE_EVENT to ABI
Date: Thu, 28 Mar 2024 19:31:43 +0100
Message-Id: <20240328183147.495-4-michal.wajdeczko@intel.com>
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

In upcoming patches the PF driver will add support to configure
monitoring of the VFs activities and will must be abel to handle
related GUC2PF_ADVERSE_EVENT event messages from the GuC.
Add necessary definitions to our GuC firmware ABI header.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index 561c54a86016..ea01b21afe28 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -171,6 +171,36 @@
 #define VF2GUC_RELAY_TO_PF_REQUEST_MSG_n_RELAY_DATAx	GUC_HXG_REQUEST_MSG_n_DATAn
 #define VF2GUC_RELAY_TO_PF_REQUEST_MSG_NUM_RELAY_DATA	GUC_RELAY_MSG_MAX_LEN
 
+/**
+ * DOC: GUC2PF_ADVERSE_EVENT
+ *
+ * This message is used by the GuC to notify PF about adverse events.
+ *
+ * This G2H message must be sent as `CTB HXG Message`_.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_EVENT_                                   |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | DATA0 = MBZ                                                  |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_GUC2PF_ADVERSE_EVENT` = 0x5104         |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | DATA1 = **VFID** - VF identifier                             |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 2 |  31:0 | DATA2 = **THRESHOLD** - key of the exceeded threshold        |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+#define GUC_ACTION_GUC2PF_ADVERSE_EVENT			0x5104
+
+#define GUC2PF_ADVERSE_EVENT_EVENT_MSG_LEN		(GUC_HXG_EVENT_MSG_MIN_LEN + 2u)
+#define GUC2PF_ADVERSE_EVENT_EVENT_MSG_0_MBZ		GUC_HXG_EVENT_MSG_0_DATA0
+#define GUC2PF_ADVERSE_EVENT_EVENT_MSG_1_VFID		GUC_HXG_EVENT_MSG_n_DATAn
+#define GUC2PF_ADVERSE_EVENT_EVENT_MSG_2_THRESHOLD	GUC_HXG_EVENT_MSG_n_DATAn
+
 /**
  * DOC: GUC2PF_VF_STATE_NOTIFY
  *
-- 
2.43.0

