Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B550DCF3968
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 10:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9C810E06E;
	Fri, 20 Sep 2024 10:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPFKKY8s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB95A10E06E
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 10:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726827551; x=1758363551;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=i9TD0zzyyOWmJ3Hil9pbuqPJ09DwgEfSxhW7ZieC+gk=;
 b=dPFKKY8s2jt9qUL4H2zO+KtU7nGkZv8AsYdPJXKhEPSABI2sZ6B/csgZ
 EA2BOaRdgebxXZ5t0nK3DmXh5nMoD4xAtFsw2nwV4D3JWt6B3cURkPzh6
 j1+hEXQRjWFJgkkcpVGD9ZX9z3cPiGq2r/I1yoQl7t6fswUJJsi4T9n5l
 kPnS3j+UCU3FpgB0Y0z3kjvC+hB+v1ztAgHEYs+wVLnFB66S/5PMz4MIr
 L3Zz0OlgiaSDRrA4YkG56vmobC8bYH/rUWDkd1LuWpRMIWT+dSoaUZPzL
 b/raq8OghdV0cK76Jft2v8X7Z2OEStZEnKF6Cpip55q0MqabAEm27XAXS g==;
X-CSE-ConnectionGUID: /Lr2J+BaSJCh2Yx1Qmyiuw==
X-CSE-MsgGUID: CKCWBcNjRSOH5pYnU0icRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29614243"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="29614243"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 03:19:09 -0700
X-CSE-ConnectionGUID: 0eWyVlIpQgGlXIBCBf53Cg==
X-CSE-MsgGUID: homI3GA7Rkmqz8mAYskdaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70381823"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 20 Sep 2024 03:19:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 20 Sep 2024 13:19:06 +0300
Date: Fri, 20 Sep 2024 13:19:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, rafael@kernel.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Restore pci state upon resume
Message-ID: <Zu1MGo3YAaSeml7l@intel.com>
References: <20240912190530.435976-1-rodrigo.vivi@intel.com>
 <ZuQbnRfh-wkuMR83@intel.com> <ZuRduLqXs4za8_PN@intel.com>
 <ZuRuSgnnjGSr8xI_@intel.com> <ZunPQeJb2zoVbNSN@intel.com>
 <ZunwFEelVu441Mtg@intel.com> <ZuyhW3fymwZhoKaz@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuyhW3fymwZhoKaz@intel.com>
X-Patchwork-Hint: comment
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

