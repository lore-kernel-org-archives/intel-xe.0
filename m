Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121D6EEE25C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 20:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CE310EC49;
	Thu, 12 Sep 2024 20:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9ZogG3i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E1910EC4B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 20:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726173514; x=1757709514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6sjssBOOHmp2YmPamAfj89gUUoMBZ2y5nOC5OhNbHrk=;
 b=J9ZogG3iXk0SSMl6O0sRvQ4zBjvZaeDrfZmy6EQgm0rU8n5h1yRQBBNh
 e1bL7o54CwKG3LtuQZTiWxUT/Bwt/S7zcE8blphHMF+YTKW7aDxlKu/0s
 j/dJr01cNlMOaIegycZs8ByYVRfDHkGYMYGaAhiSmKE/ZIGpFH8gdmdjm
 IVoRa1ms9qNQ0hoX6nIhemNZr6RDn8EhyxBvrt9pPb9RbeAIVEItfaXle
 G49j3ZkTyszc5N48lOrr8pr6cLVbRoeLE22XlVef3VUhG8mNl7jkqOeDL
 j/SMhsbb/s+psLZNyh+DehFGVbaoEI4oDqD8a7y6b9iTpfIqkBzq9qsSm A==;
X-CSE-ConnectionGUID: S19hl+WaTsyS1hkmEKKEGA==
X-CSE-MsgGUID: ewJ4hyAETO24mJPWfmfH8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35725115"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="35725115"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 13:38:34 -0700
X-CSE-ConnectionGUID: mvumyYqIRx2AiA6h3QdEXQ==
X-CSE-MsgGUID: xWF7e64HQn271g7fxuLsPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="68126781"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.117])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 13:38:33 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH 2/6] drm/xe/guc: Add PF2GUC_SAVE_RESTORE_VF to ABI
Date: Thu, 12 Sep 2024 22:38:13 +0200
Message-Id: <20240912203817.1880-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240912203817.1880-1-michal.wajdeczko@intel.com>
References: <20240912203817.1880-1-michal.wajdeczko@intel.com>
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

In upcoming patches we will add support to the PF driver to save
and restore a VF state maintained by the GuC to allow VF migration.
Add necessary H2G definitions to our GuC firmware ABI header.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index 181180f5945c..b6a1852749dd 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -557,4 +557,65 @@
 #define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_2_VALUE64	GUC_HXG_REQUEST_MSG_n_DATAn
 #define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_3_VALUE96	GUC_HXG_REQUEST_MSG_n_DATAn
 
+/**
+ * DOC: PF2GUC_SAVE_RESTORE_VF
+ *
+ * This message is used by the PF to migrate VF info state maintained by the GuC.
+ *
+ * This message must be sent as `CTB HXG Message`_.
+ *
+ * Available since GuC version 70.25.0
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | DATA0 = **OPCODE** - operation to take:                      |
+ *  |   |       |                                                              |
+ *  |   |       |   - _`GUC_PF_OPCODE_VF_SAVE` = 0                             |
+ *  |   |       |   - _`GUC_PF_OPCODE_VF_RESTORE` = 1                          |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_PF2GUC_SAVE_RESTORE_VF` = 0x550B       |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | **VFID** - VF identifier                                     |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 2 |  31:0 | **ADDR_LO** - lower 32-bits of GGTT offset to the buffer     |
+ *  |   |       | where the VF info will be save to or restored from.          |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 3 |  31:0 | **ADDR_HI** - upper 32-bits of GGTT offset to the buffer     |
+ *  |   |       | where the VF info will be save to or restored from.          |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 4 |  27:0 | **SIZE** - size of the buffer (in dwords)                    |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 31:28 | MBZ                                                          |
+ *  +---+-------+--------------------------------------------------------------+
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  27:0 | DATA0 = **USED** - size of used buffer space (in dwords)     |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+#define GUC_ACTION_PF2GUC_SAVE_RESTORE_VF		0x550Bu
+
+#define PF2GUC_SAVE_RESTORE_VF_REQUEST_MSG_LEN		(GUC_HXG_EVENT_MSG_MIN_LEN + 4u)
+#define PF2GUC_SAVE_RESTORE_VF_REQUEST_MSG_0_OPCODE	GUC_HXG_EVENT_MSG_0_DATA0
+#define   GUC_PF_OPCODE_VF_SAVE				0u
+#define   GUC_PF_OPCODE_VF_RESTORE			1u
+#define PF2GUC_SAVE_RESTORE_VF_REQUEST_MSG_1_VFID	GUC_HXG_EVENT_MSG_n_DATAn
+#define PF2GUC_SAVE_RESTORE_VF_REQUEST_MSG_2_ADDR_LO	GUC_HXG_EVENT_MSG_n_DATAn
+#define PF2GUC_SAVE_RESTORE_VF_REQUEST_MSG_3_ADDR_HI	GUC_HXG_EVENT_MSG_n_DATAn
+#define PF2GUC_SAVE_RESTORE_VF_REQUEST_MSG_4_SIZE	(0xfffffffu << 0)
+#define PF2GUC_SAVE_RESTORE_VF_REQUEST_MSG_4_MBZ	(0xfu << 28)
+
+#define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
+#define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
+
 #endif
-- 
2.43.0

