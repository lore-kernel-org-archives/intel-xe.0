Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822A8FED2EB
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FF610EA0F;
	Thu, 12 Mar 2026 08:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKDiY6yY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3302010EA0D;
 Thu, 12 Mar 2026 08:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773304418; x=1804840418;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Pk/ja1vj6vKNwOOhnypWNEs6DTmoYIH7bYhmf+LGatc=;
 b=AKDiY6yYfs9zGTK0QcA6gzMxJ2qunCykn8nYEcGup7/B12QFKzLlaqLt
 CliG318St5QupyZVg8nRNwlQ/aW/9b8BGC+1b28v1u1M9Ez8du9B7ll1U
 N8j1qEgIQqxY97yD3N/hsmzxOG2Gt0oi7e8+g1DJME4OSz3UxXMzMOno3
 kqmGZHUUw0S5chqQT0QBFNdD7g8gfhuDGvLN2Si7NslAX08xQHZM/4idB
 j7FCjjE60diGDPjvLnKmTqDOHZpqCZ6bR/Joai0d/5Ea7aLw3feQe0xAq
 Sizj+RdGSd7tdIRGnWcE77RRhKzW5/ahCAJyL43qXS4PESjdab2dHMcU+ w==;
X-CSE-ConnectionGUID: QjKr7LUYSqGtUJ4fZT6l2g==
X-CSE-MsgGUID: npzrW8gHSJ6UBRyt72RFYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74503988"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74503988"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:33:38 -0700
X-CSE-ConnectionGUID: tnCDOtjfSKCHWMPYwjvnRQ==
X-CSE-MsgGUID: Qe+9QiuMRAmXFB9ch4xVOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="220014339"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.126])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:33:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/display: fail compilation on
 intel_display_wa() with invalid enums
In-Reply-To: <20260312081647.1083777-1-luciano.coelho@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260312081647.1083777-1-luciano.coelho@intel.com>
Date: Thu, 12 Mar 2026 10:33:32 +0200
Message-ID: <a7361eb05a3162ccd24d87b0ad77f8702ae0bfb1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 12 Mar 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> In a previous commit, the intel_display_wa() was changed so it
> wouldn't receive an integer as the workaround number, but the enum
> value itself.  This caused compilation not to fail anymore when the
> enum passed didn't exist.
>
> Bring this back by using BUILD_BUG_ON() to check that the enum passed
> sits within the range of defined enums.
>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_wa.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
> index 15fec843f15e..4239e4295ec7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
> @@ -60,11 +60,14 @@ enum intel_display_wa {
>  	INTEL_DISPLAY_WA_22012358565,
>  	INTEL_DISPLAY_WA_22014263786,
>  	INTEL_DISPLAY_WA_22021048059,
> +
> +	INTEL_DISPLAY_WA_COUNT
>  };
>  
>  bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa, const char *name);
>  
> -#define intel_display_wa(__display, __wa) \
> -	__intel_display_wa((__display), __wa, __stringify(__wa))
> -
> +#define intel_display_wa(__display, __wa) ({				  \
> +		BUILD_BUG_ON(__wa >= INTEL_DISPLAY_WA_COUNT);		  \
> +		__intel_display_wa((__display), __wa, __stringify(__wa)); \
> +	})
>  #endif

I'm not sure if this is worth it to be honest. We'll get the runtime
warn anyway.

BR,
Jani.


-- 
Jani Nikula, Intel
