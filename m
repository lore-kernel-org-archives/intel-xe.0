Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3EDC624CE
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 03:03:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDF710E351;
	Tue,  1 Sep 2026 03:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0XI90dh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1950F10E2F5;
 Tue,  1 Sep 2026 03:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788231793; x=1819767793;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J2KoxGwOZdYOkEcckaeFbs0UtQMM+aJL3uxXv6UCxkA=;
 b=h0XI90dhRkydyNOc7ZbEOLuW11FTtSQpz++M9CFC89SGRMQN/apGLBhs
 tjZnVSQ5UHKawowNLFxYqq7Afkws6OWMmeanOHRDywn9wrS1ZW+3Td4Ug
 EghdLtzVnMlWDtALlzfNGfO1bJvPYmiZaUdFvklBLKCHgMvet001xy0pM
 SRunXwB/yF4VqSExVCHHQW1qAL4DGnBzAnaDM1IYxLjtaQwHou7Xi9nsO
 3kaObQdMP/0rZoT8WX7yxbD8kU8BJm6ErRbcetjILkO4Uyq96bDafM60U
 SkzR85P3kvFvny+irCSWuwpvEPa8131pRx1avr7L+WLyhkARfavsK1+Nm g==;
X-CSE-ConnectionGUID: fPuj2ResS6mLSDz30gw2lQ==
X-CSE-MsgGUID: dZrIMhZzSGGwvFwZSayiFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87589079"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="87589079"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 20:03:12 -0700
X-CSE-ConnectionGUID: XtyvPD5UTZyslqcj0eSNBw==
X-CSE-MsgGUID: oes/u6gDTZitwVov/BQDjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="265719947"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 20:03:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 20:03:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 20:03:12 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 20:03:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKi2gOPNxPW443DpmmPeBUuvLg5+gEMABqyEuYupbxr2W50ExRdEafTegUQFLhkBlZcQrwyLgUE1HIs3bTZC65JD9p9zVPjaaUvUhbDlGkY1g6myADDvYZ5meiNz6AnTw7ANShiILGyZE4NPb7SxxcoWKfIhXs2jtCw3H0nR98vUNyo0IDnXv9sEgFaKRYGXzO26kwRKi93yMz+fC7WsrHf0JTvjQJ+4qRE19X/PPRyq/BGxkDJQ/nrQvRVcHqN9htx+88mV/G24Z4TA+hRaY0HXRenxe9qbAt7tvgmgkiGgcr7INiZjQR4s5OwUjE1Mte6whGGvZNAtxQPeg5vOkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxnfXzL4YqJeG0tVt1CaMatoqO0YY4Ia7QfgaYdmqvM=;
 b=iqhzI6LNaZvwcd0EPGnAew3Gf2nMj3YAg3fDdiSYdZDQj8Z9rVsP+j/9LVmfbvlrdip1Oq3L8tKkPhKcSixDWfGexcD/0qlnSuFCoVZMSeGr487TvBH/jhpg1iUtI0cTTsdQRAiqnUbsOxOOQdHrJ98Vkut7zxAniDZe1gkRTFP3oC++Xr6VlkhkYkzghJI7I7i9SIkktdG8F7ezIVhuokzDS+p9dahfesL+wp6gJGYrU7ENXZ8jQC85OMeYVv/fyzggO67+Jnm8Oy/P7V7DFWAmcxMzspRQHMYD67mNINuiVNiGV2IAoB0O8YrKsBN/G8hOCNTLDo6p83GAoe50HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DM4PR11MB7374.namprd11.prod.outlook.com
 (2603:10b6:8:102::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 03:03:08 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 03:03:07 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v4 06/12] drm/i915/dip: Store and use AS SDP transmission
 line from crtc state
Thread-Topic: [PATCH v4 06/12] drm/i915/dip: Store and use AS SDP transmission
 line from crtc state
Thread-Index: AQHc+Xcmg4Dhq3S0EkisTOyrY71Od7a5iWkA
Date: Tue, 1 Sep 2026 03:03:07 +0000
Message-ID: <DS4PPFE901A304FA9D0C6E6AE811BBF875DE3A82@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
 <20260611073316.1439306-7-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260611073316.1439306-7-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DM4PR11MB7374:EE_
