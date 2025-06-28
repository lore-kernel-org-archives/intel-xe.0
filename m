Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15A3C7EE32
	for <intel-xe@archiver.kernel.org>; Sat, 28 Jun 2025 12:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777C610E192;
	Sat, 28 Jun 2025 12:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gX6L6TyS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804D010E037
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Jun 2025 12:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751113189; x=1782649189;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=bAPbdNsXJ5MR4+i23xYS1gj8usUZFntSnjMg0s1tCrI=;
 b=gX6L6TyS/bp0qA5nZmjdAYagmJAgZIxEd7EgRZig1YvD7SMi7cHPZq9K
 5OHjNthFLhTFoUHP/bHkoA9fRn44N6cW68l+tzHbTWYmQUhI8jF+KXwmF
 obZp2/H/k+fjTk8vZpn6+CHeTCe1Npf5IPqSiFNMgN7GVaYaMX4YoCeqC
 sS1eUQAMhlqaJFQNtDiSVboWLS3ohiE+kGldkXQt/PlveOt71OwA0Doj8
 XZ9bsGfUcd2ZLlRrx0zW5FyeQJGoV+/uh3w1sQffUuC3KujLK3ehOE2O8
 EXcpRW0nalJkDbUUYTdJlBOL4HP9PqCQj0VTw5ibzdzQ+Nw1jVNfylUoW g==;
X-CSE-ConnectionGUID: u+JZYoDGQs+/bNqboMp2Xw==
X-CSE-MsgGUID: 7/0tsywwS7Gkfs3vmTDxyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53347672"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; d="scan'208";a="53347672"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2025 05:19:46 -0700
X-CSE-ConnectionGUID: 0QIaQ6tAQGaTxyjbkubd7A==
X-CSE-MsgGUID: QalfA6DBS6u5WPOKZbEq4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; d="scan'208";a="157420552"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 28 Jun 2025 05:19:44 -0700
Received: from [10.245.96.176] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.176])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7A78812590;
 Sat, 28 Jun 2025 13:19:43 +0100 (IST)
Message-ID: <dcdb889f-34fb-4ac0-adf3-b28803fd854f@intel.com>
Date: Sat, 28 Jun 2025 14:19:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] drm/xe/guc: Add log init config abi definitions
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
References: <20250423215821.3078428-1-zhanjun.dong@intel.com>
 <20250423215821.3078428-2-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250423215821.3078428-2-zhanjun.dong@intel.com>
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



On 23.04.2025 23:58, Zhanjun Dong wrote:
> Add GuC log init config (LIC) ABI definitions.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_log_lic_abi.h | 117 +++++++++++++++++++++++

since LIC already refers to LOG (LOG-init-config) then maybe names
should follow GUC_LIC naming? here: guc_lic_abi.h

>  1 file changed, 117 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lic_abi.h
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_log_lic_abi.h b/drivers/gpu/drm/xe/abi/guc_log_lic_abi.h
> new file mode 100644
> index 000000000000..48302bfcab2b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/guc_log_lic_abi.h
> @@ -0,0 +1,117 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _ABI_GUC_LOG_LIC_ABI_H_
> +#define _ABI_GUC_LOG_LIC_ABI_H_
> +
> +#include <linux/types.h>
> +
> +#define GUC_LOG_BUFFER_STATE_HEADER_LENGTH		4096
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG		0
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH		1
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CAPTURE	2
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT		3
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT		4

are above definitions really related to the LIC?

> +
> +#define GUC_LOG_INIT_CONFIG_LIC_MAGIC			0x8086900D

move closer to guc_log_init_config

> +#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR	0x0001
> +#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR	0x0000

move closer to guc_lic_format_version and make them 1u and 0u

> +
> +/** enum guc_log_lic_type - Log Init Config KLV IDs. */

if those are really KLVs, not TLVs as wrongly(?) described once in the
spec, then maybe this enum shall be named as guc_log_lic_klv_id with:

GUC_LOG_LIC_KLV_GUC_SW_VERSION
GUC_LOG_LIC_KLV_GUC_DEVICE_ID
GUC_LOG_LIC_KLV_TSC_FREQUENCY
GUC_LOG_LIC_KLV_GMD_ID

