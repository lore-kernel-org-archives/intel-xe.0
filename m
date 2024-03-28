Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4F6CD11DF
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 18:32:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5A710E27C;
	Thu, 28 Mar 2024 18:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k601ZACM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A268610F984
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 18:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711650721; x=1743186721;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=j/xQzqlSg5EghIhL+xgMblwSOsoGaFSH1G/JrKeV8Uo=;
 b=k601ZACMoCqSh7Y76+gPf8JqiklfjIkWcgO7wTkNen5wO8m8QuQ1eOT9
 yHUzp3RygXDlw4RstxAur6b8L1CwSDcGTdRqqHRaFDm1v+UW9nLKpPs25
 sMtaI/fyURxru5WvPLv7XxdsCeULunT3IAe4hP8dLynvDcn2GaBiVQyJN
 mmAZ7fGXdv36UQes1PeS9FVoMTdLlHHwFyWEsmOU1GEcrVrORCYUAA2io
 dhEcIRyuL4XD1TYX9hRAEIjgsPZXbclxE/b5Ezk0/whWWmkPHVFHzXQAM
 sMP6glGuFIW7aWeHpX+iP35tseZ9NbQg7U3kBR0tG/ltRKewM34/kUpEO A==;
X-CSE-ConnectionGUID: PLJoCzE8TYSjL5wF87IdWw==
X-CSE-MsgGUID: ox+YZgwTTneUOMCZPdLoCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18205408"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="18205408"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="47700384"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.157.82])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:31:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/7] drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
Date: Thu, 28 Mar 2024 19:31:44 +0100
Message-Id: <20240328183147.495-5-michal.wajdeczko@intel.com>
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

In upcoming patches we will add version negotiation between
the VF driver and the GuC firmware.  Add necessary definitions
to our GuC firmware ABI header.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index ea01b21afe28..fcb1069ffec5 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -243,6 +243,70 @@
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
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 23:16 | **MAJOR** - major version of the VF interface                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:8 | **MINOR** - minor version of the VF interface                |
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
+#define GUC_ACTION_VF2GUC_MATCH_VERSION			0x5500
+
+#define VF2GUC_MATCH_VERSION_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 1u)
+#define VF2GUC_MATCH_VERSION_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
+#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH	(0xff << 24)
+#define   GUC_VERSION_BRANCH_ANY			0
+#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR	(0xff << 16)
+#define   GUC_VERSION_MAJOR_ANY				0
+#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR	(0xff << 8)
+#define   GUC_VERSION_MINOR_ANY				0
+#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MBZ		(0xff << 0)
+
+#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_LEN		(GUC_HXG_RESPONSE_MSG_MIN_LEN + 1u)
+#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
+#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH	(0xff << 24)
+#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR	(0xff << 16)
+#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR	(0xff << 8)
+#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH	(0xff << 0)
+
 /**
  * DOC: PF2GUC_UPDATE_VGT_POLICY
  *
-- 
2.43.0

