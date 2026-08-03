Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC391C55162
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 05:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9F810E215;
	Mon,  3 Aug 2026 05:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAisxyNe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5F010E1D7;
 Mon,  3 Aug 2026 05:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785734450; x=1817270450;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rh9cgBio/tJJ9Ybryj3iDw50ohV4uLky00b//cz/9gM=;
 b=TAisxyNebRiOI3S+UojXBfBidQHcEdgq3sMOIFcCO4lr4YdZLvgNa4Kg
 R56dO1nLb3L6uKjEZaA71V6x6i93VdEbCj8/1M4wmZUh+cND1ph7qdjhb
 8Rk7kowlXFmF52bRvsS6z1V/FvyxlrlNL1zIXX8QqqY1+3jCD6GQgd4HK
 h/RVR2VvfncN8oLZoJ9F3L4vtgT2YLO4HepKubE6oXQk81kMuBEWL+dte
 ZYRuWkhPh1mdPieslFpTuuXnunsaXnbZwjBbPfAWam20RQoQhm+Zf9Sxs
 7QV356ZtQzrXxTBE6MkH6kCjuixcFVo0SS67wR9zzzEnLhLqxKjSrULts w==;
X-CSE-ConnectionGUID: bYfYT0aWSCKJMHCQL/3mwg==
X-CSE-MsgGUID: FZTSdNNiReetWzqFYzZvuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="73800047"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="73800047"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:20:50 -0700
X-CSE-ConnectionGUID: Wy7LQCOTTK+pSJZU9Ydx6w==
X-CSE-MsgGUID: 9dMDUqYBQoCE+OFXzIpfPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="261168562"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:20:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 22:20:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 2 Aug 2026 22:20:49 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 22:20:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sX+E/Vmtc+CfZUsZGLvFGjX/ezC6+0depWNSoYudS5lH5kcNaTOXR7asthVnz6S2EqzHCD7tpmSIMNGNK9ijHmSW/8n1EjwV24HRggCa3n0Uk8IB4sVTVM8UET2ItrW9HIP2ge12Y5mng7OtavtiQVXax7VSnC7KaT17PFWkW6rt37pNQhzSbp/ixC2U7oUGyKtDp9ln8wpDie30Cx3nd2Wto3aYjx2E+12ypiHtoV5y7fE3v5ZjY1xI+uZqBysHrSP+w1xZ8FTuVQIzEuHfXXRGDXkN3Ly4pazf9UmHN/irVKoBC2s0SNuH5Q50Irh5lHB+en++u6l+IXvwSDnN2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLjU8wq/OM7ga3ofTBh8Xd7I/L2B3KlGru2aQwcOx1I=;
 b=PqoCj68dJCOGzLJYDHQXccyCEvM8pj/I5CRGPvc1AXUtQfAnJhOwJrWS02/YwdXQyPEZte84a/XGeSmtfAuTA4skJfVdSTcL+202kzbH4mq2FXaLd6qNCiRpBwYY3dDkywVidAF4UDIRz/0Ghw+45ZputG8TyV0N+32c1k9QPn+7DxVyg6zr08wH2Lz0smCpUcnDyMPhYGl3ElJ+TIHLv7ZcFw/XjeuKepn2OpenVJ2yqppeVNj18MP+5jI7a9Jb+ZHToQH4/Rf600w/n/s7LXn/c9jL1MyDPJOu5ucUY8/gpdqOyn6Xs80gytrz+rlyn495d0PRA3JdlWLfq4vdKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SA3PR11MB8074.namprd11.prod.outlook.com
 (2603:10b6:806:302::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 05:20:47 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0270.012; Mon, 3 Aug 2026
 05:20:47 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 06/14] drm/i915/dp: Add a wrapper to check frl/tmds
 downstream constraints
Thread-Topic: [PATCH 06/14] drm/i915/dp: Add a wrapper to check frl/tmds
 downstream constraints
Thread-Index: AQHdIBUpnaU8afABoUWcAG4m1EYIBbaLz0TQ
Date: Mon, 3 Aug 2026 05:20:47 +0000
Message-ID: <DS4PPFE901A304F27F70C793A494504597FE3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
 <20260730105226.2731341-7-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260730105226.2731341-7-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SA3PR11MB8074:EE_
