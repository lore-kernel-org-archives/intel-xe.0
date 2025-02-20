Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA84C021B2
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 14:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E3810E97E;
	Thu, 20 Feb 2025 14:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OM7bm0zR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD7B10E97E
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 14:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740061795; x=1771597795;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9U4m2mjMwhTp/Hb8rN8R9VNe9ssdZ/74ERfxNsLGAIM=;
 b=OM7bm0zRz5hGk7BoGgm+Bn1O7/dqRWocCUrNJ94ONxyi6N9uoMZN060C
 CCw3RLGw07kJuK6uu8MtNAQlOMU3THcN4VV+hwiMrBsRi2lB2s+E2QQRn
 HqirqH0omVpSIZcBtjzjo05WetjBixrstF6We+bMTnUKC4azgJAanZH29
 6mb0TUp0HgHMPey0TfLYrKcshW5+C2fcE7eg28Yh3Bld3fY6an66DUOOM
 6Dc1chvu5k03BSXdvWlnjAVcQlw+ijx0dyZF+MYfwl8BJZ8k9qCrVrf3Y
 S55D+G8kzVc+jT1y76KNP4hLVyVGLhcFVCeqV+jiJKwrIcXYCR88+tTjg A==;
X-CSE-ConnectionGUID: oZqWfZgBRRardTeD3OyIzg==
X-CSE-MsgGUID: XqwqfYfXQJaLpg4xU8O6Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40710226"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40710226"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 06:29:54 -0800
X-CSE-ConnectionGUID: khlUnpSOQe6A196iTqRRRA==
X-CSE-MsgGUID: uNp6O6SySD6UuDIi27uIww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120279448"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 06:29:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 06:29:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 20 Feb 2025 06:29:53 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 06:29:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QG6dV6fBJmDF0ZRP4ZT5XRshhAUa9jUTXpkPsmHyEnVT4NByRPpjwDNSlqA7tZAiWInf6sLIlPIOvXd8l0cXgLwBQsXxlMy7EmFjBUzkbkIKgqwjX0EKghTqEi6gByzcLoXHRojtaqCgfvPkeHedcSY9Cvayy7ijN9PPCrLoWVuY4if0/phlf1CPOwxd7gg8YeQ8mL5jomNGZaK3FX1vnF0JkgPrAWeToUMUysGmNMm9KD3hXPvIFJfhBuJVfOsQBTKUCtNCs3W/CozsMZHxZpqYrf+FkHCjOlCSXQ6NAxo/AZhLaIc7Pp0zE182rR35JntHi6cD9ZWXue4KeqnP/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uwROVdWR/KhkkGky+UJySq7YrdFg67lTXdFaWYApXY=;
 b=nHFQ6yBLUapaNUKoS+dY+EvB4nAXI/3Oxu+AuEvjwM8A8RA8Po97M5LZFdbGudR4ksaOaQG6A+qMEJbR+8COtY0qgmr5wl830eLz6qGeIQ/6LE5T5S0lz3U25B8zidX82QLoQKppsFSSobj08ONsam960MOCRtm6U9l+huJ6W6cu3ms8PHx9WDm1nWu6xJGJVH6uvt2Vgb1ngqGTjD8mGk91kBsEMh1gfY5JJmJaDInjE3hzFoRovmM10Vw8c5twSgaD4ll35rVrtl1FyKoANRyb0HM9wActHScoIdRRzhU14D4jUm9Bnk+jMMtACfha97RFHggKD0qMhtcuONLdnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB8861.namprd11.prod.outlook.com (2603:10b6:208:59a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 14:29:46 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 14:29:46 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH v3 1/2] drm/xe/devcoredump: Fix print typo of offset
