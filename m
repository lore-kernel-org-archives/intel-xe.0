Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30395E6FE20
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 12:54:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C219310E663;
	Fri, 22 Sep 2023 12:54:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300BF10E663
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 12:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695387253; x=1726923253;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DcqOCmERsJrhadzD3sb12zKvqpYOkn0hHAqArecqDq0=;
 b=dPUL6BC9QvRHNs/NAB+Y32zz/7YQocxNDGJqPqDBio955bm8rhOOqYNu
 Cl5BFhVFUANf1A3Wt7nupa2LUOnkiLX3LbeJ4ldTiKVVDUAXzzTrCrrpp
 TRBW8iSschOtz8w1GtNGB07H0mWLgZXea6ReG8um8VFZ18eYTNnzjQSqa
 hUR4yf1vDyvqEiac18AXTePM4rNQtYGqoslZzWWLg9CDbNXN74ZIPpj53
 sA+zT6BnFDF3KX4x1O9lDViQo9qM3MCwPJ4J7yOgLcDbWURMoIkbyCfka
 axOlfhhB0crmrFWWgrBVu1N2FdT7qL9FV9ra+axCRqvJUn+zZgqvzqtp0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360200316"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="360200316"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 05:54:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="724161276"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="724161276"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga006.jf.intel.com with SMTP; 22 Sep 2023 05:54:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Sep 2023 15:54:09 +0300
Date: Fri, 22 Sep 2023 15:54:09 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZQ2OcWIPhJZiPzx3@intel.com>
References: <20230921210800.170275-1-rodrigo.vivi@intel.com>
 <ZQ1N3V244SX9l71G@intel.com> <ZQ2EWcV+y46hKkDu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZQ2EWcV+y46hKkDu@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-xe] [CI 1/3] drm/xe: proper setting of irq enabled flag
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
Cc: Ohad Sharabi <osharabi@habana.ai>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 22, 2023 at 08:11:05AM -0400, Rodrigo Vivi wrote:
> On Fri, Sep 22, 2023 at 11:18:37AM +0300, Ville Syrjälä wrote:
> > On Thu, Sep 21, 2023 at 05:07:58PM -0400, Rodrigo Vivi wrote:
> > > From: Dani Liberman <dliberman@habana.ai>
> > >
> > > IRQ enabled flag should be set only after request irq succeeds.
> > >
> > > Reviewed-by: Ohad Sharabi <osharabi@habana.ai>
> > > Signed-off-by: Dani Liberman <dliberman@habana.ai>
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_irq.c | 8 +++-----
> > >  1 file changed, 3 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > > index ccb934f8fa34..f98aa1f06c8f 100644
> > > --- a/drivers/gpu/drm/xe/xe_irq.c
> > > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > > @@ -590,16 +590,14 @@ int xe_irq_install(struct xe_device *xe)
> > >  		return -EINVAL;
> > >  	}
> > >
> > > -	xe->irq.enabled = true;
> > > -
> > >  	xe_irq_reset(xe);
> > >
> > >  	err = request_irq(irq, irq_handler,
> > >  			  IRQF_SHARED, DRIVER_NAME, xe);
> > > -	if (err < 0) {
> > > -		xe->irq.enabled = false;
> > > +	if (err < 0)
> > >  		return err;
> > > -	}
> > > +
> > > +	xe->irq.enabled = true;
> >
> > Why does this even exist?
> 
> I had tried to kill this, but then I noticed it was needed
> for i915-display.
> 
> @drivers/gpu/drm/xe/display/ext/i915_irq.c:
> 
> bool intel_irqs_enabled(struct xe_device *xe)
> {
>  	/*
>          * XXX: i915 has a racy handling of the irq.enabled, since it doesn't
>          * lock its transitions. Because of that, the irq.enabled sometimes
>          * is not read with the irq.lock in place.
>          * However, the most critical cases like vblank and page flips are
>          * properly using the locks.
>          * We cannot take the lock in here or run any kind of assert because
>          * of i915 inconsistency.
>          * But at this point the xe irq is better protected against races,
>          * although the full solution would be protecting the i915 side.
>          */

None of that really makes sense to me. It's a single boolean so locking
is pointless.

Hmm, I guess we are using it for runtime pm to make sure we don't
try to access the device when it's asleep. But that should only
really happen if we would be using a shared legacy interrupt.

And the other user is the power well pipe IER/IMR initialization stuff,
where I suppose we are trying to not unmask/enable the per-pipe
interrupts if interrupts in general are supposed to be off. Though
the higher level interrupts should still be masked off anyway
so not sure that is actually required except to maintain 100% state
in all irq registers.

Everything else just looks like asserts to make sure we haven't
screwed the init/resume/etc. order too badly.

> 	return xe->irq.enabled;
> }
> 
> 
> >
> > >
> > >  	xe_irq_postinstall(xe);
> > >
> > > --
> > > 2.41.0
> >
> > --
> > Ville Syrjälä
> > Intel

-- 
Ville Syrjälä
Intel
