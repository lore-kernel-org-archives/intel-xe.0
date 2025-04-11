Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CC5C36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 15:28:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39A410E098;
	Fri, 11 Apr 2025 15:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtCm1HND";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799EF10E098
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 15:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744385304; x=1775921304;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=luEDdiCgDk9i7kWpwf0eGSGHfkmHQnqSmCUf5S/l+bc=;
 b=MtCm1HNDdp0eo3VmgTfdy6NKsxHY6WVtxHQ531CEArNhs+d0nbJrAQx8
 GOv75FjGgjaORMhQGtXHijZNeHE7ts4DgTZLZ+18rrRUjSb4Iwy+EL0iX
 PVOzLC9hsJriS4Mp+psDeIQBE4hg/FfW7vyF9cLRYL5R6Tp96yUSb48j/
 JZTZW/VWhUTS5ctOncZ70Ww9bY93tCSEyGrXdNoB/iwoByclUdfDJdRXa
 Jj/5Q/YFMTvYkvqGqrdc6qbGYHXYjdTGR7RqtoZaoJHr1An9LxiGlmGwP
 hNHkDy7aO9voOZlQfWjrhk9auqdBD2HLRGUAEIP3LustdQg8u5Cf9kwO3 w==;
X-CSE-ConnectionGUID: caeDjGUhQ0aFYIVYNX3vxQ==
X-CSE-MsgGUID: q97sEAYKQAyeWopFg/ku8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="49745101"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="49745101"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 08:28:24 -0700
X-CSE-ConnectionGUID: FvVr2umZSOeTMJ2vUX0QQQ==
X-CSE-MsgGUID: H8sIBMRgQCexwXO601lscg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="129786182"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 11 Apr 2025 08:28:18 -0700
Received: from [10.245.96.73] (mwajdecz-MOBL.ger.corp.intel.com [10.245.96.73])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6A02F34934;
 Fri, 11 Apr 2025 16:28:16 +0100 (IST)
Message-ID: <67483d2d-147f-4b7c-bad7-521162a69124@intel.com>
Date: Fri, 11 Apr 2025 17:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/xe/guc: Add LFD related abi definitions
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>
References: <20250410155853.574830-1-zhanjun.dong@intel.com>
 <20250410155853.574830-2-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250410155853.574830-2-zhanjun.dong@intel.com>
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



On 10.04.2025 17:58, Zhanjun Dong wrote:
> Add GuC LFD(Log Format Descriptors) related ABI definition.

Add GuC LFD (Log Format Descriptors) related ABI definitions.

and IMO due to a size this deserves a separate patch.

> Add GuC log init config(LIC) ABI definition.

Add GuC Log Init Config (LIC) ABI definitions.

> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_log_abi.h     | 116 ++++++++++
>  drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h | 265 +++++++++++++++++++++++
>  2 files changed, 381 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> index 554630b7ccd9..0b0c5631da93 100644
> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> @@ -17,6 +17,122 @@ enum guc_log_buffer_type {
>  
>  #define GUC_LOG_BUFFER_TYPE_MAX		3
>  
> +#define GUC_LOG_BUFFER_STATE_HEADER_LENGTH		4096
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG		0
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH		1
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CAPTURE	2

what's the relation of above #defs to enum guc_log_buffer_type, that
seems to be have similar enumerators

> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT		3
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT		4
> +

all below definitions seems to be about LIC and since LIC concept seems
to be less connected with the legacy struct guc_log_buffer_state then
maybe create separate guc_log_lic_abi.h file?

> +#define GUC_LOG_INIT_CONFIG_LIC_MAGIC			0x8086900D
> +#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR	0x0001
> +#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR	0x0000
> +
> +/** Log Init Config KLV IDs. */

this is not proper kernel-doc format

> +enum guc_log_lic_type_t {

please drop "_t" suffix

> +	/**
> +	 * GuC firmware version. Value is a 32 bit number represented by
> +	 * guc_sw_version_t.
> +	 */
> +	GUC_LOG_LIC_TYPE_GUC_SW_VERSION = 0x1,
> +	/**
> +	 * GuC device id. Value is a 32 bit. Refer BSpec symbol
> +	 * GUC_DEVICEID
> +	 */
> +	GUC_LOG_LIC_TYPE_GUC_DEVICE_ID = 0x2,
> +	/**
> +	 * GuC timestamp counter frequency. Value is a 32 bit number
> +	 * representing frequency in kilohertz. This timestamp is utilized
> +	 * in log entries, timer and for engine utilization tracking.
> +	 */
> +	GUC_LOG_LIC_TYPE_TSC_FREQUENCY = 0x3,
> +	/**
> +	 * HW GMD ID. Value is a 32 bit number representing graphics,
> +	 * media and display HW architecture IDs.
> +	 */
> +	GUC_LOG_LIC_TYPE_GMD_ID = 0x4,
> +	/** GuC build platform ID. Value is 32 bits. */
> +	GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID = 0x5,

well, none of above comments are proper kernel-doc, please fix

> +};
> +
> +#define GUC_LOG_LIC_TYPE_FIRST	(GUC_LOG_LIC_TYPE_GUC_SW_VERSION)
> +#define GUC_LOG_LIC_TYPE_LAST	(GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID + 1)
> +
> +/** struct guc_klv_generic_t - KLV with multiple DWs in an array */
> +struct guc_klv_generic_t {
> +	/** @length: Length in Dwords of data. */
> +	u16		length;
> +	/** @key: Key value */
> +	u16		key;

previously there were comments that due to different endianess we
shouldn't define struct in this way, what has changed?

> +	/** @value: Value for this key */
> +	u32		value[] __counted_by(length);
> +} __packed;

this looks like existing `GuC KLV`_ definition
shouldn't be moved there (if it's the same and really needed)

> +
> +/**
> + * struct guc_sw_version_t - This structure describes the full version of
> + * a software component.
> + */
> +struct guc_sw_version_t {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32		dw0;
> +	/* BR[7:0]  Patch version */
> +	#define GUC_SW_VERSION_T_PATCH_VERSION		GENMASK(7, 0)
> +	/* BR[15:8]  Minor version */
> +	#define GUC_SW_VERSION_T_MINOR_VERSION		GENMASK(15, 8)
> +	/* BR[23:16]  Major version */
> +	#define GUC_SW_VERSION_T_MAJOR_VERSION		GENMASK(23, 16)
> +	/* BR[31:24]  Branch ID */
> +	#define GUC_SW_VERSION_T_BRANCH_ID		GENMASK(31, 24)
> +} __packed;
> +
> +/**
> + * struct guc_lic_format_version_t - Log Init Config Structure Version.
> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
> + * than 1.12)
> + */
> +struct guc_lic_format_version_t {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32		dw0;
> +	/*
> +	 * BR[15:0]  Log-Init-Config structure minor version. Must be
> +	 * GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR
> +	 */
> +	#define GUC_LIC_FORMAT_VERSION_T_MINOR_VERSION		GENMASK(15, 0)
> +	/*
> +	 * BR[31:16]  Log-Init-Config structure major version. Must be
> +	 * GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR
> +	 */
> +	#define GUC_LIC_FORMAT_VERSION_T_MAJOR_VERSION		GENMASK(31, 16)
> +} __packed;
> +
> +/**
> + * struct guc_log_init_config_t - GuC Log-Init-Config structure.
> + * This is populated by the GUC at log init time and is located in the log
> + * buffer as per the Log Buffer Layout (In Memory). The array of guc log
> + * buffer states plus this structure must not exceed 4KB
> + */
> +struct guc_log_init_config_t {
> +	/**
> +	 * @lic_magic: A magic number set by GuC to identify that this
> +	 * structure contains valid information: lic_magic = 0x8086900D.
> +	 * Used to verify the information in this structure is valid.
> +	 */
> +	u32		lic_magic;

why do we have "lic_" prefix everywhere here?
this *is* a LIC struct, no point to repeat that

> +	/**
> +	 * @lic_ver: The version of the this structure. Detail description
> +	 * is guc_lic_format_version_t
> +	 */
> +	struct guc_lic_format_version_t	lic_ver;
> +	/** @lic_dw_size: Number of Dws the `lic_data` array contains. */
> +	u32		lic_dw_size;
> +	/**
> +	 * @lic_data: Array of dwords representing a list of LIC KLVs of
> +	 * type guc_klv_generic_t with keys represented by
> +	 * guc_log_lic_type_t
> +	 */
> +	u32		lic_data[] __counted_by(desc_dw_size);
> +} __packed;
> +
>  /**
>   * struct guc_log_buffer_state - GuC log buffer state
>   *
> diff --git a/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
> new file mode 100644
> index 000000000000..b4002f099fd5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
> @@ -0,0 +1,265 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _ABI_GUC_LOG_LFD_ABI_H_
> +#define _ABI_GUC_LOG_LFD_ABI_H_
> +
> +#include <linux/types.h>
> +
> +#include "abi/guc_log_abi.h"
> +
> +/* Magic keys define */
> +#define LFD_DRIVER_KEY_STREAMING		0x8086AAAA474C5346
> +#define LFD_LOG_BUFFER_MARKER_2			0xDEADFEED
> +#define LFD_CRASH_DUMP_BUFFER_MARKER_2		0x8086DEAD
> +#define LFD_STATE_CAPTURE_BUFFER_MARKER_2	0xBEEFFEED
> +#define LFD_LOG_BUFFER_MARKER_1V2		0xCABBA9E6
> +#define LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0xCABBA9F7
> +
> +#define GUC_LOGFILE_LFD_MAGIC	upper_16_bits(LFD_CRASH_DUMP_BUFFER_MARKER_2)

