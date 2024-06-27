Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3310C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 18:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E0610EB22;
	Thu, 27 Jun 2024 18:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gk4cDv7W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9EB10EB22
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 18:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719514589; x=1751050589;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=NwH3wysV7sBVQrL8BbMngpN9HR01Q+f0QEnTAwIFNOA=;
 b=Gk4cDv7Wc+4WBxov9MMEhas+wkpQ9WZIJJjMssAnktWhvumzwI+lHyjD
 Cyb43I5YQAknEPhqm2+kFoHbFglxgapKEhB368xkoy7Nt8m3RBF9rQTli
 EZNkYeySMoUjiKjzT7VvoNjws0OHcw7XWFYC3nyOB1RFk2qdNcOjDikwq
 gUrbKYkiv0ljL4KimwHsahcirRk1hIcY/pa+PsT3JhhAf90kcHUd/hCQ6
 oEiFffhyq5QUnkkTMcsMU7+1o8pytH79xdGsDYcJfOlkUoNcO0zTQUf1t
 +JfPQGSL6r7OpPDosKEI6REM/7rf9j6dpA96sqZWpQo0MTlqM4L0EtIzB A==;
X-CSE-ConnectionGUID: xwP55+YRT8Kq/kQwOnQkgA==
X-CSE-MsgGUID: nf/+Js2jTVC46J32kgCJdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16351775"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="16351775"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 11:56:29 -0700
X-CSE-ConnectionGUID: 9w13MByTT1Cahrg2PGWEnw==
X-CSE-MsgGUID: 207K07ajQEapz54+00KZbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="67683624"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 27 Jun 2024 11:56:26 -0700
Received: from [10.246.27.12] (unknown [10.246.27.12])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6DA6C2FC73;
 Thu, 27 Jun 2024 19:56:23 +0100 (IST)
Message-ID: <2f167ef2-dd2a-4560-85b3-b80a46fc0baa@intel.com>
Date: Thu, 27 Jun 2024 20:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/5] drm/xe/guc: Add capture size check in GuC log
 buffer
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
References: <20240624215404.3213075-1-zhanjun.dong@intel.com>
 <20240624215404.3213075-4-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240624215404.3213075-4-zhanjun.dong@intel.com>
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



