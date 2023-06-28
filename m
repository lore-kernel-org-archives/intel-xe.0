Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAECEB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 17:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0EC10E0BA;
	Wed, 28 Jun 2023 17:49:50 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1321C10E0BA
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 17:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687974588; x=1719510588;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+iuoSrDzCcMP/mHzJF/u8bDQb+iBI6GCU2NCIvA2AlQ=;
 b=ifYSClzb5Plet5jw9E5B/irktqs+/14h7xRhvivo52Z743Qyhp0bJZon
 XqMk0maewNOFu5G7ePyhaz+zSHhgd4v3hIqgsI0bl3QySkmZDLgL4DjYA
 l5M+y4IvuEQAzrP7QeBGSaj2eFwMxRBVjx0Oa1gqxVJejDK4d396yxpH9
 kkxPoRkOZThmW2Hg7au6JBMTJfMGVXcKL6EYqRoenI3FGasvRpsTnDYMg
 E8Hu39sqMBpOx5USZRN7Va7Q60Y6RgbF8PqwnB7VIOlS5h45/bvdQT1t4
 mQOcGIUDnsSUNwf++jiLLg5WakXDEiKFARtkx+l3GjmEiITQgLNHnS6Xq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="365377488"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="365377488"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 10:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="891125378"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="891125378"
Received: from atkalcec-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.40.132])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 10:49:44 -0700
Date: Wed, 28 Jun 2023 19:49:40 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <ZJxytPdtglZO1upB@ashyti-mobl2.lan>
References: <20230628055141.398036-1-zbigniew.kempczynski@intel.com>
 <20230628055141.398036-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628055141.398036-2-zbigniew.kempczynski@intel.com>
Subject: Re: [Intel-xe] [PATCH v7 1/1] drm/xe: Use nanoseconds instead of
 jiffies in uapi for user fence
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

[...]

> +static unsigned long to_jiffies_timeout(struct drm_xe_wait_user_fence *args)
> +{
> +	unsigned long timeout;
> +
> +	if (args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)
> +		return drm_timeout_abs_to_jiffies(args->timeout);
> +
> +	if (args->timeout == MAX_SCHEDULE_TIMEOUT || args->timeout == 0)
> +		return args->timeout;
> +
> +	timeout = nsecs_to_jiffies(args->timeout);
> +
> +	return timeout ?: 1;
> +}
> +
>  int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			     struct drm_file *file)
>  {
> @@ -98,7 +114,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  	int err;
>  	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP ||
>  		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
> -	unsigned long timeout = args->timeout;
> +	unsigned long timeout;
> +	ktime_t start;
>  
>  	if (XE_IOCTL_ERR(xe, args->extensions) || XE_IOCTL_ERR(xe, args->pad) ||
>  	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
> @@ -149,8 +166,18 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  		addr = vm->async_ops.error_capture.addr;
>  	}
>  
> -	if (XE_IOCTL_ERR(xe, timeout > MAX_SCHEDULE_TIMEOUT))
> -		return -EINVAL;
> +	/*
> +	 * For negative timeout we want to wait "forever" by setting
> +	 * MAX_SCHEDULE_TIMEOUT. But we have to assign this value also
> +	 * to args->timeout to avoid being zeroed on the signal delivery
> +	 * (see arithmetics after wait).
> +	 */
> +	if (args->timeout < 0)
> +		args->timeout = MAX_SCHEDULE_TIMEOUT;
> +
> +	timeout = to_jiffies_timeout(args);
> +
> +	start = ktime_get();
>  
>  	/*
>  	 * FIXME: Very simple implementation at the moment, single wait queue
> @@ -189,17 +216,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  	} else {
>  		remove_wait_queue(&xe->ufence_wq, &w_wait);
>  	}
> +
> +	if (!(args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)) {
> +		args->timeout -= ktime_to_ns(ktime_sub(ktime_get(), start));
> +		if (args->timeout < 0)
> +			args->timeout = 0;

OK... good catch!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
