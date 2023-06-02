Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C434C7EE24
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 07:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A3B10E09E;
	Fri,  2 Jun 2023 07:42:10 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C483110E09E
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 07:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685691728; x=1717227728;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0dVk22weAbnHwK/nwGfqGlLVCR1eWLWhTZRE3gw6myc=;
 b=JkE+LcPc56FCqoFHkCtP+Rzr4ZCoAsNOmdLtW8YSxidwwvwYF2VRzeQl
 v537DcoFvIhkEhXSJLqoXi8q7yl7Z+wgFMhSFLPNRfnGsyjpbJk+rv+it
 29KgaGHsoEUTjTftScBpAem02MBTWuYPxHzMIUhleCjq5asdOPpW1I7u9
 ovlNiXLNlg8yRu3mCk6hGSXXCWptSnZNWopDS9+FTzm30N7hBzp5YjwZb
 YVIPq/l0nehIavH7mBh/owy/It5H1yX3g5rVmdkW6zp7JiSyMMQYjrHMU
 yLFmXMdEwyNE5mTZrZntZ8aLi9lL6QqGWviGenZfPbHBhiF1nUeYjZvqn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="340431912"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="340431912"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 00:41:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="710839314"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="710839314"
Received: from dkilanow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.19.53])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 00:41:42 -0700
Date: Fri, 2 Jun 2023 09:41:40 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <20230602074140.kw6e2y355u7gack2@zkempczy-mobl2>
References: <20230531192147.551470-1-zbigniew.kempczynski@intel.com>
 <ZHesqhPYeKp1nbn/@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZHesqhPYeKp1nbn/@ashyti-mobl2.lan>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 31, 2023 at 10:23:06PM +0200, Andi Shyti wrote:
> Hi Zbigniew,
> 
> On Wed, May 31, 2023 at 09:21:47PM +0200, Zbigniew Kempczyński wrote:
> > Using jiffies as a timeout from userspace is weird even it theoretically
> > exists possiblity of acquiring jiffies via getconf. Unfortunately this
> > method is unreliable and returned value may vary from configured in the
> > kernel config.
> > 
> > Change alters timeout to be expected in nanoseconds returning remaining
> > timeout for relative and elapsed for absolute.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_wait_user_fence.c | 39 +++++++++++++++++++------
> >  include/uapi/drm/xe_drm.h               |  5 +++-
> >  2 files changed, 34 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > index 6c8a60c60087..e0db0ba904ec 100644
> > --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > @@ -7,6 +7,7 @@
> >  
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_file.h>
> > +#include <drm/drm_utils.h>
> >  #include <drm/xe_drm.h>
> >  
> >  #include "xe_device.h"
> > @@ -84,6 +85,24 @@ static int check_hw_engines(struct xe_device *xe,
> >  			 DRM_XE_UFENCE_WAIT_VM_ERROR)
> >  #define MAX_OP		DRM_XE_UFENCE_WAIT_LTE
> >  
> > +static unsigned long to_jiffies_timeout(struct drm_xe_wait_user_fence *args)
> > +{
> > +	unsigned long timeout;
> > +
> > +	if (args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)
> > +		return drm_timeout_abs_to_jiffies(args->timeout);
> > +
> > +	if (args->timeout < 0)
> > +		return MAX_SCHEDULE_TIMEOUT;
> 
> are we talking hundreds of years?
> 

Yes, I assume long workloads break by completion or signal.

> > +	if (args->timeout == 0)
> > +		return 0;
> 
> why do you need this? nsec_to_jiffies will return 0 and this
> function would return '0'. Right?
> 

This handles situation when userspace is passing 0 as timeout,
leading to -ETIME immediately. If you'll take a look to below code

> > +
> > +	timeout = nsecs_to_jiffies(args->timeout);
> > +
> > +	return timeout ?: 1;
> > +}

I'm bumping to at least 1 jiffy if user passed too small (like
1 nanosecond) timeout. I mean I don't want to bump to 1 jiffy
if user passes timeout == 0.

> > +
> >  int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
> >  			     struct drm_file *file)
> >  {
> > @@ -98,7 +117,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
> >  	int err;
> >  	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP ||
> >  		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
> > -	unsigned long timeout = args->timeout;
> > +	unsigned long timeout;
> > +	ktime_t start;
> >  
> >  	if (XE_IOCTL_ERR(xe, args->extensions) || XE_IOCTL_ERR(xe, args->pad) ||
> >  	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
> > @@ -149,8 +169,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
> >  		addr = vm->async_ops.error_capture.addr;
> >  	}
> >  
> > -	if (XE_IOCTL_ERR(xe, timeout > MAX_SCHEDULE_TIMEOUT))
> > -		return -EINVAL;
> > +	timeout = to_jiffies_timeout(args);
> > +	start = ktime_get();
> >  
> >  	/*
> >  	 * FIXME: Very simple implementation at the moment, single wait queue
> > @@ -194,12 +214,13 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
> >  	else if (XE_IOCTL_ERR(xe, !timeout))
> >  		return -ETIME;
> >  
> > -	/*
> > -	 * Again very simple, return the time in jiffies that has past, may need
> > -	 * a more precision
> > -	 */
> > -	if (args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)
> > -		args->timeout = args->timeout - timeout;
> > +	if (args->flags & DRM_XE_UFENCE_WAIT_ABSTIME) {
> > +		args->timeout = ktime_sub(ktime_get(), start);
> > +	} else {
> > +		args->timeout -= ktime_to_ns(ktime_sub(ktime_get(), start));
> > +		if (args->timeout < 0)
> > +			args->timeout = 0;
> > +	}
> >  
> >  	return 0;
> >  }
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index d5fc54b5be74..5c81e595c8bb 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -752,7 +752,10 @@ struct drm_xe_wait_user_fence {
> >  #define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
> >  #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
> >  	__u64 mask;
> > -	/** @timeout: how long to wait before bailing, value in jiffies */
> > +	/**
> > +	 * @timeout: how long to wait before bailing, value in nanoseconds.
> > +	 * Returns timeout left for relative or elapsed for absolute.
> 
> It doesn't return anything... maybe "Contains the timeout..." is
> better?

Sure, "contains" sounds better. For relative returning remaining timeout
is natural, but I'm not sure what should I return for absolute - elapsed
or absolute time at which fence was signalled? I'll be glad for an advice.

Thanks for the review.
--
Zbigniew

> 
> Rest looks good.
> 
> Andi
