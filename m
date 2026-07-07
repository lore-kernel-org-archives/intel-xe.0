Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F8EC43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A556610EF23;
	Tue,  7 Jul 2026 22:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zr+9xv26";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2D410EF23
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 22:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783462116; x=1814998116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hIgLkWGnaTF9DZDMHmcvDFJ9zGYa+4zLm+LuQRRgmj4=;
 b=Zr+9xv26duy8iAYoggdNetYIOe2pQg2pH3kS4iOEaaglOviNE8qcPGhR
 FNLB+oR/any9lxyiWEJj9hIVwRVbyQ1JI9XillYubGdemGzyQZBKl59L5
 02wLepdle1uItq84T0QOlnKMJCqszzxmaW41dejA221RLdBx20ajGtRhS
 JGWX4Cva38znnva9FEZW/8ZjdqCAudilXiSepw6OETjZBMsLCRbJQJgWx
 FVulKVHocgH0T7OAimWeXxfanljzxQqQ6tKZlgRD84AZhu2pI5ejtMkkO
 H8p6e2SqmFTq0OOKwZQApFbirMql+Co5Um4T04axWlN63cNgobKB3COXV w==;
X-CSE-ConnectionGUID: oEcOlDF/RTil84xOFGEWnw==
X-CSE-MsgGUID: GAfQbNe/Q4WYUdqGoZzlzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84176541"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84176541"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:36 -0700
X-CSE-ConnectionGUID: HhbiSUSsTPeGyVbVFdufzw==
X-CSE-MsgGUID: ZbPgJ7uPRx2WaUOBUslUHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278487670"
Received: from ssharm2x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.34.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v2 07/13] drm/xe/guc: Formalize Reserved KLVs
Date: Wed,  8 Jul 2026 00:08:09 +0200
Message-ID: <20260707220816.677-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707220816.677-1-michal.wajdeczko@intel.com>
References: <20260707220816.677-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
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
index 723fc6894c37..9225a9066b8a 100644
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

