Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DD7C87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 01:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D996610E5C1;
	Tue, 22 Jul 2025 01:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NhYqwEhD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF1810E3CE
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 01:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753148196; x=1784684196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=INoqQ1Aqx8anve9gnT1TlErfYzybK8v/nfrrk/ZuE88=;
 b=NhYqwEhDI1gQFtEz/Pkd1zq9oxYkgazRukBe9Z4Bktke+dLPG9brWMUF
 7XO3b5V5TktskQi644G+cBJt0NF8sRPi6UdFw50/u+eVhsuAXQCycczg/
 K+u8aIG8FRH5/mgicIbimY1adZMBV5BEzfy+r6mvyYXIL7PyXAO9exTkJ
 HIkym7q7QRlqxJbCTtanSITQ+RE3wkSacyV07N3EEbmFwAVdoliwdxMme
 ByECgzD0EnbR20h2m4axeJCFpmRAIrdvx6/uDJo/hNar2jvQd9OyXkCpD
 F21jrnJMmOe159EhBoEyX2rPJo/3L4OCY9zZbW7Y2oTTPYITQDM8K06jt A==;
X-CSE-ConnectionGUID: WtGfulkZRKucyA+010r5xg==
X-CSE-MsgGUID: 1Too0WoERamjw6D6EMMu1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="54596789"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="54596789"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 18:35:56 -0700
X-CSE-ConnectionGUID: u7sI48LkSKmPMV+x82q0xQ==
X-CSE-MsgGUID: pIkoY64GTwmjSa/RcqZ1IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="163225881"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa003.jf.intel.com with ESMTP; 21 Jul 2025 18:35:55 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v6 2/6] drm/xe/guc: Add LFD related abi definitions
Date: Mon, 21 Jul 2025 21:35:49 -0400
Message-Id: <20250722013553.1266218-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722013553.1266218-1-zhanjun.dong@intel.com>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
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

Add GuC LFD (Log Format Descriptors) related ABI definitions.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_lfd_abi.h | 282 +++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_lfd_abi.h

