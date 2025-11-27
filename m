Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4DAD116F3
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 17:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B19810E839;
	Thu, 27 Nov 2025 17:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HyMaRcgA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1493F10E834
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 17:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764263282; x=1795799282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J9Ocv1/btC1RzcPvoYCBRy21wNhn7HbRwisYaeDb8Vw=;
 b=HyMaRcgA3uPgKulIiBHjQ2Dh6138Fm6O4dN6blHJoQRryuBqLOIbabtg
 QsGdobV5uWiUyvB2S6YuD9L9OiGCfkrfWZ+8ZEDkrWYuyFcADJ9W++/7z
 HC9/dUrUHXLAMztcmH3XaogfnZNBN8+wOylA6X0pat4WTn20Lrmy3y68s
 smezh/PyehXbAFm2UBEdPQMgnHewGFdup+0zLpsSXClQAMolj9J9UV/Kn
 uTjonRtaiLFbHeFoKSEdkYYHQk1lkUB+qBL2wTBAd2xS6PG99ysRM454z
 ToXMr3lnsHjoFt8RICYYARdGuYBM6DrnEu5vvhLA3D3oP0NdpqiCK9TuE g==;
X-CSE-ConnectionGUID: XvGSR7yIQ+qANSg5kKpPkA==
X-CSE-MsgGUID: 7nb0SXtFQFy40CZLYwu/Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66344052"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66344052"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:08:02 -0800
X-CSE-ConnectionGUID: PbaL43raQCOlw/TG67HaQA==
X-CSE-MsgGUID: DX4K4bdtQgObklbh4J4GWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="230554366"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa001.jf.intel.com with ESMTP; 27 Nov 2025 09:08:01 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v8 2/6] drm/xe/guc: Add LFD related abi definitions
Date: Thu, 27 Nov 2025 12:07:55 -0500
Message-Id: <20251127170759.2620994-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251127170759.2620994-1-zhanjun.dong@intel.com>
References: <20251127170759.2620994-1-zhanjun.dong@intel.com>
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
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_lfd_abi.h | 171 +++++++++++++++++++++++++++
 1 file changed, 171 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_lfd_abi.h