On 24.06.2024 23:54, Zhanjun Dong wrote:
> The capture-nodes is included in GuC log buffer, add the size check
> for capture region in the whole GuC log buffer.
> Add capture output size check before allocating the shared buffer.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_log_abi.h  |  59 ++++++++
>  drivers/gpu/drm/xe/xe_guc_capture.c   |  81 ++++++++++
>  drivers/gpu/drm/xe/xe_guc_log.c       | 205 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_log.h       |  17 ++-
>  drivers/gpu/drm/xe/xe_guc_log_types.h |  18 +++
>  5 files changed, 379 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_log_abi.h
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> new file mode 100644
> index 000000000000..3f284f25b5e0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _ABI_GUC_LOG_ABI_H
> +#define _ABI_GUC_LOG_ABI_H
> +
> +#include <linux/types.h>
> +
> +/* GuC logging buffer types */
> +enum guc_log_buffer_type {
> +	GUC_LOG_BUFFER_CRASH_DUMP,
> +	GUC_LOG_BUFFER_DEBUG,
> +	GUC_LOG_BUFFER_CAPTURE,
> +};
> +
> +#define GUC_LOG_BUFFER_TYPE_MAX		3
> +
> +/*

/**

> + * struct guc_log_buffer_state - GuC log buffer state
> + *
> + * Below state structure is used for coordination of retrieval of GuC firmware
> + * logs. Separate state is maintained for each log buffer type.
> + * read_ptr points to the location where Xe read last in log buffer and
> + * is read only for GuC firmware. write_ptr is incremented by GuC with number
> + * of bytes written for each log entry and is read only for Xe.
> + * When any type of log buffer becomes half full, GuC sends a flush interrupt.
> + * GuC firmware expects that while it is writing to 2nd half of the buffer,
> + * first half would get consumed by Host and then get a flush completed
> + * acknowledgment from Host, so that it does not end up doing any overwrite
> + * causing loss of logs. So when buffer gets half filled & Xe has requested
> + * for interrupt, GuC will set flush_to_file field, set the sampled_write_ptr
> + * to the value of write_ptr and raise the interrupt.
> + * On receiving the interrupt Xe should read the buffer, clear flush_to_file
> + * field and also update read_ptr with the value of sample_write_ptr, before
> + * sending an acknowledgment to GuC. marker & version fields are for internal
> + * usage of GuC and opaque to Xe. buffer_full_cnt field is incremented every
> + * time GuC detects the log buffer overflow.
> + */
> +struct guc_log_buffer_state {
> +	u32 marker[2];
> +	u32 read_ptr;
> +	u32 write_ptr;
> +	u32 size;
> +	u32 sampled_write_ptr;
> +	u32 wrap_offset;
> +	union {
> +		struct {
> +			u32 flush_to_file:1;
> +			u32 buffer_full_cnt:4;
> +			u32 reserved:27;
> +		};

maybe instead of defining the union and bitfields, just provide GENMASK
like it's done for other ABI definitions ?

> +		u32 flags;
> +	};
> +	u32 version;
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 9c473aceb402..c2a08d4a6751 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -22,6 +22,7 @@
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc.h"
> +#include "xe_guc_ads.h"
>  #include "xe_guc_capture.h"
>  #include "xe_guc_capture_types.h"
>  #include "xe_guc_ct.h"
> @@ -558,6 +559,85 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
>  	return PAGE_ALIGN(total_size);
>  }
>  
> +static int
> +guc_capture_output_size_est(struct xe_guc *guc)

nit: no need for line split

> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	int capture_size = 0;
> +	size_t tmp = 0;
> +
> +	if (!guc->capture)
> +		return -ENODEV;
> +
> +	/*
> +	 * If every single engine-instance suffered a failure in quick succession but
> +	 * were all unrelated, then a burst of multiple error-capture events would dump
> +	 * registers for every one engine instance, one at a time. In this case, GuC
> +	 * would even dump the global-registers repeatedly.
> +	 *
> +	 * For each engine instance, there would be 1 x guc_state_capture_group_t output
> +	 * followed by 3 x guc_state_capture_t lists. The latter is how the register
> +	 * dumps are split across different register types (where the '3' are global vs class
> +	 * vs instance).
> +	 */
> +	for_each_hw_engine(hwe, gt, id) {
> +		capture_size += sizeof(struct guc_state_capture_group_header_t) +
> +					 (3 * sizeof(struct guc_state_capture_header_t));
> +
> +		if (!guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &tmp, true))
> +			capture_size += tmp;
> +
> +		if (!guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
> +					     hwe->class, &tmp, true)) {
> +			capture_size += tmp;
> +		}
> +		if (!guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
> +					     hwe->class, &tmp, true)) {
> +			capture_size += tmp;
> +		}
> +	}
> +
> +	return capture_size;
> +}
> +
> +/*
> + * Add on a 3x multiplier to allow for multiple back-to-back captures occurring
> + * before the Xe can read the data out and process it
> + */
> +#define GUC_CAPTURE_OVERBUFFER_MULTIPLIER 3
> +
> +static void check_guc_capture_size(struct xe_guc *guc)
> +{
> +	int capture_size = guc_capture_output_size_est(guc);
> +	int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
> +	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
> +
> +	/*
> +	 * NOTE: capture_size is much smaller than the capture region
> +	 * allocation (DG2: <80K vs 1MB).
> +	 * Additionally, its based on space needed to fit all engines getting
> +	 * reset at once within the same G2H handler task slot. This is very
> +	 * unlikely. However, if GuC really does run out of space for whatever
> +	 * reason, we will see an separate warning message when processing the
> +	 * G2H event capture-notification, search for:
> +	 * xe_guc_STATE_CAPTURE_EVENT_STATUS_NOSPACE.
> +	 */
> +	if (capture_size < 0)
> +		xe_gt_dbg(guc_to_gt(guc),
> +			  "Failed to calculate error state capture buffer minimum size: %d!\n",
> +			  capture_size);
> +	if (capture_size > buffer_size)
> +		xe_gt_dbg(guc_to_gt(guc), "Error state capture buffer maybe small: %d < %d\n",
> +			  buffer_size, capture_size);
> +	else if (spare_size > buffer_size)
> +		xe_gt_dbg(guc_to_gt(guc),
> +			  "Error state capture buffer lacks spare size: %d < %d (min = %d)\n",
> +			  buffer_size, spare_size, capture_size);
> +}
> +
>  /*
>   * xe_guc_capture_init - Init for GuC register capture
>   * @guc: The GuC object
> @@ -575,5 +655,6 @@ int xe_guc_capture_init(struct xe_guc *guc)
>  
>  	guc->capture->reglists = guc_capture_get_device_reglist(guc);
>  
> +	check_guc_capture_size(guc);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index a37ee3419428..0188bc0a2b84 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -9,9 +9,22 @@
>  
>  #include "xe_bo.h"
>  #include "xe_gt.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc.h"
>  #include "xe_map.h"
>  #include "xe_module.h"
>  
> +#define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE	CRASH_BUFFER_SIZE
> +#define GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE	DEBUG_BUFFER_SIZE
> +#define GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE	CAPTURE_BUFFER_SIZE
> +
> +struct guc_log_section {
> +	u32 max;
> +	u32 flag;
> +	u32 default_val;
> +	const char *name;
> +};
> +
>  static struct xe_gt *
>  log_to_gt(struct xe_guc_log *log)
>  {
> @@ -96,3 +109,195 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  
>  	return 0;
>  }
> +
> +static void _guc_log_init_sizes(struct xe_guc_log *log)
> +{
> +	struct xe_guc *guc = log_to_guc(log);
> +	static const struct guc_log_section sections[GUC_LOG_BUFFER_TYPE_MAX] = {

you don't need to specify array size here, let the compiler figure it out

> +		{
> +			GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
> +			GUC_LOG_LOG_ALLOC_UNITS,
> +			GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE,
> +			"crash dump"
> +		},
> +		{
> +			GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT,
> +			GUC_LOG_LOG_ALLOC_UNITS,
> +			GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE,
> +			"debug",
> +		},
> +		{
> +			GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT,
> +			GUC_LOG_CAPTURE_ALLOC_UNITS,
> +			GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE,
> +			"capture",
> +		}
> +	};
> +	int i;
> +
> +	for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; i++)

and here you can use ARRAY_SIZE to get rid of TYPE_MAX definition

> +		log->sizes[i].bytes = sections[i].default_val;
> +
> +	/* If debug size > 1MB then bump default crash size to keep the same units */
> +	if (log->sizes[GUC_LOG_BUFFER_DEBUG].bytes >= SZ_1M &&
> +	    GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE < SZ_1M)
> +		log->sizes[GUC_LOG_BUFFER_CRASH_DUMP].bytes = SZ_1M;
> +
> +	/* Prepare the GuC API structure fields: */
> +	for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; i++) {
> +		/* Convert to correct units */
> +		if ((log->sizes[i].bytes % SZ_1M) == 0) {
> +			log->sizes[i].units = SZ_1M;
> +			log->sizes[i].flag = sections[i].flag;
> +		} else {
> +			log->sizes[i].units = SZ_4K;
> +			log->sizes[i].flag = 0;
> +		}
> +
> +		xe_gt_assert_msg(log_to_gt(log),
> +				 IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units),
> +				 "Mis-aligned log %s size: 0x%X vs 0x%X!\n",
> +				 sections[i].name, log->sizes[i].bytes, log->sizes[i].units);
> +
> +		log->sizes[i].count = log->sizes[i].bytes / log->sizes[i].units;
> +
> +		if (!log->sizes[i].count) {
> +			xe_gt_err(guc_to_gt(guc), "Zero log %s size!\n", sections[i].name);
> +		} else {
> +			/* Size is +1 unit */
> +			log->sizes[i].count--;
> +		}
> +
> +		/* Clip to field size */
> +		if (log->sizes[i].count > sections[i].max) {
> +			xe_gt_err(guc_to_gt(guc), "log %s size too large: %d vs %d!\n",
> +				  sections[i].name, log->sizes[i].count + 1, sections[i].max + 1);
> +			log->sizes[i].count = sections[i].max;
> +		}
> +	}
> +
> +	if (log->sizes[GUC_LOG_BUFFER_CRASH_DUMP].units != log->sizes[GUC_LOG_BUFFER_DEBUG].units) {
> +		xe_gt_err(guc_to_gt(guc), "Unit mismatch for crash and debug sections: %d vs %d!\n",
> +			  log->sizes[GUC_LOG_BUFFER_CRASH_DUMP].units,
> +			  log->sizes[GUC_LOG_BUFFER_DEBUG].units);
> +		log->sizes[GUC_LOG_BUFFER_CRASH_DUMP].units =
> +			log->sizes[GUC_LOG_BUFFER_DEBUG].units;
> +		log->sizes[GUC_LOG_BUFFER_CRASH_DUMP].count = 0;
> +	}
> +
> +	log->sizes_initialised = true;
> +}
> +
> +static void guc_log_init_sizes(struct xe_guc_log *log)
> +{
> +	if (log->sizes_initialised)
> +		return;
> +
> +	_guc_log_init_sizes(log);
> +}
> +
> +static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
> +{
> +	guc_log_init_sizes(log);
> +
> +	return log->sizes[GUC_LOG_BUFFER_CRASH_DUMP].bytes;
> +}
> +
> +static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
> +{
> +	guc_log_init_sizes(log);
> +
> +	return log->sizes[GUC_LOG_BUFFER_DEBUG].bytes;
> +}
> +
> +/**
> + * xe_guc_log_section_size_capture - Get capture buffer size in log sections.
> + * @log: The log object.
> + *
> + * This function will return the capture buffer size in log sections.
> + *
> + * Return: capture buffer size.
> + */
> +u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
> +{
> +	guc_log_init_sizes(log);
> +
> +	return log->sizes[GUC_LOG_BUFFER_CAPTURE].bytes;
> +}
> +
> +/**
> + * xe_guc_check_log_buf_overflow - Check if log buffer overflowed
> + * @log: The log object.
> + * @type: The log buffer type
> + * @full_cnt: The count of buffer full
> + *
> + * This function will check count of buffer full against previous, mismatch
> + * indicate overflowed.
> + * Update the sampled_overflow counter, if the 4 bit counter overflowed, add
> + * up 16 to correct the value.
> + *
> + * Return: True if overflowed.
> + */
> +bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log, enum guc_log_buffer_type type,
> +				   unsigned int full_cnt)
> +{
> +	unsigned int prev_full_cnt = log->stats[type].sampled_overflow;
> +	bool overflow = false;
> +
> +	if (full_cnt != prev_full_cnt) {
> +		overflow = true;
> +
> +		log->stats[type].overflow = full_cnt;
> +		log->stats[type].sampled_overflow += full_cnt - prev_full_cnt;
> +
> +		if (full_cnt < prev_full_cnt) {
> +			/* buffer_full_cnt is a 4 bit counter */
> +			log->stats[type].sampled_overflow += 16;
> +		}
> +		xe_gt_notice(log_to_gt(log), "log buffer overflow\n");
> +	}
> +
> +	return overflow;
> +}
> +
> +/**
> + * xe_guc_get_log_buffer_size - Get log buffer size for a type.
> + * @log: The log object.
> + * @type: The log buffer type
> + *
> + * Return: buffer size.
> + */
> +u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type)
> +{
> +	switch (type) {
> +	case GUC_LOG_BUFFER_CRASH_DUMP:
> +		return xe_guc_log_section_size_crash(log);
> +	case GUC_LOG_BUFFER_DEBUG:
> +		return xe_guc_log_section_size_debug(log);
> +	case GUC_LOG_BUFFER_CAPTURE:
> +		return xe_guc_log_section_size_capture(log);
> +	}
> +	return 0;
> +}
> +
> +/**
> + * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
> + * @log: The log object.
> + * @type: The log buffer type
> + *
> + * This function will return the offset in the log buffer for a type.
> + * Return: buffer offset.
> + */
> +u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
> +{
> +	enum guc_log_buffer_type i;
> +	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
> +
> +	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
> +		if (i == type)
> +			break;
> +		offset += xe_guc_get_log_buffer_size(log, i);
> +	}
> +
> +	return offset;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 2d25ab28b4b3..ea9e79ccd314 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -7,6 +7,7 @@
>  #define _XE_GUC_LOG_H_
>  
>  #include "xe_guc_log_types.h"
> +#include "xe_guc_types.h"
>  
>  struct drm_printer;
>  
> @@ -17,7 +18,7 @@ struct drm_printer;
>  #else
>  #define CRASH_BUFFER_SIZE	SZ_8K
>  #define DEBUG_BUFFER_SIZE	SZ_64K
> -#define CAPTURE_BUFFER_SIZE	SZ_16K
> +#define CAPTURE_BUFFER_SIZE	SZ_1M
>  #endif
>  /*
>   * While we're using plain log level in i915, GuC controls are much more...
> @@ -36,6 +37,11 @@ struct drm_printer;
>  #define GUC_VERBOSITY_TO_LOG_LEVEL(x)	((x) + 2)
>  #define GUC_LOG_LEVEL_MAX GUC_VERBOSITY_TO_LOG_LEVEL(GUC_LOG_VERBOSITY_MAX)
>  
> +static inline struct xe_guc *log_to_guc(struct xe_guc_log *log)
> +{
> +	return container_of(log, struct xe_guc, log);
> +}

do we really need to promote this to .h ?

> +
>  int xe_guc_log_init(struct xe_guc_log *log);
>  void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
>  
> @@ -45,4 +51,13 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>  	return log->level;
>  }
>  
> +u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
> +
> +bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
> +				   enum guc_log_buffer_type type,
> +				   unsigned int full_cnt);
> +
> +u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
> +u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
> index 125080d138a7..67a9c58e7ed7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_GUC_LOG_TYPES_H_
>  
>  #include <linux/types.h>
> +#include "abi/guc_log_abi.h"
>  
>  struct xe_bo;
>  
> @@ -18,6 +19,23 @@ struct xe_guc_log {
>  	u32 level;
>  	/** @bo: XE BO for GuC log */
>  	struct xe_bo *bo;
> +
> +	/** @sizes: Allocation settings */
> +	struct {
> +		u32 bytes;	/* Size in bytes */
> +		u32 units;	/* GuC API units - 1MB or 4KB */
> +		u32 count;	/* Number of API units */
> +		u32 flag;	/* GuC API units flag */
> +	} sizes[GUC_LOG_BUFFER_TYPE_MAX];

maybe definition of GUC_LOG_BUFFER_TYPE_MAX can be part of this .h ?

> +	/** @sizes_initialised: sizes initialised */

can you elaborate ;)

> +	bool sizes_initialised;
> +
> +	/** @stats: logging related stats */
> +	struct {
> +		u32 sampled_overflow;
> +		u32 overflow;
> +		u32 flush;
> +	} stats[GUC_LOG_BUFFER_TYPE_MAX];
>  };
>  
>  #endif