upper_16_bits() requires #include <linux/wordpart.h>
but maybe we can avoid that by doing:

#define GUC_LOGFILE_LFD_MAGIC	0x8086

> +
> +/** The current major version of GuC-Log-File format. */
> +#define GUC_LOG_FILE_FORMAT_VERSION_MAJOR	0x0001
> +/** The current minor version of GuC-Log-File format. */
> +#define GUC_LOG_FILE_FORMAT_VERSION_MINOR	0x0000
> +

almost all kernel-doc (above/below) seem to be broken

> +/** Log format descriptor type */
> +enum guc_lfd_type_t {
> +	/** Start of range for required LFDs from GuC */
> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_START = 0x1,
> +	/**
> +	 * GuC Firmware Version structure. LFDs payload is
> +	 * guc_lfd_data_fw_version_t
> +	 */
> +	GUC_LFD_TYPE_FW_VERSION = 0x1,
> +	/**
> +	 * GuC microcontroller device ID. LFDs payload is
> +	 * guc_lfd_data_guc_devid_t
> +	 */
> +	GUC_LFD_TYPE_GUC_DEVICE_ID = 0x2,
> +	/**
> +	 * Frequency of GuC timestamps. LFDs payload is
> +	 * guc_lfd_data_tsc_freq_t
> +	 */
> +	GUC_LFD_TYPE_TSC_FREQUENCY = 0x3,
> +	/** HW GMD ID. LFDs payload is guc_lfd_data_gmdid_t */
> +	GUC_LFD_TYPE_GMD_ID = 0x4,
> +	/**
> +	 * GuC build platform ID. LFDs payload is
> +	 * guc_lfd_data_build_platformid_t
> +	 */
> +	GUC_LFD_TYPE_BUILD_PLATFORM_ID = 0x5,
> +	/** End of this range */
> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_END = 0x1FFF,
> +	/** Start of range for required LFDs from GuC */
> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START = 0x2000,
> +	/**
> +	 * Log-event-entries buffer. LFDs payload is
> +	 * guc_lfd_data_log_events_buf_t
> +	 */
> +	GUC_LFD_TYPE_LOG_EVENTS_BUFFER = 0x2000,
> +	/**
> +	 * GuC generated crash-dump blob. LFDs payload is
> +	 * guc_lfd_data_fw_crashdump_t
> +	 */
> +	GUC_LFD_TYPE_FW_CRASH_DUMP = 0x2001,
> +	/** End of this range */
> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END = 0x3FFF,
> +	/** Start of range for required KMD LFDs */
> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
> +	/**
> +	 * An identifier for the OS. LFDs payload is guc_lfd_data_os_id_t
> +	 */
> +	GUC_LFD_TYPE_OS_ID = 0x4000,
> +	/** End of this range */
> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,
> +	/** Start of range for optional KMD LFDs */
> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START = 0x6000,
> +	/**
> +	 * Binary representation of GuC log-events schema. LFDs TLV
> +	 * payload is guc_lfd_data_binary_schema_t
> +	 */
> +	GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT = 0x6000,
> +	/**
> +	 * ASCII string containing comments from the host/KMD. LFDs TLV
> +	 * payload is guc_lfd_data_host_comment_t
> +	 */
> +	GUC_LFD_TYPE_HOST_COMMENT = 0x6001,
> +	/** End of this range */
> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END = 0x7FFF,
> +	/** Start of reserved range */
> +	GUC_LFD_TYPE_RESERVED_RANGE_START = 0x8000,
> +	/** End of this range */
> +	GUC_LFD_TYPE_RESERVED_RANGE_END = 0xFFFF,
> +};
> +
> +/** OS Type LFD-ID */
> +enum guc_lfd_os_type_t {
> +	/** Windows OS */
> +	GUC_LFD_OS_TYPE_OSID_WIN = 0x1,
> +	/** Linux OS */
> +	GUC_LFD_OS_TYPE_OSID_LIN = 0x2,
> +	/** VMWare OS */
> +	GUC_LFD_OS_TYPE_OSID_VMW = 0x3,
> +	/** Other */
> +	GUC_LFD_OS_TYPE_OSID_OTHER = 0x4,
> +};
> +
> +/**
> + * struct guc_logfile_lfd_t - Log format descriptor (LFD).
> + * A type of KLV with custom field-sizes + magic numbers.
> + */
> +struct guc_logfile_lfd_t {

better name for this would be

	struct guc_lfd_header

as later we have specific:

	struct guc_lfd_data_xxx

> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32		dw0;

usually we *do not* align member names with tabs

> +	/*
> +	 * BR[15:0]  Expected value: 0x8086. Helpful in detecting file
> +	 * errors.
> +	 */
> +	#define GUC_LOGFILE_LFD_T_MAGIC		GENMASK(15, 0)
> +	/*
> +	 * BR[31:16]  File descriptor type (the 'T' in TLV) is used to
> +	 * identify how to interpret `data` below. For the range of types,
> +	 * see guc_lfd_type_t
> +	 */
> +	#define GUC_LOGFILE_LFD_T_DESC_TYPE		GENMASK(31, 16)
> +	/** @desc_dw_size: Number of dwords the `data` field contains. */
> +	u32		desc_dw_size;
> +	/** @data: Data defined by File descriptor type. */
> +	u32		data[] __counted_by(desc_dw_size);
> +} __packed;
> +
> +/**
> + * struct guc_logfile_fmt_ver_t - GuC Log File Format Version.
> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
> + * than 1.12)
> + */
> +struct guc_logfile_fmt_ver_t {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32		dw0;
> +	/*
> +	 * BR[15:0]  Guc-Log-File Format minor version. Must be
> +	 * GUC_LOG_FILE_FORMAT_VERSION_MINOR
> +	 */
> +	#define GUC_LOGFILE_FMT_VER_T_MINOR_VERSION		GENMASK(15, 0)
> +	/*
> +	 * BR[31:16]  Guc-Log-File Format major version. Must be
> +	 * GUC_LOG_FILE_FORMAT_VERSION_MAJOR
> +	 */
> +	#define GUC_LOGFILE_FMT_VER_T_MAJOR_VERSION		GENMASK(31, 16)
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_guc_devid_t - GuC Device ID.
> + * This is mandatory fw LFD data
> + */
> +struct guc_lfd_data_guc_devid_t {
> +	/**
> +	 * @guc_devid: GuC microcontroller device ID defined as described
> +	 * in GUC_LOG_LIC_TYPE_GUC_DEVICE_ID
> +	 */
> +	u32		guc_devid;
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_tsc_freq_t - GuC TSC Fequency.
> + * This is mandatory fw LFD data
> + */
> +struct guc_lfd_data_tsc_freq_t {
> +	/**
> +	 * @tsc_freq: GuC timestamp counter frequency as described in
> +	 * GUC_LOG_LIC_TYPE_TSC_FREQUENCY
> +	 */
> +	u32		tsc_freq;
> +} __packed;
> +
> +/** struct guc_lfd_data_gmdid_t - GMD ID. */
> +struct guc_lfd_data_gmdid_t {
> +	/** @gmd_id: GMD ID as described in GUC_LOG_LIC_TYPE_GMD_ID */
> +	u32		gmd_id;
> +} __packed;
> +
> +/** struct guc_lfd_data_build_platformid_t - GuC build platform ID. */
> +struct guc_lfd_data_build_platformid_t {
> +	/**
> +	 * @platform_build_id: GuC build platform ID as described in
> +	 * GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID
> +	 */
> +	u32		platform_build_id;
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_log_events_buf_t - GuC Log Events Buffer.
> + * This is optional fw LFD data
> + */
> +struct guc_lfd_data_log_events_buf_t {
> +	/**
> +	 * @log_events_format_version: version of GuC log format of buffer
> +	 */
> +	u32		log_events_format_version;
> +	/**
> +	 * @log_format_buf: If `log_format_version` == 1, array of
> +	 * guc_log_format_version_1_t. If `log_format_version` == 2, array
> +	 * of guc_log_format_version_2_t. Dword size determined by
> +	 * guc_logfile_lfd_t.`desc_dw_size` - 1
> +	 */
> +	u32		log_format_buf[];
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_os_id_t - OS Version Information.
> + * This is mandatory host LFD data
> + */
> +struct guc_lfd_data_os_id_t {
> +	/**
> +	 * @os_id: enum values to identify the OS brand (1=Windows,
> +	 * 2=Linux, etc..). See guc_lfd_os_type_t for the range of types
> +	 */
> +	u32		os_id;
> +	/**
> +	 * @build_version: ASCII string containing OS build version
> +	 * information based on os_id. String is padded with null
> +	 * characters to ensure its DWORD aligned. Dword size determined
> +	 * by guc_logfile_lfd_t.`desc_dw_size` - 1
> +	 */
> +	char		build_version[];
> +} __packed;
> +
> +/**
> + * struct guc_logfile_t - GuC Log Streaming-LFD-File Format.
> + * This structure encapsulates the layout of the guc-log-file format
> + */
> +struct guc_logfile_t {

this should be the last definition, see below

and why its name does not have "LFD" tag?

> +	/**
> +	 * @magic: A magic number set by producer of a GuC log file to
> +	 * identify that file is a valid guc-log-file containing a stream
> +	 * of LFDs: Expected value: 0x8086AAAA474C5346.
> +	 */
> +	u64		magic;
> +	/**
> +	 * @version: Version of this file format layout as per
> +	 * guc_logfile_fmt_ver_t
> +	 */
> +	struct guc_logfile_fmt_ver_t	version;
> +	/**
> +	 * @lfd_stream: A stream of one or more guc_logfile_lfd_t LFD data
> +	 */
> +	struct guc_logfile_lfd_t	lfd_stream;

maybe this should be just

	u32 stream[];

> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_fw_version_t - GuC FW Version.
> + * This is mandatory fw LFD data
> + */
> +struct guc_lfd_data_fw_version_t {

shouldn't this struct be defined _before_ the guc_logfile_t ?

> +	/**
> +	 * @guc_sw_version: The full version of the GuC microkernel that
> +	 * generated the logs as described in
> +	 * GUC_LOG_LIC_TYPE_GUC_SW_VERSION.
> +	 */
> +	struct guc_sw_version_t	guc_sw_version;
> +} __packed;
> +
> +#endif

