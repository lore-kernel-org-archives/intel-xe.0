Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B59AD12D6F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 15:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF2D10E2ED;
	Mon, 11 Nov 2024 15:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LwLJUdsM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F9010E1EE;
 Mon, 11 Nov 2024 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731339492; x=1762875492;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=g6UfR3/MLM7C2vupAA35pB4LYnOXkFSqXU2FesgmyP0=;
 b=LwLJUdsMr38jN0Ls1K2cgoAC04vByddtgv/ZkHXx6xRGQzewuaCRFo2O
 c4L6RS9UWnMI9VL4iuxQXlHo+7O92oQqi1kYP3A1xMZh2GpOD9cnHaOsy
 ena+g7jf5+XkxOMFGRjGLdQsjY2mG1JlNW5gz0tw8qNaL+foszKVxo6fL
 68YM0syRmiX44OSirgADX02gVMBCnRPIvDa1jXnAA1k7brG4BwKZThld+
 7Rqp8Qpz58BUBDClOwr9ttrYMiR5QR3jb3Qzt3aEAUQ6fy3qnTmoI74bj
 SwWo+PzjzQNbyXvDssBdN/D3oU0r3zXgdwv+JOIwNOQQRSyDgNCv4PpD1 g==;
X-CSE-ConnectionGUID: rDQ4XhEcRMSGnwl2bT6LlA==
X-CSE-MsgGUID: zmGd6T0QTruUb9kVcttK/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="35081614"
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="35081614"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 07:38:12 -0800
X-CSE-ConnectionGUID: 7+6unSdjQfiSDTAVAyWJ6g==
X-CSE-MsgGUID: ChNgTDHzRaGTz0eOU+vWvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="124540152"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 07:38:11 -0800
Date: Mon, 11 Nov 2024 17:38:45 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 1/8] drm/i915/mst: pass primary encoder to primary
 encoder hooks
Message-ID: <ZzIlBfb0VQAqKB-W@ideak-desk.fi.intel.com>
References: <cover.1731011435.git.jani.nikula@intel.com>
 <c14340984c4313d85531f2f31746d79f365a935a.1731011435.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c14340984c4313d85531f2f31746d79f365a935a.1731011435.git.jani.nikula@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 07, 2024 at 10:32:14PM +0200, Jani Nikula wrote:
> Pass the primary encoder to the primary encoder hooks. This is
> pedantically correct, but intel_ddi_post_pll_disable() also works with
> the fake encoder by coincidence.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 13449c85162d..9670a48586ea 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1113,7 +1113,7 @@ static void intel_mst_post_pll_disable_dp(struct intel_atomic_state *state,
>  
>  	if (intel_dp->active_mst_links == 0 &&
>  	    dig_port->base.post_pll_disable)
> -		dig_port->base.post_pll_disable(state, encoder, old_crtc_state, old_conn_state);
> +		dig_port->base.post_pll_disable(state, &dig_port->base, old_crtc_state, old_conn_state);

Yes, this worked only due to enc_to_dig_port() etc., but at the least
this should match the way all the other hooks for primary are called
(which pass the primary encoder):
Reviewed-by: Imre Deak <imre.deak@intel.com>

>  }
>  
>  static void intel_mst_pre_pll_enable_dp(struct intel_atomic_state *state,
> -- 
> 2.39.5
> 
