Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3C2C7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 11:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9850F10E0A3;
	Thu, 25 May 2023 11:52:50 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAB710E0A3
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 11:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685015568; x=1716551568;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=iL48J3ccQ8rONk07vZUE1dpG84PQT9WTGrC75eKS2GY=;
 b=IsD+G3sEq7g36KSNndcaEUyufQixMIyPSdGubB8Ge6oUtCjHudV4NPtd
 OKtFIBKyedCMLWUTLUsOi5MMDlKYbenGh4N8oLAT32igBx4bi2I0xEnDw
 xySBO+BVyTVdbdJHIjmw0sbRKkMkqsa3E7J4PxsbdW+fDbAkwZalJECGd
 okb7YZtf809uHXQRblWj7IIWP80sCRnDJmg9KdMLGGMJWwJftbFIhkxsJ
 H7sa2NSlwJYfZrKprSO2HhJrFPZQ4iaI2m7+/nu9+aLHLfdHnejdM9fOP
 gw+HRvF4nw0xPwn0vs+8hUdG5DhCO0+yUxps4DCZflzHe2tKnfxymrtVI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="353885034"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="353885034"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 04:52:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="682283581"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="682283581"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.45.12])
 ([10.252.45.12])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 04:52:46 -0700
Message-ID: <1cfa3a4c-2966-4962-041c-5ac132c08e3a@linux.intel.com>
Date: Thu, 25 May 2023 13:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230525114543.400106-1-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230525114543.400106-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/bo: further limit where CCS pages
 are needed
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


On 5/25/2023 1:45 PM, Matthew Auld wrote:
> No need to allocate extra pages for this if we know flat-ccs AUX state
> is not even possible, like for normal system memory objects.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c82e995df779..f994dbed634b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -283,6 +283,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>   	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>   	struct xe_device *xe = xe_bo_device(bo);
>   	struct xe_ttm_tt *tt;
> +	unsigned long extra_pages;
>   	int err;
>   
>   	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
> @@ -291,12 +292,15 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>   
>   	tt->dev = xe->drm.dev;
>   
> +	extra_pages = 0;
> +	if (xe_bo_needs_ccs_pages(bo))
> +		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
> +					   PAGE_SIZE);
> +
>   	/* TODO: Select caching mode */
>   	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
>   			  bo->flags & XE_BO_SCANOUT_BIT ? ttm_write_combined : ttm_cached,
> -			  DIV_ROUND_UP(xe_device_ccs_bytes(xe_bo_device(bo),
> -							   bo->ttm.base.size),
> -				       PAGE_SIZE));
> +			  extra_pages);
>   	if (err) {
>   		kfree(tt);
>   		return NULL;
