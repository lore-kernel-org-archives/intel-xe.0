Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FACD6CFAB
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 23:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFEF10EB89;
	Thu, 22 Jan 2026 23:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eCnv/kW6";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1716710EB89
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 23:27:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2CBA86001A;
 Thu, 22 Jan 2026 23:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B871AC116C6;
 Thu, 22 Jan 2026 23:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769124454;
 bh=TpTvuO5OGPCFjh5XFxTMY09tgERrKThZNyQvlUN/g8Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=eCnv/kW66JgUyYthhTx4hls2d3Mf8RMNWBA5dZCbs4Q83J7DI/CZ66KGPPbw35290
 tLYHqgH/uAkCgXzG3J29QndIfL14nynk8k0jc/OWSlFxv04n/Zg50LWv9wCw15x8zq
 rgUg4KHK/n3f8/H8FqUW5sHnRLRrMyikqGTaB7Yx9uoBa9bCPKmwweyyJ837kk9VCP
 5Xjh4IHicmcVCTRXWQQqNrlZ4SyW+90coyQULEg+d06uKvo5RQB7d+j1prY8gbw/Dh
 cnSBTllpvDVQzJXrzH/cgKQnHLda1DzHYLAo12Jb1AyLAf1/xNMEMFe7fdXikNfsFc
 ZxlF6Satpm01A==
Date: Thu, 22 Jan 2026 17:27:33 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, anshuman.gupta@intel.com,
 rafael@kernel.org, lenb@kernel.org, bhelgaas@google.com,
 ilpo.jarvinen@linux.intel.com, rodrigo.vivi@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com,
 uma.shankar@intel.com, karthik.poosa@intel.com,
 matthew.auld@intel.com, sk.anirban@intel.com, raag.jadav@intel.com
Subject: Re: [PATCH v6 02/12] PCI/ACPI: Add PERST# Assertion Delay _DSM method
Message-ID: <20260122232733.GA46175@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <531f2fe7-7a17-42cc-8747-ea122fe1c95f@intel.com>
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

On Tue, Jan 20, 2026 at 09:29:16PM +0530, Nilawar, Badal wrote:
> On 15-01-2026 01:25, Bjorn Helgaas wrote:
> > On Tue, Jan 13, 2026 at 10:12:03PM +0530, Badal Nilawar wrote:
> > > From: Anshuman Gupta <anshuman.gupta@intel.com>
> > > 
> > > Implement _DSM Method 0Bh as per PCI Firmware r3.3, sec 4.6.10, to request
> > > fixed delay in timing between the time the PME_TO_Ack message is received
> > > at the PCI Express Downstream Port that originated the PME_Turn_Off
> > > message, and the time the platform asserts PERST# to the slot during the
> > > corresponding Endpoint’s or PCI Express Upstream Port’s transition to
> > > D3cold while the system is in an ACPI operational state.
> > > Host platform supporting this feature ensures that device is observing
> > > this delay in every applicable D3Cold transition.

> > > +int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
> > > +{
> ...

> > > +	if (!dev)
> > > +		return -EINVAL;

Calling this with "dev == NULL" is a bug in the caller, so I don't
think we should check for this.  That way we will take the NULL
pointer dereference, cause an oops, and can fix the bug.  If we check
for NULL, the bug is likely to be unnoticed.

> > Sec 4.6.11 also says we should track this per Downstream Port and
> > request the maximum of delays requested by any child.  So I think we
> > need to:
> > 
> >    - add a perst_delay in struct pci_dev
> > 
> >    - when we find this _DSM, set
> >      bdev.perst_delay = max(bdev.perst_delay, delay_us)
> > 
> >    - pass bdev.perst_delay to the _DSM instead of delay_us
> 
> For vrsr use case delay requested is 10ms, which is maximum allowed by this
> _DSM.
> I think we should take care of above suggestion when we implement aux power
> aggregation.
> For now, I can create another list let's call it acpi_perst_delay_list,
> similar to acpi_aux_power_list, and
> allow a only one device to request a PERST delay.

I think lists will be a maintenance headache.

> > > +		handle = ACPI_HANDLE(&bdev->dev);
> > > +		if (handle &&
> > > +		    acpi_check_dsm(handle, &pci_acpi_dsm_guid, 4,
> > > +				   1 << DSM_PCI_PERST_ASSERTION_DELAY))
> > > +			break;
> > > +	}
> > > +
> > > +	if (!bdev)
> > > +		return -ENODEV;
> > > +
> > > +	out_obj = acpi_evaluate_dsm_typed(ACPI_HANDLE(&bdev->dev),
> > > +					  &pci_acpi_dsm_guid, 4,
> > > +					  DSM_PCI_PERST_ASSERTION_DELAY,
> > > +					  &in_obj, ACPI_TYPE_INTEGER);
> > > +	if (!out_obj)
> > > +		return -EINVAL;
> > > +
> > > +	result = out_obj->integer.value;
> > > +	ACPI_FREE(out_obj);
> > > +
> > > +	if (result == delay_us) {
> > > +		pci_info(dev, "PERST# Assertion Delay set to %u microseconds\n", delay_us);
> >
> > I think this message should use "bdev" instead of "dev".  I know the
> > request is for "dev", but the delay connected to bdev and applies to
> > all functions below the Downstream Port.
>
> Since it is set for the device which as requested I kept dev.

It's set for *all* devices below bdev, so I think the message should
give a clue about that.  If we only include "dev", there is no
indication that other devices are affected.  Maybe we could include
both dev and bdev?

  pci_info(bdev, "PERST# assertion delay %u microseconds set as requested by %s\n",
           delay_us, pci_name(bdev));