> +enum guc_log_lic_type {
> +	/**
> +	 * @GUC_LOG_LIC_TYPE_GUC_SW_VERSION: GuC firmware version. Value
> +	 * is a 32 bit number represented by guc_sw_version.
> +	 */
> +	GUC_LOG_LIC_TYPE_GUC_SW_VERSION = 0x1,
> +	/**
> +	 * @GUC_LOG_LIC_TYPE_GUC_DEVICE_ID: GuC device id. Value is a 32
> +	 * bit.
> +	 */
> +	GUC_LOG_LIC_TYPE_GUC_DEVICE_ID = 0x2,
> +	/**
> +	 * @GUC_LOG_LIC_TYPE_TSC_FREQUENCY : GuC timestamp counter
> +	 * frequency. Value is a 32 bit number representing frequency in
> +	 * kilohertz. This timestamp is utilized in log entries, timer and

s/kilohertz/kHz

> +	 * for engine utilization tracking.
> +	 */
> +	GUC_LOG_LIC_TYPE_TSC_FREQUENCY = 0x3,
> +	/**
> +	 * @GUC_LOG_LIC_TYPE_GMD_ID: HW GMD ID. Value is a 32 bit number
> +	 * representing graphics, media and display HW architecture IDs.
> +	 */
> +	GUC_LOG_LIC_TYPE_GMD_ID = 0x4,
> +	/**
> +	 * @GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID: GuC build platform ID.
> +	 * Value is 32 bits.
> +	 */
> +	GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID = 0x5,
> +};
> +
> +/**
> + * struct guc_sw_version - This structure describes the full version of a
> + * software component.
> + */
> +struct guc_sw_version {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32 dw0;
> +	/*  Patch version */
> +#define GUC_SW_VERSION_PATCH_VERSION		GENMASK(7, 0)
> +	/*  Minor version */
> +#define GUC_SW_VERSION_MINOR_VERSION		GENMASK(15, 8)
> +	/*  Major version */
> +#define GUC_SW_VERSION_MAJOR_VERSION		GENMASK(23, 16)
> +	/*  Branch ID */
> +#define GUC_SW_VERSION_BRANCH_ID		GENMASK(31, 24)

drop useless comments (patch major ...

> +} __packed;
> +
> +/**
> + * struct guc_lic_format_version - Log Init Config Structure Version.
> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
> + * than 1.12)
> + */
> +struct guc_lic_format_version {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32 dw0;
> +	/*
> +	 *  Log-Init-Config structure minor version. Must be
> +	 * GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR
> +	 */
> +#define GUC_LIC_FORMAT_VERSION_MINOR_VERSION		GENMASK(15, 0)
> +	/*
> +	 *  Log-Init-Config structure major version. Must be
> +	 * GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR
> +	 */
> +#define GUC_LIC_FORMAT_VERSION_MAJOR_VERSION		GENMASK(31, 16)
> +} __packed;
> +
> +/**
> + * struct guc_log_init_config - GuC Log-Init-Config structure.
> + * This is populated by the GUC at log init time and is located in the log
> + * buffer as per the Log Buffer Layout (In Memory). The array of guc log
> + * buffer states plus this structure must not exceed 4KB
> + */
> +struct guc_log_init_config {
> +	/**
> +	 * @magic: A magic number set by GuC to identify that this
> +	 * structure contains valid information: magic = 0x8086900D.

nit: you may want to add reference to GUC_LOG_INIT_CONFIG_LIC_MAGIC

> +	 * Used to verify the information in this structure is valid.
> +	 */
> +	u32 magic;

maybe GUC_LOG_INIT_CONFIG_LIC_MAGIC definition can be put here?

> +	/**
> +	 * @ver: The version of the this structure. Detail description
> +	 * is guc_lic_format_version

drop 'Detail ...' since this struct is documented

> +	 */
> +	struct guc_lic_format_version ver;

this could be named in full 'version'

> +	/** @dw_size: Number of Dws the `data` array contains. */
> +	u32 dw_size;
> +	/**
> +	 * @data: Array of dwords representing a list of LIC KLVs of
> +	 * type guc_klv_generic with keys represented by guc_log_lic_type
> +	 */
> +	u32 data[] __counted_by(dw_size);
> +} __packed;
> +
> +#endif

