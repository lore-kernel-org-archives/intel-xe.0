Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119FEC369D9
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 21:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3091410E429;
	Wed, 23 Apr 2025 21:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewJZhG3s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD1C10E0B9
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 21:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745445506; x=1776981506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fmh1kHLXpfelZW681eP043Yot/6yUVIW73CtjrPyYN0=;
 b=ewJZhG3sBOgn7Bta0LrlNxmqLjMn15CPNbr+SzHsHYrWpduU4P9PjlSV
 B2t8rLiAQg1R1L5qo7lTUqOLR3gHlX1ep7SnwBXaS7almH9aGPZY61jp8
 9oj1SBZoXkQDKr4cKi5pjjlHhn1X+3SZIJMAMAts5jkBAF+HxGx6UQ4pf
 MSfyxvine8SMMv4gDZogFAnINwEHF0UanFjjuNfZmFOoqk9ynvbO/sdk0
 1jZhU+UxK/kSdX+/ZufPrtK+GWcySPrsPeIaHEwOfYLl1/JuRFPwwUbIk
 qWsQn4Np0NJ3leYHvaN7Ur0ZAK6UOq5mz/5nxU1TbpnRC6VDEJEQqD9tQ Q==;
X-CSE-ConnectionGUID: 422ZYtO3QsiCFfiwbj7WCA==
X-CSE-MsgGUID: UnZUAfhGSJSi/kqMB2biRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47073114"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47073114"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 14:58:23 -0700
X-CSE-ConnectionGUID: qR0uPmCbTJGpzbnJnXiGZg==
X-CSE-MsgGUID: yYvZI0jZTOeQYR6fWK5u2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="136507647"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa003.fm.intel.com with ESMTP; 23 Apr 2025 14:58:23 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 2/6] drm/xe/guc: Add LFD related abi definitions
Date: Wed, 23 Apr 2025 14:58:17 -0700
Message-Id: <20250423215821.3078428-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423215821.3078428-1-zhanjun.dong@intel.com>
References: <20250423215821.3078428-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h | 279 +++++++++++++++++++++++
 1 file changed, 279 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h

