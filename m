Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACE3CD4851
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 12:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6194F10EC91;
	Tue, 19 May 2026 12:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqWTbhyg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B68410EC8A;
 Tue, 19 May 2026 12:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779192488; x=1810728488;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+TdQXa89xsRgqCZiFifMt3f4IuRto/T3QE+HBhF4jts=;
 b=MqWTbhygIdMvzLgpEDvF0krWBTj8ZtA5LnxVFuV3rLMOR0X18bTphxTQ
 EPVCqRcgh4mNgPtSTY4dalIDon8lQCn9QcEPtUJ+riClN3PG8pHGKS9wm
 W7zI70W+tL0WbuAE4yjlApUGtMDZ92lk5+FXkjS4n+FEtcc4fR49Idayu
 45zXR1NaMd85jwH6qekJyfSq+Kkf3KoCWZFo+AGlMHON/GzNFbmOjZhJA
 cv4AfYVK6STUog+VzOYg1Q27S+dUZvolAzTHH0O0v2uEC+aWzdv0EkwSY
 eBof3pKhGDwP+txJ2bqKfOfzCHQIWjGBiS0UDDW7mtRtc1Irmt3L72TC9 w==;
X-CSE-ConnectionGUID: +KUntNtWRWGfcK9B5yNhOQ==
X-CSE-MsgGUID: dl+H0irxS8+6HuzRGc/94g==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91461180"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="91461180"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:08:08 -0700
X-CSE-ConnectionGUID: /J7D7pRTR/qCkpW9YaTlFw==
X-CSE-MsgGUID: mCVFx83YRrW+RjSZ5c4nKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="263256018"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.218])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:08:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/i915/display: harden shift in
 intel_pmdemand_update_phys_mask()
In-Reply-To: <20260519112243.1454375-5-luciano.coelho@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260519112243.1454375-1-luciano.coelho@intel.com>
 <20260519112243.1454375-5-luciano.coelho@intel.com>
Date: Tue, 19 May 2026 15:08:04 +0300
Message-ID: <6162483ab91a8d80f313b4668c105a9afbd3fa61@intel.com>
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

On Tue, 19 May 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> BIT() takes a non-negative shift amount, but phy is of type enum phy,
> which can in theory be PHY_NONE (-1).
>
> This is not a problem with the current implementation, because phy is
> always valid when this code is reached (Type-C encoders are rejected
> earlier), but it's more robust to store it as unsigned int so the
> shifts are always well-defined.
>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_pmdemand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_pmdemand.c b/drivers/gpu/drm/i915/display/intel_pmdemand.c
> index 7819b724795b..d02ac2408e29 100644
> --- a/drivers/gpu/drm/i915/display/intel_pmdemand.c
> +++ b/drivers/gpu/drm/i915/display/intel_pmdemand.c
> @@ -150,7 +150,7 @@ intel_pmdemand_update_phys_mask(struct intel_display *display,
>  				struct intel_pmdemand_state *pmdemand_state,
>  				bool set_bit)
>  {
> -	enum phy phy;
> +	unsigned int phy;

I think it's useful to keep the enum here. That's the type.

I also don't believe in using unsigned types to enforce something is
positive, because this just turns -1 into 4294967295, which isn't better
at all.

I'd rather see a (redundant and silly) assert for phy being >= 0 than
using this trick to enforce it's >= 0.

But let's take a step back instead.

Look at all the places that reference PHY_NONE. Looks like
icl_aux_pw_to_phy() is the only place that actually uses PHY_NONE, and
all the other places are there just to work around the fact that
theoretically phy might be < 0. Which is never. And the return value of
icl_aux_pw_to_phy() is never even checked, it's just passed directly to
phy_name().

Maybe the solution is to just open code icl_aux_pw_to_phy(), handling
encoder being NULL inline, and nuke PHY_NONE and the checks for PHY_NONE
altogether?

*shrug*

BR,
Jani.





>  
>  	if (DISPLAY_VER(display) < 14)
>  		return;

-- 
Jani Nikula, Intel
