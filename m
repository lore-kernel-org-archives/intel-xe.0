Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA6EC3601A
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 15:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1055E10E274;
	Fri,  4 Apr 2025 15:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TipjXeKT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B5110E03A
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Apr 2025 15:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743781963; x=1775317963;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lKGZF7cRvMnKn8vO4/iwtiMhr98heI19W1ojbSWx6ug=;
 b=TipjXeKTT3cAbpjtoCvGKJf9RbuP7kVG+oYUaOYoagCrSTuEfG97jeVU
 8oZiUSnNuV4xjUplsYBzSdDCfxwYychjj/LkSkMPe5KXEWrdgDhL8rsVo
 eLfzXnkykIU5DJq0N6a29rItik+S0/Hjyl7upC7Rr8pU1c5UohoIsrBRK
 BCltu9OK6rS1TEH6qR8r6CXfDxChWhJphvYpJyKc7OPaj+DxPrxweUQL4
 xdDUTmOASMNDvlfBywj55YjFgNTd6EfGiq6ROqLWQD/zkIqRMjzhSlqzW
 DTkhXNOpOlm/7LYfUWTTey3u6Pu0N3wT8ipu7xLPLHy1CsImnHJs9L5qt g==;
X-CSE-ConnectionGUID: 4y3h9rg8R1GlHPJ/gzU56w==
X-CSE-MsgGUID: fnCY7/vYQ2Gs1KQAnIwjTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="48877363"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="48877363"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 08:52:42 -0700
X-CSE-ConnectionGUID: PBU8jx/1QUigYRsSKB49fw==
X-CSE-MsgGUID: zo/NgMf2Q4SKlSfx/zuvTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="132549063"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 04 Apr 2025 08:52:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Apr 2025 18:52:39 +0300
Date: Fri, 4 Apr 2025 18:52:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v5 11/16] drm/xe: Reduce DPT table alignment as in i915
Message-ID: <Z_AAR1-AZ5K5ItEn@intel.com>
References: <20250403190317.6064-1-tvrtko.ursulin@igalia.com>
 <20250403190317.6064-12-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403190317.6064-12-tvrtko.ursulin@igalia.com>
X-Patchwork-Hint: comment
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

On Thu, Apr 03, 2025 at 08:03:11PM +0100, Tvrtko Ursulin wrote:
> There is some magic going on with DPT alignment values which are

The "magic" is just that we define the alignment in terms of the DPT
address space, and to translate that back into the GGTT address space
we just divide by 512 (page size / PTE size).

This does look to be interestin in the GGTT alignment so this looks
correct to me.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> multiplied by 512, and then for specifically pinning the DPT table
> scaled back down.
> 
> Make xe do it in the same way as i915.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 1538e2b02f89..1ccb4e563bba 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -327,7 +327,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  
>  	vma->bo = bo;
>  	if (intel_fb_uses_dpt(&fb->base))
> -		ret = __xe_pin_fb_vma_dpt(fb, view, vma, alignment);
> +		ret = __xe_pin_fb_vma_dpt(fb, view, vma, alignment / 512);
>  	else
>  		ret = __xe_pin_fb_vma_ggtt(fb, view, vma,  alignment);
>  	if (ret)
> -- 
> 2.48.0

-- 
Ville Syrjälä
Intel
