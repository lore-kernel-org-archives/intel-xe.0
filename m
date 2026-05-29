Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06A7CD4F54
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 13:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E95710FF02;
	Fri, 29 May 2026 13:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4XCSs+A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EBB10FF05;
 Fri, 29 May 2026 13:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780060716; x=1811596716;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PNmBsjgBeiXTGX10VDO/DBMcYyOt3fsBAr/ikiNizME=;
 b=G4XCSs+AQk2WHA+jBBrhgMLy34gIyi2zxF9/F5T1NJi+HvgN2xGMKbJX
 sl5MDHTjj+6eMjGQqAoeLPe58GDSQB3z0dGS4HottV4wd7nR6bnaijmkn
 AOiibwxndJs3BKGqzMRDTHMAKSN2jLjiRPQQyiRPMFWpgDmGFu7hFWQWo
 Xt/XokSnHZSzCEqOzcNmggmbP6D61dAadyiMDs+73OJ3eRbsK+cdXxWgo
 JqWzRikpK+Q8ItqyGQMVxIGxZRtZpcr2QlWGx4HULqVi/57skBaZ6LvMj
 kyUww8yZXvN55G+GMKdRdCalTry1Qfi3eLK3w6BX1aVIlkMZDzy0fkm0W Q==;
X-CSE-ConnectionGUID: it6bQLAWSyaYpp+8hqJIVg==
X-CSE-MsgGUID: QFGQTzwVR2mOAVKTr+eOMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="84798721"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="84798721"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 06:18:35 -0700
X-CSE-ConnectionGUID: Grl2ao7HSseQsAZFS3Lwcw==
X-CSE-MsgGUID: ttnXSKxZTleBScao3KP+sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="247939210"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.182])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 06:18:34 -0700
Date: Fri, 29 May 2026 16:18:31 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 imre.deak@intel.com
Subject: Re: [PATCH 05/24] drm/xe/display: drop duplicate
 intel_dp_mst_suspend() call
Message-ID: <ahmSJ3g5y6-eJFca@intel.com>
References: <cover.1780051905.git.jani.nikula@intel.com>
 <fdb44e0cc7503e19703aa787ba382147e2df598b.1780051905.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdb44e0cc7503e19703aa787ba382147e2df598b.1780051905.git.jani.nikula@intel.com>
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

On Fri, May 29, 2026 at 02:03:49PM +0300, Jani Nikula wrote:
> intel_display_driver_suspend() already calls
> intel_dp_mst_suspend(). Remove the duplicate call.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 6e82dc70ca89..8d55e7a37d6d 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -342,7 +342,6 @@ void xe_display_pm_shutdown(struct xe_device *xe)
>  		intel_display_driver_suspend(display);
>  	}
>  
> -	intel_dp_mst_suspend(display);
>  	intel_encoder_block_all_hpds(display);
>  	intel_hpd_cancel_work(display);
>  
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
