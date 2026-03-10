Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3DAFD4F33
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 20:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E7010E2DD;
	Tue, 10 Mar 2026 20:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ptJWjHcN";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A491710E2DC;
 Tue, 10 Mar 2026 20:23:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5CA1341A82;
 Tue, 10 Mar 2026 20:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFC4C19423;
 Tue, 10 Mar 2026 20:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773174181;
 bh=WjuNwDXxkynlyKkQB+LrWYDGB4Ihj8czhctSUnUpQtU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ptJWjHcNVLiKcvNZ1Egij8M+jHdvr9ZYRu+x609z9kQTAx98//QONUoVRoedDc9VC
 ROqJ5wzueEZQNmuVOd74Wrm1rCGDo2OQQsZqOwpyuSnSADQSBOUQ45wJEs7DWWI3A3
 DYkC+JXR1U4rCcX2tGqE5NP8/YP358Z4aSeAt+hBb8tFaQ0J1XFdoHn/ilatkfkUSH
 2GMx8fK70a4bDKT04Wv9CtzIEtB7mzSuKEscUdVWmjxWNARplDGN5rw1m/TK7ffYhQ
 8L6IAIkUlYRv0uOHVlhl9miOlOXk2cEvM/6L7j7ZV1E4d+ix4p8YrYDruFnGw5/DgF
 1ga5HGT3Mq/bg==
Date: Tue, 10 Mar 2026 15:22:59 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/5] pci: check if VGA decoding was really activated
Message-ID: <20260310202259.GA777598@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307173538.763188-5-Simon.Richter@hogyros.de>
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

On Sun, Mar 08, 2026 at 02:35:37AM +0900, Simon Richter wrote:
> PCI bridges are allowed to refuse activating VGA decoding, by simply
> ignoring attempts to set the bit that enables it, so after setting the bit,
> read it back to verify.
> 
> One example of such a bridge is the root bridge in IBM PowerNV, but this is
> also useful for GPU passthrough into virtual machines, where it is
> difficult to set up routing for legacy IO through IOMMU.

Based on this:
https://lore.kernel.org/all/9f297568-5616-40b6-b401-df1af57d5e14@hogyros.de

I *guess* this is the critical patch, and together with
https://patchwork.freedesktop.org/patch/709684/?series=161721&rev=4,
it fixes an issue?

Without these two patches, i915 assumes its
vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO) always succeeds, and
I guess the problem is that if it *didn't* succeed, i915's subsequent
ioport accesses may go to the wrong device or to no device at all,
which might corrupt another device or cause a PCI error?

We could include the i915 patch in this series.  Wouldn't be a
problem from the PCI side, I dunno about the DRM side.

> Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
> ---
>  drivers/pci/pci.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 8479c2e1f74f..e60b948f8576 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -6197,6 +6197,12 @@ int pci_set_vga_state(struct pci_dev *dev, bool decode,
>  				cmd &= ~PCI_BRIDGE_CTL_VGA;
>  			pci_write_config_word(bridge, PCI_BRIDGE_CONTROL,
>  					      cmd);
> +			if (decode) {
> +				pci_read_config_word(bridge, PCI_BRIDGE_CONTROL,
> +						     &cmd);
> +				if(!(cmd & PCI_BRIDGE_CTL_VGA))
> +					return -EIO;
> +			}
>  		}
>  		bus = bus->parent;
>  	}
> -- 
> 2.47.3
> 
