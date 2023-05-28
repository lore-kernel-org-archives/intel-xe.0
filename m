Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B84C7EE29
	for <intel-xe@archiver.kernel.org>; Sun, 28 May 2023 16:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9125C10E0C4;
	Sun, 28 May 2023 16:08:51 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F9810E0C4
 for <intel-xe@lists.freedesktop.org>; Sun, 28 May 2023 16:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685290129; x=1716826129;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gEOvdGd9JtOmVXjEsehqqMTgewGl1ryn/ZfN5tLABm4=;
 b=SfUsOXnpIjmb9fDKP8LZsNKqE/3QLju52X/nNRkk5FPORY1eECZAGfxR
 o3NRLwJx5LCIC6aouh4KQBpCPBQmyZucai6W5lU7BfbMKXfKju0Bu+kp7
 KRoQpZKlz3U3FHhQHEtLSvrlCRCNZNFgm+ZJjZCWpS3PV8qoLbDe5fY4x
 7JK5kNyTqACRihMHzmPSVPaTLJ7tWNnhbxVpb1rcY8UjPJL+BZASCrRRw
 4NCMj7eHVOePC/dOEffZaUU2S8f31ZJO/ThtopEhDNiRPcYFC+KNjaxqD
 1msBoct8hEkhpwLH/AblqupMe0elcsnA5nKJ0Fz+4B1z4QSmmriDdSdLf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="418011812"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; d="scan'208";a="418011812"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2023 09:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="830091029"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; d="scan'208";a="830091029"
Received: from rwalicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.17.92])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2023 09:08:47 -0700
Date: Sun, 28 May 2023 18:08:45 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <20230528160845.7vhvokuwjx46jldw@zkempczy-mobl2>
References: <20230519100126.668533-1-zbigniew.kempczynski@intel.com>
 <ZGdw6jqevLkHhloQ@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZGdw6jqevLkHhloQ@ashyti-mobl2.lan>
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

On Fri, May 19, 2023 at 02:51:54PM +0200, Andi Shyti wrote:
> Hi Zbigniew,
> 
> On Fri, May 19, 2023 at 12:01:26PM +0200, Zbigniew Kempczyński wrote:
> > Using jiffies as a timeout from userspace is weird even it theoretically
> > exists possiblity of acquiring jiffies via getconf. Unfortunately this
> > method is unreliable and returned value may vary from configured in the
> > kernel config.
> > 
> > Due to kernel constraints regarding milliseconds type (unsigned int)
> > conversion to jiffies and uapi timeout defined as u64 return an error
> > if timeout exceeds unsigned int size.
> 
> Thus... this should go on a different patch.
> 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_wait_user_fence.c | 13 +++++++++++--
> >  include/uapi/drm/xe_drm.h               |  2 +-
> >  2 files changed, 12 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > index 15c2e5aa08d2..585681b5fa9a 100644
> > --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > @@ -79,6 +79,13 @@ static int check_hw_engines(struct xe_device *xe,
> >  	return 0;
> >  }
> >  
> > +static unsigned long msecs_to_jiffies_timeout(const unsigned int m)
> > +{
> > +	unsigned long j = msecs_to_jiffies(m);
> > +
> > +	return min_t(unsigned long, MAX_JIFFY_OFFSET, j + 1);
> > +}
> > +
> 
> mmhhh... this is a copy paste from i915 and given that there are
> already two drivers using it, I think this should go in the
> library in jiffies.h.
> 
> Besides, do we really need this? already msecs_to_jiffies().
> performs this check.

Thank you for the review.

Previously I wanted to treat 0 as at least 1 jiffy to avoid
getting -ETIME for the call. But that's the user responsibility
to properly configure required timeout as positive integer so
msecs_to_jiffies_timeout() isn't really needed here. Negative means
neverending sleep so user has wide spectrum of timeout to choose.

Real problem with this patch is uapi change. Normally msecs passed
via ioctl() should be integer (s32) but I would break current umd
which uses s64 right now (too big). I wondered to split to s32 +
s32 (reserved) but I should handle little/big endianess and I'm
not sure such constructs should be introduced.

Anyway I tested this patch without _timeout() and values:
* 0: -ETIME
* positive <= UINT_MAX -> real timeout, works fine
* positive > UINT_MAX -> -EINVAL
* negative -> MAX_JIFFY_OFFSET, unlimited timeout

The best would be change to s32 to avoid third case (-EINVAL)
but this requires umd recompilation.

--
Zbigniew

> 
> Andi
> 
> >  #define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_SOFT_OP | \
> >  			 DRM_XE_UFENCE_WAIT_ABSTIME | \
> >  			 DRM_XE_UFENCE_WAIT_VM_ERROR)
> > @@ -98,7 +105,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
> >  	int err;
> >  	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP ||
> >  		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
> > -	unsigned long timeout = args->timeout;
> > +	unsigned long timeout;
> >  
> >  	if (XE_IOCTL_ERR(xe, args->extensions))
> >  		return -EINVAL;
> > @@ -148,9 +155,11 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
> >  		addr = vm->async_ops.error_capture.addr;
> >  	}
> >  
> > -	if (XE_IOCTL_ERR(xe, timeout > MAX_SCHEDULE_TIMEOUT))
> > +	if (XE_IOCTL_ERR(xe, args->timeout > UINT_MAX)
> >  		return -EINVAL;
> >  
> > +	timeout = msecs_to_jiffies_timeout(args->timeout);
> > +
> >  	/*
> >  	 * FIXME: Very simple implementation at the moment, single wait queue
> >  	 * for everything. Could be optimized to have a wait queue for every
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index b0b80aae3ee8..3e6f679ab534 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -726,7 +726,7 @@ struct drm_xe_wait_user_fence {
> >  #define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
> >  #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
> >  	__u64 mask;
> > -	/** @timeout: how long to wait before bailing, value in jiffies */
> > +	/** @timeout: how long to wait before bailing, value in milliseconds */
> >  	__s64 timeout;
> >  	/**
> >  	 * @num_engines: number of engine instances to wait on, must be zero
> > -- 
> > 2.40.0
