Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE41AC5516F
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 05:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D8410E2E9;
	Mon,  3 Aug 2026 05:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UF2V5xoL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD8510E215;
 Mon,  3 Aug 2026 05:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785734566; x=1817270566;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R5rfKqKNwSqUpoM7TM6lNcaGVzIKae8rwwXERtXFn0c=;
 b=UF2V5xoLVaXv0LASQB2+qnRKJgc0/qs4G9hlFQ6/1ZFu+9VtQEFFtepX
 5lwyjHFy8qwJBDFmT2d7ONZatChvNqRjM3m792izyrsUDHXV4iozbRo45
 itoepOz9L3Seg2zrDLF6PjpeeCtIrQlP3mOdn1mvI5PgYbKTTczxdDcyM
 N8Gxv7hBw5iuZVG0XYSuthOXg2UsPxyJEBd/sNNSrYwf9wGg3pM04uFUS
 cL6wA1vQkDRKU4jR7kWX21DAczbQULxHxWLIvBBiH5XvbjLRt/iKJ4rzj
 nlOyMN8VZhphVlXcyXE3Fb6TppOUpBfWJB+XnTsFlfyH+iZk8aC2GEHzP Q==;
X-CSE-ConnectionGUID: WfJZcucNRHyC2TowAy+NsQ==
X-CSE-MsgGUID: fi7uq9apRjWW+C4Ck2EqrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86214574"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="86214574"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:22:45 -0700
X-CSE-ConnectionGUID: ih9/1ov3RRa+XZbq+T7FRw==
X-CSE-MsgGUID: 203yUeh6QbyrYd3CU5gUew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="285752149"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:22:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 22:22:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 2 Aug 2026 22:22:44 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 22:22:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3yLOYirmxOn3BHcOqxn20aH6my3uysZl7a2AOdQDptypypnr1zSh8OAeuEE+ikHo1CWdSkpDlNtCOup1WV4cL+MKJyHRWU8HKKc3R2tDvSL0QdP/xC+AZ9DKsXVyGSCxq8fFiLyXQCHf/aPetJsaecaFUGo2v40tNTlAhKsZvyeWuQ2OUD61gHOl+oJgkuwmVdO+UxfZJt8qh78SZrsIfuR16hTMEIsT7u/8eRDT+Gvudbp8LpJaGw1DyBpjRQaTrizbXsILbap7/vV5orq46yTtO9cWq4GKugR6SENHwoSSxagKG06dT+TTyvpr+g4aGtOV/1U7U4k5U23VydopA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MYmoGqm07MriP45YPvTbVyvwpw96gS6K4x2fwu+Wqw=;
 b=TDtdKL8M/jY61f1z2LQ+QeeN52bhMzuSodpikW2YZ4U9nPJBGr5+/tXxS7U5T8kQVIfTlnsQy64jFkBEC8btGYK0NZJdNeEgcES3VQez+EieZ825AX8ti4UYCPDNrtiJjSX7hxHHQ9mSgFuyH3hCw7w5EkRbNn4kB0NXHGJgMfwVswG0dcGeNlrWHyM149eM89bk22iTXvuPowi0uXSqem8W10Sjtd0Y89e0u5ZXDP3+VesaFnlz9fPSppThxGHxLpE7ZG7qHGV6dm6Wsgve0phwoBOQgv5ZZhcDM9WCVyAgebZcYspw2yCMD8iUUUgjRVW36//tn3xAoWXaCtzPcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SA3PR11MB8074.namprd11.prod.outlook.com
 (2603:10b6:806:302::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 05:22:42 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0270.012; Mon, 3 Aug 2026
 05:22:42 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 07/14] drm/i915/dp: Use FRL pair check for the DFP
 dotclock limit
Thread-Topic: [PATCH 07/14] drm/i915/dp: Use FRL pair check for the DFP
 dotclock limit
Thread-Index: AQHdIBla4ebh5UQVQkyxY6eZiLEQ/raLz5CQ
Date: Mon, 3 Aug 2026 05:22:41 +0000
Message-ID: <DS4PPFE901A304F33C54E4649D1BD8EDC7BE3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
 <20260730105226.2731341-8-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260730105226.2731341-8-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SA3PR11MB8074:EE_
