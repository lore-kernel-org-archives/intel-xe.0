Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830BDCDB46F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 14:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E06010EBA2;
	Tue, 23 Jun 2026 14:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iY4gXXNW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E89310EBA2;
 Tue, 23 Jun 2026 14:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782225927; x=1813761927;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=DQ/doB/SlUSk8m1qLJsx9isTY8w+tsDQHhgKCKEr6Xc=;
 b=iY4gXXNWQgXjroMTgcs50NX61cnjpwGDyw0SZP3KB+X0EgbbwTKvv4nS
 uJdTChiVwujT/nXm82FuRfUXQlR13KNWqOxKZ8UIQE/y1UtKkqGFmJJI/
 fbBi5shH7NxB2u9r15uEVeCsYmNQcBZCkt20CcOdJnbTDtdgt7bTa5Ji9
 g2aOQ7Hqcum7O5lfMjw+UUAZob5Eg1vjaoczW3SaEvIhRVRX+oWNyYrtB
 zSbvPoPE8nmZ0Uy+aSmOiIuQJrLoN23cyC/WZZz0pdrHds1l/FemyX4VQ
 mw0BaUhdT1uswtyL/R26uKGw5TKJFpUdUfN8Mq6xRWlQrQiLAeHUveXi1 g==;
X-CSE-ConnectionGUID: dtbL/zjAQP6SXjYkaHfRRg==
X-CSE-MsgGUID: TeUCD+PQSFKLHK9mbSYLHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="108512814"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="108512814"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 07:45:26 -0700
X-CSE-ConnectionGUID: zDo1WarcT1Kvpv8IfZ4vSA==
X-CSE-MsgGUID: vy044wimQbeaT9QKi9sBxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="243174213"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 07:45:25 -0700
Date: Tue, 23 Jun 2026 16:45:23 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/6] drm/i915/gmbus: Add gmbus_pins_lpt_lp[]
In-Reply-To: <20260623125111.6632-4-ville.syrjala@linux.intel.com>
Message-ID: <45498218-3935-4b52-fe01-ab637179a436@intel.com>
References: <20260623125111.6632-1-ville.syrjala@linux.intel.com>
 <20260623125111.6632-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1230177070-1782223553=:605841"
Content-ID: <eafdff30-db68-ec31-16aa-f09f250ec1bd@intel.com>
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

--8323329-1230177070-1782223553=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <1d35f429-5062-fe6d-f885-47b57f409469@intel.com>

On Tue, 23 Jun 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> LPT/WPT-LP don't have as many GOIO pins as the -H variants.

nit: s/GOIO/GPIO/

> Add proper mapping for the -LP PCHs so that we can't end up
> poking at non-existent GPIOs.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> ---
> drivers/gpu/drm/i915/display/intel_gmbus.c | 14 +++++++++++---
> 1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index 2869ec23e1ec..f69b8841c5dd 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -86,13 +86,18 @@ static const struct gmbus_pin gmbus_pins[] = {
> 	[GMBUS_PIN_DPD] = { "dpd", GPIO_5 },
> };
>
> -static const struct gmbus_pin gmbus_pins_lpt[] = {
> +static const struct gmbus_pin gmbus_pins_lpt_h[] = {
> 	[GMBUS_PIN_VGADDC] = { "vga", GPIO_0 },
> 	[GMBUS_PIN_DPC] = { "dpc", GPIO_3 },
> 	[GMBUS_PIN_DPB] = { "dpb", GPIO_4 },
> 	[GMBUS_PIN_DPD] = { "dpd", GPIO_5 },
> };
>
> +static const struct gmbus_pin gmbus_pins_lpt_lp[] = {
> +	[GMBUS_PIN_DPC] = { "dpc", GPIO_3 },
> +	[GMBUS_PIN_DPB] = { "dpb", GPIO_4 },
> +};
> +
> static const struct gmbus_pin gmbus_pins_skl[] = {
> 	[GMBUS_PIN_DPC] = { "dpc", GPIO_3 },
> 	[GMBUS_PIN_DPB] = { "dpb", GPIO_4 },
> @@ -178,9 +183,12 @@ static const struct gmbus_pin *get_gmbus_pin(struct intel_display *display,
> 	} else if (DISPLAY_VER(display) == 9) {
> 		pins = gmbus_pins_skl;
> 		size = ARRAY_SIZE(gmbus_pins_skl);
> +	} else if (HAS_PCH_LPT_LP(display)) {
> +		pins = gmbus_pins_lpt_lp;
> +		size = ARRAY_SIZE(gmbus_pins_lpt_lp);
> 	} else if (HAS_PCH_LPT(display)) {
> -		pins = gmbus_pins_lpt;
> -		size = ARRAY_SIZE(gmbus_pins_lpt);
> +		pins = gmbus_pins_lpt_h;
> +		size = ARRAY_SIZE(gmbus_pins_lpt_h);
> 	} else {
> 		pins = gmbus_pins;
> 		size = ARRAY_SIZE(gmbus_pins);
> -- 
> 2.53.0
>
>
--8323329-1230177070-1782223553=:605841--
