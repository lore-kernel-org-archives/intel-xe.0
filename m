Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F154DC47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 22:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE1710E56E;
	Thu,  4 Jan 2024 22:20:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0BD10E56A
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 22:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704406848; x=1735942848;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jrV7S0ulLWmESETdjIZo2jNkiRbBn0ELN8sdA0vVjus=;
 b=FlAtyIHRVzWWLIYNX998RC/YHtjNEi0dGj8+e7vNFdHZAwpWiaC3gdbd
 TJrbp6KOA/Pt80mE7JKoNFKvpO9ueSko0bX5nDTYVrcUGtb8prtAkYTyQ
 +GPH8tsuKQjIN10Hr+KTejsubFQp68zKExo2hF/Kw7i5FKGtmiPm3NJ0b
 Aup8HeXbkeYuL6dMlPeTSJ6D+oDoTRyFotdf6fkzOsk4AroYdT7A+QfmV
 eEx3sfGB7fPpGR90maO/CCxW8rJVDYv2SrfU29ohaMDUhySX7Z8FQcCdd
 wnz1lqIXPcQlh6a+g12wSmBUZ+JDWUAUNCAMR90iKyLIZgg6XtZvscOBn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="428546868"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="428546868"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="784022811"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="784022811"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.149.125])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:47 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 06/10] drm/xe/guc: Add Relay Communication ABI definitions
Date: Thu,  4 Jan 2024 23:20:27 +0100
Message-Id: <20240104222031.277-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240104222031.277-1-michal.wajdeczko@intel.com>
References: <20240104222031.277-1-michal.wajdeczko@intel.com>
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

The communication between Virtual Function (VF) drivers and
Physical Function (PF) drivers is based on the GuC firmware
acting as a proxy (relay) agent.

Add related ABI definitions that we will be using in upcoming
patches with our GuC Relay implementation.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 174 ++++++++++++++++++
 .../gpu/drm/xe/abi/guc_relay_actions_abi.h    |  79 ++++++++
 .../drm/xe/abi/guc_relay_communication_abi.h  | 118 ++++++++++++
 3 files changed, 371 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
