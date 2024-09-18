Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F096CCD199
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 10:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDAA10E1EF;
	Wed, 18 Sep 2024 10:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYP4tkkA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85E410E1EF
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 10:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726656273; x=1758192273;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HaACTbsMVQq9coJHZ5qpLdd3lfnDlbjyWZB3qhlAmBY=;
 b=BYP4tkkAhnev3U4ENzfm/4URmucfAFuOvIzaniYUcSkDXRd/9y/87E/6
 Tqko1YLXSg1lLtjlM2YiCT/NkaZRB+VxAuTAGrhTwra8F+suPHAkAh8NG
 rX1Cxw4taX8mfH10auo7sN6WP/oBux3n6NCwSW4kSN11Q+jpocCm7pipk
 RfIfM53Klfcrw6oIT/JvEEKFTT28tVueVZ44U+ds4bjj6XbRt6yDssal7
 DlWCk+qjMGaOcr6tKQviFhFRjsZ83nVUywEQ/ykHB/czuGsY/SVVbtrTZ
 Mj1J+JfdhauPLnSzaAzl272zWWgt3/JIazjujT0ecdKv7SJFOCX70jELp Q==;
X-CSE-ConnectionGUID: ppl15vgvRQ+whHj9OxLv8A==
X-CSE-MsgGUID: 2RS4c1GmTza8AwNNMA13zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="50968068"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="50968068"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 03:44:32 -0700
X-CSE-ConnectionGUID: ZrBP1uObQDufL6ivesUyJA==
X-CSE-MsgGUID: l9xaZZW2R6ubR+efAo2K0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="74256730"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 18 Sep 2024 03:44:30 -0700
Received: from [10.245.120.199] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.120.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id EDB92312D4;
 Wed, 18 Sep 2024 11:44:28 +0100 (IST)
Message-ID: <122c8732-04b0-4e8b-b645-90faf588dd44@intel.com>
Date: Wed, 18 Sep 2024 12:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] drm/xe: Introduce dedicated config for memirq debug
To: Ilia Levi <illevi@habana.ai>, intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, jonathan.cavitt@intel.com, koby.elbaz@intel.com,
 yaron.avizrat@intel.com
References: <20240918053942.1331811-1-illevi@habana.ai>
 <20240918053942.1331811-2-illevi@habana.ai>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240918053942.1331811-2-illevi@habana.ai>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 18.09.2024 07:39, Ilia Levi wrote:
> From: Ilia Levi <ilia.levi@intel.com>
> 
> Separate config for debugging memory based interrupts (memirq)
> infrastructure.
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---

in the future please try to include patch changelog like:

v2: also convert logging macros (Michal)

>  drivers/gpu/drm/xe/Kconfig.debug | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_memirq.c   | 29 +++++++++++++++++++----------
>  2 files changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index bc177368af6c..2de0de41b8dd 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -40,9 +40,21 @@ config DRM_XE_DEBUG_VM
>  
>  	  If in doubt, say "N".
>  
> +config DRM_XE_DEBUG_MEMIRQ
> +	bool "Enable extra memirq debugging"
> +	default n
> +	help
> +	  Choose this option to enable additional debugging info for
> +	  memory based interrupts.
> +
> +	  Recommended for driver developers only.
> +
> +	  If in doubt, say "N".
> +
>  config DRM_XE_DEBUG_SRIOV
>  	bool "Enable extra SR-IOV debugging"
>  	default n
> +	select DRM_XE_DEBUG_MEMIRQ
>  	help
>  	  Enable extra SR-IOV debugging info.
>  
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 95b6e9d7b7db..ecb4870c3356 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -20,10 +20,21 @@
>  #include "xe_map.h"
>  #include "xe_memirq.h"
>  #include "xe_sriov.h"
> -#include "xe_sriov_printk.h"
>  
>  #define memirq_assert(m, condition)	xe_tile_assert(memirq_to_tile(m), condition)
> -#define memirq_debug(m, msg...)		xe_sriov_dbg_verbose(memirq_to_xe(m), "MEMIRQ: " msg)
> +#define memirq_printk(m, _level, _fmt, ...)			\
> +	drm_##_level(&memirq_to_xe(m)->drm, "MEMIRQ%u: " _fmt,	\
> +		     memirq_to_tile(m)->id, ##__VA_ARGS__)
> +
> +#ifdef CONFIG_DRM_XE_DEBUG_MEMIRQ
> +#define memirq_debug(m, _fmt, ...)	memirq_printk(m, dbg, _fmt, ##__VA_ARGS__)
> +#else
> +#define memirq_debug(...)
> +#endif
> +
> +#define memirq_err(m, _fmt, ...)	memirq_printk(m, err, _fmt, ##__VA_ARGS__)
> +#define memirq_err_ratelimited(m, _fmt, ...)	\
> +	memirq_printk(m, err_ratelimited, _fmt, ##__VA_ARGS__)
>  
>  static struct xe_tile *memirq_to_tile(struct xe_memirq *memirq)
>  {
> @@ -157,8 +168,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
>  	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
>  
>  out:
> -	xe_sriov_err(memirq_to_xe(memirq),
> -		     "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
> +	memirq_err(memirq, "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
>  	return err;
>  }
>  
> @@ -299,9 +309,8 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
>  	return 0;
>  
>  failed:
> -	xe_sriov_err(memirq_to_xe(memirq),
> -		     "Failed to setup report pages in %s (%pe)\n",
> -		     guc_name(guc), ERR_PTR(err));
> +	memirq_err(memirq, "Failed to setup report pages in %s (%pe)\n",
> +		   guc_name(guc), ERR_PTR(err));
>  	return err;
>  }
>  
> @@ -349,9 +358,9 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
>  	value = iosys_map_rd(vector, offset, u8);
>  	if (value) {
>  		if (value != 0xff)
> -			xe_sriov_err_ratelimited(memirq_to_xe(memirq),
> -						 "Unexpected memirq value %#x from %s at %u\n",
> -						 value, name, offset);
> +			memirq_err_ratelimited(memirq,
> +					       "Unexpected memirq value %#x from %s at %u\n",
> +					       value, name, offset);
>  		iosys_map_wr(vector, offset, u8, 0x00);
>  	}
>  
