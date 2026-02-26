Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E707FC5927
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 10:44:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF5E10E8C0;
	Thu, 26 Feb 2026 10:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYLwL/2b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3177010E8BA;
 Thu, 26 Feb 2026 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772102673; x=1803638673;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=t/kHhLcoQBg77hYSfPCusHI8uk/XPH05j8CSW5uCAP4=;
 b=GYLwL/2b6xlZ5JBYTiumXmmTmI3uJqPwfmeMO5W7rtgfS72s/OF0p0eS
 wPDnMHam87tdaZLnMIjCz4faTt7cknmzfqjZKvmdybT1Kv6NG29bl6wWL
 PcpDMM82Yrw7cupqGrd7DfCaybxRRJGAmidn7eSZdEnrUVyOsQAR8+ERD
 AkUql5nxWzuZYt+KREVHV6tnEtIXFANyxM+CtnmEG3vDUQ6QrvKZVeEZ8
 1R0HTHYVdMWg/6W6Uu0PSkUVdWr53PJbBYjbsKVtnhW9CAh7bA912b/A1
 lnLAjEtOHGQIqUdbgHq0Z0C29A5VmUTtD8SiUg9EIV3t/JDPVFK1S4/6l A==;
X-CSE-ConnectionGUID: SafuDefxTm6KiXTtow0Pig==
X-CSE-MsgGUID: pyKp3oTuTAuW1zvu6oeZhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73230108"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73230108"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:44:33 -0800
X-CSE-ConnectionGUID: Ga7IPQKISRSp+kpWeE/o0Q==
X-CSE-MsgGUID: 8kBWaSMgSgqijjZkPPyEGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221521929"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.125])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:44:31 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Simon Richter <Simon.Richter@hogyros.de>
Subject: Re: [PATCH 1/1] drm/i915: handle failure from vga_get
In-Reply-To: <20260217165214.236482-2-Simon.Richter@hogyros.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260217165214.236482-1-Simon.Richter@hogyros.de>
 <20260217165214.236482-2-Simon.Richter@hogyros.de>
Date: Thu, 26 Feb 2026 12:44:28 +0200
Message-ID: <27abe19ab816cf112b1eade65e6287b881477a9f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 18 Feb 2026, Simon Richter <Simon.Richter@hogyros.de> wrote:
> This function returns an error code.

Which function? Please make commit messages independent of the Subject
line.

Also, the function we call is vga_get_uninterruptible().

> If that code is non-zero, VGA decoding
> is undefined, and the lock counter has not been increased, so it is not valid
> to access registers or call vga_put afterwards.
>
> Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1824
> ---
>  drivers/gpu/drm/i915/display/intel_vga.c | 29 ++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
> index 6fc3e3702cb8..4118c451d53c 100644
> --- a/drivers/gpu/drm/i915/display/intel_vga.c
> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> @@ -112,12 +112,17 @@ static bool intel_pci_bridge_set_vga(struct pci_dev *pdev, bool enable)
>  	return old & PCI_BRIDGE_CTL_VGA;
>  }
>  
> -static bool intel_vga_get(struct intel_display *display, bool mmio)
> +static int __must_check intel_vga_get(struct intel_display *display,

I'm not convinced by __must_check annotations for static
functions. Global stuff, sure, but we'd be adding tons and tons of these
annotations if we decided to go this path.

> +	bool mmio, bool *old_io_decode)
>  {
>  	struct pci_dev *pdev = to_pci_dev(display->drm->dev);
> +	int err;
>  
>  	if (mmio)
> -		return false;
> +	{

Brace location, please see checkpatch.

> +		*old_io_decode = false;
> +		return 0;
> +	}
>  
>  	/*
>  	 * Bypass the VGA arbiter on the iGPU and just enable
> @@ -131,9 +136,14 @@ static bool intel_vga_get(struct intel_display *display, bool mmio)
>  	 * of how any other VGA routing bits are configured.
>  	 */
>  	if (display->platform.dgfx)
> -		vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> +	{

Brace location.

> +		err = vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> +		if (unlikely(err))

I'm not convinced by unlikely annotations in cases like this. It's just
more stuff to read, for no clear benefit. Again, if we set the example,
we'll be adding these absolutely everywhere.

> +			return err;
> +	}
>  
> -	return intel_pci_set_io_decode(pdev, true);
> +	*old_io_decode = intel_pci_set_io_decode(pdev, true);

Blank line before return.

> +	return 0;
>  }
>  
>  static void intel_vga_put(struct intel_display *display, bool io_decode, bool mmio)
> @@ -175,6 +185,7 @@ void intel_vga_disable(struct intel_display *display)
>  	bool io_decode;
>  	u8 msr, sr1;
>  	u32 tmp;
> +	int err;
>  
>  	if (!intel_vga_decode_is_enabled(display)) {
>  		drm_dbg_kms(display->drm, "VGA decode is disabled\n");
> @@ -216,7 +227,15 @@ void intel_vga_disable(struct intel_display *display)
>  			goto reset_vgacntr;
>  	}
>  
> -	io_decode = intel_vga_get(display, mmio);
> +	/* This should not fail, because vga_get will only report errors for

/* on its own line please.

> +	 * dGPUs that are unreachable via the bridge, and cannot be made
> +	 * reachable either. We shouldn't even get here for this case, but if
> +	 * we do, we assume that the bridge will also refuse future requests
> +	 * to forward VGA accesses.
> +	 */
> +	err = intel_vga_get(display, mmio, &io_decode);
> +	if (unlikely(err))

Please no unlikely.

> +		goto reset_vgacntr;
>  
>  	drm_WARN_ON(display->drm, !mmio && !intel_pci_has_vga_io_decode(pdev));

-- 
Jani Nikula, Intel