diff --git a/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
new file mode 100644
index 000000000000..d7eb207f1560
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
@@ -0,0 +1,279 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _ABI_GUC_LOG_LFD_ABI_H_
+#define _ABI_GUC_LOG_LFD_ABI_H_
+
+#include <linux/types.h>
+
+#include "abi/guc_log_lic_abi.h"
+
+/* Magic keys define */
+#define LFD_DRIVER_KEY_STREAMING		0x8086AAAA474C5346
+#define LFD_LOG_BUFFER_MARKER_2			0xDEADFEED
+#define LFD_CRASH_DUMP_BUFFER_MARKER_2		0x8086DEAD
+#define LFD_STATE_CAPTURE_BUFFER_MARKER_2	0xBEEFFEED
+#define LFD_LOG_BUFFER_MARKER_1V2		0xCABBA9E6
+#define LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0xCABBA9F7
+#define GUC_LOGFILE_LFD_HEADER_MAGIC		0x8086
+
+/* The current major version of GuC-Log-File format. */
+#define GUC_LOG_FILE_FORMAT_VERSION_MAJOR	0x0001
+/* The current minor version of GuC-Log-File format. */
+#define GUC_LOG_FILE_FORMAT_VERSION_MINOR	0x0000
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
+	GUC_LFD_TYPE_FW_VERSION = GUC_LOG_LIC_TYPE_GUC_SW_VERSION,
+	/**
+	 * @GUC_LFD_TYPE_GUC_DEVICE_ID: GuC microcontroller device ID.
+	 * LFDs payload is guc_lfd_data_guc_devid
+	 */
+	GUC_LFD_TYPE_GUC_DEVICE_ID = GUC_LOG_LIC_TYPE_GUC_DEVICE_ID,
+	/**
+	 * @GUC_LFD_TYPE_TSC_FREQUENCY: Frequency of GuC timestamps. LFDs
+	 * payload is guc_lfd_data_tsc_freq
+	 */
+	GUC_LFD_TYPE_TSC_FREQUENCY = GUC_LOG_LIC_TYPE_TSC_FREQUENCY,
+	/**
+	 * @GUC_LFD_TYPE_GMD_ID: HW GMD ID. LFDs payload is
+	 * guc_lfd_data_gmdid
+	 */
+	GUC_LFD_TYPE_GMD_ID = GUC_LOG_LIC_TYPE_GMD_ID,
+	/**
+	 * @GUC_LFD_TYPE_BUILD_PLATFORM_ID: GuC build platform ID. LFDs
+	 * payload is guc_lfd_data_build_platformid
+	 */
+	GUC_LFD_TYPE_BUILD_PLATFORM_ID = GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID,
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
+ * struct guc_logfile_lfd_data - Log format descriptor (LFD).
+ * A type of KLV with custom field-sizes + magic numbers.
+ */
+struct guc_logfile_lfd_data {
+	/** @dw0: A 32 bits dword, contains multiple bit fields */
+	u32 dw0;
+	/* Expected value: 0x8086. Helpful in detecting file errors. */
+#define GUC_LOGFILE_LFD_MAGIC			GENMASK(15, 0)
+	/*
+	 * File descriptor type (the 'T' in TLV) is used to identify how
+	 * to interpret `data` below. For the range of types, see
+	 * guc_lfd_type
+	 */
+#define GUC_LOGFILE_LFD_DESC_TYPE		GENMASK(31, 16)
+	/** @desc_dw_size: Number of dwords the `data` field contains. */
+	u32 desc_dw_size;
+	/** @data: Data defined by File descriptor type. */
+	u32 data[] __counted_by(desc_dw_size);
+} __packed;
+
+/**
+ * struct guc_logfile_fmt_ver - GuC Log File Format Version.
+ * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
+ * than 1.12)
+ */
+struct guc_logfile_fmt_ver {
+	/** @dw0: A 32 bits dword, contains multiple bit fields */
+	u32 dw0;
+	/*
+	 * Guc-Log-File Format minor version. Must be
+	 * GUC_LOG_FILE_FORMAT_VERSION_MINOR
+	 */
+#define GUC_LOGFILE_FMT_VER_MINOR_VERSION	GENMASK(15, 0)
+	/*
+	 * Guc-Log-File Format major version. Must be
+	 * GUC_LOG_FILE_FORMAT_VERSION_MAJOR
+	 */
+#define GUC_LOGFILE_FMT_VER_MAJOR_VERSION	GENMASK(31, 16)
+} __packed;
+
+/**
+ * struct guc_lfd_data_guc_devid - GuC Device ID.
+ * This is mandatory fw LFD data
+ */
+struct guc_lfd_data_guc_devid {
+	/**
+	 * @guc_devid: GuC microcontroller device ID defined as described
+	 * in GUC_LOG_LIC_TYPE_GUC_DEVICE_ID
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
+	 * GUC_LOG_LIC_TYPE_TSC_FREQUENCY
+	 */
+	u32 tsc_freq;
+} __packed;
+
+/** struct guc_lfd_data_gmdid - GMD ID. */
+struct guc_lfd_data_gmdid {
+	/** @gmd_id: GMD ID as described in GUC_LOG_LIC_TYPE_GMD_ID */
+	u32 gmd_id;
+} __packed;
+
+/** struct guc_lfd_data_build_platformid - GuC build platform ID. */
+struct guc_lfd_data_build_platformid {
+	/**
+	 * @platform_build_id: GuC build platform ID as described in
+	 * GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID
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
+ * struct guc_lfd_data_os_id - OS Version Information.
+ * This is mandatory host LFD data
+ */
+struct guc_lfd_data_os_id {
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
+	 * GUC_LOG_LIC_TYPE_GUC_SW_VERSION.
+	 */
+	struct guc_sw_version guc_sw_version;
+} __packed;
+
+/**
+ * struct guc_logfile_header - Header of GuC Log Streaming-LFD-File Format.
+ * This structure encapsulates the layout of the guc-log-file format
+ */
+struct guc_logfile_header {
+	/**
+	 * @magic: A magic number set by producer of a GuC log file to
+	 * identify that file is a valid guc-log-file containing a stream
+	 * of LFDs: Expected value: 0x8086AAAA474C5346.
+	 */
+	u64 magic;
+	/**
+	 * @version: Version of this file format layout as per
+	 * guc_logfile_fmt_ver
+	 */
+	struct guc_logfile_fmt_ver version;
+	/**
+	 * @lfd_stream: A stream of one or more guc_logfile_lfd LFD data
+	 */
+	struct guc_logfile_lfd_data lfd_stream;
+} __packed;
+
+#endif
-- 
2.34.1

