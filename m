Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550D8C9830E
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 05:40:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCA410F1AE;
	Wed, 30 Sep 2026 05:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a32WSk1q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59D610F1A6;
 Wed, 30 Sep 2026 05:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790746837; x=1822282837;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lqYr6sTDYUfDsOh0o/DCJcG2KLq7SNXeOESlovBxbMc=;
 b=a32WSk1qsR4EIegCpPUjclePTVNh3rjR+9wkjb/FeBmlZnU6f8575dG5
 DaNMk/UXo3MKXyhIlxBCNm50oarnnndn0WhjQ1saaYwDoEUqahb1+FKzA
 po0ppL0+YLSTzmH7hlc8i8dgt7I8XBayjelIgBomn5GMwF+meqvHA42L9
 JAH8/xCMVcGX9kpJKwlP0SgHRtJYKp+lwGHvkeBwkSHtS9PoaDluoITm+
 E9Uci2ZznSPUJFwPDMkdnzUutaDDsiaUhxoCH8SGXbdVV8o7OGkoVW12R
 /SSvruP/eAoAXBLWXJNcPVG51SSM3uxSJRxKC27p064A666FXMfGTWByR Q==;
X-CSE-ConnectionGUID: 86E68gKeQkyOQgOXWQuGZw==
X-CSE-MsgGUID: sMRbuNkkSRu741nAkcdT2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="101637778"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="101637778"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 22:40:36 -0700
X-CSE-ConnectionGUID: +Wyr7gyUSTektX+ayZLLJw==
X-CSE-MsgGUID: OxTbjxtKT129ErnGD6yCEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="275142328"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 22:40:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 22:40:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 22:40:35 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 22:40:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLssinnY4qYRSxJ7Ml8YEy9dDjPAcH92p02Q3ZrJias3t75Ce1SNIjDl075FFJ8L8/LSwFHz52Gbv0/oCWn68kF/VW/y2hXgQZh/gTnlBYgib3m6RaJrSPSmghgnnGUuy3E9xa2PcM31v6Hs8pW1WO8m5wt/whWhjnv6ZuvLpZfTUIwmt59HzKZ0G+7B5P3Gj7ZXshNJVUadzAQpY08rv9C3Fu5FUWK8NAo5Ye3ad4AYbZJtuQWCkVLLp1WdnUDTv2gQ+mX2kNSbILf+tTzN9wnuz8CxmqbyhRoEsCRQrYyGwUDqF6VQKtl3Jne2IZCdeqKeN/uDuz2TrNhUDs27BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKozaMvw3sevroYHUBnn8Dxrf96Xva3eEycGNWZU1fE=;
 b=AUs2xkl6S17yv6D8EjqziowFA+5ZRcHt2I4FLYvEuTixvHz3UnKTEvccypSAMgaJnom7RKFD/41lqcGoexl6KcESmmxIUNPg0IziPvMI9JGQ96c8lbYrapDRfGeFGytOL9QaSRyHf1ygt/Uyjm9YuxQf36SgHcOFpkBfBFq82GFwt5WAYK+ntcu5Zl2BD2QsHPbeeLtqhCKGMZT2RJTS5oUkePv9bGqbOSJsse2H+onBfn+df0PwBMqf63JFI9YLANzzHqnE2DfEEhVlMWDedTIewUPx4LcSEcYG096m26XaGdMw1dtgkgqVpJPhG1FaKfGf1SuSxELNNaJggdadvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH7PR11MB5768.namprd11.prod.outlook.com
 (2603:10b6:510:131::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 05:40:28 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 05:40:27 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>,
 "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH v3 08/10] drm/i915/dp: Allow PCON DSC modes through FRL bw
 check
Thread-Topic: [PATCH v3 08/10] drm/i915/dp: Allow PCON DSC modes through FRL
 bw check
Thread-Index: AQHdUAJ0ZXGsi6IBaUyvVgfWnJMdfrbmi2vw
Date: Wed, 30 Sep 2026 05:40:27 +0000
Message-ID: <DS4PPFE901A304F98FA0B8D06135BF1811AE38B2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260929104835.1050882-1-ankit.k.nautiyal@intel.com>
 <20260929104835.1050882-9-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260929104835.1050882-9-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH7PR11MB5768:EE_
x-ms-office365-filtering-correlation-id: 5d9b8f8e-a89a-4022-28f6-08df1eb55528
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|5023799004|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: 5wsdIZBkEUiHM5nQH39bPod42vsUmZbqDPvMtAAAV6s6ycwlLH/X58PX3WKOGbXHxg542c8HmmST7PaXpNGkSsC3xKAWWDYdzVmYEKsS4INWP6XxtfPAIDdhlH5kbT/FRVitbBrt3ciI6f5Xm1SdaEzpn1jwiA1MJf9onwZGCorDI6278051gUK9xx0GEmasQvVIm+CqbHAeqeTzehCJ1fUBjbqr5eNV+iDGKApksTEY3cTCmiyluc4JVI26MInhQbvtTa/dGbm6SODr/l78hJ7UxZrF+/d5YF0P8HdrQ1KfTzS4tFWohbn5TrM/cfSoBt6RL7N9Zi8NAufyOpBeRN86EE891RSdqK6ddR/If5d+wMkDpbbycOgpYUXGWS89DaGspJtq5MoMz2RyN1TOtA6dBZAy260I+Tkw9YQydDaKQPl1CuHGIWe63v09f1O6B5bH63FIYJGhlspAgWU/wDkly+0BK8pff/hwW+y+Dwl0YZsMG9EbxewDuX9liwLA2vUwV+9FEieqJTjWdlrOZXBm6d43NZuTboohrVtbDZQnot4FIfyl/bba1lHT7GqLyeQ6zs2cVu3Cvm8Noyr1Emc7aJPHKOlurnc2W08M4oki4dmLNgDxkY2foEF3Vxh1HMQHGP2PqoDvRZU2CByjyesyAkgdxsbLZx9BdfrFGnRe/h8ljNKH4LPQBzS9eYw+d1rhZCFIU9RnyprXmUBoVc0qvForj6EJCMktwY0vC4g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(5023799004)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kInY8eqloBtYK+RJkfbuWjJRrgy4RjWAyMxCrnfoWDWVEIzagc8NkWWM4y1C?=
 =?us-ascii?Q?bHXiG6NP4qYErOSmK7hKnvjRe+6bl3x++jnRVYEHKYjb0HUNSAeV8gy2hj3C?=
 =?us-ascii?Q?zV5skj4YPtqkTh3rlJL/2ECtCjpkeG3rv8axeR7zDSiNaDvMLLUTKu6Ad4aj?=
 =?us-ascii?Q?TF2OjMW6rHp4mFi5cd2bAHjW7wBgDiQsU+hgWCrk6EM+Gp+70Ahh2OSnUmPz?=
 =?us-ascii?Q?jjtWPgyegXUa8vc2bq13ZBAnythf1/gXJ0wrZgU/3cNpXZf0TCQ56FWR5Lny?=
 =?us-ascii?Q?f0XX3F2eiU13lLyC9cwbvqOa3FY/L47s14hgHWYzUTcWSvyK6OlOkpseF6W9?=
 =?us-ascii?Q?2FKZNBcdMzxMXvW//E0TzM3KIDvRYdkmQuKmXs7IL/IFh0sre4VQv7F5EW7/?=
 =?us-ascii?Q?6kp20HRRefov36bneJXdGr8A/p1VMkAxi6tVbykGm91A6YximtF99vvRobUM?=
 =?us-ascii?Q?nt7jEgSrOH8GAMhF0x/WEKaSDOuK6ULEssQqesB5+mj3g4xxPvZdP6k6hCmq?=
 =?us-ascii?Q?Mh51zKwDD6bmK3sdQjj27pQxmSuIeeHLkyB+UKWa1fSoj6H7rRALgjZR0IWz?=
 =?us-ascii?Q?oCuvDvKG+i2kXBPr9g/iF+e226dYrW33gEjG0V2kx32xyHnE8mYlRCmxjnEC?=
 =?us-ascii?Q?e/JSjxP2Zp2/Rlqd/g/NPlLjpMK7zBo6f6P4FdNGiDVYUgRQSTR47V6bNvDT?=
 =?us-ascii?Q?tR1jJIcbw+Q1wIAb6oeB6IczXyD/R4txHK5qalxr2ior5zlcs12AjXoS+VsO?=
 =?us-ascii?Q?+rogVCtJqaRMIn+Dze5v+8xYshxtoZsYgWfWnTPAUkXIwSmh1PKepZ87HHiR?=
 =?us-ascii?Q?JKtrEueNI/LO4YdO99yZxY2foykMvecqwcNb8WHTYa+Hh8QPGNwGDIJm0Owd?=
 =?us-ascii?Q?WQHS4Xx7VcOrO65Re6DzXXc57IyIgYo6phuXEpq1j9AB7azI1JqzB8Phr/q7?=
 =?us-ascii?Q?aPH62UO1QUQ4EwqSQZa2w75ZUfgDdTBe9oGinl7oicpN3tN1v1E3geFcGbgk?=
 =?us-ascii?Q?XwwUoiaHlcxD+2TrZ7RSo7CUu/VaWslSwaoac6SkSG8vLTXZI/V3xiG8bMm6?=
 =?us-ascii?Q?bOka8yOEYFxjhxtG8IusPt/f84dSUOydK81l08eXSQyun4trzm0MbqQI8sFd?=
 =?us-ascii?Q?yQIrk/zrko9KYGrtushm9Apl8zsmyYdyMtPgPdej2DVmQkKX4MFYPbLNj4Ad?=
 =?us-ascii?Q?ABDW4MlmXgSKpNqEyv1C2RlBti9/njbxqFvtgVulLvoQvzFtpFaiPwEF3JbA?=
 =?us-ascii?Q?9g1VBPgMy0eSgsXyWREcBvRypAMI92z+xU+moVbkSmrhRKbxr4OLrrcs54Hk?=
 =?us-ascii?Q?QxkwAgLzXIJtYMi9Rsnzn+nA12w7FnHaARudJzSN0Yq8hZUngMSVGH7odGlS?=
 =?us-ascii?Q?Iiz94MRI19NOAepGwVxrEbQmzCmh0SP70XKAUBcOddCAkcyq9N3nMpErYnry?=
 =?us-ascii?Q?bIyPDu20ri8LtM9d9/jCSOLDFUkF2aFaQf+JUZT4es3VVP4O/O9qKK5wmsEe?=
 =?us-ascii?Q?zSsv/sJmY2X1TMNMy2m7xh8OV6GNybl5Ouw7SKDe3KK+6lz0HITsUdFI+nW0?=
 =?us-ascii?Q?c+qlmC+8rdrptk7QN8vWGY6fj2YemzJfwUWyKKwiTlDvcjqHgX2vnFVE4wDq?=
 =?us-ascii?Q?HXl+GRL7O+agOnR/pTQm/9U2pOFnxfUJnzDgEMf6JZBHz8S3Ut+TpSCEFLI5?=
 =?us-ascii?Q?C+Jz0dDSraxo8iV+N8GG3uoc8nfimhlsCctjj12jegHW31oip8HKZ8NR+oxc?=
 =?us-ascii?Q?Df/lJLtJrw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BtVtR7IRAYsuvfsyiou4BsDkOXc52xnWOivm0wKi6Tzpk/QlJKvgt1hmy3ySvumkHIC70Xd5AHVILnQJjYxv4+yp+f0bFsDruNKknQfJgB7eoYLMPEpG3/Y/qw/t8A0bakkX+QtyLVPeBWY/NL+2qU6Fz8MbhQlCGe19/U3SsCKFJYuajfR23v5TcilQjEcqCeRkFEeBZY7RJ82x/b6YeXnoxpcOUieIsCdJ1phMUtVO0AU7v0KS1nBRYVuNNZhS88Hrp+Iid0c3HgAwhce4ccib5boNRD3oUdukYF37HpN3r/ZKB798S4jaf/mz/Zbdu3w03hFOhmJBFaQvhs+KEg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9b8f8e-a89a-4022-28f6-08df1eb55528
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 05:40:27.5563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KxjG7CBLVvCNIZDsLj5jfV+yJN63k4L+y1cL1um3DhYN+aiExVD7V3SZDEBjOBkkn/EgxouEWEOMwD2D5gC+Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5768
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

> <ankit.k.nautiyal@intel.com>
> Subject: [PATCH v3 08/10] drm/i915/dp: Allow PCON DSC modes through FRL
> bw check
>=20
> intel_dp_frl_bw_valid() rejects any mode whose uncompressed FRL
> bandwidth exceeds the PCON/sink max FRL bandwidth, even though we are
> capable of enabling PCON DSC encoding at modeset time. As a result, high-
> bandwidth HDMI2.1 modes (e.g. 4K120, 8K60) get pruned for sinks behind a
> PCON, despite the PCON + sink being able to carry them with DSC
> compression.
>=20
> Now, that the HDMI DSC helpers no longer depend on intel_crtc_state, reus=
e
> them from the FRL bandwidth check. When uncompressed transport does not
> fit, compute the lowest compressed bpp allowed for the output format and
> verify it:
>  - fits the sink's per-scanline chunk-bytes limit and
>  - resulets in the required FRL bandwidth within the PCON/sink limits.

* results

>=20
> This takes care of the existing FIXME in the FRL bandwidth check.
>=20
> v2: Account for FRL 16b/18b encoding overhead in link bandwidth. (Sashiko=
)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 84 ++++++++++++++++++++++--
> -
>  1 file changed, 75 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 412edb5b8c5e..dee49b99c09d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -127,6 +127,7 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
>=20
>  static void intel_dp_unset_edid(struct intel_dp *intel_dp);  static int
> intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp);
> +static bool intel_dp_is_hdmi_2_1_sink(struct intel_dp *intel_dp);
>=20
>  /* Is link rate UHBR and thus 128b/132b? */  bool intel_dp_is_uhbr(const
> struct intel_crtc_state *crtc_state) @@ -1181,8 +1182,59 @@ static int
> frl_required_bw(int clock, int bpc,
>  	return clock * bpc * 3;
>  }
>=20
> +static int frl_required_bw_dsc(int target_clock, int comp_bpp_x16) {
> +	return DIV_ROUND_UP(target_clock * comp_bpp_x16, 16); }

