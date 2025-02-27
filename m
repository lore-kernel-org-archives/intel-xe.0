Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FBEC19F2E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 15:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2561B10EB22;
	Thu, 27 Feb 2025 15:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I31Sb0WQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B25E10EB22
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 15:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740668737; x=1772204737;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=A+U42NhqAZoA8vMyynUzKeWyPA8yKDkB5LTjA/4G1Cc=;
 b=I31Sb0WQFYtb6XXszfvYTu8zLHDm2vVXJdiqmwRBAyP3moCMKCnQavOe
 WIGhEKtW3xdrBZQmo71nUpqZJzgJg3B1zmwB0zj4Q93ojFzq0sYWTvUmE
 Rv3uqTQlzBUvzgxaxzwmrurESW8Bt6e+d910QEAcUq2x3JdfZp34VeYZg
 yYDv6IBTV+GQV1wIhmEgXyLnkyiZalzGy+BQ4gw467RWGKDj+N8CdF6mH
 olTV2t33YYd97y1CyTlBXf2IHYdpShMZQF9ozK0Fm2JpmyIMfm61obIfP
 0c6v9PVwlPGmuKt38tcpSlYleTZEMwerCBNAmGQkPgCXrNFpTbtkX7SwH w==;
X-CSE-ConnectionGUID: eyT+8DhHQa2pozFRov2fSg==
X-CSE-MsgGUID: DlHchDwCTN6o4Y4iDdfbag==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52203534"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="52203534"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 07:05:37 -0800
X-CSE-ConnectionGUID: pJl2euBmRxuVuO8TPXezUw==
X-CSE-MsgGUID: nDmTYOZTSjeVToPmf3Hplg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="121995802"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.234])
 ([10.245.245.234])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 07:05:36 -0800
Message-ID: <b10d1bfe-60dd-4412-ba72-7af698e593b0@intel.com>
Date: Thu, 27 Feb 2025 15:05:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Only probe stolen memory when display support is
 enabled.
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
References: <20250227145556.428738-1-dev@lankhorst.se>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250227145556.428738-1-dev@lankhorst.se>
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

On 27/02/2025 14:55, Maarten Lankhorst wrote:
> Without display, there is no need for display stolen memory.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

There is also xe_gsc_init_post_hwconfig() which looks to use stolen, and 
I don't think that is dependent on display. But maybe that gsc stuff 
doesn't have to use stolen? Daniele, any idea here?

> ---
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index d9c9d2547aadf..2e60d5346ec43 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -218,7 +218,7 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>   	if (!mgr)
>   		return -ENOMEM;
>   
> -	if (IS_SRIOV_VF(xe))
> +	if (!xe->info.probe_display)
>   		stolen_size = 0;
>   	else if (IS_DGFX(xe))
>   		stolen_size = detect_bar2_dgfx(xe, mgr);

