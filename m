Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A67D0D78F
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 13:31:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364D510EAE8;
	Fri, 11 Oct 2024 13:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKndH+bL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1646710EAE8
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 13:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728653516; x=1760189516;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2iEz/CYGri8hF0fy63iQj2HpAeitgEQcM48glh15FWM=;
 b=UKndH+bLDGu9WBg7iXBFYtDHI9YN6cqoFaZ8LJXLzOtVIOFFo+Cypbhp
 zHW3w8Itwmocqxg7sKq0MySzHdRF/CEw3aXNqS1jLSjFd1YB+4WNYfTYH
 Si7mdoFP4gRusaOiC3tn0uXkZ7A65C2/ASwBmjChrRWXuKFJf0jYMiD3K
 1pNVAPCYpoF8NGuViJ1cK1LxJvatXUC7MFG9K8b8uswXq60JHGLVVmbjY
 mOOQmiPQgrYDU2kYEPlUw08KF7JKmXKDLQ0SUxHHhcoscbxlBixMKGUIf
 rwbYoGFKcNOVQExyibedNDOqtUK7uD1x6f8tv1NLMHNNKS3pSeOekH2VU w==;
X-CSE-ConnectionGUID: FQo5nR+TR4Giqi09rgkyrw==
X-CSE-MsgGUID: L8m8K4rSSSCwegHw6TAR7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38620669"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="38620669"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 06:31:55 -0700
X-CSE-ConnectionGUID: Gq3gfs4IQcehlGpDGyclYA==
X-CSE-MsgGUID: 5gkNsraRRZCj6Ra5HtklcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="81441113"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 11 Oct 2024 06:31:54 -0700
Received: from [10.245.84.117] (unknown [10.245.84.117])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3BAF028784;
 Fri, 11 Oct 2024 14:31:52 +0100 (IST)
Message-ID: <876afb5e-c105-45d8-8c67-a81a466adba7@intel.com>
Date: Fri, 11 Oct 2024 15:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] drm/xe: Add xe_ggtt_alloc
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20241009125114.412624-1-maarten.lankhorst@linux.intel.com>
 <20241009125114.412624-4-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241009125114.412624-4-maarten.lankhorst@linux.intel.com>
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



On 09.10.2024 14:51, Maarten Lankhorst wrote:
> Instead of allocating inside xe_tile, create a new function that returns
> an allocated struct xe_ggtt from xe_ggtt.c
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h |  2 ++
>  drivers/gpu/drm/xe/xe_tile.c |  4 +---
>  3 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 16be6f53b75b2..c9fa9d15b69de 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -160,6 +160,22 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  	}
>  }
>  
> +/**
> + * xe_ggtt_alloc - Allocate a GGTT for a given &xe_tile

nit: this comment is little confusing, as you're allocating the xe_ggtt
object that represents the GGTT, not the GGTT itself

> + * @tile: &xe_tile
> + *
> + * Allocates a &xe_ggtt for a given tile.

that sounds better

> + *
> + * Return: &xe_ggtt on success, or NULL when out of memory.

Return: pointer to the &xe_ggtt on success, or NULL when out of memory.

> + */
> +struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile)
> +{
> +	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);

"Missing a blank line after declarations

> +	if (ggtt)
> +		ggtt->tile = tile;
> +	return ggtt;
> +}
> +
>  static void ggtt_fini_early(struct drm_device *drm, void *arg)
>  {
>  	struct xe_ggtt *ggtt = arg;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 62c8ce636939a..0bab1fd7cc817 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -9,7 +9,9 @@
>  #include "xe_ggtt_types.h"
>  
>  struct drm_printer;
> +struct xe_tile;
>  
> +struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile);
>  int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>  int xe_ggtt_init(struct xe_ggtt *ggtt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 07cf7cfe4abd5..19814bfbab423 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -88,11 +88,9 @@ static int xe_tile_alloc(struct xe_tile *tile)
>  {
>  	struct drm_device *drm = &tile_to_xe(tile)->drm;
>  
> -	tile->mem.ggtt = drmm_kzalloc(drm, sizeof(*tile->mem.ggtt),
> -				      GFP_KERNEL);
> +	tile->mem.ggtt = xe_ggtt_alloc(tile);
>  	if (!tile->mem.ggtt)
>  		return -ENOMEM;
> -	tile->mem.ggtt->tile = tile;
>  
>  	tile->mem.vram_mgr = drmm_kzalloc(drm, sizeof(*tile->mem.vram_mgr), GFP_KERNEL);
>  	if (!tile->mem.vram_mgr)

