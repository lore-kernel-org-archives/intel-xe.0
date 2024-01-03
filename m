Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C809EC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 06:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE9C10E093;
	Wed,  3 Jan 2024 06:51:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAA510E093
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 06:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704264676; x=1735800676;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GkxoNXAkpDReYtc4KuUz+25+DYqJc5w9oTZsOjVeiEY=;
 b=fOddd5o+B1m/gf+qrmRY84xiCPkTzfBaP/ViNCyN/a4/qGHcV5V8skjg
 A5VE0d+vp1yJ9nYkaQEJhZxaZzxpxuoxZ8pC3IAP5VSlg/t/hEAcbVp4V
 Ueg6hI+2CUa4xsF9l/CuOeno5YyhazpMNyiuJRG/sh7LgzVWu3dj0UQzz
 HExIjSEWEDtinKDHaXzEsztKmL7z1rhBvcjRoV7dCyyOKYs1llDlYJVzY
 kg09998pNt4gHm18crxITZTAo8nheuLBGqnTy+T7GLq0a35mSVMjNiUNm
 /ww3y/a270PrqzNRgosoQfKJAGl7B8NpI1ZWHvEeOskzvcBNmE8pPRSuQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="15613200"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="15613200"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 22:51:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="850346334"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="850346334"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 22:51:12 -0800
Message-ID: <77d10f4c-afeb-415b-9976-588b93dc0298@linux.intel.com>
Date: Wed, 3 Jan 2024 12:24:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] drm/xe/guc: Add PMU counter for total active ticks
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
References: <20231222074602.817518-1-riana.tauro@intel.com>
 <20231222074602.817518-6-riana.tauro@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231222074602.817518-6-riana.tauro@intel.com>
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
> as clock ticks. These counters are maintained in a
> shared memory buffer and internally updated on a continuous basis.
>
> GuC also provides a periodically total active ticks that GT has been
> active for (GuC loaded and running).
> This counter is exposed to the user such that busyness can
> be calculated as a percentage using
>
> busyness % = (engine active ticks/total active ticks) * 100.
>
> This patch provides a pmu counter for total active ticks.
>
> This is listed by perf tool as
>
> sudo ./perf list
> 	  xe_0000_03_00.0/total-active-ticks-gt0/            [Kernel PMU event]
>
> and can be read using
>
> sudo ./perf stat -e xe_0000_03_00.0/total-active-ticks-gt0/ -I 1000
>         time 	    counts  unit 	events
>     1.001332764    58942964    xe_0000_03_00.0/total-active-ticks-gt0/
>     2.011421147	   21191869    xe_0000_03_00.0/total-active-ticks-gt0/
>     3.013223865	   19269012    xe_0000_03_00.0/total-active-ticks-gt0/
>
> v2: change commit message and comment for
>     total active ticks (Umesh, Tvrtko)
>
> Co-developed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c                  | 11 +++
>  drivers/gpu/drm/xe/xe_gt.h                  |  2 +-
>  drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 72 ++++++++++++++++----
>  drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  1 +
>  drivers/gpu/drm/xe/xe_pmu.c                 | 74 +++++++++++++++++++--
>  include/uapi/drm/xe_drm.h                   | 23 ++++++-
>  6 files changed, 162 insertions(+), 21 deletions(-)
>
<snip>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index f8456cda5cda..3134930b0160 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1341,12 +1341,29 @@ struct drm_xe_wait_user_fence {
>  };
>  
>  /**
> - * DOC: XE PMU event config IDs
> + * DOC: XE PMU Event Config ID's
>   *
> - * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed in xe_drm.h
the reason for mentioning xe_drm.h is the defines will not be included in the documentation
> + * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed here
>   * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>   * particular event.
>   *
> + * For example to open the DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0):
> + *
> + * .. code-block:: C
> + *
> + *     struct perf_event_attr attr;
> + *     long long count;
> + *     int cpu = 0;
> + *     int fd;
> + *
> + *     memset(&attr, 0, sizeof(struct perf_event_attr));
> + *     attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_03_00.0/type
> + *     attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
> + *     attr.use_clockid = 1;
> + *     attr.clockid = CLOCK_MONOTONIC;
> + *     attr.config = DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0);
> + *
> + *     fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>   */
>  
>  /**
> @@ -1381,6 +1398,8 @@ enum drm_xe_pmu_engine_sample {
>  	__DRM_XE_PMU_GT_EVENT(gt, __DRM_XE_PMU_ENGINE(class, instance, \
>  						      DRM_XE_PMU_SAMPLE_BUSY_TICKS))
>  
> +#define DRM_XE_PMU_TOTAL_ACTIVE_TICKS(gt)	__DRM_XE_PMU_OTHER(gt, 0)
> +
>  #if defined(__cplusplus)
>  }
>  #endif


Thanks,
Aravind.