x-ms-office365-filtering-correlation-id: 706987bd-1163-4842-837a-08def11f3e0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|4143699003|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: F0A5XsZYDc+UaZ1fWCL1Ye2VBVqH7G3m/uWQTir0Kw/P0BnXFoe8hthBK0+PsidPeCc8Yb6+iZuyE8dFI3jXMzvZNfKlAuHgc+884XETTMBunYmy2KIXWZAd9BY0lPo9HZ6ufUlESbwibLhEFJ8FkAVrj8CvbD+8LYSdPBKH0OgGzFPOAiKOF69ytBGJlLWop6TneNmItCzgKgpOLwww1FnO1oP4bJ0XJprrrukaznKHDPwW7FXU+YQWje7XAtBzm+FAxe6rPE7mXDYi7dr+OovPu1A5NdYYgJXZCr06cFbR2nG3z7ptxL0gVvHVt95HgMVxNtYPtrtsMJRAW7wez3EdvPHZfySzrIRSqI+hMJYVYUKgxQbJrAuNHcpLppfh1/8AD6/d7o0OfVjSjHCB37pMPd3mRpw+UQ2Ggi7maIIKgx/vcHv0dI1uN3pFo0juyqJzIsplREq0hiibT+6aIdm8Orx7wkD3qw3roST7zAdrRV7JFrlbR9BwZHfon/Qdr6UJdkWSlbGHAMtunkqObXjGPSN+b4ysP8bc+R6lKKQ0ieL8Wu8ZFSH9ndQ2Swj3gp6tQuR8jhw8JqjRGRKLPyb7ERN28y7tJzLPGwIJfQ36XJCAOHWld8Kq9b9XZlpcL0jAAE83RxGpjdcjXpD7D9b1aV5cTU+GWuj9FypAicjVo2btb2iw1zq4yI5nqq3s
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?d0syPJ8MLuMfc8y9iXhrdojP4XN5l5wiKem+5O6VCjP/ijmxCk/+cGUpylIb?=
 =?us-ascii?Q?XB4hMzbHtrnrBoc0j21Je/1HwsPDCgrYiD6rRvYgQVK82dX+zYMe0jD0M3Ub?=
 =?us-ascii?Q?2MSuyv3FoxpQQeEWMx0NALXweT4xrE+TqzEkoobm7YSmfPLYuaTgphwwnqvi?=
 =?us-ascii?Q?AztNNVXwP5CX0y5SPN45tbOoZoeaB/6w9XahHnG3+uZWvQwPxzzAlxNefeGK?=
 =?us-ascii?Q?vawNrRe9h3GAC0Hw+ehnCjca8TfEfZZYrd3DluNJN27DD4xjwqYfaXr64IU0?=
 =?us-ascii?Q?2vZ2QLA8HTLUhxYtkkzB9wgpfV628DpWZ9/Xa5ZtTxaWWj/9VCFgtm3KbdM4?=
 =?us-ascii?Q?hshx3WjUwfreZXE6E2QBWzT/vX60/vZzjlEte4gDdf135ooyHdi7CUqtbBsb?=
 =?us-ascii?Q?HxA+AOdrXfXkMLy6xcVCIV88xFt7qZgRpJf/SYkjlwmiNU5QqI01Pn8T2KAm?=
 =?us-ascii?Q?T3THL44aBMQvd5lic6TnMqXg5bB4bvdJfZCsJ1ZhHbt9+W0eLrFEzoALwogn?=
 =?us-ascii?Q?uXyMTZfTxFNRnSrmkrNjt8lIU63bZyjqoRjCAVgZORtoPu8vryYfa5OQSnSS?=
 =?us-ascii?Q?lhzYTIBvOJRo9QFIsZ/CnxtTrchKGDGwYYHdS3JIXt0Bw0UX/B1LWn9Up65u?=
 =?us-ascii?Q?AcILLfRBJArGfxxf7Aj6Cyj16Rkr6rYneGFMrg6Yt+UAWqqOKN1zTNWACARM?=
 =?us-ascii?Q?4ODOch9vchdtRUOoaKTi5OSYn+51F+sAH+UGOS8jWnYDpGOM4UmZPDPJbch+?=
 =?us-ascii?Q?pIlG/YV0zHpEjhD9gQKyWXOcCFAAnWI3q7KQBY5EjsKOeUScFuoqMFRCofsU?=
 =?us-ascii?Q?TaM1qA5p9uqDOKai+90XNpxtFm++4fzOv1jKtmz+Mm51c0NBl7gKROOFTLeX?=
 =?us-ascii?Q?rt2kdaMwLYMY9uEsV6S59tTd8cVCu49bYpOErdOnffIY8XYzjqXpi53yUBLM?=
 =?us-ascii?Q?f1asExj91mR49XSjpFzvp961wlnz41t4Ssb/t5m4KRnCzpsACTp9E4DmD8DX?=
 =?us-ascii?Q?R5lCWkuoIo0DgmkJWuA5GCGFVO5fsnZBD8jMgWZcVr6vZmnbcgD477OBRj8U?=
 =?us-ascii?Q?Dwv3aJ0C40AxtqenBP5RwlRvuo3tYuF1Qc5nllo3Jd8ZJ+ZaFXq7fZmIk9LN?=
 =?us-ascii?Q?38XqRwl0lKQS60mHHxpLEQaU+VpkaTDnb6ZsQoxiZXrhIHoLWxyKg/DZV8UR?=
 =?us-ascii?Q?VXoauYTZ0d3sSto6awk7atqgTKCtF14GDUD3zSEgxu9CNHkpnwm5OS/Y/FOE?=
 =?us-ascii?Q?hBZCH16lO9kOqtB6hz/ICyPKt0UmEQOdKDfUuUjrN/kY3+gmRvBktGjXX+nc?=
 =?us-ascii?Q?8XQPhOL8Fdvx3yEXMCpfccrsuNCGjaJiKj0U/LV8475v7wGls25MggwNZiYY?=
 =?us-ascii?Q?jU+9U7PpsjXHyVmrF5ABwTc/xwtco7qEKT7Fb10ldibNJIriK+opPusbQ2Xh?=
 =?us-ascii?Q?93dxHgbP5qjR+iTIK0Qx521VOMyKakoLTazJ7ZNlZTIGSbPl8NhZqj4mzh2L?=
 =?us-ascii?Q?3B0wj/rhX/Yl3Y4TMGQzQAQvtDwkRaJyQgzE69qzRwOE90myZeX+Vzmd0GuN?=
 =?us-ascii?Q?oozrsqNuO5U20S2tVnolK/sufD2lWPkprFJkw7xjFw2wuV/g/xt8DNUauTmE?=
 =?us-ascii?Q?dE1Hka9GbtIiTByFpnjHG4v5BfrfysRP5C+0N4dlYhdr+aHAgrH4Z1ml3GNe?=
 =?us-ascii?Q?EXNaX06OMYZuHKaFojaqRyyhVZEwvAV6fIxC0YcbUZ1mUYxl7aNP7t/gLOLp?=
 =?us-ascii?Q?PZNxcGGUaA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ALKiS8K2VmldxCrm3PDKRKdQJbqzBnTRj+3qQumEb1+pQB2zJdhYN3tB++shhTDYNef17tuNfQigny9RTQWXNNPbbGzzd1JDWeHYTnjmfx9snfb+iN6WpDQtDII4Q/JY+hyIiYr2xHJjb+59Av32u4Qspl2u2xpGZXhR3k1zyuyz/RouPcmSrykworuuzon61UGAMjwXUaR659BeaRE9Cjk82zc/2U5Ih4NK4qlxmX6L/4Vj4Tea1GlGTWiop6YCrjQD5XzBdo6tukBT7TO42uN8t6JYi9vP267E05TQqaT9tmy4zPSBOIBepHS/hi6fnvWOU6b/LyCb6BV+oPXmYw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706987bd-1163-4842-837a-08def11f3e0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 05:22:42.0162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V1z2gcHMTSBMwUB2bm/8X67E6qHABxJELA+jGQlfBTVluXVzOX6KyNrnsRltZxLKTMctbFg/bRi+5S08d7Pa0A==
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

> Subject: [PATCH 07/14] drm/i915/dp: Use FRL pair check for the DFP dotclo=
ck
> limit
>=20
> intel_dp_mode_valid_downstream() uses the intel_dp_hdmi_sink_max_frl() to
> check if FRL is to be used, in order to skip the max dotclock limit for t=
he FRL
> cases.
>=20
> Instead, use the intel_dp_pcon_sink_support_frl() that check both sink an=
d the
> pcon's FRL capabilities.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Check comments on patch 6

Regards,
Suraj Kandpal

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 6bf42128a81d..d2d330b6c39a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1237,7 +1237,7 @@ intel_dp_mode_valid_downstream(struct
> intel_connector *connector,
>  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
>  	int bpc =3D 8; /* Assume 8bpc for the DP++/HDMI/DVI TMDS/FRL bw
> check */
>=20
> -	if (!intel_dp_hdmi_sink_max_frl(intel_dp) &&
> +	if (!intel_dp_pcon_sink_support_frl(intel_dp) &&
>  	    intel_dp->dfp.max_dotclock &&
>  	    target_clock > intel_dp->dfp.max_dotclock)
>  		return MODE_CLOCK_HIGH;
> --
> 2.50.1

