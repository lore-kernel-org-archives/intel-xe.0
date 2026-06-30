Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E79C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 13:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170A210E1A3;
	Tue, 30 Jun 2026 13:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGFVIqmT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABE410E9FC
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 13:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782826012; x=1814362012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=csc1bsTLmC+fNTGTES8+AZO47Fmr5dkBds1tfjGjPwo=;
 b=bGFVIqmTkfQnwjOpCj5AmtZErrNjf1F2ECuJakV2dAF1AE3H8CzP1CH8
 2oFr0QfTcyCMwohsJMVD8ZpVyki29oO1rNAVTHWQkeLy5R4SqKgWSz/AF
 Rbp5vqh5O8woZoTxBcJ2yMRTVZhHTROFoPEJneqTn3QSxXtSIlWG349+h
 8HPqtnG1E15VMaR3nkk3ihvsuUU1EIhMksRAHCof38ULG1pCpWsnBT4DP
 xJe+XMKTxpVMAQESpOniNsVwKU4YO+uaLyG/RoWihAOIoryrC27Z8Quw2
 ImDuNFQuOOtVMqLVkrPCYMnhKqzUsXDTv9TdG5kUxhqPd3jLEGRDqdJm1 A==;
X-CSE-ConnectionGUID: eCLlO72ERYSBEuE6zQZMxg==
X-CSE-MsgGUID: Gx4Xbd1qTJ6YGS9dPZG7Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83623519"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="83623519"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:52 -0700
X-CSE-ConnectionGUID: N+e3kwi2R+q5ZOUwNkBMKg==
X-CSE-MsgGUID: a8Er7/70RcW5IQbkDOQDww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="256182218"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:51 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 07/13] drm/xe/guc: Formalize Reserved KLVs
Date: Tue, 30 Jun 2026 15:26:26 +0200
Message-ID: <20260630132633.32804-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630132633.32804-1-michal.wajdeczko@intel.com>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
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

We have already started using few KLV keys from the 0xF000 range
that, as we have agreed with the GuC team, will not be used in any
GuC ABI actions. Add definitions for that reserved range and move
our migration KLVs to new ABI header.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h       | 17 +++++++++++++
 drivers/gpu/drm/xe/abi/xe_driver_klvs_abi.h | 27 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c     | 14 +++++++++++
 drivers/gpu/drm/xe/xe_sriov_packet.c        |  7 ++----
 4 files changed, 60 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/xe_driver_klvs_abi.h

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 644f5a4226d7..2a313eb399e2 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -22,6 +22,7 @@
  *  |   |       |   - `GuC Scheduling Policies KLVs`_                          |
  *  |   |       |   - `GuC VGT Policy KLVs`_                                   |
  *  |   |       |   - `GuC VF Configuration KLVs`_                             |
+ *  |   |       |   - `GuC Reserved KLVs`_                                     |
  *  |   |       |                                                              |
  *  |   +-------+--------------------------------------------------------------+
  *  |   |  15:0 | **LEN** - length of VALUE (in 32bit dwords)                  |
@@ -506,4 +507,20 @@ enum xe_guc_klv_ids {
 	GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG			= 0x900e,
 };
 
+/**
+ * DOC: GuC Reserved KLVs
+ *
+ * Range of `GuC KLV`_ keys reserved for internal use by the GuC that will
+ * never be part of the offcial GuC ABI and can be reused by the drivers.
+ *
+ * Currently this range includes 1024 keys starting from:
+ *
+ * _`GUC_KLV_RESERVED_RANGE_START` : 0xF000
+ *
+ * See `Xe Driver KLVs`_ for the KLVs that the Xe driver is currently using.
+ */
+
+#define GUC_KLV_RESERVED_RANGE_START	0xf000u
+#define GUC_KLV_RESERVED_RANGE_LEN	1024u
+
 #endif
diff --git a/drivers/gpu/drm/xe/abi/xe_driver_klvs_abi.h b/drivers/gpu/drm/xe/abi/xe_driver_klvs_abi.h
new file mode 100644
index 000000000000..3b557e56892a
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/xe_driver_klvs_abi.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _ABI_XE_DRIVER_KLVS_ABI_H
+#define _ABI_XE_DRIVER_KLVS_ABI_H
+
+#include "abi/guc_klvs_abi.h"
+
+/**
+ * DOC: Xe Driver KLVs
+ *
+ * The Xe driver uses the following keys from the `GuC Reserved KLVs`_ range:
+ *
+ * _`MIGRATION_KLV_DEVICE_DEVID_KEY` :
+ *      PCI device ID of the migrated VF.
+ * _`MIGRATION_KLV_DEVICE_REVID_KEY` :
+ *      PCI device revision ID of the migrated VF.
+ */
+
+#define MIGRATION_KLV_DEVICE_DEVID_KEY		0xf001u
+#define MIGRATION_KLV_DEVICE_DEVID_LEN		1u
+#define MIGRATION_KLV_DEVICE_REVID_KEY		0xf002u
+#define MIGRATION_KLV_DEVICE_REVID_LEN		1u
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index d610ab75aecc..3f5c88e2c949 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -8,6 +8,7 @@
 #include <drm/drm_print.h>
 
 #include "abi/guc_klvs_abi.h"
+#include "abi/xe_driver_klvs_abi.h"
 #include "xe_guc_klv_helpers.h"
 #include "xe_guc_klv_thresholds_set.h"
 
@@ -19,6 +20,11 @@ static bool is_group_key(u16 key)
 	return false;
 }
 
+static bool is_reserved_key(u16 key)
+{
+	return in_range(key, GUC_KLV_RESERVED_RANGE_START, GUC_KLV_RESERVED_RANGE_LEN);
+}
+
 /**
  * xe_guc_klv_key_to_string - Convert KLV key into friendly name.
  * @key: the `GuC KLV`_ key
@@ -78,7 +84,15 @@ const char *xe_guc_klv_key_to_string(u16 key)
 	MAKE_XE_GUC_KLV_THRESHOLDS_SET(define_threshold_key_to_string_case)
 #undef define_threshold_key_to_string_case
 
+	/* driver KLVs */
+	case MIGRATION_KLV_DEVICE_DEVID_KEY:
+		return "migration_devid";
+	case MIGRATION_KLV_DEVICE_REVID_KEY:
+		return "migration_revid";
+
 	default:
+		if (is_reserved_key(key))
+			return "(reserved)";
 		return "(unknown)";
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
index 2ae9eff2a7c0..e581e8e6c1d1 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.c
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -3,6 +3,8 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include "abi/xe_driver_klvs_abi.h"
+
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_guc_klv_helpers.h"
@@ -352,11 +354,6 @@ ssize_t xe_sriov_packet_write_single(struct xe_device *xe, unsigned int vfid,
 	return copied;
 }
 
-#define MIGRATION_KLV_DEVICE_DEVID_KEY	0xf001u
-#define MIGRATION_KLV_DEVICE_DEVID_LEN	1u
-#define MIGRATION_KLV_DEVICE_REVID_KEY	0xf002u
-#define MIGRATION_KLV_DEVICE_REVID_LEN	1u
-
 #define MIGRATION_DESCRIPTOR_DWORDS	(GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_DEVID_LEN + \
 					 GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_REVID_LEN)
 static int pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
-- 
2.47.1

