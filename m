Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FB4CAC5A7
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 08:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B1210E6B7;
	Wed, 24 Sep 2025 08:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KaCv6z/7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C891710E6B7
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758703244; x=1790239244;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KrrnA+OIuLaLTHNR38AtYVAVfBRpP9z7S9o2K6UL0oY=;
 b=KaCv6z/7MGaHYlTlCmQl8tVjS2CreTNodc7lFr0pQ54D5EFttW6ZKfIF
 6i8+n3xOsnSVOv6xOJN4Nf7fzsKyGDbFWfOfS15hMc+H3XcykbikZyBp/
 Wl4FCiHPp2QGoFILPcDWExt/iAphob1QTGO+bkBZbJKTrO/skz6Z0O/GP
 W7kfKYppvTLzF8Knn5D6azv9VqaUP5ZnjOV3Db3Fu5JQTMyX0SJswckDK
 e0i5jYvNNjHvyWTqNXWPeIub6dU+fRVL1jswvQksKgCS8hCamq/Uo5Bih
 glE1xsZoYQTJcyMjrOVRRPg0puAGeb5/8tczjCXCVCRRToRf74y2jKgMG A==;
X-CSE-ConnectionGUID: zg6ZB716T5CBaX8mroux3g==
X-CSE-MsgGUID: kY5uvCiQSQuUBue1n7nSdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64632089"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="64632089"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 01:40:43 -0700
X-CSE-ConnectionGUID: XKDE3W35SwujPbYVjd8zjw==
X-CSE-MsgGUID: VwrBqyGCSGWPm84Pj0y6EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="176815206"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.144])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 01:40:41 -0700
Date: Wed, 24 Sep 2025 11:40:38 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH 1/2] drm/xe: Fix ggtt fb alignment
Message-ID: <aNOufDMgXkR6AU-r@intel.com>
References: <20250924081304.10098-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250924081304.10098-1-tvrtko.ursulin@igalia.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Sep 24, 2025 at 09:13:03AM +0100, Tvrtko Ursulin wrote:
> Pass the correct alignment from intel_fb_pin_to_ggtt() down to
> __xe_pin_fb_vma().

Just to elaborate a bit, "phys_alignment" is only a thing on
some gen2/3 platforms where the display cursor hardware doesn't
go through GGTT translation and instead takes a direct physical
address instead.

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 1fd4a815e784..b18d15cc3c53 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -378,7 +378,7 @@ intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
>  {
>  	*out_flags = 0;
>  
> -	return __xe_pin_fb_vma(to_intel_framebuffer(fb), view, phys_alignment);
> +	return __xe_pin_fb_vma(to_intel_framebuffer(fb), view, alignment);
>  }
>  
>  void intel_fb_unpin_vma(struct i915_vma *vma, unsigned long flags)
> -- 
> 2.48.0

-- 
Ville Syrjälä
Intel