x-ms-office365-filtering-correlation-id: 35930340-6c91-4ddd-9b5f-08def11ef9d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|4143699003|11063799006|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: qukZMmjitrE6qBxhYjTFPysdHoEKSuAuUdIX03fCvlPJVw3clQMfFeLPtwrI3prMjxNxQ9nd8hhGjoFFZE1GNC8nagyZCRKh7f0i/928+fJCzpnLz+rOn1FbmedUOHjFqGPy4MEy/kKyv6ZtOxXX3iG8RoDxWF7AbDxdz3WDcNsPCXvPUvmoSu0ZVqA3iDSC1aJ2TlvR/RpIY+gKt68nkYripqsR5Mo0p0LVXtqGMiqywA8N6In73lpBKuMv1J2vMeqG5fPoMwbJ9vMX/vtFSI8btDth+BXq0NnwSj11o5KwhpbKKNC5tp1HECP+l6i5M6EFEhlX6PGmaheSvEYkdk+QHSEZmKFv9/34mCogbQHdmjvUiGMFuiZusWBibpKrH7C4rPAq8tW1L+fCQNGpotbBQVIjVRcqCTgPfgURtvlxRoMP6BAn9tLeP0HuIwdxJnFzLaps63ujQasZj9TacpHL70dDzC3KII1/4bgS1OeXOXDbKho3UWmOBi5WkugqfGsKWZRhDQHJxvTcK9Lhmdfco2/eyjkY8Uhek/qZCkRCWcPUFWM3I9C/BsMNc7JoaiO33lKNG3Z4kLTI429Fgzd1pDKIAf6sGWxeLR1m/hdvXva9G+TnJ+QZsmj0/3oqodQxYgVKX7P4g59uOVYrVp6zUhZKnt51Sy91nCS+OJBJIXQTGdbOTqAqQDgtetH8IIVCl8KX4o3QXqkrFRnx9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rsf/y+L5WEFBZ4EJJICbfeenulZlwky7JGC1MXWiN2nbIvBlY7SFo4W1fabU?=
 =?us-ascii?Q?80sfmLw8cHc9S8yRX8QSFQ0BqH/0GX5ANP9RiO0AvKy42nbSOgRUgu5mVI6Z?=
 =?us-ascii?Q?eR1bjMtXWnqg0qfbhIaZtFji+xbINuXQYUTM+ZHCaVqWrJowW0whl2/hpdn6?=
 =?us-ascii?Q?iusHmfAuhr6Cath2gFJrnDPDcAdMoSflR4/Nm9jMwFJTvNK1tnP1jBPUsYqm?=
 =?us-ascii?Q?qe7Kcjvy11SE7ORhkYHJSP1tIcIy+X8aZ0NHkvCCnzij3t4rGRlGh/vj4qv3?=
 =?us-ascii?Q?wOxvzR6obKU88BtOKXFE1ZhjXYvNGARM1cjP5wGmL4WL1RLN7fAwlTSCIINf?=
 =?us-ascii?Q?1Q6zZAqhKnb79q7UEBAoc/u64MPkdCy0TV3b3gQuvcROmgDdvTnQfjlM8fPs?=
 =?us-ascii?Q?KcKTPF5sX/MLdOfrjjYhut7gc9BWgGkbdbFEMWcvaK437+pps5kf6+bsvZH8?=
 =?us-ascii?Q?lCUqJNY/Yq/Ex3HoakkQdAg0+XBxd9Vw6n/syQbwNoOvH6eSLCW5+1L6rFZC?=
 =?us-ascii?Q?0xUBXRKbq9nTVP3e7D90UKZx3byaG9vbqapYVdSCBAzSgZUxM+9J/Emufskv?=
 =?us-ascii?Q?vDNxqERqruCFFIy19QMwyRCGFqN/jAeFxJauh7YY50QDajYP3B2N5N4Dc2cy?=
 =?us-ascii?Q?XCn8GcDrHPxlTpT0PzeJYobjk5zKwJJ5DQJ7SOMBkzHEReIiFt3wY3flOyQ1?=
 =?us-ascii?Q?MLncd0tNPg/s9F1wyeR3JB9qPe0lDNdgb9GIqK145etGUA6GzIhsrrKEvCFZ?=
 =?us-ascii?Q?cevFNwNq28QNFkHOaUq9YA+zbCWB9zPXgyWlI+KPig0xKpw+6tnFYfqAYBfB?=
 =?us-ascii?Q?44ZauDDyAk1o3oaKijDjRunAK39j0JkJ18i0v67xYkxAugaYGzHEXsD0EmWj?=
 =?us-ascii?Q?bZCZnup3/TqQdpe2I17CgRFScQBS6jZswhwqEu/EKaetZWXW53HN9fNGh1RP?=
 =?us-ascii?Q?WiPem/Zp97l5fOP1ompVVb80+8rv31MylW2r5dMEYzvxHrmfaUopPxijcxki?=
 =?us-ascii?Q?a8j/02hmp3bVmLs6wngThWxqen39TusKde7D0bsOHnTjRwLcrbCSNwUVANyH?=
 =?us-ascii?Q?mSOoKzUO4gCkRh+CbkiyL5xQHE8YiD6teGBy9fghmfB7DrxnwAmpxsuOId2Z?=
 =?us-ascii?Q?6UJYGeRVfxj9jAZIlT42Mf9Qw8T+rvVbMsKc0rH96YNV3SEKJrupro9jcfDy?=
 =?us-ascii?Q?Wmbj+mpxYmMuY1j4dC0IrkrWhJVG1Ih9fnrjIdt2uxuzuiqHTiTMrDdcCdEB?=
 =?us-ascii?Q?OX9YuiLlzWSMvFO0Xr0OJGg1ywNIy3dZh+01aVVwHur1MaPfh7+YUqxoXN4/?=
 =?us-ascii?Q?c5hNfAW0GYEOpmTzHRlhPGaMyTHSccLHuow7IYT8m+PH/1dEGhEsz+xXnrhy?=
 =?us-ascii?Q?eqcR0ITB22a0ejwLoItXGg+x5lf+n5izETO7xvEApCW3noH1S96YDGzZJqCP?=
 =?us-ascii?Q?qkNCS+LqjZmQf1XnhDILaGAuBzqF8EAzK+ZAnMLyd9zBn8aD8GIME1bt5wPa?=
 =?us-ascii?Q?XHzqIz9/tyrHBwnHzwr3cPTNB5+4h7W/XwMSURYQsAJEfE1FN2LwaF8IGm5D?=
 =?us-ascii?Q?NyCmKFx7ihq+/vtxHidyybXUQEkzNnVVvrWAzsEaa2JFJSRAr26dEYX6CSDw?=
 =?us-ascii?Q?ykqyFaMzper3UYxA7Qu11bB5jCcjiPQRSJsVWY2gRgA4wrWQ7+Y+Y0DY89wj?=
 =?us-ascii?Q?eVxdGy80nDfQvEbVoUiPjjYn1vA6Nesie29oQgd6io1agdGBIn22CacHCMzE?=
 =?us-ascii?Q?GyvH/hFKxA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VMG2mgG/L3h/81S6EZ2KBVZXmfTYdlDGNZGRfVPYCWLy/7zm0uEPuOLxu+3hGvO5JRx5+DvlWvGYlCEVcfx9ekGS+b5bkofdfGmCY5jiA9v/KQwi8PHpEJr9FyihaTMMG9DPi/a1Lg9Mj/HV/ofadYWKZAMKToAqlNMyHiDVPO9fM+qghPJSfpt9umfLdrlr9JXiY5zZjSlq5MlOK8DG81xcua/GGtlDvH+3BPUb5TugSIOroDar5xI5V1dX2qHGGb0RlEyFzSHsQPGu9YfFzyVOqHXiDP02LG66UK91RNUAR3kaheUQJ0ZEdpGAAh2Q1Y0tNrhOPquVQ8SNNEQypw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35930340-6c91-4ddd-9b5f-08def11ef9d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 05:20:47.5927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ha3WX2udvvd8poLxijwv9UZdvx7tiLH7LfWFGFH1MoJQoIhO/nGp/taIF5EppQHDKeFdEUGE1aZWEJmbanNwWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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