diff --git a/drivers/gpu/drm/xe/abi/guc_lfd_abi.h b/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
new file mode 100644
index 000000000000..b6ed20d5b508
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
@@ -0,0 +1,171 @@
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
+	 * @GUC_LFD_TYPE_FW_VERSION: GuC Firmware Version structure.
+	 * @GUC_LFD_TYPE_GUC_DEVICE_ID: GuC microcontroller device ID.
+	 * @GUC_LFD_TYPE_TSC_FREQUENCY: Frequency of GuC timestamps.
+	 * @GUC_LFD_TYPE_GMD_ID: HW GMD ID.
+	 * @GUC_LFD_TYPE_BUILD_PLATFORM_ID: GuC build platform ID.
+	 * @GUC_LFD_TYPE_FW_REQUIRED_RANGE_END: End of range for
+	 * required LFDs from GuC
+	 */
+	GUC_LFD_TYPE_FW_REQUIRED_RANGE_START	= 0x1,
+	GUC_LFD_TYPE_FW_VERSION			= 0x1,
+	GUC_LFD_TYPE_GUC_DEVICE_ID		= 0x2,
+	GUC_LFD_TYPE_TSC_FREQUENCY		= 0x3,
+	GUC_LFD_TYPE_GMD_ID			= 0x4,
+	GUC_LFD_TYPE_BUILD_PLATFORM_ID		= 0x5,
+	GUC_LFD_TYPE_FW_REQUIRED_RANGE_END	= 0x1FFF,
+
+	/**
+	 * @GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START: Start of range for
+	 * optional LFDs from GuC
+	 * @GUC_LFD_TYPE_LOG_EVENTS_BUFFER: Log-event-entries buffer.
+	 * @GUC_LFD_TYPE_FW_CRASH_DUMP: GuC generated crash-dump blob.
+	 * @GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END: End of range for
+	 * optional LFDs from GuC
+	 */
+	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START	= 0x2000,
+	GUC_LFD_TYPE_LOG_EVENTS_BUFFER		= 0x2000,
+	GUC_LFD_TYPE_FW_CRASH_DUMP		= 0x2001,
+	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END	= 0x3FFF,
+
+	/**
+	 * @GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START: Start of range for
+	 * required KMD LFDs
+	 * @GUC_LFD_TYPE_OS_ID: An identifier for the OS.
+	 * @GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END: End of this range for
+	 * required KMD LFDs
+	 */
+	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START	= 0x4000,
+	GUC_LFD_TYPE_OS_ID			= 0x4000,
+	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END	= 0x5FFF,
+
+	/**
+	 * @GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START: Start of range for
+	 * optional KMD LFDs
+	 * @GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT: Binary representation of
+	 * GuC log-events schema.
+	 * @GUC_LFD_TYPE_HOST_COMMENT: ASCII string containing comments
+	 * from the host/KMD.
+	 * @GUC_LFD_TYPE_TIMESTAMP_ANCHOR: A timestamp anchor, to convert
+	 * between host and GuC timestamp.
+	 * @GUC_LFD_TYPE_TIMESTAMP_ANCHOR_CONFIG: Timestamp anchor
+	 * configuration, definition of timestamp frequency and bit width.
+	 * @GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END: End of this range for
+	 * optional KMD LFDs
+	 */
+	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START	= 0x6000,
+	GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT	= 0x6000,
+	GUC_LFD_TYPE_HOST_COMMENT		= 0x6001,
+	GUC_LFD_TYPE_TIMESTAMP_ANCHOR		= 0x6002,
+	GUC_LFD_TYPE_TIMESTAMP_ANCHOR_CONFIG	= 0x6003,
+	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END	= 0x7FFF,
+
+	/*
+	 * @GUC_LFD_TYPE_RESERVED_RANGE_START: Start of reserved range
+	 * @GUC_LFD_TYPE_RESERVED_RANGE_END: End of reserved range
+	 */
+	GUC_LFD_TYPE_RESERVED_RANGE_START	= 0x8000,
+	GUC_LFD_TYPE_RESERVED_RANGE_END		= 0xFFFF,
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
+/** struct guc_lfd_data - A generic header structure for all LFD blocks */
+struct guc_lfd_data {
+	/** @header: A 32 bits dword, contains multiple bit fields */
+	u32 header;
+	/* LFD type. See guc_lfd_type */
+#define GUC_LFD_DATA_HEADER_MASK_TYPE		GENMASK(31, 16)
+#define GUC_LFD_DATA_HEADER_MASK_MAGIC		GENMASK(15, 0)
+
+	/** @data_count: Number of dwords the `data` field contains. */
+	u32 data_count;
+	/** @data: Data defined by GUC_LFD_DATA_HEADER_MASK_TYPE */
+	u32 data[] __counted_by(data_count);
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
+	 * @log_event: The log event data.
+	 * Size in dwords is LFD block size - 1.
+	 */
+	u32 log_event[];
+} __packed;
+
+/** struct guc_lfd_data_os_info - OS Version Information. */
+struct guc_lfd_data_os_info {
+	/**
+	 * @os_id: enum values to identify the OS brand.
+	 * See guc_lfd_os_type for the range of types
+	 */
+	u32 os_id;
+	/**
+	 * @build_version: ASCII string containing OS build version
+	 * information based on os_id. String is padded with null
+	 * characters to ensure its DWORD aligned.
+	 * Size in dwords is LFD block size - 1.
+	 */
+	char build_version[];
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
+	 * of LFDs.
+	 */
+	u64 magic;
+	/** @version: Version of this file format layout */
+	u32 version;
+#define GUC_LFD_FILE_HEADER_VERSION_MASK_MAJOR	GENMASK(31, 16)
+#define GUC_LFD_FILE_HEADER_VERSION_MASK_MINOR	GENMASK(15, 0)
+
+	/** @stream: A stream of one or more guc_lfd_data LFD blocks
+	 */
+	u32 stream[];
+} __packed;
+
+#endif
-- 
2.34.1

