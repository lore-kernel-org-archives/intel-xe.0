Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66B5C79F9F
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869C610E6B3;
	Mon,  7 Sep 2026 08:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbKfu7rw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CE110E6B3;
 Mon,  7 Sep 2026 08:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788768417; x=1820304417;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Je2+3tACuQpPElFDaF3vhKxtjC/BdYS/7vs9lPhJYow=;
 b=VbKfu7rw1kRnC4Cc7hxf4zyL0ajrZob2/YMop07EzzbFdEZTODWlzVoP
 BwLEk7ev+7pnYN0+xrbv3i5lvqtiy3kJm/GogKPccqnJAHjjNKWb+6McA
 jcXG8mEFIB9DgwrCnfl31lTCHyxTpVAp7xx3LG76eFxLHPC4qPhbjHK0x
 Yqwkc+U4NxNzkhKHPcxMqD5v9wQ5rHUpfnld07Kgpa3i8gwgzbmpzIvPM
 0pQznDo5vZc0WFLeup4XkZaZWMwAAQD2dFN+nrRrc5moXfOjZuSh9pYCg
 IF7Yhi7drlHLQQmzpVFwEkDEYa+t7YBwKAgOfwaeSgg7XQrDVHZjzruO5 g==;
X-CSE-ConnectionGUID: 6j8VoI88RKSyq5TnOKpaNw==
X-CSE-MsgGUID: RC9YE2t4SjSYMrdB3A6Gpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89218557"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89218557"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:06:56 -0700
X-CSE-ConnectionGUID: Wrg0xycGQ2O/XwvI8FptMA==
X-CSE-MsgGUID: IIIQsxUCTcSGSISMgIPQTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="270117165"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:06:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 01:06:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 01:06:55 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 01:06:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaXuYDCsoF/ZqHmTUDzGh6iVwEok8tfF2xN1CDfpCt6VVQN8DEPxz+0/y9RMmkA1Cf2vDs+kt84Nu6TIhdIJWrAInTi08qOPVBlYZHq9CMYWxvZjsUhGmWctYlWmcv6HCy+bIRT4CiaMJpTM2/3nGyDwB3z3pbZHG89EaAMroiUNQ0LWuW9D+351pyIuwDNyAlYjFdllBnFqjPzzqc6gFcGh01BiSgZYeP17x8+MmMFL9vwUXabvGl6qoh3+TWnmEwQ08hLh4UBy9WjfTJcWnRNxhGlM806P6ynXYdmLRJF/nNeCDZ87WeT5O2HHir1txYFe7A0mYRR5CI58dZbc1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSz9vkHxU6y+G4YXhaPFLsCmzNYynJyQau0izrmtI9I=;
 b=tawGiFRheCNRqp5y6F60sQD4qWiK+Hsot8ixgRWJMKMX/Zhyr5oqt5leoa4t8JAgnW7OW7A6jsyWQYA0AF5G5cqR5hPm3JYVcvDGBMMHn8NQK2nqKgDxCrSxxk2q6rxNy+hRyx0F5AIdbjfs0yN5ihbAbUMSdKXZ2YAjrDErximATuij1BSr0UgcyZinQAh7IeGx0yRsmg+LL+amH+tQx5YgsJJAsdBeaw350pB8mSLymrie5ZrJ6RpGJm+uNFAxt1A91PKh+Gb28/AeQ6MBKkC/n8dC8sSdTuhx3a9nOhRLN8F3c79q3lHgjWf8Pbt70REcCDdZ0oHbI6DsN5h8mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 08:06:51 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%2]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:06:51 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Garg, Nemesa" <nemesa.garg@intel.com>
Subject: RE: [PATCH v3] drm/i915/display: Limit SEL_FETCH clear to supported
 pipes
Thread-Topic: [PATCH v3] drm/i915/display: Limit SEL_FETCH clear to supported
 pipes
