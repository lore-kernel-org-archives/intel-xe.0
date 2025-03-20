Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52ABC28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 15:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A80210E09B;
	Thu, 20 Mar 2025 15:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Za1se5MN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839B410E09B
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 15:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742483005; x=1774019005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9Ch0lSyEKyeA90NZ9Q6VznYztR04ETulWurJtRV5TNw=;
 b=Za1se5MNmTH0OoNSTU9bkPy0nXtzX3VDrTuNdrXIuIGIPyRYP9pDHX3+
 9hz3m9kN+CkzQV05tkY1r0zvv3ZsF8b52V9VaL1Rov8aoHa6mYRjsdg7V
 ODaPy4nAJVgBfxBOKekoNXNOqvnhFu/VvP0GuLu4SnYddwHQGy2R+aY1e
 8ZTjql0I2lF2IXzbuPqagSiyVsGRo2zzj1oXVzYjWSVly6KfuT0OLGIJG
 ndjWSdmm7iXzdy+B9w4gvzmhbMdgBWAy8UV9L+PwybTaljE3mAi/rVXcM
 vodguSj4sMASsGq8UEBptQpsWecGPNIrk6rok675fXIEeW8pJKmdUW7XQ A==;
X-CSE-ConnectionGUID: M3izZIiDTROXvFKALHBppQ==
X-CSE-MsgGUID: fUZscyqwToWW6GBXgnJNyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54384536"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="54384536"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 08:03:22 -0700
X-CSE-ConnectionGUID: R3bJ7OepQ52yZPHM0n+txg==
X-CSE-MsgGUID: o4VfTSbQRyWI7WfLb/EBGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="128217635"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa004.fm.intel.com with ESMTP; 20 Mar 2025 08:03:21 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v1] drm/xe/guc: Add LFD format output for guc log
Date: Thu, 20 Mar 2025 08:03:20 -0700
Message-Id: <20250320150320.3595975-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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
in LFD format.
Add flag of GuC crash dump received from GuC, LFD only include crash dump
section when this flag is set.

Reference:
https://coredocs.intel.com/InterfaceDocs/sphinx/core/debug.html#streaming-log-file-format-lfds

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h | 494 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c           |  13 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c      |  14 +
 drivers/gpu/drm/xe/xe_guc_log.c          | 327 +++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h          |   1 +
 drivers/gpu/drm/xe/xe_guc_log_types.h    |   2 +
 6 files changed, 846 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h

