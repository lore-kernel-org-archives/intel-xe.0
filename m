Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0446C83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 21 Jul 2025 20:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC5910E3B9;
	Mon, 21 Jul 2025 20:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ez7BTiDG";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CC910E3B9
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Jul 2025 20:24:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DF630601F5;
 Mon, 21 Jul 2025 20:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79459C4CEED;
 Mon, 21 Jul 2025 20:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753129442;
 bh=sS633lBMdBbj9TmNHgMgMXWhm7Lyt6pC4nAtzjPkC4w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ez7BTiDGIZ3fz2lArG1GUZWTez9dpQZIobVBRdveTW/2V3LsW/5rWoKtsXKQDYwil
 5tX8UFFYt3UjhzgCvGLdteYUGj95BPVH6VvrmQJXhEbNL7bznvLjR2OdNGkci1Uuhm
 9KpVtLUXsxsfeLRbBKtKXUNVGxs18MG/A/vBHHghkkQ0gf8m/TbBd/YAaD/fYhoovA
 n5Sw7d3otwnF97qYLCqLZrpLihUnaEd8+y0s02uGi7hA3Kq27gMh3BxSiqtZdKxzrD
 Tp6d6x7qyklNyByQ4skkMgPtoFF7cbaxIHNnHGaf9HkMgjj/5hz52sbycbhORdfSID
 YqHduEj7eyKjA==
Date: Mon, 21 Jul 2025 15:24:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-pci@vger.kernel.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Han Gao <rabenda.cn@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH] PCI: hide mysterious 8MB 64-bit pref BAR on Intel Arc
 PCIe Switch
Message-ID: <20250721202401.GA2751369@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721173057.867829-1-uwu@icenowy.me>
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

[+cc Ilpo]

On Tue, Jul 22, 2025 at 01:30:57AM +0800, Icenowy Zheng wrote:
> The upstream port device of Intel Arc series dGPUs' internal PCIe switch
> contains a mysterious 8MB 64-bit prefetchable BAR. All reads to memory
> mapped to that BAR returns 0xFFFFFFFF and writes have no effect.
> 
> When the PCI bus isn't configured by any firmware (e.g. a PCIe
> controller solely initialized by Linux kernel), the PCI space allocation
> algorithm of Linux will allocate the main VRAM BAR of Arc dGPU device at
> base+0, and then the 8MB BAR at base+256M, which prevents the main VRAM
> BAR gets resized. As the functionality and performance of Arc dGPU will
> get severely restricted with small BAR, this makes a problem.
> 
> Hide the mysterious 8MB BAR to Linux PCI subsystem, to allow resizing
> the VRAM BAR to VRAM size with the Linux PCI space allocation algorithm.

There's no reason a switch upstream port should not have a BAR.  I
suspect this BAR probably does have a legitimate purpose, and it's
only "mysterious" because we don't know how to use it.

This sounds like it may be a deficiency in the Linux BAR assignment
code.  Any other device could have a similar problem.  

> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  drivers/pci/quirks.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index d7f4ee634263..df304bfec6e9 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -3650,6 +3650,22 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x37d0, quirk_broken_intx_masking);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x37d1, quirk_broken_intx_masking);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x37d2, quirk_broken_intx_masking);
>  
> +/*
> + * Intel Arc dGPUs' internal switch upstream port contains a mysterious 8MB
> + * 64-bit prefetchable BAR that blocks resize of main dGPU VRAM BAR with
> + * Linux's PCI space allocation algorithm.
> + */
> +static void quirk_intel_xe_upstream(struct pci_dev *pdev)
> +{
> +	memset(&pdev->resource[0], 0, sizeof(pdev->resource[0]));

This doesn't touch the BAR itself, so we may be leaving the BAR
decoding accesses, which could lead to an address conflict.  It also
prevents a driver for the upstream port from using the BAR.

> +}
> +/* Intel Arc A380 PCI Express Switch Upstream Port */
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x4fa1, quirk_intel_xe_upstream);
> +/* Intel Arc A770 PCI Express Switch Upstream Port */
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x4fa0, quirk_intel_xe_upstream);
> +/* Intel Arc B580 PCI Express Switch Upstream Port */
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0xe2ff, quirk_intel_xe_upstream);
> +
>  static u16 mellanox_broken_intx_devs[] = {
>  	PCI_DEVICE_ID_MELLANOX_HERMON_SDR,
>  	PCI_DEVICE_ID_MELLANOX_HERMON_DDR,
> -- 
> 2.50.1
> 