On Thu, Sep 19, 2024 at 06:10:35PM -0400, Rodrigo Vivi wrote:
> On Wed, Sep 18, 2024 at 12:09:40AM +0300, Ville Syrjälä wrote:
> > On Tue, Sep 17, 2024 at 02:49:37PM -0400, Rodrigo Vivi wrote:
> > > On Fri, Sep 13, 2024 at 07:54:34PM +0300, Ville Syrjälä wrote:
> > > > On Fri, Sep 13, 2024 at 11:43:52AM -0400, Rodrigo Vivi wrote:
> > > > > On Fri, Sep 13, 2024 at 02:01:49PM +0300, Ville Syrjälä wrote:
> > > > > > On Thu, Sep 12, 2024 at 03:05:30PM -0400, Rodrigo Vivi wrote:
> > > > > > > The pci state was saved, but not restored. Restore
> > > > > > > right after the power state transition request like
> > > > > > > every other driver.
> > > > > > > 
> > > > > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/xe/xe_pci.c | 2 ++
> > > > > > >  1 file changed, 2 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > > > > index 5ba4ec229494..6d29ef4b396f 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > > > > @@ -949,6 +949,8 @@ static int xe_pci_resume(struct device *dev)
> > > > > > >  	if (err)
> > > > > > >  		return err;
> > > > > > >  
> > > > > > > +	pci_restore_state(pdev);
> > > > > > 
> > > > > > Why is xe even doing this stuff by hand instead of letting
> > > > > > the pci core handle it?
> > > > > 
> > > > > That's a fair question, given that there's not much documentation
> > > > > around it.
> > > > > 
> > > > > Looking the pci code, it looks that the pci core is not calling itself
> > > > > for the restoration of the config space anywhere and looking to
> > > > > other drivers around it looks like a safe thing to do.
> > > > > 
> > > > > And the pci_restore_state is paired with the pci_save_state.
> > > > > Both i915 and Xe are doing the pci_save_state and not restoring
> > > > > it.
> > > > 
> > > > i915 needs it because (as a side effect) it prevents the pci
> > > > code from automagically sticking the device into D3, which
> > > > apparently breaks hibernation on some old crappy laptops.
> > > > But xe shouldn't need that.
> > > 
> > > Hmm, doing some archaeology here, it looks like the
> > > both pci_save and pci_restore were added together on
> > > regular system suspend-resume by Jesse from the very
> > > beginning:
> > > 
> > > ba8bbcf6ff46 ("i915: add suspend/resume support")
> > 
> > Pretty sure it was initially just cargo culted. Or perhaps 
> > the pci code didn't do stuff back then. Shrug.
> > 
> > > Then, later pci_restore was removed by Zhenyu on
> > > b7e53aba2f0e ("drm/i915: remove restore in resume")
> > > because it was hanging some platforms.
> > > 
> > > The only reference to d3 related issues that I could find
> > > was this one:
> > > https://lore.kernel.org/intel-gfx/1497281047-25204-5-git-send-email-animesh.manna@intel.com/
> > > 
> > > but that was trying to add the support to the the save/restore
> > > in the runtime pm side and not here in the regular system suspend/resume.
> > > 
> > > Am I missing anything?
> > 
> > commit ab3be73fa7b4 ("drm/i915: gen4: work around hang during
> > hibernation")
> 
> but this is about the pci_set_power_state not the pci_save_state
> or pci_restore_state.

This is the side effect of pci_save_state() I mentioned.
It prevents the pci code from doing the pci_set_power_state(D3).

> 
> For the set_power we are pairing them together.
> My concern is that for the save restore we are not.
> So we either remove the save or we add the restore.

The pci code always does set_power_state(D0)+restore
on resume.

> 
> Pending more to remove it after Anshuman showed the log.
> 
> > 
> > > Empirically Anshuman showed us that PCI subsystem is indeed taking
> > > care of the save/restore.
> > > 
> > > Ville, my question to you now is: can I go ahead and simply remove
> > > the pci_save_state() call from i915? Or you still believe some
> > > hibernation somewhere could be broken?
> > 
> > Unless someone can figure out a way to fix those cursed 
> > BIOSes (or they magically fixed themselves in the meantime)
> > it needs to stay.
> > 
> > > I believe we should either remove both save and restore for both
> > > drivers or add both to both.
> > 
> > I think we should try to get as close to the standard 
> > driver/pci behaviour as possible. AFAICS that would be
> > achieved by moving pci_save_state()+pci_set_power() 
> > (and nothing else) into the .suspend_noirq() and 
> > .poweroff_noirq() hooks. And then xe wouldn't even
> > need to hook those up.
> 
> yeap, but our state machinery was never good with that.
> 
> > 
> > But that does require some actual thougha as it would
> > change our current behaviour to not go to D3 in
> > .freeze_late() (the pci code won't put the device into
> > D3 in .freeze_noirq() either). I suppose this would
> > also let us nuke the pci_set_power_state(D0) from
> > i915_drm_resume_early()...
> > 
> > And the switcheroo stuff would presumably need some
> > changes. Just calling the noirq() stuff from the
> > switcheroo suspend hook should hopefully suffice.
> > Hmm, and I guess we'd need the pci_set_power_state(D0)
> > for it stll in the resume path.
> > 
> > Another thing I realized is that we never restore the
> > config space in the switcheroo resume path. I suppose
> > for our integrated GPUs it doesn't get clobbered in
> > D3 anyway so shouldn't really matter. So we could
> > technically also skip the pci_save_state() in the
> > switcheroo suspend path.
> 
> yeap, not only in the switcheroo, but we are saving
> but never restoring...
> 
> I have this patch that remove the save in some refactor that I'm planning:
> https://github.com/rodrigovivi/linux/tree/display-pm-reconcile
> 
> > 
> > We could also consider quirking the hibernate vs. 
> > D3 stuff in drivers/pci. Would just need a new flag
> > on the pci_dev to skip the pci_set_power_state(),
> > or something.
> > 
> > -- 
> > Ville Syrjälä
> > Intel

-- 
Ville Syrjälä
Intel
