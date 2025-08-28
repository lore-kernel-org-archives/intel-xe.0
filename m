Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBACC8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 14:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B07710E9B9;
	Thu, 28 Aug 2025 14:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKuyhVsY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C7510E9B9
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 14:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756389655; x=1787925655;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1bU9Z8Y1Klm+3syABKU3wzwAlwrzkZOd7S4WV6hQ+HU=;
 b=cKuyhVsYOOXU/ivr8GEMxUt+8f0P3dFxE9/SPFqwIMQawvP1cR629H1K
 58VdUAwzK98UkyR69O2BvXt6oCWiF5H82tA0nETKmJSm1pNB3yyCFcz2G
 sIjCOdwJw4sIq9EVdtLZ8JyFXeFGSO1YULh/fh0OiV5G9BHX6TIfgraJk
 PkujoOLTxjP6ynZYI1I90B8x2k5mRysTrXWfbs+Nf4T2Sof2fDKgPppKv
 Ttwg08Vfw7MpwAoZHhVfK8a4HvW0rUPq21nDa1iQt/dKkq0qvVE3NPD0a
 MmAC1YAadLtPg3iQlLYS9UmZX03UzoyTQod3dePHJAWWPuedBIBPyvfB7 Q==;
X-CSE-ConnectionGUID: v+SIxp7gRvK4Tl+bfu4mEA==
X-CSE-MsgGUID: rgwpLCoaSUuDsILinNarbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="62481702"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="62481702"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:00:54 -0700
X-CSE-ConnectionGUID: uv0d6gbtRxa56MAT66Gt/w==
X-CSE-MsgGUID: Q1O/JDPfS7aRIynG51Vzog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169366657"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.84])
 ([10.245.245.84])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:00:52 -0700
Message-ID: <5d0e5447-f264-4574-a368-0891aa93ae15@intel.com>
Date: Thu, 28 Aug 2025 15:00:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix incorrect migration of backed-up object to
 VRAM
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
References: <20250828134837.5709-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250828134837.5709-1-thomas.hellstrom@linux.intel.com>
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

On 28/08/2025 14:48, Thomas Hellström wrote:
> If an object is backed up to shmem it is incorrectly identified
> as not having valid data by the move code. This means moving
> to VRAM skips the -EMULTIHOP step and the bo is cleared. This
> causes all sorts of weird behaviour on DGFX if an already evicted
> object is targeted by the shrinker.
> 
> Fix this by using ttm_tt_is_swapped() to identify backed-up
> objects.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5996
> Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: <stable@vger.kernel.org> # v6.15+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

I guess we are missing some test coverage here?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_bo.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7d1ff642b02a..4faf15d5fa6d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -823,8 +823,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		return ret;
>   	}
>   
> -	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
> -			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
> +	tt_has_data = ttm && (ttm_tt_is_populated(ttm) || ttm_tt_is_swapped(ttm));
>   
>   	move_lacks_source = !old_mem || (handle_system_ccs ? (!bo->ccs_cleared) :
>   					 (!mem_type_is_vram(old_mem_type) && !tt_has_data));

