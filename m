Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25951C3DA64
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 14:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13AB10E390;
	Tue,  6 Aug 2024 14:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKEmFWJL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225C510E390
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 14:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722954647; x=1754490647;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YPs+jWEy5NTG60IuR72liHbW9nqXUfzBmRubmIbGA/U=;
 b=TKEmFWJLmnCu5XVD6SMpTQB5IU/ueJ6L6CtuTdwXAipGwVOSzSAUyft5
 /flA/DG1Lp8gwr/eJxZpyF083pUk02BS/3LegJZAUxZH+WT9iiiLqiBVN
 ay3N4FLfiP/AX3e0qTGTT7enHfMl3UlvTeschlbQ0BVYirXwSpWU8Dnwy
 vriZ6QVGO3YbV8/o7KsTU/SQnqRCarwY8k6wMnio5D3nU0Cl2MH03VeCH
 5sNhcAOzAox9eClKOQMEejCIQ3ckOJx3M1GIwRtqfk6BVv2ZykhF7Xw5T
 nfnm+k/VtjYAZaFQlUpkWVraSRlhcs95xhRZ1gKvQjPoVtPAyxaTzKMYX A==;
X-CSE-ConnectionGUID: pX/EmskwQNGqFUl2Drhg4w==
X-CSE-MsgGUID: 4uMXL0BXRkysuo2HslCR4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="24740362"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="24740362"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:30:46 -0700
X-CSE-ConnectionGUID: IKaQ+4wFQ6qu5wQPsuDHfQ==
X-CSE-MsgGUID: 2rgU8JeCQp+Gfx8+vesjow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="79795461"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 07:30:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 07:30:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 07:30:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 07:30:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 07:30:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBv6PMgGvw88RdsOZWdu+uF5D23WdrSWhcVvqh5HETO9jndlnUuaSizSV8Hv/XOs8nIVrx3GCA9BCVInDtsMQVltrHJ0FPNy226u2qW0RXPBNGYGkqZi74G6i6mZIIdJJWjOFNliFg+TiP8/V8o65HNx3aqGv9ArAevIRSXSloYeMeCZhgXoBAr2++1nNcfS5trKLcvhsLXgYrwvVpTJR/wnbtVPd8DBwpsBqwIUrH98Si0bCADH1E3FMZF6Uif6qsZ8a17BHkH/oqmLKCJOfszL5ViOLKpjbVQayX2ualHAlemu0zS2P3tTlzTk5p9ZiYwLBu/x6XTU+AFMZd/TuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvS8PzXpucF85Ay/AyM+lQDEANEETyuiEqXPRbBAPDc=;
 b=Ka4/NogjSWAu1EwCby8Ly3aQY/g3wbxelbWkmMUSMC14FolF2wiHO1yfAHRKkFzH/+1dQOrwpomvHjyMXawEJ0k/GyFAAcfPH9fB0i1Qzg9S5bTqrNtW/sSTfOK120whqxoNr07JiSI+ZmNm+Tses461o0mEJ40JTg/fC9lU8jlIQ0MjQMVzX5usgUYqISuGojd2llDtNqFSHUkJKLfcJbjrRZ3x9XIh7M1QgwGrqoMUaLuTnTEKhfRee+jZ8thq8JI1M1bi4viNkvjKHjTuiHl8ae0YzVnpRLfk/2/GZVkk5KtOpjDPeXkXv7/i8bNI7Wvz062p9FZfGIA+7ejcLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB8163.namprd11.prod.outlook.com (2603:10b6:8:165::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Tue, 6 Aug
 2024 14:30:40 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 14:30:40 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>, lkp <lkp@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH] drm/xe: Fix access_ok check in user_fence_create
