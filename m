Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF86BC44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 19:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6530E10E4CD;
	Wed, 22 Jul 2026 19:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hgqNX9qh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7281110E455;
 Wed, 22 Jul 2026 19:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784746894; x=1816282894;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hWEAxHSEG9LquJKXL3WR4RaM1COKH9m3NAgw0f5u5Iw=;
 b=hgqNX9qh1jQv/g7FaaEQkxLXCM5YyOmoMgJl5qqAwEfXC+0l0/A+VXLH
 r9R0XGjruMyz9pUXR4OsH1WskpYNBm51POyIV27AJzKQ4VOq2VCZtaQPM
 YrBT7T2VX3LNS1QrGIMbpNsSBtZgfjoZzf9Xew5d3/D3AJB0X6wIfSU34
 u2RluvX/fWPAKbqfhEVdUJ3WzSZH88kB4Y8zxxm3lTJCSVwbkQ51fQrSb
 LgvL/snHsVpimSOZ/2xkkuvsVk7BdLZKo0+fhZ/wgHVRBHredtN0Pg0CM
 R+L5azslGUIXi0PYEBL91Hh5sdX8TR3RX56JODXpigypQ64Lu1xS93Ogc A==;
X-CSE-ConnectionGUID: XYltnmwUQW+5/vpFdJOVsA==
X-CSE-MsgGUID: eEmUqcaUS9u4Cad2nyugZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96052208"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="96052208"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 12:01:33 -0700
X-CSE-ConnectionGUID: asefIiXsS2yDQTn4qEIyQA==
X-CSE-MsgGUID: IpJqgefDQOSryNcIz1Q1vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="288181607"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 12:01:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 12:01:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 12:01:32 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 12:01:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCLRj01EeqRUAAKJwegiJDrUjeyab71nBSJHxku9W8DWYlJUf+KHdkRM4QOOw865Xxrl5gdQxGyvfk2Gk6zJ4IPiB+uu+Lw9azQX/ELzVLtNGOE40Ui3tnNDLnlzXWr0R2FwtiGWbubGxjKQjkmpzdN/pEbVvYa0qwP7qM5JmOhq6LygGo89kGD+F0127knzr8HBMN+Zw9jHY77pAlJvnuTbQGBbvABrJCJygNOt2foh5II+GYyQgqPRqMfvGjS5i0AYQ5PaREpB0rl99bMFNpnji/FdEUmR2vlxZA+mYg/ElIjq92pJ6pxfKlB5eXJdnTrxlsCX9IO5qLuD5SyGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DozbaXvJIa9eBA4ipRI41YMMbliSlUw2MtCXZOxsRjc=;
 b=aLWgSlxv7x214fRv2mJz4oNxoqXdWpIRwptYyEdDWGiqFcemN3TrnVa89qm9dyI1wenaFIbPvwSy+uxBQ9Bsvtfy/dkmKQ/F4arTH4TwOE6sNlBxX5eyNAdmSisvdqNaDfi7Tq5B+g605XcobDMLFTTQUB5SVNvC5IVyRwTX+1SvFVnrYCEX6Z9Pt1M5lfy+kkpn0Mv8pUfrt1X7HvNInOZLBFu69a2yRv/RoMXZjLJTUXB4DPT2OdXltF3QwhptPaEmIIPWVJsyIVUjxg7B4wFk7EnKPfwcK697ofgM5edQ1Olmm3mnAtLvZeBCB7v3VzjuZX+1TydEXETJExsjIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 MW4PR11MB7008.namprd11.prod.outlook.com (2603:10b6:303:227::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.10; Wed, 22 Jul 2026 19:01:28 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 19:01:28 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/migrate: Support copying between sysmem and stolen
Thread-Topic: [PATCH] drm/xe/migrate: Support copying between sysmem and stolen
Thread-Index: AQHdGUakpukFur8Al0CC+n3YH3v0gLZ55RSg
Date: Wed, 22 Jul 2026 19:01:28 +0000
Message-ID: <DM4PR11MB63600BA9A874C1FF20EF7391F4C12@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260721142610.93804-9-dev@lankhorst.se>
 <20260721192540.115548-2-dev@lankhorst.se>
In-Reply-To: <20260721192540.115548-2-dev@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|MW4PR11MB7008:EE_
x-ms-office365-filtering-correlation-id: f8480d38-f95c-4e07-8137-08dee823a2b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: Lbf9l0V2d2JMtE6MSrw5cXgQQTe4/xd7o251r8pBXjA7R4Xg0S21a0+1dvSkkHBHYBayaRIoCyI1CI+wZxj9UaVAI4Uq2M22h6fnA+Py5iyyazWnjVeAYH77ILsiv8M2FkywpoVKoLD/lQsyMiOhYFdPrreM2caVaH9zIcn0vHnLTBvvV2vl1KOJtdLtGyRfq23raF9yhAnOC55KHbM2hg2IYhtiytwwCVcG1vQfyWgUBjH7OsBUzQNWxUZdhVf9itZh2qPQcNRtAvV3M/ABopj1ou1a2gkvTr5oujKjSx6+pXKqyEvYLQF6zbZFUHwYZnQFVYQS6iV57qyl9MyyvDfSvayZ4Iyw/Xm5rVGNtQVhUWvzr9KQApxyec1/UZ1ZrdjXL2Cp3c+cTg44sFqBrjum92Bka/j4ypBRR4r8qIZbnNbEn0igLz/dAosTH2eKCf8oukPXsq1bwDnMAX9ROSMITx7Cogd7wFPoVaPDKqppVrFbznLi8B1KLNzha/Adtj2sqb2CIsli6XAPZ9qdnB5tFzSyDwhkLeM+Do440mIgZqmRhKXKTFCCre7N2dN6NnPc647WsVmDByOSpmapAQ/nWov90LSyi1fRNrsXtd1HA1YIJ1kus83jTnTZUmchIeDRPWTMv9oRD0ed2nmSd6HMagFLSEfu/+7wZRk7Rb44oPbKfgfdgr8G1O9BNzykhXhFvylwVv2d6w4UbjfdE02IIXv7XM8X3jX5os9yOR0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?81AvV8LRaayOAOGFmt558ZsLna5+qgtdHI1JvB+ZPtKFf1TQPE2ktworp8Gj?=
 =?us-ascii?Q?TKsnTpqn4BvMCra3qTuwzyl6rN4XFhHmStNkJAjN5MeG4/ZqTlMytLHbPiD1?=
 =?us-ascii?Q?z8FLwZUvjAWJNvt2ILgWb/V9SCYytsqPtUX4vidwxoPLcIczWdi611Mf/ptv?=
 =?us-ascii?Q?1pbzKsYdPcE91+1dWUbEz7n83MwW7FDVevM0P91zE4PZDz61Y4aFDCGjUSxu?=
 =?us-ascii?Q?RDOq7HlK/Y7K0RXt3mOuVBxGKBJX/eOCjnTSDGWaFkTJXwYFpGFdS9cLIyL0?=
 =?us-ascii?Q?yBzxESqA4Q4fxsyBRkJGfUAHkN0aGONySft1+RyOclwT5Ymy1f6xFsZGzw/w?=
 =?us-ascii?Q?Xb7To7YRKKKKSgyUCll7h912mKBPi6z9lWIZKg7felfMCTBnDnPreEWTD4XQ?=
 =?us-ascii?Q?X7Og+B0yEBxPEddzxdMFrx3RfbyYobFHaJrISbhkYF14jrZqJuxdUALRlfm+?=
 =?us-ascii?Q?7fgCrkVkCyxhhyL+Nmr9IzM+5CXD2n7SYgsC3+XV9J2GWgtsA1EmJo5dSLLz?=
 =?us-ascii?Q?Ie+Gi+iY/m6o7eLI0w7GP+eecJRyi+s2Cwa7+P78vKtUyW3KU8A5KN2pGqIQ?=
 =?us-ascii?Q?TX9wbeA9zPM4cTj9x0BowgHOgueu0R+t+eSo7t4nZIKAPZsBIEHJ3Ff0jhuY?=
 =?us-ascii?Q?Yi06NOkWhC+ZkzWqAF+ASvPSEGTK9HmlQKZp4yz+eR3nlUMhYOBWMxzJp8xC?=
 =?us-ascii?Q?ORSjDsswTv+rJvH5peeoO+jpYgEd7NahESHc9ISnDu1fqAhwDLfmqGahGbzR?=
 =?us-ascii?Q?SdKcfdNFtDio62clobhnsTa2H2fR9/29wLCanhn7WR1tWjtR+dKiUsn4aYxN?=
 =?us-ascii?Q?QNakJKWJ4OS3SKuRFarO6VMvZoDY6+ki+tu3/nnfI0tcWywbFGXoNQuffvEf?=
 =?us-ascii?Q?SlIbcr91IP7eHmWPCPZM0Hn3JusOYJmvPDG7rmoQTp4je8+tXwv+izg31jyv?=
 =?us-ascii?Q?Hp1No/okoYAy4jA9fCtRhg1/SzqBDwH4QusP8GJaxbWvb6KsOmNpYp7TwO7x?=
 =?us-ascii?Q?VZIajmaCfBqiUR+zscG1dx41Hfu7ShcTRFlaa0ff2G6heaSuqPW4w8VI+Fvx?=
 =?us-ascii?Q?u/eB+0ncXLoXmvVXDRshrT2/14bVSbThffyTB9lBCYiVPZYNkrnaWIVGNSDx?=
 =?us-ascii?Q?PXOWhWjGdzWunvjFHCX3C0u6oZlitd3tiOnX50etYaJ4N23BgDjgZKMstz09?=
 =?us-ascii?Q?HviQqnrc7gCvHBTZ9OB+P/Uo/0hw2fyiWAfC1KaDtWe2yb++LHgbtElK0zK0?=
 =?us-ascii?Q?QG7z9fVMUszVB6voVB16AsT5WNATWrLcOzUHTswQxALFVpZjHTwcx1tlsixx?=
 =?us-ascii?Q?LlkxEz8yuo8ZzUTS+4F4xVDlBjSymSVW3FBIMV6lG6/fxqVmSTAcaR1j4vGb?=
 =?us-ascii?Q?RHi+KTJADwlHyshFFNsXEcHMw1ElZHyUZ/JRuOaToOeQw2k5rzI0XRWAJhbV?=
 =?us-ascii?Q?eNy9qtd8fy69AXd2SS4JyRth5shyS1JUCrf0IsFH2bqHZlE+XDpW5HnFMVdP?=
 =?us-ascii?Q?L15pS9Ye8y8bfJn7qne2OP6rwkwiKH5CGZIMXdlr6NrlNxnAOynjKH6QOECf?=
 =?us-ascii?Q?L7JKkyUFImFTMrQZTEJbnJ1p2YhFBrfjcONxA2iAqGz0gttQlxJzzypjEzWF?=
 =?us-ascii?Q?f83hwq8Tbm4wxNdBFhXlzPnuheg7EBR3RKprUb+1t+RL1dQUnw1cYC86gxXq?=
 =?us-ascii?Q?IxEuv5bUS0m2fZg8ag5+y4+hPHpgptf3hQva0QUPycp8Dh6uluqF6eomOCVz?=
 =?us-ascii?Q?puL7R0FvHQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: c56Q77aji3xf3fCjnLzj+858TReir3yeqa8egacxPYSef4TyCXzJrGLIGJc89g+EXHMcCQHLINsd8oea5mSsFN4R5IfYNJIfpY2tmCvw6U6lTkCeikCGn+5IioWHUWPMStLpwCtyhxLxxKLmJNVEKhsJwx1jMol+Y+Th1mlmovK+NMOw5j55IuLEKmrmmtCuQUFkRs/h02YBc0oKlkoytqCIu5RHrxu+mIYSMehnTQtCcBCiCirmpSGixrFgegzuGwbGpeUBX0sFvlgkfMyY+3Ohv6xOPFxSjP0HtL8+xR6jrKnDW2wo9o18YzlytjZvXTLzUnarETcKi0iQak58Lw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8480d38-f95c-4e07-8137-08dee823a2b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 19:01:28.4553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U3SclyX13tq5UT5/4VR0fwtmGfAuaUW0q8IMwfCWOagYJEZPl7I+Yhzn0ZjCCD37hFjNcdgPeG5i2WPfZneGdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7008
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ma=
arten
> Lankhorst
> Sent: Wednesday, July 22, 2026 12:56 AM
> To: intel-xe@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org; Maarten Lankhorst <dev@lankhorst.se>
> Subject: [PATCH] drm/xe/migrate: Support copying between sysmem and stole=
n
>=20
> Stolen memory is used on integrated devices to hold the firmware framebuf=
fer. In
> the next commit we want to copy the framebuffer to normal system memory.
>=20
> This requires treating stolen memory mostly as VRAM, but without access t=
o the
> identity mapping.
>=20
> On discrete the identity mapping can be used, but we never need to copy t=
here, so
> just prohibit identity map on stolen.
>=20
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 4366c41bd3254..505d105472fca 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -574,6 +574,10 @@ static u64 xe_migrate_res_sizes(struct xe_migrate *m=
,
> struct xe_res_cursor *cur)
>=20

This  migrate_res_sizes still uses the old function instead of is_devmem.
Is it intentional ?

Else all looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

Good to be checked by someone from Core KMD side as well.

>  static bool xe_migrate_allow_identity(u64 size, const struct xe_res_curs=
or *cur)
> {
> +	/* Stolen only used by integrated, no VRAM or identity map there */
> +	if (cur->mem_type =3D=3D XE_PL_STOLEN)
> +		return false;
> +
>  	/* If the chunk is not fragmented, allow identity map. */
>  	return cur->size >=3D size;
>  }
> @@ -879,6 +883,14 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>  	return flush_flags;
>  }
>=20
> +static bool is_devmem(u32 mem_type)
> +{
> +	if (mem_type_is_vram(mem_type) || mem_type =3D=3D XE_PL_STOLEN)
> +		return true;
> +
> +	return false;
> +}
> +
>  static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>  					   struct xe_bo *src_bo,
>  					   struct xe_bo *dst_bo,
> @@ -899,8 +911,8 @@ static struct dma_fence *__xe_migrate_copy(struct
> xe_migrate *m,
>  	int err;
>  	bool src_is_pltt =3D src->mem_type =3D=3D XE_PL_TT;
>  	bool dst_is_pltt =3D dst->mem_type =3D=3D XE_PL_TT;
> -	bool src_is_vram =3D mem_type_is_vram(src->mem_type);
> -	bool dst_is_vram =3D mem_type_is_vram(dst->mem_type);
> +	bool src_is_vram =3D is_devmem(src->mem_type);
> +	bool dst_is_vram =3D is_devmem(dst->mem_type);
>  	bool type_device =3D src_bo->ttm.type =3D=3D ttm_bo_type_device;
>  	bool needs_ccs_emit =3D type_device && xe_migrate_needs_ccs_emit(xe);
>  	bool copy_ccs =3D xe_device_has_flat_ccs(xe) && @@ -1597,7 +1609,7
> @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  				   struct ttm_resource *dst,
>  				   u32 clear_flags)
>  {
> -	bool clear_vram =3D mem_type_is_vram(dst->mem_type);
> +	bool clear_vram =3D is_devmem(dst->mem_type);
>  	bool clear_bo_data =3D XE_MIGRATE_CLEAR_FLAG_BO_DATA &
> clear_flags;
>  	bool clear_ccs =3D XE_MIGRATE_CLEAR_FLAG_CCS_DATA & clear_flags;
>  	struct xe_gt *gt =3D m->tile->primary_gt;
> --
> 2.53.0

