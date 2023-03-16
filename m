Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4433BC6FD19
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 13:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED5A10E0E7;
	Thu, 16 Mar 2023 13:07:02 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D780010E0E7
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 13:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678972019; x=1710508019;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=ffAR85/jQhwptF0HWGq8If6iKqlI7ttxj6yy6kFK93E=;
 b=C+xK1vnscZDQ4Z+YEbnM4e1fyuqNyGVfvGBfWNNfaCHuUNEkYg0pu5g/
 aCrg6P07Ynl1fI5VyC0t1z4T//OzDyEuGiDLDw2x6GGF+qA2ISsBIhdzL
 mdqx4ZNv3H8SfhFnpOOSnHdjDNxql8H7uSh0Ok+lrG+yFDlWt1sHPEBjA
 rqp6WYmGnIXTrYTu6a6K9VVBGSKh5gq3Bl95GxatYAdlmHMMFIv6FYof0
 02CkpMP0lJIBqS2kL4RSZSbCqu0p+g+Z8egFB3JIX8tepABfzTvFh8R3P
 qhXHoDuBBxrVrQuG5gGf7+fSL9GMiiDjeh0wz4A4pcAx1oTf9PiZnHSNz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="424254126"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="424254126"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 06:05:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="748861821"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="748861821"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.158])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 06:05:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230316110752.129831-1-maarten.lankhorst@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230316110752.129831-1-maarten.lankhorst@linux.intel.com>
Date: Thu, 16 Mar 2023 15:05:42 +0200
Message-ID: <87mt4calsp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix Alderlake-P and DG2 display info
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

On Thu, 16 Mar 2023, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> DG2 has cdclk squash, without which we calculate the CDCLK wrongly.
> Alderlake-P is LPD, not gen 12 display.
>
> With those fixed, display should work on both and all problems that were
> uncovered by testing done from rebasing are fixed.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_display.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index f28553be858d..54ec8ba5d3f3 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -482,19 +482,27 @@ void xe_display_info_init(struct xe_device *xe)
>  		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
>  		break;
>  	case XE_ALDERLAKE_S:
> -	case XE_ALDERLAKE_P:
>  		xe->info.display = (struct xe_device_display_info) {
>  			GEN12_DISPLAY,
>  			.has_hti = 1,
>  			.has_psr_hw_tracking = 0,
>  		};
>  		break;
> +	case XE_ALDERLAKE_P:
> +		xe->info.display = (struct xe_device_display_info) {

All of these should probably have const in them to ensure the compound
literals are put in rodata.

BR,
Jani.

> +			XE_LPD,
> +			.has_cdclk_crawl = 1,
> +			.has_modular_fia = 1,
> +			.has_psr_hw_tracking = 0,
> +		};
> +		break;
>  	case XE_DG2:
>  		xe->info.display = (struct xe_device_display_info) {
>  			XE_LPD,
>  			.cpu_transcoder_mask =
>  				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
>  				BIT(TRANSCODER_C) | BIT(TRANSCODER_D),
> +			.has_cdclk_squash = 1,
>  		};
>  		break;
>  	case XE_METEORLAKE:

-- 
Jani Nikula, Intel Open Source Graphics Center
