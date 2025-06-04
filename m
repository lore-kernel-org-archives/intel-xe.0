Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52DDC5B552
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 08:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7213F10E715;
	Wed,  4 Jun 2025 08:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hFzvk45u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F21D10E7BF
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 08:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749025904; x=1780561904;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=tZO3R/CmYPxdsCj6YmTRxxYiNAfRJXh2Fk/AFDYC9bY=;
 b=hFzvk45uNWaQixaW3H72ET/n+VQOgZVHFEGFQ1hpOjpdqF+6ozwNHg3x
 bnu0hAeji5SNSEa9ujCGg3kyMPxIZwkltkFWyjL3M+1LQwEbFWRoM3yxN
 TSQJXzkphR0Z40jdqkuZI8mzFDqK4Ex6BN0FX+Gj+kMYe30ls+wU01U0C
 TyYkcdPKYtv2mtVIH0ibkFn1SCYUpxDB7R/OqwRaqRc9TBuo3nKGJsttb
 Oyj+WSL60V5Iry3nU7D9yUYm+wDLXBb1FFVxpl0VL72kmxszpZsZFLUN/
 lLlSqrRWCvZhGDAa6m3TF3XvHGn8Zt/qQ69i4nPEgG3OVC2q5lWoibEYn Q==;
X-CSE-ConnectionGUID: OrUukLIpTBu+B8/8WC0zBw==
X-CSE-MsgGUID: h0l0E6sxRbee03U2iEiBSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50337791"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="50337791"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 01:31:44 -0700
X-CSE-ConnectionGUID: 5aj7uIu+TaSlFCHNrPxTtA==
X-CSE-MsgGUID: yFKTldw5RTeKsPGydT/4Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="168289819"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 04 Jun 2025 01:31:43 -0700
Received: from [10.245.253.198] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.253.198])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2AA9932EB5;
 Wed,  4 Jun 2025 09:31:42 +0100 (IST)
Message-ID: <ef23bb00-7e14-4a9a-ad82-c6abc4063890@intel.com>
Date: Wed, 4 Jun 2025 10:31:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/xe/vf: Boostrap all GTs immediately after MMIO
 init
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250603235432.720833-6-daniele.ceraolospurio@intel.com>
 <20250603235432.720833-8-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250603235432.720833-8-daniele.ceraolospurio@intel.com>
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



On 04.06.2025 01:54, Daniele Ceraolo Spurio wrote:
> Currently we perform the bootstrap for the primary GT early on during
> device init, while the media GT bootstrap happens when we try and fetch
> the hwconfig table. For consistency, move the bootstrap of the media GT
> happen at the same time as the primary GT, so that all the subsequent
> code can rely on both GTs being in the same state.
> 
> v2: Also drop config query from min_guc_load since we now do it
>     early (Michal)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 11 ++++++-----
>  drivers/gpu/drm/xe/xe_guc.c    |  8 --------
>  2 files changed, 6 insertions(+), 13 deletions(-)
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
> index 52453845d1bd..209e5d53c290 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1102,14 +1102,6 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	int ret;
>  
> -	ret = xe_gt_sriov_vf_bootstrap(gt);
> -	if (ret)
> -		return ret;
> -
> -	ret = xe_gt_sriov_vf_query_config(gt);
> -	if (ret)
> -		return ret;
> -
>  	ret = xe_guc_hwconfig_init(guc);
>  	if (ret)
>  		return ret;

