Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CAACAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 11:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CDE10E11A;
	Fri,  3 Oct 2025 11:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TVOxxwkw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A2010E11A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759490459; x=1791026459;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=4vYqW3OPSfwAF303Mzy1CHBiFWYtiG//DgmOaHLPRU8=;
 b=TVOxxwkw25NbPA5gL24Pfvu1FKRQg2c7nyZWLTalERb+CuFZ5y4Clu/X
 BtNVqzzPkoLsRObM91k0aye5oBm3SjbSX87nvmL8/x/nZ0I8HoOmXPg6A
 DQKs/rD0IV/aFDp7qt3qarm3WwXE24m2qGk7SUK3Ok5buzFWpMs8f/vhX
 Z3JqfiPIRP8r7FuDdLZQ7Aq0v9l917GA94ACGIgasbdJIhJBdxuj4+bde
 5VZfB2J82DD7L/Dmv7koVhtHkXiy2QoclM2k2gsm/tWeRnujdlv6oGMD1
 W/cMAGDdpfmD1MbQrJw3BrX5EcagbcHpzhol2P6jFa3sGXEzppOHqjXTa g==;
X-CSE-ConnectionGUID: zG4IsqorTjKjVNRtc+dahw==
X-CSE-MsgGUID: IJ31oHVHTyOsanTRE8UNrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="64387186"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="64387186"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 04:20:58 -0700
X-CSE-ConnectionGUID: Vyw3dVxAQwKLrKvVbGciYw==
X-CSE-MsgGUID: FdfY+zHGSiOnkztZiYMKmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="216384515"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.120])
 ([10.245.244.120])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 04:20:58 -0700
Message-ID: <667f03c7-a909-4ed4-8c47-5589c33588a8@intel.com>
Date: Fri, 3 Oct 2025 12:20:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] drm/xe: Introduce new BO flag
 XE_BO_FLAG_FORCE_USER_VRAM
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
 <20250922170707.1556781-3-piotr.piorkowski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250922170707.1556781-3-piotr.piorkowski@intel.com>
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

On 22/09/2025 18:07, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> When using a separate VRAM region for kernel allocations,
> some kernel structures, such as context userspace data,
> should not reside in the VRAM region dedicated to the kernel.
> The VRAM kernel region is intended only for allocations necessary
> for driver operation. Allocations created via ioctl are long-lived
> and not easily evictable. If this region runs out of space,
> there may not be a fallback, which could cause failures.
> To prevent this, add a new BO flag that explicitly forces the BO to be
> allocated in the general-purpose VRAM region accessible to userspace,
> avoiding the kernel-only VRAM region.
> 
> v2:
>   - update commit message (Matthew)
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
>   drivers/gpu/drm/xe/xe_bo.h | 1 +
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 0fe7ce1f15f3..bcc66b474636 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -226,14 +226,14 @@ static u8 vram_bo_flag_to_tile_id(struct xe_device *xe, u32 vram_bo_flag)
>   	return __ffs(vram_bo_flag >> (__ffs(XE_BO_FLAG_VRAM0) - 1)) - 1;
>   }
>   
> -static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 vram_flag,
> +static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 bo_flags, u32 vram_flag,
>   					   enum ttm_bo_type type)
>   {
>   	u8 tile_id = vram_bo_flag_to_tile_id(xe, vram_flag);
>   
>   	xe_assert(xe, tile_id < xe->info.tile_count);
>   
> -	if (type == ttm_bo_type_kernel)
> +	if (type == ttm_bo_type_kernel && !(bo_flags & XE_BO_FLAG_FORCE_USER_VRAM))
>   		return xe->tiles[tile_id].mem.kernel_vram->placement;
>   	else
>   		return xe->tiles[tile_id].mem.vram->placement;
> @@ -276,7 +276,7 @@ static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
>   	u32 vram_flag;
>   
>   	for_each_set_bo_vram_flag(vram_flag, bo_flags) {
> -		u32 pl = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
> +		u32 pl = bo_vram_flags_to_vram_placement(xe, bo_flags, vram_flag, type);
>   
>   		add_vram(xe, bo, bo->placements, bo_flags, pl, c);
>   	}
> @@ -2263,7 +2263,7 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
>   	if (flags & XE_BO_FLAG_STOLEN)
>   		place->mem_type = XE_PL_STOLEN;
>   	else if (vram_flag)
> -		place->mem_type = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
> +		place->mem_type = bo_vram_flags_to_vram_placement(xe, flags, vram_flag, type);
>   	else
>   		return -EINVAL;
>   
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 9a8401300b15..353d607d301d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -49,6 +49,7 @@
>   #define XE_BO_FLAG_GGTT2		BIT(22)
>   #define XE_BO_FLAG_GGTT3		BIT(23)
>   #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
> +#define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
>   
>   /* this one is trigger internally only */
>   #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)