This seems like you just multipled and divided the same variable by 16.
Did you intend to use this function elsewehere too, otherwise this does not=
 need its own function


> +
> +static bool
> +intel_dp_pcon_dsc_fits_frl_bw(struct intel_dp *intel_dp,
> +			      const struct drm_display_mode *mode,

This should accept a target_clock variable which can be passed via intel_dp=
_frl_bw_valid()

> +			      int bpc, enum intel_output_format sink_format,
> +			      int max_frl_bw)
> +{
> +	struct intel_connector *connector =3D intel_dp->attached_connector;
> +	const struct drm_display_info *info =3D &connector->base.display_info;
> +	int min_dsc_bpp, max_dsc_bpp;
> +	int num_slices, slice_width;
> +	int hdmi_max_chunk_bytes;
> +	int pcon_max_slices, pcon_max_slice_width;
> +
> +	/* PCON and HDMI sink must both support DSC 1.2 */
> +	if (!info->hdmi.dsc_cap.v_1p2 ||
> +	    !drm_dp_pcon_enc_is_dsc_1_2(intel_dp->pcon_dsc_dpcd))
> +		return false;
> +
> +	pcon_max_slices =3D drm_dp_pcon_dsc_max_slices(intel_dp-
> >pcon_dsc_dpcd);
> +	pcon_max_slice_width =3D
> +drm_dp_pcon_dsc_max_slice_width(intel_dp->pcon_dsc_dpcd);
> +
> +	num_slices =3D intel_hdmi_dsc_get_num_slices(mode, mode->clock,
> +						   sink_format,

We end up using sink format at almost all the places when checking for mode=
 valid which is correct but
When writing these params to pcon when end up using output format which mat=
ch in most cases but will
Mismatch in corner cases
Check=20
intel_dp_pcon_dsc_configure() -> intel_dp_pcon_dsc_enc_slices()


> +						   pcon_max_slices,
> +						   pcon_max_slice_width,
> +						   info-
> >hdmi.dsc_cap.max_slices,
> +						   info-
> >hdmi.dsc_cap.clk_per_slice);
> +	if (!num_slices)
> +		return false;
> +
> +	slice_width =3D DIV_ROUND_UP(mode->hdisplay, num_slices);
> +
> +	intel_hdmi_dsc_get_min_max_bpp(sink_format, bpc, info-
> >hdmi.dsc_cap.all_bpp,
> +				       &min_dsc_bpp, &max_dsc_bpp);
> +
> +	/* Use the lowest allowed compressed bpp for the best-case
> bandwidth */
> +	hdmi_max_chunk_bytes =3D info->hdmi.dsc_cap.total_chunk_kbytes *
> 1024;
> +	if (!intel_hdmi_dsc_bpp_fits_chunk_bytes(min_dsc_bpp, num_slices,
> slice_width,
> +						 hdmi_max_chunk_bytes))
> +		return false;
> +
> +	return frl_required_bw_dsc(mode->clock, min_dsc_bpp * 16) <=3D
> +max_frl_bw; }
> +
>  static enum drm_mode_status
> -intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
> +intel_dp_frl_bw_valid(struct intel_dp *intel_dp,
> +		      const struct drm_display_mode *mode,
> +		      int target_clock,
>  		      int bpc, enum intel_output_format sink_format,
>  		      bool respect_downstream_limits)  { @@ -1201,11
> +1253,22 @@ intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int
> target_clock,
>  	/* converting bw from Gbps to Kbps*/
>  	max_frl_bw =3D max_frl_bw * 1000000;
>=20
> -	/* #FIXME check bandwidth with DSC if both PCON and HDMI sink
> support DSC */
> -	if (target_bw > max_frl_bw)
> -		return MODE_CLOCK_HIGH;
> +	/* FRL uses 16b/18b line coding; only 16/18 of the raw rate is payload
> */
> +	max_frl_bw =3D max_frl_bw * 16 / 18;

I think these calculations are again used in patch 10 maybe lets create a s=
eparate helper for it to avoid deviation in
Calculations later if they get updated.

>=20
> -	return MODE_OK;
> +	if (target_bw <=3D max_frl_bw)
> +		return MODE_OK;
> +
> +	/*
> +	 * Uncompressed transport doesn't fit; if both PCON and HDMI sink
> +	 * support DSC, check whether DSC compression brings it within limits.
> +	 */
> +	if (intel_dp_is_hdmi_2_1_sink(intel_dp) &&
> +	    intel_dp_pcon_dsc_fits_frl_bw(intel_dp, mode, bpc, sink_format,
> +					  max_frl_bw))

we should be also sending target_clock so that we are using  same clock to =
derive=20
target_bw

> +		return MODE_OK;
> +
> +	return MODE_CLOCK_HIGH;
>  }
>=20
>  static bool
> @@ -1217,13 +1280,14 @@ intel_dp_pcon_sink_support_frl(struct intel_dp
> *intel_dp)
>=20
>  static enum drm_mode_status
>  intel_dp_hdmi_bw_valid(struct intel_dp *intel_dp,
> +		       const struct drm_display_mode *mode,
>  		       int target_clock, int bpc,
>  		       enum intel_output_format sink_format,
>  		       bool respect_downstream_limits)  {
>  	if (intel_dp_pcon_sink_support_frl(intel_dp))
> -		return intel_dp_frl_bw_valid(intel_dp, target_clock, bpc,
> -					     sink_format,
> +		return intel_dp_frl_bw_valid(intel_dp, mode,
> +					     target_clock, bpc, sink_format,
>  					     respect_downstream_limits);
>=20
>  	return intel_dp_tmds_clock_valid(intel_dp, target_clock, bpc,
> sink_format, @@ -1243,7 +1307,8 @@
> intel_dp_mode_valid_downstream(struct intel_connector *connector,
>  	    target_clock > intel_dp->dfp.max_dotclock)
>  		return MODE_CLOCK_HIGH;
>=20
> -	return intel_dp_hdmi_bw_valid(intel_dp, target_clock, bpc,
> sink_format, true);
> +	return intel_dp_hdmi_bw_valid(intel_dp, mode, target_clock, bpc,
> +				      sink_format, true);
>  }
>=20
>  static enum drm_mode_status
> @@ -1653,7 +1718,8 @@ static int intel_dp_hdmi_compute_bpc(struct
> intel_dp *intel_dp,
>  	for (; bpc >=3D 8; bpc -=3D 2) {

Seems like new changes in function in a DSC panel bpc chosen will always be=
 highest depending on the min_dsc_bpp
of sink format.

Regards,
Suraj Kandpal

>  		if (intel_hdmi_bpc_possible(crtc_state, bpc,
>  					    intel_dp_has_hdmi_sink(intel_dp))
> &&
> -		    intel_dp_hdmi_bw_valid(intel_dp, clock, bpc, crtc_state-
> >sink_format,
> +		    intel_dp_hdmi_bw_valid(intel_dp, &crtc_state-
> >hw.adjusted_mode,
> +					   clock, bpc, crtc_state->sink_format,
>  					   respect_downstream_limits) =3D=3D
> MODE_OK)
>  			return bpc;
>  	}
> --
> 2.50.1

