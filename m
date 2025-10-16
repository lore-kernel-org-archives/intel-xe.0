Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEC2CCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 09:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8428710E98D;
	Thu, 16 Oct 2025 09:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KIpkW7Xx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC34D10E98D
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 09:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760608665; x=1792144665;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+KP8QFtH928S0lWilv95cGubAYZCSmXyVh/Y9aHepgc=;
 b=KIpkW7Xx2QPQXjOqV/bpZ8XTs0NJ8tLASXTI5mmGdyd566j9JZkAyrM4
 Bpq60Crl3W21fY4bHcC/LqV79uJoIXvhKfl+cK9Qro6OTDYBjVHcwPgNX
 YllHEdpX50rZDE1ImslX5RSat6OcUeY9qe0xXqp4nnb9FD+R8E55Zvpk+
 VwrnCgWX2D9pdkU20WOdSrgWcCncrJAUHQ9Pq6rA93rJeuKMVb6+dTeUx
 r6s0zMIg85DPyneqwRnYPSg5NlWFdYaz1hryOfgwWgoux87LNFp8vMbeZ
 pSvMpK+Z49DxtCei8T6HDgz8of0sKbe+k3dThk0sGTYvXpl70vGLR//cv g==;
X-CSE-ConnectionGUID: lUHxMirLTrmiPH5Me9HzOQ==
X-CSE-MsgGUID: l4ayCUzmT0O/uKjHgzZCrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62006455"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="62006455"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 02:57:45 -0700
X-CSE-ConnectionGUID: U0Chu0qiRm6DbfvrZ22wBw==
X-CSE-MsgGUID: tJqCEfy/RPy4tcC+6atmXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="181975410"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.245.227])
 ([10.245.245.227])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 02:57:43 -0700
Message-ID: <d177de7d-a98a-43ea-88ff-f52d8349d22a@intel.com>
Date: Thu, 16 Oct 2025 10:57:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe: Change return type of detect_bar2_dgfx()
 from s64 to u64
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251009230239.2830207-5-shuicheng.lin@intel.com>
 <20251009230239.2830207-8-shuicheng.lin@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251009230239.2830207-8-shuicheng.lin@intel.com>
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

On 10/10/2025 00:02, Shuicheng Lin wrote:
> The function never returns a negative value, and the return value is
> assigned to a u64 variable. Use u64 for better type correctness
> and clarity.
> 
> v2: add assert to catch theoretical negative or zero stolen size. (Rodrigo)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 9b00bdc8ef1a..e368b2a36bac 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -81,7 +81,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
>   	return wopcm_size;
>   }
>   
> -static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> +static u64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>   {
>   	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)->mem.vram;
>   	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);
> @@ -105,6 +105,8 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>   		return 0;
>   
>   	stolen_size = tile_size - mgr->stolen_base;
> +
> +	xe_assert(xe, stolen_size > wopcm_size);

This looks to be triggering:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6359

>   	stolen_size -= wopcm_size;
>   
>   	/* Verify usage fits in the actual resource available */

