Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6897FCAC59E
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 20:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE3C10E02B;
	Tue, 17 Sep 2024 20:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBhpHv32";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714BC10E02B
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 20:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726604081; x=1758140081;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dG6ZFiAJY0xopq1/LZC+qCKNS0bDZCEG53pQAKThJU4=;
 b=EBhpHv32Iag5HoDXiUvqmfhcxbWyYJfC2ol6quGdDAOIkXSmRcakL277
 yM3MRROy+PNnkjGO3WgdzpTg20RxDquRKJZSrMRDoIIYSleAVN1Utk6yn
 uOm+1HyJbJxhYMwqx70P+d/TqaxVL1lQ1b412DSKwCufTpxNGFM6Xv7WM
 qo7a22cM6SXRrH4QfqtdvpDglxX59tehxZLbS1/iumBI2Dw+q3HcLAp+j
 Bg7qEv69pzOp3DnKngGVFBCPJ7i7o/kED56sTEkWjZF2jWyNrTFxJnxKO
 u62rW+1YEOPyvEoRa7G5bMrEjFuSS3QJxn/8k52JOAiIFmdFbGP6LTUU8 A==;
X-CSE-ConnectionGUID: PZwZaawnR2+L3PEyerffBg==
X-CSE-MsgGUID: znfMZ9ShRo616PX4bN0Pcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="43004689"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="43004689"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 13:14:41 -0700
X-CSE-ConnectionGUID: tDj+AmpuRsu0friy2L5j0A==
X-CSE-MsgGUID: F1iiTBN5TlSl9J9PnrIJ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="99997210"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 17 Sep 2024 13:14:39 -0700
Received: from [10.245.120.199] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.120.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 87089312D7;
 Tue, 17 Sep 2024 21:14:37 +0100 (IST)
Message-ID: <5509c3ea-7997-4125-9b3b-a7737deb41f3@intel.com>
Date: Tue, 17 Sep 2024 22:14:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] drm/xe: move memirq out of VF
To: Ilia Levi <illevi@habana.ai>, intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, jonathan.cavitt@intel.com, koby.elbaz@intel.com,
 yaron.avizrat@intel.com
References: <20240917112307.1242329-1-illevi@habana.ai>
 <20240917112307.1242329-4-illevi@habana.ai>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240917112307.1242329-4-illevi@habana.ai>
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



On 17.09.2024 13:23, Ilia Levi wrote:
> From: Ilia Levi <ilia.levi@intel.com>
> 
> Up until now only VF used Memory Based Interrupts (memirq).
> Moving it out of VF to cater for other usages, specifically MSI-X.
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---

...

> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 464cb9d7fee2..8b12209d995a 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -19,15 +19,25 @@
>  #include "xe_hw_engine.h"
>  #include "xe_map.h"
>  #include "xe_memirq.h"
> -#include "xe_sriov.h"
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

with memirq_dbg() changes moved to patch 1/5

  Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