new file mode 100644
index 000000000000..5496a5890847
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -0,0 +1,174 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _GUC_ACTIONS_PF_ABI_H
+#define _GUC_ACTIONS_PF_ABI_H
+
+#include "guc_communication_ctb_abi.h"
+
+/**
+ * DOC: GUC2PF_RELAY_FROM_VF
+ *
+ * This message is used by the GuC firmware to forward a VF2PF `Relay Message`_
+ * received from the Virtual Function (VF) driver to this Physical Function (PF)
+ * driver.
+ *
+ * This message is always sent as `CTB HXG Message`_.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_EVENT_                                   |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | MBZ                                                          |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF` = 0x5100      |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | **VFID** - source VF identifier                              |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 2 |  31:0 | **RELAY_ID** - VF/PF message ID                              |
+ *  +---+-------+-----------------+--------------------------------------------+
+ *  | 3 |  31:0 | **RELAY_DATA1** |                                            |
+ *  +---+-------+-----------------+                                            |
+ *  |...|       |                 |       [Embedded `Relay Message`_]          |
+ *  +---+-------+-----------------+                                            |
+ *  | n |  31:0 | **RELAY_DATAx** |                                            |
+ *  +---+-------+-----------------+--------------------------------------------+
+ */
+#define XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF		0x5100
+
+#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN		(GUC_HXG_EVENT_MSG_MIN_LEN + 2u)
+#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_MAX_LEN \
+	(GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MAX_LEN)
+#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_0_MBZ		GUC_HXG_EVENT_MSG_0_DATA0
+#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_1_VFID		GUC_HXG_EVENT_MSG_n_DATAn
+#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_2_RELAY_ID	GUC_HXG_EVENT_MSG_n_DATAn
+#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_3_RELAY_DATA1	GUC_HXG_EVENT_MSG_n_DATAn
+#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_n_RELAY_DATAx	GUC_HXG_EVENT_MSG_n_DATAn
+#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_NUM_RELAY_DATA	GUC_RELAY_MSG_MAX_LEN
+
+/**
+ * DOC: PF2GUC_RELAY_TO_VF
+ *
+ * This H2G message is used by the Physical Function (PF) driver to send embedded
+ * VF2PF `Relay Message`_ to the VF.
+ *
+ * This action message must be sent over CTB as `CTB HXG Message`_.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = `GUC_HXG_TYPE_FAST_REQUEST`_                          |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | MBZ                                                          |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`XE_GUC_ACTION_PF2GUC_RELAY_TO_VF` = 0x5101        |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | **VFID** - target VF identifier                              |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 2 |  31:0 | **RELAY_ID** - VF/PF message ID                              |
+ *  +---+-------+-----------------+--------------------------------------------+
+ *  | 3 |  31:0 | **RELAY_DATA1** |                                            |
+ *  +---+-------+-----------------+                                            |
+ *  |...|       |                 |       [Embedded `Relay Message`_]          |
+ *  +---+-------+-----------------+                                            |
+ *  | n |  31:0 | **RELAY_DATAx** |                                            |
+ *  +---+-------+-----------------+--------------------------------------------+
+ */
+#define XE_GUC_ACTION_PF2GUC_RELAY_TO_VF		0x5101
+
+#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_MIN_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 2u)
+#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_MAX_LEN \
+	(PF2GUC_RELAY_TO_VF_REQUEST_MSG_MIN_LEN + GUC_RELAY_MSG_MAX_LEN)
+#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
+#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_1_VFID		GUC_HXG_REQUEST_MSG_n_DATAn
+#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_2_RELAY_ID	GUC_HXG_REQUEST_MSG_n_DATAn
+#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_3_RELAY_DATA1	GUC_HXG_REQUEST_MSG_n_DATAn
+#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_n_RELAY_DATAx	GUC_HXG_REQUEST_MSG_n_DATAn
+#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_NUM_RELAY_DATA	GUC_RELAY_MSG_MAX_LEN
+
+/**
+ * DOC: GUC2VF_RELAY_FROM_PF
+ *
+ * This message is used by the GuC firmware to deliver `Relay Message`_ from the
+ * Physical Function (PF) driver to this Virtual Function (VF) driver.
+ * See `GuC Relay Communication`_ for details.
+ *
+ * This message is always sent over CTB.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_EVENT_                                   |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | MBZ                                                          |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF` = 0x5102      |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | **RELAY_ID** - VF/PF message ID                              |
+ *  +---+-------+-----------------+--------------------------------------------+
+ *  | 2 |  31:0 | **RELAY_DATA1** |                                            |
+ *  +---+-------+-----------------+                                            |
+ *  |...|       |                 |       [Embedded `Relay Message`_]          |
+ *  +---+-------+-----------------+                                            |
+ *  | n |  31:0 | **RELAY_DATAx** |                                            |
+ *  +---+-------+-----------------+--------------------------------------------+
+ */
+#define XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF		0x5102
+
+#define GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN		(GUC_HXG_EVENT_MSG_MIN_LEN + 1u)
+#define GUC2VF_RELAY_FROM_PF_EVENT_MSG_MAX_LEN \
+	(GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MAX_LEN)
+#define GUC2VF_RELAY_FROM_PF_EVENT_MSG_0_MBZ		GUC_HXG_EVENT_MSG_0_DATA0
+#define GUC2VF_RELAY_FROM_PF_EVENT_MSG_1_RELAY_ID	GUC_HXG_EVENT_MSG_n_DATAn
+#define GUC2VF_RELAY_FROM_PF_EVENT_MSG_n_RELAY_DATAx	GUC_HXG_EVENT_MSG_n_DATAn
+#define GUC2VF_RELAY_FROM_PF_EVENT_MSG_NUM_RELAY_DATA	GUC_RELAY_MSG_MAX_LEN
+
+/**
+ * DOC: VF2GUC_RELAY_TO_PF
+ *
+ * This message is used by the Virtual Function (VF) drivers to communicate with
+ * the Physical Function (PF) driver and send `Relay Message`_ to the PF driver.
+ * See `GuC Relay Communication`_ for details.
+ *
+ * This message must be sent over CTB.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_ or GUC_HXG_TYPE_FAST_REQUEST_   |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | MBZ                                                          |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`XE_GUC_ACTION_VF2GUC_RELAY_TO_PF` = 0x5103        |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | **RELAY_ID** - VF/PF message ID                              |
+ *  +---+-------+-----------------+--------------------------------------------+
+ *  | 2 |  31:0 | **RELAY_DATA1** |                                            |
+ *  +---+-------+-----------------+                                            |
+ *  |...|       |                 |       [Embedded `Relay Message`_]          |
+ *  +---+-------+-----------------+                                            |
+ *  | n |  31:0 | **RELAY_DATAx** |                                            |
+ *  +---+-------+-----------------+--------------------------------------------+
+ */
+#define XE_GUC_ACTION_VF2GUC_RELAY_TO_PF		0x5103
+
+#define VF2GUC_RELAY_TO_PF_REQUEST_MSG_MIN_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 1u)
+#define VF2GUC_RELAY_TO_PF_REQUEST_MSG_MAX_LEN \
+	(VF2GUC_RELAY_TO_PF_REQUEST_MSG_MIN_LEN + GUC_RELAY_MSG_MAX_LEN)
+#define VF2GUC_RELAY_TO_PF_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
+#define VF2GUC_RELAY_TO_PF_REQUEST_MSG_1_RELAY_ID	GUC_HXG_REQUEST_MSG_n_DATAn
+#define VF2GUC_RELAY_TO_PF_REQUEST_MSG_n_RELAY_DATAx	GUC_HXG_REQUEST_MSG_n_DATAn
+#define VF2GUC_RELAY_TO_PF_REQUEST_MSG_NUM_RELAY_DATA	GUC_RELAY_MSG_MAX_LEN
+
+#endif
diff --git a/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
new file mode 100644
index 000000000000..747e428de421
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _ABI_GUC_RELAY_ACTIONS_ABI_H_
+#define _ABI_GUC_RELAY_ACTIONS_ABI_H_
+
+/**
+ * DOC: GuC Relay Debug Actions
+ *
+ * This range of action codes is reserved for debugging purposes only and should
+ * be used only on debug builds. These actions may not be supported by the
+ * production drivers. Their definitions could be changed in the future.
+ *
+ *  _`GUC_RELAY_ACTION_DEBUG_ONLY_START` = 0xDEB0
+ *  _`GUC_RELAY_ACTION_DEBUG_ONLY_END` = 0xDEFF
+ */
+
+#define GUC_RELAY_ACTION_DEBUG_ONLY_START	0xDEB0
+#define GUC_RELAY_ACTION_DEBUG_ONLY_END		0xDEFF
+
+/**
+ * DOC: VFXPF_TESTLOOP
+ *
+ * This `Relay Message`_ is used to selftest the `GuC Relay Communication`_.
+ *
+ * The following opcodes are defined:
+ * VFXPF_TESTLOOP_OPCODE_NOP_ will return no data.
+ * VFXPF_TESTLOOP_OPCODE_BUSY_ will reply with BUSY response first.
+ * VFXPF_TESTLOOP_OPCODE_RETRY_ will reply with RETRY response instead.
+ * VFXPF_TESTLOOP_OPCODE_ECHO_ will return same data as received.
+ * VFXPF_TESTLOOP_OPCODE_FAIL_ will always fail with error.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_ or GUC_HXG_TYPE_FAST_REQUEST_   |
+ *  |   |       | or GUC_HXG_TYPE_EVENT_                                       |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | **OPCODE**                                                   |
+ *  |   |       |    - _`VFXPF_TESTLOOP_OPCODE_NOP` = 0x0                      |
+ *  |   |       |    - _`VFXPF_TESTLOOP_OPCODE_BUSY` = 0xB                     |
+ *  |   |       |    - _`VFXPF_TESTLOOP_OPCODE_RETRY` = 0xD                    |
+ *  |   |       |    - _`VFXPF_TESTLOOP_OPCODE_ECHO` = 0xE                     |
+ *  |   |       |    - _`VFXPF_TESTLOOP_OPCODE_FAIL` = 0xF                     |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`IOV_ACTION_SELFTEST_RELAY`                        |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | **DATA1** = optional, depends on **OPCODE**:                 |
+ *  |   |       | for VFXPF_TESTLOOP_OPCODE_BUSY_: time in ms for reply        |
+ *  |   |       | for VFXPF_TESTLOOP_OPCODE_FAIL_: expected error              |
+ *  |   |       | for VFXPF_TESTLOOP_OPCODE_ECHO_: payload                     |
+ *  +---+-------+--------------------------------------------------------------+
+ *  |...|  31:0 | **DATAn** = only for **OPCODE** VFXPF_TESTLOOP_OPCODE_ECHO_  |
+ *  +---+-------+--------------------------------------------------------------+
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  27:0 | DATA0 = MBZ                                                  |
+ *  +---+-------+--------------------------------------------------------------+
+ *  |...|  31:0 | DATAn = only for **OPCODE** VFXPF_TESTLOOP_OPCODE_ECHO_      |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+#define GUC_RELAY_ACTION_VFXPF_TESTLOOP		(GUC_RELAY_ACTION_DEBUG_ONLY_START + 1)
+#define   VFXPF_TESTLOOP_OPCODE_NOP		0x0
+#define   VFXPF_TESTLOOP_OPCODE_BUSY		0xB
+#define   VFXPF_TESTLOOP_OPCODE_RETRY		0xD
+#define   VFXPF_TESTLOOP_OPCODE_ECHO		0xE
+#define   VFXPF_TESTLOOP_OPCODE_FAIL		0xF
+
+#endif
diff --git a/drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h b/drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h
new file mode 100644
index 000000000000..f92625f04796
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _ABI_GUC_RELAY_COMMUNICATION_ABI_H
+#define _ABI_GUC_RELAY_COMMUNICATION_ABI_H
+
+#include <linux/build_bug.h>
+
+#include "guc_actions_sriov_abi.h"
+#include "guc_communication_ctb_abi.h"
+#include "guc_messages_abi.h"
+
+/**
+ * DOC: GuC Relay Communication
+ *
+ * The communication between Virtual Function (VF) drivers and Physical Function
+ * (PF) drivers is based on the GuC firmware acting as a proxy (relay) agent.
+ *
+ * To communicate with the PF driver, VF's drivers use `VF2GUC_RELAY_TO_PF`_
+ * action that takes the `Relay Message`_ as opaque payload and requires the
+ * relay message identifier (RID) as additional parameter.
+ *
+ * This identifier is used by the drivers to match related messages.
+ *
+ * The GuC forwards this `Relay Message`_ and its identifier to the PF driver
+ * in `GUC2PF_RELAY_FROM_VF`_ action. This event message additionally contains
+ * the identifier of the origin VF (VFID).
+ *
+ * Likewise, to communicate with the VF drivers, PF driver use
+ * `VF2GUC_RELAY_TO_PF`_ action that in addition to the `Relay Message`_
+ * and the relay message identifier (RID) also takes the target VF identifier.
+ *
+ * The GuC uses this target VFID from the message to select where to send the
+ * `GUC2VF_RELAY_FROM_PF`_ with the embedded `Relay Message`_ with response::
+ *
+ *      VF                             GuC                              PF
+ *      |                               |                               |
+ *     [ ] VF2GUC_RELAY_TO_PF           |                               |
+ *     [ ]---------------------------> [ ]                              |
+ *     [ ] { rid, msg }                [ ]                              |
+ *     [ ]                             [ ] GUC2PF_RELAY_FROM_VF         |
+ *     [ ]                             [ ]---------------------------> [ ]
+ *     [ ]                              |  { VFID, rid, msg }          [ ]
+ *     [ ]                              |                              [ ]
+ *     [ ]                              |           PF2GUC_RELAY_TO_VF [ ]
+ *     [ ]                             [ ] <---------------------------[ ]
+ *     [ ]                             [ ]        { VFID, rid, reply }  |
+ *     [ ]        GUC2VF_RELAY_FROM_PF [ ]                              |
+ *     [ ] <---------------------------[ ]                              |
+ *      |               { rid, reply }  |                               |
+ *      |                               |                               |
+ *
+ * It is also possible that PF driver will initiate communication with the
+ * selected VF driver. The same GuC action messages will be used::
+ *
+ *      VF                             GuC                              PF
+ *      |                               |                               |
+ *      |                               |           PF2GUC_RELAY_TO_VF [ ]
+ *      |                              [ ] <---------------------------[ ]
+ *      |                              [ ]          { VFID, rid, msg } [ ]
+ *      |         GUC2VF_RELAY_FROM_PF [ ]                             [ ]
+ *     [ ] <---------------------------[ ]                             [ ]
+ *     [ ]                { rid, msg }  |                              [ ]
+ *     [ ]                              |                              [ ]
+ *     [ ] VF2GUC_RELAY_TO_PF           |                              [ ]
+ *     [ ]---------------------------> [ ]                             [ ]
+ *      |  { rid, reply }              [ ]                             [ ]
+ *      |                              [ ] GUC2PF_RELAY_FROM_VF        [ ]
+ *      |                              [ ]---------------------------> [ ]
+ *      |                               | { VFID, rid, reply }          |
+ *      |                               |                               |
+ */
+
+/**
+ * DOC: Relay Message
+ *
+ * The `Relay Message`_ is used by Physical Function (PF) driver and Virtual
+ * Function (VF) drivers to communicate using `GuC Relay Communication`_.
+ *
+ * Format of the `Relay Message`_ follows format of the generic `HXG Message`_.
+ *
+ *  +--------------------------------------------------------------------------+
+ *  |  `Relay Message`_                                                        |
+ *  +==========================================================================+
+ *  |  `HXG Message`_                                                          |
+ *  +--------------------------------------------------------------------------+
+ *
+ * Maximum length of the `Relay Message`_ is limited by the maximum length of
+ * the `CTB HXG Message`_ and format of the `GUC2PF_RELAY_FROM_VF`_ message.
+ */
+
+#define GUC_RELAY_MSG_MIN_LEN GUC_HXG_MSG_MIN_LEN
+#define GUC_RELAY_MSG_MAX_LEN \
+	(GUC_CTB_MAX_DWORDS - GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN)
+
+static_assert(PF2GUC_RELAY_TO_VF_REQUEST_MSG_MIN_LEN >
+	      VF2GUC_RELAY_TO_PF_REQUEST_MSG_MIN_LEN);
+
+/**
+ * DOC: Relay Error Codes
+ *
+ * The `GuC Relay Communication`_ can be used to pass `Relay Message`_ between
+ * drivers that run on different Operating Systems. To help in troubleshooting,
+ * `GuC Relay Communication`_ uses error codes that mostly match errno values.
+ */
+
+#define GUC_RELAY_ERROR_UNDISCLOSED			0
+#define GUC_RELAY_ERROR_OPERATION_NOT_PERMITTED		1	/* EPERM */
+#define GUC_RELAY_ERROR_PERMISSION_DENIED		13	/* EACCES */
+#define GUC_RELAY_ERROR_INVALID_ARGUMENT		22	/* EINVAL */
+#define GUC_RELAY_ERROR_INVALID_REQUEST_CODE		56	/* EBADRQC */
+#define GUC_RELAY_ERROR_NO_DATA_AVAILABLE		61	/* ENODATA */
+#define GUC_RELAY_ERROR_PROTOCOL_ERROR			71	/* EPROTO */
+#define GUC_RELAY_ERROR_MESSAGE_SIZE			90	/* EMSGSIZE */
+
+#endif
-- 
2.25.1

