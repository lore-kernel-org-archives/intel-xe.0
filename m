Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5734CCDB479
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 14:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B93C10EB95;
	Tue, 23 Jun 2026 14:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GwCJ4qP1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5563C10EB95;
 Tue, 23 Jun 2026 14:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782225827; x=1813761827;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=HTKhenCLWp8suZfcsqroRGpfYP8qwMw7uWs8lGgwiWU=;
 b=GwCJ4qP1vwQk8YOL0XjlqT8yUi9b1+cBo88CHU/VXqKD5XsnjICRij/s
 2C4F8x2HHNpYGH1oJDwj6LAoQnYr1aRUGMH8Dstgkea3jRKHmFufwJlCn
 mUcExRTMZlDlYpfkEgjSkNtvxEn2h39ZugvEXT4D8Dz+7ZUYK182f8Vmo
 UYkxtNNknP+82aTalz/86xaL6yQ3ZRXZcgnCtZyFBoqsjcfnvLDUHNWRF
 5g6mfNbU8WPreHCw6gAn+sa55NJMreI2Pj6FDxyxA0zKvUsdN96QkC2Qc
 dILcqU/INLyZQ3wIO3YKGTh2hbwWmeHyuFProPNCXfRO8Yaqw6+aQg6ZE g==;
X-CSE-ConnectionGUID: bP1OyUjRRaa45Cm3mgJmjA==
X-CSE-MsgGUID: /4K/9ZQlQW60q+3qkks1tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93558875"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="93558875"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 07:43:47 -0700
X-CSE-ConnectionGUID: 49SjMhaIRXuT09Slkk7TSg==
X-CSE-MsgGUID: 5Zm6OAouTZyXpdQgLgS0qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="245400051"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 07:43:46 -0700
Date: Tue, 23 Jun 2026 16:43:44 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/6] drm/i915/gmbus: s/gmbus_pins_bdw/gmbus_pins_lpt/
In-Reply-To: <20260623125111.6632-3-ville.syrjala@linux.intel.com>
Message-ID: <f7ffb9a0-6681-be3c-ac44-d2efb33319c9@intel.com>
References: <20260623125111.6632-1-ville.syrjala@linux.intel.com>
 <20260623125111.6632-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1029480549-1782223463=:605841"
Content-ID: <c90227b2-bc27-721f-22f0-042046de69bc@intel.com>
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

--8323329-1029480549-1782223463=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <55aebdbf-887b-1e22-980f-73370c1b6ed5@intel.com>

On Tue, 23 Jun 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The GMBUS pin pair <-> GPIO mapping is purely a property
> of the PCH (on the platforms where GMBUS lives in the PCH).
> So rename gmbus_pins_bdw[] to gmbus_pins_lpt[] and extend
> it to cover all platforms with LPT/WPT PCHs.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> ---
> drivers/gpu/drm/i915/display/intel_gmbus.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index 9990e6391b03..2869ec23e1ec 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -86,7 +86,7 @@ static const struct gmbus_pin gmbus_pins[] = {
> 	[GMBUS_PIN_DPD] = { "dpd", GPIO_5 },
> };
>
> -static const struct gmbus_pin gmbus_pins_bdw[] = {
> +static const struct gmbus_pin gmbus_pins_lpt[] = {
> 	[GMBUS_PIN_VGADDC] = { "vga", GPIO_0 },
> 	[GMBUS_PIN_DPC] = { "dpc", GPIO_3 },
> 	[GMBUS_PIN_DPB] = { "dpb", GPIO_4 },
> @@ -178,9 +178,9 @@ static const struct gmbus_pin *get_gmbus_pin(struct intel_display *display,
> 	} else if (DISPLAY_VER(display) == 9) {
> 		pins = gmbus_pins_skl;
> 		size = ARRAY_SIZE(gmbus_pins_skl);
> -	} else if (display->platform.broadwell) {
> -		pins = gmbus_pins_bdw;
> -		size = ARRAY_SIZE(gmbus_pins_bdw);
> +	} else if (HAS_PCH_LPT(display)) {
> +		pins = gmbus_pins_lpt;
> +		size = ARRAY_SIZE(gmbus_pins_lpt);
> 	} else {
> 		pins = gmbus_pins;
> 		size = ARRAY_SIZE(gmbus_pins);
> -- 
> 2.53.0
>
>
--8323329-1029480549-1782223463=:605841--
