Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC0EC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 05:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F273B10E13C;
	Wed,  3 Jan 2024 05:23:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D56510E13C
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 05:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704259421; x=1735795421;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=z07skrbSBcP+I/v4XlIuF/atD6n9vO6kjGWaZhVw+Es=;
 b=it5quAC9nJGEYazxCq7Mxf6q0tkJX10VBgar6CEWKvcA0K90edOORkpj
 79G0zJgvbyx73zK+peMHvz2rnvnsDjbJVrR71kobZzrJiFkbsHTpkiRDh
 zxJ2SavEPQinweoM5CwhTreEPYJBiFbPxD5vweeKEW0YDCOKOfcSXK9XE
 ZO7IW8cUBX87zfFiDOkeMXQnlyQrvHD/OPlsbwI+W3oBei9lOaWf4mWTR
 EXTEO1bARbRnwxEOPa4PAPhUiry8DrAgFECzPocjDbrBtIJu7wYTkyZOA
 GYZsuuPCMPi/wtqZ5dBPBSoS6dND9Ryl7W+0RSsF03ZMX+oBvbBVGj3Kf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3730121"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="3730121"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 21:23:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="773043096"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="773043096"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 21:23:38 -0800
Message-ID: <4cb7f45b-c742-4bd2-ac96-c950d5d4301b@linux.intel.com>
Date: Wed, 3 Jan 2024 10:56:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] drm/xe/uapi: Add configs for Engine busyness
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
References: <20231222074602.817518-1-riana.tauro@intel.com>
 <20231222074602.817518-4-riana.tauro@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231222074602.817518-4-riana.tauro@intel.com>
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


On 12/22/23 13:15, Riana Tauro wrote:
> GuC provides engine busyness ticks as a 64 bit counter which count
> as clock ticks.
>
> Add configs to the uapi to expose Engine busyness via PMU.
>
> v2: add "__" prefix for internal helpers
>     add a simple helper for application usage (Aravind)
>
> v3: rebase
>     change internal uapi pmu config helpers (Umesh)
>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 41 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 9fa3ae324731..f8456cda5cda 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1340,6 +1340,47 @@ struct drm_xe_wait_user_fence {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * DOC: XE PMU event config IDs
> + *
> + * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed in xe_drm.h
> + * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
> + * particular event.
> + *
> + */
> +
> +/**
> + * enum drm_xe_pmu_engine_sample - Supported PMU engine samples
> + */
> +enum drm_xe_pmu_engine_sample {
> +	/** @DRM_XE_PMU_SAMPLE_BUSY_TICKS: Engine busy ticks */
> +	DRM_XE_PMU_SAMPLE_BUSY_TICKS = 0,
> +};
> +
> +/*
> + * Top bits of every counter are GT id.
> + */
> +#define __DRM_XE_PMU_GT_SHIFT (56)
> +#define __DRM_XE_PMU_SAMPLE_BITS (4)
> +#define __DRM_XE_PMU_SAMPLE_INSTANCE_BITS (8)
> +#define __DRM_XE_PMU_CLASS_SHIFT \
> +	(__DRM_XE_PMU_SAMPLE_BITS + __DRM_XE_PMU_SAMPLE_INSTANCE_BITS)
> +
> +#define __DRM_XE_PMU_GT_EVENT(gt, x) \
> +	(((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
> +
> +#define __DRM_XE_PMU_ENGINE(class, instance, sample) \
> +	(((class) << __DRM_XE_PMU_CLASS_SHIFT | \
> +	(instance) << __DRM_XE_PMU_SAMPLE_BITS | \
> +	(sample)))
> +
> +#define __DRM_XE_PMU_OTHER(gt, x) \
> +	(__DRM_XE_PMU_GT_EVENT(gt, 0xfffff) + 1 + (x))
Use __DRM_XE_PMU_ENGINE(0xff, 0xff, 0xf) instead of 0xfffff so that it will be clear
that it is starting after the engine event.

But __DRM_XE_PMU_OTHER is not used any where so why to introduce in this patch.

Thanks,
Aravind.
> +
> +#define DRM_XE_PMU_ENGINE_BUSY_TICKS(gt, class, instance) \
> +	__DRM_XE_PMU_GT_EVENT(gt, __DRM_XE_PMU_ENGINE(class, instance, \
> +						      DRM_XE_PMU_SAMPLE_BUSY_TICKS))
> +
>  #if defined(__cplusplus)
>  }
>  #endif
