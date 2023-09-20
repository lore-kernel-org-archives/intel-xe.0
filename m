Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFA7CE79B1
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 08:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A6210E168;
	Wed, 20 Sep 2023 08:19:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF20110E168;
 Wed, 20 Sep 2023 08:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695197952; x=1726733952;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XLy7iuSbiSxihny8sE0aKo+IQrpc9lw++/OAhqlaiAI=;
 b=UViHG9xtG3mbyE0wcmPfE+XjNpD8XfpzXwLwLbQgqig8mIE6dhdSrk4Z
 Hk/0nczHut4dJVOsqiUNEvFKgM/kqukNzd4OS1CdeJAQrGzRDf4fMmxvL
 ZI6RvXCJko+hYp0iBIVtqsv2OMgvCK8ldR/iSWUypeHfOnGDtK1broZ8d
 Ccp5VHt9h0U5xVWYb2mTg2R557NqJ9tUc0mMq5mpKay6IEEkvcwJ3FSs/
 dNvI+KM2X0db2XrrB+LR1pA6beIn+/DTJW4ggkr7dSwCiQNN78MLHFqOs
 c6XGKrHTTke1RL5whVvi6FQvpxAhbtLOn8WcMV6QD4D6RcOLZWPE2UWW1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="380064645"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="380064645"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 01:19:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="836758103"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="836758103"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.80])
 ([10.145.162.80])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 01:19:10 -0700
Message-ID: <50978871-5bf8-aa65-d6a9-c4dcd20e3a03@linux.intel.com>
Date: Wed, 20 Sep 2023 13:58:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
 <20230919142000.91363-2-rodrigo.vivi@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230919142000.91363-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH i-g-t 01/16] drm-uapi/xe_drm: Align with new
 PMU interface
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 19/09/23 19:49, Rodrigo Vivi wrote:

Hi Rodrigo,

can  you please pick the latest header xe_drm.h I did a small fix for comment.

Thanks,
Aravind.
> Align with commit ("drm/xe/pmu: Enable PMU interface")
>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 804c02270..6aaa8517c 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -1053,6 +1053,44 @@ struct drm_xe_vm_madvise {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * XE PMU event config IDs
> + *
> + * Check 'man perf_event_open' to use these ID's in 'struct perf_event_attr'
> + * as part of perf_event_open syscall to read a particular event.
> + *
> + * For example to open the XE_PMU_INTERRUPTS(0):
> + *
> + * .. code-block:: C
> + *	struct perf_event_attr attr;
> + *	long long count;
> + *	int cpu = 0;
> + *	int fd;
> + *
> + *	memset(&attr, 0, sizeof(struct perf_event_attr));
> + *	attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
> + *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
> + *	attr.use_clockid = 1;
> + *	attr.clockid = CLOCK_MONOTONIC;
> + *	attr.config = XE_PMU_INTERRUPTS(0);
> + *
> + *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
> + */
> +
> +/*
> + * Top bits of every counter are GT id.
> + */
> +#define __XE_PMU_GT_SHIFT (56)
> +
> +#define ___XE_PMU_OTHER(gt, x) \
> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
> +
> +#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
> +#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
> +#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
