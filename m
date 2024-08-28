Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1FDC7112F
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 20:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC0810E5D3;
	Wed, 28 Aug 2024 20:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpBXqHB4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6B410E5D3
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 20:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724877539; x=1756413539;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nsKKLF3bDydw3oRNcCSn9BlzdfVMX0ICQ+23ZdgI6Ms=;
 b=jpBXqHB4ANknoAgT+lST4GcpuGq7XQln2fou/OHEwo1lJOlDU5uBWdfC
 tArDq0ATUscbO/xzJENGt9oagVTGXFQWNR9+afZXsilUhZrzBW2BUSCsu
 cY+8lf2eQttgBDWn9bN9YaphtpF53TUTxpgbAFsDJ7BYXlYIHo1rMRjJx
 GyzbDQ1V0ycLOooZBoWBmtOsFREy0SUm2+hQcQRLdyoih0GZGRLWQ5Rj4
 jCSB0u2tP64sMTZN+yG84gh+WMHNg+N5oWGX7XxzUXiQv9MfCwKBHFYcK
 /l0ZHTO+KEptExZSbssLQAP1E8c2wtGimX8OciwGPwKBUhbPPCZ+Ko0WI Q==;
X-CSE-ConnectionGUID: FqiDLfifR8ild5f0xSBSJw==
X-CSE-MsgGUID: 0QsRKRwkSzeumJjIX+X8vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="13267538"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="13267538"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 13:38:58 -0700
X-CSE-ConnectionGUID: vK70rJTFTvqVhEh2C61BtQ==
X-CSE-MsgGUID: VgxbqvQgTzOlxYAkorceAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="63040961"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 28 Aug 2024 13:38:57 -0700
Received: from [10.245.82.99] (mwajdecz-MOBL.ger.corp.intel.com [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 49A59312D4;
 Wed, 28 Aug 2024 21:38:55 +0100 (IST)
Message-ID: <26a834a0-7522-412b-8e23-597ba3ab701e@intel.com>
Date: Wed, 28 Aug 2024 22:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/xe: memirq handler changes
To: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, koby.elbaz@intel.com, yaron.avizrat@intel.com
References: <20240828091841.1840086-1-ilia.levi@intel.com>
 <20240828091841.1840086-5-ilia.levi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240828091841.1840086-5-ilia.levi@intel.com>
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



On 28.08.2024 11:18, Ilia Levi wrote:
> This patch exposes an interrupt processing handler for a single hw engine.
> This handler also caters for the new "reports to engine instance 0" mode.
> Use this handler from the VF use-case as well.
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_memirq.c | 31 ++++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_memirq.h |  1 +
>  2 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index a1d4bc3f9e42..c388e480b5c8 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -383,6 +383,28 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
>  		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
>  }
>  
> +/**
> + * xe_memirq_hwe_handler - Check and process interrupts for a specific HW engine.
> + * @memirq: the &xe_memirq
> + * @hwe: the hw engine to process
> + *
> + * This function reads and dispatches `Memory Based Interrupts` for the provided HW engine.
> + */
> +void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)

shouldn't this be a static memirq_hwe_handler() function?
then there is no need for DOC

> +{
> +	u16 offset = memirq->reports_to_e0 ? hwe->e0_irq_offset : hwe->irq_offset;
> +	u16 instance = memirq->reports_to_e0 ? hwe->instance : 0;

with tweaked hwe->irq_offset in hw_engine_init_early() likely this won't
be needed ...


> +
> +	struct iosys_map src_offset = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> +							    XE_MEMIRQ_SOURCE_OFFSET(instance));

empty line should be here not between instance/src above

> +	if (memirq_received(memirq, &src_offset, offset, "SRC")) {
> +		struct iosys_map status_offset =
> +			IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> +					      XE_MEMIRQ_STATUS_OFFSET(instance) + offset * SZ_16);
> +		memirq_dispatch_engine(memirq, &status_offset, hwe);
> +	}
> +}
> +
>  /**
>   * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
>   * @memirq: the &xe_memirq
> @@ -410,13 +432,8 @@ void xe_memirq_handler(struct xe_memirq *memirq)
>  		if (gt->tile != tile)
>  			continue;
>  
> -		for_each_hw_engine(hwe, gt, id) {
> -			if (memirq_received(memirq, &memirq->source, hwe->irq_offset, "SRC")) {
> -				map = IOSYS_MAP_INIT_OFFSET(&memirq->status,
> -							    hwe->irq_offset * SZ_16);
> -				memirq_dispatch_engine(memirq, &map, hwe);
> -			}
> -		}
> +		for_each_hw_engine(hwe, gt, id)
> +			xe_memirq_hwe_handler(memirq, hwe);
>  	}
>  
>  	/* GuC and media GuC (if present) must be checked separately */
> diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
> index 98e2b61ef973..8a9334482a9b 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.h
> +++ b/drivers/gpu/drm/xe/xe_memirq.h
> @@ -20,6 +20,7 @@ u32 xe_memirq_enable_ptr(struct xe_memirq *memirq);
>  
>  void xe_memirq_reset(struct xe_memirq *memirq);
>  void xe_memirq_postinstall(struct xe_memirq *memirq);
> +void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe);

seems to be not used outside of xe_memirq.c

>  void xe_memirq_handler(struct xe_memirq *memirq);
>  
>  int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