x-ms-office365-filtering-correlation-id: 345eec21-cc77-4391-92e5-08df07d58c96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|38070700021|10067099003|11063799006|4143699003;
x-microsoft-antispam-message-info: /zIMAX5qyoCakQL5lUsWBAt807oYhfzpv6N53uG4rQTJOw1aEbUbr4ftN4Ctx3YYEzZxLgW+l8Ro0Xk2+KwXCs08oq25M47MZrt0YRYPy/D5QI4jg55EJTnpBCdTm3c+1WzdHBf8+5CbKTLP2s/dJM9MKyteUDh98bVptdbCozoKCKi1+73ZZMFg9RfBtA+LAFinnWdNqVhO27b1q4Dk8AFwW62qu2b9XVqwdHzpalQpSSSUxgPmYXTVKhUnVoV1KTbZkJpR+nswZh2sLwKzOZadP5fGstUMfUCyf6OluAboNQcdE/DqjGeAYUrWPJ/76LTupLB0xMGnM5NiCdAhbI8JirEdR1mQBypzpx3UppkqKhvJ0PAyUoC3J5tcq1NFFaRO6p+HF8nk7ipWKww5wmKoJ6uD18TJp1teLYDKl8Qgtbk2xruhPdT/F5nnhQ56MDJByyEuaYiKWRbOzqN4qMUNJ/jpgFD9l7OUkkLso8p4lHZYlt28NJgwdKxuKpwp/jatxpvyvn3IeP7PQnBd1KYgBBdmXePgyEkrea41GQ0DLRAxzyKhBylG9MHAGAxM8clUxLKwD7o7mHJ3cZtSsw5Y7FsjXZvSJyVuVeYg6zUZ5x2Q1D/Xjli0MTPmQlIyX95JkAfV7pf52yjgxMMgG/uSKsqdXzOajGoFxGWJiQ1U9dlPL4AacoScGoOh4t6mQsZUFLgocvQGPeEtEDCOFjB8c5/vCzeFag/M2PDDECE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(38070700021)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tAVCx8dKpQ2K5K1vxBYfBOibWunOMDCQhdP/VknZLosXol3aJGqtklMGRRs7?=
 =?us-ascii?Q?9zwKFk5sSX7TxfAv545mdrBwogYLNRcdr03hIQXFOjk7WcRwo3F34nqSWeyV?=
 =?us-ascii?Q?7FUV33DjoGPzSW4nMQIQ17lXVp8rxqV2CHYlc+Ru4CeBbFiJQMZHhY/S1MRy?=
 =?us-ascii?Q?JtzkRj1+5sI9DiNIQQS56k1j25+lkip7eBdKrlsIsL1XDdBfI7qmlb6tRsuS?=
 =?us-ascii?Q?b2l7y/Tgw0DDxXJNvxAVySvox63sXnOOYG599naLpw8vKah8Ie8gZQekuXFQ?=
 =?us-ascii?Q?ybaDKKux49kKr+Wx6BcoSgryD/78FMlJkaO+cDstSyCcSJcDZbWten2/6OHA?=
 =?us-ascii?Q?L5ZDJR0XLdwZ8KgJqJYfF1Tg+VinJxRgNhmrhbfXCffULiHaq3D8KkF9UhD8?=
 =?us-ascii?Q?NHFUl/SY4YGL1acz/oiJlnbZL0ugh3jKW38iVknKs7xCKsWa9ftiPgQrbzMa?=
 =?us-ascii?Q?utVdK4xrVhl3Aa3+Zr4ZAuLoBljMNbrjsaLsWa7a5r/461omYrLVq5ev9DnY?=
 =?us-ascii?Q?i4GEg4hKfXVWyfNjRG/qt5OXUXZmFRE6uN6IFdz7VIJfG4OkftwZo252Aj72?=
 =?us-ascii?Q?xzXK0NUkAyGLEhYawcuzwt05l4+2bZ3jwnqBfNYFu+4QZlDzTSOs7zYP6fDj?=
 =?us-ascii?Q?Tnsli13i3JwHk7CIhkJ6W8QHBWs0bJQM98xwmKhQ8Hg+hbVaZXLbuGOuCoBD?=
 =?us-ascii?Q?LUGkzK9T5qYYEAHA4tKkty/Ede+USrroP6wxQbgmjfYjoK3e321U6KiQv+nH?=
 =?us-ascii?Q?wOCj4iL3l3y1yfrZWX/5nbLt5u25UsIQv7gXsRxKRN28S4ylAZEAc8SkKjdZ?=
 =?us-ascii?Q?5zLCuIw4oWSk2Nj4JXrjZ4g+IYz4gGMOtXmJwX8dAWTw6JUiy6Iis17MKlqb?=
 =?us-ascii?Q?34wWhJHuweU+fjvcai8X7S4LQ4vJ4y1jI0v12fFQ83A0rsHNNIWTCatikjND?=
 =?us-ascii?Q?26h7gna144oRM10PlYdqJkxVMMA1gThL3ZFbA8IonOjRFQy+yKz3YPU/jGXP?=
 =?us-ascii?Q?mS3jaslaJ7fL0+xFjIl+/vxi4eoKZg1mObWhP+Jw8VBpDoypglRl0SXHVGt7?=
 =?us-ascii?Q?l+kZEo6HLkjXFX0uK89w1LMrZpaVHNFuuyX+sX4i5tuDMvN95MkpPOLIeh2K?=
 =?us-ascii?Q?wETrAR0w2l3Sb2MnAWfX0FnPjOUpooaaUeERz/Vw0r8PBnaGkX1UBF6lROKi?=
 =?us-ascii?Q?R4ppf+gMg3FLH0gS08vQTb7Ho5Px2zRPjo0kOE2serG+4h10I7kyPllYP/tj?=
 =?us-ascii?Q?BgQ0uk3Q8ZPKAvpx0x8Rrq/HY0BHaOwM4EpsYcl3WAAJlfA0F88m9Xyues2/?=
 =?us-ascii?Q?6sfikPqN4tT2xS4f9hxHeC+4j8ld72jiIkCg1phJrlGsL1ikQtEXIaijuyrZ?=
 =?us-ascii?Q?fd8GtmvziPkaAZa9GYqiM/vZNa23iNSoH39wYJ+pINQeXkcEQZRcv8wIuJO+?=
 =?us-ascii?Q?ME+4fBEnkjgSp3+7X5TNpRZbZIGHmZUaKrBGx2A9pPpUiNC/JooI9qKah8Ol?=
 =?us-ascii?Q?umrvZSC+kbji1yQUxV9B0ZnVpiXW4kAD7Z7OlFHnWdpSNXOfzr6EzNw1hyKX?=
 =?us-ascii?Q?D7C/bBrsGweLbcmPcshbRFT/Ioo+x2jXG7so+mdvkGlGDAmi8T9ShaOZuAPd?=
 =?us-ascii?Q?Sciu+TmUwCbMsabpYDYMuoVM6Mm3vpwdPYB3I8VbSfo21GBmw+TXm0+oWHl8?=
 =?us-ascii?Q?NpFAG5b8lo5hFU5h2cBHNOtBW4K5PeDrrMl4QS5+p3+BdNRF65vXDqi2YpFE?=
 =?us-ascii?Q?n1F62elD1g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mTsBM/lTnagFlYfLr+cwkvGq3nJ34oC3ZacKq9/RyyUrTlQcqJKdqF9Jp3+rERHm7ruK3Zj25/XM2a9GO2angEfebMPdM0SpQu6ISVx2n53tfY46RVoSxn/76gjPOd52+zaEFdo3IGR3VY2Ga9bsnKC/If6vy2NUQjzr7jkxzFRwtTdV0LuvwWamm8ACVSmvLzB3FidoBtQ/b7/xEXSL/ZZbQwVBW+bawHXL0c47oF8LJrBwOBVxE0IB446zRo3JM1YBHU5DppKwqHtxxeLZP+WVyCrqHxQYgUIugtxef33qj97cCTjon7dV3FJQKXXvtoYTA9r98VhIa9UarfIYnw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 345eec21-cc77-4391-92e5-08df07d58c96
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 03:03:07.7774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2GYkuanb3OEL1sW6WtFWgeEl/ds7O1g4UaUoHfJBoPMMON8ia1Tgnhc51JUj7OlMkjEb3andNPr7EW3dIKj5Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7374
X-OriginatorOrg: intel.com
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


