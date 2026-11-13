Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A680606ABA7
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 13:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m9/8uyhk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F394811250F;
	Fri, 13 Nov 2026 13:30:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4794C1124B9;
 Fri, 13 Nov 2026 13:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794576609; x=1826112609;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N4xDIdgbCfGZKmQDxMDQjBUOJ68HV/WloBaiIxO/kkw=;
 b=m9/8uyhk28KFHgne2fBCtADLRNu1WCNTNkSdE5U4DG1x70LavRZ+lfc4
 1HE3GNknVaF04kxY4g/NYXcje6STL9xe0jp9fAD7nha7WjUDItnKx0TuB
 ZcMgd+ZY6vE89DJSso67MXqRRw3H3jMl719s+R8ukANKkgVkrj9IJbqRY
 Npl9MRjc5Gj2s/T4JMV605YUW8iDtBAlEgFcgNrmzznnN8ENOoTP/9brS
 R0kg1GTJfQzagTTbvLe1fBdhYPqkCrMgooIzPiVb/A43BOp3mEBvynpmb
 Ph/1uyqM81kAqtCEi52135X32/r0ScRDE48uRkH3jKdg9pXEv7JrvehSZ Q==;
X-CSE-ConnectionGUID: 4U1w/rgGQFOtnKCeAdsBlw==
X-CSE-MsgGUID: TCQJVZyWR4uv8sP/P1wtiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3390072"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3390072"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:30:08 -0800
X-CSE-ConnectionGUID: ym61yZWgSg2WtOV/bUkM7w==
X-CSE-MsgGUID: vW87QfSkQBabTui+bKhFcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9243331"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:30:06 -0800
Date: Fri, 13 Nov 2026 15:30:02 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v5 3/5] drm/xe: Raise gt frequency slightly earlier.
Message-ID: <avcQ2n9X3uYWUizr@intel.com>
References: <20261113124453.144408-7-dev@lankhorst.se>
 <20261113124453.144408-10-dev@lankhorst.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261113124453.144408-10-dev@lankhorst.se>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 01:44:57PM +0100, Maarten Lankhorst wrote:
> Move raising the gt frequency to before display_register, so the
> blit that's potentially performed to copy stolen memory to system
> memory will run at full speed.

Is this the thing that drops the media frequency after init?
I've been pondering if we should also be doing the frequency
pumping at runtime around display commits because MMIO
performance is apparently tied in with the media frequency.
Even with media at high frequency MMIO is glacial on MTL+,
and becomes even more so after the media frequency drops :/

> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 6911c2ac39f82..616e02066ae6d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1069,6 +1069,9 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	for_each_gt(gt, xe, id)
> +		xe_gt_sanitize_freq(gt);
> +
>  	xe_display_register(xe);
>  
>  	err = xe_oa_register(xe);
> @@ -1093,9 +1096,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_unregister_display;
>  
> -	for_each_gt(gt, xe, id)
> -		xe_gt_sanitize_freq(gt);
> -
>  	xe_vsec_init(xe);
>  
>  	err = xe_sriov_init_late(xe);
> -- 
> 2.55.0

-- 
Ville Syrjälä
Intel