> Subject: [PATCH 06/14] drm/i915/dp: Add a wrapper to check frl/tmds
> downstream constraints
>=20
> Add a wrapper function to check dp_downstream clock/bandwidth constraints=
.
> Based on whether the sink supports FRL/TMDS the wrapper calls the
> appropriate FRL/TMDS functions.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 36 ++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index eb76e6b6d616..6bf42128a81d 100644
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
> 1213,20 +1235,14 @@ intel_dp_mode_valid_downstream(struct
> intel_connector *connector,
>  			       enum intel_output_format sink_format)  {
>  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> +	int bpc =3D 8; /* Assume 8bpc for the DP++/HDMI/DVI TMDS/FRL bw
> check */
>=20
> -	/* If PCON supports FRL MODE, check FRL bandwidth constraints */
> -	if (intel_dp->dfp.pcon_max_frl_bw &&
> intel_dp_hdmi_sink_max_frl(intel_dp)) {
> -		/* Assume 8bpc for the HDMI2.1 FRL BW check */
> -		return intel_dp_frl_bw_valid(intel_dp, target_clock, 8,
> sink_format, true);
> -	}
> -
> -	if (intel_dp->dfp.max_dotclock &&
> +	if (!intel_dp_hdmi_sink_max_frl(intel_dp) &&
> +	    intel_dp->dfp.max_dotclock &&
>  	    target_clock > intel_dp->dfp.max_dotclock)
>  		return MODE_CLOCK_HIGH;

Does this change maybe belong inside dp_tmds_clock_valid ?

Regards,
Suraj Kandpal

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

