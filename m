Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A85AEEAA49
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 14:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FE510E571;
	Thu, 14 Sep 2023 14:37:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3407C10E571
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694702246; x=1726238246;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QLK417z/Vh+d9Vf4k9oCSqKQglEOd/XTUDt3ePw0cCk=;
 b=iNwpO1RGaBwk/8alPEbRNvYbeQVXD8cx/zjAHDIpWUXiKNAyWNw/k4Eq
 LPFFb8xcQqqImTvbEXSEgKdolELxCSme59KvAtTHb3PBqZU/zoGPzG0KV
 pjMLbV32Yo1z8xfYm8VOMMFnHz642J2N12kUTEzlYBH2BaXC0er8QRNh5
 qhOpeZRKp5NeNsARshT15Cx6I/euYrBq/+a4Id6O8hSx3LAU4W+C6NqFE
 71tpUXOEIHqXM+J8yKhd4jxk1rI5mUit+u9gTW3MdPHesUgofN1lfyjc+
 wTbaNHn9UEUVHRIzjtdu7Oux6xPVh2KzTp6tomTIusnz5I/TuEvuYvJzH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="445408001"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="445408001"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 07:35:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="694297793"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="694297793"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 07:35:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, Lucas
 De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <ZQFq3Xxr/Uu4m312@bvivekan-mobl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230911104134.431670-1-balasubramani.vivekanandan@intel.com>
 <87cyypezsx.fsf@intel.com>
 <eb6q46xjir2vo745evqhy4jzj2jxpkvyipqetrygurhmg3zqcz@k7yott3gcmlj>
 <ZQFq3Xxr/Uu4m312@bvivekan-mobl>
Date: Thu, 14 Sep 2023 17:35:42 +0300
Message-ID: <87y1h8vn41.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v3] drm/xe/display: Print display ip version
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 13 Sep 2023, Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> wrote:
> On 11.09.2023 09:01, Lucas De Marchi wrote:
>> On Mon, Sep 11, 2023 at 02:04:30PM +0300, Jani Nikula wrote:
>> > On Mon, 11 Sep 2023, Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> wrote:
>> > > Print display ip version and flags during module load
>> > > 
>> > > v3:
>> > > Use the existing intel_display_device_info_print() function to print the
>> > > display information. (Jani)
>> > 
>> > So this is an improvement in the sense that xe core doesn't poke at
>> > display data directly to print the info.
>> > 
>> > However, I still think the interface between xe (or i915) core and
>> > display should be minimal. I don't see why we'd need to add a function
>> > at the top level probe to print display stuff... the display code should
>> > do it internally, in some other high level probe call, when it's done.
>> > 
>> > Even having the function adds complexity, because the call site now
>> > needs to be aware about display probe order, and ensure it's all done
>> > before you can safely and accurately print display info. And that's
>> > display code implementation details.
>> > 
>> > Superficially this is all benign, but this stuff adds up. We've been
>> > trying to untangle i915 core and display for a long time, and the i915
>> > probe is still a huge mess, with a bunch of random calls to display at
>> > random times, and there seems to be no end to this. It's all so
>> > intertwined.
>> > 
>> > Perhaps in the future all of the calls need to go through a framework,
>> > maybe aux bus. Do we really want to put all of this to that interface?
>> > 
>> > So the direction should be to reduce and minimize the interfaces between
>> > the high level components, not add more.
>> 
>> Agreed. I think what is missing here is: what would be a good point
>> inside display to call this on. Is it ok in the end of
>> intel_display_driver_probe()? Are we ok with display info now showing
>> up before than the rest for i915 or should we also move
>> i915_welcome_messages() to be before intel_display_driver_probe()?

I think just move the intel_display_device_info_print() call at the end
of intel_display_driver_register(). That's the last thing called in
display inits.

Except, whoa, nobody seems to be calling intel_display_driver_register()
in xe. That needs to be fixed!

We can tweak the order later, I think.


BR,
Jani.



>> 
>> Lucas De Marchi
>
> Hi Jani,
>    can you please provide your opinion to the Lucas' query? I would send
> a new revision based on the conclusion. Thanks.
>
> Regards,
> Bala
>> 
>> > 
>> > 
>> > BR,
>> > Jani.
>> > 
>> > 
>> > > 
>> > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_display.c | 9 +++++++++
>> > >  drivers/gpu/drm/xe/xe_display.h | 4 ++++
>> > >  drivers/gpu/drm/xe/xe_pci.c     | 2 ++
>> > >  3 files changed, 15 insertions(+)
>> > > 
>> > > diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>> > > index a453946ad108..45ffc418e636 100644
>> > > --- a/drivers/gpu/drm/xe/xe_display.c
>> > > +++ b/drivers/gpu/drm/xe/xe_display.c
>> > > @@ -417,6 +417,15 @@ void xe_display_pm_resume(struct xe_device *xe)
>> > >  	intel_power_domains_enable(xe);
>> > >  }
>> > > 
>> > > +void xe_display_info_print(struct xe_device *xe)
>> > > +{
>> > > +	struct drm_printer p = drm_info_printer(xe->drm.dev);
>> > > +
>> > > +	if (xe->info.enable_display)
>> > > +		intel_display_device_info_print(xe->info.display,
>> > > +						&xe->info.display_runtime, &p);
>> > > +}
>> > > +
>> > >  /* Display info initialization */
>> > >  __diag_push();
>> > >  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>> > > diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
>> > > index 9e29de012df7..b18bf5583229 100644
>> > > --- a/drivers/gpu/drm/xe/xe_display.h
>> > > +++ b/drivers/gpu/drm/xe/xe_display.h
>> > > @@ -19,6 +19,8 @@ int xe_display_create(struct xe_device *xe);
>> > > 
>> > >  void xe_display_info_init(struct xe_device *xe);
>> > > 
>> > > +void xe_display_info_print(struct xe_device *xe);
>> > > +
>> > >  int xe_display_init_nommio(struct xe_device *xe);
>> > >  void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
>> > > 
>> > > @@ -57,6 +59,8 @@ xe_display_create(struct xe_device *xe) { return 0; }
>> > > 
>> > >  static inline void xe_display_info_init(struct xe_device *xe) { }
>> > > 
>> > > +static inline void xe_display_info_print(struct xe_device *xe) { }
>> > > +
>> > >  static inline int
>> > >  xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
>> > > 
>> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> > > index 24b16863bf3d..a4886ea8794f 100644
>> > > --- a/drivers/gpu/drm/xe/xe_pci.c
>> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
>> > > @@ -724,6 +724,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>> > >  		xe_step_name(xe->info.step.display),
>> > >  		xe_step_name(xe->info.step.basedie));
>> > > 
>> > > +	xe_display_info_print(xe);
>> > > +
>> > >  	err = xe_device_probe(xe);
>> > >  	if (err)
>> > >  		goto err_pci_disable;
>> > 
>> > -- 
>> > Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel
