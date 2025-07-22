Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73809C83F27
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 12:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A4010E66D;
	Tue, 22 Jul 2025 12:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U8DZTfVj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6A610E66D
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753188984; x=1784724984;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=c2L6rHjmtCJeciELiYPIjGCjIfrsQARmY4/qEmALyGE=;
 b=U8DZTfVjyQ1jga4qv4cwR+dEKrZxu//pbG3aKDlyaei7weazKuTyOjiR
 uwx1OGmDSOcNhVyaK0zvHE4xacU9eNdBcKXDJMaMELep9/ndVKTOJ7ync
 cDAxSrzWPjuKDREikBJMUKqDDzFNctPSw++BupOyvwJnxCQgPtRyL4Evf
 gRz0ud/Os+ucex5zg9E8pOh+eiPCWHQQo1rPhj26LzuIE2IVHwOKIsguy
 ROIhg08PKu2Y38W46jD90Vc2oIdatM9wdhiWMqYNtSCtRsmDCw/5opnkB
 zRuGASZOJP8XnfJHApfCegsWzUoOT/4uCTHHEAINt7sDpop5DEfISb0mt Q==;
X-CSE-ConnectionGUID: 07rrHOaxRaSTumR1P9SjfQ==
X-CSE-MsgGUID: EndpH92AQl2ySzS/Ut/Faw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66121523"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="66121523"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 05:56:23 -0700
X-CSE-ConnectionGUID: scgFeFDvR7O3N7BwwGx8Bw==
X-CSE-MsgGUID: Du0Jm0HnRzOfSC4GwKBEkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="164604090"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.254])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 05:56:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 22 Jul 2025 15:56:16 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: Icenowy Zheng <uwu@icenowy.me>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-pci@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Han Gao <rabenda.cn@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>
Subject: Re: [PATCH] PCI: hide mysterious 8MB 64-bit pref BAR on Intel Arc
 PCIe Switch
In-Reply-To: <20250721202401.GA2751369@bhelgaas>
Message-ID: <380aa860-89a4-08dc-7d39-b7b212546415@linux.intel.com>
References: <20250721202401.GA2751369@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 21 Jul 2025, Bjorn Helgaas wrote:

> [+cc Ilpo]
> 
> On Tue, Jul 22, 2025 at 01:30:57AM +0800, Icenowy Zheng wrote:
> > The upstream port device of Intel Arc series dGPUs' internal PCIe switch
> > contains a mysterious 8MB 64-bit prefetchable BAR. All reads to memory
> > mapped to that BAR returns 0xFFFFFFFF and writes have no effect.
> > 
> > When the PCI bus isn't configured by any firmware (e.g. a PCIe
> > controller solely initialized by Linux kernel), the PCI space allocation
> > algorithm of Linux will allocate the main VRAM BAR of Arc dGPU device at
> > base+0, and then the 8MB BAR at base+256M, which prevents the main VRAM
> > BAR gets resized.

__resource_resize_store() tries to release all resoures with the same 
flags as the resource to be resized. But it seems the release doesn't work 
across devices.

I don't like that flags check anyway, I'd want to replace all such black 
magic with a function that consistently determines the bridge window a 
resouce is assigned to. I've a series to that effect but it doesn't cover 
resize cases yet and it requires more testing anyway to confirm it doesn't 
change any parent windows resources get assigned to.

So IMO, the correct logic on resize would be to:

1) Get the relevant upstream bridge window
2) Release all child resource of that bridge window. But that will 
require further checks whether all those resources (from foreign PCI devs) 
can be released which might run a foul with dev lock ordering.

...So it might turn out hard to implement in practice.

> > As the functionality and performance of Arc dGPU will
> > get severely restricted with small BAR, this makes a problem.
> > 
> > Hide the mysterious 8MB BAR to Linux PCI subsystem, to allow resizing
> > the VRAM BAR to VRAM size with the Linux PCI space allocation algorithm.
> 
> There's no reason a switch upstream port should not have a BAR.  I
> suspect this BAR probably does have a legitimate purpose, and it's
> only "mysterious" because we don't know how to use it.
> 
> This sounds like it may be a deficiency in the Linux BAR assignment
> code.  Any other device could have a similar problem.  

I'm still working also with the resource fitting logic to make it consider 
resizable BARs when sizing the resource which would address this problem 
another way.

> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > ---
> >  drivers/pci/quirks.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > index d7f4ee634263..df304bfec6e9 100644
> > --- a/drivers/pci/quirks.c
> > +++ b/drivers/pci/quirks.c
> > @@ -3650,6 +3650,22 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x37d0, quirk_broken_intx_masking);
> >  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x37d1, quirk_broken_intx_masking);
> >  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x37d2, quirk_broken_intx_masking);
> >  
> > +/*
> > + * Intel Arc dGPUs' internal switch upstream port contains a mysterious 8MB
> > + * 64-bit prefetchable BAR that blocks resize of main dGPU VRAM BAR with
> > + * Linux's PCI space allocation algorithm.
> > + */
> > +static void quirk_intel_xe_upstream(struct pci_dev *pdev)
> > +{
> > +	memset(&pdev->resource[0], 0, sizeof(pdev->resource[0]));
> 
> This doesn't touch the BAR itself, so we may be leaving the BAR
> decoding accesses, which could lead to an address conflict.  It also
> prevents a driver for the upstream port from using the BAR.
> 
> > +}
> > +/* Intel Arc A380 PCI Express Switch Upstream Port */
> > +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x4fa1, quirk_intel_xe_upstream);
> > +/* Intel Arc A770 PCI Express Switch Upstream Port */
> > +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x4fa0, quirk_intel_xe_upstream);
> > +/* Intel Arc B580 PCI Express Switch Upstream Port */
> > +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0xe2ff, quirk_intel_xe_upstream);
> > +
> >  static u16 mellanox_broken_intx_devs[] = {
> >  	PCI_DEVICE_ID_MELLANOX_HERMON_SDR,
> >  	PCI_DEVICE_ID_MELLANOX_HERMON_DDR,
> > -- 
> > 2.50.1
> > 
> 

-- 
 i.