diff --git a/drivers/gpu/drm/xe/abi/guc_lfd_abi.h b/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
new file mode 100644
index 000000000000..b6888ab47e25
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
@@ -0,0 +1,282 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _ABI_GUC_LFD_ABI_H_
+#define _ABI_GUC_LFD_ABI_H_
+
+#include <linux/types.h>
+
+#include "guc_lic_abi.h"
+
+/* Magic keys define */
+#define GUC_LFD_DRIVER_KEY_STREAMING		0x8086AAAA474C5346
+#define GUC_LFD_LOG_BUFFER_MARKER_2		0xDEADFEED
+#define GUC_LFD_CRASH_DUMP_BUFFER_MARKER_2	0x8086DEAD
+#define GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_2	0xBEEFFEED
+#define GUC_LFD_LOG_BUFFER_MARKER_1V2		0xCABBA9E6
+#define GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0xCABBA9F7
+#define GUC_LFD_DATA_HEADER_MAGIC		0x8086
+
+/* The current major version of GuC-Log-File format. */
+#define GUC_LFD_FORMAT_VERSION_MAJOR		0x0001
+/* The current minor version of GuC-Log-File format. */
+#define GUC_LFD_FORMAT_VERSION_MINOR		0x0000
+
+/** enum guc_lfd_type - Log format descriptor type */
+enum guc_lfd_type {
+	/**
+	 * @GUC_LFD_TYPE_FW_REQUIRED_RANGE_START: Start of range for
+	 * required LFDs from GuC
+	 */
+	GUC_LFD_TYPE_FW_REQUIRED_RANGE_START = 0x1,
+	/**
+	 * @GUC_LFD_TYPE_FW_VERSION: GuC Firmware Version structure. LFDs
+	 * payload is guc_lfd_data_fw_version
+	 */
+	GUC_LFD_TYPE_FW_VERSION = GUC_LIC_TYPE_GUC_SW_VERSION,
+	/**
+	 * @GUC_LFD_TYPE_GUC_DEVICE_ID: GuC microcontroller device ID.
+	 * LFDs payload is guc_lfd_data_guc_devid
+	 */
+	GUC_LFD_TYPE_GUC_DEVICE_ID = GUC_LIC_TYPE_GUC_DEVICE_ID,
+	/**
+	 * @GUC_LFD_TYPE_TSC_FREQUENCY: Frequency of GuC timestamps. LFDs
+	 * payload is guc_lfd_data_tsc_freq
+	 */
+	GUC_LFD_TYPE_TSC_FREQUENCY = GUC_LIC_TYPE_TSC_FREQUENCY,
+	/**
+	 * @GUC_LFD_TYPE_GMD_ID: HW GMD ID. LFDs payload is
+	 * guc_lfd_data_gmdid
+	 */
+	GUC_LFD_TYPE_GMD_ID = GUC_LIC_TYPE_GMD_ID,
+	/**
+	 * @GUC_LFD_TYPE_BUILD_PLATFORM_ID: GuC build platform ID. LFDs
+	 * payload is guc_lfd_data_build_platformid
+	 */
+	GUC_LFD_TYPE_BUILD_PLATFORM_ID = GUC_LIC_TYPE_BUILD_PLATFORM_ID,
+	/** @GUC_LFD_TYPE_FW_REQUIRED_RANGE_END: End of this range */
+	GUC_LFD_TYPE_FW_REQUIRED_RANGE_END = 0x1FFF,
+	/**
+	 * @GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START: Start of range for
+	 * required LFDs from GuC
+	 */
+	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START = 0x2000,
+	/**
+	 * @GUC_LFD_TYPE_LOG_EVENTS_BUFFER: Log-event-entries buffer. LFDs
+	 * payload is guc_lfd_data_log_events_buf
+	 */
+	GUC_LFD_TYPE_LOG_EVENTS_BUFFER = 0x2000,
+	/**
+	 * @GUC_LFD_TYPE_FW_CRASH_DUMP: GuC generated crash-dump blob.
+	 * LFDs payload is guc_lfd_data_fw_crashdump
+	 */
+	GUC_LFD_TYPE_FW_CRASH_DUMP = 0x2001,
+	/** @GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END: End of this range */
+	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END = 0x3FFF,
+	/**
+	 * @GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START: Start of range for
+	 * required KMD LFDs
+	 */
+	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
+	/**
+	 * @GUC_LFD_TYPE_OS_ID: An identifier for the OS. LFDs payload is
+	 * guc_lfd_data_os_id
+	 */
+	GUC_LFD_TYPE_OS_ID = 0x4000,
+	/** @GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END: End of this range */
+	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,
+	/**
+	 * @GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START: Start of range for
+	 * optional KMD LFDs
+	 */
+	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START = 0x6000,
+	/**
+	 * @GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT: Binary representation of
+	 * GuC log-events schema. LFDs TLV payload is
+	 * guc_lfd_data_binary_schema
+	 */
+	GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT = 0x6000,
+	/**
+	 * @GUC_LFD_TYPE_HOST_COMMENT: ASCII string containing comments
+	 * from the host/KMD. LFDs TLV payload is
+	 * guc_lfd_data_host_comment
+	 */
+	GUC_LFD_TYPE_HOST_COMMENT = 0x6001,
+	/** @GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END: End of this range */
+	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END = 0x7FFF,
+	/** @GUC_LFD_TYPE_RESERVED_RANGE_START: Start of reserved range */
+	GUC_LFD_TYPE_RESERVED_RANGE_START = 0x8000,
+	/** @GUC_LFD_TYPE_RESERVED_RANGE_END: End of this range */
+	GUC_LFD_TYPE_RESERVED_RANGE_END = 0xFFFF,
+};
+
+/** enum guc_lfd_os_type - OS Type LFD-ID */
+enum guc_lfd_os_type {
+	/** @GUC_LFD_OS_TYPE_OSID_WIN: Windows OS */
+	GUC_LFD_OS_TYPE_OSID_WIN = 0x1,
+	/** @GUC_LFD_OS_TYPE_OSID_LIN: Linux OS */
+	GUC_LFD_OS_TYPE_OSID_LIN = 0x2,
+	/** @GUC_LFD_OS_TYPE_OSID_VMW: VMWare OS */
+	GUC_LFD_OS_TYPE_OSID_VMW = 0x3,
+	/** @GUC_LFD_OS_TYPE_OSID_OTHER: Other */
+	GUC_LFD_OS_TYPE_OSID_OTHER = 0x4,
+};
+
+/**
+ * struct guc_lfd_data - Log format descriptor (LFD).
+ * A type of KLV with custom field-sizes + magic numbers.
+ */
+struct guc_lfd_data {
+	/** @dw0: A 32 bits dword, contains multiple bit fields */
+	u32 dw0;
+	/*
+	 * Expected value: GUC_LFD_DATA_HEADER_MAGIC.
+	 * Helpful in detecting file errors.
+	 */
+#define GUC_LFD_DATA_MAGIC		GENMASK(15, 0)
+	/*
+	 * File descriptor type (the 'T' in TLV) is used to identify how
+	 * to interpret `data` below. For the range of types, see
+	 * guc_lfd_type
+	 */
+#define GUC_LFD_DATA_DESC_TYPE		GENMASK(31, 16)
+	/** @dw_size: Number of dwords the `data` field contains. */
+	u32 dw_size;
+	/** @data: Data defined by File descriptor type. */
+	u32 data[] __counted_by(dw_size);
+} __packed;
+
+/**
+ * struct guc_lfd_version - GuC Log File Format Version.
+ * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
+ * than 1.12)
+ */
+struct guc_lfd_version {
+	/** @dw0: A 32 bits dword, contains multiple bit fields */
+	u32 dw0;
+	/*
+	 * Guc-Log-File Format minor version. Must be
+	 * GUC_LOG_FILE_FORMAT_VERSION_MINOR
+	 */
+#define GUC_LFD_VERSION_MINOR	GENMASK(15, 0)
+	/*
+	 * Guc-Log-File Format major version. Must be
+	 * GUC_LOG_FILE_FORMAT_VERSION_MAJOR
+	 */
+#define GUC_LFD_VERSION_MAJOR	GENMASK(31, 16)
+} __packed;
+
+/**
+ * struct guc_lfd_data_guc_devid - GuC Device ID.
+ * This is mandatory fw LFD data
+ */
+struct guc_lfd_data_guc_devid {
+	/**
+	 * @guc_devid: GuC microcontroller device ID defined as described
+	 * in GUC_LIC_TYPE_GUC_DEVICE_ID
+	 */
+	u32 guc_devid;
+} __packed;
+
+/**
+ * struct guc_lfd_data_tsc_freq - GuC TSC Fequency.
+ * This is mandatory fw LFD data
+ */
+struct guc_lfd_data_tsc_freq {
+	/**
+	 * @tsc_freq: GuC timestamp counter frequency as described in
+	 * GUC_LIC_TYPE_TSC_FREQUENCY
+	 */
+	u32 tsc_freq;
+} __packed;
+
+/** struct guc_lfd_data_gmdid - GMD ID. */
+struct guc_lfd_data_gmdid {
+	/** @gmd_id: GMD ID as described in GUC_LIC_TYPE_GMD_ID */
+	u32 gmd_id;
+} __packed;
+
+/** struct guc_lfd_data_build_platformid - GuC build platform ID. */
+struct guc_lfd_data_build_platformid {
+	/**
+	 * @platform_build_id: GuC build platform ID as described in
+	 * GUC_LIC_TYPE_BUILD_PLATFORM_ID
+	 */
+	u32 platform_build_id;
+} __packed;
+
+/**
+ * struct guc_lfd_data_log_events_buf - GuC Log Events Buffer.
+ * This is optional fw LFD data
+ */
+struct guc_lfd_data_log_events_buf {
+	/**
+	 * @log_events_format_version: version of GuC log format of buffer
+	 */
+	u32 log_events_format_version;
+	/**
+	 * @log_format_buf: If `log_format_version` == 1, array of
+	 * guc_log_format_version_1. If `log_format_version` == 2, array
+	 * of guc_log_format_version_2. Dword size determined by
+	 * guc_logfile_lfd.`desc_dw_size` - 1
+	 */
+	u32 log_format_buf[];
+} __packed;
+
+/**
+ * struct guc_lfd_data_os_info - OS Version Information.
+ * This is mandatory host LFD data
+ */
+struct guc_lfd_data_os_info {
+	/**
+	 * @os_id: enum values to identify the OS brand (1=Windows,
+	 * 2=Linux, etc..). See guc_lfd_os_type for the range of types
+	 */
+	u32 os_id;
+	/**
+	 * @build_version: ASCII string containing OS build version
+	 * information based on os_id. String is padded with null
+	 * characters to ensure its DWORD aligned. Dword size determined
+	 * by guc_logfile_lfd.`desc_dw_size` - 1
+	 */
+	char build_version[];
+} __packed;
+
+/**
+ * struct guc_lfd_data_fw_version - GuC FW Version.
+ * This is mandatory fw LFD data
+ */
+struct guc_lfd_data_fw_version {
+	/**
+	 * @guc_sw_version: The full version of the GuC microkernel that
+	 * generated the logs as described in
+	 * GUC_LIC_TYPE_GUC_SW_VERSION.
+	 */
+	struct guc_sw_version guc_sw_version;
+} __packed;
+
+/**
+ * struct guc_logfile_header - Header of GuC Log Streaming-LFD-File Format.
+ * This structure encapsulates the layout of the guc-log-file format
+ */
+struct guc_lfd_file_header {
+	/**
+	 * @magic: A magic number set by producer of a GuC log file to
+	 * identify that file is a valid guc-log-file containing a stream
+	 * of LFDs: Expected value: GUC_LFD_DRIVER_KEY_STREAMING
+	 */
+	u64 magic;
+	/**
+	 * @version: Version of this file format layout as per
+	 * guc_lfd_version
+	 */
+	struct guc_lfd_version version;
+	/**
+	 * @lfd_stream: A stream of one or more guc_lfd_data LFD data
+	 */
+	struct guc_lfd_data lfd_stream;
+} __packed;
+
+#endif
-- 
2.34.1

