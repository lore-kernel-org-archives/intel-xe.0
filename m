Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CCFC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 11:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CFA10EA58;
	Fri,  8 Dec 2023 11:15:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A54710EA58
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 11:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702034110; x=1733570110;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MLYOVD1EyQ9G8Tu27c57oWyGmQ8HCC/LeHIC/uLwcjY=;
 b=TZjIQQF8RSee7HxbyVW5+RcLJee1cpHndda4dR0fA2nHqo14lCOiABnm
 YO+h7EFTSTxc2BtfO+4pbyeXDEfLKEovqgSke/JuR40cDvs4jzTJIuRjc
 Mx3xyDDjELfQsfgR83cKS1UOrH2wr8gHGWnej2I7Q1rXlPqT920I7hD5E
 AjCZ8qQpBnel8TkP2AfxfwWeay1ovDsthLH6spYUW/9GEFIRrM8TRNQT6
 kUeDluaxlo3gAgyXqHpy3373HriZl3Zf56ekv6E1W9hLjkpxipFHXqM2J
 KR22nCT0lRNw12nRMm4bLLPsghpORxp0F0YvVR9KJcXVmG9u3NJOJxDr2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1472529"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="1472529"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 03:15:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765459269"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="765459269"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 03:15:07 -0800
Message-ID: <22cdd8b1-90ef-ddce-5731-75cfc0987a3c@linux.intel.com>
Date: Fri, 8 Dec 2023 12:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/dgfx: Release mmap mappings on rpm
 suspend
To: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
References: <20231206133421.3295163-1-badal.nilawar@intel.com>
 <20231206133421.3295163-3-badal.nilawar@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231206133421.3295163-3-badal.nilawar@intel.com>
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
Cc: matthew.auld@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/6/23 14:34, Badal Nilawar wrote:
> Release all mmap mappings for all vram objects which are associated
> with userfault such that, while pcie function in D3hot, any access
> to memory mappings will raise a userfault.
>
> Upon userfault, in order to access memory mappings, if graphics
> function is in D3 then runtime resume of dgpu will be triggered to
> transition to D0.
>
> Previous commit has blocked the rpm but let's make sure that rpm
> does not get blocked for headed cards(client's parts).
> Above pagefault approach will be  useful for headed cards to save the
> power when display is off and there are active mmap mappings.
>
> v2:
>    - Add lock dep assertion before updating vram_userfault_count (Rodrigo)
>    - Avoid iomem check before bo migration check as bo can migrate
>      to system memory (Matthew Auld)
> v3:
>    - Apply pagefault approach for headed cards.
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c           | 62 ++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_bo.h           |  2 +
>   drivers/gpu/drm/xe/xe_bo_types.h     |  5 +++
>   drivers/gpu/drm/xe/xe_device_types.h | 20 +++++++++
>   drivers/gpu/drm/xe/xe_pm.c           |  7 ++++
>   5 files changed, 93 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5741948a2a51..419bc5c55aa7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -797,6 +797,18 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		dma_fence_put(fence);
>   	}
>   
> +	/*
> +	 * TTM has already nuked the mmap for us (see ttm_bo_unmap_virtual),
> +	 * so if we moved from VRAM make sure to unlink this from the userfault
> +	 * tracking.
> +	 */
> +	if (mem_type_is_vram(old_mem_type)) {
> +		spin_lock(&xe->mem_access.vram_userfault_lock);
> +		if (INTEL_DISPLAY_ENABLED(xe) && !list_empty(&bo->vram_userfault_link))
> +			list_del_init(&bo->vram_userfault_link);
> +		spin_unlock(&xe->mem_access.vram_userfault_lock);
> +	}
> +

Please move this block into move_notify() instead, if at all possible. 
That function is intended to release whatever various bindings we have 
set up to the backing memory in the old location.

Thanks,

Thomas


