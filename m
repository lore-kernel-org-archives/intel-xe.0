Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939F7C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 09:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B2210E466;
	Tue, 28 Nov 2023 09:11:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61E210E466
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 09:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701162663; x=1732698663;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+7HkQkBosZj3P2qKLnDRhnB/hzh/4dF16NrYaWzXB50=;
 b=SZLloejkLEiAM4z8luxqfAA5Zao31CXg2uMEHkrAxNmg5XLI2EuoNiLQ
 ddYGKtGxKc67GtMqTKjRy6P/pMH3sYWPyo0lIu/BqR7ztANVCUcPBPDyH
 Pm5mGBaPUPE2q29GTfp8zDf3fCGc3QR55MlT748EwSaQrkVOdcsTLfSIJ
 T4xA9ZBc4qwGhJyd3mzjrWSWFgrZSeiUGvFeGIEA1qjcGjXu+yI2h7hKA
 jXjFIAVR8SSAtWG8xth7NN2plrCA0BdEM6v//KnqIA/ydnWQGvqFf0ztE
 p0BkU6dr2UcezayYvL8X/rgEdm0W8CI4WKDFCUJbFi5OJifsro0cDeA3k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="424035657"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="424035657"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 01:11:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="761872693"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="761872693"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 01:11:01 -0800
Message-ID: <e953591a-2991-49fc-b104-68f4438cb6e9@linux.intel.com>
Date: Tue, 28 Nov 2023 14:43:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
References: <20231127141125.2913415-1-riana.tauro@intel.com>
 <20231127141125.2913415-6-riana.tauro@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231127141125.2913415-6-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 5/8] RFC drm/xe/uapi: Add configs for Engine
 busyness
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


On 11/27/23 19:41, Riana Tauro wrote:
> GuC provides engine busyness ticks as a 64 bit counter which count
> as clock ticks.
>
> Add configs to the uapi to expose Engine busyness via PMU.
>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 6f38f836b705..be75e6ed317f 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1004,6 +1004,10 @@ struct drm_xe_wait_user_fence {
>   *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>   */
>  
> +enum drm_xe_pmu_engine_sample {
> +	DRM_XE_PMU_SAMPLE_BUSY_TICKS = 0,
> +};
> +
>  /*
>   * Top bits of every counter are GT id.
>   */
> @@ -1012,6 +1016,22 @@ struct drm_xe_wait_user_fence {
>  #define ___DRM_XE_PMU_OTHER(gt, x) \
>  	(((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
>  
> +#define DRM_XE_PMU_SAMPLE_BITS (4)
> +#define DRM_XE_PMU_SAMPLE_INSTANCE_BITS (8)
> +#define DRM_XE_PMU_CLASS_SHIFT \
> +	(DRM_XE_PMU_SAMPLE_BITS + DRM_XE_PMU_SAMPLE_INSTANCE_BITS)
> +
> +/*
> + * Engine configs offset - 0x1000
> + */
> +#define DRM_XE_PMU_ENGINE_OFFSET(gt) \
i think this as well is for internal use only "__"
> +	(___DRM_XE_PMU_OTHER(gt, 0xfff) + 1)
> +
> +#define __DRM_XE_PMU_ENGINE(gt, class, instance, sample) \
> +	(((class) << DRM_XE_PMU_CLASS_SHIFT | \
> +	(instance) << DRM_XE_PMU_SAMPLE_BITS | \
> +	(sample)) + DRM_XE_PMU_ENGINE_OFFSET(gt))
should you have a define which applications can use "__" will not be used by applications
they would benefit with having a helper which they can use to define a config.

eg: in i915 we have I915_PMU_ENGINE_BUSY(class, instance)

> +
>  #define DRM_XE_PMU_RENDER_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 0)
>  #define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 1)
>  #define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 2)
Thanks,
Aravind.
