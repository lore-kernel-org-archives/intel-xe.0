Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23F8C54E41
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 12:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B39210E2CC;
	Thu, 29 Feb 2024 12:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d+GteZQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F92210E2CC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 12:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709209620; x=1740745620;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=CHW8bvX7EhWyRJLhHofrInxMECBJp9h21NpeTJFpSqU=;
 b=d+GteZQNIUgGOm9DmBuqw5DxQmAc9Fjz2r7T8zXztKv3UWvTmm9tLCEQ
 hKhgayDKL+SUjrdkawy7BhOtRxAM4oRQWrxMScisFbm9GXO+sZ+roNtX3
 98vyxpA3tECWVze0r+g5fTowSsZwbSGZYdeLsJ8pYV6k5AIzHcpTZqbA0
 B1k/7qb1YG7HvS5Hq69EQFsR+354/2p+ydP1WPcjau/hIUPjXFyCGGD+D
 YKnIg1VXaubqPWNam3d8023ogzxjk5SWRITlf1Njo0i0WHhkERS/AnDDQ
 bkgNFCbvO2tFbmzlvjalMDIQv9GxxXO0jlxyXOQG+AVHXfRBIuIgN0KxM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3840426"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3840426"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 04:27:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12422780"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 04:26:58 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, shekhar.chauhan@intel.com
Subject: Re: [PATCH] drm/i915/lnl: Modeset sequence change for DP on LNL
In-Reply-To: <20240228161144.648776-1-shekhar.chauhan@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240228161144.648776-1-shekhar.chauhan@intel.com>
Date: Thu, 29 Feb 2024 14:26:55 +0200
Message-ID: <878r338nhs.fsf@intel.com>
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

On Wed, 28 Feb 2024, Shekhar Chauhan <shekhar.chauhan@intel.com> wrote:
> Currently, the driver is only waiting for 1ms for
> idle patterns. But starting from LNL and beyond,
> the MST wants the driver to wait for 1640us before
> timing out (which we round up to 2ms).

The change is not specific to LNL, so the subject should not claim
so. Moreover, "modeset sequence change" is extremely vague. Need to be
more specific. Something like:

"drm/i915/dp: increase idle done wait timeout to 2 ms"

And then the commit message would have the rationale about LNL, and why
it makes sense to bump the timeout also for non-LNL DDI platforms
instead of just LNL and later.

The change itself looks fine. But we merge hundreds of patches per
release, and the commit messages absolutely need to accurately describe
what's being done and why.


BR,
Jani.


>
> BSpec: 68849
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index bea441590204..05ba3642d486 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3680,7 +3680,7 @@ static void intel_ddi_set_idle_link_train(struct intel_dp *intel_dp,
>  
>  	if (intel_de_wait_for_set(dev_priv,
>  				  dp_tp_status_reg(encoder, crtc_state),
> -				  DP_TP_STATUS_IDLE_DONE, 1))
> +				  DP_TP_STATUS_IDLE_DONE, 2))
>  		drm_err(&dev_priv->drm,
>  			"Timed out waiting for DP idle patterns\n");
>  }

-- 
Jani Nikula, Intel
