Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14472CD98F2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 15:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47BB10E614;
	Mon, 22 Jun 2026 15:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgQbHImq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BD010E614
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 15:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782143084; x=1813679084;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=YbVqfwnNX+NiaUyGt7fP0B6vtuFZqgjrhZyYRVhMc5k=;
 b=jgQbHImqNAi/ERNoFP71wFuFHlY+Nhl6gofMQd39o2mprkn2QL4TAGfp
 /WnBF/zzhH/AzMOa0dkmx3qZTuWz+0WfPb4LeL0p55meueeaCkH4dVzCC
 ox6S/X08ip3Fo18dYoXuJJWUMeeJtSHloOGwzJC6qxLsWXi9GEqBjfrtV
 0nDSrBmkh4Xa+VPSjudvbikbznW0XjimZneCRm7xTtCGkfKFSERQ4gRng
 6vcA6ShODDZhZRvhsVryZ1BrPGXTbRJxnyCcGShcmF2M7qt2qkmWqWpaZ
 J+dQCmN1YEwICXh9vAg7Wg2/H4Goarz/IOdQBiOt5Uy5+jQfmmJVgb4Rx g==;
X-CSE-ConnectionGUID: 0fivy44pQry6q9fJ1lxSHA==
X-CSE-MsgGUID: pYkAJgJoS3q39s4gBUSAGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93993875"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="93993875"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 08:44:44 -0700
X-CSE-ConnectionGUID: dsmBsc2yQkKdAGiF6IlQrg==
X-CSE-MsgGUID: 8FGC66yLSi60Ro1uTSY93w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="272957554"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.245.133])
 ([10.245.245.133])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 08:44:42 -0700
Message-ID: <b85d70b6-7b06-47ae-ae48-979cba16a71f@intel.com>
Date: Mon, 22 Jun 2026 16:44:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/xe/mmio: Drop tiles_fini action
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260622132342.19600-1-michal.wajdeczko@intel.com>
 <20260622132342.19600-5-michal.wajdeczko@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260622132342.19600-5-michal.wajdeczko@intel.com>
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

On 22/06/2026 14:23, Michal Wajdeczko wrote:
> The pointer zeroing is not required, as we check xe->mmio.regs to
> test if code is not trying to access MMIO after a driver unwind.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 13 +------------
>   1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 8dd818e1184c..58226cd8b399 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -24,16 +24,6 @@
>   
>   #include "generated/xe_device_wa_oob.h"
>   
> -static void tiles_fini(void *arg)
> -{
> -	struct xe_device *xe = arg;
> -	struct xe_tile *tile;
> -	int id;
> -
> -	for_each_remote_tile(tile, xe, id)
> -		tile->mmio.regs = NULL;
> -}
> -
>   /*
>    * On multi-tile devices, partition the BAR space for MMIO on each tile,
>    * possibly accounting for register override on the number of tiles available.
> @@ -74,8 +64,7 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>   	size_t tile_mmio_size = SZ_16M;
>   
>   	mmio_multi_tile_setup(xe, tile_mmio_size);
> -
> -	return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
> +	return 0;
>   }
>   
>   static void mmio_fini(void *arg)

