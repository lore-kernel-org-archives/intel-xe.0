Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA4BC25B79
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 19:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD9210E859;
	Tue, 14 May 2024 19:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHugYFBt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A0310E6A7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 19:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715713269; x=1747249269;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jgX2lPkMn7M0MmtzOMnN8TUxGtfrSx4oxNwGW0Hjmx0=;
 b=RHugYFBtQflzvNOVJYiBd0JoML2+chtelLkE4y/5a2p0rBCSXOSp232n
 yozGnmR2RHzRYX2aqjKCctSlPcnALM72F6OSXU9ddGDoCm0W7wTzQI2fK
 cbKkLLpMInlrbL7ix/hkTymhd2RJUVvV3L4gQ4Om6AOTIjSKEd+Gax1NU
 bla1UwsN/a5Ix3ZbLtYXgCahqE5mvmp1mSRKSpS/G2+fzUmrEgW4Gvb+t
 8qxvZkyPUfU+qGFaSoxc++z0jRQ5g67LYpxuvJlH6G6G531wI0/0w8oEq
 IZnivzoyZCC3cO2ZgdVyYMCpBrub9b9NC1+B4RIn/F1xfWs1x/uUUQRUy g==;
X-CSE-ConnectionGUID: wJNfAVHkR9y6OSBKNHOKrw==
X-CSE-MsgGUID: BLVYiqBkS8+LW6lbrU4q3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11523184"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11523184"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:09 -0700
X-CSE-ConnectionGUID: rzmVXRSWTqWO3/YSPARedg==
X-CSE-MsgGUID: rA3CC7WXSSOBotWCy5VnZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35565512"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 6/8] drm/xe/guc: Add GUC2PF_ADVERSE_EVENT to ABI
Date: Tue, 14 May 2024 21:00:13 +0200
Message-Id: <20240514190015.2172-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240514190015.2172-1-michal.wajdeczko@intel.com>
References: <20240514190015.2172-1-michal.wajdeczko@intel.com>
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

When thresholds used to monitor VFs activities are configured,
then GuC may send GUC2PF_ADVERSE_EVENT messages informing the
PF driver about exceeded thresholds. Add necessary definitions
to our GuC firmware ABI header.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index c1ad09b36453..f1aa7f88e217 100644
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

