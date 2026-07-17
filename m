Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA66C4451C
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 13:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6670E10F55B;
	Fri, 17 Jul 2026 13:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdzeYWFU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B377010F56F;
 Fri, 17 Jul 2026 13:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784293969; x=1815829969;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=gmWtFDPs5++vZ3pxXFWVFXem48+x7VAhL/j8BLSMJ8A=;
 b=gdzeYWFUFqnpUYoMib0wPxEAmQFvD9f/nH8m7Dk0B9C5PQ4BYoF3Kgrc
 p+de0awovmy2SO2jkzv/3swqiNm9W9TJGF3FJeXqhFwT9xiy9jW95JVvN
 BI/cBRQVZK+5qu8Y1+At7nLOS9b+a8w4OI2dOOQT9L+B4IFObd8Smk71K
 bJEfjI5ZJhe2yt8G3CSuUHMxDX8LsVh239z8i4AjkHcCLh7XdpTT3W47a
 HMta+a1o3fgg7siKA51HFa3zI7Vpv9+kKg8cwFXbC426XcXPeyZlViQDF
 8hnubvuNGRaPYOhS9zxfx7B2GS7zDhdvJz+cnYDVh21rutjPgFiAsftc4 Q==;
X-CSE-ConnectionGUID: vZP2VXFKSS+PbAducmdABA==
X-CSE-MsgGUID: CrlOdnhxQNOhbNUcgbEQwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96329194"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="96329194"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 06:12:48 -0700
X-CSE-ConnectionGUID: LENefwGlTh+CapaMQIRzDw==
X-CSE-MsgGUID: s7usGhAoQs6HT2zArA3zUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="252386459"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 06:12:47 -0700
Date: Fri, 17 Jul 2026 15:12:45 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 ankit.k.nautiyal@intel.com
Subject: Re: drm/i915/backlight: Remove DP_EDP_BACKLIGHT_AUX_ENABLE_CAP check
 for DPCD backlight
In-Reply-To: <20260716030959.436430-1-suraj.kandpal@intel.com>
Message-ID: <837ba34a-35ee-57b9-02fb-880b35c1c692@intel.com>
References: <20260716030959.436430-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1734800611-1784293968=:605841"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1734800611-1784293968=:605841
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 16 Jul 2026, Suraj Kandpal wrote:
> Turns out Some panels allow only backlight AUX based backlight

nits:
s/Some/some/
s/backlight AUX/AUX/

> by just setting the DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP and
> not setting the DP_EDP_BACKLIGHT_AUX_ENABLE_CAP.
> If we make DP_EDP_BACKLIGHT_AUX_ENABLE_CAP a necessity for AUX
> based DPCD backlight these panels loose the ability to manipulate
> backlight via AUX, specially ones with no PWM controller.

maybe: s/specially/especially/

> Remove this check from function so that panels who do not advertise
> DP_EDP_BACKLIGHT_AUX_ENABLE_CAP but advertise
> DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP are able to manipulate
> backlight again.
>
> Fixes: ed8be780bdbc ("drm/i915/backlight: Fix VESA backlight possible check condition")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16507
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
> drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 7a6c07f6aaeb..83245cb738e5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -619,8 +619,7 @@ check_if_vesa_backlight_possible(struct intel_dp *intel_dp)
> 	 * Since we only support Fully AUX Based VESA Backlight interface make sure
> 	 * backlight enable is possible via AUX along with backlight adjustment
> 	 */

Wondering if the comment above needs any adjustment?

Either way:
Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>

BR,
Michał

> -	if (!(intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP &&
> -	      intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP))
> +	if (!(intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP))
> 		return false;
>
> 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &bit_min);
>
--8323329-1734800611-1784293968=:605841--
