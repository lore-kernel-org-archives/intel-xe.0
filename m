Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2198DC04FFE
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 15:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D9C10F9D1;
	Thu, 18 Apr 2024 15:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4A6gvJg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEFC10EFA1
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 15:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713454090; x=1744990090;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gti9xM6mg4l/atlTLf8tc0Qn4brFMHfe59kWp1Re8l0=;
 b=O4A6gvJg8J4cO0rZvTFifgMg0DVcLO6XvrMLyCZ/T0og0bdIJfPfIjAD
 yrA0lyUJPFv/TRN+R2OOMjFzaryMa/JJGHobcfP1qAMiXqf+mzwSyQMeE
 sNPmSgXORByer2EPjQcUjtFdqcAWUFOpaIfX6Hu51N4krk9v3k7nmANDY
 Hl0MbPT4hP4QXpDYwBMUbcdT1LTDu4OXI5G+2h8hzCAl3yJS4L1GRkp+9
 Q9hjnebWcg5DbI3X0T9C6EHIzNtcNsIqEDslM0oJOxzcNPH0ZO00MKJxv
 7H+c7N8gJHhcxx3FGjqjxScW8nYQCtiS2W8+4dIu7Raw05CDJODBMiRnf Q==;
X-CSE-ConnectionGUID: 7kCr7ll8QuqV82oewiKQRw==
X-CSE-MsgGUID: 5tkOrqozQuahfA943b8ssw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8873717"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8873717"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:28:10 -0700
X-CSE-ConnectionGUID: wQIYolyORAGwBPBL4+5oiw==
X-CSE-MsgGUID: mEPnurr6Tg6bA7cCZxzQiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="54205898"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.62.251])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:28:10 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/5] drm/xe/guc: Add GuC Relay ABI version 1.0 definitions
Date: Thu, 18 Apr 2024 17:27:58 +0200
Message-Id: <20240418152802.182-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240418152802.182-1-michal.wajdeczko@intel.com>
References: <20240418152802.182-1-michal.wajdeczko@intel.com>
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

This initial GuC Relay ABI specification includes messages for ABI
version negotiation and to query values of runtime/fuse registers.

We will start handling those messages on the PF driver soon.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/abi/guc_relay_actions_abi.h    | 147 +++++++++++++++++-
 1 file changed, 146 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
index 747e428de421..05a2066ef7f7 100644
--- a/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
@@ -1,11 +1,156 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright © 2023-2024 Intel Corporation
  */
 
 #ifndef _ABI_GUC_RELAY_ACTIONS_ABI_H_
 #define _ABI_GUC_RELAY_ACTIONS_ABI_H_
 
