Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C41C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 08:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1860810E978;
	Fri, 27 Jun 2025 08:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SwF4lQBP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F2310E978
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 08:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751013796; x=1782549796;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Ok5zMN7TuzaeKq6xH/bUqbQ9DF2ykVYp7cdPUFYrzyk=;
 b=SwF4lQBPm528V6kuAp2HjERrZyJGCDXZuvJlGUtvAcFfoRMwF17AKspg
 ir9GP3b6ppeNELjWVzCAN/xkeqrKtNB9mXAO9YNaitjZ17qCB6qMePTNh
 9+GpepQfOFu/xFzAL3mPawsac6dTqVUjoalHON7oryUalYEsnP3YAgOSP
 eLw6YUYFu4RCwmLkzVazxTEd+7oz725a9RlY+rW23bHWBF/WqP989XHau
 4yDCILC3ny7cXkyLphdfs1ffikUW81juzkcQsK08F2SM9Oa8Xuj3X9kX0
 aR1g8s4Cb1bQs4kRkqf3OhpXxKP6MKIPgJrEwqfMVjMdYiazTT+Vu3z6R w==;
X-CSE-ConnectionGUID: e/wFVKKWRDiV1blQFuKc3Q==
X-CSE-MsgGUID: 8yGR6DMPTkeLZrYLU1BeeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="40943604"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="40943604"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 01:43:15 -0700
X-CSE-ConnectionGUID: BIf4/bceTiWQOX+V/Km3jA==
X-CSE-MsgGUID: an3EjjIXRIOgUUCBTfRj8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="156786446"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.99])
 ([10.245.245.99])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 01:43:14 -0700
Message-ID: <b7d0f51e-cc37-46ff-9401-a7eec5ed63fd@intel.com>
Date: Fri, 27 Jun 2025 09:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] drm/xe: Use devm_ioremap_wc for VRAM mapping and
 drop manual unmap
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250626071437.3223888-1-piotr.piorkowski@intel.com>
 <20250626071437.3223888-2-piotr.piorkowski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250626071437.3223888-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 26/06/2025 08:14, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> Let's replace the manual call to ioremap_wc function with devm_ioremap_wc
> function, ensuring that VRAM mappings are automatically released when
> the driver is detached.
> Since devm_ioremap_wc registers the mapping with the device's managed
> resources, the explicit iounmap call in vram_fini is no longer needed,
> so let's remove it.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_vram.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index e421a74fb87c..3a4c84e9efc6 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -156,7 +156,8 @@ static int determine_lmem_bar_size(struct xe_device *xe)
>   	xe->mem.vram.dpa_base = 0;
>   
>   	/* set up a map to the total memory area. */
> -	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
> +	xe->mem.vram.mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram.io_start,
> +					       xe->mem.vram.io_size);
>   
>   	return 0;
>   }
> @@ -278,9 +279,6 @@ static void vram_fini(void *arg)
>   	struct xe_tile *tile;
>   	int id;
>   
> -	if (xe->mem.vram.mapping)
> -		iounmap(xe->mem.vram.mapping);
> -
>   	xe->mem.vram.mapping = NULL;
>   
>   	for_each_tile(tile, xe, id)

