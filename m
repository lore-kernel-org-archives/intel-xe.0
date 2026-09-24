Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168A3C98304
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 04:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5EC710E02D;
	Thu, 24 Sep 2026 04:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZiZ6gIkq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C4B10F2BF;
 Thu, 24 Sep 2026 04:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790222679; x=1821758679;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TheaaQxvfRcPAfcHS3L40UCNUgIuIRaMZx2UV0+b1Qo=;
 b=ZiZ6gIkq+YNS6MpLLtA48zQ63fYZnxvyeWrT0svdgQd9dqZ2SWCqx+4s
 dj2JI+b3+4cTaBLXgGhesRarAlQ4iI/cf4j7l5YzlCNAiEVshJq/lv/8u
 lrdQ7odNe+rwixsiiHhoa8z1dfqTkNXhYaWAk36b9hCeTe5bHKsFb2wpH
 5l78VcrAAHQxly4TUrFL3gHRtr59VMqmxNjBXvhfsHz2r0phB+dDcRN5g
 RhInFGPYD7Dvn0oh7pIWlnIHJL4MYReOBqbEn+w0bF7uFz/jGfEQACSQH
 WDyHuHcXpknU3/731rIJ7UG7iFX6p1PsqwAIbzkJwcTpsl38AGzgNUuem A==;
