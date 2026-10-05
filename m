Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F12ECA5FCE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 11:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44E810E131;
	Mon,  5 Oct 2026 11:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GC8IoJMi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B6410E131
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 11:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791199758; x=1822735758;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hN1Ct43dzhL861//CO+UCGSLn1pqUbOqxqCidEa/OsA=;
 b=GC8IoJMiBGFDp1FgM/c9Vqahtqxi0kxGf09vbWxveBEaQaYSmiPGR9BG
 TmgzB+TH4W0Qmd1gY7OCSw0oXuPk+EM58PA0LWu0VLzXrd0QQ1HWtz5R3
 WNW8Q6oSoaN6zL81X1liCp/QXlmDF62/7/xECqZPaw0/CeZZnV/FTJxxD
 7DpO64VjLYAMBn+ZZDHIgVpYtGRFMx4Db1cKTMomF/vnfVVqJUXM9qT8R
 UHmuepeOkTZ5AqmFKsOPQNz09c5wMMKM410jpKsqPUmKDHBSPWC5ZxXdV
 bpcms9XucOqem6kI7ucfFSVPPXa5CzXxVvnEsHimO66vHU7njHQW6tUaK g==;
X-CSE-ConnectionGUID: 47u+S4hHTEmHNXMV9DcGOw==
X-CSE-MsgGUID: 7PeFFeHPROq7Nv7qj3QMtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="113644956"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="113644956"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 04:29:18 -0700
X-CSE-ConnectionGUID: 7/8eLRhcRh6YdWvMyYV8Uw==
X-CSE-MsgGUID: A0R7ZGovSceeudL1ahIS+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="273192486"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 04:29:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 04:29:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 04:29:16 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 04:29:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCAPrNgxutRnjZNaRCxH6o1QWzGbxN7ueUUQRoR2nUO1q67PnRJPtpW5cPkLXo+0/kS2gYh/0IuumNVfQIbFtyf3krga1QdbPCHc9+Q/5aiX7U9jwqu6XK3Nr4I9EAlTzocuWK0Cg/c7wo/9ffcFPvYcIlbcLGtj8WWtdUe+rSvDsc3f+qDllwUIkqoh9PooT1Kqpzh6IYi+VZOZznUan0mhGjdlbMfKL0TFJ8QI6CeNAp+kzyws/uJkjgPXnSYl/bRQMH41XvE2lhl0qo/+u6Q0slKlwtUKvLbAXaIwcdA2LivvZ13bvAW5uPlVxeGNUqpYihoNrBNpPQQI0GGFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4+I09BCkIqoFyfxJS5JFLxo9ffUVP7NkSC3fwAN0eA=;
 b=b5kOonVvB0GjPZRVap1PJU07JaVt+EbVZScBcSfoBnpTBiCBgRlYbfu0NzQAZNw7bXG5Wo6mEg2RL4KyrFtNoI+jlG6z3Alp9Xz9NMO2dj2gWw8awdLcRVrYYZUnEXIbTGOGMUrSEasxmEhpoJZnmp1vAb0o7k/9FcuEiuqmC+IGVu8T72KOhyKJKF7pXhvTj4uzq1CGwiZz4IM6SZcZfxKlNj9IaJziJylrfVENcVoipTl/5HYpQhpcLoJoKhXT7OTHoM0aLUYrTmP+LxJYTrEDsT1HogzjN4dO1Gi9IPplKtXbGwq8aSjUKzvLKK0NNgsq8+3nXtagkyHVuoSi3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by CH3PR11MB089109.namprd11.prod.outlook.com (2603:10b6:610:361::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 11:29:14 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 11:29:14 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v4 3/6] drm/xe/xe_ras: Add support to query page offline
 queue and list
Thread-Topic: [PATCH v4 3/6] drm/xe/xe_ras: Add support to query page offline
 queue and list
