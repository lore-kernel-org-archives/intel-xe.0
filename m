Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2053CC79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 07:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2F610F351;
	Thu, 10 Sep 2026 07:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DOh5c8F8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935AE10F351
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 07:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789027093; x=1820563093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OLblpcGsQvNuCC6b6eSE/6V9uxr33T+AmI38tUgEcmo=;
 b=DOh5c8F8Tk+TgvpVTHryhJuOJBRqZL0XqLe858IOxTY6wRQyykbwFnHP
 Pr93+0T3VSM9rz4mMux0a18IqfUCVx/SHAFmYdVs2kPaRSxxOOyNWNul9
 C0/hHpkkW6bZgrvW5mhX+quOfw5jOw3/gdF7Kq4HzkKIici5TSAjqRCKB
 Zgg4gfnM77k6eXOCO6V915CjVjH1PPOH2gSfmlPbJGmVIP6KiDDONF/PP
 3pcKVe2AOqOtgKEy7ogxnJX4ovJult2353REDf+Wglk9TEtPNkhs9JoGs
 AajGDgJZ1mG9Hz1W+voSL3CTji1idB9gt9k12K6/1DtA7x18WLs8rDgIu A==;
X-CSE-ConnectionGUID: t9OEPZB2QAumTKiShDPI8w==
X-CSE-MsgGUID: l84whxlNSIGWTJhpSiStKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93159175"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="93159175"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 00:58:11 -0700
X-CSE-ConnectionGUID: VMWMx4MmShOiCJ3SC+il9g==
X-CSE-MsgGUID: pSRuXeXgTgux+c9L5+I87g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="267868676"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 00:58:07 -0700
Date: Thu, 10 Sep 2026 09:58:04 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: Re: [PATCH v3 12/12] drm/xe/cper: Emit cper record to trace buf
Message-ID: <aqJjDA08LIkA5jS7@black.igk.intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-26-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260906172604.2215987-26-badal.nilawar@intel.com>
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

On Sun, Sep 06, 2026 at 10:56:17PM +0530, Badal Nilawar wrote:
> Emit cper record to trace buf.

Okay, so all the xe_log conversions are redundant until this is in place.
Please sequence them after this patch.

> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Assisted-by: Copilot:claude-sonnet-4.6
> ---
>  drivers/gpu/drm/xe/Makefile        |  3 +-
>  drivers/gpu/drm/xe/xe_cper.c       |  4 +-
>  drivers/gpu/drm/xe/xe_trace_cper.c |  9 ++++
>  drivers/gpu/drm/xe/xe_trace_cper.h | 66 ++++++++++++++++++++++++++++++
>  4 files changed, 80 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
>  create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 06b064add77d..7831f7d94784 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -166,7 +166,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>  xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>  xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
>  
> -xe-$(CONFIG_UEFI_CPER_X86) += xe_cper.o
> +xe-$(CONFIG_UEFI_CPER_X86) += xe_cper.o \
> +			      xe_trace_cper.o
>  
>  # graphics virtualization (SR-IOV) support
>  xe-y += \
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index ebf4dc4ab2bb..0818ee6ae8ae 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -16,6 +16,7 @@
>  #include "xe_printk.h"
>  #include "xe_ras.h"
>  #include "xe_ras_types.h"
> +#include "xe_trace_cper.h"
>  
>  static const struct xe_platform_id_entry xe_platform_ids[] = {
>  	/* 0x674C  platform/8086:674c */
> @@ -169,7 +170,8 @@ static void xe_cper_record_emit(struct xe_device *xe, u8 severity,
>  	if (einfo && einfo_len)
>  		memcpy((u8 *)rec + sizeof(*rec), einfo, einfo_len);
>  
> -	/* TODO: Emit trace event */
> +	trace_xe_error_cper(xe, &rhdr->platform_id, &sdesc->fru_id, severity,
> +			    &rec->intel_hdr, total_len, (u8 *)rec);
>  
>  	kfree(rec);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_trace_cper.c b/drivers/gpu/drm/xe/xe_trace_cper.c
> new file mode 100644
> index 000000000000..caea8783ab7c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_trace_cper.c
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef __CHECKER__
> +#define CREATE_TRACE_POINTS
> +#include "xe_trace_cper.h"
> +#endif

This looks like a redundant file that should not exist. Why not have the
TRACE_EVENT() as part of xe_trace.h and drop this?

Raag

> diff --git a/drivers/gpu/drm/xe/xe_trace_cper.h b/drivers/gpu/drm/xe/xe_trace_cper.h
> new file mode 100644
> index 000000000000..6d2dbf504888
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_trace_cper.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM xe
> +
> +#if !defined(_XE_TRACE_CPER_H_) || defined(TRACE_HEADER_MULTI_READ)
> +#define _XE_TRACE_CPER_H_
> +
> +#include <linux/tracepoint.h>
> +#include <linux/types.h>
> +
> +#include "xe_cper_types.h"
> +#include "xe_device_types.h"
> +
> +#define __dev_name_xe(xe)	dev_name((xe)->drm.dev)
> +
> +TRACE_EVENT(xe_error_cper,
> +	TP_PROTO(struct xe_device *xe,
> +	    const guid_t *platform_id, const guid_t *fru_id,
> +	    const u8 severity,
> +	    const struct xe_cper_sec_intel_err_hdr *ihdr,
> +	    u32 cper_len, const u8 *cper),
> +	TP_ARGS(xe, platform_id, fru_id, severity, ihdr, cper_len, cper),
> +
> +	TP_STRUCT__entry(
> +	    __string(dev, __dev_name_xe(xe))
> +	    __array(char, platform_id, UUID_SIZE)
> +	    __array(char, fru_id, UUID_SIZE)
> +	    __field(u8, sev)
> +	    __array(u8, ihdr_raw, sizeof(struct xe_cper_sec_intel_err_hdr))
> +	    __field(u32, cper_len)
> +	    __dynamic_array(u8, cper, cper_len)
> +	    ),
> +
> +	TP_fast_assign(
> +	    __assign_str(dev);
> +	    __entry->sev = severity;
> +	    memcpy(__entry->platform_id, platform_id, UUID_SIZE);
> +	    memcpy(__entry->fru_id, fru_id, UUID_SIZE);
> +	    memcpy(__entry->ihdr_raw, ihdr, sizeof(struct xe_cper_sec_intel_err_hdr));
> +	    __entry->cper_len = cper_len;
> +	    memcpy(__get_dynamic_array(cper), cper, cper_len);
> +	    ),
> +
> +	TP_printk("dev=%s severity=%d platform_id=%pU fru_id=%pU "
> +		"intel_err_hdr_raw=%s cper_len=%u cper_raw=%s",
> +		__get_str(dev), __entry->sev,
> +		__entry->platform_id, __entry->fru_id,
> +		__print_hex(__entry->ihdr_raw,
> +		    sizeof(struct xe_cper_sec_intel_err_hdr)),
> +		__entry->cper_len,
> +		__print_hex(__get_dynamic_array(cper),
> +		    __entry->cper_len))
> +);
> +
> +#endif
> +
> +/* This part must be outside protection */
> +#undef TRACE_INCLUDE_PATH
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
> +#define TRACE_INCLUDE_FILE xe_trace_cper
> +#include <trace/define_trace.h>
> -- 
> 2.54.0
> 
