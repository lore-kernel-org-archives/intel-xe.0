Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02FCC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 13:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9894710E4D0;
	Wed, 31 May 2023 13:30:18 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CBC10E4CA
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 13:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685539815; x=1717075815;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=dCJuJm3vcmKBAijlF4LyHu7YxbFX7EgofQJQgKgQSks=;
 b=RVy+uu/6tpgG0ByRXTnhPRLrRk6/Tl4Z7ak9QPVKzQWsuLN299nMbee/
 ZofqGDLAZI5e5geC686fTO3067D07px7bEpuF0jnsLIagMboQRCsJFDUh
 2SEAiFEY3Hafl44XWZJGXFKM+/ZnbA1zhukd67Orx9cTjYuhyF9YxfA86
 Tq3XJcZpRTMktnlDOJFSpnNjoIAxPL4g8FW8Kj0NqiDpx6hTg69b1F+Qb
 BLI9ZtRkB9/NjLutplry1V036YtGjtPg+WwHY0Ak+OtaoIPPSIacS2pww
 I31goKdF+87snZU/+ksEMN3Cf1auOUIV84lJAfOgq6OvOtCGoekK/It3k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="421003297"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="421003297"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 06:30:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="776769003"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="776769003"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.139])
 ([10.249.254.139])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 06:30:12 -0700
Message-ID: <641e6620-931a-077e-9738-0f64011c9c26@linux.intel.com>
Date: Wed, 31 May 2023 15:30:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230528161415.292448-1-zbigniew.kempczynski@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230528161415.292448-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Use milliseconds instead of
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/28/23 18:14, Zbigniew Kempczyński wrote:
> Using jiffies as a timeout from userspace is weird even it theoretically
> exists possiblity of acquiring jiffies via getconf. Unfortunately this
> method is unreliable and returned value may vary from configured in the
> kernel config.
>
> Due to kernel constraints regarding milliseconds type (unsigned int)
> conversion to jiffies and uapi timeout defined as u64 return an error
> if timeout exceeds unsigned int size.
>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>

I agree we must move away from jiffies. If you want to continue with 
milliseconds but are worried about the truncation to uint,
then you could possibly use nsecs_to_jiffies, I guess.

Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


>
> ---
> v2: Drop msecs_to_jiffies_timeout() helper (Andi)
> ---
>   drivers/gpu/drm/xe/xe_wait_user_fence.c | 6 ++++--
>   include/uapi/drm/xe_drm.h               | 2 +-
>   2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 6c8a60c60087..6473b7b1273d 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -98,7 +98,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>   	int err;
>   	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP ||
>   		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
> -	unsigned long timeout = args->timeout;
> +	unsigned long timeout;
>   
>   	if (XE_IOCTL_ERR(xe, args->extensions) || XE_IOCTL_ERR(xe, args->pad) ||
>   	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
> @@ -149,9 +149,11 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>   		addr = vm->async_ops.error_capture.addr;
>   	}
>   
> -	if (XE_IOCTL_ERR(xe, timeout > MAX_SCHEDULE_TIMEOUT))
> +	if (XE_IOCTL_ERR(xe, args->timeout > UINT_MAX))
>   		return -EINVAL;
>   
> +	timeout = msecs_to_jiffies(args->timeout);
> +
>   	/*
>   	 * FIXME: Very simple implementation at the moment, single wait queue
>   	 * for everything. Could be optimized to have a wait queue for every
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index d5fc54b5be74..f7f43118d156 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -752,7 +752,7 @@ struct drm_xe_wait_user_fence {
>   #define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
>   #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
>   	__u64 mask;
> -	/** @timeout: how long to wait before bailing, value in jiffies */
> +	/** @timeout: how long to wait before bailing, value in milliseconds */
>   	__s64 timeout;
>   	/**
>   	 * @num_engines: number of engine instances to wait on, must be zero