diff --git a/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
new file mode 100644
index 000000000000..3e056ddc55be
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
@@ -0,0 +1,494 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _INTEL_GUC_LFD_H_
+#define _INTEL_GUC_LFD_H_
+
+#include <linux/types.h>
+
+/* The current major version of GuC-Log-File format. */
+#define GUC_LOG_FILE_FORMAT_VERSION_MAJOR	0x0001
+
+/* The current minor version of GuC-Log-File format. */
+#define GUC_LOG_FILE_FORMAT_VERSION_MINOR	0x0000
+
+/* Magic keys define */
+#define GUC_LOGFILE_LFD_MAGIC			0x8086
+#define LFD_DRIVER_KEY_1			0X808655CC
+#define LFD_DRIVER_KEY_1			0X808655CC
+#define LFD_DRIVER_KEY_1V2			0X808655DD
+#define LFD_DRIVER_KEY_2			0X8086EEAA
+#define LFD_DRIVER_KEY_2V2			0X8086EEBB
+#define LFD_DRIVER_KEY_STREAMING1		0X474C5346
+#define LFD_DRIVER_KEY_STREAMING2		0X8086AAAA
+#define LFD_DRIVER_KEY_STREAMING		0X8086AAAA474C5346
+#define LFD_LOG_BUFFER_MARKER_1			0XCABBA9E5
+#define LFD_LOG_BUFFER_MARKER_2			0XDEADFEED
+#define LFD_CRASH_DUMP_BUFFER_MARKER_1		0XCABBA9E5
+#define LFD_CRASH_DUMP_BUFFER_MARKER_2		0X8086DEAD
+#define LFD_STATE_CAPTURE_BUFFER_MARKER_1	0XCABBA9F6
+#define LFD_STATE_CAPTURE_BUFFER_MARKER_2	0XBEEFFEED
+#define LFD_LOG_BUFFER_MARKER_1V2		0XCABBA9E6
+#define LFD_CRASH_DUMP_BUFFER_MARKER_1V2	0XCABBA9E6
+#define LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0XCABBA9F7
+
+#define GUC_LOG_BUFFER_STATE_HEADER_LENGTH		4096
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT		4
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG		0
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH		1
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CAPTURE	2
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT		3
+
+#define GUC_LOG_INIT_CONFIG_LIC_MAGIC			0x8086900D
+#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR	0x0001
+#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR	0x0000
+
+#define GUC_LOG_EVENT_ENTRY_FORMAT_VERSION		2
+
+#define LFD_MAGIC_SIM_KEY				0X900DFEED
+
+/* Log format descriptor type. */
+enum  guc_lfd_type_t {
+	/* Start of range for required LFDs from GuC. */
+	GUC_LFD_TYPE_FW_REQUIRED_RANGE_START = 0x1,
+
+	/*
+	 * GuC Firmware Version structure. LFDs payload is
+	 * guc_lfd_data_fw_version_t
+	 */
+	GUC_LFD_TYPE_FW_VERSION = 0x1,
+
+	/*
+	 * GuC microcontroller device ID. LFDs payload is
+	 * guc_lfd_data_guc_devid_t
+	 */
+	GUC_LFD_TYPE_GUC_DEVICE_ID = 0x2,
+
+	/*
+	 * Frequency of GuC timestamps. LFDs payload is
+	 * guc_lfd_data_tsc_freq_t.
+	 */
+	GUC_LFD_TYPE_TSC_FREQUENCY = 0x3,
+
+	/* End of this range. */
+	GUC_LFD_TYPE_FW_REQUIRED_RANGE_END = 0x1FFF,
+
+	/* Start of range for required LFDs from GuC. */
+	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START = 0x2000,
+
+	/*
+	 * Log-event-entries buffer. LFDs payload is
+	 * guc_lfd_data_log_events_buf_t
+	 */
+	GUC_LFD_TYPE_LOG_EVENTS_BUFFER = 0x2000,
+
+	/*
+	 * GuC generated crash-dump blob. LFDs payload is
+	 * guc_lfd_data_fw_crashdump_t
+	 */
+	GUC_LFD_TYPE_FW_CRASH_DUMP = 0x2001,
+
+	/* End of this range. */
+	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END = 0x3FFF,
+
+	/* Start of range for required KMD LFDs. */
+	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
+
+	/* An identifier for the OS. LFDs payload is guc_lfd_data_os_id_t. */
+	GUC_LFD_TYPE_OS_ID = 0x4000,
+
+	/* End of this range. */
+	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,
+
+	/* Start of range for optional KMD LFDs. */
+	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START = 0x6000,
+
+	/*
+	 * Binary representation of GuC log-events schema.
+	 * LFDs TLV payload is guc_lfd_data_binary_schema_t
+	 */
+	GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT = 0x6000,
+
+	/*
+	 * ASCII string containing comments from the host/KMD.
+	 * LFDs TLV payload is guc_lfd_data_host_comment_t
+	 */
+	GUC_LFD_TYPE_HOST_COMMENT = 0x6001,
+
+	/* End of this range. */
+	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END = 0x7FFF,
+
+	/* Start of reserved range. */
+	GUC_LFD_TYPE_RESERVED_RANGE_START = 0x8000,
+
+	/* End of this range. */
+	GUC_LFD_TYPE_RESERVED_RANGE_END = 0xFFFF,
+};
+
+/* OS Type LFD-ID. */
+enum  guc_lfd_os_type_t {
+	/* Windows OS. */
+	GUC_LFD_OS_TYPE_OSID_WIN = 0x1,
+
+	/* Linux OS. */
+	GUC_LFD_OS_TYPE_OSID_LIN = 0x2,
+
+	/* VMWare OS. */
+	GUC_LFD_OS_TYPE_OSID_VMW = 0x3,
+
+	/* Other. */
+	GUC_LFD_OS_TYPE_OSID_OTHER = 0x4,
+};
+
+/*
+ * Log format descriptor (LFD). A type of KLV with custom
+ * field-sizes + magic numbers.
+ */
+struct guc_logfile_lfd_t {
+	/* BR[15:0] Expected value: 0x8086. Helpful in detecting file errors. */
+	u32 magic : 16;
+
+	/*
+	 * BR[31:16] File descriptor type (the ‘T’ in TLV) is used to identify
+	 * how to interpret data below. For the range of types,
+	 * see guc_lfd_type_t
+	 */
+	u32 desc_type : 16;
+
+	/* Number of dwords the data field contains. */
+	u32 desc_dw_size;
+
+	/* Data defined by File descriptor type. */
+	u32 data[];
+};
+
+/*
+ * GuC Log File Format Version. Major-Minor is not a fractional number
+ * (i.e. Ver 1.3 would be older than 1.12)
+ */
+struct guc_logfile_fmt_ver_t {
+	/*
+	 * BR[15: 0] Guc-Log-File Format minor version.
+	 * Must be GUC_LOG_FILE_FORMAT_VERSION_MINOR
+	 */
+	u32 minor_version : 16;
+
+	/*
+	 * BR[31:16] Guc-Log-File Format major version.
+	 * Must be GUC_LOG_FILE_FORMAT_VERSION_MAJOR
+	 */
+	u32 major_version : 16;
+};
+
+/*
+ * GuC Log Streaming-LFD-File Format. This structure encapsulates the layout of
+ * the guc-log-file format.
+ */
+struct guc_logfile_t {
+	/*
+	 * A magic number set by producer of a GuC log file to identify that
+	 * file is a valid guc-log-file containing a stream of LFDs:
+	 * Expected value: 0x8086AAAA474C5346.
+	 */
+	u64 magic;
+
+	/* Version of this file format layout as per guc_logfile_fmt_ver_t. */
+	struct guc_logfile_fmt_ver_t version;
+
+	/* A stream of one or more guc_logfile_lfd_t LFD data. */
+	struct guc_logfile_lfd_t lfd_stream[];
+};
+
+/* This structure describes the full version of a software component. */
+struct guc_sw_version_t {
+	/* BR[ 7: 0] Patch version. */
+	u32 patch_version : 8;
+
+	/* BR[15: 8] Minor version. */
+	u32 minor_version : 8;
+
+	/* BR[23:16] Major version. */
+	u32 major_version : 8;
+
+	/* BR[31:24] Branch ID. */
+	u32 branch_id : 8;
+};
+
+/* GuC FW Version. This is mandatory fw LFD data. */
+struct guc_lfd_data_fw_version_t {
+	/* The full version of the GuC microkernel that generated the logs. */
+	struct guc_sw_version_t guc_sw_version;
+};
+
+/*
+ * Log Init Config Types.
+ * The first word of the each TLV payload of guc_log_init_config_t contains one
+ * of the following enum values. This value determines how subsequent bytes are
+ * parsed to obtain the TLV information.
+ */
+enum guc_log_lic_type_t {
+	/*
+	 * GuC firmware version.
+	 * Value is a 32 bit number represented by guc_sw_version_t.
+	 */
+	GUC_LOG_LIC_TYPE_GUC_SW_VERSION = 0x1,
+
+	/*
+	 * GuC device id.
+	 * Value is a 32 bit. Refer BSpec symbol GUC_DEVICEID
+	 * https://gfxspecs.intel.com/Predator/Home/Index/60513 for more
+	 * details.
+	 */
+	GUC_LOG_LIC_TYPE_GUC_DEVICE_ID = 0x2,
+
+	/* The first u32 KLV type */
+	GUC_LOG_LIC_TYPE_FIRST = GUC_LOG_LIC_TYPE_GUC_DEVICE_ID,
+
+	/*
+	 * GuC timestamp counter frequency.
+	 * Value is a 32 bit number representing frequency in kilohertz.
+	 * This timestamp is utilized in log entries, timer and for engine
+	 * utilization tracking.
+	 */
+	GUC_LOG_LIC_TYPE_TSC_FREQUENCY = 0x3,
+
+	/*
+	 * HW GMD ID.
+	 * Value is a 32 bit number representing graphics, media and display
+	 * HW architecture IDs.
+	 */
+	GUC_LOG_LIC_TYPE_GMD_ID = 0x4,
+
+	/* GuC build platform ID. Value is 32 bits. */
+	GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID = 0x5,
+
+	/* The last LIC TYPE */
+	GUC_LOG_LIC_TYPE_LAST,
+};
+
+/* Log Init Config: GUC software version. */
+struct guc_lic_guc_sw_version_t {
+	/* BR[31:16] Number of dwords in proceeding payload = 1. */
+	u32 size : 16;
+
+	/*
+	 * BR[15: 0] Log-init-config
+	 * TLV type enum = GUC_LOG_LIC_TYPE_GUC_SW_VERSION.
+	 */
+	u32 type : 16;
+
+	/* 32 bit number representing the Guc’s software version. */
+	struct guc_sw_version_t guc_sw_version;
+};
+
+/*
+ * Log Init Config Structure Version.
+ * Major-Minor is not a fractional number
+ * (i.e. Ver 1.3 would be older than 1.12)
+ */
+struct guc_lic_format_version_t {
+	/*
+	 * BR[15: 0] Log-Init-Config structure minor  version.
+	 * Must be GUC_LOG_FILE_FORMAT_VERSION_MINOR
+	 */
+	u32 minor_version : 16;
+
+	/*
+	 * BR[31:16] Log-Init-Config structure major version.
+	 * Must be GUC_LOG_FILE_FORMAT_VERSION_MAJOR
+	 */
+	u32 major_version : 16;
+};
+
+/* KLV with multiple DWs in an array. */
+struct guc_klv_generic_t {
+	/* Length in Dwords of data. */
+	u16 length;
+
+	/* Key value. */
+	u16 key;
+
+	/* Value for this key. */
+	u32 value[];
+};
+
+/*
+ * GuC Log-Init-Config structure.
+ * This is populated by the GUC at log init time and is located in the log
+ * buffer as per the Log Buffer Layout (In Memory). The array of guc log
+ * buffer states plus this structure must not exceed 4KB.
+ */
+struct guc_log_init_config_t {
+	/*
+	 * A magic number set by GuC to identify that this structure
+	 * contains valid information: lic_magic = 0x8086900D.
+	 * Used to verify the information in this structure is valid.
+	 */
+	u32 lic_magic;
+
+	/*
+	 * The version of the this structure.
+	 * Detail description is guc_lic_format_version_t
+	 */
+	struct guc_lic_format_version_t lic_ver;
+
+	/* Number of Dws the lic_data array contains. */
+	u32 lic_dw_size;
+
+	/*
+	 * Array of dwords representing a sequence of LIC TLVs types.
+	 * See guc_log_lic_type_t enums
+	 */
+	u32 lic_data[];
+};
+
+/* GuC Log entry format Version 2. */
+struct guc_log_format_version_2_t {
+	/* BR[31: 0] The GuC timestamp of the log event. */
+	u32 timestamp : 32;
+
+	/* BR[19: 0] The Vf ID the log entry has been generated for. */
+	u32 vf_id : 20;
+
+	/* BR[31:20] Reserved. */
+	u32 reserved_1 : 12;
+
+	/* BR[14: 0] The GuC Event ID value for the log event. */
+	u32 event_id : 15;
+
+	/* BR[15:15] Indicates if Event should be visible to Vf Host driver. */
+	u32 vf_visible : 1;
+
+	/*
+	 * BR[17:16] This field contains the verbosity level of the log entry,
+	 * see the Log Verbosity section. This can then be used by the PF driver
+	 * to filter the logs copied to a VF based on the verbosity requested by
+	 * a VF.
+	 */
+	u32 verbosity : 2;
+
+	/* BR[31:18] Reserved. */
+	u32 reserved_2 : 14;
+
+	/* BR[31: 0] The value of Parameter 1 of the log event. */
+	u32 parameter_1 : 32;
+
+	/* BR[31: 0] The value of Parameter 2 of the log event. */
+	u32 parameter_2 : 32;
+};
+
+/* GuC Log Buffer State. */
+struct guc_log_buffer_state_t {
+	/*
+	 * A marker set by the ukernel to identify the buffer state start
+	 * location in a binary file containing the GuC log. This is used
+	 * by log parsing tools. The Current values are:
+	 *
+	 * Log buffer
+	 * Marker[0] 0XCABBA9E6,
+	 * Marker[1] 0XDEADFEED
+	 * Crashdump
+	 * Marker[0] 0XCABBA9E6,
+	 * Marker[1] 0x8086DEAD
+	 * Error State Capture
+	 * Marker[0] 0XCABBA9F7,
+	 * Marker[1] 0XBEEFFEED
+	 * Schema
+	 * Marker[0] 0x808655DD,
+	 * Marker[1] 0x8086EEBB.
+	 * Note: The schema is never written to the memory by ukernel.
+	 * Its an optional feature for KMD to embed schema in guclog file.
+	 */
+	u32 Marker[2];
+
+	/*
+	 * BR[31: 0] This is the Last Byte Offset Location that was read by
+	 * KMD. KMD will write to this and uKernel will read this.
+	 */
+	u32 log_buf_rd_ptr : 32;
+
+	/*
+	 * BR[31: 0] This is the Byte Offset Location that will be written
+	 * by uKernel.
+	 */
+	u32 log_guc_wr_ptr : 32;
+
+	/*
+	 * BR[31: 0] Log buffer size.
+	 * This is written by the KMD and specifies the size of the buffer
+	 * in bytes
+	 */
+	u32 log_buf_size : 32;
+
+	/*
+	 * BR[31: 0] This is written by ukernel to the byte offset of the
+	 * next free entry in the buffer on log buffer half full or state
+	 * capture notification.
+	 */
+	u32 sampled_log_buf_wr_ptr : 32;
+
+	/*
+	 * BR[31: 0] This is the byte offset of location 1 byte after last
+	 * valid guc log event entry written by Guc firmware before there
+	 * was a wraparound.
+	 * This field is updated by guc firmware and should be used by Host
+	 * when copying buffer contents to file.
+	 */
+	u32 log_guc_buff_wrap_offset : 32;
+
+	/*
+	 * BR[ 0: 0] uKernel sets this when log buffer is half full or when
+	 * a flush has been requested by KMD through host2guc.
+	 * uKernel will send GUC2HOST only if this bit is cleared. This is
+	 * to avoid unnecessary interrupts from GuC.
+	 */
+	u32 log_buf_flush_to_file : 1;
+
+	/*
+	 * BR[ 4: 1] uKernel increments this when log buffer overflows.
+	 * This is initialized to 0 by KMD.
+	 */
+	u32 buffer_full_cnt : 4;
+
+	/* BR[31: 5] Reserved. */
+	u32 reserved : 27;
+
+	/*
+	 * BR[31: 0] The Guc-Log-Entry format version, a single integer.
+	 * Current version is GUC_LOG_EVENT_ENTRY_FORMAT_VERSION
+	 */
+	u32 version : 32;
+};
+
+/* GuC Log Events Buffer. This is optional fw LFD data. */
+struct guc_lfd_data_log_events_buf_t {
+	/* version of GuC log format of buffer */
+	u32 log_events_format_version;
+
+	/*
+	 * If log_format_version == 1, array of guc_log_format_version_1_t.
+	 * If log_format_version == 2, array of guc_log_format_version_2_t.
+	 * Dword size determined by guc_logfile_lfd_t.desc_dw_size - 1
+	 */
+	u32 log_format_buf[];
+};
+
+/* OS Version Information. This is mandatory host LFD data. */
+struct guc_lfd_data_os_id_t {
+	/*
+	 * enum values to identify the OS brand (1=Windows, 2=Linux, etc..).
+	 * See guc_lfd_os_type_t for the range of types
+	 */
+	u32 os_id;
+
+	/*
+	 * ASCII string containing OS build version information based on os_id.
+	 * String is padded with null characters to ensure its DWORD aligned.
+	 * Dword size determined by guc_logfile_lfd_t.desc_dw_size - 1
+	 */
+	char build_version[];
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 72ad576fc18e..44c11ec662e5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1127,12 +1127,15 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
 {
 	struct xe_gt *gt = ct_to_gt(ct);
 
-	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
+	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED) {
 		xe_gt_err(gt, "GuC Crash dump notification\n");
-	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
-		xe_gt_err(gt, "GuC Exception notification\n");
-	else
-		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
+		ct_to_guc(ct)->log.crash_dumped = true;
+	} else {
+		if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
+			xe_gt_err(gt, "GuC Exception notification\n");
+		else
+			xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
+	}
 
 	CT_DEAD(ct, NULL, CRASH);
 
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
index 80514a446ba2..447ee3c3b713 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -7,8 +7,12 @@
 
 #include <linux/fault-inject.h>
 
+#include <generated/utsversion.h>
+#include <generated/utsrelease.h>
+
 #include <drm/drm_managed.h>
 
+#include "abi/guc_log_lfd_abi.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
 #include "xe_devcoredump.h"
@@ -19,6 +23,63 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 
+static struct guc_log_buffer_entry_list {
+	u32 key[2];
+	u32 offset;
+	u32 rd_ptr;
+	u32 wr_ptr;
+	u32 buf_size;
+} entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT] = {
+	{
+		{
+			LFD_LOG_BUFFER_MARKER_1V2,
+			LFD_LOG_BUFFER_MARKER_2
+		}
+	},
+	{
+		{
+			LFD_LOG_BUFFER_MARKER_1V2,
+			LFD_CRASH_DUMP_BUFFER_MARKER_2
+		}
+	},
+	{
+		{
+			LFD_STATE_CAPTURE_BUFFER_MARKER_1V2,
+			LFD_STATE_CAPTURE_BUFFER_MARKER_2
+		}
+	},
+	{
+		{
+			GUC_LOG_INIT_CONFIG_LIC_MAGIC,
+			((GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR << 16)
+			 | GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR)
+		}
+	},
+};
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
+	struct guc_sw_version_t fw_ver;
+	/*
+	 * Array of init config KLVs.
+	 * Range from GUC_LOG_LIC_TYPE_FIRST to
+	 * GUC_LOG_LIC_TYPE_LAST
+	 */
+	u32 KLV[GUC_LOG_LIC_TYPE_LAST - GUC_LOG_LIC_TYPE_FIRST];
+	struct guc_log_buffer_state_t log_buf_state;
+};
+
 static struct xe_guc *
 log_to_guc(struct xe_guc_log *log)
 {
@@ -216,6 +277,258 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	}
 }
 
