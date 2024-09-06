Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129B8CE7B18
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 13:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB2210EA68;
	Fri,  6 Sep 2024 13:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhkCommu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC36E10EA63
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 13:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725630599; x=1757166599;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kvhwn3VFZnHJup4tAqL4TKT2733d3043ECfzluaGI88=;
 b=BhkCommufhJs+PkPpVpp5MbFX9OzJ75IEya1KqPnMgzLLVUXdP39zyvu
 /VCqTZSgaAWH8F7xsRfI0exGRypy1tjqz3PDpp91APcoduzlWNWYYQRcB
 yBPBusaM2Y3pS0rcamgKFs5k0UZfIbvRqjPJpNeGntZFK07yvWV1gVyX3
 3gzhSCDyNYO0gnnOfUO7q2o+cH2u5lcgKqn3JlqN1wl+WciK5G2//tisO
 TdZGyAQxpOXyDGZiTuAs4intrAbEyTyPCibVZ5zQSWwIX2LYHAZlwUCaz
 HMGrH5/UOnhljYeQZaF41WZOWIgzC/73+4NQXSfm1oQ3QL6XCf4BLy2O/ A==;
X-CSE-ConnectionGUID: aR2xh7LJRLmF8zKU5fLlIg==
X-CSE-MsgGUID: kbQixqmZSLKkfhEJypLkJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="13410515"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="13410515"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 06:49:57 -0700
X-CSE-ConnectionGUID: jXK+kFkKTPyxRsrZloWk5w==
X-CSE-MsgGUID: 8Uc8ohPcSB22Au2IX1EWyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="66504455"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 06 Sep 2024 06:49:55 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 64A2328785;
 Fri,  6 Sep 2024 14:49:53 +0100 (IST)
Message-ID: <a18d6977-05f2-48ad-931c-cd02c84d6cff@intel.com>
Date: Fri, 6 Sep 2024 15:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/43] drm/xe: Create dedicated xe_mmio structure
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-47-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240904002100.2023834-47-matthew.d.roper@intel.com>
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



On 04.09.2024 02:21, Matt Roper wrote:
> Pull the 'mmio' substructure from xe_device 

hmm, actually it seems that you moved out the 'mmio' from the xe_tile,
not the xe_device, where is another identical one struct, that maybe
also deserves some unification

> out into a dedicated type.
> Future patches will expand this structure and then eventually move MMIO
> read/write operations over to using this type.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index ec7eb7811126..a02e5dfcc6a7 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -107,6 +107,22 @@ struct xe_mem_region {
>  	void __iomem *mapping;
>  };
>  
> +/**
> + * struct xe_mmio - register mmio structure
> + *
> + * Represents an MMIO region that the CPU may use to access registers.  A
> + * region may share its IO map with other regions (e.g., all GTs within a
> + * tile share the same map with their parent tile, but represent different
> + * subregions of the overall IO space).
> + */
> +struct xe_mmio {
> +	/** @regs: Map used to access registers. */
> +	void __iomem *regs;
> +
> +	/** @map_size: Size of the map. */

@size

> +	size_t size;
> +};
> +
>  /**
>   * struct xe_tile - hardware tile structure
>   *
> @@ -148,13 +164,7 @@ struct xe_tile {
>  	 * * 4MB-8MB: reserved
>  	 * * 8MB-16MB: global GTT
>  	 */
> -	struct {
> -		/** @mmio.size: size of tile's MMIO space */
> -		size_t size;
> -
> -		/** @mmio.regs: pointer to tile's MMIO space (starting with registers) */
> -		void __iomem *regs;
> -	} mmio;
> +	struct xe_mmio mmio;
>  
>  	/**
>  	 * @mmio_ext: MMIO-extension info for a tile.
