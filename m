Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E71C982D2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 06:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D9C10F1A3;
	Fri, 18 Sep 2026 06:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0lCOKJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BCB10F1A1;
 Fri, 18 Sep 2026 06:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789712544; x=1821248544;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=07yYErVXxwCejLQyXt8NyxQQz6EZHTtztobKG7F0+2s=;
 b=B0lCOKJ3nS5SSKgJVNanMtgr2PgaDKxK+MfV4ixmS3ls3g+teRPpF7pc
 dWwR2QluoqnvEXbp8MKKaXhz7e6k82i0E9kDaJs8DiwC/Ak1d+Zh7whCv
 VS5bOKQCYgLq/mIq92vRARJIfFlG1py4Kx0Ifs/rPOBpkSlxlYH6IlBTc
 tPEcwT18fqQAV4mSSKNnXuD6bWJ/2MQV/+82nImN1nVRkGYaqtaGqV6D9
 e+qGa3nc3b/YgTVvogNjWH9NaVpp7jKo9yzSrDUBlnHNsI2DuwGLGx2lI
 1Vg2QNPJgAUO9R6AoLbMzRTCO0eCPToaUBDRZtGyjmC0vD/4etZhnZKVe A==;
X-CSE-ConnectionGUID: hjP0dhSsSSSqqJ1JjfW/Xg==
X-CSE-MsgGUID: /JkxDVuqSI2GW0Hj9jkgRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="713136"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="713136"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 23:22:23 -0700
X-CSE-ConnectionGUID: +HYTzQs9Qwy+2jlIFoUptQ==
X-CSE-MsgGUID: wLYIbe4NTdO1K8USSLAanw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 23:22:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 23:22:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 23:22:22 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 23:22:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdurwQTltKgzP13BcO77RX1nL+FGKVdLpGYKL+dGdsyEUnwzGWCpqG4SXTvwc0ygGoLkXbCP1ZQHv74U0Gk8yvP4QIq6aa1VzBf+VxPPB33SsAAXxBc6eB5DPy0QjevTKYQNvhUN4bRawdGAuxuZhZec6L+A8+8842QGd0+N82ykZu4eeOZPptCtz2MIRBlDVXEBVbbLP/SvYoShM53VnX07KP3oLOI2Nx+c9eI/iWMMcdXaTjdDKOpA51GWvSjKTZ7YrghQIe95NDDHj+eGf5V/corPJBj8gxxjCRnMWej000eNxlDz8vQJU8hezqgpXdkVpNJinw5rh8s9N9FpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQ5Al6MfW2FktZXddfK0mQs3/huaxbtIklUn+odirV0=;
 b=P7isTKUQr7Zu+Cc4YF4KeyHLW5XurebzWIfWJJZMn3emB6uiBPIhQg3Ss/SopzTWPRhPRN3a3HUtRoUfn8rCVJmvTX3ZRC741rpxSORAU+asCJPJTWNBMNMZSEyYss+cz3mIcaOCmXcT3P5aWEPrsEVvs5IlhlLbDB+aS0agK2WieouDsxCT99KUycKbDsZfqLOzKNDZLSK7wnTUOmbO4swB6/AXBlcjmwNa5eL166YQZARKlQ1XyktjBQ1VGLbCzhU3R+P2r6XQxUGywRMjJ1o1aMDfH5L92iia8iWhe7ixiypYwmawZx/FKZ3g/uAycicrULDJqFEqtkHGXRvg2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 by IA1PR11MB6489.namprd11.prod.outlook.com (2603:10b6:208:3a7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 06:22:13 +0000
Received: from CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::c319:6d18:282a:cac8]) by CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::c319:6d18:282a:cac8%6]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 06:22:13 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH] drm/i915/dp: Disable DC5/6 before AUX programming
Thread-Topic: [PATCH] drm/i915/dp: Disable DC5/6 before AUX programming
Thread-Index: AQHdRzOYM6oqFMdE1EqKPlxekPsNTbbT253Q
Date: Fri, 18 Sep 2026 06:22:13 +0000
Message-ID: <CH3PR11MB7300FA5719A49415EE099044BA872@CH3PR11MB7300.namprd11.prod.outlook.com>
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
In-Reply-To: <20260918060426.1162123-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7300:EE_|IA1PR11MB6489:EE_
x-ms-office365-filtering-correlation-id: b2470908-465e-4421-c655-08df154d2dc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|38070700021|18002099003|22082099003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info: NjEkdyV14KjtrhoEayhvNQvbs9vMhFW+0TcOhScx3FuahBbgpLlSzCwB43zQc5esNDUBG84xRB3ceYLza659Qh2uWNUV1o+5Y+K3KLTMEwDdwuTqEASj3t9jbwXUHugtFlhbZJSPCxOMbHpGlOBC5Vc/UtR0jy2OyptjZ0m+YhF3ceA8WcfnFEm3QIhnMw39Oy2RtbFkxsNmrILqnsa+azTzCubm5+1oO8Fv+boiAe/+nsGL1QRwW+CQNXrFY4104kzeWlbUWA3TB05jznQlPxbUSb8s6kCVwFrobPVp3gyS/SP7WSZcL/XMbYmgdLfKc9n5gBSa4kmDzBZRZSFsc0cmAejQ/t6o7sXq/MoDCattJfRN8x0j5GCqmdcVQEPg6z2LUfoBGdaseljQx3iPSgDyV5UYwhLaogKh1G5Znl+OwiOE0zgDWneJ/dZaBBY+ZnoKAnt4iwXnXeejDcisq1HG1iG5YwKj3Ah5Ii9gh4cfEsnQ8upJS8pJCz18n8TP87p9gdEH2AynplEIOSCI9AYzH2JFVPa8+KxwnRFR9XT+a4p6aczrw5t9f98hynXPbi0zzy2lPzpzMHQ0dQOqpsVp3VE8Wl/VU2S6tXbrSYhF3nwfQvmNcG2EuXnvzTKtC/s+VhQYjs88BYMK4vDogLFnIjSQpM+QBWz9ILwWFoK5ApN6SESlzjPktG/ijRgbDtkBRYKtYFg7w4sfGBHaIz+6+zFaVabBFZlosWYSArU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7300.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?voasQtS4PRgN7i7YDVAHEuwO1BpT0n99Vy7VUtdShue+ng5D+D61NoCXRUbf?=
 =?us-ascii?Q?XCyi5nmBygT3uuu/LXBhaOazI4cLw6AiDRAR1/l7IBE5T2Rr/oFrWjdK0YTX?=
 =?us-ascii?Q?sQvO0I28HrSJhfXFUtNwyIgIVPcPmWaeX9d9aJDq8KM5GezCnQ/4hsDo1ZeN?=
 =?us-ascii?Q?ReeOekzsHQRxr8qq1jg96gkBBxMGDJbA0YVlLOhf57HXLD4Jwh2vzjx0MVhI?=
 =?us-ascii?Q?ZZYdrC1OD0eq55DJ14WMrgGpml/E9cRN9n7kIiqXk1xsd9N5T1H+kqaUuDKy?=
 =?us-ascii?Q?3aYwCohrXtOZWoFkBbHBrj4qP6sM6Nv6i8tqjhx4UiQDcPw1c19nw8sMz90x?=
 =?us-ascii?Q?CRMP4NFFbzQX6JXKqszhxDHrn3HAypW2k7DMAUbrKWlrM8DJZhn9SNYHRPZd?=
 =?us-ascii?Q?QYquqH1Y/H4aMpQWdRPS9vVjbHl27IjoBuUxoCwruOpyYrxi0WXxpDkehcqu?=
 =?us-ascii?Q?b2mLUwOr9TPJa78KSJpIanQKACrsYoLn4HhYIcWU/NR6T6tzRVQL+EQYbqxX?=
 =?us-ascii?Q?2wbYN0+gL+jNCFfHh6RnnKHaqUapK5e/NBcsp7VY2C+LFurOluX3fHGfJ5wq?=
 =?us-ascii?Q?WrLtDgEESme0c/ZQl++Ga/ZfMyVRfmxL+EWIbKMf+v0iyHBLm9mT8VAflb+Q?=
 =?us-ascii?Q?IiKtShpcGVfaR3cpBe43bykYZ7f8UhupuINmD9fmFp76n07onhmAzHaDF8Lu?=
 =?us-ascii?Q?DD/FkrstFOSK8myRUN3hiYwXHDfzPSB2GFVEw0Ky9+af4scxwUqDLdG7aiG/?=
 =?us-ascii?Q?xGiybsSza5dk0F/7sWI38qqNr3U3r9VR2sXsvxDKQRs1FYC6V+skvDvFR+U4?=
 =?us-ascii?Q?/VH1nXiREkOQrhZiBfTcgsCeRCLXJHkdfGUOzkkSVAGLv6iJ/TyOmKepJO9v?=
 =?us-ascii?Q?QI9eqMRTxbv4IAgcqP8SkeaH0dQVWZMGuaF0upZTgOUAwGhjfOr7Bux4g48N?=
 =?us-ascii?Q?B9Bvp1T5V+lTiYYFj2hoGj0EeEUxvWidkCEw7B5+owyPzVxCik6+1ScrdOeN?=
 =?us-ascii?Q?CwePzcwbXM3ZlltbQ6oo/rQNtiVuo+e1QQzkA48uKeKyhKvBl33bvgZ3ZxI5?=
 =?us-ascii?Q?Bu3wyQth4YiJDoKJP+H6cwgDbUeoucgCVzTmPCVyg95GyxtmVEqONplPFMMG?=
 =?us-ascii?Q?FzIaPJCZp7mgQRelLbIrwJBdkKTW6hla6hTPga6AqVHWeJNELdouuOmFqDtf?=
 =?us-ascii?Q?1CzLoW5E/eryJlL7Dhn6j5KOOwA4xt2QAMQ6ijgbIbo8cyt4Tb/u7n6J3JKP?=
 =?us-ascii?Q?XMvMsB2YKptT9bzXkxAKEnLFja6z1dqTDQI4ntcSNh5iaSkn6xS9SrC4R7BW?=
 =?us-ascii?Q?YskNY8PaLjKVhCVcMpL2BnLKVOfWhFoxeJUjfumtom71a6eLWo45OQkigmIm?=
 =?us-ascii?Q?Lf/XhwdnVWCGg3XNxL/8/fTvMFxP81pLf0/rB4TaK8FWH1oIanz/9SP3Sjo7?=
 =?us-ascii?Q?qRxoh9qLsNs2TWRPo4YUNyMwPD+UxJR8czcel1ah53UpArjmlUhm2v7KBIUB?=
 =?us-ascii?Q?3rWDuZ5zZYjtx/tvmYmJWLYvecBQ/euusYipaS5LpChJkyFoWwf85dkoF2zS?=
 =?us-ascii?Q?sMJAi9mk0sae4zaMUrr93/bvD1bKnBkupD02jouuSuu6g0g43latNIdcpN2A?=
 =?us-ascii?Q?0RnghbYUo54QNiP6lhM64QsdDGa7TJnVKNQJ2VeE8haEPzJuZFXaa3Opep6l?=
 =?us-ascii?Q?3uMIZ+doJAhK5SO8HCR+W7cNW7AteKYcGC4rbjgnusGtbgdslM9T0Q04jZ9h?=
 =?us-ascii?Q?W043or/FKA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gxlO/MvC5idOOTmb+uITcmxmCHl1Li7j3gzkqrZVxkdCfpKr3X+GSNfgOQlF0UKTuKRuh76ylbADOIDCe6u7OCoI0pt7pAa2xZBTcdJrxkBwXqmEhGhZOZ/tzNs14LKRqiCGZWFLjoCRbJIFu0+Q/FRA0nG44UDWkaWFL+NlcN4lDlXHveo/PpZtuCFUXQGk6jl2rGe8qZXVCCbm6+E2dDP/hINYoqeMxPpsEXZHwpwR4qCJFVcqI9fH2LC98O1PZhaoDS1pxSNSuKtyDTDfPDq1nIHfFsoNqKhxx/wW4PHpW297bDTuWnDKqOkX+JsjfPx2+s+dgO1CUsVP8cGNFw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7300.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2470908-465e-4421-c655-08df154d2dc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 06:22:13.4518 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bf19hN0jzNC99NEFaoYzGowktwYWizwj7XQGxU9ylx5CKgu4tGc5j0bXIcvGH9Ni3yanXNwhkm8UVFV/JRyFdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6489
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


> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Friday, September 18, 2026 11:34 AM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Shankar, Uma <uma.shankar@intel.com>; Sharma,
> Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com=
>;
> Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH] drm/i915/dp: Disable DC5/6 before AUX programming
>=20
> From Xe2Lpd we removed the step to disable DC5/6 because as per Bspec for
> SNPS PHY Aux will be always up. But from Xe3p LT PHY was introduced which
> powers down the PHY. Which means we need to make sure Step 4 of AUX
Please provide direct ref(words) rather than step 4.

> Programming sequence is honored.
> Disable Dc5/6 when programming AUX.
>=20
> Bspec: 68851, 68967
> Co-developed-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---

Looks good to me.

Thanks and Regards,
Arun R Murthy
-------------------
>  drivers/gpu/drm/i915/display/intel_dp_aux.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> index 3cb07b0a901c..350dac72c996 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> @@ -260,6 +260,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>  	u32 aux_clock_divider;
>  	enum intel_display_power_domain aux_domain;
>  	struct ref_tracker *aux_wakeref;
> +	struct ref_tracker *dc_off_wakeref =3D NULL;
>  	struct ref_tracker *pps_wakeref =3D NULL;
>  	int i, ret, recv_bytes;
>  	int try, clock =3D 0;
> @@ -286,6 +287,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>=20
>  	aux_wakeref =3D intel_display_power_get(display, aux_domain);
>=20
> +	(HAS_LT_PHY(display))
> +		dc_off_wakeref =3D intel_display_power_get(display,
> +POWER_DOMAIN_DC_OFF);
> +
>  	/*
>  	 * The PPS state needs to be locked for:
>  	 * - eDP on all platforms, since AUX transfers on eDP need VDD power
> @@ -459,6 +463,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>  	if (pps_wakeref)
>  		intel_pps_unlock(intel_dp, pps_wakeref);
>=20
> +	if (dc_off_wakeref)
> +		intel_display_power_put(display, POWER_DOMAIN_DC_OFF,
> +dc_off_wakeref);
> +
>  	intel_display_power_put_async(display, aux_domain, aux_wakeref);
>  out_unlock:
>  	intel_digital_port_unlock(encoder);
> --
> 2.34.1

