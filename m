Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E29C5AD7B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 06:06:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AAD10EA77;
	Tue, 11 Aug 2026 06:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/6lvYTX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727BE10EA77;
 Tue, 11 Aug 2026 06:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786428380; x=1817964380;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3zoGjMVv+bX5E+8W+GUQqcZOypxfc5Z2wrMAWqGRhCQ=;
 b=J/6lvYTXLbclfPaWd+/F6jxwX94Zw87M4XPcwLaQvsj+y5WksbSvMnJ4
 Y3as0azPUrRMeNmkmZu9zO0QtrHM8e3joGK+/P07VdlOFlPppXXZLC8T1
 ahH3Ktrzl76YkC190SYfGz6hP4AGP4YCjooySlXOGmL/+0g6/UEwxYdYi
 k5PtH5fU9gJDK7UCaG0Sl5WYb0PSpghca52h2zsuzgGHxYeDNIcxc7r7z
 E6TNTUrVQwuRhfWA6QLOMOf8jV7MfUTcpTYoUko+tU/fRh3NTChwYuJ9X
 4z6Oy8CGmAyC/j139l1H69c+zc7xHKlE35Zu2ElxUJQKov5S/Yujs86o6 g==;
X-CSE-ConnectionGUID: SvQZIl39RxWYm79uacNwrA==
X-CSE-MsgGUID: uKohNKxZQjSCzdIifbtwUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="90632463"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="90632463"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 23:06:20 -0700
X-CSE-ConnectionGUID: 8PwqtEKxQFSSjlcdT1eE2Q==
X-CSE-MsgGUID: L6bnnzYpRfy2OqquwJrkkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="263294218"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 23:06:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 23:06:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 23:06:18 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 23:06:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyMaezQanGz/Y0lX5xkzWQIXwiM2xE80Q0fay411Z4swJyoGDsU84FvrgCRT/Fte9JXr+QX40KxuUQstA4eEhRWZJpoPuEUvlvihSM0ltYeWkck1XeWBAre1/C9Rnm7iXrRiWbAViG197hAujxiwqRzqea4f4ZD6XnhVwQZBlxThsP2N3dA9/SpU1bXw6oUPKBi4Jf3x8+1nug7vqS0agZt1sGVtObRZ+cHYODKNcV1wIKpbSRSIZtIrsuK8G6qx4DW+7WYlQaB1K5nxD2/QGEbFLkwBaQtgqmVjIEwtMhQrn3QCIpzk9a7EFB937nXYENYvm9QApiyQkuoruymScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOQanSI5j9M3Jkf0mKAGZoSVEqZc/V24CwovV4Krbhw=;
 b=dyr1eO5WkNgGHC6k17SjwkPf8iDmkhVjD2HIV1J5mZfaR4Q+9XGaO4yt7sKvhvXv5Mz+TfUl7GD4DxEKV3r+Lw5gTcCdn6T7saTUGmrIx5EAo1wNS2J4teV3hP6LJsAhp5dvBuqy7dhH5plkMJE4aujLoV1+RgjllpK1cn2CV79MWF7++LcuN9R1DOml7TAWiKwMcczCOmohR4DRzFRrsO78U7q7+5v2TyOempbzvi1sxlonRH1R2t2bGXFnkAd1i+gvizAOY3hAWdJfif48dtF9kBQezC88Ao2sBMBHKx88QlYm8MyUGal1K+IcMjFa+XNt54KNB5miCER/UglhNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH0PR11MB5251.namprd11.prod.outlook.com
 (2603:10b6:610:e2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:06:14 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 06:06:14 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>
Subject: RE: [PATCH v2 3/8] drm/i915/dp: Add a wrapper to check frl/tmds
 downstream constraints
Thread-Topic: [PATCH v2 3/8] drm/i915/dp: Add a wrapper to check frl/tmds
 downstream constraints
Thread-Index: AQHdKU44v/fGDcgQC0GmZLiHRPdcH7aYXDeQ
Date: Tue, 11 Aug 2026 06:06:14 +0000
Message-ID: <DS4PPFE901A304F940BFC2E6E8370C1C76FE3DD2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260811044234.593986-1-ankit.k.nautiyal@intel.com>
 <20260811044234.593986-4-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260811044234.593986-4-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH0PR11MB5251:EE_
x-ms-office365-filtering-correlation-id: 1ff47306-cf66-4655-d113-08def76ea650
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|11063799006|4143699003|38070700021|6133799003|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info: 8T6jLTYnQDhEZtbfYiOOpZth7stDyx/S/9/vDj5r7Q8dis4mASVnZfbdtfGbYWOshOsSJRj6w7mCzPkBBtIlSb0rHtV4yCsQWYeNT9LUc09/+0Dt0KOstqngCQBgNe92iZmOQ98MJZH9hiI35TvvOcp+EmaR0G2gTJ8Aor9mTcTVA5eyhvi3V/IYJHntBqSnfFlnf3cQbZMGsv1vcAejMFB54UF3zONQQwmRLhAUEirwMqJ2NK7FCOGjkPL+XqdW2TwdAsLT7buXpVkup+yFOydEWogzgTFsEE9Xbop6onT4RdEwSgkwIvhV0LZG2tDb5VYoLn+m2Mrp8QcB6FDwLt3GUpmR2UekJXLw7ew+bo0aqZp7MBXThmV0uyDQFKxcAbSbmSPjioRoJCWgnSeljanPVU46H3RGpINow22ILkSO3eaANwNL7MkQuEUswu41QjdtZwT1U4Ja8VXTnYRVhTmaI/xRFbHOYbPpZimH87nIdTNRwfBTSbxtNnGEqdtQzFDt06/xSLgyWrPfBmaJGw9tJ4hOn+2UTgCW+rwkozPFutm9KdkGa3CYF0HwCS2FUpSHYqQJDgPTxZuyYQstXExzDeG1rBhUq7mZtSgM+CwTVE3hZ2abABigtG7GzzKQT2rwt/8PAXC0klEeGp3JIYT0nf+y0NVcwOjzVSYeXLpnltKQoxJGefr3393hQlx3BK8K2RDxlBdfD2JibkBNKC6MjeeUWklkY3OcB7OaDSI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(38070700021)(6133799003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7SOf+o3OKUu/H1PFK6QSH3UEZkWsNSP+NDBIvGsvlWq2ln30jdMFoiSnFjBj?=
 =?us-ascii?Q?NbCcrN2f+ZjaHNyd/Ap+FxNyD7D2pSHYwKJUzLGGrvvqVTHm+xRbLHOhA56s?=
 =?us-ascii?Q?y2FGYp9+7W+J/A3775GhLerjUnWomwHxvTJzPPtbJkVEToBWLjrQRscmqHn7?=
 =?us-ascii?Q?TvhsS0fPmMLsX0GP1RoxbbzA3zWyLvZZAdwF4JyCxsYzCjnTpB4FMK6et1MJ?=
 =?us-ascii?Q?Yz6PMpnvsSSI3tyEz3p2dNCeG0ohue3l4JamLlkGaobJoeAenF6jqwndpCHC?=
 =?us-ascii?Q?0TSJfcjg5sic48ymxB1Zi/43yfa7BF8+kfcNwk6EGXXzDRzhUHKezYOkcb4d?=
 =?us-ascii?Q?4d0fLEOZVpK0LFzpCyN5nDIwl0LS9Neo27Otxueb9Kw9C0dAR865H8Zbn2Xa?=
 =?us-ascii?Q?dbyBQXtem/omc4ca4+6TZHB6lDKjx4Hpvuegw2K3i0J71zKyOAAs4tFoCbRu?=
 =?us-ascii?Q?8mnaTzzOYR9YfLZiS8VYjYItxAdqY5NM3POpfq2S+/54W78eRpzXwGTvLPBn?=
 =?us-ascii?Q?pUo5J0EgF0ukDHD+C0ZJ90ePgUU59D8g2WyHKCkTK6I/Irt/jYYBke/UIXgc?=
 =?us-ascii?Q?Sw7hp8lSXLWAdvKwC/iaS5cJkpObbzlb1OfAot9cCCVL0YZ9cn1PJ5hdWzU4?=
 =?us-ascii?Q?k+k3j2WmlNbvr8lYeMzgwTwTSFu3BAoxgCaVQoZjhRipNESrpU9srsxfkR1E?=
 =?us-ascii?Q?JD2rEmbo3ZcwN5SHGXBeM7M8YMS3YQdgyju+geX9qdN2i5yz7xexUzVLIItK?=
 =?us-ascii?Q?zrN+LRsWc76dTueOf/WOj0xyLE+8bBKlqmzLaYI117gCCLa+dT80tBdTbHsP?=
 =?us-ascii?Q?wfYOjoEH4l6qtJzNub8nWiSBkZrfOS0O7KHqvd0Z3gqyY5JSZckjyKfU0GyX?=
 =?us-ascii?Q?EYSsKlOSUNwImpqdmA6M4fjvXMnG1FLLae/WZg8LwMN8IC6P8WlDegi00m7t?=
 =?us-ascii?Q?g72nqF4NDIeivSxjxK93zjH1qgXGgE2vtjw5M7SFSAiAyKxaavJaMJ1vpLlD?=
 =?us-ascii?Q?cok4aVCO+lW8sEzNXteziQeo6gTgG8U8NNM53WaqNRxgzM+rOBTKyWcxdIfK?=
 =?us-ascii?Q?TEYCwJyZDa2kqeIz+XXvJp9M3gEZLFbDT3kLZAcz/ETRghkfsZAlDMehg9Dg?=
 =?us-ascii?Q?2hLLeY4GLeQlFQQEfv4a9uWu+z551JmETHjoO2TfFomNHgTtteg21XLbfj+F?=
 =?us-ascii?Q?INqfEGu+PUNrVa/BtlFMqPvMxO+B3C1uVm5xP9xL7POmmHt7+nFeslN75lcs?=
 =?us-ascii?Q?V65Dd7k7slMkzuwuxLk5mNQhBB8NU/zOaPYjGghTbkz1G/YOcZqK6RAhFFsm?=
 =?us-ascii?Q?vHec5MpzcK831bTpOFvpXg/8+VbhwOXhg/jtM8WX40OfIEVlDOd6h+Ed8cZN?=
 =?us-ascii?Q?5F+jFg/yxEQpfOkHgS1B7tggTS2D1CyrcyR6n1Kc+759a2ohn631Fov75HrC?=
 =?us-ascii?Q?rqU3tTI84z0ron+o6YoEFp6/1k+NzGMpWafMp4UhIgzI0vSmwSK9gzkVyPQW?=
 =?us-ascii?Q?ZHsahf7qj+A89iwvhje2R5lPk+7e3BMnV6C+kXCyqbTvBmLpwihhPTE+heZO?=
 =?us-ascii?Q?VspuPmGMM7noZLQscL/R1P2bb743lLiqHZfXidVeqM/CQ/t1MqyVqrzyBtUM?=
 =?us-ascii?Q?usKQ8umiLHyrlhbuFie9kqNW5QDz21WFsCH+xAwzpGAomw8ZzBx4imePWwsU?=
 =?us-ascii?Q?HFcApMLFJPpnZcsiL2xGgamcqDP88IYYdZA++HHXhkDsFBEHGC6qLp6r1n3D?=
 =?us-ascii?Q?du11HtPpwQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qL0KyinkU7W4m0Rg57YfcLllXYFv+5FGqCGX/GvlaaVi1ZKvncEuukVb1AL6jnxi/FjLDY9r0+xUID3uNbN2Lguxlu1w730cy59Tu5+CJ3YfHOB2tKPXuSG50GQUUwQ1Q4gNLSB3ZWnYNLdEU6vCJIIWaOQSKb6miDWIScoUDyB+yLGjZb+DFSgZwgQzWQA5PCubrnNnsPER3s6jPUPIaXvxBRTUJ2Izd7hebgtMNuMDAzmhrpK4RM2Hbj7r6tkcq1IjL9xGWBAgHmg55VpmD1xqfCHsRsKQv9khitoFnk5LR5LeI76oKwzkhOfnerLjWrDizizZ92ess2utw9RvOw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff47306-cf66-4655-d113-08def76ea650
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 06:06:14.1472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FovZb1mZ8/V9EZQCM+iuAPAJQAbZpSJOeiihXLoYL1zYakHa2sxV4S68ukKHa89k7Wpx5FxfxhuxhAlI3lOw/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5251
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

> Subject: [PATCH v2 3/8] drm/i915/dp: Add a wrapper to check frl/tmds
> downstream constraints
>=20

Nit: *FRL/TMDS

Otherwise LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Add a wrapper function to check dp_downstream clock/bandwidth constraints=
.
> Based on whether the sink supports FRL/TMDS the wrapper calls the
> appropriate FRL/TMDS functions.
>=20
> v2: Don't modify the dfp.maxdotclock check which deals with VGA.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 34 +++++++++++++++++--------
>  1 file changed, 24 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index dd706f7de62d..6296c3d32970 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1206,6 +1206,28 @@ intel_dp_frl_bw_valid(struct intel_dp *intel_dp, i=
nt
> target_clock,
>  	return MODE_OK;
>  }
>=20
> +static bool
> +intel_dp_pcon_sink_support_frl(struct intel_dp *intel_dp) {
> +	return intel_dp->dfp.pcon_max_frl_bw &&
> +		intel_dp_hdmi_sink_max_frl(intel_dp);
> +}
> +
> +static enum drm_mode_status
> +intel_dp_hdmi_bw_valid(struct intel_dp *intel_dp,
> +		       int target_clock, int bpc,
> +		       enum intel_output_format sink_format,
> +		       bool respect_downstream_limits) {
> +	if (intel_dp_pcon_sink_support_frl(intel_dp))
> +		return intel_dp_frl_bw_valid(intel_dp, target_clock, bpc,
> +					     sink_format,
> +					     respect_downstream_limits);
> +
> +	return intel_dp_tmds_clock_valid(intel_dp, target_clock, bpc,
> sink_format,
> +					 respect_downstream_limits);
> +}
> +
>  static enum drm_mode_status
>  intel_dp_mode_valid_downstream(struct intel_connector *connector,
>  			       const struct drm_display_mode *mode, @@ -
> 1213,21 +1235,13 @@ intel_dp_mode_valid_downstream(struct
> intel_connector *connector,
>  			       enum intel_output_format sink_format)  {
>  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> -
> -	/*
> -	 * If PCON supports FRL MODE, check FRL bandwidth constraints.
> -	 * Assume 8bpc for the HDMI2.1 FRL BW check
> -	 */
> -	if (intel_dp->dfp.pcon_max_frl_bw &&
> intel_dp_hdmi_sink_max_frl(intel_dp))
> -		return intel_dp_frl_bw_valid(intel_dp, target_clock, 8,
> sink_format, true);
> +	int bpc =3D 8; /* Assume 8bpc for the DP++/HDMI/DVI TMDS/FRL bw
> check */
>=20
>  	if (intel_dp->dfp.max_dotclock &&
>  	    target_clock > intel_dp->dfp.max_dotclock)
>  		return MODE_CLOCK_HIGH;
>=20
> -	/* Assume 8bpc for the DP++/HDMI/DVI TMDS clock check */
> -	return intel_dp_tmds_clock_valid(intel_dp, target_clock,
> -					 8, sink_format, true);
> +	return intel_dp_hdmi_bw_valid(intel_dp, target_clock, bpc,
> +sink_format, true);
>  }
>=20
>  static enum drm_mode_status
> --
> 2.50.1