Thread-Topic: [PATCH v3 1/2] drm/xe/devcoredump: Fix print typo of offset
Thread-Index: AQHbgy1f5uf+Kv0dN0GieYtEqv63YbNQQS5A
Date: Thu, 20 Feb 2025 14:29:46 +0000
Message-ID: <SJ1PR11MB6204D0909485F02EC8B3EA9981C42@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250219212631.1788586-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-2-shuicheng.lin@intel.com>
In-Reply-To: <20250220001710.1803749-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB8861:EE_
x-ms-office365-filtering-correlation-id: 50db053b-0372-4130-e332-08dd51bb0680
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gcPFSe2vXVXI7gu3YCJTqbTjZJ0oB99666c/LnrYlQ2TSztHhb2rk4m0M277?=
 =?us-ascii?Q?nh2bXdEP4QGAB8IhNZEvDddn2gQ8pmzfDExl8ZA7ycYlP6nii8wXOGyIVXsB?=
 =?us-ascii?Q?TSLy7WbuedM2KvDqn0COeo6qRsjVAoAGtSg/DkbubWlUfkZBsdyK9n+Exyc2?=
 =?us-ascii?Q?7oDt6qqQE76w7kCoMpOP3QwWvN5XTiqUevn4gg0Paes7wVC+YjLozfVAk6k3?=
 =?us-ascii?Q?zQI8nncQc2SDNZkbIVqyTvWujm9nButBjrobtQMwq4Cr04Om/E3IDmlofy6f?=
 =?us-ascii?Q?/FpXWCjvURNNVhjaZ99li48/KGnhvOc6A9youOpUwv66ApFzz0sSYP8n+SSX?=
 =?us-ascii?Q?ZtirzlRF0TxktI9Ve3yr+XOCfpG+H3/vvyC5DhwhM4l9sQn+/sBqlxwa6VzS?=
 =?us-ascii?Q?eY7Re9eDM3QyLxzkHNEn5++FHOgEJ+vWeo8CR2cJNVirbmXTIJwSWXxs+A7r?=
 =?us-ascii?Q?LTdCn2ymdkE/LKyHo5qwwKWOX1pBqPwRQZ/ZbXbBOU1e3/eUq+hCDsu/K3zA?=
 =?us-ascii?Q?+t9GI4i8kZ7HmcPk7I/sPTzU38AzHS6W2oemSZabHXPH9q3RFaRC/GhgWsmq?=
 =?us-ascii?Q?BqUorEAaGjCMQrrqlQFL+vfeEWzJaUsOLa72AXlO2Dmy7wDnfYUFZx1KTkUr?=
 =?us-ascii?Q?mteiOuw3n2SE5jg260cYlNF8naJhL6SVJ95u8Jl7igBRMBbDw67UKzwCFTzz?=
 =?us-ascii?Q?rcnp31qOPZfpPKlW78161AWEfutVWwxBb2yTs4woZkDmmNqEpJyT2lYlxLyq?=
 =?us-ascii?Q?LEihBa9/W70bL2wIq/bEb1VMELoyyketIHpWJdY2yRj+NS1PGOZJG1OFUsD5?=
 =?us-ascii?Q?hFO6EdBTiBPDVeRXWBs+lO5xBadvFvwAOrQB6mlfMuNgsRBWhE4NBT9L1e+a?=
 =?us-ascii?Q?cAaZiycb0AgjlgjzvPJdFnuA5pf1gchCzsrGtUomtIgKEKJ/mU4Vx0xWh9MG?=
 =?us-ascii?Q?vLQx7lkFxyoE26xu6WQ8+WOwuxRFfY2I0A4e6xf6xOHrTHFOjbBiN8I6yIoG?=
 =?us-ascii?Q?AADuDxEH+gFLEy31tPJ6p/K3c3mbcY4+r/mAIM4FRGlRhA/iVuoEO4DGldnN?=
 =?us-ascii?Q?TzilstR6zezrghJ0cut8zS2RzYusoYgMqExW9fgSU+DoLbxdZ+piZPKVlTdo?=
 =?us-ascii?Q?aKFfrcuTR961Uo9LYo3uBpznEoZ/3bmGxiig026svC51F9u+RL1DmafNkPId?=
 =?us-ascii?Q?iQZ/DC6XoewGalrOkC6fmS7Wrg2bFe+aF9sSZUHLKrJ78cmdXo1jKE0V57OR?=
 =?us-ascii?Q?1YuxdQDlu2EqliuRG3vvPvNZJ+TrYN6D1R/HF7FlRHM2FJo05CBpIVtlwJBN?=
 =?us-ascii?Q?1NnTDRG0ZR1G2wCNoS2aE3dF4Rd3uNCePVtwqu9KQBXRR6PWtdGZ0r3ySl6h?=
 =?us-ascii?Q?l9AdjuURSaP9OWeE0khDFloi/eWJS1/flASWxeFahn07ZEQ7b2rKHGTzLlF5?=
 =?us-ascii?Q?2dAOnjIfM5oiYwdWA8bPmE2PIAEzJw1O?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YTrgPa4q/PstzCFAWAwi1b40SpoIKGXeAC1WPW044JYbWvWilcyoq9rMQBv/?=
 =?us-ascii?Q?b9XqZ70c4rsUdDT0SlzwxlKcQ58iVWN3jJIWdEVmkIUyHwzCPO/PJJeZH8Eb?=
 =?us-ascii?Q?p7iGou8fGBujido/Nzd0O1QaWN+91acHyUeVheUwIxcvBQ3EX4sVRZaXfS6R?=
 =?us-ascii?Q?CSceXyi5IcTJM7DxGxDE7lJX6Pj/ozk+/pPzU5vxwC/UL0gLne+i9PgCulD7?=
 =?us-ascii?Q?lToVpkNoOZuZRR2Qyg9Y0quawshty6f+zxrMfaBFtU5qVOkSQ6g0EPZYdru5?=
 =?us-ascii?Q?uLwDBCHeCfKWpMxqTaNzv2EsgzEBFxtF+qs3HTX/C/9UP34CF8dY23JV1bMf?=
 =?us-ascii?Q?AjJndsc67H6SOkvIoxmre96c79jRd0IHlq8HBDDAJkqKEgH8NJPaM4cxp1nY?=
 =?us-ascii?Q?qXBb4gIuR1XyQerLk4lVE9S243MYRX0Q852i/ThAfyMulF1pRh5nuL7P1F1n?=
 =?us-ascii?Q?yYVJ+KrHYAYk9UcASsStgMIxWng8jj4j0gnWFiynFOrCfJ6No16MgKWUfWb4?=
 =?us-ascii?Q?VNHf7++1eNp4lyfjLLgdBxX7JQmyDIcpcPMaVNRZLZGQPWUYtB7bMBbR4g9G?=
 =?us-ascii?Q?Xt5TA+iPbBITft/qDQb2RMVWs5oSrWKhC3OvgAR78w+JSHR47Xiq9BnaHPes?=
 =?us-ascii?Q?FGPpmHZFKEu7P5obLlb5BOcHL4uaromGH20KG5PlSnoIKh4FXWbgITBQsIqa?=
 =?us-ascii?Q?OX3yKW8zXeSvdZiGcrlefUw7vSWSCMs5NPsEG2jSHMTMvRFWZEY/8WS5WPQJ?=
 =?us-ascii?Q?Kw38BcXHNyqd1w9kmvZkEnvM+Fi0XLg+TfoqQqlTbpgZVQcNzPKKxkYoBube?=
 =?us-ascii?Q?kBV6fgebNZoeyTq9jAkYT7b2iSYseE+9JmeTU16lwE4tdkuvn+oUQUIaUFIy?=
 =?us-ascii?Q?hLGAVg6fR2Xyg2Cs8EI1l1uf4c+/JXwmityRp9Rys/aBb9wO68H1HxRzT5LV?=
 =?us-ascii?Q?7qLkNpO8C0l565UO6wWpJOL7PLqVHcBAMvtv12/8bOTUZmugMpOnkhvm8Prr?=
 =?us-ascii?Q?JzAWVsFsZEeOjuIGW71gPpHJQsbfd/QVXXxldT0yUjP2grGCkyP8G33J4I17?=
 =?us-ascii?Q?dfUG2rWXIRZs85tFaVU1Xi6gMBaSwkBxkjwSV2hVqTa95Rg2MxItgvBheuan?=
 =?us-ascii?Q?5xdL8dja0ihnbF/lcvCe4odz97eBtKfIZ/a8jx4NE/yGHDcIUHjx7v674zKI?=
 =?us-ascii?Q?7BV5Fwx5GXzQdsL5KOpbuVqA2VE1opy35BF6g8mVpAjfD1NjUXzSqldtDG34?=
 =?us-ascii?Q?NkgyYrW7q1CHVerS78Dmq7W6deRwRKNiMy/1pJDEGMlq/dr3M3tyB2scm/B5?=
 =?us-ascii?Q?Qn2sB1A5HBfQOGctNEDywvJiqGsGcPy3RSHibNzmuHv15qGv0bxXh8gcJX/W?=
 =?us-ascii?Q?yuCKNtfGb+t5gSESgY9Z0bf/HnuLzU1jS7IanORJOrAq32R35LqDWvieoGpr?=
 =?us-ascii?Q?crQyNZlkzRwx2I60grDmKkIaAtnue0fqoMAmyAArbetEuq38PRNzeXJulBpY?=
 =?us-ascii?Q?N1X3WNNPvAueT8ZckKTLsFFLS7tK94O2UgbGqPDEhs5DzWVbjEzFGS2UozqN?=
 =?us-ascii?Q?qF5gGpFJ6SVfhb+x5DCuy6noWZJviO43iWoTHtYX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50db053b-0372-4130-e332-08dd51bb0680
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 14:29:46.6113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fil0KUbOhn8O7F5GgyUvhEOuwfDJGaKAwthr+K2KypoWsShM+HOjCVMuGE/5RlyYKJLhmcN+PZ5CXGxHNkztznq19BA3eXdEA76SslH/7Sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8861
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Shuicheng Lin
> Sent: Thursday, February 20, 2025 5:47 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Harrison, John C
> <john.c.harrison@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: [PATCH v3 1/2] drm/xe/devcoredump: Fix print typo of offset
>=20
> The log should print with "offset" instead of "size".
> Correct the typo in the comment.
>=20
> v2: split kzalloc change and add typo fix in commit message (Lucas)
>=20
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 39fe485d2085..60d15e455017 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -237,7 +237,7 @@ static void
> xe_devcoredump_deferred_snap_work(struct work_struct *work)
>=20
>  	/*
>  	 * NB: Despite passing a GFP_ flags parameter here, more allocations
> are done
> -	 * internally using GFP_KERNEL expliictly. Hence this call must be in t=
he
> worker
> +	 * internally using GFP_KERNEL explicitly. Hence this call must be in
> +the worker

This change looks unintentional?

>  	 * thread and not in the initial capture call.
>  	 */
>  	dev_coredumpm_timeout(gt_to_xe(ss->gt)->drm.dev,
> THIS_MODULE, coredump, 0, GFP_KERNEL, @@ -423,7 +423,7 @@ void
> xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suf=
fi
>  	if (size & 3)
>  		drm_printf(p, "Size not word aligned: %zu", size);
>  	if (offset & 3)
> -		drm_printf(p, "Offset not word aligned: %zu", size);
> +		drm_printf(p, "Offset not word aligned: %zu", offset);

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>=20
>  	line_buff =3D kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>  	if (IS_ERR_OR_NULL(line_buff)) {
> --
> 2.25.1