Thread-Index: AQHdPoHlyfIdjfLQkkejArWsGhDwsrbCwBUA
Date: Mon, 7 Sep 2026 08:06:51 +0000
Message-ID: <IA0PR11MB7307DC639D1A8A3428D96958BAB22@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260907042944.3127031-1-nemesa.garg@intel.com>
In-Reply-To: <20260907042944.3127031-1-nemesa.garg@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SA3PR11MB8118:EE_
x-ms-office365-filtering-correlation-id: 991636e9-1406-431d-d272-08df0cb6f95e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|38070700021|10067099003|5023799004|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: 7UXpjqjQDaoQXCERYh2MstV1IllFj07z86zC6ZJVwp0e/G3dqoUBbibsKrE+pWOkc+d5sBS2sqM98m+LbR804hYCOVM/to9erShV/+XwV9p/Wab1D753+azJmVaw9DbPhrRQd6w2wbN/cXkRYoeMBX20KwKtS6sbkAmMc+w/6fWomeRZqNl1hmm9maQmZB3PsmOOAbuLNLHfrVAh1aDNfsRHK/um6iJyFQ9Qbo5TcTVJypW4cXLPsWHWzmFAbZsDKAWKX9BS5RfLgseG2V46ofANW3xReK5SDzY+7k4y6CUEwB5mNP7NN/i9C+GKW7NBBxTc1kwF4ATI6b2rUcGzQBohW8aGx5j8URKYDXQqYNsS3F6wqFK2OiCiYX+aXvCuOa2IOu97oXKYLzpQFoAX9sYnlm4LqzOkopIk1egyXId1HYkb9YTlgWKdawCfShKUC1JZapGqIt2Jmbfjc2qZQ3SAjZ8Idhpl0Ijk3TpBcfG41pzEjBR5JhpeChwU9MbpvfRxSHOIHd2ido8sPl+acPp0xEy6lFZ7o47MdB6xzuz5gfxiCG3y2CidGwuKz4VZqSo2TJHzVrvd0Qa0TNKhEemN42xH6kR+9q8jbdckWkNQFfo0zQP/8sOXEw3/xEW7HDVrxC2QP+VwA+hX+7b0XGyM+oEs98wx4wGdROAG2ks=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(10067099003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CpT6yoPzbtDsm4kusHyVRV0XG34+BshKjijpLSWY+ET5+KkXWZB9UajLSeUo?=
 =?us-ascii?Q?K1Cu9CqOgSKlJPLmkbt9MbqbmLbolXRkRZEBEjAbhNiT3WZvlCdQYcH/8mry?=
 =?us-ascii?Q?IN6DTOfXyhO8eyrYUvw5+RG8M6s1baadJw0cO55lgaQ0eZdlI33vQcA77M3u?=
 =?us-ascii?Q?nWhaSkIsEtxlTgvZu27f0nOSCuIiKhWYXcDL8G4GPIgDAoTzPdpTgTQfVj4w?=
 =?us-ascii?Q?++X+Am3jm6ejAuRaWjV0w0WcVUd3H7I+sCpPbBlslgRArwA4GNVOC/rkiK50?=
 =?us-ascii?Q?ZokGL9JvQbGKGFI8oa608ultNABPwrAIj9Ld9eCRPbvf9dYLa0MN2wet/wDN?=
 =?us-ascii?Q?2uxPNreYqk5/eDaRjA6tEI3ialwmyB5fFBAqd3Rz9UGqeHVg63Yy3V00Sbqy?=
 =?us-ascii?Q?+s6zDYX1v13VwXl8PlVqQ92HRIYbXZOiiNPDGStTCfu2zl45mX3Q1bGpAPMz?=
 =?us-ascii?Q?BWGZGnGfaPvcBNWtWvWZVwc6jcf5FPFsyNDr5fNgo35QZfBeb+vZmra07WGz?=
 =?us-ascii?Q?KIEMN97+jMKNjuIvJQEHqdtuK9JTGAQjBjZgybYsHhKFRnj+dspzEslrVKFr?=
 =?us-ascii?Q?Tdcmh05I0/6YEh5Mc6K2OJVf3e6UEqRmQD/tF9w9Tc/U4S4pEjz/QfqHcd/w?=
 =?us-ascii?Q?9s8LJBjue+xqxDqsO+ACfDm+L0KPqVJ1tli+MBXQDJtlQ0+jWqMXYec88dFj?=
 =?us-ascii?Q?3XUwABN6RrniACeYIJGytWhMUEtQNehDH/r3zYS9MeYCSqHHyn3TAqtM2gDx?=
 =?us-ascii?Q?QzTJ1j2zKm85FE+liEJFGH/UUC9Elbmg5iLlIgK98PedVZbei4NQIm6IdLub?=
 =?us-ascii?Q?4+6QorY8TUC069cEm5O7eI6conafqkhJ+NB7fkmjUKtEMol/dRkmRJSV86GQ?=
 =?us-ascii?Q?Bufvr1FOgsDTagKbSgLbq7higcWiamNGLDJghqNjSe4q3dkkk/FyYOduMlPh?=
 =?us-ascii?Q?gm8tUu66UJsmeiiya6su2RyEXOLl++Bu76CRH4SEa34VHiJQBVFJp3Svm5vq?=
 =?us-ascii?Q?gvV5v0Uyg+q352Tip5eSotZ0r54z7ELHyibwGzDUI58GPT4mI/GDzgCV/TBC?=
 =?us-ascii?Q?mhoPoIThtAwjiyM3vS41S3LiQBQx/iLXaPH6VqxKDpnJQ/6s+t7ijTaRaKHf?=
 =?us-ascii?Q?MPBYnHtY9I9b8tH3N/Up/W+i7M1Ur0kYSG/MsAgOdB424HjTp7L/hfOCP4W4?=
 =?us-ascii?Q?0lrCcr5cKOcaTHS2KWWTXju5vu+Th0uGImvu7UOhOZrciyXPL+PumUghecDr?=
 =?us-ascii?Q?p483yGxi63NTDw6MZrJCRRDjTGole0QsXs3+Vv4NICbLkzc7+gq/Rncf5EJ0?=
 =?us-ascii?Q?n4nutNi0FnPnd3HbBSDVzcuhmfarGQavL1hTt19T69b2tjyif2sk/MrY76kO?=
 =?us-ascii?Q?h6RqPFzUc8siMF15o0DD0eK5Hnq7787tq9l+A3cr93v2WYuM3d6S9AESFZMB?=
 =?us-ascii?Q?ZxICfpI8JcmtOogAsuicLO4a+2iOr4Wsjed+nxXBrZ4eclo7BnEbpf6qY51w?=
 =?us-ascii?Q?etznuST511PyKzjYbSOGEiBvsQW+MzcI9BdZZg6cn5EB9CYIVORnulApSNoJ?=
 =?us-ascii?Q?JFRR2Qr0xsS/RXGA2agsfBGBsdtEjRm9lTks1hJTtTFA+is1QqmMdkhbIP7+?=
 =?us-ascii?Q?+C0/JssU3a3S4cmYSaD8cHV0miQjFy+hgPX5N4V3e6hUH1vDjUwUOzZM9LTa?=
 =?us-ascii?Q?lXQkTpQ41epxSeo8epb2HJlWyeZtJCQccMrrgTSX05jNeyrZSwP8UVe68GHR?=
 =?us-ascii?Q?xxdFCfkEkA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nbD9GpztYCgwYOyc+eRXjLbQEAvhPEiLoH21Rgq3HX0FgsVPmV6eNzpftOefXhy/0QPw8WzbfjF2IwoFNpxxzOq2FriDPcrP/adJYHsf50v7SM+kIz7dtK9yPgyILmvZbA0aCfJOEIEd3GGzR6XJesGnXup+xBPZ+rbjejak+P4RuAVY6A2XCihfgixavLxA7VCvWruzbLZdbKPSD0tsuRcIv9nmep3VAUqgILZU9jyPw7vWB2Nm4o1yyYtpt5ZR11FcpRZhk/Jc0A9Olgv3F2wJN/C4LTpABvr3q+sj7S4i8AKn1+nw3TdNzpONtM9/i3T1FxRlj5BJ9Md7TwEE6A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 991636e9-1406-431d-d272-08df0cb6f95e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 08:06:51.6716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rzzsLpgVd+TParlpzH/9R9u7VGA4W62zNQ0fql8zRavt5bX/e9/6h2bDbC8wdDObLOFoE5XmniiiBHap6lQPAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8118
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ne=
mesa
> Garg
> Sent: Monday, September 7, 2026 10:00 AM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> Subject: [PATCH v3] drm/i915/display: Limit SEL_FETCH clear to supported =
pipes
>=20
> Commit 7f1172a2ac0d ("drm/i915/display: Clear SEL_FETCH_PLANE_CTL on
> plane disable") started clearing SEL_FETCH_PLANE_CTL and
> SEL_FETCH_CUR_CTL on every plane and cursor disable.
>=20
> Not all pipes implement these registers. Clearing them on a pipe that doe=
s not
> have them leads to an unclaimed register access.
>=20
> Skip the clear on pipes that do not implement the registers.
>=20
Looks to be a mismatch in the commit message, can you re-check?

> v2: Write SEL_FETCH to 0 only when enable_psr2_sel_fetch is true.
> v3: Build fix.
>=20
> Fixes: 7f1172a2ac0d ("drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plan=
e
> disable")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16876
> Assisted-by: GitHub-Copilot:claude-opus-4.6
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cursor.c   | 15 ++++------
>  drivers/gpu/drm/i915/display/intel_psr.c      | 30 +++++++++++++++++++
>  .../drm/i915/display/skl_universal_plane.c    | 15 ++++------
>  3 files changed, 40 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c
> b/drivers/gpu/drm/i915/display/intel_cursor.c
> index cce041e1da51..90173040d825 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -531,18 +531,13 @@ static int i9xx_check_cursor(struct intel_crtc_stat=
e
> *crtc_state,  }
>=20
>  static void i9xx_cursor_disable_sel_fetch_arm(struct intel_dsb *dsb,
> -					      struct intel_plane *plane)
> +					      struct intel_plane *plane,
> +					      const struct intel_crtc_state
> *crtc_state)
>  {
>  	struct intel_display *display =3D to_intel_display(plane);
>  	enum pipe pipe =3D plane->pipe;
>=20
> -	/*
> -	 * Clear this whenever the hardware has selective fetch, not just when
> -	 * the current state uses it. The cursor may have been enabled with
> -	 * selective fetch earlier and had its enable bit orphaned when the
> -	 * feature was switched off.
> -	 */
> -	if (!HAS_PSR2_SEL_FETCH(display))
> +	if (!crtc_state->enable_psr2_sel_fetch)
>  		return;
>=20
>  	intel_de_write_dsb(display, dsb, SEL_FETCH_CUR_CTL(pipe), 0); @@ -
> 592,7 +587,7 @@ static void i9xx_cursor_update_sel_fetch_arm(struct
> intel_dsb *dsb,
>  		if (crtc_state->enable_psr2_su_region_et)
>  			wa_16021440873(dsb, plane, crtc_state, plane_state);
>  		else
> -			i9xx_cursor_disable_sel_fetch_arm(dsb, plane);
> +			i9xx_cursor_disable_sel_fetch_arm(dsb, plane,
> crtc_state);
>  	}
>  }
>=20
> @@ -701,7 +696,7 @@ static void i9xx_cursor_update_arm(struct intel_dsb
> *dsb,
>  	if (plane_state)
>  		i9xx_cursor_update_sel_fetch_arm(dsb, plane, crtc_state,
> plane_state);
>  	else
> -		i9xx_cursor_disable_sel_fetch_arm(dsb, plane);
> +		i9xx_cursor_disable_sel_fetch_arm(dsb, plane, crtc_state);
>=20
>  	if (plane->cursor.base !=3D base ||
>  	    plane->cursor.size !=3D fbc_ctl ||
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c
> b/drivers/gpu/drm/i915/display/intel_psr.c
> index f490beb66629..702d4b6d62a4 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -58,6 +58,7 @@
>  #include "intel_vdsc.h"
>  #include "intel_vrr.h"
>  #include "skl_universal_plane.h"
> +#include "skl_universal_plane_regs.h"
>=20
>  /**
>   * DOC: Panel Self Refresh (PSR/SRD)
> @@ -2162,6 +2163,33 @@ static bool psr_interrupt_error_check(struct
> intel_dp *intel_dp)
>  	return true;
>  }
>=20
> +/*
> + * A plane disabled while selective fetch was off keeps its selective
> +fetch
> + * enable bit set in hardware. The bit does nothing until selective
> +fetch is
> + * turned back on, at which point the hardware would resume fetching
> +for a
> + * plane that is no longer enabled and keep its DDB range reserved.
> +Drop the
> + * bit for every inactive plane as selective fetch is enabled. The
> +active
> + * planes are programmed by the selective fetch update that follows.
> + */
> +static void psr2_sel_fetch_clear_inactive_planes(struct intel_display *d=
isplay,
> +						 const struct intel_crtc_state
> *crtc_state) {
> +	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> +	enum pipe pipe =3D crtc->pipe;
> +	struct intel_plane *plane;
> +
> +	for_each_intel_plane_on_crtc(display->drm, crtc, plane) {
> +		if (crtc_state->active_planes & BIT(plane->id))
> +			continue;
> +
> +		if (plane->id =3D=3D PLANE_CURSOR)
> +			intel_de_write(display, SEL_FETCH_CUR_CTL(pipe), 0);
> +		else
> +			intel_de_write(display,
> +				       SEL_FETCH_PLANE_CTL(pipe, plane->id),
> 0);
> +	}
> +}
> +
>  static void intel_psr_enable_locked(struct intel_dp *intel_dp,
>  				    const struct intel_crtc_state *crtc_state)  {
> @@ -2180,6 +2208,8 @@ static void intel_psr_enable_locked(struct intel_dp
> *intel_dp,
>  	val =3D usecs_to_jiffies(intel_get_frame_time_us(crtc_state) * 6);
>  	intel_dp->psr.dc3co_exit_delay =3D val;
>  	intel_dp->psr.psr2_sel_fetch_enabled =3D crtc_state-
> >enable_psr2_sel_fetch;
> +	if (crtc_state->enable_psr2_sel_fetch)
> +		psr2_sel_fetch_clear_inactive_planes(display, crtc_state);
I assume this has to be caught in atomic_check stage.

Thanks and Regards,
Arun R Murthy
-------------------
>  	intel_dp->psr.su_region_et_enabled =3D crtc_state-
> >enable_psr2_su_region_et;
>  	intel_dp->psr.psr2_sel_fetch_cff_enabled =3D false;
>  	intel_dp->psr.req_psr2_sdp_prior_scanline =3D diff --git
> a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 5cda1ab90e40..07a683293352 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -879,18 +879,13 @@ skl_plane_disable_arm(struct intel_dsb *dsb,  }
>=20
>  static void icl_plane_disable_sel_fetch_arm(struct intel_dsb *dsb,
> -					    struct intel_plane *plane)
> +					    struct intel_plane *plane,
> +					    const struct intel_crtc_state
> *crtc_state)
>  {
>  	struct intel_display *display =3D to_intel_display(plane);
>  	enum pipe pipe =3D plane->pipe;
>=20
> -	/*
> -	 * Clear this whenever the hardware has selective fetch, not just when
> -	 * the current state uses it. The plane may have been enabled with
> -	 * selective fetch earlier and had its enable bit orphaned when the
> -	 * feature was switched off.
> -	 */
> -	if (!HAS_PSR2_SEL_FETCH(display))
> +	if (!crtc_state->enable_psr2_sel_fetch)
>  		return;
>=20
>  	intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe, plane-
> >id), 0); @@ -926,7 +921,7 @@ icl_plane_disable_arm(struct intel_dsb *dsb=
,
>=20
>  	skl_write_plane_wm(dsb, plane, crtc_state);
>=20
> -	icl_plane_disable_sel_fetch_arm(dsb, plane);
> +	icl_plane_disable_sel_fetch_arm(dsb, plane, crtc_state);
>=20
>  	if (plane_has_normalizer(plane))
>  		intel_de_write_dsb(display, dsb,
> @@ -1646,7 +1641,7 @@ static void icl_plane_update_sel_fetch_arm(struct
> intel_dsb *dsb,
>  		intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe,
> plane->id),
>  				   SEL_FETCH_PLANE_CTL_ENABLE);
>  	else
> -		icl_plane_disable_sel_fetch_arm(dsb, plane);
> +		icl_plane_disable_sel_fetch_arm(dsb, plane, crtc_state);
>  }
>=20
>  static void
> --
> 2.25.1

