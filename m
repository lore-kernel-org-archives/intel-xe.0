Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B27DCA5FB5
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 05:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5519810F1C6;
	Wed, 30 Sep 2026 05:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnBz66Mm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9451C10E7A0;
 Wed, 30 Sep 2026 05:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790747803; x=1822283803;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N7lC2TYDOyI/ZagYawHXiFSXzUgIzQww6IKwZF1gWHk=;
 b=dnBz66MmIkKVYPhgysJH/1pJNdTqNc8BVMYT0/h7+er80R3c/C1SyA8f
 5FQ2tG8untjuxJ4Bv8RwSQUiAid2FPmh+WYzQ46Q+E9uDWqsGc6TLVFAL
 Z0Eyq/GnZJgkWeCs6akrhiQWtoQuQ06F5/OT5/Lv5ektNJzP33etLdIVB
 C1VRjvajk1mQBm9Nm+1vUK8yiWeNadpph2cpW72ruvP4rG+i/GhJWKuSa
 UGRGh3z0Xz9RzjKnviutqq8vxPy8JzIk5bAS7OBajHamHV6x5DcBVp9Tl
 1k6xWmbh8BoFEK689ayaBaiB968CKfemxDz9fH4GLNv84zBkzqPboJxuA g==;
X-CSE-ConnectionGUID: X74vo6kySg6hxI8KCYK3mg==
X-CSE-MsgGUID: pqPPiDBXQFK/RTGkV0XW6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102150558"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="102150558"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 22:56:43 -0700
X-CSE-ConnectionGUID: 7VjyywEaTLeLI6QbCzZYzg==
X-CSE-MsgGUID: 346fCpqVTfqmQ9GU4jLPtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="313534353"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 22:56:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 22:56:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 22:56:42 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 22:56:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyOHTRECm+8XeWbNn7oSgbfZE2yXipP80rn2N7Gg1a2T3wYdS+/3DczK/Ph9/jsBVh76W6HWSwy3PPXeWaSeStifhPe1ZCGaRx3Ji1ob7KkxaEYHQIjYciRQsJtHn/1q5ng/Bdk288pVa+0e/BcOcPLV+XYm9hPsYQDY9lKpTRE7ThdHewrDw/cemGUG47mcZU6dylRfdJ0sN32JRIAGWHBkWl5QEkzXP6tzFAaPMn6BToPtDZIjWOWRCPuINjXvNmAJPK8D3dp0sVjvjwxYYZaiAfCsBoSGMj5Q0nl1WZZv4M5diAXUqRnJ/ZvHpzD8uERx96t7l+oILZaaVJZv2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwwEoHl0EnTEQSVC2mtquiXEi8CbsNXKGOVAHPhoLG4=;
 b=uTxrMhhR9AyPX1Gdt4Q2TTyJaqwQRHaeU1mrUDy3q6EG7oQVaGoRr1Kahhmq+AwbJM9eSBhT8znL+QTgSj9e6ms2PtrkFcL32YsCFETjTd3b4Y/dL96bJeA3RtvhD/9D13IeX7x0a/aPSzvAntEET1MKAaSLXjY6A3BOT/uUqb70DCt/qfO2iz5y5nZsO96PSY+an+ebgnVDWynlVdDUFO1P3BzcnR+6kgPl20uwCAYUMsinFeE/dW6Xo1VXW6N6aC4e9q+z7qlnVcWelyPKDK+Kf/ykeXT8cwZYceY2az1GRbN8bNylP1cqZ2sJ0zz1aVXG6ljh9cu3DwCrnwI5mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS4PR11MB086599.namprd11.prod.outlook.com
 (2603:10b6:8:507::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 05:56:36 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 05:56:35 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>,
 "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH v3 10/10] drm/i915/dp: Clamp PCON DSC bpp to the FRL link
 bandwidth
Thread-Topic: [PATCH v3 10/10] drm/i915/dp: Clamp PCON DSC bpp to the FRL link
 bandwidth
Thread-Index: AQHdUAJ4VpzwgpK6+kWkjJeZiWEb6LbmnuJA
Date: Wed, 30 Sep 2026 05:56:35 +0000
Message-ID: <DS4PPFE901A304F810476DD0A147D118178E38B2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260929104835.1050882-1-ankit.k.nautiyal@intel.com>
 <20260929104835.1050882-11-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260929104835.1050882-11-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS4PR11MB086599:EE_
x-ms-office365-filtering-correlation-id: c4c47d41-b610-4b93-b757-08df1eb79638
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|3023799007|38070700021|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: XCPgdLT7KSBhKRXjsyM0BTl+JPI38c6IALxf9i40H1McKQoPollMLhUvO+AT1Cx12e+T8/kpUEsYqEtLaNwmYNzU61ScaltqLgJnjlY9APmPZ4c1FxUNrlsSWhygoSqtv9sqp7QIqVFawubq57S169ZgMHr4QYvPHPn07wxbgXg288HAd7FLnaef3QZtRzakOoT2Eqwu42ktnL64pzQwmsYmA5D7OVUaisoa+JKG67LpTafALvRvcWTSbybDCr2UOfvbrzXJmsvPu5Y8X67MXd3DYeCV6Ekh+Km/0SM+VJyqA0pUlMMBW90/2lVCO7Am7VuFojXeyYOGchcztlD2gZzx6W7X+pb7sMd5yPYO39sHNRNSiwDcR3gZu8OqrSnGP+c0dRQ4PmqCQYgtGyehDvcJ+Fp66idRjHjJ36G/SeQOgzHSAo/deC94CFmcwvGq0HbUsWucaTkkHV9cqesdMDgyvArU4SLeBkxg6Ux+ZEEjfIfYYcVgj7R47du9ZEB9zTuah1sxH/q0V7pL7CnceNrPqCPPL+hySlA+mZOjQSQe/T/BUwVfCetoYjuLXxJCDg6EJ75PIa60WLefHWWyZYsbLDNUkwi8VYjImb1Nctym7ml0bTyLQfV0hZ/4FYWQIzV/yqrYbY19lu5+0LCpgy7cup7blDXw3G6Yg85oE6Hxbts1ZBmBJwsDUFc0P10SfnMBC8iGIoRJYdaynj/tBKhcUCvgToC6p1IzQ9YbjZ0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(3023799007)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HRWTjJg47LKc2E/j/1tfkG3F/rJmhmN+rBt+YAFFUU+k5yN2S8BchQz9wWVD?=
 =?us-ascii?Q?V1pxfG+mxA2Oa6TvNxZAMF1Gha6Nyl9ChaUtXBTBt9zoyK68FSmWX2sX/FGX?=
 =?us-ascii?Q?Rj1D4nsWUXgbHAygo9d01wytJE1XhlVsTj6cTaX6xxbu/wWpycdLziMpSO+C?=
 =?us-ascii?Q?+LBgluPSDde2jBTc8j7QuS5ujsUQWGi5EiMroeZhCC2mNLB75ppxHLzGOpeN?=
 =?us-ascii?Q?2pii2m9vEBhu5CEH09+eUDz0pSy9gout1LPG7WVn5Buu2XOClFCuaaK2JfmC?=
 =?us-ascii?Q?LSS/b56smYiqE0qzxB9uq+8Hvme2Un6nTBbXS/CLzHwpbWLHsL/UNMolM68c?=
 =?us-ascii?Q?rIiEyAjPi9NaoR4O3nGoNMB2+GrFu3rhnimmPIXZB63VLYt9kUAOEmAicq1a?=
 =?us-ascii?Q?gxpMG/gbTT0EBTFF/Ru1vejMxf7+pm3absamOxWz75HA5+veD3vzPIMhcssV?=
 =?us-ascii?Q?hDm0i2aHGksDNk54DHv5JezlBMQIzRxWts4jPpEc/s5P/0TSZmeR/I+70HbH?=
 =?us-ascii?Q?6dClP4/swjzXDStpEI73+E/MX4Cw/xv7hwHGJoTdEQSFcN/hQx712xevXJ7e?=
 =?us-ascii?Q?+jrPbstYkhUXZz90i0u1q2liIpYvUXCw0bpaIUvR7KSkdw5jxENhKh6VSDjt?=
 =?us-ascii?Q?22zOoqhFkSfK9D5gWFh4tnntQyjSmbhId/UlNffqJf9G31pC1mKtPkax3qVi?=
 =?us-ascii?Q?6qwfallCv3dU/wbIcwvi2UZqe0PyEldfEBOK7knPvgndXFoMAfLcguPTH/r4?=
 =?us-ascii?Q?3ITj3fwyggHe0zzHtEO8zGaoVgKhOVFjC3mPo0WTh4ktKBl8YJY9rY1bQ2rv?=
 =?us-ascii?Q?R/sXWlCCoH1zhm7NUVMoygb1UW5VOpZnqiDjj0XvLHK/zUWw3e2gItYFHElV?=
 =?us-ascii?Q?cCKE+FMIixEtK8z2vQ9iP/KPie+ipqWood87V0dU0O0KuLzxLTXL0F1o2QCi?=
 =?us-ascii?Q?JhSAQiMVl2POjiL3PeFoAfvaDYd+iUHLQQ84SwGmXsLMdKjiaEjrVi4f3h29?=
 =?us-ascii?Q?hIX5g08Y+xOK5/WWzlcTkX0Lh+AcznBHhElKwCqgkT3y4CwiActarLVObO/M?=
 =?us-ascii?Q?ECobnqWf27QZ+e9QtDvWXtOHW4b0CC9lyvfkPUt6WsIH/TNP2gA9lFTvpd6E?=
 =?us-ascii?Q?iLSXnNqL7j1+G5WcsrdyYjSv5Rr8RCIzyYirGWwvI6TCidsolKjc/p/M3vGZ?=
 =?us-ascii?Q?Hsb659rDXZQ/5xh7lMUaMguUVvrgJo9X04+DYtbTc+zWw6x8/WnqnAk3ulrj?=
 =?us-ascii?Q?fNkcWNzLUXaoo7s3bLCeXzRVd2UI3H66ANaDUXKy4hGh3GxmnVd+nUqxLOdl?=
 =?us-ascii?Q?hXmK//D4hjhA9XcbTPfCBoOCQGhiSQGr8T9sac0U+oeeXNGlyNYxi2JA6Kro?=
 =?us-ascii?Q?FHLtUFxShneVC2qu7BSzD07uu7qwmdrKSis9SruLN3d2Eg3xsLPNWa4QpfDa?=
 =?us-ascii?Q?v74HVJ4Y0TbbrWIbcOSvUryjX4e1xWedU4MY3rRuQfbJGdFMA7KVRGMyP+HF?=
 =?us-ascii?Q?JqzPodiQTrNl9xQt+/nC1SGWX0Z42KhiKOB4+NHmnX0dckYDCDQjtjHpU5to?=
 =?us-ascii?Q?TQt8KnLBpRJdyCxngSm2+tTbtiBgB/tgz6P1eIh18bbYxdej5dotV549Xur2?=
 =?us-ascii?Q?7vGbSEnzvH5/a/ZAAnOUZBiOCs+a+DOlMSK/p5ZnQQVtM6F3UUb28ylXJ5SA?=
 =?us-ascii?Q?raChKe8zL+OebLTCP5cDAOMaWJks/WDf1nmu+xXaAxTSooNjdkZh1B1TI1uT?=
 =?us-ascii?Q?uKWUFVLVgg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FcickDrxFX3MekiS+abg3W13Te1v8mZ6K+d02Dz/C1kzdWuixxM0NHWuaWOQADY3vECmeWOdqJevHOwdQl6rgDvIrt8GLFxy0tnI+Hcv74JbLqhhRTh8BFNi26DRaLwSwBtETjKtj6evufFxnR1ipbGO2mtam/UtssbQ3tBkjj3KxdjK8Du4v+BLuUu8s0wjqxxUSxdytSVWwcamFC56lPOY2eMmoiMtcs9CzU6XwT9XDar1lTpfIGMjXT7HB9j4bBVjs3lQtoiW8GPUqlfa80/nFVT1pnt7bJHF86+XdUaH66xScLI+xJGwLRMMdsOVnh68qgXM+oCVvpw9KfDm2Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c47d41-b610-4b93-b757-08df1eb79638
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 05:56:35.7928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zrx/05L7P6xQKaaEh3M1mqIr+Q5d9OecwCNqh9wp1GCQtzak7AJcuXDquvEAmbFN97LByrX1TV1zPgJe46p0Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB086599
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

> Subject: [PATCH v3 10/10] drm/i915/dp: Clamp PCON DSC bpp to the FRL link
> bandwidth
>=20
> While configuring the PCON DSC encoder, intel_hdmi_dsc_get_bpp() picks th=
e
> highest compressed bpp that fits the sink's per-scanline chunk-bytes limi=
t.
> However it does not account for the FRL link bandwidth, so the selected b=
pp
> can end up exceeding what the trained PCON/sink FRL link can actually car=
ry.
>=20
> Compute the maximum compressed bpp that the FRL bandwidth can carry
> and pass it down to intel_hdmi_dsc_get_bpp() as an upper bound, so the
> chosen DSC bpp stays within both the sink's chunk-bytes limit and the FRL=
 link
> budget. The mode_valid/compute phase already guarantees the lowest
> compressed bpp fits the FRL bandwidth, so this cap never falls below the
> minimum allowed bpp.
>=20
> v2: Account for FRL 16b/18b encoding overhead in link bandwidth. (Sashiko=
)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c   | 12 +++++++++++-
>  drivers/gpu/drm/i915/display/intel_hdmi.c |  8 +++++++-
> drivers/gpu/drm/i915/display/intel_hdmi.h |  3 ++-
>  3 files changed, 20 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index dee49b99c09d..611a06e97555 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4442,10 +4442,20 @@ intel_dp_pcon_dsc_enc_bpp(struct intel_dp
> *intel_dp,
>  	int hdmi_max_chunk_bytes =3D
>  		info->hdmi.dsc_cap.total_chunk_kbytes * 1024;
>  	int bpc =3D crtc_state->pipe_bpp / 3;
> +	int clock =3D crtc_state->hw.adjusted_mode.clock;

Why are we using adjusted_mode.clock here when just in patch 7 we started u=
sing adjusted_mode.crtc_clock.
Should we keep it uniform?

> +	int max_frl_bw, max_frl_bpp;
> +
> +	max_frl_bw =3D min(intel_dp->dfp.pcon_max_frl_bw,
> +			 intel_dp_hdmi_sink_max_frl(intel_dp)) * 1000000;
> +
> +	/* FRL 16b/18b: only 16/18 of the raw rate is usable payload */
> +	max_frl_bw =3D max_frl_bw * 16 / 18;

As mentioned in patch 8 this can be its own helper=20

> +
> +	max_frl_bpp =3D clock ? max_frl_bw / clock : 0;

I don't see the clock being 0 by the time we are programming the pcon I gue=
ss this check can be
Dropped.

Regards,
Suraj Kandpal

>=20
>  	return intel_hdmi_dsc_get_bpp(pcon_fractional_bpp, slice_width,
>  				      num_slices, output_format, bpc,
> hdmi_all_bpp,
> -				      hdmi_max_chunk_bytes);
> +				      hdmi_max_chunk_bytes, max_frl_bpp);
>  }
>=20
>  void
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index ee76391c77e8..3ad22fb1876f 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3470,13 +3470,15 @@ get_dsc_compressed_bpp(enum
> intel_output_format output_format, int bpc,
>   * @bpc: bits per color
>   * @hdmi_all_bpp: sink supports decoding of 1/16th bpp setting
>   * @hdmi_max_chunk_bytes: max bytes in a line of chunks supported by sin=
k
> + * @max_link_dsc_bpp: max compressed bpp the link bandwidth can carry,
> + or 0 if not limited
>   *
>   * @return: compressed bits_per_pixel in step of 1/16 of bits_per_pixel
>   */
>  int
>  intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int
> num_slices,
>  		       enum intel_output_format output_format, int bpc,
> -		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)
> +		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes,
> +		       int max_link_dsc_bpp)
>  {
>  	int max_dsc_bpp, min_dsc_bpp;
>  	int dsc_bpp_x16;
> @@ -3484,6 +3486,10 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp,
> int slice_width, int num_slices,
>  	intel_hdmi_dsc_get_min_max_bpp(output_format, bpc,
> hdmi_all_bpp,
>  				       &min_dsc_bpp, &max_dsc_bpp);
>=20
> +	/* Limit the bpp to what the link bandwidth can carry */
> +	if (max_link_dsc_bpp)
> +		max_dsc_bpp =3D min(max_dsc_bpp, max_link_dsc_bpp);
> +
>  	dsc_bpp_x16 =3D get_dsc_compressed_bpp(output_format, bpc,
>  					     num_slices, slice_width,
>  					     hdmi_max_chunk_bytes,
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h
> b/drivers/gpu/drm/i915/display/intel_hdmi.h
> index 375f1b4decfb..acc025ae507c 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
> @@ -56,7 +56,8 @@ bool intel_hdmi_bpc_possible(const struct
> intel_crtc_state *crtc_state,  int intel_hdmi_tmds_clock(int clock, int b=
pc,
> enum intel_output_format sink_format);  int intel_hdmi_dsc_get_bpp(int
> src_fractional_bpp, int slice_width,
>  			   int num_slices, enum intel_output_format
> output_format,
> -			   int bpc, bool hdmi_all_bpp, int
> hdmi_max_chunk_bytes);
> +			   int bpc, bool hdmi_all_bpp, int
> hdmi_max_chunk_bytes,
> +			   int max_link_dsc_bpp);
>  void intel_hdmi_dsc_get_min_max_bpp(enum intel_output_format
> output_format, u8 bpc,
>  				    bool hdmi_all_bpp, int *min_dsc_bpp, int
> *max_dsc_bpp);  bool intel_hdmi_dsc_bpp_fits_chunk_bytes(int bpp, int
> num_slices, int slice_width,
> --
> 2.50.1

