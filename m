Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D44C61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 08:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7F210E7AB;
	Fri, 24 Nov 2023 08:37:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8BB10E7AB
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 08:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700815053; x=1732351053;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BGC5DOjx9kCgtRw8hBuErsYyxA2p16OI0QX7e60myl8=;
 b=BnRfsbHAafLVhhM82Bse3PCz96en1G3J/ni2wIJRuDU71I0p6HoufrlF
 bATy7UWqjCz7YKQxCxsY49ahc7aTZcbCJUZFtAsF3Fh1oC01bMCwFx7Cu
 1maeOM1WqbyHHXj7zjj85qCQ/3lX7SK6b8AqtaJudKMAdKbJ6FYQSzym/
 rMM6xE4PCYuFc3/T9m7zuJuAGhQ8O9DB5HRQ0rG721rp0RKFl7TLu7X+0
 wdwPBv46h8K0H4GAVZL5GIVV/UElFTEF01AYVAezCF06am1K7Vnb+M9OA
 JHnveiqHfRoYsyEL/78IoZRJvXg515jr49FwiWB67Qph8zVRRzkzPSE1V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="456727788"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="456727788"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 00:37:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="760898773"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="760898773"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 24 Nov 2023 00:37:30 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 24 Nov 2023 10:37:29 +0200
Date: Fri, 24 Nov 2023 10:37:29 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Message-ID: <ZWBgySP7nSmGbfAd@intel.com>
References: <20231124064408.1800646-1-aravind.iddamsetty@linux.intel.com>
 <ZWBOc5WgvgDLUBqG@intel.com>
 <2b803ed4-80f9-49da-b528-9c2938bda7ad@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b803ed4-80f9-49da-b528-9c2938bda7ad@linux.intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix lockdep warning in xe_force_wake
 calls
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

On Fri, Nov 24, 2023 at 02:01:27PM +0530, Aravind Iddamsetty wrote:
> 
> On 11/24/23 12:49, Ville Syrjälä wrote:
> > On Fri, Nov 24, 2023 at 12:14:08PM +0530, Aravind Iddamsetty wrote:
> >> Introduce atomic version for xe_force_wake calls which uses spin_lock
> >> while the non atomic version uses spin_lock_irq
> >>
> >> Fix for below:
> >> [13994.811263] ========================================================
> >> [13994.811295] WARNING: possible irq lock inversion dependency detected
> >> [13994.811326] 6.6.0-rc3-xe #2 Tainted: G     U
> >> [13994.811358] --------------------------------------------------------
> >> [13994.811388] swapper/0/0 just changed the state of lock:
> >> [13994.811416] ffff895c7e044db8 (&cpuctx_lock){-...}-{2:2}, at:
> >> __perf_event_read+0xb7/0x3a0
> >> [13994.811494] but this lock took another, HARDIRQ-unsafe lock in the
> >> past:
> >> [13994.811528]  (&fw->lock){+.+.}-{2:2}
> >> [13994.811544]
> >>
> >>                and interrupts could create inverse lock ordering between
> >> them.
> >>
> >> [13994.811606]
> >>                other info that might help us debug this:
> >> [13994.811636]  Possible interrupt unsafe locking scenario:
> >>
> >> [13994.811667]        CPU0                    CPU1
> >> [13994.811691]        ----                    ----
> >> [13994.811715]   lock(&fw->lock);
> >> [13994.811744]                                local_irq_disable();
> >> [13994.811773]                                lock(&cpuctx_lock);
> >> [13994.811810]                                lock(&fw->lock);
> >> [13994.811846]   <Interrupt>
> >> [13994.811865]     lock(&cpuctx_lock);
> >> [13994.811895]
> >>                 *** DEADLOCK ***
> >>
> >> v2: Use spin_lock in atomic context and spin_lock_irq in a non atomic
> >> context (Matthew Brost)
> > No idea what this "atomic context" means, but looks like
> > you just want to use spin_lock_irqsave() & co.
> atomic context: where sleeping is not allowed.

That has nothing to do with your lockdep spew. Also spinlocks don't
sleep by definition (if we ignore the RT spinlock->mutex magic).

> Well that is what I had in
> v1 and Matt suggested we should explicitly know from where we are calling
> force wake and depending on it use spin_lock or spin_lock_irq versions.

Duplicating tons of code for that is silly. I seriously doubt someone
benchmarked this and saw a meaningful improvement from skipping the
save/restore.

> >
> >> Cc: Matthew Brost <matthew.brost@intel.com>
> >> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> >> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> >> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_force_wake.c | 62 +++++++++++++++++++++++++++++-
> >>  drivers/gpu/drm/xe/xe_force_wake.h |  4 ++
> >>  drivers/gpu/drm/xe/xe_pmu.c        |  4 +-
> >>  3 files changed, 66 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> >> index 32d6c4dd2807..1693097f72d3 100644
> >> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> >> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> >> @@ -147,7 +147,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
> >>  	enum xe_force_wake_domains tmp, woken = 0;
> >>  	int ret, ret2 = 0;
> >>  
> >> -	spin_lock(&fw->lock);
> >> +	spin_lock_irq(&fw->lock);
> >>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> >>  		if (!domain->ref++) {
> >>  			woken |= BIT(domain->id);
> >> @@ -162,7 +162,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
> >>  				   domain->id, ret);
> >>  	}
> >>  	fw->awake_domains |= woken;
> >> -	spin_unlock(&fw->lock);
> >> +	spin_unlock_irq(&fw->lock);
> >>  
> >>  	return ret2;
> >>  }
> >> @@ -176,6 +176,64 @@ int xe_force_wake_put(struct xe_force_wake *fw,
> >>  	enum xe_force_wake_domains tmp, sleep = 0;
> >>  	int ret, ret2 = 0;
> >>  
> >> +	spin_lock_irq(&fw->lock);
> >> +	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> >> +		if (!--domain->ref) {
> >> +			sleep |= BIT(domain->id);
> >> +			domain_sleep(gt, domain);
> >> +		}
> >> +	}
> >> +	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
> >> +		ret = domain_sleep_wait(gt, domain);
> > Why on earth are we waiting here?
> >
> > Why is this all this stuff called "sleep something"?
> to my knowledge the HW can take sometime to ack the forcewake request

We are *releasing* the forcewake here, not acquiring it.

> that is why we have a wait, regarding the naming it was existing from before
> may be Matt can answer that.
> 
> 
> Thanks,
> Aravind.
> >

-- 
Ville Syrjälä
Intel