> Subject: [PATCH v4 06/12] drm/i915/dip: Store and use AS SDP transmission=
 line
> from crtc state
>=20
> The driver currently computes the Adaptive Sync SDP transmission line dir=
ectly
> at programming time. Instead, compute and store the AS SDP transmission l=
ine
> in the crtc state and use it when programming the EMP_AS_SDP_TL register.
>=20
> We get the clear picture about the SDPs and guardband only in
> intel_dp_sdp_compute_config_late() therefore we must configure the AS SDP
> transmission line at this point when AS SDP is enabled in crtc_state.
>=20
> This prepares the ground for supporting programmable transmission lines f=
or
> additional DP SDPs.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c |  2 ++
> drivers/gpu/drm/i915/display/intel_dip.c | 20 +++++++++++---------
> drivers/gpu/drm/i915/display/intel_dip.h |  3 +++
> drivers/gpu/drm/i915/display/intel_dp.c  | 11 +++++++++++
>  4 files changed, 27 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 6399b16405c8..d2edfad295d5 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -49,6 +49,7 @@
>  #include "intel_ddi.h"
>  #include "intel_ddi_buf_trans.h"
>  #include "intel_de.h"
> +#include "intel_dip.h"
>  #include "intel_display_power.h"
>  #include "intel_display_regs.h"
>  #include "intel_display_types.h"
> @@ -4215,6 +4216,7 @@ static void intel_ddi_get_config(struct intel_encod=
er
> *encoder,
>  	intel_read_dp_sdp(encoder, pipe_config,
> HDMI_PACKET_TYPE_GAMUT_METADATA);
>  	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
>  	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_ADAPTIVE_SYNC);
> +	intel_dip_sdp_transmission_line_get_config(pipe_config);
>=20
>  	intel_audio_codec_get_config(encoder, pipe_config);  } diff --git
> a/drivers/gpu/drm/i915/display/intel_dip.c
> b/drivers/gpu/drm/i915/display/intel_dip.c
> index 504a2edadd0e..333314637db5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.c
> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
> @@ -27,19 +27,21 @@ void intel_dip_write_emp_as_sdp_tl(const struct
> intel_crtc_state *crtc_state)  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	enum transcoder cpu_transcoder =3D crtc_state->cpu_transcoder;
> -	u32 transmission_line =3D 0;
>=20
>  	if (!HAS_EMP_AS_SDP_TL(display))
>  		return;
> -	/*
> -	 * Since currently we support VRR only for DP/eDP, program the register
> -	 * for Adaptive Sync SDP. For non-DP encoders, the register is reset
> -	 * to 0.
> -	 */
> -	if (intel_crtc_has_dp_encoder(crtc_state))
> -		transmission_line =3D
> intel_dp_get_as_sdp_transmission_line(crtc_state);
>=20
>  	intel_de_write(display,
>  		       EMP_AS_SDP_TL(display, cpu_transcoder),
> -		       EMP_AS_SDP_DB_TL(transmission_line));
> +		       EMP_AS_SDP_DB_TL(crtc_state->dip.emp_as_sdp_tl));
> +}
> +
> +void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state
> +*crtc_state) {
> +	crtc_state->dip.emp_as_sdp_tl =3D
> +intel_dp_get_as_sdp_transmission_line(crtc_state);
> +}
> +
> +void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state
> +*crtc_state) {
> +	crtc_state->dip.emp_as_sdp_tl =3D
> +intel_dip_read_emp_as_sdp_tl(crtc_state);
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_dip.h
> b/drivers/gpu/drm/i915/display/intel_dip.h
> index 37507ac3e645..600dabbf7372 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.h
> +++ b/drivers/gpu/drm/i915/display/intel_dip.h
> @@ -43,4 +43,7 @@ struct intel_dip {
>  	u16 emp_as_sdp_tl;
>  };
>=20
> +void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state
> +*crtc_state); void intel_dip_sdp_transmission_line_get_config(struct
> +intel_crtc_state *crtc_state);
> +
>  #endif /* __INTEL_DIP_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index f54f7faf878f..e143ec1b76d0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -7356,6 +7356,8 @@ int intel_dp_sdp_compute_config_late(struct
> intel_crtc_state *crtc_state)
>  		return -EINVAL;
>  	}
>=20
> +	intel_dip_sdp_tl_compute_config_late(crtc_state);
> +
>  	return 0;
>  }
>=20
> @@ -7468,6 +7470,15 @@ void intel_dp_link_cleanup(struct intel_dp
> *intel_dp)
>=20
>  int intel_dp_get_as_sdp_transmission_line(const struct intel_crtc_state
> *crtc_state)  {
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +
> +	if (!HAS_EMP_AS_SDP_TL(display))
> +		return 0;
> +
> +	if (!(crtc_state->infoframes.enable &
> +	      intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC)))
> +		return 0;
> +

this part should not be a part of this maybe can be squashed with 4th patch=
 where this function was introduced

Regards,
Suraj Kandpal

>  	/*
>  	 * EMP_AS_SDP_TL defines the T1 position as the default AS SDP
>  	 * Transmission Line, which corresponds to the start of the
> --
> 2.45.2

