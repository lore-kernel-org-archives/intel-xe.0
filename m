Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C7BD6CFA2
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 20:53:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5347B10EAB2;
	Thu, 22 Jan 2026 20:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mmo7titT";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA00510EAB2
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 20:53:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B1F2F4177F;
 Thu, 22 Jan 2026 20:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A35C116C6;
 Thu, 22 Jan 2026 20:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769115229;
 bh=kr28A+o/jfI+wOt0vtJN7k+INbPSIL3kmO6/z1syoqo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=mmo7titTuqAzSqkA0RsSfih8eSIfDBCxAzZ8K3EBbT2n8gifiafUnRsfJP7jIDml9
 ACOLc9ApfLd3kPRbh3fv5rW+ppQ0wpb9Dm69yCyPDNXUa/Dd/G3Fy44TO6/7b4retK
 FeLAYQ156nGkSyoBvGmENMxr2koZ9+bmHjnBhVqx8E92xzp+yA56SZNttUz+rZtkO/
 vMnH4+yf4TrwSbICkZm4v7r5Tc4r6tV+GvV3QjKZg9lCA3xjX7CHhPe0WO7odz8fv4
 pQN30rULxKK0u9576ENZCdMKprdhxrZdnZyy4eMqEl/56j6NMpSKeL9ca36vNU4tlQ
 itRD8+7wcg3Dw==
Date: Thu, 22 Jan 2026 14:53:48 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, anshuman.gupta@intel.com,
 rafael@kernel.org, lenb@kernel.org, bhelgaas@google.com,
 ilpo.jarvinen@linux.intel.com, rodrigo.vivi@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com,
 uma.shankar@intel.com, karthik.poosa@intel.com,
 matthew.auld@intel.com, sk.anirban@intel.com, raag.jadav@intel.com
Subject: Re: [PATCH v6 01/12] PCI/ACPI: Add D3cold Aux Power Limit_DSM method
Message-ID: <20260122205348.GA41683@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f391a681-3153-4296-851b-a4db3cbc8de1@intel.com>
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

On Tue, Jan 20, 2026 at 07:33:17PM +0530, Nilawar, Badal wrote:
> On 15-01-2026 01:54, Bjorn Helgaas wrote:
> > On Tue, Jan 13, 2026 at 10:12:02PM +0530, Badal Nilawar wrote:
> > > From: Anshuman Gupta <anshuman.gupta@intel.com>
> > > 
> > > Implement _DSM method 0Ah, as per PCI Firmware r3.3, sec 4.6.10,
> > > to request auxiliary power required by the device when in D3cold state.
> ...

> > > +int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_mw,
> > > +				      u32 *retry_interval)
> > > +{
> > > +	union acpi_object in_obj = {
> > > +		.integer.type = ACPI_TYPE_INTEGER,
> > > +		.integer.value = requested_mw,
> > > +	};
> > > +
> > > +	union acpi_object *out_obj;
> > > +	int result;
> > > +	struct pci_dev *bdev;
> > > +	struct acpi_device *adev;
> > > +	acpi_handle handle;
> > > +	struct aux_pwr *apwr, *next;
> > > +
> > > +	if (!dev)
> > > +		return -EINVAL;
> >
> > We talked about only allowing this for function 0:
> > https://lore.kernel.org/all/20250904183046.GA1267851@bhelgaas/
> 
> In rev5 there was suggestion from Rafael to remove function 0 check as
> synchronization among drivers will be
> tricky. https://patchwork.freedesktop.org/patch/681119/?series=145342&rev=5#comment_1255325

> > > +	case AUX_PWR_REQ_GRANTED:
> > > +		pci_info(bdev, "D3cold Aux Power request granted: %u mW\n",
> > > +			 requested_mw);
> > > +		apwr = kzalloc(sizeof(*apwr), GFP_KERNEL);
> > > +		if (apwr) {
> > > +			apwr->aux_pwr_limit = requested_mw;
> > > +			apwr->dev = &dev->dev;
> > > +			apwr->adev = adev;
> > > +			INIT_LIST_HEAD(&apwr->list);
> > > +			list_add(&acpi_aux_pwr_list,
> > > +				 &apwr->list);
> > > +		}
> >
> > I think we leak this allocation if the device is removed.  I think the
> > list idea is more complicated than aggregating would be.
> > 
> > I think we could:
> > 
> >    - add "aux_power_mw" in struct pci_dev
> > 
> >    - walk the tree below bdev, accumulating aux_power_mw
> >      (total_aux_power_mw += dev->aux_power_mw)
> > 
> >    - pass "total_aux_power_mw + requested_mw" to the _DSM
> > 
> >    - if successful, set dev->aux_power_mw = requested_mw
> 
> Introduced list based handling as in rev5 there was suggestion to avoid
> adding variables in acpi/acpi_power structures.
> To handle allocation leak in function acpi_device_release() I will add code
> to scan list and delete the entry.

I think it's a mistake to add list handling for this sort of
non-dynamic situation because it adds complexity and lifetime issues.

I'm OK with adding this data to struct pci_dev.  That means we don't
have to deal with any extra list management or lifetime issues, and
it's also a way to handle the aggregation and avoid the problem of
synchronizing between drivers.

My proposal is to aggregate the power requirements of all the devices
below the bridge that implements this _DSM (bdev), and store the total
requirement in bdev->aux_power_mw.

We can do the aggregation piecemeal.  As each downstream driver calls
this function, its requirement can be added to aux_power_mw.

> > > +		if (retry_interval) {
> > > +			*retry_interval = result & 0xF;
> > > +			return -EAGAIN;
> > > +		}
> > > +		return -EINVAL;
> >
> > I think we should do:
> > 
> >    case AUX_PWR_REQ_RETRY_INTERVAL_MIN ...  AUX_PWR_REQ_RETRY_INTERVAL_MAX:
> >      result &= 0xf;
> >      pci_info(bdev, "... needs retry", result);
> >      if (retry_interval)
> >        *retry_interval = result;
> >      return -EAGAIN;
> > 
> > I don't think it's useful to return different errors based on whether
> > the caller supplied a "retry_interval" pointer.
> 
> This is to indicate caller to retry after retry_interval returned by ACPI
> method.
>
> It's up to caller whether to retry or just proceed.

I understand what the retry_interval is for.  Obviously the caller can
always decide whether to retry.

How does it help the caller if we return -EAGAIN if it supplied a
retry_interval pointer, but -EINVAL if it didn't?

When the _DSM returns an AUX_PWR_REQ_RETRY_INTERVAL status, I think we
should always return -EAGAIN.

Bjorn
