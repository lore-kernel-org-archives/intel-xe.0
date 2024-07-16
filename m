Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9FFC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 21:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A475110E8F0;
	Tue, 16 Jul 2024 21:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3KGNhMb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F34610E8EF
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 21:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721166672; x=1752702672;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uhLh/MuL1OpBCXoMTbcTkqf3RGUn2nmTyQWOvZu4KbA=;
 b=R3KGNhMb33JAN3uGmZR3x9F9O454khjxVhFqK5cdkZC5N+Z7YzGhVBt4
 0DFL40HnwEegWLhWW+4w0sscj/0n/hHZjJlpANR2KNduEPMzs4878+rE0
 4lvxvEyi0M4zW1KfVuQrFQA43w7VMxQINJwQP9lz83eBXNsqj0MvZcUlE
 zspx04VEYMhnWXn0IRsB9/CMylshfsOjmLsFickdEGE/w87ZnfTW70wE9
 nYUKSyCXOBy57oCgOq2+8sNlqxJqGegl5PiCbi4i5PKtrqZ1/ouf7vbXt
 zG6CBePsmEyD2tXDr8Eca1+sQmAsVDfnU4lT7Hm6erK8p0jcjqOh2RAqy g==;
X-CSE-ConnectionGUID: Is74Q6ymTHiGUjpsacy+bw==
X-CSE-MsgGUID: 7SwjfvSJQRO4kD9+/KsQmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="21544917"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="21544917"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:51:12 -0700
X-CSE-ConnectionGUID: nu+hDGAqSSSMgJ9RbAnWtQ==
X-CSE-MsgGUID: 7Q39nEI3TCW2vg67w7NAnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="49972250"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 16 Jul 2024 14:51:09 -0700
Received: from [10.246.36.158] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.36.158])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 623D228783;
 Tue, 16 Jul 2024 22:51:07 +0100 (IST)
Message-ID: <145dbe6d-4493-4f2d-b723-f575c68109a1@intel.com>
Date: Tue, 16 Jul 2024 23:51:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Refactor mmio setup for multi-tile
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Koby Elbaz <kelbaz@habana.ai>,
 Moti Haimovski <mhaimovski@habana.ai>
References: <20240716195608.2819428-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240716195608.2819428-1-lucas.demarchi@intel.com>
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



On 16.07.2024 21:54, Lucas De Marchi wrote:
> Extract functions to setup the multi-tile mmio space and extension
> space, while better documenting the final memory layout.  No change in
> behavior.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> 
> tested only on single-tile platforms for now. It shouldn't change the
> behavior, but it would be good to get some extra testing.

hmm, but CI likely wont help here as our PVC are running with:

<6>[  149.783555] xe 0000:aa:00.0: [drm] tile_count: 2, reduced_tile_count 1