Thread-Topic: [PATCH] drm/xe: Fix access_ok check in user_fence_create
Thread-Index: AQHa5/MT9nb6xTVVNk+mPp/+a2okYbIaSjWg
Date: Tue, 6 Aug 2024 14:30:40 +0000
Message-ID: <SJ1PR11MB6204AB4E164D672BF8B152C581BF2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240806110722.28661-1-nirmoy.das@intel.com>
In-Reply-To: <20240806110722.28661-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB8163:EE_
x-ms-office365-filtering-correlation-id: aeb6e256-afe4-411c-fdd5-08dcb62458ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Vful7mXfq2qPkTX8RL0iskDKd4zF/Ywrsp+9gVweOx8tYCK2Z0XkTDP7+/zP?=
 =?us-ascii?Q?pgNINCAvZV/Tvb9ATUjv0553AZUl0VWvY9K5H+VDXqQZNwGD6fA2Oe2q6klu?=
 =?us-ascii?Q?ZbRCx/do+4bu+cnR/3cpV6TXujwbAVOh7QusIzB9a6eh/cqjqnvKYkJikMUV?=
 =?us-ascii?Q?EbM5f+uS6XKS044iYKbkjmWB7AcOjPo2U9i5fQ1aKa3oR6nXqwqwXlbHwuIV?=
 =?us-ascii?Q?QaTDOgQb4EA+ELTyokLm1msife/Aqs78Z7QTsLesCWw4HBY+PBXV0Zf+AXaL?=
 =?us-ascii?Q?Vc/JdclZUYHj4OwRzs01HjSyK/HOZBBgEYR/BvA6yOFi9MknB1TEFju5pgji?=
 =?us-ascii?Q?YjkV9Pu3iKyMYjaBUz2uj5CfhPVGCNCJmpLlOAnptlAyG3m/AZSCJ2HJ58jI?=
 =?us-ascii?Q?oul6LpA+PtXZR17yriMPXxDRFd2HZA/N8oGsWQL9qz8zAQZh9JIY+LK2rGs9?=
 =?us-ascii?Q?y7vWPcbZo19oP/KU7b1y97ZhhCyQcH3W9q4kcp0XF+WOtIgT1sItfx1/nOjF?=
 =?us-ascii?Q?uNu7vNIjDkRA2w6WZUuOSrsjutS4oDZRGOr3sMKo08oskNAJ1g5GTC0P3qWR?=
 =?us-ascii?Q?7Cnj2GG6y3M1QGP6xrG07nL9jB1CVc8J1CRxMz3pRhb+s1Zrq0kprPz8sbI3?=
 =?us-ascii?Q?nZo1LjeMymksINZmhsdwfjHY3px+kgp2I8VRF7DGUWzdi2QSWimIwx9eE0sC?=
 =?us-ascii?Q?+KQ2vjW1nqNSUXU6/ajY1TS+Gpfyi/nvqldNPdxkHE7/pLTFjJcKdtjH92sL?=
 =?us-ascii?Q?c7NOGELPvzn8z7zIOKSypsBDExRHmWTxdgEc3RwcZyU8mwrWF+uw9q/bEf88?=
 =?us-ascii?Q?gyR7IMn84yLqC/kr8eTeBoUqIPGeE1WRl7czhuU+1sd/EfJCbtkin+kZBr6r?=
 =?us-ascii?Q?br8NcPqHJ+gFtJIvq7Nnh3SCkiKYaLTkOhgEb/1Vw0baeCRQsZ0G84tZNH2T?=
 =?us-ascii?Q?wEWrbpmqE2wW4LhZfoeO6FCazHJDyq2b7OkFkmtY/lf7Xbu0CrmVh5YGiEym?=
 =?us-ascii?Q?2BPdhpFIk6eGkk71eW09Mx9aXVnw410pWjALe2ByLM93R6xDzoelgqRdSYlw?=
 =?us-ascii?Q?3arSjjCunRplkXahTMPF8F3yCh4he7MuebxqET7PGJx1vgwXAUpRBbXN57Lt?=
 =?us-ascii?Q?RAf4PjFKCk4iUSJqTsxzW/BWG01HW12DmggjAXN5PXWl+XsmfRdyaY3z9hP8?=
 =?us-ascii?Q?RQUjBwsS4tNAdrGkWnyihBbYkZR66dGSH6DQItZA/t9MsW/dXsWmtA53cFI4?=
 =?us-ascii?Q?m7bDgKk4h//YIVn4hn3u0ZWFebfPx7MN7xvNmHG1zbDuYHvPstvk68/oI5Dy?=
 =?us-ascii?Q?OscYcFYHSFIxe36Cv60JmGXro5dO0P5ndraZY8rPLnDFCcie/y4dZceC0+wM?=
 =?us-ascii?Q?n3akWZQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZyGrfafPhRbvHSgjiUVldGDwSRHqVI4FimnTuQU9CLn+aJaHjhw0kjrq+AA3?=
 =?us-ascii?Q?ew/XoGDlWS4RH8UYeYE2JIvOUbuRJqp+c1h5ICYm0J5VPze35vlChvYazaJG?=
 =?us-ascii?Q?mOz/FoSz5KdQ79b5tPnB4i8ygvoTuLWRzQ48dGArt+Ii6x5Pcy4OZeppgCIP?=
 =?us-ascii?Q?6lA3UIkWR9/F6ez/TerUg7Kjev7HkKWt3B5k3dyyumQug/cEQ8Q/tKnyyjSv?=
 =?us-ascii?Q?u8l9ckHwhnSsNW+FRg6JpkS0U+uWnV/I1uitPjeEe/U+6gdabOyrj0HoUGCu?=
 =?us-ascii?Q?pZ0GAQF5Gpym0omcqU2RHamyVGuXDQYatApCQYpYCC7ZM6pUy+77gU/AgX5v?=
 =?us-ascii?Q?b3ukbj1CTeGAUdk564sCUiXVXq8STXn5wZ6xUDvoQjUXigG4WDYdvBPx3qnh?=
 =?us-ascii?Q?GmYyp4+LaQL/JrPSo+UOHP2mtRr6tQMhtJh2qgHENDp70Fwqgjot2yH5vsP4?=
 =?us-ascii?Q?FDC2YrWY6MHI3m8kPPpkuEXCO072Es149oBw2xbTA4U8/w7GUZR278xt5GrD?=
 =?us-ascii?Q?8sp7zTCQlLUeiy3mQKTKHcbYG1m8oJtwly0udkf8Z2AyNVV2KwnQoE6s2icv?=
 =?us-ascii?Q?KajrGOsib/COgj6gyz/Xgb+KKGUTVsfaCW0uOLund3HqL8RkABBlt/FqRuia?=
 =?us-ascii?Q?caWQ1kpol4fdwddVLSxwmkTOxGESnppnB4ZVvWkiAJ7Ut/VaSCs3IawZamqk?=
 =?us-ascii?Q?VlwWkO7Yxe1/uYveImlXRPxMsXluh3RmdDwt3XLcKhW+bip0J7zihWcGOr9K?=
 =?us-ascii?Q?Xu2N4DBXF1t5DJEqB/vb8OLZ9LhpZaY8vYDxj+e+7VRNDKWJFl6IRTG0ySD6?=
 =?us-ascii?Q?JInGnDmsZ//WI/+6Q3pcJ4Soj5CSojrUqTEptsYdTHQPeixHUpTwQXKWi6wz?=
 =?us-ascii?Q?1wmnrGc8ioNregbsQM+Cm3z1AA4ODsw5Liy0WvdXOdsEk7zi6JkkdttZi8St?=
 =?us-ascii?Q?gR16W9JWGYCrUK11uaIPCrCNr/pjxZTO255cIt/A3vfsEveU5Qgaxhx2ywet?=
 =?us-ascii?Q?tXucH7PEPANogQCdeJaE51ZgEyc1oHMBdmsggZZ/mTDxC8vN0U8F4s+y1vDu?=
 =?us-ascii?Q?0c/ysQj3Ptt3dUKZRV+9GSe6CZS5WVzkfJYchxw4OTW48LQ8nQHMYBCQSt4G?=
 =?us-ascii?Q?6stoxyxrZly/VJP2j4Vvxiedzm3CP2wiaQGPF7jIkK8p3scCqoLQO3X4QHjn?=
 =?us-ascii?Q?MIMzbpxHewd2AKU8vjSvUndOOxYmOvUAnpAU4H8uFdvdQxbw3JILzk7JHJEj?=
 =?us-ascii?Q?fU75uR6/chtaoxso0WZhZATFYPB1EGYw4VCXPSR5hrJ2SNldTd0OM6/3ifvz?=
 =?us-ascii?Q?zDd1Q5yWeio5wehDgHoZESWPiXA3P1SFDW8jGdKCoM7WCJsxMf2KgLpJzyCh?=
 =?us-ascii?Q?8xlYKK/Bd/5p59bnArJ79e57OjVRNIIC+GPJiJrWNuVxeb1N2dML/pK3YZcw?=
 =?us-ascii?Q?bBqjUW4gMzxhcdprN8mDs68BkrLuQRqL2A4rJ1a1vUbd+feHpTeHkGY4yr+e?=
 =?us-ascii?Q?OG/tsfFlLRvWISDu62wDCRz/LNF/tGV/PKyC44aC3QgPypiVw0amyKg+4FTA?=
 =?us-ascii?Q?+ehZzqrecyEKpNC0xfAFT4G1XF2egGoUOSuL1xS0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb6e256-afe4-411c-fdd5-08dcb62458ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 14:30:40.2190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wTCRPUTsujSiicc8cpRZBJ9ZeHDKb0Ooz+3Bz/0TajCKfzHCzo9JjhlSRVdpr4rIYLDlzLJ5Uay4z8jvlTxwD1Z3e0ywni391SvDNERcZac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8163
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Nirm=
oy
> Das
> Sent: Tuesday, August 6, 2024 4:37 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>; lkp <lkp@intel.com>; Auld,
> Matthew <matthew.auld@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: [PATCH] drm/xe: Fix access_ok check in user_fence_create
>=20
> Check size of the data not size of the pointer.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407300421.IBkAja96-
> lkp@intel.com/
> Fixes: 0fde907da2d5 ("drm/xe: Validate user fence during creation")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 3aa6270e5dd7..ca826aeb41ea 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -55,7 +55,7 @@ static struct xe_user_fence *user_fence_create(struct
> xe_device *xe, u64 addr,
>  	struct xe_user_fence *ufence;
>  	u64 __user *ptr =3D u64_to_user_ptr(addr);
>=20
> -	if (!access_ok(ptr, sizeof(ptr)))
> +	if (!access_ok(ptr, sizeof(*ptr)))

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>  		return ERR_PTR(-EFAULT);
>=20
>  	ufence =3D kmalloc(sizeof(*ufence), GFP_KERNEL);
> --
> 2.42.0

