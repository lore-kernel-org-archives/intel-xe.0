Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79DDC77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 12:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606CD10E075;
	Fri, 19 May 2023 12:52:03 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEFA10E075
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 12:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684500721; x=1716036721;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5fWqmzVGUdJWHMXQxav+X4y2E5UCPS7R0PHRREuJfpQ=;
 b=dtYlevkmmRksTOMVVfwxzy6N10OLYnOI2jkS2UtrgfGFe5DK8+hct8qe
 9dEfWrefNKRqvl+laIB4whkcW7BMusqRsraOIeKhjtv/sMZ8ILS8fM9Lt
 YnJvYuUe7Mg4bryxoE5Ry3ejloYA9VpeIcqdNkgmqgeubVnBTAh6CmK+e
 lGqRRUQc3LNOunBwX34FQ8k7esYCe/s7vhxvcBP9kX+y0AgD1uAxEy+fb
 RKcLkmwe/9+M8U0V42l5KNwtsrEoa1NSXZUD5fsgtcgzma7zWvPp0T7nE
 CIiqWqAcFCm5xxMOvfi5e9A/13LaJtPc/RIdrsunb3j1eKD3hGWzWLU2o w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="418055726"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="418055726"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 05:52:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="696697287"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="696697287"
Received: from refaase-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.221.245])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 05:51:58 -0700
Date: Fri, 19 May 2023 14:51:54 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <ZGdw6jqevLkHhloQ@ashyti-mobl2.lan>
References: <20230519100126.668533-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230519100126.668533-1-zbigniew.kempczynski@intel.com>
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use milliseconds instead of jiffies
 in uapi for user fence
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Zbigniew,

On Fri, May 19, 2023 at 12:01:26PM +0200, Zbigniew Kempczyński wrote:
> Using jiffies as a timeout from userspace is weird even it theoretically
> exists possiblity of acquiring jiffies via getconf. Unfortunately this
> method is unreliable and returned value may vary from configured in the
> kernel config.
> 
> Due to kernel constraints regarding milliseconds type (unsigned int)
> conversion to jiffies and uapi timeout defined as u64 return an error
> if timeout exceeds unsigned int size.

Thus... this should go on a different patch.

> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 13 +++++++++++--
>  include/uapi/drm/xe_drm.h               |  2 +-
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 15c2e5aa08d2..585681b5fa9a 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -79,6 +79,13 @@ static int check_hw_engines(struct xe_device *xe,
>  	return 0;
>  }
>  
> +static unsigned long msecs_to_jiffies_timeout(const unsigned int m)
> +{
> +	unsigned long j = msecs_to_jiffies(m);
> +
> +	return min_t(unsigned long, MAX_JIFFY_OFFSET, j + 1);
> +}
> +

mmhhh... this is a copy paste from i915 and given that there are
already two drivers using it, I think this should go in the
library in jiffies.h.

Besides, do we really need this? already msecs_to_jiffies().
performs this check.

Andi

>  #define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_SOFT_OP | \
>  			 DRM_XE_UFENCE_WAIT_ABSTIME | \
>  			 DRM_XE_UFENCE_WAIT_VM_ERROR)
> @@ -98,7 +105,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  	int err;
>  	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP ||
>  		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
> -	unsigned long timeout = args->timeout;
> +	unsigned long timeout;
>  
>  	if (XE_IOCTL_ERR(xe, args->extensions))
>  		return -EINVAL;
> @@ -148,9 +155,11 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  		addr = vm->async_ops.error_capture.addr;
>  	}
>  
> -	if (XE_IOCTL_ERR(xe, timeout > MAX_SCHEDULE_TIMEOUT))
> +	if (XE_IOCTL_ERR(xe, args->timeout > UINT_MAX)
>  		return -EINVAL;
>  
> +	timeout = msecs_to_jiffies_timeout(args->timeout);
> +
>  	/*
>  	 * FIXME: Very simple implementation at the moment, single wait queue
>  	 * for everything. Could be optimized to have a wait queue for every
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b0b80aae3ee8..3e6f679ab534 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -726,7 +726,7 @@ struct drm_xe_wait_user_fence {
>  #define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
>  #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
>  	__u64 mask;
> -	/** @timeout: how long to wait before bailing, value in jiffies */
> +	/** @timeout: how long to wait before bailing, value in milliseconds */
>  	__s64 timeout;
>  	/**
>  	 * @num_engines: number of engine instances to wait on, must be zero
> -- 
> 2.40.0
