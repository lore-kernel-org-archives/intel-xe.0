Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E6EC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 08:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290D510E21C;
	Mon, 29 Jul 2024 08:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRcyTsET";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C96C10E21C
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 08:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722242817; x=1753778817;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=V80nITJZmGoTkQ4Nv/y/X8VuMKS8VmeG31Y3J3hDJ5w=;
 b=HRcyTsET0EwKuaWEqb2xajbsrxzYGS/NRhcf0QhPhTAlsnCYuz3tUnMM
 OwgUWdZpjPWOlVeRCI7Wotbmn/p1psRJVqyOobwgHG6iZQ7MX0IV03ZF+
 DuHXCAkOFkDkN2UQojqa67pE6a30R4ACKWjcN07g4IC3Gzk2jGsycuChI
 T/5KHszNzbtt4DeTPHWKz+WFCt0zfoZD/NVuHUV7KbY9lzO2eETHWGHai
 a8GLAO/XVzCLfF4WDS3jZUxmgkzLc0ovJQK1m4ws3Kxk1m9tJP7Dvs843
 P1MTxwuATKWqtS+/51/yNWL3Yvb5wEbWcHJV21M503zQb5TFLkPLssnrz A==;
X-CSE-ConnectionGUID: 4BpptetXQhmDQUM7rnqUcw==
X-CSE-MsgGUID: YlIFrBanT3q5QN/NyezPow==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="30601249"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="30601249"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 01:46:57 -0700
X-CSE-ConnectionGUID: g3V5n1KvQ0OPYuFXLw64WA==
X-CSE-MsgGUID: 5Jz8h8R7RaiV81zyT5gVqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="53573505"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO [10.245.245.166])
 ([10.245.245.166])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 01:46:56 -0700
Message-ID: <c03615b0-4237-4047-8afd-1788507abd08@intel.com>
Date: Mon, 29 Jul 2024 09:46:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use dma_fence_chain_free in chain fence unused as
 a sync
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: paulo.r.zanoni@intel.com
References: <20240727012216.2118276-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240727012216.2118276-1-matthew.brost@intel.com>
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

On 27/07/2024 02:22, Matthew Brost wrote:
> A chain fence is uninitialized if not installed in a drm sync obj. Thus
> if xe_sync_entry_cleanup is called and sync->chain_fence is non-NULL the
> proper cleanup is dma_fence_chain_free rather than a dma-fence put.
> 
> Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2411
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Also maybe:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2261

> ---
>   drivers/gpu/drm/xe/xe_sync.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 533246f42256..3aa6270e5dd7 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -259,7 +259,7 @@ void xe_sync_entry_cleanup(struct xe_sync_entry *sync)
>   	if (sync->fence)
>   		dma_fence_put(sync->fence);
>   	if (sync->chain_fence)
> -		dma_fence_put(&sync->chain_fence->base);
> +		dma_fence_chain_free(sync->chain_fence);
>   	if (sync->ufence)
>   		user_fence_put(sync->ufence);
>   }
