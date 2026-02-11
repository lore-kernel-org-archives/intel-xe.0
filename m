Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47182ECD6C7
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 16:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D925110E0B9;
	Wed, 11 Feb 2026 16:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZltZh4q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A7F10E0B9
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 16:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770828566; x=1802364566;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=c0mgjWU/+qBpRGX/SbJnj3zXNDK9uvUO7lHEazwskcE=;
 b=HZltZh4q5IhdtAEBhV502vkNcLip7+MHmq6xXub3LCdV470ZUDrNitGi
 sSRxox+1dUj8aejpa2QK18F2ZUJVy8gmCUeojVx5GLSdhfWAjptAhLL3X
 Q57JOB+OXpRyJ5ks8sKtPQ21l0ON1y0zl/Egv1JPVuDqZ/qBEnjwmx8Ym
 f3lAryifIHOxa/0SZPuRrPlTosyL8Q+uhdt1/G8XBPWPrs76KsqcwyA7Y
 uOhVicEGd4eDOlBsBZWCGytrDSEzLcieCiII68ZsqB3l7+WfmSsBSxpJ0
 +Cccp0MXNANvt3jpvdQtW35ewib1xdO2rYHvN09gaxjRkgd/kqe2bE932 w==;
X-CSE-ConnectionGUID: V0ht6gPMTse6hzrzzYvdTQ==
X-CSE-MsgGUID: /6GZauIaTsKMy3OipSpA0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71882564"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71882564"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:49:25 -0800
X-CSE-ConnectionGUID: wkKqaymBTjmARNzXf2xGSQ==
X-CSE-MsgGUID: taCR8MePS9GQDRyBE/CjOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212400669"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.252])
 ([10.245.244.252])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:49:24 -0800
Message-ID: <afaf02c0-0449-4931-9e32-4e30782ae88a@intel.com>
Date: Wed, 11 Feb 2026 16:49:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Only advertise NO_COMPRESSION hint on devices
 with flat CCS
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
References: <20260211114015.561461-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260211114015.561461-2-sanjay.kumar.yadav@intel.com>
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

On 11/02/2026 11:40, Sanjay Yadav wrote:
> Devices like CRI have GRAPHICS_VER >= 20 but don't have compression
> support their PAT table (xe3p_xpc_pat_table) has no compression-enabled
> entries.
> 
> Only advertise HAS_NO_COMPRESSION_HINT flag when the device actually has
> flat CCS and thus compression capability.
> 
> v2:
> - Also reject NO_COMPRESSION flag in xe_gem_create_ioctl() when device
>    lacks flat CCS support (Matt A)
> - Updated commit subject to reflect changes in both xe_query.c and xe_bo.c
> 
> Fixes: 78d91ba6bd796 ("drm/xe/uapi: Add NO_COMPRESSION BO flag and query capability")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_bo.c    | 3 ++-
>   drivers/gpu/drm/xe/xe_query.c | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8bf16d60b9a5..4b29a442de3e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3200,7 +3200,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   		bo_flags |= XE_BO_FLAG_SCANOUT;
>   
>   	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION) {
> -		if (XE_IOCTL_DBG(xe, GRAPHICS_VER(xe) < 20))
> +		if (XE_IOCTL_DBG(xe, GRAPHICS_VER(xe) < 20 ||
> +				 !xe_device_has_flat_ccs(xe)))
>   			return -EOPNOTSUPP;
>   		bo_flags |= XE_BO_FLAG_NO_COMPRESSION;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 34db266b723f..c152ebfbd7d8 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -335,7 +335,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>   	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
> -	if (GRAPHICS_VER(xe) >= 20)
> +	if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe))
>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
>   	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=

