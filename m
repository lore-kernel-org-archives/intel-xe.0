Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219EDFD4F2A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 20:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3C710E2D1;
	Tue, 10 Mar 2026 20:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SMrnfkPe";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7778010E2D1;
 Tue, 10 Mar 2026 20:07:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1352A40D7B;
 Tue, 10 Mar 2026 20:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A94C19423;
 Tue, 10 Mar 2026 20:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773173239;
 bh=3grtquKDdZWWCx3aDnSQIONQko9WXUQegcv7957x660=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=SMrnfkPem/Epb3iD7VL5D02tKlVhb43cxVZQoFSDlhe6gJfC0IzoQMPT1SnjpNyqZ
 Cxr2phPN2wJZzG40AyOgu872iGBfCqc9n381QRZ4qBwBb5KMY840vRfr9/uFRoK1Qj
 GS7LioEXI8NMHH/qqtJQ8nA4BX5bAOgiPI+XUsmMco2moaz7ftPpcs+efYSjz4tOJY
 RzvfQwfnvNzSy9aGnJ3SJdWLPb6fiPp9PuGl4ce9+1nX8rLzVZG/Hmetiuy0+49KSx
 ZF4+K8OXv6N24pOmaVHFt0g+cqgZeb9ZXXkGtc1UbSGJPdqWUaFL+RPsAmR4l4qtO2
 7f/M4hnH107Aw==
Date: Tue, 10 Mar 2026 15:07:18 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/5] vgaarb: mark vga_get() and wrappers as __must_check
Message-ID: <20260310200718.GA786702@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307173538.763188-4-Simon.Richter@hogyros.de>
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

On Sun, Mar 08, 2026 at 02:35:36AM +0900, Simon Richter wrote:
> The vga_get() function and the two wrappers vga_get_interruptible() and
> vga_get_uninterruptible() can return errors. As these are paired with
> vga_put(), which must only be called after vga_get() returned success, all
> callers need to check the return code.
> 
> Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
> ---
>  include/linux/vgaarb.h | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
> index 97129a1bbb7d..eed524c67c22 100644
> --- a/include/linux/vgaarb.h
> +++ b/include/linux/vgaarb.h
> @@ -27,7 +27,8 @@ struct pci_dev;
>  
>  #ifdef CONFIG_VGA_ARB
>  void vga_set_legacy_decoding(struct pci_dev *pdev, unsigned int decodes);
> -int vga_get(struct pci_dev *pdev, unsigned int rsrc, int interruptible);
> +int __must_check vga_get(struct pci_dev *pdev, unsigned int rsrc,
> +			 int interruptible);

vga_get() is implemented in vgaarb.c and is only used there.  Can we
drop this declaration and the stub below, make it static and
__must_check in vgaarb.c?

>  void vga_put(struct pci_dev *pdev, unsigned int rsrc);
>  struct pci_dev *vga_default_device(void);
>  void vga_set_default_device(struct pci_dev *pdev);
> @@ -39,8 +40,8 @@ static inline void vga_set_legacy_decoding(struct pci_dev *pdev,
>  		unsigned int decodes)
>  {
>  };
> -static inline int vga_get(struct pci_dev *pdev, unsigned int rsrc,
> -		int interruptible)
> +static inline int __must_check vga_get(struct pci_dev *pdev, unsigned int rsrc,
> +				       int interruptible)
>  {
>  	return 0;
>  }
