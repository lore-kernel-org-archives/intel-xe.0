Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952E8C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 20:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5135C10E785;
	Thu, 29 May 2025 20:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hkivQuRB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1815710E777
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 20:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748551757; x=1780087757;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=KgsNppR9GdUMJ9x88KC+wHPd3HnS7KrsLDOJPiSkbDs=;
 b=hkivQuRBv1YEXObooyUA+qH+9LXCgvCc3UloDHHgi7M+IGuFkX3eUsYv
 bf/kbkKWOVdVWEzGTUU1FyAJhCBokPcvrdsyERHVKllmwy/GUbBHsSPge
 kL8f2DKd6kx2LuooRptqgxy0K/u9p7bEhZsdIgKkEZdkp9v+DXIueIV1Z
 1AGyVr2zM1XHUsyz/m5xkV62AgElIX4GUe+9X99lt8qyI3xTH2fx5Uhqp
 AiT3lUKwlYyzKKvMMJoKOK1hpIw9Bn3fd2Vx6r6W7sipzWS8VmqQ/hsdO
 FlKzN0ab7cvZjpGVhcULWTVNhandIpDRRfVyyuJdQw54BYOSI7guKp3rU w==;
X-CSE-ConnectionGUID: sY2enrjWShe7O9KCf5/pvQ==
X-CSE-MsgGUID: DtfQABQKREuL3BZ7z/EFSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50779361"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50779361"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 13:49:10 -0700
X-CSE-ConnectionGUID: C6b7pUCNT9OOR12SvLLUrg==
X-CSE-MsgGUID: 19K08UeqTiWelsaLnuTI0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143654040"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 29 May 2025 13:49:09 -0700
Received: from [10.245.113.199] (unknown [10.245.113.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1030134971;
 Thu, 29 May 2025 21:49:07 +0100 (IST)
Message-ID: <65eaaf43-a80b-4e96-bc96-a0e48d416dcf@intel.com>
Date: Thu, 29 May 2025 22:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/xe/vf: Boostrap all GTs immediately after MMIO
 init
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250528234229.4185039-6-daniele.ceraolospurio@intel.com>
 <20250528234229.4185039-8-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250528234229.4185039-8-daniele.ceraolospurio@intel.com>
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



On 29.05.2025 01:42, Daniele Ceraolo Spurio wrote:
> Currently we perform the bootstrap for the primary GT early on during
> device init, while the media GT bootstrap happens when we try and fetch
> the hwconfig table. For consistency, move the bootstrap of the media GT
> happen at the same time as the primary GT, so that all the subsequent
> code can rely on both GTs being in the same state.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 11 ++++++-----
>  drivers/gpu/drm/xe/xe_guc.c    |  4 ----
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 660b0c5126dc..7e87344943cd 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -798,18 +798,19 @@ int xe_device_probe(struct xe_device *xe)
>  		 * be performed.
>  		 */
>  		xe_gt_mmio_init(gt);
> -	}
>  
> -	for_each_tile(tile, xe, id) {
>  		if (IS_SRIOV_VF(xe)) {
> -			xe_guc_comm_init_early(&tile->primary_gt->uc.guc);
> -			err = xe_gt_sriov_vf_bootstrap(tile->primary_gt);
> +			xe_guc_comm_init_early(&gt->uc.guc);
> +			err = xe_gt_sriov_vf_bootstrap(gt);
>  			if (err)
>  				return err;
> -			err = xe_gt_sriov_vf_query_config(tile->primary_gt);
> +			err = xe_gt_sriov_vf_query_config(gt);
>  			if (err)
>  				return err;
>  		}
> +	}
> +
> +	for_each_tile(tile, xe, id) {
>  		err = xe_ggtt_init_early(tile->mem.ggtt);
>  		if (err)
>  			return err;
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 350434a8b953..065550964e68 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1102,10 +1102,6 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	int ret;
>  
> -	ret = xe_gt_sriov_vf_bootstrap(gt);
> -	if (ret)
> -		return ret;
> -
>  	ret = xe_gt_sriov_vf_query_config(gt);

we likely don't need this either as config was read in xe_device_probe()

otherwise LGTM

>  	if (ret)
>  		return ret;

