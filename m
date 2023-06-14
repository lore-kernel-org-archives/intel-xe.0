Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4F5EB64DB
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 14:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8835310E06B;
	Wed, 14 Jun 2023 14:17:40 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA2310E06B
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 14:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686752257; x=1718288257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wcmAj5JPOwS39jux3Ym2lCv95En6X0CKqMlktIVFFI4=;
 b=BeyL5tBL0CXweMbGhqSdcHN4eb5tR3NQkGjBIgPnDPD8g7xSFjdtTvea
 PCB8PJOqbF2q4Pfo6sLFXHAGMKALzHnqd+ccoOrbrND/pQGUEvpD6ATsn
 uUSw/CvEZr/GV62QuOK9kEoXQlOFoqAK6u497zUslydHDdmaBQKH4mMdF
 N0pIyyjuByktr+M/3Oy2v2j9ZMZt++jCpTbzOK0wBfFAJgxnEU2YZcw/X
 NPvIRk+fL0u0yW76gW8G0ag15FtJt2oPB3nk5woaW7sCHuy/thTZZeEu+
 5atx3PsBIqxLQjuk2Vaq1FtvhBs9r6cnhx6oirCSGFl2EdHOTq8HEnvh4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="444991861"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="444991861"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 07:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="801924370"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="801924370"
Received: from jrowe2-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.44.185])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 07:17:34 -0700
Date: Wed, 14 Jun 2023 16:17:32 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Filip Hazubski <filip.hazubski@intel.com>
Message-ID: <ZInL/ORxw8U3sG0i@ashyti-mobl2.lan>
References: <20230602104747.72015-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230602104747.72015-1-zbigniew.kempczynski@intel.com>
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use nanoseconds instead of jiffies
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
Cc: intel-xe@lists.freedesktop.org, Luis Strano <luis.strano@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Filip,

On Fri, Jun 02, 2023 at 12:47:47PM +0200, Zbigniew Kempczyński wrote:
> Using jiffies as a timeout from userspace is weird even it theoretically
> exists possiblity of acquiring jiffies via getconf. Unfortunately this
> method is unreliable and returned value may vary from configured in the
> kernel config.
> 
> Change alters timeout to be expected in nanoseconds returning remaining
> timeout for relative and keeping absolute timeout intact.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>

this is the patch, if you are OK with it, please, feel free to
ack it.

Andi

> ---
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 40 ++++++++++++++++++-------
>  include/uapi/drm/xe_drm.h               |  5 +++-
>  2 files changed, 34 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 6c8a60c60087..4405e694fe21 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -7,6 +7,7 @@
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_utils.h>
>  #include <drm/xe_drm.h>
>  
>  #include "xe_device.h"
> @@ -84,6 +85,24 @@ static int check_hw_engines(struct xe_device *xe,
>  			 DRM_XE_UFENCE_WAIT_VM_ERROR)
>  #define MAX_OP		DRM_XE_UFENCE_WAIT_LTE
>  
> +static unsigned long to_jiffies_timeout(struct drm_xe_wait_user_fence *args)
> +{
> +	unsigned long timeout;
> +
> +	if (args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)
> +		return drm_timeout_abs_to_jiffies(args->timeout);
> +
> +	if (args->timeout < 0)
> +		return MAX_SCHEDULE_TIMEOUT;
> +
> +	if (args->timeout == 0)
> +		return 0;
> +
> +	timeout = nsecs_to_jiffies(args->timeout);
> +
> +	return timeout ?: 1;
> +}
> +
>  int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			     struct drm_file *file)
>  {
> @@ -98,7 +117,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  	int err;
>  	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP ||
>  		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
> -	unsigned long timeout = args->timeout;
> +	unsigned long timeout;
> +	ktime_t start;
>  
>  	if (XE_IOCTL_ERR(xe, args->extensions) || XE_IOCTL_ERR(xe, args->pad) ||
>  	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
> @@ -149,8 +169,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  		addr = vm->async_ops.error_capture.addr;
>  	}
>  
> -	if (XE_IOCTL_ERR(xe, timeout > MAX_SCHEDULE_TIMEOUT))
> -		return -EINVAL;
> +	timeout = to_jiffies_timeout(args);
> +	start = ktime_get();
>  
>  	/*
>  	 * FIXME: Very simple implementation at the moment, single wait queue
> @@ -189,17 +209,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  	} else {
>  		remove_wait_queue(&xe->ufence_wq, &w_wait);
>  	}
> +
> +	if (!(args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)) {
> +		args->timeout -= ktime_to_ns(ktime_sub(ktime_get(), start));
> +		if (args->timeout < 0)
> +			args->timeout = 0;
> +	}
> +
>  	if (XE_IOCTL_ERR(xe, err < 0))
>  		return err;
>  	else if (XE_IOCTL_ERR(xe, !timeout))
>  		return -ETIME;
>  
> -	/*
> -	 * Again very simple, return the time in jiffies that has past, may need
> -	 * a more precision
> -	 */
> -	if (args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)
> -		args->timeout = args->timeout - timeout;
> -
>  	return 0;
>  }
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index d5fc54b5be74..15077f479136 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -752,7 +752,10 @@ struct drm_xe_wait_user_fence {
>  #define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
>  #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
>  	__u64 mask;
> -	/** @timeout: how long to wait before bailing, value in jiffies */
> +	/**
> +	 * @timeout: how long to wait before bailing, value in nanoseconds.
> +	 * For relative contains timeout left. For abstime keeps its intact.
> +	 */
>  	__s64 timeout;
>  	/**
>  	 * @num_engines: number of engine instances to wait on, must be zero
> -- 
> 2.34.1
