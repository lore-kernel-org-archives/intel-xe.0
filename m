Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22A9C25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 13:38:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6D110F07D;
	Mon,  6 May 2024 13:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJuw2yO4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB4210F07D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 13:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715002717; x=1746538717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IInkx64x+pEkPimJjf7FBIILVnWK9IJrhOw0NqmdTC4=;
 b=eJuw2yO4QB0oln5Y7DO9xD62IsusHc0SCj/54ZQPmUV5Rq9ZQkDfYHvH
 yZA8WM2QLhY6PCYazoRKDr25krrvugUxu3ny8xZb4aD1JA1ARYnPLW0GB
 8UpsWASSqDXeDphHMmgBJaj4DIPjQSpXtHJt3aWLO2oWUV8Mc4fcpJbJi
 ou+KXcreywnDF+RkQUMQ7nG/VK39s/B6kXwF1MnFwXig8J3sAwZTsMvHH
 k3ndZcUD30gSopCjimjkDTayuHslnlvG2lf8EFLPdk011kTCJvq14XV0i
 sWNwCkoMyND7A5vPya45RIDqDAzLudVqEUaZs1NoIZsXIbP4kQoOuLQgM A==;
X-CSE-ConnectionGUID: WMsnIUB4StOTIgEsg47e7g==
X-CSE-MsgGUID: HZHtgzbJThCZ/Uwn8237Ig==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21903425"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="21903425"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:38:37 -0700
X-CSE-ConnectionGUID: mVqmuIO0QTi/YRiFNUONxA==
X-CSE-MsgGUID: t1AcsBk0QqakHHmA6q9mVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28131710"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:38:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 6/8] drm/xe/guc: Add GUC2PF_ADVERSE_EVENT to ABI
Date: Mon,  6 May 2024 15:38:12 +0200
Message-Id: <20240506133814.2571-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240506133814.2571-1-michal.wajdeczko@intel.com>
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
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

When thresholds used to monitor VFs activities are configured,
then GuC may send GUC2PF_ADVERSE_EVENT messages informing the
PF driver about exceeded thresholds. Add necessary definitions
to our GuC firmware ABI header.

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

