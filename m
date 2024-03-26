Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4063AC54E67
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 19:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0720A10F212;
	Tue, 26 Mar 2024 19:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gV6ErdaF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774C510F212
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 19:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711480535; x=1743016535;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HYIXCadzRQWkk3aWcft+65rIGNHbp0kCGlwpzSx4Fsc=;
 b=gV6ErdaFtJoB7rWNFcgm14mQTFmpbIzxCfrKJXYG7L7EvWnpZd1B83L+
 SmyDdV6HOs84wql0NnmE3ILc+cTMwVKiG+z5SBz5qg6R9ElLraRNleLZv
 fw5oefxZW4PihupEoWztGttcr/22wrdNfapzaMSoeuJ+iUWUQWKTUmrJ1
 GvhslKYOLWtTqUyF3GUbwM91vPqQdnc4KEwUSrxLo7+YY0ePANZACNFk8
 qw8ZD7UWFIhkvQ03JzZKyX9Y37qXmfyM5rav7ECyosKz8fPcRsV+znmHs
 1TDV77X0oT8tYQBH+ayIcpVGgbv/F+pOWa6SaWepofwNn8A4BKo9C3J5X w==;
X-CSE-ConnectionGUID: h0mU5YFBQ/SNsEqar5tfKQ==
X-CSE-MsgGUID: 5hGQ0qXBTNK2HPDWWd9GfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="31994175"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="31994175"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 12:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20704789"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.156.251])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 12:15:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe/guc: Add VF_STATE_NOTIFY and VF_CONTROL to ABI
Date: Tue, 26 Mar 2024 20:15:17 +0100
Message-Id: <20240326191518.363-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240326191518.363-1-michal.wajdeczko@intel.com>
References: <20240326191518.363-1-michal.wajdeczko@intel.com>
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

In upcoming patches the PF driver will add support to handle the
GUC2PF_VF_STATE_NOTIFY events and to send PF2GUC_VF_CONTROL request
messages.  Add necessary definitions to our GuC firmware ABI header.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index 5496a5890847..f4914cf8be08 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -171,4 +171,98 @@
 #define VF2GUC_RELAY_TO_PF_REQUEST_MSG_n_RELAY_DATAx	GUC_HXG_REQUEST_MSG_n_DATAn
 #define VF2GUC_RELAY_TO_PF_REQUEST_MSG_NUM_RELAY_DATA	GUC_RELAY_MSG_MAX_LEN
 
+/**
+ * DOC: GUC2PF_VF_STATE_NOTIFY
+ *
+ * The GUC2PF_VF_STATE_NOTIFY message is used by the GuC to notify PF about change
+ * of the VF state.
+ *
+ * This G2H message is sent as `CTB HXG Message`_.
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
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_GUC2PF_VF_STATE_NOTIFY` = 0x5106       |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | DATA1 = **VFID** - VF identifier                             |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 2 |  31:0 | DATA2 = **EVENT** - notification event:                      |
+ *  |   |       |                                                              |
+ *  |   |       |   - _`GUC_PF_NOTIFY_VF_ENABLE` = 1 (only if VFID = 0)        |
+ *  |   |       |   - _`GUC_PF_NOTIFY_VF_FLR` = 1                              |
+ *  |   |       |   - _`GUC_PF_NOTIFY_VF_FLR_DONE` = 2                         |
+ *  |   |       |   - _`GUC_PF_NOTIFY_VF_PAUSE_DONE` = 3                       |
+ *  |   |       |   - _`GUC_PF_NOTIFY_VF_FIXUP_DONE` = 4                       |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+#define GUC_ACTION_GUC2PF_VF_STATE_NOTIFY		0x5106u
+
+#define GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_LEN		(GUC_HXG_EVENT_MSG_MIN_LEN + 2u)
+#define GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_0_MBZ		GUC_HXG_EVENT_MSG_0_DATA0
+#define GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_1_VFID		GUC_HXG_EVENT_MSG_n_DATAn
+#define GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_2_EVENT	GUC_HXG_EVENT_MSG_n_DATAn
+#define   GUC_PF_NOTIFY_VF_ENABLE			1u
+#define   GUC_PF_NOTIFY_VF_FLR				1u
+#define   GUC_PF_NOTIFY_VF_FLR_DONE			2u
+#define   GUC_PF_NOTIFY_VF_PAUSE_DONE			3u
+#define   GUC_PF_NOTIFY_VF_FIXUP_DONE			4u
+
+/**
+ * DOC: PF2GUC_VF_CONTROL
+ *
+ * The PF2GUC_VF_CONTROL message is used by the PF to trigger VF state change
+ * maintained by the GuC.
+ *
+ * This H2G message must be sent as `CTB HXG Message`_.
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
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_PF2GUC_VF_CONTROL_CMD` = 0x5506        |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | DATA1 = **VFID** - VF identifier                             |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 2 |  31:0 | DATA2 = **COMMAND** - control command:                       |
+ *  |   |       |                                                              |
+ *  |   |       |   - _`GUC_PF_TRIGGER_VF_PAUSE` = 1                           |
+ *  |   |       |   - _`GUC_PF_TRIGGER_VF_RESUME` = 2                          |
+ *  |   |       |   - _`GUC_PF_TRIGGER_VF_STOP` = 3                            |
+ *  |   |       |   - _`GUC_PF_TRIGGER_VF_FLR_START` = 4                       |
+ *  |   |       |   - _`GUC_PF_TRIGGER_VF_FLR_FINISH` = 5                      |
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
+#define GUC_ACTION_PF2GUC_VF_CONTROL			0x5506u
+
+#define PF2GUC_VF_CONTROL_REQUEST_MSG_LEN		(GUC_HXG_EVENT_MSG_MIN_LEN + 2u)
+#define PF2GUC_VF_CONTROL_REQUEST_MSG_0_MBZ		GUC_HXG_EVENT_MSG_0_DATA0
+#define PF2GUC_VF_CONTROL_REQUEST_MSG_1_VFID		GUC_HXG_EVENT_MSG_n_DATAn
+#define PF2GUC_VF_CONTROL_REQUEST_MSG_2_COMMAND		GUC_HXG_EVENT_MSG_n_DATAn
+#define   GUC_PF_TRIGGER_VF_PAUSE			1u
+#define   GUC_PF_TRIGGER_VF_RESUME			2u
+#define   GUC_PF_TRIGGER_VF_STOP			3u
+#define   GUC_PF_TRIGGER_VF_FLR_START			4u
+#define   GUC_PF_TRIGGER_VF_FLR_FINISH			5u
+
 #endif
-- 
2.43.0

