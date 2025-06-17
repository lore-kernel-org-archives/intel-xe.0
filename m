Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE5BC71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 16:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8DA10E770;
	Tue, 17 Jun 2025 16:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3kessdQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDD810E770
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 16:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750178162; x=1781714162;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FBAKlOOFPmiolYsah1Z4Ano13mnn3095yiYZR8JofY8=;
 b=T3kessdQiEC7yw8KBjjHocrOWD1ZB065Od0iQccehI3DQ4JvoLk8FJGK
 XKrOCq2Fk3xyrnJhcVqgxUsRM3a8med+r/irj6d59zjZK6FFXar1scFai
 rW92Y+fw42QxD34P7Vxz0HVZCfOmjtCCBNTT/hEHzymO73s1ask2Ez0Iy
 V8kZooU0SWeqCGTFMPwFxnHO2m3PQacuHmF+1yhKnz/0ckwaVuOUGMVaC
 4gQZ9Dcmf3EtUTSvsLT8nxThxlGeaEu1X3UdhnmOHIiA+6owMGZfFfhce
 SLH6eLAYRJt6NgUCCfDAqNsRExMbjMGxxy6CT6HAo18SSx9t1P8KHIC9t Q==;
X-CSE-ConnectionGUID: uNFy/v1OSE2BgfgjEp6a0w==
X-CSE-MsgGUID: 2O/tX8oRTdysU8q3BHevBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52459747"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52459747"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 09:36:01 -0700
X-CSE-ConnectionGUID: T34IydxeSHOmOFcldUg8AQ==
X-CSE-MsgGUID: 2E3G0PuDTNmH0IQIpYm4Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="154127432"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.184])
 by orviesa005.jf.intel.com with SMTP; 17 Jun 2025 09:35:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 17 Jun 2025 19:35:57 +0300
Date: Tue, 17 Jun 2025 19:35:57 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/xe: move DPT l2 flush to a more sensible place
Message-ID: <aFGZbTtnwatIdUSR@intel.com>
References: <20250606104546.1996818-3-matthew.auld@intel.com>
 <20250606104546.1996818-4-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606104546.1996818-4-matthew.auld@intel.com>
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

On Fri, Jun 06, 2025 at 11:45:48AM +0100, Matthew Auld wrote:
> Only need the flush for DPT host updates here. Normal GGTT updates don't
> need special flush.
> 
> Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.12+

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 461ecdfdb742..b16a6e3ff4b4 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -165,6 +165,9 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  
>  	vma->dpt = dpt;
>  	vma->node = dpt->ggtt_node[tile0->id];
> +
> +	/* Ensure DPT writes are flushed */
> +	xe_device_l2_flush(xe);
>  	return 0;
>  }
>  
> @@ -334,8 +337,6 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  	if (ret)
>  		goto err_unpin;
>  
> -	/* Ensure DPT writes are flushed */
> -	xe_device_l2_flush(xe);
>  	return vma;
>  
>  err_unpin:
> -- 
> 2.49.0

-- 
Ville Syrjälä
Intel
