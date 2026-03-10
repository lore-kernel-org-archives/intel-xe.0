Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277D4EB104A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 11:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D844710E0E4;
	Tue, 10 Mar 2026 11:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJEs3/YM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF9110E0E4;
 Tue, 10 Mar 2026 11:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773141023; x=1804677023;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=D0+1zpOK76ODtIVW/FEd4Sc9tWvYsa/8jYCUnOChFK8=;
 b=mJEs3/YMYhyS6X7xZ5tZGJrnerP0YP0qzjINocP0e9z2QpEXjxbzlS/6
 MkrIpaPuGyGz0qR4wPhuQLgySwnVyUfcNqRL3TVAStl22M5q0aws2h6TY
 nuWF3YrcXy5BoEGA6voibIIECONeqqh4ZYwHx3+6Y3Wmie5iOhM5iJMYg
 nrYRAokOanGy6jayBr7KJZDreOfEVg61AM/ESl/KoWN+2dBIJLvBJOU41
 9y9zd8yR7DAzYmSATi3nGnFqRllu7oiWZhwX4bPf5VGMvh+iWTzqnNiat
 vhCNXgb+8ZW37H+0VcCKT+yq4T98aY7AkLK+T7oH3WhBnli/udFARuBh5 A==;
X-CSE-ConnectionGUID: qCuYT48LSe+iXj7GCekvTA==
X-CSE-MsgGUID: zQAPeeYCQFGLN4LFQFV+xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74299771"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74299771"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 04:10:22 -0700
X-CSE-ConnectionGUID: UlE7gqgTT9ufz5ua6pfKMg==
X-CSE-MsgGUID: DN+lvD/HTIeIjERe5TVgug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="225015804"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.33])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 04:10:21 -0700
Date: Tue, 10 Mar 2026 13:10:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/1] drm/i915: handle failure from
 vga_get_uninterruptible()
Message-ID: <aa_8GhVURTdKWRVl@intel.com>
References: <20260218131131.460105-1-Simon.Richter@hogyros.de>
 <20260306151347.758836-1-Simon.Richter@hogyros.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260306151347.758836-1-Simon.Richter@hogyros.de>
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

On Sat, Mar 07, 2026 at 12:13:16AM +0900, Simon Richter wrote:
> The vga_get_uninterruptible() function can return an error if it fails to
> set up VGA decoding for the requested device.
> 
> If VGA decoding is unavailable, we don't need to be careful to leave the
> VGA emulation in a usable state, as vgacon will also be unable to get
> access later on, so just skip over the VGA accesses and the vga_put() call
> matching the failed vga_get_uninterruptible().
> 
> Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1824

Looks good.
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Do you need to take this in via some other tree, or should I just push
it to drm-intel-next?

> ---
>  drivers/gpu/drm/i915/display/intel_vga.c | 33 +++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
> index 6fc3e3702cb8..9832a4ade318 100644
> --- a/drivers/gpu/drm/i915/display/intel_vga.c
> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> @@ -112,12 +112,16 @@ static bool intel_pci_bridge_set_vga(struct pci_dev *pdev, bool enable)
>  	return old & PCI_BRIDGE_CTL_VGA;
>  }
>  
> -static bool intel_vga_get(struct intel_display *display, bool mmio)
> +static int intel_vga_get(struct intel_display *display, bool mmio,
> +			 bool *old_io_decode)
>  {
>  	struct pci_dev *pdev = to_pci_dev(display->drm->dev);
> +	int err;
>  
> -	if (mmio)
> -		return false;
> +	if (mmio) {
> +		*old_io_decode = false;
> +		return 0;
> +	}
>  
>  	/*
>  	 * Bypass the VGA arbiter on the iGPU and just enable
> @@ -130,10 +134,15 @@ static bool intel_vga_get(struct intel_display *display, bool mmio)
>  	 * grab any VGA IO access when IO decode is enabled, regardless
>  	 * of how any other VGA routing bits are configured.
>  	 */
> -	if (display->platform.dgfx)
> -		vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> +	if (display->platform.dgfx) {
> +		err = vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> +		if (err)
> +			return err;
> +	}
> +
> +	*old_io_decode = intel_pci_set_io_decode(pdev, true);
>  
> -	return intel_pci_set_io_decode(pdev, true);
> +	return 0;
>  }
>  
>  static void intel_vga_put(struct intel_display *display, bool io_decode, bool mmio)
> @@ -175,6 +184,7 @@ void intel_vga_disable(struct intel_display *display)
>  	bool io_decode;
>  	u8 msr, sr1;
>  	u32 tmp;
> +	int err;
>  
>  	if (!intel_vga_decode_is_enabled(display)) {
>  		drm_dbg_kms(display->drm, "VGA decode is disabled\n");
> @@ -216,7 +226,16 @@ void intel_vga_disable(struct intel_display *display)
>  			goto reset_vgacntr;
>  	}
>  
> -	io_decode = intel_vga_get(display, mmio);
> +	/*
> +	 * This should not fail, because the vga_get() family of functions
> +	 * will only report errors for dGPUs that are unreachable via the
> +	 * bridge, and cannot be made reachable either. We shouldn't even
> +	 * get here for this case, but if we do, we assume that the bridge
> +	 * will also refuse future requests to forward VGA accesses.
> +	 */
> +	err = intel_vga_get(display, mmio, &io_decode);
> +	if (err)
> +		goto reset_vgacntr;
>  
>  	drm_WARN_ON(display->drm, !mmio && !intel_pci_has_vga_io_decode(pdev));
>  
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
