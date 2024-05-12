Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9575DC25B4F
	for <intel-xe@archiver.kernel.org>; Sun, 12 May 2024 15:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F3410E2F8;
	Sun, 12 May 2024 15:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RdUgQWTi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698D410E28D
 for <intel-xe@lists.freedesktop.org>; Sun, 12 May 2024 15:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715528967; x=1747064967;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vwUIz09Dngz2m5cfSFMSyltKwuNdZ+dvZv7E0kVYCA0=;
 b=RdUgQWTisXgErrXnm2Y9DPL1YIoqDYASGl7RjgeAhSid9yd/k8BDxnrE
 GGEmPPqXaja05l0a/K6jKetTaJar3/4EPblZ/r6Nnh25jOAugpdEFW/X1
 OB/UkZ2bEyZ5M59YX5l4EokvOO9KDC4LcnrX5f/Pq1Nln5P8gMoSmuS0q
 R/k4hti1Lxg8DBu/d/nLouR+5YxfE8iA+5B86kcMkGWQkKdEVVw+DQA2A
 GzYNS9OT7TAKwagBdsDUtNCkVBLmn//GltZkU/8Qa1o7g8iI0KZ0fP8xZ
 2FSsu8vb08i03ndvrAeH+8j/32nuZT5SefYe5QAmfUQhKvdEc1xyEJCP8 A==;
X-CSE-ConnectionGUID: FxIPrjOFQtWlszHJPZji1A==
X-CSE-MsgGUID: bmDQoQc9S52JmJjhVOoihQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22039941"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="22039941"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:49:27 -0700
X-CSE-ConnectionGUID: bWQZMxIPR3qpISdytok03Q==
X-CSE-MsgGUID: xW3KgdrVRNS8oJ01rjeElg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="53332483"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:49:26 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/6] drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
Date: Sun, 12 May 2024 17:49:10 +0200
Message-Id: <20240512154915.2040-2-michal.wajdeczko@intel.com>
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

In upcoming patches we will add a version negotiation between
the VF driver and the GuC firmware. Add necessary definitions
to our GuC firmware ABI header.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index c1ad09b36453..49ed5fbd4ced 100644
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
+ * This action must be sent over MMIO.
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

