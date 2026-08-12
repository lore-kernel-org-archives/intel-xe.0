Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08F5C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7640A10F0D9;
	Wed, 12 Aug 2026 19:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPccYQAr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F75010E45F
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562109; x=1818098109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XjqMQbyscL87V27pZBDoVrQJHJVb9tSRlOYWig3u8cw=;
 b=OPccYQArFkW7hNZtbuXKCchgAQpTZHDYr+kcoBLXn5NWuBIRN8dLHT+O
 U+qNkzGEHXhYVNyqlm0KyHsyVGLIBD81If1KNJWAgRIBq6jZkb/dmob5C
 EcidUz21LvUuWCjvl4nK41fMVV+DFZBzNlwqjOs8lRDBN0xkD2jP8JdcB
 07Zdnxsx42RhOkLIPVxjHCd1Le93QePBEE3GfOnkPTPgQcwam1XJQ7P/O
 RND1DrmZxBh2cPpjDJpo1sWXdzIWcU5jaxtBqcRFxKZvARt3vnjNwTR9U
 ZQWHsg4xanzGGfsfWQmpR8sbVW7lGReGzyY08r/+QqVaqi8DWKxg2aj3o g==;
X-CSE-ConnectionGUID: loY/+zUDQICF+4R7yM44iw==
X-CSE-MsgGUID: ZbT2/bTdTPiPFhjzXgN1bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987501"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987501"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:09 -0700
X-CSE-ConnectionGUID: U1bym8qZTGG3eRO3xJMQag==
X-CSE-MsgGUID: 1m3UXNx2QOiLtSR49a9HKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268891872"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v4 03/32] drm/xe/log: Introduce structured component/location
 identifiers
Date: Wed, 12 Aug 2026 21:14:19 +0200
Message-ID: <20260812191450.11690-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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

Introduce structured identifiers for each component type that
could emit a SIGID log entry and for their locations. We plan
to store those IDs in the CPER records for better filtering.
Define also structured identifiers for the supported locations.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
v2: fix typo, define reserved ids (Michal)
v3: fix kernel-doc to match code (Sashiko)
v4: update comment (Michal)
---
 drivers/gpu/drm/xe/abi/xe_log_abi.h | 187 ++++++++++++++++++++++++++++
 1 file changed, 187 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/xe_log_abi.h

diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
new file mode 100644
index 000000000000..92547805326f
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
@@ -0,0 +1,187 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _ABI_XE_LOG_ABI_H_
+#define _ABI_XE_LOG_ABI_H_
+
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+
+#include "abi/xe_sigid_abi.h"
+
+/**
+ * enum xe_log_component_bits - bits for components structure definitions
+ *
+ * Component identifiers are structured based on::
+ *
+ *     COMPONENT = CLASS(8b).TYPE(8b)
+ *
+ * and the structure looks like this::
+ *
+ *     ├── SYSTEM(0)
+ *     │   └── ...
+ *     ├── DRIVER(1)
+ *     │   └── ...
+ *     ├── FEATURE(2)
+ *     │   └── ...
+ *     ├── FIRMWARE(4)
+ *     │   └── ...
+ *     └── HARDWARE(8)
+ *         └── ...
+ *
+ * Examples::
+ *
+ *     COMPONENT(0.type) = SYSTEM.type = system component
+ *     COMPONENT(1.type) = DRIVER.type = driver core component
+ *     COMPONENT(3.type) = DRIVER_FEATURE.type = driver feature
+ *     COMPONENT(5.type) = DRIVER_FIRMWARE.type = firmware driver component
+ *     COMPONENT(9.type) = DRIVER_HARDWARE.type = hardware driver component
+ *
+ */
+enum xe_log_component_bits {
+	/* private: */
+	XE_LOG_COMPONENT_CLASS_MASK = GENMASK_U16(7, 0),
+	XE_LOG_COMPONENT_TYPE_MASK = GENMASK_U16(15, 8),
+	/* private: component classes */
+	XE_LOG_COMPONENT_CLASS_SYSTEM = 0u,
+	XE_LOG_COMPONENT_CLASS_DRIVER = 1u,
+	XE_LOG_COMPONENT_CLASS_FEATURE = 2u,
+	XE_LOG_COMPONENT_CLASS_FIRMWARE = 4u,
+	XE_LOG_COMPONENT_CLASS_HARDWARE = 8u,
+	XE_LOG_COMPONENT_CLASS_DRIVER_FEATURE = XE_LOG_COMPONENT_CLASS_DRIVER |
+						XE_LOG_COMPONENT_CLASS_FEATURE,
+	XE_LOG_COMPONENT_CLASS_DRIVER_FIRMWARE = XE_LOG_COMPONENT_CLASS_DRIVER |
+						 XE_LOG_COMPONENT_CLASS_FIRMWARE,
+	XE_LOG_COMPONENT_CLASS_DRIVER_HARDWARE = XE_LOG_COMPONENT_CLASS_DRIVER |
+						 XE_LOG_COMPONENT_CLASS_HARDWARE,
+	/* private: reserved identifiers */
+	XE_LOG_COMPONENT_NONE = 0u,
+};
+
+#define MAKE_XE_LOG_COMPONENT(_CLASS, type) \
+	(FIELD_PREP_CONST(XE_LOG_COMPONENT_CLASS_MASK, \
+			  XE_LOG_COMPONENT_CLASS_##_CLASS) | \
+	 FIELD_PREP_CONST(XE_LOG_COMPONENT_TYPE_MASK, (type)))
+
+/**
+ * enum xe_log_location_bits - bits for location structure definitions
+ *
+ * Location identifiers are structured based on::
+ *
+ *     LOCATION = TYPE(8b).ID(8b)
+ *
+ * and the structure looks like this::
+ *
+ *     ├── DEVICE(0)
+ *     │   └── MBZ(0)
+ *     ├── TILE(1)
+ *     │   ├── Tile0(0)
+ *     │   ├── ...
+ *     │   └── TileN(n)
+ *     ├── GT(1)
+ *     │   ├── GT0(0)
+ *     │   ├── ...
+ *     │   └── GTn(n)
+ *     └── ...
+ *
+ * Examples::
+ *
+ *     LOCATION(0.0) = NONE
+ *     LOCATION(1.0) = DEVICE.0 = "Device"
+ *     LOCATION(2.1) = TILE.1 = "Tile1"
+ *     LOCATION(3.2) = GT.2 = "GT2"
+ *
+ */
+enum xe_log_location_bits {
+	/* private: */
+	XE_LOG_LOCATION_TYPE_MASK = GENMASK_U16(7, 0),
+	XE_LOG_LOCATION_ID_MASK = GENMASK_U16(15, 8),
+	/* private: location types */
+	XE_LOG_LOCATION_TYPE_DEVICE = 1u,
+	XE_LOG_LOCATION_TYPE_TILE = 2u,
+	XE_LOG_LOCATION_TYPE_GT = 3u,
+	/* private: reserved identifiers */
+	XE_LOG_LOCATION_NONE = 0u,
+};
+
+#define PREP_XE_LOG_LOCATION(type, id) \
+	(FIELD_PREP(XE_LOG_LOCATION_TYPE_MASK, (type)) | \
+	 FIELD_PREP(XE_LOG_LOCATION_ID_MASK, (id)))
+
+#define MAKE_XE_LOG_LOCATION(_TYPE, id) \
+	PREP_XE_LOG_LOCATION(XE_LOG_LOCATION_TYPE_##_TYPE, (id))
+
+/**
+ * DEFINE_XE_LOG_COMPONENTS() - Define log components.
+ * @define: name of the inner macro to expand.
+ *
+ * Use this super macro to define custom code for the log components.
+ * The following parameters are available for each component::
+ *
+ *     define(CLASS, ID, TAG, SIGID, NAME)
+ *
+ * where:
+ *
+ *     @CLASS is the component class name (without the XE_LOG_COMPONENT_CLASS_ prefix)
+ *     @ID is the unique component identifier within @CLASS
+ *     @TAG is unique component tag (across all components)
+ *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
+ */
+#define DEFINE_XE_LOG_COMPONENTS(define) \
+	/* */									\
+	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
+	define(SYSTEM, 2, DRM, SW, "DRM")					\
+	/* */									\
+	define(DRIVER, 1, XE, SW, "Xe Driver")					\
+	define(DRIVER, 2, PROBE, PROBE, "Driver Initialization")		\
+	define(DRIVER, 3, WEDGED, WEDGED, "Device Malfunction")			\
+	define(DRIVER, 4, RTP, SW, "Register Table Processing")			\
+	define(DRIVER, 5, WA, SW, "Workarounds")				\
+	define(DRIVER, 6, PAGEFAULT, MEM_FAULT, "Page Fault")			\
+	/* */									\
+	define(DRIVER_HARDWARE, 1, REGS, IO_BUS, "Registers")			\
+	define(DRIVER_HARDWARE, 2, GGTT, IO_BUS, "Global GTT")			\
+	define(DRIVER_HARDWARE, 3, GT, GT_TDR, "Graphics Technology")		\
+	define(DRIVER_HARDWARE, 4, LMTT, IO_BUS, "LMEM Translation Table")	\
+	define(DRIVER_HARDWARE, 5, MEMIRQ, IO_BUS, "Memory Based IRQ")		\
+	/* */									\
+	define(DRIVER_FEATURE, 1, PF, SW, "SR-IOV Physical Function")		\
+	define(DRIVER_FEATURE, 2, VF, SW, "SR-IOV Virtual Function")		\
+	define(DRIVER_FEATURE, 3, SURVIVABILITY, SURVIVABILITY, "Survivability") \
+	define(DRIVER_FEATURE, 4, RAS, SW, "Reliability, Accessibility, Serviceability") \
+	/* */									\
+	define(DRIVER_FIRMWARE, 1, GUC, RUNTIME_FW, "GuC")			\
+	define(DRIVER_FIRMWARE, 2, HUC, RUNTIME_FW, "HuC")			\
+	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
+	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
+	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
+	/* eod */
+
+/**
+ * enum xe_log_component_tags - TAGs of all supported components
+ */
+enum xe_log_component_tags {
+	/* private: */
+#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
+	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
+	/* eod */
+	DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_ENUM)
+#undef MAKE_XE_LOG_COMPONENT_ENUM
+};
+
+/**
+ * enum xe_log_component_sigids - SIGIDs of all supported components
+ */
+enum xe_log_component_sigids {
+	/* private: */
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */
+	DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_SIGID)
+#undef MAKE_XE_LOG_COMPONENT_SIGID
+};
+
+#endif
-- 
2.47.1

