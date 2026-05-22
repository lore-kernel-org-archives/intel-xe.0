Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B97CD5BB3
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 15:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A3710E058;
	Fri, 22 May 2026 15:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCgpn7Ux";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57E310E058
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779462973; x=1810998973;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=uKNFjwzIYuNmfjh0x/swd8d59IDjd/Y4ycV2BRlTmqk=;
 b=fCgpn7Uxc3hKT8EPt8KEvr87abP58HqvvUv6FQR8hUpfr5gcqjHXwNAw
 5G5WUqUj+g9e1+AjhzLpu5IvI0y2Q90BPKbRribLglkzavp/a+WuOUyW+
 HHqDR0jVTDle+jnQfTrqJK0nEMrW3pmF7TIzAj1IFXYAFCp6RakXFlQiF
 6Erv7l/M0yf7m0PCe1N2WMWPTSnWhWhdn6x8AmVRUtPfBT2aEd7ZBuLkH
 EvYmYiHtAQq+2+nkb8cyYLum6GwCVOUBG3bgtYXT18Iw+SCrf0Gak0LTn
 cBrbNMp4QrwNbvIdBJsGUZuT4Ra3Y7gMX72cm4rhjNgKrxqTHfqLENt1k A==;
X-CSE-ConnectionGUID: LadBz15YSIKwL3xnTeyr9Q==
X-CSE-MsgGUID: q8zcNQYkSYmVog2Z7E5Rpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="67918289"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="67918289"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 08:16:13 -0700
X-CSE-ConnectionGUID: 24pjXbbLRPOOH/xxFvh5HQ==
X-CSE-MsgGUID: To1KckA9RjmFA6ys3I794A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="246010393"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.22])
 ([10.245.245.22])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 08:16:12 -0700
Message-ID: <751a91c6-66d2-4cbc-94e1-001a2b1ed4b5@intel.com>
Date: Fri, 22 May 2026 16:16:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/mmio: Check MMIO BAR size when initializing
 tiles
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260522143112.10643-1-michal.wajdeczko@intel.com>
 <20260522143112.10643-5-michal.wajdeczko@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260522143112.10643-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 22/05/2026 15:31, Michal Wajdeczko wrote:
> We initialized all remote tiles' xe_mmio structures with a new size
> of 4MiB and offsets of 16MiB without sanity checks to see if mapped
> GTTMMADR_BAR was actually at least that size.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 28 +++++++++++++++++++++-------
>   1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7043289a0eb9..9a7d7fb4a334 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -47,21 +47,35 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>   	struct xe_tile *tile;
>   	u8 id;
>   
> -	/*
> -	 * Nothing to be done as tile 0 has already been setup earlier with the
> -	 * entire BAR mapped - see xe_mmio_probe_early()
> -	 */
> -	if (xe->info.tile_count == 1)
> -		return;
> -
>   	for_each_remote_tile(tile, xe, id)
>   		xe_mmio_init(&tile->mmio, tile, xe->mmio.regs + id * tile_mmio_size, SZ_4M);
>   }
>   
> +/**
> + * xe_mmio_probe_tiles() - Initialize all tiles' MMIO
> + * @xe: the &xe_device
> + *
> + * Initialize the remaining tiles' MMIO instances.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>   int xe_mmio_probe_tiles(struct xe_device *xe)
>   {
>   	size_t tile_mmio_size = SZ_16M;
>   
> +	/*
> +	 * Nothing to be done as tile 0 has already been setup earlier with the
> +	 * entire BAR mapped - see xe_mmio_probe_early()
> +	 */
> +	if (xe->info.tile_count == 1)
> +		return 0;
> +
> +	if (xe->mmio.size < xe->info.tile_count * tile_mmio_size) {
> +		xe_err(xe, "GTTMMADR_BAR is too small for %d tiles: %zd\n",
> +		       xe->info.tile_count, xe->mmio.size);
> +		return -EIO;
> +	}
> +
>   	mmio_multi_tile_setup(xe, tile_mmio_size);
>   	return 0;
>   }