X-CSE-ConnectionGUID: 8IcvfOqfQKq3Pb/LZ/5Nkw==
X-CSE-MsgGUID: 3zHVMWrPTbeg0NAlSDUjQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101560812"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="101560812"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 21:04:38 -0700
X-CSE-ConnectionGUID: DocRX/SGRIKXpyYw2SXzjQ==
X-CSE-MsgGUID: 2zF0FYnFS4uo0mwPEwWrmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="274079177"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 21:04:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 21:04:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 21:04:35 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 21:04:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMAxQ20EmKcbISpEdwvE+9sZxyagAk1D2Y+qjHlxGMNcK+bWbP3mhw2BogtDORdn0oV5pqLbLttKCM/8ca7/V3mMHRR2EpBFZKzyyNVEhTzc2SjD6+sBsxOb1jyjzxRP2/NCp1GHvdSIapQWXT4wW21hc9XU92p4q2JGyMQ+befwjLDrC0q9cbU4Ma2W9vn9iuT/5CnuVu4ASrlV+PCW0KKj8qdcN7z090NWkqjsXFauLkPJ+CuVeWJQKWaqU9C5GYHfzX//IOtUCOkI8tmCi75rXeSyqflXHSvkah+AEajoNE7l6xYMVOJpFGiZGdqZ9uCZFFPE/cyzxkDqGk/YHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HWloLcesZNchqYi5nZ0CFrA39adsHeIJGtaccZhPeQ=;
 b=l5svGPAkZDR2rmbhxN+2l60+lAOmU9BF3gmZY612dnzK6+/jghdJ37kXTtijQQ6qT9dZNleZOiHoRoy/GPSiClb5uAuc1tbdHD7fAzRbyl6TYY08Gn6qDnR0o4Fau3ZZwxtlakgz9pHvGJdPJ9z/TSCMe+kfbgF4eSLruV1clzpReZP33J3O8Bh7HX/H64UOFGDB24e3P2w6p4iYrfjJ6w80Cp3oE1mpydm+QCOPlSjhH3x3cGAfgvVlB26vbQzmD1URAStue7130GM7swvxEJCVmxAhpsbGgLEvbhf4Vi0BgPvqVooXsB810s9RNzP7E8I20xKo+8WMsAms8cu2lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CY8PR11MB7687.namprd11.prod.outlook.com
 (2603:10b6:930:74::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 04:04:26 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 04:04:25 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Garg, Nemesa"
 <nemesa.garg@intel.com>
Subject: RE: [PATCH 0/8] log DPCD access errors
Thread-Topic: [PATCH 0/8] log DPCD access errors
Thread-Index: AQHdSYtJHvkCxVDp70+fufmfWS5U57bdIEgg
Date: Thu, 24 Sep 2026 04:04:25 +0000
Message-ID: <DS4PPFE901A304FF752C73A220AFECCD02CE3812@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260921053710.1586776-1-suraj.kandpal@intel.com>
In-Reply-To: <20260921053710.1586776-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CY8PR11MB7687:EE_
x-ms-office365-filtering-correlation-id: 303cbfd9-8346-4abe-ce67-08df19f0ec28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|18002099003|22082099003|11063799006|38070700021;
x-microsoft-antispam-message-info: /YixdOhjIIigx3a1HBt8+R4hxqmFCIoxR9i5EqQPK5yWf6KDvYbERGzmTREYDnuCs2/MPt7FgZsnoJasZbkRq3xelDARXCMTMPDULu0TbhQVCXh06n1hYdlUR/p6/ylgPxm9W8Hws/wFVR5pDEGuzYhvLA8uDdn8dEvy2lgXA8MF4OQC2U9hA7GpnE1wgUeIxSqBBtNH7d+7ud7ppCF7cDqmjHytma57gOz4jdtOKNpEFPLJ2uTA49BiR+r8eyz+VYgfedcCismNLkx2V4nlPgUyK2vJiA7C5UJfCMhAa7/MMf3awSgO552uC9/f8KmPYMwfQvDTZbWBRfxMtoheVfN98Q2j/Ql/FTOMzAR9KeCvl24S9ptXy5tmAlqN9A6ico5JbgXFP1Foket9B1sKXzod/WgF0wmaSaKs49PFQ0jgvad5Pkvumv7QkBH5JH37XcmxgBRRUJDprE/apWoTxOLKxo6AKtK9IqCqRf8CboqhM3e9D2yAyTTS8GzmnXC1ZUzFfKilY8iJdioUhZoUFy80PrxAy2UF/LgY2OSF05c30b1WOSxrvVlvRkK166yfhNcXztDhKMzrCIZGwmnPkgjMKRooE1zS+FolNhzHnIi4MwmdUZy6VTCHdtIk719/FMaIJBuI7KbdsrMn+5aAQYlbTOx0CO0tUWQb4/xb1yU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dTwukfRorRkSVyoe+RqfWhwzUhZVenDsJ1PM9tGASQZF99hfOm7reWfoHq3J?=
 =?us-ascii?Q?rCvyhdQLmt+EpuZRlILcHGf/D21cjH6oirmpknix+1vuLL8zTaNAgQhZn/Cn?=
 =?us-ascii?Q?J6GseFTS9OGwJkvox81F/u+8BnIAH7mYPzkCyEu5iSEu7WRpY/rLZr4amSdi?=
 =?us-ascii?Q?zjdcC/EDFidQJV61w59CsVFrFlrTORvJeT/Kq3BXTN7i8YmvpNbSja/1CSfX?=
 =?us-ascii?Q?zdFJO6UCgNFDCIZu+bpVbScmxVfw+IKW3fa5N2m05xS/X76QeZVgqRh7I33o?=
 =?us-ascii?Q?/uvCx2FSBcFR4uDSNF2Jj1FpprznruuQdaQPjsgoumTb/sXPt6XRpXvP3L3v?=
 =?us-ascii?Q?uwov7v3Gkfz5l7nfLb+jkWG2B8oo6QfUu7QQQmZ0ODZ2OgnAKXXQgkqvnFNG?=
 =?us-ascii?Q?rJJW9/bmQDyQmBJxDgg+P7eoNoLA+0lpTtW5BwPP6C4S/4YdgAmL847CKtnh?=
 =?us-ascii?Q?HQEbIX9pl7vYtnjQVIDmvWhd9+wKkW/xPkDneit/x7AIpSKJXnZOauJBt64q?=
 =?us-ascii?Q?h/BSPmtMwBWmaPSbqux5qKIGATP7yCCU2TtDlUkV0vtU+iU8m69iUtF0emTc?=
 =?us-ascii?Q?lKny3bMdOdbpiN6l6gqKe31auxsPuaI0U3F9qZj5MBm9oaQbuCx85okzWxwj?=
 =?us-ascii?Q?L4erL5X1apFkOst+p0PlSX4GDv6HNNxXrAMkFTCWxUIjiQ3GTurEiT9sCrRV?=
 =?us-ascii?Q?XIcZx40VHiBDZ20P1jUOxM499YaNUhbNuS6YAph6WVEpITJkBH9yIpCdImoc?=
 =?us-ascii?Q?7XPE7LaVpOVSp58IdRyLybzarFK96TsDhpLrAzCbiNj7Oi0fTmk5lHEGejME?=
 =?us-ascii?Q?7Twhw9UzT2kLiNREoIPmeIf+i+TdmCQQUnjg33K6x3zNKfJ2PHUIqFJF5HCd?=
 =?us-ascii?Q?MLdbm+aj/Qb56n2HRn7IjdL2gNFC5c8fjOsmWwI6fvU6ODKuc5zHVkACNsc8?=
 =?us-ascii?Q?7pc4ZVzd5egW5Lo2mr6sI3kxYKWPvReEe26+Pyz3bmiYFr8CTTVONG2XNXUR?=
 =?us-ascii?Q?qBVIQTjDN5O51m7rZF07YOIiAB3TmAQNaDbn9yOobzB4gJK/5YfqsKBIMGuc?=
 =?us-ascii?Q?CU5z43WTFO4johtozTN4Bo/9LH1IeIU1xeW7tqEy5QKF90WGLc8m2CTjk47b?=
 =?us-ascii?Q?NFFhul8+XWi3FKm92GOGZSSuW/893lsR73VGA6wfzlg0Dq7nrtDa4Sm9nZUL?=
 =?us-ascii?Q?+CP+wAuTUdM4n7Zawanxq9FJU0c/h4Aj0jRKFxRVGw/YeHH8V3sBvd/XqEZJ?=
 =?us-ascii?Q?rvGYWPi/gm6SkxPF1erYODpqZ1y81Ur6Oz9TF3b7pywzXvgEt/ArrOJ8pAvM?=
 =?us-ascii?Q?w+kNT3xti5SopXay7e30BPX03GtpRHvDMZsznBD9B6zv9k/n5VzJAUHtDXw0?=
 =?us-ascii?Q?8D8tvyFvF+QOTbuY3vzDb/9iDE6R4KWzLfVjjLCuFjjrcIyvDs8dwHiUaCYs?=
 =?us-ascii?Q?SVKfCl8YLbNGubtupzM1e2Eadoua043pHIpJznaR0sxPyXwkIJZlzZMKv28/?=
 =?us-ascii?Q?YGlR5sPSu3W371TIp7IS7YwDoqy1VAH6xk7ytcuyWmnnU3VhuHzDCggUBAs/?=
 =?us-ascii?Q?6vva0e1qpGcX31G0rd8pM7Neypsxo5uOUIpajHdcOGqT2DnCOAWXrVzxE4q8?=
 =?us-ascii?Q?IXEAw5Me3GNydVSc6H7ydYcf3XZsdDCPSWR5MLrGlOdmqMEzlYQO6GnPZd9K?=
 =?us-ascii?Q?NKLOR+e2Ggmhy5jDxe05O2esdiKcrt6H9rX4ZtdNrOSyGayKr/z3YqXTQO93?=
 =?us-ascii?Q?8RK95hEC2A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: p3bhU90qjm11bkcmeC2WCBpl9Bk4AOjoM/Qautc5rtpD11m+DZSbUiOIQDPN6At/PDq5dx/GG3QkgWy4aDYezw15pLrfGiVD0H99zcz+rvk7Y3dCwTntU/TfqAH/vquZY/LPW74Syg38KtMj8jzwI3LQtRD+aW0NwKTTHWAE/QQPY/YJKKkktKyajLfX5lkxVhTg62ohZivQsGsREZlYFG6in+ZWQx/8mAsI2mEE8RpIMIsY6djNhjiwa8XJspDLT8OdujI+c1xSabDlENzTn2petNGF8/D9aX7hvX9J1Sy8ph8fyjHaSS9G2N4ghg7x8iEhOLJH1reVTN+sDnWYcA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303cbfd9-8346-4abe-ce67-08df19f0ec28
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 04:04:25.4579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RQGGg+0xgHSePpJ3qr+KOcl8tW8RbdrVRwlAFCxRWU0thm4LTHl2nKNnlbqxgwdC85ZPKrqLvnvLQOV5k2y7UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7687
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

> Subject: [PATCH 0/8] log DPCD access errors
>=20
> Now that all DPCD accessors have been updated to use latest
> drm_dp_dpcd_{read,write}_{byte,data} which return 0 on success and error
> on failure.
> Use that to log errors in debug logs using ERR_PTR().
> Note this series sits on top of :
> https://patchwork.freedesktop.org/series/174242
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>=20

Thanks for the reviews pushed to din.

Regards,
Suraj Kandpal

>=20
> Suraj Kandpal (8):
>   drm/i915/lspcon: log DPCD access errors
>   drm/i915/alpm: log DPCD access errors
>   drm/i915/ddi: log DPCD access errors
>   drm/i915/backlight: log DPCD access errors
>   drm/i915/dp: log DPCD access errors
>   drm/i915/linktraining: log link training DPCD access errors
>   drm/i915/dptest: log DPCD access errors
>   drm/i915/psr: log DPCD access errors
>=20
>  drivers/gpu/drm/i915/display/intel_alpm.c     |  2 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c      | 20 ++++++-----
>  drivers/gpu/drm/i915/display/intel_dp.c       | 31 +++++++++--------
>  .../drm/i915/display/intel_dp_aux_backlight.c | 29 +++++++++-------
> .../drm/i915/display/intel_dp_link_training.c |  6 ++--
> drivers/gpu/drm/i915/display/intel_dp_test.c  | 24 +++++++------
>  drivers/gpu/drm/i915/display/intel_lspcon.c   | 34 ++++++++++++-------
>  drivers/gpu/drm/i915/display/intel_psr.c      | 11 +++---
>  8 files changed, 91 insertions(+), 66 deletions(-)
>=20
> --
> 2.34.1

