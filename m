Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6FCFD4F2E
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 19:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E23710E05A;
	Tue, 10 Mar 2026 19:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BiMzwqZk";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F9210E05A;
 Tue, 10 Mar 2026 19:36:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 53DE540BA0;
 Tue, 10 Mar 2026 19:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B6DC19423;
 Tue, 10 Mar 2026 19:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773171369;
 bh=4ZB5QRZ9q+mJ16oIdgit5rGeLj+b4Z5voROWRVfX1vU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=BiMzwqZk8ym2F5+BdBpNRjBWNtwpv/5VcjzFhvNJf9HhdiWoIWwNa69cp3UbAfMib
 1Y5b5ogsFUKbI4LW2UqumhHUB5QWuK6mDmhTxyFKpx6G3LnBq7DahhMmM6PL2M135D
 2awm9qVtdozMUHPj3JijL9+c43xO1/+pOMknf9lG9jgLojfDQjbQpAPUrxXRIQDOWT
 Rycl3tcrLtNSYdL6zhOVnToeJrlBV9EQ4OmCgI52zUPa1E/cJqa3FIScL201ylhzQf
 oMgGFlNXg3LNR8PhK37Rzuz8LK1pbQ0nm15f+mA++b5l9HSIlSWu5wiiTuhFDOB6Xx
 eG0FM+FL+bjbQ==
Date: Tue, 10 Mar 2026 14:36:07 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/5] pci: mark pci_set_vga_state() as __must_check
Message-ID: <20260310193607.GA774938@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307173538.763188-6-Simon.Richter@hogyros.de>
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

On Sun, Mar 08, 2026 at 02:35:38AM +0900, Simon Richter wrote:
> This function can return an error, usually on non-x86 or virtualized
> environments.
> 
> The only caller so far is __vga_tryget() in vgaarb.

Is there any reason for pci_set_vga_state() to be in pci.c while the
only caller is in vgaarb.c?  If not, we could move it there, make it
static, and drop it from include/linux/pci.h.

> Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
> ---
>  include/linux/pci.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 1c270f1d5123..aa1451d402d1 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1720,8 +1720,8 @@ resource_size_t pcibios_window_alignment(struct pci_bus *bus,
>  #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
>  #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)
>  
> -int pci_set_vga_state(struct pci_dev *pdev, bool decode,
> -		      unsigned int command_bits, u32 flags);
> +int __must_check pci_set_vga_state(struct pci_dev *pdev, bool decode,
> +				   unsigned int command_bits, u32 flags);
>  
>  /*
>   * Virtual interrupts allow for more interrupts to be allocated
> -- 
> 2.47.3
> 