Thread-Index: AQHdVKhAD1docXPVdkSj3OKnV+g457buz/1A
Date: Mon, 5 Oct 2026 11:29:13 +0000
Message-ID: <DS0PR11MB871825E717FD05B9DE95144381962@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261005090156.1233748-8-riana.tauro@intel.com>
 <20261005090156.1233748-11-riana.tauro@intel.com>
In-Reply-To: <20261005090156.1233748-11-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|CH3PR11MB089109:EE_
x-ms-office365-filtering-correlation-id: d9e70e6b-2b18-4add-4bac-08df22d3e262
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|38070700021|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: r8Gl08GzAJ4jL8ibxR6hV4nRdlx6+3E0dQHHgc4fe21hfn1zA9761HGjGxW4TrM594g4qewZ06xgYfamSd59LPiGEdmqtMv1HsNDBV7EkJ8n1IYcz6WdL7H/jylAnpeDD0An46i4r16QOQ//uMHjvBnk8iM6hzJ09WNHqGPXmvBBGyx/KvKW5eII2RFopd4Ru9UAnhKvNfZiS+96dVECpYcJsS07N4WMgYDj7Ri0AhR7lZWQ0jC0meWOwMw1lxB1Ytu61X+EFZJCbhVhhfUm0JjKLEDxeORZQyayRRKfKb65/yyBjRbuWWg1O1yPlQNlWXOt0o0jASDXydqdjU96mRKttKtJW63qKv46+8WC/18VZFMAEsqbh9qXfCZy43iAJpm7VpJoZivAEzMlrQGncyldr4o6s+HT7TFDrsGNi76o6wBV+joviHph9gxW+UTOtQK2ArYZzscYUl8/g+sjTXvOlr0e8d3ST43AirMcrZpO8r+mwTSqVoQ0Ft/6t7QIIiKfHbLiPzGsJuGM4WJGPul15Gt7myzzB8bnMhVErjIix1WlfWRFzZ4gMcX0B+xUDhsl1QeHGQiyQ0NvuaxzvwpsdNMvVvh18WYIYLoJMW+B7VdJjYLxbWs9aKxDKg8by1Z+rSlw64gj4bRARg/ToH2xRqhoayZvl8NLIGb2mcpKH+aU+pIFv3t3dEucH7ZqE7BetDDacjxS0mX3+65B98iuX3DQy23Szsd181wfIik=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+LpJYveeobyV0eTvVda4EqZQqxF7oCXwA2aRyTnE8e1lEEy+u2R1Xf0oEi/V?=
 =?us-ascii?Q?7ea2DyGLTterT5ntpknmAnFyUPDFYwoMgbQPI3uxoj4nXWZ8BPMmOe09vB4k?=
 =?us-ascii?Q?2wktffkh89FF5XN+0UNC3cXTEBOGvtnGgzWO803UZGX9F+cld9/xmXAyFwtE?=
 =?us-ascii?Q?hLGhiXQgAQE/X0y0KO7+sifyiRBo1JOVUEcgGOTIOtWSbbMZA4ETX6IBH5gn?=
 =?us-ascii?Q?2nV171GzBo4YYIEhIPXah2gP+PnVeyclrh9m1GlXnKQvTv2z2CV6M5ITNdWr?=
 =?us-ascii?Q?Fb+yZY1E2VbqslPCydcvUvvDXVy6GdotDX3b/yJxLuwapKHiRoa29UsOFMH4?=
 =?us-ascii?Q?kNQeOUUSEUg74YT9Uf9a/hm4xeGDFwoquJAYahr67vOmv4sSKk2YgaZhTrCG?=
 =?us-ascii?Q?iiB1xFEFkdxgXgWSeUr9ImFu/Dz9SFlOBUjhbfeUfwKWONtzcuyOWEWvlMbX?=
 =?us-ascii?Q?Es3TzY7euhM5mVjBEUR1bafA7eCDtnfYs1La/535bT4Dk/o8UYFLr4oLRQpB?=
 =?us-ascii?Q?B9qKd66tV2Y8k+u4BzsGmlUY78FU+2EOJcMus9oKV2H12tjnrUyv36h0WybB?=
 =?us-ascii?Q?2mWD+vyiv90RSG9TIZTLevW2Derb6zG6V61BT7TlEOFakp+38Lb5N4HlgeNG?=
 =?us-ascii?Q?QRm2z27Xol9V1AxhMlYUcBvYI38J5zyhW6D82A2en8ihRN8sFbTAps3WpEHY?=
 =?us-ascii?Q?2t9ojWocgD9VIDEEtrJXrIFO24kie8tAkFri8YPKGZLAjBD7A5PBuJlntruz?=
 =?us-ascii?Q?VDjlf0ujMfc/zSiTr/LuFnEd8iWFKFIg8+i3gJ7z8vSwNRDY/kyAKuntiH03?=
 =?us-ascii?Q?jWlyZf3KjtjLrFrbcyfE0Xq/ib10YbR9mJcr7T3OeQkuNq2QaZ4cTRu8RH4O?=
 =?us-ascii?Q?R7Pz55g4pGfAN9PAoF99Z2WC6iGrRqFDNauCxQA5uaRU/UFaVjrtg330o4VI?=
 =?us-ascii?Q?VtlzETyVzxFaBRi2ZxlvHSVWNPCac3kb6stb5vn6DUG78KlsDM3qRQgCLumY?=
 =?us-ascii?Q?0AKYPHA9EhwmO8JxWCUcGKYNbIOuReLA8s1VkPy7VKBu8SJsxz+ed0Iwm7i0?=
 =?us-ascii?Q?AxwX4cYrJQy30lcfwlCCJVg79c7XNWdongmOKx4RKrCyG3dWhc9piAMmoCFQ?=
 =?us-ascii?Q?FskhxNMTpdxB/BFOoHWRzYIc78w7Z+ykjjgcNGLn673evYAnrXVFidVwLMb4?=
 =?us-ascii?Q?W+YLtchtG+HQJVaxQTUe9lYGDsL7VO809GL/jlYjs5RCg8G7twZPrJPgAUoW?=
 =?us-ascii?Q?moraMulk/InhZ7OSJtXhqHXSQyG4VdextVbU2ZxDiE/278uYmLfgvPYyQJyp?=
 =?us-ascii?Q?TcSCzDLL9sMnLYNi3oWyT9r8glbU/URNZviz7lhbs3SZNB6DfvDiWxtKAqSE?=
 =?us-ascii?Q?DQaHOb2BsVVfidqw7aFUTUPtfGCiSzFCSx7/2AkPFo2d49WzyKVwYSJztiMH?=
 =?us-ascii?Q?LmZ9k/GdJJPBUCvQjYzrfdrRmW8WFlJZNSE55G/BYMKR90qcA9dYWxDqCeDH?=
 =?us-ascii?Q?A8qrVyhabDxr8bBiRemEHBrGIX6YonboFsIotE4u/epyCHXY9rM128GSm51b?=
 =?us-ascii?Q?I/a+NLpI+3n7mCBZUUNm7z/KcLDnF85fZL+OLbxQ76ziyq2++lyoN1YJ2crG?=
 =?us-ascii?Q?uYS8o1qu7TGRo6zKDEpvsjrVDIfzM4gINcD6KsLFse0xDrqCBTbMfreBY5cW?=
 =?us-ascii?Q?SaapKkk41sq3Ge9AvsHXFLVzXATv/qNfx+I2kbr6708roFAozpbPNA1O46pU?=
 =?us-ascii?Q?wrVuPffgXw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tEtxJopeGP5Lwd/PwmV9OZw2w4cFf8MRPXZh5+Npstw347FxtgK7ts0dpdIy0qd6ghvz3lSsAC5D4eUWohGuNmV3pYapTlez2VCLfVgxB1pIag6VRJonJ8oVdoO/PeVSzHigGt3YT0jiL2+iTzW9SRlUyYdFr/hndMRx8PaQ+qV5ApZyqCLIbCewr89X4hn9LgaLruYDbIJ0zUBuinVuwadZB8AOtzLRbDYrB9x17tMsDSO9hBn0xQVjARzsONyriXwAMbelpNBq/WCWzHLXVWn/yB8ZK4WDTqt2GSxFrSmJ2MgVCetheIHL8w/Pi7Pwcl2vwqTeIlsVW4YBhdAxeA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e70e6b-2b18-4add-4bac-08df22d3e262
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 11:29:14.0860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KqZIUh6dDhRF5kRJ97Hv0Cz7mba6B7N//uTcJbIAcKNvCUVabuWF9Udu2OTxI6ugd+fSmYrytyXyAVkjomzvC3JXLwuGqTntZebhzyPt8+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB089109
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
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: 05 October 2026 14:32
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi=
,
> Mallesh <mallesh.koujalagi@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH v4 3/6] drm/xe/xe_ras: Add support to query page offline
> queue and list
>=20
> Add support to query page offline list and queue from firmware during
> module load. The page offline list command retrieves pages that are alrea=
dy
> offlined by the firmware. The page offline queue command retrieves the pa=
ges
> pending to be offlined by the firmware.
>=20
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: rebase
>     store total pages once per response (Sashiko)
>=20
> v3: common function for offline and queue (Himal)
>=20
> v4: re-order list and queue (Sashiko, Himal)
>     remove type
> 	use size_t
> 	add description and rename functions (Tejas)

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> ---
>  drivers/gpu/drm/xe/xe_ras.c                   | 87 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras_types.h             | 35 ++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +
>  3 files changed, 126 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c in=
dex
> 2ec310c29489..14fc3227483c 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -343,6 +343,89 @@ static bool ras_counter_is_valid(struct xe_device
> *xe, struct xe_ras_error_class
>  	return true;
>  }
>=20
> +/*
> + * Fetch and process offline list and queue from firmware via mailbox.
> +@notify_fw controls
> + * whether firmware is notified of the offline/remove action.
> + */
> +static void process_offline_pages(struct xe_device *xe, u32 cmd, void *r=
eq,
> size_t req_size,
> +				  void *resp, size_t resp_size,
> +				  struct xe_ras_offline_common *common,
> bool notify_fw) {
> +	struct xe_sysctrl_mailbox_command command =3D {0};
> +	struct xe_ras_offline_list_request *list_req;
> +	u32 total_pages =3D 0, count =3D 0;
> +	size_t rlen;
> +	int ret, i;
> +
> +	list_req =3D req;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
> cmd, req, req_size, resp,
> +				  resp_size);
> +
> +	do {
> +		memset(resp, 0, resp_size);
> +
> +		if (list_req)
> +			list_req->index =3D count;
> +
> +		ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_log_err(xe, SYSCTRL, ret, "failed to get page offline
> data, cmd=3D%#x\n",
> +				   cmd);
> +			return;
> +		}
> +
> +		if (rlen !=3D resp_size) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> +				   "unexpected page offline response length
> %zu (expected %zu), cmd=3D%#x\n",
> +				   rlen, resp_size, cmd);
> +			return;
> +		}
> +
> +		for (i =3D 0; i < common->pages_returned && i <
> XE_RAS_NUM_PAGES; i++)
> +			handle_page_offline(xe, common->page_addresses[i],
> notify_fw);
> +
> +		count +=3D common->pages_returned;
> +		if (!common->pages_returned)
> +			break;
> +
> +		if (!total_pages)
> +			total_pages =3D common->total_pages;
> +
> +		if (count > total_pages) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> +				   "Pages returned exceed total pages %u,
> returned %u, cmd=3D%#x\n",
> +				   total_pages, count, cmd);
> +			return;
> +		}
> +	} while (common->additional_data);
> +}
> +
> +/*
> + * Retrieve firmware queued pages from warm-retained SRAM during probe.
> +Handle and soft-offline
> + * each page as required.
> + */
> +static void get_offline_queue(struct xe_device *xe) {
> +	struct xe_ras_offline_common response =3D {0};
> +
> +	process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE,
> NULL, 0, &response,
> +			      sizeof(response), &response, true); }
> +
> +/*
> + * Retrieve permanently offlined pages from firmware's non-volatile
> +storage during probe,
> + * allowing the driver to soft-offline them before kernel allocations be=
gin.
> + */
> +static void get_offline_list(struct xe_device *xe) {
> +	struct xe_ras_offline_list_response response =3D {0};
> +	struct xe_ras_offline_list_request request =3D {0};
> +
> +	process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
> &request, sizeof(request),
> +			      &response, sizeof(response), &response.common,
> false); }
> +
>  static struct pci_dev *find_usp_dev(struct pci_dev *pdev)  {
>  	struct pci_dev *vsp;
> @@ -1067,6 +1150,10 @@ void xe_ras_init(struct xe_device *xe)
>  	if (IS_ENABLED(CONFIG_PCIEAER))
>  		ras_usp_aer_init(xe);
>=20
> +	/* Fetch the offline list before queue to avoid duplication */
> +	get_offline_list(xe);
> +	get_offline_queue(xe);
> +
>  	ret =3D devm_device_add_group(xe->drm.dev, &gpu_health_group);
>  	if (ret)
>  		xe_err(xe, "Failed to create GPU health sysfs, err=3D%d\n", ret);
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
> b/drivers/gpu/drm/xe/xe_ras_types.h
> index 1495a8636255..40224db38906 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,7 @@
>=20
>  #define XE_RAS_NUM_COUNTERS			16
>  #define XE_RAS_NUM_ERROR_ARR			3
> +#define XE_RAS_NUM_PAGES			25
>  /* Error bits in IEH global error status register */
>  #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>  /* Device memory error categories */
> @@ -330,6 +331,40 @@ struct xe_ras_page_offline_response {
>  	u32 reserved;
>  } __packed;
>=20
> +/**
> + * struct xe_ras_offline_common - Common structure for offline list and
> +queue  */ struct xe_ras_offline_common {
> +	/** @total_pages: Total number of queued pages */
> +	u32 total_pages;
> +	/** @pages_returned: Number of pages returned in this response */
> +	u32 pages_returned;
> +	/** @page_addresses: Array of page addresses (4KB aligned) */
> +	u64 page_addresses[XE_RAS_NUM_PAGES];
> +	/** @additional_data: Indicates if more data is available */
> +	u8 additional_data;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_offline_list_request - Request for get offline list
> +command  */ struct xe_ras_offline_list_request {
> +	/** @index: Zero-based index into the offline page list */
> +	u32 index;
> +} __packed;
> +
> +/**
> + * struct xe_ras_offline_list_response - Response from get offline list
> +command  */ struct xe_ras_offline_list_response {
> +	/** @max_entries: Total no of pages that can be stored in flash */
> +	u32 max_entries;
> +	/** @common: Common offline page information */
> +	struct xe_ras_offline_common common;
> +} __packed;
> +
>  /**
>   * struct xe_ras_get_health_request - Request structure for obtaining gp=
u
> health
>   */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 60d17ccc002c..e1bb64856f43 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -31,6 +31,8 @@ enum xe_sysctrl_group {
>   * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
>   * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>   * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/remove a
> page
> + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined
> + pages from flash
> + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined
> queued
> + pages from firmware
>   * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>   * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>   */
> @@ -42,6 +44,8 @@ enum xe_sysctrl_gfsp_cmd {
>  	XE_SYSCTRL_CMD_SET_THRESHOLD		=3D 0x06,
>  	XE_SYSCTRL_CMD_GET_PENDING_EVENT	=3D 0x07,
>  	XE_SYSCTRL_CMD_PAGE_OFFLINE		=3D 0x08,
> +	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		=3D 0x09,
> +	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	=3D 0x0A,
>  	XE_SYSCTRL_CMD_GET_HEALTH		=3D 0x0B,
>  	XE_SYSCTRL_CMD_SET_HEALTH		=3D 0x0C,
>  };
> --
> 2.47.1

