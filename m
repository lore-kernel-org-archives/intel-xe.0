Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82627C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 17:26:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5855310E3BC;
	Tue,  9 May 2023 17:26:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818A110E3BC
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 17:26:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C005161616;
 Tue,  9 May 2023 17:26:21 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 2A082C433EF;
 Tue,  9 May 2023 17:26:19 +0000 (UTC)
Date: Tue, 9 May 2023 13:26:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Message-ID: <ZFqCOT4dPFUmTPSZ@rdvivi-mobl4>
References: <20230508091734.1938204-1-anshuman.gupta@intel.com>
 <ZFkt+7SAlhL/T5gt@intel.com>
 <CY5PR11MB621101BF5C5C5B3F769B530595769@CY5PR11MB6211.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB621101BF5C5C5B3F769B530595769@CY5PR11MB6211.namprd11.prod.outlook.com>
Subject: Re: [Intel-xe] [PATCH] drm/xe/pm: WARN_ON() on unbounded pcie
 parent bridge device
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 03:20:25AM +0000, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Monday, May 8, 2023 10:45 PM
> > To: Gupta, Anshuman <anshuman.gupta@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [Intel-xe] [PATCH] drm/xe/pm: WARN_ON() on unbounded pcie
> > parent bridge device
> > 
> > On Mon, May 08, 2023 at 02:47:34PM +0530, Anshuman Gupta wrote:
> > > Intel Discrete GFX cards gfx may have multiple PCIe endpoints, they
> > > connects to root port via pcie upstream switch port(USP) and virtual
> > > pcie switch port(VSP), sometimes VSP pcie devices doesn't bind to
> > > pcieport driver. Without pcieport driver pcie PM comes without any
> > > warranty and with unbounded VSP gfx card won't transition to low power
> > > pcie device and link state therefore assert drm_WARN_ON() on
> > unbounded
> > > VSP.
> > >
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pci.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 19ead642442e..dc0d5cb4950b 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -667,12 +667,24 @@ static void xe_pci_shutdown(struct pci_dev
> > *pdev)
> > >  	xe_device_shutdown(pdev_to_xe_device(pdev));
> > >  }
> > >
> > > +static void xe_assert_on_unbounded_bridge(struct pci_dev *pdev) {
> > > +	struct pci_dev *bridge = pci_upstream_bridge(pdev);
> > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > +
> > > +	if (!bridge)
> > > +		return;
> > > +
> > > +	drm_WARN_ON(&xe->drm, !bridge->driver); }
> > > +
> > >  #ifdef CONFIG_PM_SLEEP
> > >  static int xe_pci_suspend(struct device *dev)  {
> > >  	struct pci_dev *pdev = to_pci_dev(dev);
> > >  	int err;
> > >
> > > +	xe_assert_on_unbounded_bridge(pdev);
> > 
> > besides warning, shouldn't we block the suspend at all?
> > returning from this point...
> If that is desired then, we shall check this in xe probe and initializes the PM OPS with NULL rather then failing suspend ?

great idea!

> Br,
> Anshuman Gupta. 
> > 
> > >  	err = xe_pm_suspend(pdev_to_xe_device(pdev));
> > >  	if (err)
> > >  		return err;
> > > @@ -718,6 +730,7 @@ static int xe_pci_runtime_suspend(struct device
> > *dev)
> > >  	struct xe_device *xe = pdev_to_xe_device(pdev);
> > >  	int err;
> > >
> > > +	xe_assert_on_unbounded_bridge(pdev);
> > >  	err = xe_pm_runtime_suspend(xe);
> > >  	if (err)
> > >  		return err;
> > > --
> > > 2.38.0
> > >