+static int xe_guc_log_add_lfd_header(char *buf)
+{
+	int len;
+
+	len = sizeof(default_guc_logfile_lfd);
+	memcpy(buf, &default_guc_logfile_lfd, len);
+
+	return len;
+}
+
+static int xe_guc_log_add_payload(char *buf, u32 data_len, void *data)
+{
+	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
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
+static int xe_guc_log_add_typed_payload(char *buf, u32 type, u32 data_len, void *data)
+{
+	int len;
+	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
+
+	len = xe_guc_log_add_lfd_header(buf);
+	lfd->desc_type = type;
+	len += xe_guc_log_add_payload(buf, data_len, data);
+
+	return len;
+}
+
+static int xe_guc_log_add_os_id(char *buf, u32 id)
+{
+	int info_len;
+	int len = xe_guc_log_add_lfd_header(buf);
+	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
+	struct guc_lfd_data_os_id_t *os_id = (struct guc_lfd_data_os_id_t *)lfd->data;
+
+	os_id->os_id = id;
+	info_len = strlen(UTS_RELEASE) + 1;
+	strscpy(os_id->build_version, UTS_RELEASE, info_len);
+	len = xe_guc_log_add_typed_payload(buf, GUC_LFD_TYPE_OS_ID,
+					   info_len + sizeof(*os_id), os_id);
+
+	return len;
+}
+
+static int
+xe_guc_log_add_log_event(char *buf, char *log_bin, struct guc_log_init_config_save_t *config)
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
+	len = xe_guc_log_add_lfd_header(buf);
+	lfd = (struct guc_logfile_lfd_t *)buf;
+
+	lfd->desc_type = GUC_LFD_TYPE_LOG_EVENTS_BUFFER;
+	events_buf = (struct guc_lfd_data_log_events_buf_t *)&lfd->data;
+	events_buf->log_events_format_version = config->log_buf_state.version;
+
+	data = log_bin + entry->offset + entry->rd_ptr;
+	if (entry->rd_ptr < entry->wr_ptr) {
+		data_len = entry->wr_ptr - entry->rd_ptr;
+		memcpy(events_buf->log_format_buf, data, data_len);
+	} else {
+		/* Copy rd to buf end 1st */
+		data_len = entry->buf_size - entry->rd_ptr;
+		memcpy(events_buf->log_format_buf, data, data_len);
+
+		/* Copy buf start to wr */
+		data = &log_bin[entry->offset];
+		memcpy(&events_buf->log_format_buf[data_len / 4], data, entry->wr_ptr);
+		data_len += entry->wr_ptr;
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
+static int xe_guc_log_add_klv(char *buf, u32 lic_type, struct guc_log_init_config_save_t *config)
+{
+	return xe_guc_log_add_typed_payload(buf, lic_type, sizeof(u32),
+				 &config->KLV[lic_type_to_KLV_index(lic_type)]);
+}
+
+static void xe_guc_log_loop_log_init(struct guc_log_init_config_t *init,
+				     struct guc_log_init_config_save_t *config)
+{
+	int i;
+	struct guc_klv_generic_t *p = (struct guc_klv_generic_t *)init->lic_data;
+
+	for (i = 0; i < init->lic_dw_size;) {
+		if (p->key < GUC_LOG_LIC_TYPE_GUC_SW_VERSION || p->key >= GUC_LOG_LIC_TYPE_LAST)
+			break;
+		if (p->key == GUC_LOG_LIC_TYPE_GUC_SW_VERSION)
+			config->fw_ver = ((struct guc_lic_guc_sw_version_t *)p)->guc_sw_version;
+		else
+			config->KLV[lic_type_to_KLV_index(p->key)] = p->value[0];
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
+	struct guc_log_buffer_state_t *p = (struct guc_log_buffer_state_t *)guc_log;
+
+	while (p) {
+		for (i = 0; i < GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT; i++) {
+			if (p->Marker[0] == entry_list[i].key[0] &&
+			    p->Marker[1] == entry_list[i].key[1]) {
+				entry_list[i].offset = offset;
+				entry_list[i].rd_ptr = p->log_buf_rd_ptr;
+				entry_list[i].wr_ptr = p->log_guc_wr_ptr;
+				entry_list[i].buf_size = p->log_buf_size;
+
+				if (i == GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG)
+					config->log_buf_state = *p;
+
+				if (i != GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT) {
+					offset += p->log_buf_size;
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
+static uint xe_guc_log_save_to_lfd_buf(char *buf, u32 *guc_log_bin, struct xe_guc_log *log,
+				       struct guc_log_init_config_save_t *config)
+{
+	u32 index = 0;
+	char *bin = (char *)guc_log_bin;
+	struct guc_logfile_t *guc_logfile;
+	struct guc_log_buffer_entry_list *entry;
+
+	guc_logfile = (struct guc_logfile_t *)buf;
+	*guc_logfile = default_guc_logfile;
+
+	index = offsetof(struct guc_logfile_t, lfd_stream);
+	index += xe_guc_log_add_typed_payload(&buf[index], GUC_LFD_TYPE_FW_VERSION,
+				   sizeof(config->fw_ver), &config->fw_ver);
+	index += xe_guc_log_add_klv(&buf[index], GUC_LFD_TYPE_GUC_DEVICE_ID, config);
+	index += xe_guc_log_add_klv(&buf[index], GUC_LFD_TYPE_TSC_FREQUENCY, config);
+	index += xe_guc_log_add_klv(&buf[index], GUC_LOG_LIC_TYPE_GMD_ID, config);
+	index += xe_guc_log_add_klv(&buf[index], GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID, config);
+	index += xe_guc_log_add_os_id(&buf[index], GUC_LFD_OS_TYPE_OSID_LIN);
+	index += xe_guc_log_add_log_event(&buf[index], bin, config);
+
+	/* For Crash dump, rd/wr ptr has no effect, only add if crash_dumped is true */
+	if (log->crash_dumped) {
+		entry = &entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH];
+		if (entry->buf_size) {
+			int i;
+			u32 *buf32 = (u32 *)&bin[entry->offset];
+
+			/* Is crash dump section has non zero data? */
+			for (i = 0; i < entry->buf_size / 4; i++)
+				if (buf32[i])
+					break;
+			/* Buffer has non-zero data */
+			if (i < entry->buf_size / 4)
+				index += xe_guc_log_add_typed_payload(&buf[index],
+								      GUC_LFD_TYPE_FW_CRASH_DUMP,
+								      entry->buf_size,
+								      &bin[entry->offset]);
+			/* Clear flag */
+			log->crash_dumped = false;
+		}
+	}
+
+	return index;
+}
+
+/**
+ * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
+ * @snapshot: a snapshot of the GuC log
+ * @p: the printer object to output to
+ */
+static void
+xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
+			      struct xe_guc_log *log)
+{
+	size_t remain;
+	int i;
+	struct guc_log_init_config_save_t init_config;
+
+	if (!snapshot) {
+		drm_printf(p, "GuC log snapshot not allocated!\n");
+		return;
+	}
+
+	remain = snapshot->size;
+	for (i = 0; i < snapshot->num_chunks; i++) {
+		uint len = 0;
+		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
+		char *lfd_buf = kzalloc(size, GFP_KERNEL);
+
+		/* load from log bin */
+		xe_guc_log_load_log_buffer(snapshot->copy[i], size, &init_config);
+		/* Conver to LFD format */
+		len = xe_guc_log_save_to_lfd_buf(lfd_buf, snapshot->copy[i], log, &init_config);
+
+		xe_print_blob_ascii85(p, "[LOG].data", 0, lfd_buf, 0, len);
+		kfree(lfd_buf);
+
+		remain -= size;
+	}
+}
+
 /**
  * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
  * @log: GuC log structure
@@ -251,6 +564,20 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
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
diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
index b3d5c72ac752..d351f639727b 100644
--- a/drivers/gpu/drm/xe/xe_guc_log_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
@@ -46,6 +46,8 @@ struct xe_guc_log {
 	u32 level;
 	/** @bo: XE BO for GuC log */
 	struct xe_bo *bo;
+	/** @crash_dumped: Indicate if crash dumped */
+	bool crash_dumped;
 	/** @stats: logging related stats */
 	struct {
 		u32 sampled_overflow;
-- 
2.34.1

