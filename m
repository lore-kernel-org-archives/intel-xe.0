Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1192C25B4F
	for <intel-xe@archiver.kernel.org>; Sun, 12 May 2024 15:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D63C10E304;
	Sun, 12 May 2024 15:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CujvKYO9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96A910E2C4
 for <intel-xe@lists.freedesktop.org>; Sun, 12 May 2024 15:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715528969; x=1747064969;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9/+Ll+j1IXiQg/C8Y23Xkzzn2M/0mc9Um0F6aprf6pE=;
 b=CujvKYO9HZnrWciYUOIMIbTpiaNZcOcWWE43L1loeyQT8VkgnObzgS53
 32ApnaSGlf0L+7RtqGPsliisovoRRUosZovNwNLMeqfxEUARXXN+0b/4X
 ljEUkDEfCfwQY7syiOBYdQxxFX6jemwpys76IF7lsRj/+X2xfBkbfQP1B
 9H5Ezth3FdUaFDI2/xu5WvLcjq6bjjsBEKvnZhDUqezEI49AzlSa0JnjS
 R/rSaTatAC8OhHMw6TietWT6b+yvNH0ZtoCeD9IZLWnwfRFI67EA3NDQ7
 x9FlbNo8E5xWKKoGx4ZbY1otPZvnW6mwk+Z4vw9njMuOL5Vcmf+ihnQqM A==;
X-CSE-ConnectionGUID: 8PKsmhsuTeeYbnivHr57GQ==
X-CSE-MsgGUID: RJkj3C3ISu6BzawrmbUonA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22039944"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="22039944"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:49:29 -0700
X-CSE-ConnectionGUID: E6NhH9ISQrKnR20lRVifdw==
X-CSE-MsgGUID: UyBe8UVCRvK5vRg0TVfgVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="53332493"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:49:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/6] drm/xe/guc: Add VF2GUC_QUERY_SINGLE_KLV to ABI
Date: Sun, 12 May 2024 17:49:12 +0200
Message-Id: <20240512154915.2040-4-michal.wajdeczko@intel.com>
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

In upcoming patches we will add support to the VF driver to
read its configuration from the GuC using special H2G actions.
Add necessary definitions to our GuC firmware ABI header.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index dbe6eb47dd31..d5307b363537 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -471,4 +471,60 @@
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

