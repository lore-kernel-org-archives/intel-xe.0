Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91412CD6E4A
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 19:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B431112427;
	Fri, 29 May 2026 19:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i04SZF+d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00ED2112426;
 Fri, 29 May 2026 19:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780081548; x=1811617548;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jl/PjHrl8FeRvZaeMJ54lnbJRrFmOSae6AMlhhNl1jU=;
 b=i04SZF+dc3+hlrckaHW0ACTs+niWaI3mLKKCpLbjDvmVMEJmi0QFAb10
 7MnJj8Y3hPFqRyL+2+WmlmNazwb8bBViBNjg1zveRkNz+QxppkSBnEpO4
 pLroqPRvzXDOy1zeSnlUKSNbTiMegX/ihAkQPVnrxAbrKabEvUUubGbzH
 EP/HhJxyhVc5yN/tMBYlQn/x+9V7JoVuOunOSub5DhwVtg22g9UXqEj79
 EARqEZcs+bKsfr6LQaZBVDUFl91gtHwF+X2gb2/DMRFLBKGa4VvBvb6F5
 KK8hGwybk/jM/Y4q6l+b10dXyGCcsLaeALRkcW8xUwlIKZV1hWjGD819d Q==;
X-CSE-ConnectionGUID: PW5udVK5Q9CRFUEWi6ODVg==
X-CSE-MsgGUID: J/4dpqf2ScCZROlCEtrxpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="91515252"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="91515252"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 12:05:47 -0700
X-CSE-ConnectionGUID: 9QMmICcrT/6pQFMW8eOfMg==
X-CSE-MsgGUID: 1R83buKnQq62tlnKJeU9Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="266557470"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.182])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 12:05:46 -0700
Date: Fri, 29 May 2026 22:05:42 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 imre.deak@intel.com
Subject: Re: [PATCH 23/24] drm/xe/display: separate d3cold handling from
 xe_display_pm_runtime_suspend_late()
Message-ID: <ahnjhi6FKMywQvNS@intel.com>
References: <cover.1780051905.git.jani.nikula@intel.com>
 <5a604a4b846ef69f26586ba00a08961a82990713.1780051905.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a604a4b846ef69f26586ba00a08961a82990713.1780051905.git.jani.nikula@intel.com>
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

On Fri, May 29, 2026 at 02:04:07PM +0300, Jani Nikula wrote:
> Make the special d3cold paths completely separate from the rest of the
> runtime pm calls.
> 
> The intel_dmc_wl_flush_release_work() call right after
> xe_display_pm_suspend_late() might be completely redundant, but this
> avoids any functional changes.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index b153bf9c83d8..0fadc62e1cdd 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -373,8 +373,11 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
>  	if (!xe->info.probe_display)
>  		return;
>  
> -	if (xe->d3cold.allowed)
> +	if (xe->d3cold.allowed) {
>  		xe_display_pm_suspend_late(xe);
> +		intel_dmc_wl_flush_release_work(display);
> +		return;
> +	}
>  
>  	/*
>  	 * If xe_display_pm_suspend_late() is not called, it is likely
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
