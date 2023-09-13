Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A917CA5538
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 10:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F2710E49B;
	Wed, 13 Sep 2023 10:38:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E602710E49A;
 Wed, 13 Sep 2023 10:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694601507; x=1726137507;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bpgGqp6tQ+/9RSpkt1lwgNbFr1wJ37GC8V97MxZ+tzc=;
 b=B04o72j3dvBTxE1frCWyPDWF1PRXAYwpHCh26PQtiQ7NH0Hr5xT22CYx
 4xI1tKdzTkJNl74/pv20mt1gx+HZZDN/m5w+vSi7SZ/2vEOY4aGBfE4sz
 HSI9NgaCTi+LG88OqGLmx23iWLsoOiQnwMBBsvflTwzD3jaCM8ih9NBOT
 PPEClca0OIau0udvLxsyrwTBbsHX3fFq/sedqlcAKjiM/Jp0zr+sOxaM0
 ximooOVLvZLlX4mgoeLMaH2PZyV0LtOj609jrjHm3F1pXwrUF1v+xZYKC
 viADyz5nvUCBpxCnvDV2OWW26vcobyXjaThLahkEjlAXV2P8Bckbko6uU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="363654354"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="363654354"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 03:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="773415327"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="773415327"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga008.jf.intel.com with SMTP; 13 Sep 2023 03:38:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 13 Sep 2023 13:38:23 +0300
Date: Wed, 13 Sep 2023 13:38:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>
Message-ID: <ZQGRH4aWpp078lBl@intel.com>
References: <20230904115517.458662-1-vinod.govindapillai@intel.com>
 <20230904115517.458662-3-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230904115517.458662-3-vinod.govindapillai@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-xe] [Intel-gfx] [PATCH v4 2/2] drm/i915/lnl: FBC is
 supported with per pixel alpha
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
Cc: ville.syrjala@intel.com, intel-gfx@lists.freedesktop.org,
 matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 04, 2023 at 02:55:17PM +0300, Vinod Govindapillai wrote:
> For LNL onwards, FBC can be supported on planes with per
> pixel alpha
> 
> Bspec: 69560
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fbc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index a3999ad95a19..c0e4caec03ea 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -1209,7 +1209,8 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
>  		return 0;
>  	}
>  
> -	if (plane_state->hw.pixel_blend_mode != DRM_MODE_BLEND_PIXEL_NONE &&
> +	if (DISPLAY_VER(i915) < 20 &&

Bspec still says 15. Someone needs to figure this mess out for
all LNL patches.

> +	    plane_state->hw.pixel_blend_mode != DRM_MODE_BLEND_PIXEL_NONE &&
>  	    fb->format->has_alpha) {

We would have already rejected the pixel format earlier, so atm this
check is redundant.

>  		plane_state->no_fbc_reason = "per-pixel alpha not supported";
>  		return 0;
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
