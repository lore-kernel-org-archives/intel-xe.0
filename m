Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C4CC25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 08:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF9010E4EA;
	Mon, 13 May 2024 08:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gh0G1bY7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF6F10E4E3
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715587231; x=1747123231;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1mz6HsU7DV2JMWT+ovpbszNNoAkvQensLcPcSYpxVIA=;
 b=Gh0G1bY7WBLIoyo3ANTJJl/yrbfr3dMVRoACm7A9DEXICQSkYzBtHFiM
 u5kIzSjszsXOQ48cstdxovEm7ZXMWxUASJDHMLqJCWQ1eb+wf/Xf9jwUS
 6GdGinS8eK2RuizZ6/8vYvy0kF260t/Rk1d4McxQ171g1v5dV2z0rxEaH
 By6FuV32Wn3vRaThGv36NJsd30ud/1eRGA4oJqXEKSnlzyTZk7ymLu/J4
 FVbzE9snGtQi9jBbtMq6VBZLFq48wFIuHwmsGq4kKFfWqDIiYOi/mo/e1
 1Mm3IEB+uf7ioIeel8vRgtadqrwBPOrqveQo2gbaHkFeCWQz8PhmR7t4/ g==;
X-CSE-ConnectionGUID: jxqSHRlDSR+eiwPxZvlMiA==
X-CSE-MsgGUID: tvrkfKh/TTKNihNIrFRncQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11330761"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11330761"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:00:19 -0700
X-CSE-ConnectionGUID: HUCiGM+4RnOZu8IPDQBpiw==
X-CSE-MsgGUID: AwYdaYgRTmye7GbC45fEEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30381156"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:00:18 -0700
Message-ID: <edf593a3-dadd-41e1-b50c-7703a3796a10@intel.com>
Date: Mon, 13 May 2024 10:00:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] drm/xe/mmio: move mmio_fini over to devm
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-38-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240510181212.264622-38-matthew.auld@intel.com>
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
> Not valid to touch mmio once the device is removed, so make sure we
> unmap on removal and not just when driver instance goes away. Also set
> the mmio pointers to NULL to hopefully catch such issues more easily.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 05edab0e085d..a3094e741db8 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -387,13 +387,16 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
>   	}
>   }
>   
> -static void mmio_fini(struct drm_device *drm, void *arg)
> +static void mmio_fini(void *arg)
>   {
>   	struct xe_device *xe = arg;
>   
>   	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
>   	if (xe->mem.vram.mapping)
>   		iounmap(xe->mem.vram.mapping);
> +
> +	xe->mem.vram.mapping = NULL;
> +	xe->mmio.regs = NULL;
>   }
>   
>   int xe_mmio_init(struct xe_device *xe)
> @@ -418,7 +421,7 @@ int xe_mmio_init(struct xe_device *xe)
>   	root_tile->mmio.size = SZ_16M;
>   	root_tile->mmio.regs = xe->mmio.regs;
>   
> -	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> +	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>   }
>   
>   u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)

