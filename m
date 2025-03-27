Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C83C36013
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 23:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E91610E958;
	Thu, 27 Mar 2025 23:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cWk8vsoJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578F110E94E
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 23:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743118832; x=1774654832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AsOOZjgX8k+crVhOcrwSiKZp+fwZsrzEPjlf89zfh3w=;
 b=cWk8vsoJ4nKGWxEaqmDowIDYsqacul65Li7w3ZZdCF65EIx/JH6j1kuW
 3jB54sMyZr2BqLQTUDsNNlgEbQOdfDAcMmkHCIpulhKEYFrIgNFL6NLyV
 HzN0wa8qnv1mmPBDn/0Ktr8LBaE1q3wRkHHB/g8f/+60gI3eQwkQDUSO0
 LN7Yc1PbIywrrpsVFZGWVz9vufIlbwz3MSyrKPLFnublfTghGbpTzEa1x
 maqHdrsR3MniDFVb9uvyEaaoABrSRxBBDB9V/w3zKdlcrL8Vx2PIy7SM2
 xuE5KY9NBC0RPvEy5sewB6MFV0afHNhmzaqFYwfbaRtnuvXRjW0azeUvI g==;
X-CSE-ConnectionGUID: CMnWObKSS7KWxBahGrNdug==
X-CSE-MsgGUID: bnLbMJ4mRSCo1/ScnNah9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43714322"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="43714322"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 16:40:30 -0700
X-CSE-ConnectionGUID: 3X9M08CDRhSmHmClhwjtXQ==
X-CSE-MsgGUID: JK1C9gvyS5+RATtBxitlNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="125262915"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa007.fm.intel.com with ESMTP; 27 Mar 2025 16:40:29 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2 1/2] drm/xe/guc: Add LFD format output for guc log
Date: Thu, 27 Mar 2025 16:40:27 -0700
Message-Id: <20250327234028.249314-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327234028.249314-1-zhanjun.dong@intel.com>
References: <20250327234028.249314-1-zhanjun.dong@intel.com>
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

Add new debugfs entry "guc_log_lfd", which supports output guc log
in LFD(Log Format Descriptors) format.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_log_abi.h     | 112 +++++++
 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h | 261 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_debugfs.c      |  14 +
 drivers/gpu/drm/xe/xe_guc_log.c          | 368 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h          |   1 +
 5 files changed, 756 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h

diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
index 554630b7ccd9..50b697e44c42 100644
--- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
@@ -17,6 +17,118 @@ enum guc_log_buffer_type {
 
 #define GUC_LOG_BUFFER_TYPE_MAX		3
 
+#define GUC_LOG_BUFFER_STATE_HEADER_LENGTH		4096
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG		0
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH		1
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CAPTURE	2
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT		3
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT		4
+
+#define GUC_LOG_INIT_CONFIG_LIC_MAGIC			0x8086900D
+#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR	0x0001
+#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR	0x0000
+
+/** Log Init Config KLV IDs. */
+enum guc_log_lic_type_t {
+	/**
+	 * GuC firmware version. Value is a 32 bit number represented by
+	 * guc_sw_version_t.
+	 */
+	GUC_LOG_LIC_TYPE_GUC_SW_VERSION = 0x1,
+	/**
+	 * GuC device id. Value is a 32 bit. Refer BSpec symbol
+	 * GUC_DEVICEID
+	 */
+	GUC_LOG_LIC_TYPE_GUC_DEVICE_ID = 0x2,
+	/**
+	 * GuC timestamp counter frequency. Value is a 32 bit number
+	 * representing frequency in kilohertz. This timestamp is utilized
+	 * in log entries, timer and for engine utilization tracking.
+	 */
+	GUC_LOG_LIC_TYPE_TSC_FREQUENCY = 0x3,
+	/**
+	 * HW GMD ID. Value is a 32 bit number representing graphics,
+	 * media and display HW architecture IDs.
+	 */
+	GUC_LOG_LIC_TYPE_GMD_ID = 0x4,
+	/** GuC build platform ID. Value is 32 bits. */
+	GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID = 0x5,
+};
+
+#define GUC_LOG_LIC_TYPE_FIRST	(GUC_LOG_LIC_TYPE_GUC_SW_VERSION)
+#define GUC_LOG_LIC_TYPE_LAST	(GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID + 1)
+
+/** struct guc_klv_generic_t - KLV with multiple DWs in an array */
+struct guc_klv_generic_t {
+	/** @length: Length in Dwords of data. */
+	u16		length;
+	/** @key: Key value */
+	u16		key;
+	/** @value: Value for this key */
+	u32		value[];
+} __packed;
+
+/**
+ * struct guc_sw_version_t - This structure describes the full version of
+ * a software component.
+ */
+struct guc_sw_version_t {
+	/** @patch_version: BR[7:0] Patch version */
+	u32		patch_version : 8;
+	/** @minor_version: BR[15:8] Minor version */
+	u32		minor_version : 8;
+	/** @major_version: BR[23:16] Major version */
+	u32		major_version : 8;
+	/** @branch_id: BR[31:24] Branch ID */
+	u32		branch_id : 8;
+} __packed;
+
+/**
+ * struct guc_lic_format_version_t - Log Init Config Structure Version.
+ * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
+ * than 1.12)
+ */
+struct guc_lic_format_version_t {
+	/**
+	 * @minor_version: BR[15:0] Log-Init-Config structure minor
+	 * version. Must be GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR
+	 */
+	u32		minor_version : 16;
+	/**
+	 * @major_version: BR[31:16] Log-Init-Config structure major
+	 * version. Must be GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR
+	 */
+	u32		major_version : 16;
+} __packed;
+
+/**
+ * struct guc_log_init_config_t - GuC Log-Init-Config structure.
+ * This is populated by the GUC at log init time and is located in the log
+ * buffer as per the Log Buffer Layout (In Memory). The array of guc log
+ * buffer states plus this structure must not exceed 4KB
+ */
+struct guc_log_init_config_t {
+	/**
+	 * @lic_magic: A magic number set by GuC to identify that this
+	 * structure contains valid information: lic_magic = 0x8086900D.
+	 * Used to verify the information in this structure is valid.
+	 */
+	u32		lic_magic;
+	/**
+	 * @lic_ver: The version of the this structure. Detail description
+	 * is guc_lic_format_version_t
+	 */
+	struct guc_lic_format_version_t	lic_ver;
+	/** @lic_dw_size: Number of Dws the `lic_data` array contains. */
+	u32		lic_dw_size;
+	/**
+	 * @lic_data: Array of dwords representing a list of LIC KLVs of
+	 * type guc_klv_generic_t with keys represented by
+	 * guc_log_lic_type_t
+	 */
+	u32		lic_data[];
+} __packed;
+
 /**
  * struct guc_log_buffer_state - GuC log buffer state
  *
diff --git a/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
new file mode 100644
index 000000000000..8aaacab244cb
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
@@ -0,0 +1,261 @@
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
+#include "abi/guc_log_abi.h"
+
+/* Magic keys define */
+#define LFD_DRIVER_KEY_STREAMING		0x8086AAAA474C5346
+#define LFD_LOG_BUFFER_MARKER_2			0xDEADFEED
+#define LFD_CRASH_DUMP_BUFFER_MARKER_2		0x8086DEAD
+#define LFD_STATE_CAPTURE_BUFFER_MARKER_2	0xBEEFFEED
+#define LFD_LOG_BUFFER_MARKER_1V2		0xCABBA9E6
+#define LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0xCABBA9F7
+
+#define GUC_LOGFILE_LFD_MAGIC	upper_16_bits(LFD_CRASH_DUMP_BUFFER_MARKER_2)
+
+/** The current major version of GuC-Log-File format. */
+#define GUC_LOG_FILE_FORMAT_VERSION_MAJOR	0x0001
+/** The current minor version of GuC-Log-File format. */
+#define GUC_LOG_FILE_FORMAT_VERSION_MINOR	0x0000
+
+/** Log format descriptor type */
+enum guc_lfd_type_t {
+	/** Start of range for required LFDs from GuC */
+	GUC_LFD_TYPE_FW_REQUIRED_RANGE_START = 0x1,
+	/**
+	 * GuC Firmware Version structure. LFDs payload is
+	 * guc_lfd_data_fw_version_t
+	 */
+	GUC_LFD_TYPE_FW_VERSION = 0x1,
+	/**
+	 * GuC microcontroller device ID. LFDs payload is
+	 * guc_lfd_data_guc_devid_t
+	 */
+	GUC_LFD_TYPE_GUC_DEVICE_ID = 0x2,
+	/**
+	 * Frequency of GuC timestamps. LFDs payload is
+	 * guc_lfd_data_tsc_freq_t
+	 */
+	GUC_LFD_TYPE_TSC_FREQUENCY = 0x3,
+	/** HW GMD ID. LFDs payload is guc_lfd_data_gmdid_t */
+	GUC_LFD_TYPE_GMD_ID = 0x4,
+	/**
+	 * GuC build platform ID. LFDs payload is
+	 * guc_lfd_data_build_platformid_t
+	 */
+	GUC_LFD_TYPE_BUILD_PLATFORM_ID = 0x5,
+	/** End of this range */
+	GUC_LFD_TYPE_FW_REQUIRED_RANGE_END = 0x1FFF,
+	/** Start of range for required LFDs from GuC */
+	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START = 0x2000,
+	/**
+	 * Log-event-entries buffer. LFDs payload is
+	 * guc_lfd_data_log_events_buf_t
+	 */
+	GUC_LFD_TYPE_LOG_EVENTS_BUFFER = 0x2000,
+	/**
+	 * GuC generated crash-dump blob. LFDs payload is
+	 * guc_lfd_data_fw_crashdump_t
+	 */
+	GUC_LFD_TYPE_FW_CRASH_DUMP = 0x2001,
+	/** End of this range */
+	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END = 0x3FFF,
+	/** Start of range for required KMD LFDs */
+	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
+	/**
+	 * An identifier for the OS. LFDs payload is guc_lfd_data_os_id_t
+	 */
+	GUC_LFD_TYPE_OS_ID = 0x4000,
+	/** End of this range */
+	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,
+	/** Start of range for optional KMD LFDs */
+	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START = 0x6000,
+	/**
+	 * Binary representation of GuC log-events schema. LFDs TLV
+	 * payload is guc_lfd_data_binary_schema_t
+	 */
+	GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT = 0x6000,
+	/**
+	 * ASCII string containing comments from the host/KMD. LFDs TLV
+	 * payload is guc_lfd_data_host_comment_t
+	 */
+	GUC_LFD_TYPE_HOST_COMMENT = 0x6001,
+	/** End of this range */
+	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END = 0x7FFF,
+	/** Start of reserved range */
+	GUC_LFD_TYPE_RESERVED_RANGE_START = 0x8000,
+	/** End of this range */
+	GUC_LFD_TYPE_RESERVED_RANGE_END = 0xFFFF,
+};
+
+/** OS Type LFD-ID */
+enum guc_lfd_os_type_t {
+	/** Windows OS */
+	GUC_LFD_OS_TYPE_OSID_WIN = 0x1,
+	/** Linux OS */
+	GUC_LFD_OS_TYPE_OSID_LIN = 0x2,
+	/** VMWare OS */
+	GUC_LFD_OS_TYPE_OSID_VMW = 0x3,
+	/** Other */
+	GUC_LFD_OS_TYPE_OSID_OTHER = 0x4,
+};
+
+/**
+ * struct guc_logfile_lfd_t - Log format descriptor (LFD).
+ * A type of KLV with custom field-sizes + magic numbers.
+ */
+struct guc_logfile_lfd_t {
+	/**
+	 * @magic: BR[15:0] Expected value: 0x8086. Helpful in detecting
+	 * file errors.
+	 */
+	u32		magic : 16;
+	/**
+	 * @desc_type: BR[31:16] File descriptor type (the 'T' in TLV) is
+	 * used to identify how to interpret `data` below. For the range
+	 * of types, see guc_lfd_type_t
+	 */
+	u32		desc_type : 16;
+	/** @desc_dw_size: Number of dwords the `data` field contains. */
+	u32		desc_dw_size;
+	/** @data: Data defined by File descriptor type. */
+	u32		data[];
+} __packed;
+
+/**
+ * struct guc_logfile_fmt_ver_t - GuC Log File Format Version.
+ * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
+ * than 1.12)
+ */
+struct guc_logfile_fmt_ver_t {
+	/**
+	 * @minor_version: BR[15:0] Guc-Log-File Format minor version.
+	 * Must be GUC_LOG_FILE_FORMAT_VERSION_MINOR
+	 */
+	u32		minor_version : 16;
+	/**
+	 * @major_version: BR[31:16] Guc-Log-File Format major version.
+	 * Must be GUC_LOG_FILE_FORMAT_VERSION_MAJOR
+	 */
+	u32		major_version : 16;
+} __packed;
+
+/**
+ * struct guc_lfd_data_guc_devid_t - GuC Device ID.
+ * This is mandatory fw LFD data
+ */
+struct guc_lfd_data_guc_devid_t {
+	/**
+	 * @guc_devid: GuC microcontroller device ID defined as described
+	 * in GUC_LOG_LIC_TYPE_GUC_DEVICE_ID
+	 */
+	u32		guc_devid;
+} __packed;
+
+/**
+ * struct guc_lfd_data_tsc_freq_t - GuC TSC Fequency.
+ * This is mandatory fw LFD data
+ */
+struct guc_lfd_data_tsc_freq_t {
+	/**
+	 * @tsc_freq: GuC timestamp counter frequency as described in
+	 * GUC_LOG_LIC_TYPE_TSC_FREQUENCY
+	 */
+	u32		tsc_freq;
+} __packed;
+
+/** struct guc_lfd_data_gmdid_t - GMD ID. */
+struct guc_lfd_data_gmdid_t {
+	/** @gmd_id: GMD ID as described in GUC_LOG_LIC_TYPE_GMD_ID */
+	u32		gmd_id;
+} __packed;
+
+/** struct guc_lfd_data_build_platformid_t - GuC build platform ID. */
+struct guc_lfd_data_build_platformid_t {
+	/**
+	 * @platform_build_id: GuC build platform ID as described in
+	 * GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID
+	 */
+	u32		platform_build_id;
+} __packed;
+
+/**
+ * struct guc_lfd_data_log_events_buf_t - GuC Log Events Buffer.
+ * This is optional fw LFD data
+ */
+struct guc_lfd_data_log_events_buf_t {
+	/**
+	 * @log_events_format_version: version of GuC log format of buffer
+	 */
+	u32		log_events_format_version;
+	/**
+	 * @log_format_buf: If `log_format_version` == 1, array of
+	 * guc_log_format_version_1_t. If `log_format_version` == 2, array
+	 * of guc_log_format_version_2_t. Dword size determined by
+	 * guc_logfile_lfd_t.`desc_dw_size` - 1
+	 */
+	u32		log_format_buf[];
+} __packed;
+
+/**
+ * struct guc_lfd_data_os_id_t - OS Version Information.
+ * This is mandatory host LFD data
+ */
+struct guc_lfd_data_os_id_t {
+	/**
+	 * @os_id: enum values to identify the OS brand (1=Windows,
+	 * 2=Linux, etc..). See guc_lfd_os_type_t for the range of types
+	 */
+	u32		os_id;
+	/**
+	 * @build_version: ASCII string containing OS build version
+	 * information based on os_id. String is padded with null
+	 * characters to ensure its DWORD aligned. Dword size determined
+	 * by guc_logfile_lfd_t.`desc_dw_size` - 1
+	 */
+	char		build_version[];
+} __packed;
+
+/**
+ * struct guc_logfile_t - GuC Log Streaming-LFD-File Format.
+ * This structure encapsulates the layout of the guc-log-file format
+ */
+struct guc_logfile_t {
+	/**
+	 * @magic: A magic number set by producer of a GuC log file to
+	 * identify that file is a valid guc-log-file containing a stream
+	 * of LFDs: Expected value: 0x8086AAAA474C5346.
+	 */
+	u64		magic;
+	/**
+	 * @version: Version of this file format layout as per
+	 * guc_logfile_fmt_ver_t
+	 */
+	struct guc_logfile_fmt_ver_t	version;
+	/**
+	 * @lfd_stream: A stream of one or more guc_logfile_lfd_t LFD data
+	 */
+	struct guc_logfile_lfd_t	lfd_stream;
+} __packed;
+
+/**
+ * struct guc_lfd_data_fw_version_t - GuC FW Version.
+ * This is mandatory fw LFD data
+ */
+struct guc_lfd_data_fw_version_t {
+	/**
+	 * @guc_sw_version: The full version of the GuC microkernel that
+	 * generated the logs as described in
+	 * GUC_LOG_LIC_TYPE_GUC_SW_VERSION.
+	 */
+	struct guc_sw_version_t	guc_sw_version;
+} __packed;
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index c569ff456e74..6449c9a69b8a 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -48,6 +48,19 @@ static int guc_log(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int guc_log_lfd(struct seq_file *m, void *data)
+{
+	struct xe_guc *guc = node_to_guc(m->private);
+	struct xe_device *xe = guc_to_xe(guc);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_pm_runtime_get(xe);
+	xe_guc_log_print_lfd(&guc->log, &p);
+	xe_pm_runtime_put(xe);
+
+	return 0;
+}
+
 static int guc_log_dmesg(struct seq_file *m, void *data)
 {
 	struct xe_guc *guc = node_to_guc(m->private);
@@ -89,6 +102,7 @@ static int guc_pc(struct seq_file *m, void *data)
 static const struct drm_info_list debugfs_list[] = {
 	{"guc_info", guc_info, 0},
 	{"guc_log", guc_log, 0},
+	{"guc_log_lfd", guc_log_lfd, 0},
 	{"guc_log_dmesg", guc_log_dmesg, 0},
 	{"guc_ctb", guc_ctb, 0},
 	{"guc_pc", guc_pc, 0},
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 80514a446ba2..5659d60e41ab 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -7,8 +7,12 @@
 
 #include <linux/fault-inject.h>
 
+//#include <generated/utsversion.h>
+//#include "boot.h"
+#include <linux/utsname.h>
 #include <drm/drm_managed.h>
 
+#include "abi/guc_log_lfd_abi.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
 #include "xe_devcoredump.h"
@@ -19,6 +23,57 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 
+static struct guc_log_buffer_entry_markers {
+	u32 key[2];
+} const entry_markers[4] = {
+	{{
+		LFD_LOG_BUFFER_MARKER_1V2,
+		LFD_LOG_BUFFER_MARKER_2
+	}},
+	{{
+		LFD_LOG_BUFFER_MARKER_1V2,
+		LFD_CRASH_DUMP_BUFFER_MARKER_2
+	}},
+	{{
+		LFD_STATE_CAPTURE_BUFFER_MARKER_1V2,
+		LFD_STATE_CAPTURE_BUFFER_MARKER_2
+	}},
+	{{
+		GUC_LOG_INIT_CONFIG_LIC_MAGIC,
+		((GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR << 16)
+			| GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR)
+	}}
+};
+
+static struct guc_log_buffer_entry_list {
+	u32 offset;
+	u32 rd_ptr;
+	u32 wr_ptr;
+	u32 buf_size;
+} entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT];
+
+static const struct guc_logfile_lfd_t default_guc_logfile_lfd = {
+	.magic = GUC_LOGFILE_LFD_MAGIC,
+};
+
+static const struct guc_logfile_t default_guc_logfile = {
+	.magic = LFD_DRIVER_KEY_STREAMING,
+	.version = {
+		.minor_version = GUC_LOG_FILE_FORMAT_VERSION_MINOR,
+		.major_version = GUC_LOG_FILE_FORMAT_VERSION_MAJOR
+	}
+};
+
+struct guc_log_init_config_save_t {
+	/*
+	 * Array of init config KLVs.
+	 * Range from GUC_LOG_LIC_TYPE_FIRST to
+	 * GUC_LOG_LIC_TYPE_LAST
+	 */
+	u32 KLV[GUC_LOG_LIC_TYPE_LAST - GUC_LOG_LIC_TYPE_FIRST];
+	struct guc_log_buffer_state log_buf_state;
+};
+
 static struct xe_guc *
 log_to_guc(struct xe_guc_log *log)
 {
@@ -216,6 +271,305 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	}
 }
 
+static int xe_guc_log_add_lfd_header(char *buf, int buf_size)
+{
+	int len;
+
+	if (buf_size < sizeof(struct guc_logfile_lfd_t))
+		return -ENOMEM;
+
+	len = sizeof(default_guc_logfile_lfd);
+	memcpy(buf, &default_guc_logfile_lfd, len);
+
+	return len;
+}
+
+static int xe_guc_log_add_payload(char *buf, int buf_size, u32 data_len, void *data)
+{
+	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
+
+	if (buf_size < sizeof(struct guc_logfile_lfd_t) + data_len)
+		return -ENOMEM;
+
+	/* make length DW aligned */
+	lfd->desc_dw_size = data_len / 4;
+	if (data_len % 4)
+		lfd->desc_dw_size++;
+
+	if (lfd->data != data)
+		memcpy(lfd->data, data, data_len);
+
+	return lfd->desc_dw_size * 4;
+}
+
+static int xe_guc_log_add_typed_payload(char *buf, int buf_size, u32 type,
+					u32 data_len, void *data)
+{
+	int len;
+	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
+
+	if (buf_size < sizeof(struct guc_logfile_lfd_t) + data_len)
+		return -ENOMEM;
+
+	len = xe_guc_log_add_lfd_header(buf, buf_size);
+	lfd->desc_type = type;
+	len += xe_guc_log_add_payload(buf, buf_size, data_len, data);
+
+	return len;
+}
+
+static int xe_guc_log_add_os_id(char *buf, int buf_size, u32 id)
+{
+	char *version;
+	int info_len;
+	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
+	struct guc_lfd_data_os_id_t *os_id = (struct guc_lfd_data_os_id_t *)lfd->data;
+
+	os_id->os_id = id;
+
+	version = init_utsname()->release;
+	info_len = strlen(version) + 1;
+
+	if (buf_size < sizeof(struct guc_logfile_lfd_t) + info_len)
+		return -ENOMEM;
+
+	strscpy(os_id->build_version, version, info_len);
+
+	return xe_guc_log_add_typed_payload(buf, buf_size, GUC_LFD_TYPE_OS_ID,
+					   info_len + sizeof(*os_id), os_id);
+}
+
+static int
+xe_guc_log_add_log_event(char *buf, int buf_size, char *log_bin,
+			 struct guc_log_init_config_save_t *config)
+{
+	int len;
+	char *data;
+	u32 data_len;
+	struct guc_lfd_data_log_events_buf_t *events_buf;
+	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
+	struct guc_log_buffer_entry_list *entry;
+
+	entry = &entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG];
+
+	/* Skip empty log */
+	if (entry->rd_ptr == entry->wr_ptr)
+		return 0;
+
+	len = xe_guc_log_add_lfd_header(buf, buf_size);
+	if (len < 0)
+		return len;
+
+	buf_size -= len;
+	lfd = (struct guc_logfile_lfd_t *)buf;
+
+	lfd->desc_type = GUC_LFD_TYPE_LOG_EVENTS_BUFFER;
+	events_buf = (struct guc_lfd_data_log_events_buf_t *)&lfd->data;
+	events_buf->log_events_format_version = config->log_buf_state.version;
+
+	data = log_bin + entry->offset + entry->rd_ptr;
+	if (entry->rd_ptr < entry->wr_ptr) {
+		data_len = entry->wr_ptr - entry->rd_ptr;
+		if (data_len <= buf_size) {
+			memcpy(events_buf->log_format_buf, data, data_len);
+			buf_size -= data_len;
+		} else {
+			return -ENOMEM;
+		}
+	} else {
+		int cp_len;
+
+		/* Copy rd to buf end 1st */
+		data_len = entry->buf_size - entry->rd_ptr;
+		if (data_len <= buf_size) {
+			memcpy(events_buf->log_format_buf, data, data_len);
+			buf_size -= data_len;
+		} else {
+			return -ENOMEM;
+		}
+
+		/* Copy buf start to wr */
+		data = &log_bin[entry->offset];
+		cp_len = entry->wr_ptr;
+		if (cp_len <= buf_size - cp_len)
+			memcpy(&events_buf->log_format_buf[data_len / 4], data, cp_len);
+		else
+			return -ENOMEM;
+		data_len += cp_len;
+	}
+
+	/* make length DW aligned */
+	lfd->desc_dw_size = data_len / 4;
+	if (data_len % 4)
+		lfd->desc_dw_size++;
+
+	/* Addup log_events_format_version size */
+	lfd->desc_dw_size++;
+
+	return len + lfd->desc_dw_size * 4;
+}
+
+static inline int lic_type_to_KLV_index(u32 lic_type)
+{
+	XE_WARN_ON(lic_type < GUC_LOG_LIC_TYPE_FIRST || lic_type >= GUC_LOG_LIC_TYPE_LAST);
+
+	return lic_type - GUC_LOG_LIC_TYPE_FIRST;
+}
+
+static int xe_guc_log_add_klv(char *buf, int size, u32 lic_type,
+			      struct guc_log_init_config_save_t *config)
+{
+	/* LFD type must matches LIC type */
+	BUILD_BUG_ON((int)GUC_LFD_TYPE_FW_VERSION != (int)GUC_LOG_LIC_TYPE_GUC_SW_VERSION);
+	BUILD_BUG_ON((int)GUC_LFD_TYPE_GUC_DEVICE_ID != (int)GUC_LOG_LIC_TYPE_GUC_DEVICE_ID);
+	BUILD_BUG_ON((int)GUC_LFD_TYPE_TSC_FREQUENCY != (int)GUC_LOG_LIC_TYPE_TSC_FREQUENCY);
+	BUILD_BUG_ON((int)GUC_LFD_TYPE_GMD_ID != (int)GUC_LOG_LIC_TYPE_GMD_ID);
+	BUILD_BUG_ON((int)GUC_LFD_TYPE_BUILD_PLATFORM_ID !=
+		     (int)GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID);
+
+	return xe_guc_log_add_typed_payload(buf, size, lic_type, sizeof(u32),
+				 &config->KLV[lic_type_to_KLV_index(lic_type)]);
+}
+
+static void xe_guc_log_loop_log_init(struct guc_log_init_config_t *init,
+				     struct guc_log_init_config_save_t *config)
+{
+	int i;
+	struct guc_klv_generic_t *p = (struct guc_klv_generic_t *)init->lic_data;
+
+	memset(entry_list, 0, sizeof(entry_list));
+
+	for (i = 0; i < init->lic_dw_size;) {
+		if (p->key < GUC_LOG_LIC_TYPE_GUC_SW_VERSION || p->key >= GUC_LOG_LIC_TYPE_LAST)
+			break;
+		config->KLV[lic_type_to_KLV_index(p->key)] = p->value[0];
+		i += p->length + 1; /* +1DW to include kev(u16) and len(u16) */
+		p = (struct guc_klv_generic_t *)((u32 *)p + p->length + 1);
+	}
+}
+
+static void xe_guc_log_load_log_buffer(u32 *guc_log, int len,
+				       struct guc_log_init_config_save_t *config)
+{
+	int i = 0;
+	u32 offset = GUC_LOG_BUFFER_STATE_HEADER_LENGTH;
+	struct guc_log_buffer_state *p = (struct guc_log_buffer_state *)guc_log;
+
+	while (p) {
+		for (i = 0; i < GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT; i++) {
+			if (p->marker[0] == entry_markers[i].key[0] &&
+			    p->marker[1] == entry_markers[i].key[1]) {
+				entry_list[i].offset = offset;
+				entry_list[i].rd_ptr = p->read_ptr;
+				entry_list[i].wr_ptr = p->write_ptr;
+				entry_list[i].buf_size = p->size;
+
+				if (i == GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG)
+					config->log_buf_state = *p;
+
+				if (i != GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT) {
+					offset += p->size;
+					p++;
+				} else {
+					/* Load log init config */
+					xe_guc_log_loop_log_init((struct guc_log_init_config_t *)p,
+								 config);
+
+					/* Init config is the last */
+					return;
+				}
+			}
+		}
+		if (i >= GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT)
+			break;
+	}
+}
+
+static uint xe_guc_log_save_to_lfd_buf(char *buf, int size, u32 *guc_log_bin,
+				       struct xe_guc_log *log,
+				       struct guc_log_init_config_save_t *config)
+{
+	int index = 0, len = 0;
+	char *bin = (char *)guc_log_bin;
+	struct guc_logfile_t *guc_logfile;
+
+	if (size < sizeof(struct guc_logfile_t))
+		return -ENOMEM;
+
+	guc_logfile = (struct guc_logfile_t *)buf;
+	*guc_logfile = default_guc_logfile;
+	index = offsetof(struct guc_logfile_t, lfd_stream);
+
+	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_FW_VERSION, config);
+	if (len < 0)
+		return len;
+	index += len;
+
+	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_GUC_DEVICE_ID, config);
+	if (len < 0)
+		return len;
+	index += len;
+
+	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_TSC_FREQUENCY, config);
+	if (len < 0)
+		return len;
+	index += len;
+
+	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LOG_LIC_TYPE_GMD_ID, config);
+	if (len < 0)
+		return len;
+	index += len;
+
+	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID,
+				 config);
+	if (len < 0)
+		return len;
+	index += len;
+
+	len = xe_guc_log_add_os_id(&buf[index], size - index, GUC_LFD_OS_TYPE_OSID_LIN);
+	if (len < 0)
+		return len;
+	index += len;
+
+	len = xe_guc_log_add_log_event(&buf[index], size - index, bin, config);
+	if (len < 0)
+		return len;
+	index += len;
+
+	return index;
+}
+
+static void
+xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
+			      struct xe_guc_log *log)
+{
+	size_t remain;
+	int i;
+	struct guc_log_init_config_save_t init_config;
+
+	if (!snapshot)
+		return;
+
+	remain = snapshot->size;
+	for (i = 0; i < snapshot->num_chunks; i++) {
+		int len = 0;
+		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
+		char *lfd_buf = kzalloc(size, GFP_KERNEL);
+
+		/* load from log bin */
+		xe_guc_log_load_log_buffer(snapshot->copy[i], size, &init_config);
+		/* Conver to LFD format */
+		len = xe_guc_log_save_to_lfd_buf(lfd_buf, size, snapshot->copy[i], log,
+						 &init_config);
+		if (len > 0)
+			xe_print_blob_ascii85(p, "[LOG].data", 0, lfd_buf, 0, len);
+		kfree(lfd_buf);
+		XE_WARN_ON(len <= 0);
+
+		remain -= size;
+	}
+}
+
 /**
  * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
  * @log: GuC log structure
@@ -251,6 +605,20 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
 	xe_guc_log_snapshot_free(snapshot);
 }
 
+/**
+ * xe_guc_log_print_lfd - dump a copy of the GuC log to some useful location
+ * @log: GuC log structure
+ * @p: the printer object to output to
+ */
+void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p)
+{
+	struct xe_guc_log_snapshot *snapshot;
+
+	snapshot = xe_guc_log_snapshot_capture(log, false);
+	xe_guc_log_snapshot_print_lfd(snapshot, p, log);
+	xe_guc_log_snapshot_free(snapshot);
+}
+
 int xe_guc_log_init(struct xe_guc_log *log)
 {
 	struct xe_device *xe = log_to_xe(log);
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 5b896f5fafaf..37ff4d11e6cf 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -40,6 +40,7 @@ struct xe_device;
 
 int xe_guc_log_init(struct xe_guc_log *log);
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
+void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
 void xe_guc_log_print_dmesg(struct xe_guc_log *log);
 struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
 void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
-- 
2.34.1

