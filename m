Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FE6C77B73
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 19:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6153310E214;
	Mon, 22 May 2023 19:06:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D373010E1FD
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 18:34:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CDAD11FB;
 Mon, 22 May 2023 11:35:04 -0700 (PDT)
Received: from bogus (unknown [10.57.96.86])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 787273F67D;
 Mon, 22 May 2023 11:34:17 -0700 (PDT)
Date: Mon, 22 May 2023 19:34:15 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Message-ID: <20230522183415.hgdkf43edwo4pw2p@bogus>
References: <20230518085259.4083944-1-anshuman.gupta@intel.com>
 <ZGZcO/R7yYtIQjOj@rdvivi-mobl4>
 <CY5PR11MB62114CA59A4467B41F30FB4E957C9@CY5PR11MB6211.namprd11.prod.outlook.com>
 <CY5PR11MB62114870D153E9E36BB3035A95439@CY5PR11MB6211.namprd11.prod.outlook.com>
 <ZGuudwBWedkHHYln@rdvivi-mobl4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGuudwBWedkHHYln@rdvivi-mobl4>
X-Mailman-Approved-At: Mon, 22 May 2023 19:06:51 +0000
Subject: Re: [Intel-xe] [PATCH v3] drm/xe/pm: Disable PM on unbounded pcie
 parent bridge
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
Cc: Sudeep Holla <sudeep.holla@arm.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 02:03:35PM -0400, Rodrigo Vivi wrote:
> On Mon, May 22, 2023 at 12:28:20PM -0400, Gupta, Anshuman wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Gupta, Anshuman
> > > Sent: Friday, May 19, 2023 10:28 AM
> > > To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> > > Cc: intel-xe@lists.freedesktop.org; Nikula, Jani <jani.nikula@intel.com>; Vivi,
> > > Rodrigo <rodrigo.vivi@intel.com>
> > > Subject: RE: [Intel-xe] [PATCH v3] drm/xe/pm: Disable PM on unbounded
> > > pcie parent bridge
> > > 
> > > 
> > > 
> > > > -----Original Message-----
> > > > From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> > > > Sent: Thursday, May 18, 2023 10:41 PM
> > > > To: Gupta, Anshuman <anshuman.gupta@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org; Nikula, Jani
> > > > <jani.nikula@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > Subject: Re: [Intel-xe] [PATCH v3] drm/xe/pm: Disable PM on unbounded
> > > > pcie parent bridge
> > > >
> > > > On Thu, May 18, 2023 at 02:22:59PM +0530, Anshuman Gupta wrote:
> > > > > Intel Discrete GFX cards gfx may have multiple PCIe endpoints, they
> > > > > connects to root port via pcie upstream switch port(USP) and virtual
> > > > > pcie switch port(VSP), sometimes VSP pcie devices doesn't bind to
> > > > > pcieport driver. Without pcieport driver, pcie PM comes without any
> > > > > warranty and with unbounded VSP gfx card won't transition to low
> > > > > power pcie device and link state therefore assert dev_warn on
> > > > > unbounded VSP and disable xe driver PM support.
> > > > >
> > > > > v2:
> > > > > - Disable Xe PCI PM support. [Rodrigo]
> > > > > v3:
> > > > > - Changed subject and Rebase.
> > > > >
> > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_pci.c | 16 ++++++++++++++++
> > > > >  1 file changed, 16 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > > > > b/drivers/gpu/drm/xe/xe_pci.c index e789a50a1310..e09d76b7755a
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > > @@ -603,6 +603,19 @@ static void xe_pci_remove(struct pci_dev *pdev)
> > > > >  	pci_set_drvdata(pdev, NULL);
> > > > >  }
> > > > >
> > > >
> > /snip
> > > > Probably the safest place to call this is at xe_register_pci_driver
> > > > right before registering it, no?!
> > > > possible?
> > Hi Rodrigo ,
> > For safety purpose  how about to use device_set_pm_not_required()
> > I had already tested it locally, above helper removed device PM support.
> 
> There are not many device drivers using that directly and no conditional
> usage.
>

While I agree that it was not used by much drivers when it was initially
introduced by me, grepping it for now listed quite a few drivers like
cxl and nvdimm. So if disabling PM is right thing to do(which I have no
idea), using this helper is much cleaner than the approach in the original
patch as in [1].

> However I liked that very much and when taking a look to the commit that added
> that, I don't see any blocker on why not use it to remove the PM support
> on this case that we cannot support with our discrete devices.
> 
> 85945c28b5a8 ("PM / core: Add support to skip power management in device/driver model")
> 
> So I CC'ed here Sudeep and Rafael so they can raise any concerns they
> might have.
>

None from me.

> FYI, the initial patch with the reasoning on why we need to disable PM:
>

I don't have much domain knowledge to acknowledge that it is the right
thing, but the approach using helper seems right one for me.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20230518085259.4083944-1-anshuman.gupta@intel.com
