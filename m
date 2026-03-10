Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC048EB104F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 11:37:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6D810E251;
	Tue, 10 Mar 2026 11:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLkMYD3y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6320710E251;
 Tue, 10 Mar 2026 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773142636; x=1804678636;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wfQo3G1VdAcgol/HRvdVZRGaZRNEhdOv8p8rm/8p2+w=;
 b=nLkMYD3yqndcIrqPzL9KuF2bn3jvE5Z3EKWzdgeCPv/0XGLYf3gteC4v
 latX0MJU3FNr1p0VMOGu/yqEe3yf6apQlO9cImcTQV+3aDAPZ231FmLTM
 nxzBDiUrJ+oJWtHalXq0Xsz84blYeKNtValMqd2Nrr0VTIF18Df/6WvZm
 tAghp+V+pXn8Xc8KPoWteb5QhCL7BtXEKbwgai3uSjREPKaSYGmnA7VnV
 mwZDEy1v/komqPOSNlQka2qYPvbv16Nab48GwHsIlHbAPpCUe6BUtUogQ
 VFLfDz5a3GHQjMUDHb7rc49q7nQ7a9E5MKPk54Hx7ximncwcdQJqWLJRe A==;
X-CSE-ConnectionGUID: ondFta+6Q6CfmDfqZa/H4g==
X-CSE-MsgGUID: omj5frwdTqWUu9xiQzzKHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85662720"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="85662720"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 04:37:15 -0700
X-CSE-ConnectionGUID: TSz16qltT7iAOKBTtOnBNA==
X-CSE-MsgGUID: 7RkwOCdrRtKmeC9VswEKaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="243098885"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.33])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 04:37:13 -0700
Date: Tue, 10 Mar 2026 13:37:10 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/5] vgaarb: pass errors from pci_set_vga_state() up
Message-ID: <abACZiX80vhQP0d-@intel.com>
References: <20260307173538.763188-1-Simon.Richter@hogyros.de>
 <20260307173538.763188-3-Simon.Richter@hogyros.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260307173538.763188-3-Simon.Richter@hogyros.de>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Sun, Mar 08, 2026 at 02:35:35AM +0900, Simon Richter wrote:
> pci_set_vga_state() returns an error code, which so far has been ignored by
> the only caller, __vga_tryget(), so forward it to the caller. As the return
> type of __vga_tryget() is a pointer, wrap the error in ERR_PTR().
> 
> Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
> ---
>  drivers/pci/vgaarb.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 22b2b6ebdefd..c360eee11dd9 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -215,6 +215,7 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
>  	struct vga_device *conflict;
>  	unsigned int pci_bits;
>  	u32 flags = 0;
> +	int err;
>  
>  	/*
>  	 * Account for "normal" resources to lock. If we decode the legacy,
> @@ -307,7 +308,9 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
>  		if (change_bridge)
>  			flags |= PCI_VGA_STATE_CHANGE_BRIDGE;
>  
> -		pci_set_vga_state(conflict->pdev, false, pci_bits, flags);
> +		err = pci_set_vga_state(conflict->pdev, false, pci_bits, flags);
> +		if (err)
> +			return ERR_PTR(err);

I was thinking this one should never fail and maybe could warrant
a WARN, but uv_set_vga_state() involves some kind of BIOS call and
who knows what that does. So maybe a WARN isn't a good idea.

>  		conflict->owns &= ~match;
>  
>  		/* If we disabled normal decoding, reflect it in owns */
> @@ -337,7 +340,9 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
>  	if (wants & VGA_RSRC_LEGACY_MASK)
>  		flags |= PCI_VGA_STATE_CHANGE_BRIDGE;
>  
> -	pci_set_vga_state(vgadev->pdev, true, pci_bits, flags);
> +	err = pci_set_vga_state(vgadev->pdev, true, pci_bits, flags);
> +	if (err)
> +		return ERR_PTR(err);
>  
>  	vgadev->owns |= wants;
>  lock_them:
> @@ -455,6 +460,10 @@ int vga_get(struct pci_dev *pdev, unsigned int rsrc, int interruptible)
>  		}
>  		conflict = __vga_tryget(vgadev, rsrc);
>  		spin_unlock_irqrestore(&vga_lock, flags);
> +		if (IS_ERR(conflict)) {
> +			rc = PTR_ERR(conflict);
> +			break;
> +		}
>  		if (conflict == NULL)
>  			break;
>  
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