> 
>  drivers/gpu/drm/xe/xe_mmio.c | 99 ++++++++++++++++++++++++++++--------
>  1 file changed, 77 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index ea3c37d3e13f..31f6703daec2 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -33,29 +33,56 @@ static void tiles_fini(void *arg)
>  		tile->mmio.regs = NULL;
>  }
>  
> -int xe_mmio_probe_tiles(struct xe_device *xe)
> +/*
> + * On multi-tile devices, partition the BAR space for MMIO on each tile,
> + * possibly accounting for register override on the number of tiles available.
> + * Resulting memory layout is like below:
> + *
> + * .----------------------. <- tile_count * tile_mmio_size
> + * |         ....         |
> + * |----------------------| <- 2 * tile_mmio_size
> + * |   tile1->mmio.regs   |
> + * |----------------------| <- 1 * tile_mmio_size
> + * |   tile0->mmio.regs   |
> + * '----------------------' <- 0MB
> + */
> +static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>  {
> -	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
> -	u8 id, tile_count = xe->info.tile_count;
> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
>  	struct xe_tile *tile;
>  	void __iomem *regs;
> -	u32 mtcfg;
> +	u8 id;
>  
> -	if (tile_count == 1)
> -		goto add_mmio_ext;
> +	/*
> +	 * Nothing to be done as tile 0 has already been setup earlier with the
> +	 * entire BAR mapped - see xe_mmio_init()
> +	 */
> +	if (xe->info.tile_count == 1)
> +		return;
>  
> +	/* Possibly override number of tile based on configuration register */
>  	if (!xe->info.skip_mtcfg) {
> +		struct xe_gt *gt = xe_root_mmio_gt(xe);
> +		u8 tile_count = xe->info.tile_count;
> +		u32 mtcfg;
> +
> +		/*
> +		 * Although the per-tile mmio regs are not yet initialized, this
> +		 * is fine as it's going to the root gt, that's guaranteed to be
> +		 * initialized earlier in xe_mmio_init()
> +		 */
>  		mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
>  		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
> +
>  		if (tile_count < xe->info.tile_count) {
>  			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
>  					xe->info.tile_count, tile_count);
>  			xe->info.tile_count = tile_count;
>  
>  			/*
> -			 * FIXME: Needs some work for standalone media, but should be impossible
> -			 * with multi-tile for now.
> +			 * FIXME: Needs some work for standalone media, but
> +			 * should be impossible with multi-tile for now:
> +			 * multi-tile platform with standalone media doesn't
> +			 * exist
>  			 */
>  			xe->info.gt_count = xe->info.tile_count;
>  		}
> @@ -67,23 +94,51 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>  		tile->mmio.regs = regs;
>  		regs += tile_mmio_size;
>  	}
> +}
>  
> -add_mmio_ext:
> -	/*
> -	 * By design, there's a contiguous multi-tile MMIO space (16MB hard coded per tile).
> -	 * When supported, there could be an additional contiguous multi-tile MMIO extension
> -	 * space ON TOP of it, and hence the necessity for distinguished MMIO spaces.
> -	 */
> -	if (xe->info.has_mmio_ext) {
> -		regs = xe->mmio.regs + tile_mmio_size * tile_count;
> +/*
> + * On top of all the multi-tile MMIO space there can be a platform-dependent
> + * extension for each tile, resulting in a layout like below:
> + *
> + * .----------------------. <- ext_base + tile_count * tile_mmio_ext_size
> + * |         ....         |
> + * |----------------------| <- ext_base + 2 * tile_mmio_ext_size
> + * | tile1->mmio_ext.regs |
> + * |----------------------| <- ext_base + 1 * tile_mmio_ext_size
> + * | tile0->mmio_ext.regs |
> + * |======================| <- ext_base = tile_count * tile_mmio_size
> + * |                      |
> + * |       mmio.regs      |
> + * |                      |
> + * '----------------------' <- 0MB
> + *
> + * Set up the tile[]->mmio_ext pointers/sizes.
> + */
> +static void mmio_extension_setup(struct xe_device *xe, size_t tile_mmio_size,
> +				 size_t tile_mmio_ext_size)
> +{
> +	struct xe_tile *tile;
> +	void __iomem *regs;
> +	u8 id;
>  
> -		for_each_tile(tile, xe, id) {
> -			tile->mmio_ext.size = tile_mmio_ext_size;
> -			tile->mmio_ext.regs = regs;
> +	if (!xe->info.has_mmio_ext)
> +		return;
>  
> -			regs += tile_mmio_ext_size;
> -		}
> +	regs = xe->mmio.regs + tile_mmio_size * xe->info.tile_count;
> +	for_each_tile(tile, xe, id) {
> +		tile->mmio_ext.size = tile_mmio_ext_size;
> +		tile->mmio_ext.regs = regs;
> +		regs += tile_mmio_ext_size;
>  	}
> +}
> +

as you are adding some documentation to static functions, maybe you can
also add true kernel-doc for xe_mmio_probe_tiles() below ?

> +int xe_mmio_probe_tiles(struct xe_device *xe)
> +{
> +	size_t tile_mmio_size = SZ_16M;
> +	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
> +
> +	mmio_multi_tile_setup(xe, tile_mmio_size);
> +	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
>  
>  	return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);

btw, I'm wondering if we really need this tiles_fini as it just reset
some pointers, while in general we don't do such detailed cleanup any
more, since actions are called in order and only care about resources

>  }
