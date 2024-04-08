Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56F2CD1296
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 15:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D768112703;
	Mon,  8 Apr 2024 15:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmNZlOmU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCCF112703
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 15:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712590221; x=1744126221;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3AG57JrGDCZg9jSeCqR5x3xvbcF5VrPTwAYoqDRY8ec=;
 b=lmNZlOmUyoWaFiPuC3vnoiINeTyxadDl/TAch87W6M4TwkVqSDUOLe9S
 OoYWJwIQ8mUWthj1Plm92rpa0ouiUxxGJtiF47eNKijXOFbjK0rRimfE/
 Dk7Zz6ZO1Tk4sinQGnkgBUZkDW39P45ayA1Ijm5jgXjEX0xocrcwOX9fw
 HcPPuIp2swhX8P3buMP7V4XvetsP9s5tPecG3fGD3fhLbR28GntUxxuWj
 pz3vARk6io47xgE8c1xsPEOr5MwIk90JvSXvuULgQan3D/dae8K6embNX
 CM0TmAhFa0evHYP8B6jzFqPTurAxf/IDNOuWteECVjNYimNxfc1zx/bBB g==;
X-CSE-ConnectionGUID: B46iWl3UTeGXmnfxaK6JSg==
X-CSE-MsgGUID: bki4ZMNrTYuWVwPcZN9c5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19017227"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19017227"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 08:30:21 -0700
X-CSE-ConnectionGUID: MiszcSZqRK6sEmj8tNx6/g==
X-CSE-MsgGUID: ETxbQXFXQa267bIWwBIWgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24619088"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 08:30:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Remove dead clock code
In-Reply-To: <20240408151312.2100304-1-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240408151312.2100304-1-lucas.demarchi@intel.com>
Date: Mon, 08 Apr 2024 18:30:15 +0300
Message-ID: <87a5m3an3s.fsf@intel.com>
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

On Mon, 08 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> xe_gt_clock_cycles_to_ns() is not called from anywhere after PMU
> handling was removed in commit 90a8b23f9b85 ("drm/xe/pmu: Remove PMU
> from Xe till uapi is finalized"). Drop it.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_clock.c | 5 -----
>  drivers/gpu/drm/xe/xe_gt_clock.h | 2 +-
>  2 files changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index 937054e31d72..c7bca20f6b65 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -78,8 +78,3 @@ int xe_gt_clock_init(struct xe_gt *gt)
>  	gt->info.reference_clock = freq;
>  	return 0;
>  }
> -
> -u64 xe_gt_clock_cycles_to_ns(const struct xe_gt *gt, u64 count)
> -{
> -	return DIV_ROUND_CLOSEST_ULL(count * NSEC_PER_SEC, gt->info.reference_clock);
> -}
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_clock.h
> index aa162722f859..44fa0371b973 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.h
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.h
> @@ -11,5 +11,5 @@
>  struct xe_gt;
>  
>  int xe_gt_clock_init(struct xe_gt *gt);
> -u64 xe_gt_clock_cycles_to_ns(const struct xe_gt *gt, u64 count);
> +
>  #endif

-- 
Jani Nikula, Intel
