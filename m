Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DE4FEA83A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 09:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D25810E848;
	Wed, 25 Mar 2026 09:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHBMqW84";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC95810E210
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 09:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774430686; x=1805966686;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=czEkAAaNXWjckWTOT5hytCqj5UFIfWGJZF7jGp3OHl0=;
 b=UHBMqW847N3QtCfEGe4yN913iej3va/HEh7LRTMgXZ1kOg/AdlKO6Ttp
 VA1oI6RRlw2NgaQ/HbRLYLjkxLX71ddTE+tHU3qvnRaFNzFQXZEg5yNnf
 4bo3KR0m0fv+GjDngQhXhrcu2JwRLBcNKvQQ5pC8LV6XIktlFoR+XU68H
 3BZJYQEDxOdBL7NCvpDtz/Ba2j4JgB277CekYr0Hpdilk1t8LeN9URZJG
 fqMjUtV4dKMeEXF6DCH/JbZPLvMq92xq+tOHN87Vv1WTx/HrndU9OWmuF
 oxOFu4u0pR/Ir3znMWQjNF/fcTPICFxgGSb0nfUWkyz1Flf7osp6OaT3p w==;
X-CSE-ConnectionGUID: DWvqvy5MSvypy4Uo+W7L5Q==
X-CSE-MsgGUID: r2WnxaB9SRmI5pN5YRjC/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93039184"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="93039184"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 02:24:46 -0700
X-CSE-ConnectionGUID: usUpahXWRKSaIy4+XpTG7g==
X-CSE-MsgGUID: dF3T4eOSTpiSqirIni5R7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="226258477"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.204.96])
 ([10.247.204.96])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 02:24:43 -0700
Message-ID: <a9ced237-84b1-451d-ad11-bbf422282f06@linux.intel.com>
Date: Wed, 25 Mar 2026 14:54:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/xe/uapi: Add additional error components to XE
 DRM RAS
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com
References: <20260320102607.1017511-1-riana.tauro@intel.com>
 <20260320102607.1017511-3-riana.tauro@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20260320102607.1017511-3-riana.tauro@intel.com>
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


On 20-03-2026 15:55, Riana Tauro wrote:
> Add additional Error components supported by XE RAS (Reliability,
> Availability and Serviceability).
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index f8b2afb20540..a1b1e15209cf 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -2432,6 +2432,12 @@ enum drm_xe_ras_error_component {
>  	DRM_XE_RAS_ERR_COMP_CORE_COMPUTE = 1,
>  	/** @DRM_XE_RAS_ERR_COMP_SOC_INTERNAL: SoC Internal Error */
>  	DRM_XE_RAS_ERR_COMP_SOC_INTERNAL,
> +	/** @DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY: Device Memory Error */
> +	DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY,
> +	/** @DRM_XE_RAS_ERR_COMP_PCIE: PCIe Subsystem Error */
> +	DRM_XE_RAS_ERR_COMP_PCIE,
> +	/** @DRM_XE_RAS_ERR_COMP_FABRIC: Fabric Subsystem Error */
> +	DRM_XE_RAS_ERR_COMP_FABRIC,
>  	/** @DRM_XE_RAS_ERR_COMP_MAX: Max Error */
>  	DRM_XE_RAS_ERR_COMP_MAX	/* non-ABI */
>  };
> @@ -2449,7 +2455,10 @@ enum drm_xe_ras_error_component {
>   */
>  #define DRM_XE_RAS_ERROR_COMPONENT_NAMES {				\
>  	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE] = "core-compute",		\
> -	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal"		\
> +	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal",		\
> +	[DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY] = "device-memory",		\
> +	[DRM_XE_RAS_ERR_COMP_PCIE] = "pcie",				\
> +	[DRM_XE_RAS_ERR_COMP_FABRIC] = "fabric",			\
>  }
>  

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Thanks,
Aravind.
>  #if defined(__cplusplus)
