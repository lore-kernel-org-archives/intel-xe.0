Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C15F588C2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 12:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E1910E578;
	Mon, 20 Apr 2026 12:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ki2976Bt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FD410E577;
 Mon, 20 Apr 2026 12:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776687694; x=1808223694;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DjzL7EauobtA91BturUNZHGyatOal6RjPhB5L7czBKY=;
 b=Ki2976BtbJZ+epF13seo45op0n393X1yYkSr6Z0s9qzgKV9ntWScUNKP
 RSPzzRDeIDkysYVCWK5Mt5pbKc1GZywxWtsb5SpdxxgeJ0qiOPXjqlfbV
 Mw4DOPgO3CyRJ/IsCP2BzT4GDK2gWU1+OqwyAovs1HmPDWaO46d21Z9lU
 5MrE8duvdMppboSxViyyY5Ukz5YJjZIc+trAeScKd/8CLdfrtwn4FR7O+
 JKso3OSe9pzj2zmfp+ZAP8T5WlFOZRG/a41Ip4X2vj7YLRCJWlPEmT7ue
 OqeGcmd89QMqviZTITNb6fkvFOo2cA49F5MUyGqfxeNskXyNSkGmrEEsd g==;
X-CSE-ConnectionGUID: I/kMtVhhR8uyrc+eVP3Kkw==
X-CSE-MsgGUID: JicMUa7cSaG7LwYAxdPT1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88674957"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="88674957"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 05:21:33 -0700
X-CSE-ConnectionGUID: pgsluQPUQpmjpzimQq3KDg==
X-CSE-MsgGUID: mOg5ka8SSliIOVw6+th2nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="236082343"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 05:21:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [PATCH v3 8/8] drm/i915: remove HAS_PCH_NOP() dependency from
 clock gating
In-Reply-To: <20260420103705.3453499-9-luciano.coelho@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260420103705.3453499-1-luciano.coelho@intel.com>
 <20260420103705.3453499-9-luciano.coelho@intel.com>
Date: Mon, 20 Apr 2026 15:21:28 +0300
Message-ID: <198b43cfbace2bc2746bee69ca55f2dc2f37e066@intel.com>
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

On Mon, 20 Apr 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> intel_pch_init_clock_gating() already handles unsupported PCH types,
> including PCH_NOP, by doing nothing.
>
> Drop the explicit HAS_PCH_NOP() check from the IVB clock gating
> path and always call the display helper directly.  This removes one
> more direct dependency on display-side PCH macros from
> intel_clock_gating.c.
>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_clock_gating.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
> index 12559db84cf4..d185199c43b8 100644
> --- a/drivers/gpu/drm/i915/intel_clock_gating.c
> +++ b/drivers/gpu/drm/i915/intel_clock_gating.c
> @@ -290,8 +290,7 @@ static void ivb_init_clock_gating(struct drm_i915_private *i915)
>  	intel_uncore_rmw(&i915->uncore, GEN6_MBCUNIT_SNPCR, GEN6_MBC_SNPCR_MASK,
>  			 GEN6_MBC_SNPCR_MED);
>  
> -	if (!HAS_PCH_NOP(display))
> -		intel_pch_init_clock_gating(display);
> +	intel_pch_init_clock_gating(display);

With this, you could also do

 -#include "display/intel_display_core.h"
 +#include "display/intel_pch.h"

BR,
Jani.


>  
>  	gen6_check_mch_setup(i915);
>  }

-- 
Jani Nikula, Intel