+#include "abi/guc_relay_communication_abi.h"
+
+/**
+ * DOC: GuC Relay VF/PF ABI Version
+ *
+ * The _`GUC_RELAY_VERSION_BASE` defines minimum VF/PF ABI version that
+ * drivers must support. Currently this is version 1.0.
+ *
+ * The _`GUC_RELAY_VERSION_LATEST` defines latest VF/PF ABI version that
+ * drivers may use. Currently this is version 1.0.
+ *
+ * Some platforms may require different base VF/PF ABI version.
+ * No supported VF/PF ABI version can be 0.0.
+ */
+
+#define GUC_RELAY_VERSION_BASE_MAJOR			1
+#define GUC_RELAY_VERSION_BASE_MINOR			0
+
+#define GUC_RELAY_VERSION_LATEST_MAJOR			1
+#define GUC_RELAY_VERSION_LATEST_MINOR			0
+
+/**
+ * DOC: GuC Relay Actions
+ *
+ * The following actions are supported from VF/PF ABI version 1.0:
+ *
+ *  * `VF2PF_HANDSHAKE`_
+ *  * `VF2PF_QUERY_RUNTIME`_
+ */
+
+/**
+ * DOC: VF2PF_HANDSHAKE
+ *
+ * This `Relay Message`_ is used by the VF to establish ABI version with the PF.
+ *
+ * This message definition shall be supported by all future ABI versions.
+ * This message definition shall not be changed by future ABI versions.
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
+ *  |   |  15:0 | ACTION = _`GUC_RELAY_ACTION_VF2PF_HANDSHAKE` = 0x0001        |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 | 31:16 | **MAJOR** - requested major version of the VFPF interface    |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | **MINOR** - requested minor version of the VFPF interface    |
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
+ *  | 1 | 31:16 | **MAJOR** - agreed major version of the VFPF interface       |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | **MINOR** - agreed minor version of the VFPF interface       |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+#define GUC_RELAY_ACTION_VF2PF_HANDSHAKE		0x0001u
+
+#define VF2PF_HANDSHAKE_REQUEST_MSG_LEN			2u
+#define VF2PF_HANDSHAKE_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
+#define VF2PF_HANDSHAKE_REQUEST_MSG_1_MAJOR		(0xffffu << 16)
+#define   VF2PF_HANDSHAKE_MAJOR_ANY			0
+#define VF2PF_HANDSHAKE_REQUEST_MSG_1_MINOR		(0xffffu << 0)
+#define   VF2PF_HANDSHAKE_MINOR_ANY			0
+
+#define VF2PF_HANDSHAKE_RESPONSE_MSG_LEN		2u
+#define VF2PF_HANDSHAKE_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
+#define VF2PF_HANDSHAKE_RESPONSE_MSG_1_MAJOR		(0xffffu << 16)
+#define VF2PF_HANDSHAKE_RESPONSE_MSG_1_MINOR		(0xffffu << 0)
+
+/**
+ * DOC: VF2PF_QUERY_RUNTIME
+ *
+ * This `Relay Message`_ is used by the VF to query values of runtime registers.
+ *
+ * This message definition is supported from ABI versions 1.0.
+ *
+ * VF provides @START index to the requested register entry.
+ * VF can use @LIMIT to limit number of returned register entries.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | DATA0 = **LIMIT** - limit number of returned entries         |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`GUC_RELAY_ACTION_VF2PF_QUERY_RUNTIME` = 0x0101    |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | DATA1 = **START** - index of the first requested entry       |
+ *  +---+-------+--------------------------------------------------------------+
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  27:0 | DATA0 = **COUNT** - number of entries included in response   |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | DATA1 = **REMAINING** - number of remaining entries          |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 2 |  31:0 | DATA2 = **REG_OFFSET** - offset of register[START]           |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 3 |  31:0 | DATA3 = **REG_VALUE** - value of register[START]             |
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   |       |                                                              |
+ *  +---+-------+--------------------------------------------------------------+
+ *  |n-1|  31:0 | REG_OFFSET - offset of register[START + x]                   |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | n |  31:0 | REG_VALUE - value of register[START + x]                     |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+#define GUC_RELAY_ACTION_VF2PF_QUERY_RUNTIME		0x0101u
+
+#define VF2PF_QUERY_RUNTIME_REQUEST_MSG_LEN		2u
+#define VF2PF_QUERY_RUNTIME_REQUEST_MSG_0_LIMIT		GUC_HXG_REQUEST_MSG_0_DATA0
+#define VF2PF_QUERY_RUNTIME_REQUEST_MSG_1_START		GUC_HXG_REQUEST_MSG_n_DATAn
+
+#define VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN	(GUC_HXG_MSG_MIN_LEN + 1u)
+#define VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MAX_LEN	\
+		(VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN + VF2PF_QUERY_RUNTIME_MAX_COUNT * 2)
+#define VF2PF_QUERY_RUNTIME_RESPONSE_MSG_0_COUNT	GUC_HXG_RESPONSE_MSG_0_DATA0
+#define   VF2PF_QUERY_RUNTIME_MIN_COUNT			0
+#define   VF2PF_QUERY_RUNTIME_MAX_COUNT			\
+		((GUC_RELAY_MSG_MAX_LEN - VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN) / 2)
+#define VF2PF_QUERY_RUNTIME_RESPONSE_MSG_1_REMAINING	GUC_HXG_RESPONSE_MSG_n_DATAn
+#define VF2PF_QUERY_RUNTIME_RESPONSE_DATAn_REG_OFFSETx	GUC_HXG_RESPONSE_MSG_n_DATAn
+#define VF2PF_QUERY_RUNTIME_RESPONSE_DATAn_REG_VALUEx	GUC_HXG_RESPONSE_MSG_n_DATAn
+
 /**
  * DOC: GuC Relay Debug Actions
  *
-- 
2.43.0

