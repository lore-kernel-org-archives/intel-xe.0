Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D869FC28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 14:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A35110E180;
	Wed,  2 Apr 2025 14:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JyHvY81E";
	dkim-atps=neutral
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1620010E180
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 14:21:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 36A7AA44CCF;
 Wed,  2 Apr 2025 14:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4DDC4CEDD;
 Wed,  2 Apr 2025 14:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743603665;
 bh=vXYuaE+21XA2be2/349r2NDERz2RvN86SNY7hnpjASQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=JyHvY81ESxf/VPFrmMbV/Rns8Q+G6ATqZr3mKW4H3z7qVW2qox6WIkRnyi2RZZPGH
 84ft40LkaRr1iw2W9W+cpgDYJ0/4XnuIaNIrKV7er7c1J0jzasiOkFpxtlNC8LSVdS
 ZtmgRAIK51Bmqqo4r7W2xQcjc4p50JSN5JXeHxzONN+vl7UasTpzBtSXemgPeIAgMg
 WwcP66MibNl4WAHVGNDGphNt6dPRx/BLKutAjGNeM+wFWItEg3MQkdMePamdeAfm4k
 G1hAPEXmO/Wxtcl6T1AGt8QuxgB84Si0PrS4X4Ng/PPqQw6EtC4ucHt0nbn2TVdfUj
 eg4KVdiKU/hQg==
Date: Wed, 2 Apr 2025 09:21:04 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>,
 intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, lenb@kernel.org, bhelgaas@google.com,
 ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: Re: [PATCH 02/12] PCI/ACPI: Add PERST# Assertion Delay _DSM method
Message-ID: <20250402142104.GA1714299@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0hN1qRzU96uAGf1+BoQyqF-1=C4XbCcPA-0xtGt8gj7qQ@mail.gmail.com>
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

On Wed, Apr 02, 2025 at 01:06:42PM +0200, Rafael J. Wysocki wrote:
> On Tue, Apr 1, 2025 at 5:36 PM Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> >
> > Implement _DSM Method 11 as per PCI firmware specs
> > section 4.6.11 Rev 3.3.

> > +int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
> > +{
> > +       union acpi_object in_obj = {
> > +               .integer.type = ACPI_TYPE_INTEGER,
> > +               .integer.value = delay_us,
> > +       };
> > +
> > +       union acpi_object *out_obj;
> > +       acpi_handle handle;
> > +       int result, ret = -EINVAL;
> > +
> > +       if (!dev || !ACPI_HANDLE(&dev->dev))
> > +               return -EINVAL;
> > +
> > +       handle = ACPI_HANDLE(&dev->dev);
> > +
> > +       out_obj = acpi_evaluate_dsm_typed(handle, &pci_acpi_dsm_guid, 4,
> 
> This is something I haven't noticed in the previous patch, but also
> applies to it.
> 
> Why is rev 4 of the interface hard-coded here?

Thanks for asking this because it's related to the whole _DSM revision
question that I don't understand.

If we didn't use rev 4 here, what should we use?  The PCI Firmware
spec, r3.3, sec 4.6.11, documents this interface and says "lowest
valid Revision ID value is 4", so that's the source of the 4.

My argument is that the spec documents rev 4, the kernel code was
tested with rev 4, so what would be the benefit of using a different
revision here?

> > +                                         DSM_PCI_PERST_ASSERTION_DELAY,
> > +                                         &in_obj, ACPI_TYPE_INTEGER);
