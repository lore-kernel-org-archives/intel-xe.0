Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD4ACD37B6
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 08:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DBE10ED51;
	Wed, 13 May 2026 08:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWJaFar1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A38F10ED40;
 Wed, 13 May 2026 08:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778661027; x=1810197027;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qq+Ce1PoqniokqJPSPCGeo9EnyqHwEk3knNja4t8XFI=;
 b=VWJaFar19ygaUm4S1K39HSn8z+jv1iULIc7H3Q179Ls0Kq3xj785Iy0X
 pGEBFq9PZFqqJY+nv8yy0JR6BZzAdbFsWkfln9m6ceqmTfLvMi3jYf74y
 edBW1OHHEYwGeRTMcOazUMJo+vBokMGRrBQzTeKFg6gIXRjCpN2jo6DU0
 XaA3/cUGAObCanc882E7uvSn3gyaWHi2fZUTG9DvjHjlFq1FG2r8TCy3z
 WNw8kjzujUJiFyRBajXrbGpnostSq0Knoh3dkZLg2oDkvXBcUAwUwc+EX
 qDaw0lIw3HrfVx1LFTUU8VxjqODRDkC6x7iRSZF/Q56uMQGXCyUhHEOyt Q==;
X-CSE-ConnectionGUID: cNCMMR58R165I6ZZP1ZwtQ==
X-CSE-MsgGUID: Mo2wJ3e4TsaEab/1kxQSXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79694828"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79694828"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:30:27 -0700
X-CSE-ConnectionGUID: MUO9wdgsSDqK0fPW41wZgA==
X-CSE-MsgGUID: MKPpETyDT2+GoHTPQTAb7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="242373496"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.61])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:30:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, Suraj Kandpal
 <suraj.kandpal@intel.com>
Subject: Re: [PATCH] drm/i915/backlight: Sanitize BIOS-enabled PCH PWM in
 full-AUX VESA path
In-Reply-To: <20260513080819.849479-1-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260513080819.849479-1-suraj.kandpal@intel.com>
Date: Wed, 13 May 2026 11:30:21 +0300
Message-ID: <b21c1fc24b8f87958183f360b3d2cd4d9986875b@intel.com>
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

On Wed, 13 May 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> In full-AUX VESA mode (aux_enable && aux_set) the driver never touches
> the native PCH PWM. If BIOS left PWM CTL register enabled, the PCH PWM
> keeps system alive during s2idle and blocks S0ix.
> Always run pwm_funcs->setup() so pwm_enabled reflects real HW state,
> and on first enable in full-AUX mode call pwm_funcs->disable() once to
> clear the stale bit. Runtime behaviour is otherwise unchanged.
>
> Fixes: 40d2f5820951 ("drm/i915/backlight: Remove try_vesa_interface")
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c | 32 +++++++++++++------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index a8d56ebf06a2..c828c568fb8b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -496,6 +496,17 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>  	struct intel_panel *panel = &connector->panel;
>  	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
>  
> +	/*
> +	 * In full AUX VESA mode the native PWM is never driven by us. If BIOS
> +	 * left it enabled, the PCH PWM keeps the system alive and blocks
> +	 * S0ix. Sanitize it once via pwm_funcs->disable.
> +	 */
> +	if (panel->backlight.edp.vesa.info.aux_enable &&
> +	    panel->backlight.edp.vesa.info.aux_set &&
> +	    panel->backlight.pwm_enabled)
> +		panel->backlight.pwm_funcs->disable(conn_state,
> +						    intel_backlight_invert_pwm_level(connector, 0));
> +
>  	if (!(panel->backlight.edp.vesa.info.aux_enable ||
>  	      panel->backlight.edp.vesa.info.luminance_set)) {
>  		u32 pwm_level;
> @@ -558,15 +569,18 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
>  				    panel->backlight.edp.vesa.info.luminance_set),
>  		    backlight_unit_str(panel));
>  
> -	if (!panel->backlight.edp.vesa.info.aux_set ||
> -	    !panel->backlight.edp.vesa.info.aux_enable) {
> -		ret = panel->backlight.pwm_funcs->setup(connector, pipe);
> -		if (ret < 0) {
> -			drm_err(display->drm,
> -				"[CONNECTOR:%d:%s] Failed to setup PWM backlight controls for eDP backlight: %d\n",
> -				connector->base.base.id, connector->base.name, ret);
> -			return ret;
> -		}
> +	/*
> +	 * Always probe the native PWM HW state so panel->backlight.pwm_enabled
> +	 * reflects what BIOS left behind. Required for the full-AUX VESA path
> +	 * to detect and sanitize a BIOS-enabled PCH PWM that would otherwise
> +	 * block S0ix.
> +	 */
> +	ret = panel->backlight.pwm_funcs->setup(connector, pipe);

This will log something like "Using native PWM for backlight control" in
dmesg, which is going to be wildly confusing for AUX backlight.

BR,
Jani.

> +	if (ret < 0) {
> +		drm_err(display->drm,
> +			"[CONNECTOR:%d:%s] Failed to setup PWM backlight controls for eDP backlight: %d\n",
> +			connector->base.base.id, connector->base.name, ret);
> +		return ret;
>  	}
>  
>  	if (panel->backlight.edp.vesa.info.luminance_set) {

-- 
Jani Nikula, Intel
