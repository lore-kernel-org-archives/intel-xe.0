Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0975CCD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 15:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0A910E0EB;
	Wed,  3 Apr 2024 15:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJylo3mf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7001110E0EB
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712159282; x=1743695282;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BKJSaG8UybVYrLhh1efKseyNEwhFX4wed2OexY1CnPM=;
 b=UJylo3mfsW6zTDRM21XF9kXW9EPAhm+G4P2zXxjPZ9QygSL6fCjXU0wh
 umTKkB2vtOQhE1B1Xz7lhCJom5EjE7xfFPHfbvsAQ9sBvzBbcdB7in+HR
 S08DPMhJ6c4Z+e2sdNM0P0fbGP2zCYrig/UOtUgbiI4hOVc7gG/D8QHzN
 AI5yXwpuU6LkDOnRn29UUB9Td6C6U1pHGF8oo/+vD3mfMeeYzObjxZvp5
 G1A4LMcVw49e9x7VG1Um0Dfi5NFcjwNV2rwjY2cV02V/O3TWbtnr8/hUp
 h9NMhKx6lXNmzmoPQtVqAnCRJD8sgnmNgO4gXHN4XDUCheU45qQvsIm3G g==;
X-CSE-ConnectionGUID: S+Dal3CnTB60K/yqr1hRBQ==
X-CSE-MsgGUID: RG58HdU0TIiDrMgUar8y1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7258243"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7258243"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 08:48:02 -0700
X-CSE-ConnectionGUID: GqHQdklgSlSCTZHgRG9WVQ==
X-CSE-MsgGUID: LEyCyTh6T9O68whK7xNCYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="41643164"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.36.15])
 ([10.246.36.15])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 08:48:00 -0700
Message-ID: <8e1632b4-658b-49fb-817f-99b889d0cea4@linux.intel.com>
Date: Wed, 3 Apr 2024 17:47:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/tile: Set default memory placement for BOs
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>
References: <20240402215455.1839828-1-lucas.demarchi@intel.com>
 <20240402215455.1839828-2-lucas.demarchi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240402215455.1839828-2-lucas.demarchi@intel.com>
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

Hi Lucas,

On 4/2/2024 11:54 PM, Lucas De Marchi wrote:
> During initialization, record what should be the default placement for
> BOs, unless otherwise specified via flags when BO is created. This will
> allow to remove XE_BO_FLAG_VRAM_IF_DGFX() that is spread all throughout
> the code.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c           |  9 +++++++++
>   drivers/gpu/drm/xe/xe_bo.h           | 11 +++++------
>   drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++++
>   drivers/gpu/drm/xe/xe_tile.c         |  6 ++++++
>   4 files changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6166bc715656..71446688c643 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1368,6 +1368,15 @@ __xe_bo_create_locked(struct xe_device *xe,
>   	if (vm)
>   		xe_vm_assert_held(vm);
>   
> +	if (!(flags & XE_BO_FLAG_PL_MASK)) {
> +		struct xe_tile *tile_pl = tile;
> +
> +		if (!tile_pl)
> +			tile_pl = xe_device_get_root_tile(xe);
> +
> +		flags |= tile_pl->mem.default_pl_flag;
> +	}
> +
>   	if (start || end != ~0ULL) {
>   		bo = xe_bo_alloc();
>   		if (IS_ERR(bo))
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index bae042b35fa8..8781ee15c253 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -23,17 +23,16 @@
>   
>   #define XE_DEFAULT_GTT_SIZE_MB          3072ULL /* 3GB by default */
>   
> -#define XE_BO_FLAG_USER		BIT(0)
> +#define XE_BO_FLAG_USER			BIT(0)
>   /* The bits below need to be contiguous, or things break */
>   #define XE_BO_FLAG_SYSTEM		BIT(1)
>   #define XE_BO_FLAG_VRAM0		BIT(2)
>   #define XE_BO_FLAG_VRAM1		BIT(3)
> -#define XE_BO_FLAG_VRAM_MASK		(XE_BO_FLAG_VRAM0 | XE_BO_FLAG_VRAM1)
> -/* -- */
>   #define XE_BO_FLAG_STOLEN		BIT(4)
> -#define XE_BO_FLAG_VRAM_IF_DGFX(tile)	(IS_DGFX(tile_to_xe(tile)) ? \
> -					 XE_BO_FLAG_VRAM0 << (tile)->id : \
> -					 XE_BO_FLAG_SYSTEM)

This should happen in the following patch.  Otherwise this looks good to 
me.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Regards,

Nirmoy


> +#define XE_BO_FLAG_VRAM_MASK		(XE_BO_FLAG_VRAM0 | XE_BO_FLAG_VRAM1)
> +#define XE_BO_FLAG_PL_MASK		(XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_SYSTEM | \
> +					 XE_BO_FLAG_STOLEN)
> +
>   #define XE_BO_FLAG_GGTT			BIT(5)
>   #define XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE BIT(6)
>   #define XE_BO_FLAG_PINNED		BIT(7)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 47c864f67348..cdcdf27a442a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -173,6 +173,15 @@ struct xe_tile {
>   		 */
>   		struct xe_mem_region vram;
>   
> +		/**
> +		 * @mem.default_pl_flag: Default placement for BOs
> +		 *
> +		 * Default placement set as one of XE_BO_FLAG_{VRAM*,SYSTEM}.
> +		 * May still be overriden when creating a bo by setting a
> +		 * specific flag.
> +		 */
> +		u32 default_pl_flag;
> +
>   		/** @mem.vram_mgr: VRAM TTM manager */
>   		struct xe_ttm_vram_mgr *vram_mgr;
>   
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 0650b2fa75ef..a55157f29c2c 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -5,6 +5,7 @@
>   
>   #include <drm/drm_managed.h>
>   
> +#include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
> @@ -162,6 +163,11 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>   
>   	xe_device_mem_access_get(tile_to_xe(tile));
>   
> +	if (IS_DGFX(tile->xe))
> +		tile->mem.default_pl_flag = XE_BO_FLAG_VRAM0 << tile->id;
> +	else
> +		tile->mem.default_pl_flag = XE_BO_FLAG_SYSTEM;
> +
>   	err = tile_ttm_mgr_init(tile);
>   	if (err)
>   		goto err_mem_access;
