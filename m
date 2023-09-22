Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA5DE6FE28
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 13:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6505D10E66B;
	Fri, 22 Sep 2023 13:18:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA7410E66B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 13:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695388734; x=1726924734;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LfwVZhc6aK2LOW+u4vW4pi2GMoiS2KjklXFfk5p0gfk=;
 b=Kb63iiX1AQ+lBLljBDtA0PcN0Tg3KxR3R9+obSZDttisiYlUtlvwPHkz
 hueyS75NKUvwz800t9BXI9xXJNpVbu9OoPjyNsZd7luN2ZCI+rG8um01l
 Jyn4so4J5RMUuOQHNbU8PpW+hNZk0RIwGhjq7Hoy5+TJ+85XyyvBJXwCy
 l3BnRBKkD87DHVVqDuTjyMP6GFF57q/0DFPbNFjcRwPCsMa7zDr4fsEag
 wIdtqsLnUTiZUb+92nPgwI7TUoAnlZSFI24yaL6z6QHo8v0M0khXOVUaB
 hvjPQug4pdyh9/GTHhZ6DCM6zWlPv3EBPoN788e9oyL7luE2HkmfWZWc4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="361075731"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="361075731"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 06:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="750835904"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="750835904"
Received: from velangov-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.214.174.70])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 06:18:49 -0700
Date: Fri, 22 Sep 2023 15:18:42 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Message-ID: <ZQ2UMrrVMmSRHovd@ashyti-mobl2.lan>
References: <20230921220500.994558-1-fei.yang@intel.com>
 <20230921220500.994558-2-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921220500.994558-2-fei.yang@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: timeout needs to be a signed
 value
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

Hi Fei,

[...]

> -static unsigned long to_jiffies_timeout(struct drm_xe_wait_user_fence *args)
> +static long to_jiffies_timeout(struct xe_device *xe,
> +			       struct drm_xe_wait_user_fence *args)
>  {
> -	unsigned long timeout;
> +	unsigned long long t;
> +	long timeout;
>  
> -	if (args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)
> -		return drm_timeout_abs_to_jiffies(args->timeout);
> +	/*
> +	 * For negative timeout we want to wait "forever" by setting
> +	 * MAX_SCHEDULE_TIMEOUT. But we have to assign this value also
> +	 * to args->timeout to avoid being zeroed on the signal delivery
> +	 * (see arithmetics after wait).
> +	 */
> +	if (args->timeout < 0) {
> +		args->timeout = MAX_SCHEDULE_TIMEOUT;
> +		return MAX_SCHEDULE_TIMEOUT;
> +	}
>  
> -	if (args->timeout == MAX_SCHEDULE_TIMEOUT || args->timeout == 0)
> -		return args->timeout;
> +	if (args->timeout == 0)
> +		return 0;
>  
> -	timeout = nsecs_to_jiffies(args->timeout);
> +	/*
> +	 * Save the timeout to an u64 variable because nsecs_to_jiffies
> +	 * might return a value that overflows s32 variable.
> +	 */
> +	if (args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)
> +		t = drm_timeout_abs_to_jiffies(args->timeout);
> +	else
> +		t = nsecs_to_jiffies(args->timeout);
> +
> +	/*
> +	 * Anything greater then MAX_SCHEDULE_TIMEOUT is meaningless,
> +	 * also we don't want to cap it at MAX_SCHEDULE_TIMEOUT because
> +	 * apparently user doesn't mean to wait forever, otherwise the
> +	 * args->timeout should have been set to a negative value.
> +	 */
> +	if (t > MAX_SCHEDULE_TIMEOUT)
> +		timeout = MAX_SCHEDULE_TIMEOUT - 1;
> +	else
> +		timeout = t;

you found some boundary case here... thanks!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
