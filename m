Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84C7CDB479
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 14:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF7D10EBB2;
	Tue, 23 Jun 2026 14:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5nmTajq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A22010EBAC;
 Tue, 23 Jun 2026 14:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782225940; x=1813761940;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=0YlDe0TiIeGGTDtEkvniZhVUEe0orKKSXPmZY0hZCdo=;
 b=X5nmTajqjlRKsaXX2aBehw0IxHceWSmg7DhduXs1Ty1V4nhsjdIMmtAB
 Q3ULyAioRdK2VgwRwyZ8sMUV/1ymgKA/NCBpSn03KTQxs5ZKjH3vIPhIk
 f653vbxCR0cmXzPE1HxnGrJfdblw9bXtI4kwSaffaEZEh4I5a0c5Tsz/8
 lFq45G0Bh2HrDkXba+dLgIbk+Dvf93kVa7QYfGtrVrEdScE/SNGiA7Xxm
 xTyAFoYMcLRs0Zmiw8Bj39/kKcpNCKrPw3v2tO9h/DOrqV81rmmdF7Unw
 HZln6RUiaffhaUubrISzc1xAlsCN386TZFaQG5MwK8zvV3uHpy8PZ9y2E A==;
X-CSE-ConnectionGUID: 7y7Ioeu7Que0JDFe6HAmmA==
X-CSE-MsgGUID: ccDiwjumS4yAR8zghb0Uaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="108512856"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="108512856"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 07:45:39 -0700
X-CSE-ConnectionGUID: ks7UuPOVRX6j0SfHUKo52A==
X-CSE-MsgGUID: i/ZSByU/SaaW8NXVaGIFYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="243174259"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 07:45:38 -0700
Date: Tue, 23 Jun 2026 16:45:37 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/6] drm/i915/gmbus: s/gmbus_pins_skl/gmbus_pins_spt/
In-Reply-To: <20260623125111.6632-5-ville.syrjala@linux.intel.com>
Message-ID: <d369ef7e-cd60-f871-9694-99c48a7bdb23@intel.com>
References: <20260623125111.6632-1-ville.syrjala@linux.intel.com>
 <20260623125111.6632-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-767639904-1782223670=:605841"
Content-ID: <303ab055-4872-1266-a707-8ff7698e6461@intel.com>
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

--8323329-767639904-1782223670=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <13ac1692-ecaa-fb2a-3d95-44381b8e4a4b@intel.com>

On Tue, 23 Jun 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The GMBUS pin pair <-> GPIO mapping is purely a property
> of the PCH (on the platforms where GMBUS lives in the PCH).
> So rename gmbus_pins_skl[] to gmbus_pins_spt[] and apply
> it based on the presence of the correct PCH type.
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
> index f69b8841c5dd..dec0f66f756f 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -98,7 +98,7 @@ static const struct gmbus_pin gmbus_pins_lpt_lp[] = {
> 	[GMBUS_PIN_DPB] = { "dpb", GPIO_4 },
> };
>
> -static const struct gmbus_pin gmbus_pins_skl[] = {
> +static const struct gmbus_pin gmbus_pins_spt[] = {
> 	[GMBUS_PIN_DPC] = { "dpc", GPIO_3 },
> 	[GMBUS_PIN_DPB] = { "dpb", GPIO_4 },
> 	[GMBUS_PIN_DPD] = { "dpd", GPIO_5 },
> @@ -180,9 +180,9 @@ static const struct gmbus_pin *get_gmbus_pin(struct intel_display *display,
> 	} else if (display->platform.geminilake || display->platform.broxton) {
> 		pins = gmbus_pins_bxt;
> 		size = ARRAY_SIZE(gmbus_pins_bxt);
> -	} else if (DISPLAY_VER(display) == 9) {
> -		pins = gmbus_pins_skl;
> -		size = ARRAY_SIZE(gmbus_pins_skl);
> +	} else if (HAS_PCH_SPT(display)) {
> +		pins = gmbus_pins_spt;
> +		size = ARRAY_SIZE(gmbus_pins_spt);
> 	} else if (HAS_PCH_LPT_LP(display)) {
> 		pins = gmbus_pins_lpt_lp;
> 		size = ARRAY_SIZE(gmbus_pins_lpt_lp);
> -- 
> 2.53.0
>
>
--8323329-767639904-1782223670=:605841--
