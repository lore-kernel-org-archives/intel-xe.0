Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2F7D6AAFD
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 19:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E78610F2FF;
	Thu,  2 Apr 2026 19:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fed6s5Z3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2825310F2FF;
 Thu,  2 Apr 2026 19:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775157540; x=1806693540;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=K0EH3p790L4SS7UFbkgUOsoKCehhJ8lERCfHu7Yb9J4=;
 b=fed6s5Z3Wdxzldy1MsvYIM6rVs0WEKf03GeDDzXGNz3FduNyods+6oXM
 LaLJ0m5vh+DmxD9pEyToz03n9AW+dXCJjJ3txfh9shVLR7OuzTvpscdRP
 hf/d8i5MuS034O6mrYVAN0bMV6Baslbwy8jvRMnKepG+2IwXLhfjGFK05
 is0PYCZnbJG7icW3XiSrTFn7PnT2OaBYR9MeWlN40aXBGgbjaPWwLEofO
 g6sAF+EUy+Oa+733J9TBKG+I7TfdznylJg1N1oEhnisT1BtmzX4GDT9QF
 vCfk3QVeG/bzpEA9jpYKW4iKhglk8n9WqddrH0O2tu6egsU+7T3Xzs0QS Q==;
X-CSE-ConnectionGUID: +MoorJliTQS3Y63FJTrDOQ==
X-CSE-MsgGUID: UIVcOObkSqmPaJikCr0lRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75396066"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="75396066"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:19:00 -0700
X-CSE-ConnectionGUID: cFtNdsusQgeuLUSzSwdDdQ==
X-CSE-MsgGUID: RLs9mavNTviK/zGpXLAezQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="231867574"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:58 -0700
Date: Thu, 2 Apr 2026 22:18:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ankit.k.nautiyal@intel.com
Subject: Re: [PATCH] drm/i915/backlight: Fix VESA backlight possible check
 condition
Message-ID: <ac7BHyT8VI1vEMQv@intel.com>
References: <20260401034332.1321585-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260401034332.1321585-1-suraj.kandpal@intel.com>
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

On Wed, Apr 01, 2026 at 09:13:32AM +0530, Suraj Kandpal wrote:
> VESA backlight is possible through AUX only when
> BACKLIGHT_AUX_ENABLE_CAPABLE is true or when we use BL_ENABLE bit
> to enable backlight. Since that is not implemented we need to make
> sure we do not try to manipulate backlight when
> BACKLIGHT_AUX_ENABLE_CAPABLE is not set.
> Also fix return value when condition is not fulfilled.
> 
> Fixes: 40d2f5820951 ("drm/i915/backlight: Remove try_vesa_interface")
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Appears to work.
Tested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

I filed a bug with a dump of all platform information, mainly for posterity:
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/15907

> ---
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index d0c76632a946..138d5b5e5482 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -615,8 +615,9 @@ check_if_vesa_backlight_possible(struct intel_dp *intel_dp)
>  	int ret;
>  	u8 bit_min, bit_max;
>  
> -	if (!(intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP))
> -		return true;
> +	if (!(intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP &&
> +	      intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP))
> +		return false;
>  
>  	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &bit_min);
>  	if (ret < 0)
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
