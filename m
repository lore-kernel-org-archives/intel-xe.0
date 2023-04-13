Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC284C77B61
	for <intel-xe@archiver.kernel.org>; Thu, 13 Apr 2023 07:17:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE6A10E10A;
	Thu, 13 Apr 2023 07:17:27 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9CF010E10A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Apr 2023 07:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681370245; x=1712906245;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jrTR7Zd7vuALdbLpRj0Ra03jC7G9I5OWc3lokY8Nb0c=;
 b=URzRWSTFqJIl3grHf1IqX6BZnkexo7kFMMKrz3bimJ2m4zqwrpTar09h
 tPbdU/PKDk1rky8rnOZMgsMQXGvHOVBbhpkxu9HaPzlBbcHIPCfOlsUPJ
 5UfUnQ661lBkGQyQSnG0aZowC8EzD/zl1KBsRznnfK9qOPiL0sHYyL8+t
 mdgI4TgEmx0gZUrAoB8SfA0XCDz6YSsoT8oYpO5gltQ3jti1+D+2dUWwN
 KnZF+mO6WXPa+5XfkhLbNxLmKUVaQmwHW7FItqd+ZeXngGSaxOTrtth1E
 yCagTJ8KJhlW/uyI6iHu9XH2fJ/JV9wx8T1LOEOqyT2QbYCHeLV5V7eNL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="344106735"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="344106735"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 00:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="1019062775"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="1019062775"
Received: from svadali-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.55.23])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 00:17:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230412232846.3411883-3-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230412232846.3411883-1-lucas.demarchi@intel.com>
 <20230412232846.3411883-3-lucas.demarchi@intel.com>
Date: Thu, 13 Apr 2023 10:17:21 +0300
Message-ID: <871qkocku6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/6] fixup! drm/i915/display: Remaining
 changes to make xe compile
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 12 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index ed996546edfc..46447dd58f3f 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -165,7 +165,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
>  				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
>  #else
>  	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
> -				    DIV_ROUND_UP(sizes->surface_bpp, 8), GEN8_PAGE_SIZE);
> +				    DIV_ROUND_UP(sizes->surface_bpp, 8), XE_PAGE_SIZE);

Won't that break i915 build?

>  #endif
>  	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
>  							  sizes->surface_depth);

-- 
Jani Nikula, Intel Open Source Graphics Center
