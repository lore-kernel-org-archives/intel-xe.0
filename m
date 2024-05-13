Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74858C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 08:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B53D10E4CA;
	Mon, 13 May 2024 08:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vc7yEkBV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2D310E4CA
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 08:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715587938; x=1747123938;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uxEqV9n1Og8KxQXqJmNY3YB+ndJ7UYuGGnzwdqFjjgI=;
 b=Vc7yEkBVZWWfF7jOkQ+A1oJfYqLi80XVJROhyfJNQT06qeDv/ekMK38Q
 oSRYiXRzT/92Om0Rlke6XlqRqjBE5+maOUh70hAAFqTu+izt4Hy+NaEjg
 7LVnuqljlxFxb2xtBArMuF49kt9WARFX9ie4drk+izaE+lC+bGJWb6H9B
 HWJeZZzWY3/kakknCoFkqzfsclamf/NqQ8tjh3IFfA/1u0KiZmTm+1wXR
 VIWYhGHQuEDdRNck2PB+JBcUZ9frlTJ6rviOoP5rYeVI6tGQvyRiCgNiv
 cKRKGKWEHDa44r4dqj7XQTluLEGp4v7ff5JgnLuRAa2noiJqvWKglKJEy Q==;
X-CSE-ConnectionGUID: KV4/Mv4mS6erlWaDo24AfQ==
X-CSE-MsgGUID: dP2zMnw1QjOKc8ye5+7aZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="34019601"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="34019601"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:12:18 -0700
X-CSE-ConnectionGUID: sgvBOUtAT261kn/LZGYEpg==
X-CSE-MsgGUID: ku36nBz4QyW+sFJaHMZVZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30219996"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:12:16 -0700
Message-ID: <bde72c53-0cef-4fc0-948e-7964801872ec@intel.com>
Date: Mon, 13 May 2024 10:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/20] drm/xe: reset mmio mappings with devm
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-39-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240510181212.264622-39-matthew.auld@intel.com>
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

On 10.05.2024 20:12, Matthew Auld wrote:
> Set our various mmio mappings to NULL. This should make it easier to
> catch something rogue trying to mess with mmio after device removal. For
> example, we might unmap everything and then start hitting some mmio
> address which has already been unmamped by us and then remapped by
> something else, causing all kinds of carnage.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/xe/xe_device.c |  4 +++-
>   drivers/gpu/drm/xe/xe_mmio.c   | 35 ++++++++++++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_mmio.h   |  2 +-
>   3 files changed, 33 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 40983ad66e3c..ce8bccbb06ba 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -554,7 +554,9 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> -	xe_mmio_probe_tiles(xe);
> +	err = xe_mmio_probe_tiles(xe);
> +	if (err)
> +		return err;
>   
>   	xe_ttm_sys_mgr_init(xe);
>   
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index a3094e741db8..0ad840bab8f3 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -255,6 +255,21 @@ static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>   	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>   }
>   
> +static void vram_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +	struct xe_tile *tile;
> +	int id;
> +
> +	if (xe->mem.vram.mapping)
> +		iounmap(xe->mem.vram.mapping);
> +
> +	xe->mem.vram.mapping = NULL;
> +
> +	for_each_tile(tile, xe, id)
> +		tile->mem.vram.mapping = NULL;
> +}
> +
>   int xe_mmio_probe_vram(struct xe_device *xe)
>   {
>   	struct xe_tile *tile;
> @@ -331,10 +346,20 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
>   		 &available_size);
>   
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
>   }
>   
> -void xe_mmio_probe_tiles(struct xe_device *xe)
> +static void tiles_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +	struct xe_tile *tile;
> +	int id;
> +
> +	for_each_tile(tile, xe, id)
> +		tile->mmio.regs = NULL;
> +}
> +
> +int xe_mmio_probe_tiles(struct xe_device *xe)
>   {
>   	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
>   	u8 id, tile_count = xe->info.tile_count;
> @@ -385,6 +410,8 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
>   			regs += tile_mmio_ext_size;
>   		}
>   	}
> +
> +	return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
>   }
>   
>   static void mmio_fini(void *arg)
> @@ -392,10 +419,6 @@ static void mmio_fini(void *arg)
>   	struct xe_device *xe = arg;
>   
>   	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
> -	if (xe->mem.vram.mapping)
> -		iounmap(xe->mem.vram.mapping);
> -
> -	xe->mem.vram.mapping = NULL;
>   	xe->mmio.regs = NULL;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 445ec6a0753e..6488705c1ffe 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -21,7 +21,7 @@ struct xe_device;
>   #define LMEM_BAR		2
>   
>   int xe_mmio_init(struct xe_device *xe);
> -void xe_mmio_probe_tiles(struct xe_device *xe);
> +int xe_mmio_probe_tiles(struct xe_device *xe);
>   
>   u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
>   u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg);

