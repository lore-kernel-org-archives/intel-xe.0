Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FF9C3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 14:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4435F10E100;
	Mon, 12 Aug 2024 14:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XM0JX7wl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867DF10E100
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 14:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723472566; x=1755008566;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YiRddMMSyBVcUPYgK885CO0TpM1XU7SD8NVZKsgVrI8=;
 b=XM0JX7wl420RWrVCsz+u3QOmFU8fGdFm9hUBpOaN+Z4GULHp+3jnwg3y
 I3TkoCCVBMtYIe1HD+BUpUcmQPNMlzBlROa9TA56Z9Le0e3EPOSwrrCDl
 /no3J/4rK3SvV/w9AWNJsDOxes7OlAqr5ybh8qYrNrfjJiDNuSI72LlYZ
 72IE72ukpaykm1GfYevhRbN2m7JfaXCL2uEkAfKNfPP2Pd178jvLFstAs
 zCT4svuKdMC/2NLdUAwx12YIWWF+CnbN+FAF9m5acKD9tuiGeyJoV0Je0
 1xhTuVCxQSiImWFlUMMbb1JSFxL4V0C4GRu3T3nMRP/TpPfPdR3XS9CzN A==;
X-CSE-ConnectionGUID: eyDio9DrQAmiGYC+yFrOXA==
X-CSE-MsgGUID: Owlou1x/Smylx5FPlwX9og==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="39099759"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="39099759"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 07:22:45 -0700
X-CSE-ConnectionGUID: CMr+pZs4RPKCVOpIr6PA9w==
X-CSE-MsgGUID: E5q6QpyIRyqe/5Z/7MEQtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="57937924"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 07:22:45 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 07:22:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 07:22:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 07:22:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQ69kOItxsSghdh6dgi/ddsfe4R7xbem38dYYSs/3Fh2j4lGwkIRqh2ug6COiurJLg0UUGGb/DeDQTp4SI9CI10uFNAJQfktS90ghYwlxvOfxoRVyttot/Hc23EudE2LCmoZJDdswI3WkkkuVmMOvYVMzB286BxEjGaBD+W0jQa1elHwKYu9zSm/SA/nq5x4Qn2M45MThb1lZdIxro1iiDD28lyxRUShhgVkVJ5EOHkxndGMnR8XJpbJc6Nj7Brvg7AUT24EjrshVojMhEVHYF5qe0++iIwNI4FHZ2upIFQ17rZ2bTXp8NpCCZNJ9EA+/iInbvnaIfQnJ9l8VrbRlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXcHohzqpE6hEVqqLkK8UtvSd6Qi3i6wJdwJp0dKUKI=;
 b=E+Y0xuyO71SIhQK40LYT//Yr8boXF3D0eT3VKhFxesBkRguQkDoRWPU0fmqnRZYB287MfQF1bWVDObJ2HS/pCeCqR1oyy47rbHUYjOPvw65zddB7G3XQWyite4YxOXof7lTsf3r9X0v/cGcKprGLO8lXiJtw14Zqoi769eKeJhJ8+kLYjpGsBO3HiMflgRvs71u3+yQrp/sbXVrZFYLCAHkOPPqk7zHcXwBeqNJA/JW5bUJJdAQ/uO+b1TsiWafayUFmqYjqSERe0Tsf5b3ZwI6Uhcvy1nMuTNXl3MH/2xoQmyKiilIPqqvQ5Lq1SUaVg46M3k7gpZ6T6gGXVBEE6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB5918.namprd11.prod.outlook.com (2603:10b6:a03:42c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 12 Aug
 2024 14:22:41 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 14:22:41 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: fix engine_class bounds check again
Thread-Topic: [PATCH] drm/xe: fix engine_class bounds check again
Thread-Index: AQHa7MIBxAS+YIgW2UqUzXXhQwytsrIjrFwA
Date: Mon, 12 Aug 2024 14:22:41 +0000
Message-ID: <CH0PR11MB54444E46880D90814FE71289E5852@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240812141331.729843-2-matthew.auld@intel.com>
In-Reply-To: <20240812141331.729843-2-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB5918:EE_
x-ms-office365-filtering-correlation-id: d4a0bafd-eb43-4c94-7403-08dcbada39b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?u0Hoyp3T4Ty+evbP2CbJ4h0Gq07ZAhjNEdUAEViEPD0dKk3phago/HGzPUsp?=
 =?us-ascii?Q?KL738BQaXImxK+0nTCOPmJmhuZ4JT7HJZ7WhFRUUPbFj3KbrBDiGJZcAkLJh?=
 =?us-ascii?Q?nOL85ebgT4nfr1T94lkR71PC0FGCHv0lX3ctchogDBQQBSHgXjZ4VKYyKNJm?=
 =?us-ascii?Q?ioLP+H6egXVSzvMFGSYYHgHOWRIjvS1DSGpcAYc6yIW8hU2kmG268eGxG8az?=
 =?us-ascii?Q?N6fX15MHoQi74ayIdTwd3Y9YtQVWmlNhnBqTWklLph7XTKCtpNlutqW5V5MJ?=
 =?us-ascii?Q?3Sql27gaLE3Z4OUKIgtj2n7VxSoW2TwTE/Md4Y+cgTZ1ik8FbK0TOkO2B8HR?=
 =?us-ascii?Q?YR0K1bVVCL8YHCPoKQ4/OAZq87pPhsxmQwqi83R90rzXcFvDE6y8wlYcy22+?=
 =?us-ascii?Q?Xup5quJ86nOICFOsJeYHWSokGnAOIUmYbohSPH4GNruuRwqQHbrtEkSpiq1a?=
 =?us-ascii?Q?zQML9FuCBzsxeb2aiEGz/3o8AEWocDjP8aSKU5S8rJeQqWxc8ksp0T0OPCLM?=
 =?us-ascii?Q?lyUAGUQrNTT4NvulGZywZ19pEw+QZU32/7J0DDvunguLrA7mlvy0YvUHA4KW?=
 =?us-ascii?Q?R0fdEgXY4lGhg5h/gWgUTjZE5szIoTpviXevu3qftJZ2BXW/lZXot6Z2fxfL?=
 =?us-ascii?Q?oOz1EM/glk3TG/kS5blclRATSI3cVAER/OAy0cRUufu9tsTIRHBjwsrsu3vG?=
 =?us-ascii?Q?tINWJ2P63GGCwMT9KXCedTf8qSY0JUsiHuV++59sT394R5lhO2k/3wzuUFJ0?=
 =?us-ascii?Q?nB+1TsKvjJXYG4Bg3D4BX4LZYcMh6ZS3M7fwZuSfImYCkgGZ2BjZ7RnqUsWD?=
 =?us-ascii?Q?nqSPWIfwapguHkvtWSsiGllV8oBu3bgoSBokigDZrBm1HsI2rTfzqIG2voOd?=
 =?us-ascii?Q?3Ll7aX9z7WTA1z8kxDmCGT+PFn9t/bsYO/bBgOGodVitGw1o9i3+j4hugy9r?=
 =?us-ascii?Q?YkdKHL4FwQFR94PcpmMfvT8lhDycKUSNjzC0Tlnz2SAtq+j4xLcNL3QYlO4n?=
 =?us-ascii?Q?anioNudCiBsbwrDtHM9moKRHOIv9R+fdv4HzwkMe0z+81PeNifw1dlD33DKA?=
 =?us-ascii?Q?LW6Jgos8BvBIhx+Tu5JD8bzvvKwQiLhC5CEQO5Bg8hKWReCJKTB3e64URlWi?=
 =?us-ascii?Q?rXKMnmvKQVUvyTtHW/VSySSQyqxEXZZv5SeSfqfXTLVU+q0wgQvemULyIO/x?=
 =?us-ascii?Q?Y5eTwPYJFnbAw0kJQGDiObHHvaPkNC5HHLV9Sll8tUgpWqsnT1Q8a1EmU1hE?=
 =?us-ascii?Q?QNN84A9qlf7WFqkWYE0YPUZwc+xxBBbuN9RkuiEQonOzGtakjSzqqG8bDSXa?=
 =?us-ascii?Q?hzMag6uJvfhp02Pp1vxKaPwuFe1doqygm1xynjUv1UkrGb7C/awkO0YAmesU?=
 =?us-ascii?Q?5Lw1Nslt+Cr0yZoNhkNvUx37orQxlruyGNvA8LwLHmXfneOcSA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3+XNIC16kWzA/XsHOGv/Lc8vmqLjfO0TdCyHLsuVISp604KOoQ0yCHyFPrC5?=
 =?us-ascii?Q?B+xU3m5qyVgbEn7l/npoXyN2NjV6N5dGc9Q+0hVbnkiNmp5GH0i7bS6Q3fOS?=
 =?us-ascii?Q?ulR4m4Id3TIJ+OZoZc/kZdKZe4/QTdKeKBCP++qSxXk2phjpeLskJufyqwKx?=
 =?us-ascii?Q?UBuTKoeoT4FYFj59CqalEthSBFACd4g8rXfK47xN0Sw+L53Ma+NiabUti7z6?=
 =?us-ascii?Q?QMtGgcqHfqFLoFkpESR/6lxvA/uTnsdDRXNaBn7cfKhMZfGIKwI+ThTGNdV7?=
 =?us-ascii?Q?UFBGd6Xw3csdG78826eC9qybi21+5DEY31EXYsSCoSd8nfzgJDAGebFqitef?=
 =?us-ascii?Q?9eSAtAp5WI2suq2BjI0f5DV2iNhDSMcJtFWTtFwRBgpp2kPcQFx3Qqsj3OBq?=
 =?us-ascii?Q?mQJ6+94/QLKHg4fKK10Rk6Zmys1u1+eyLz+Pg49ziMs+s7+QYUu7r1LxsqEd?=
 =?us-ascii?Q?R6BqVrMhdVkuAz4YE+OPgPzqT6wozc1lvmwsQciPti+Tqe5KSvkP1cooNqks?=
 =?us-ascii?Q?ZLgB1DRRms+NQVidhsHfF0ivaifdKpxHP7RtrEV9ITQg5VTbtpyzRhcGCoYq?=
 =?us-ascii?Q?z4JR35Zvk4sJ/UZs+Acq6c0fi+jw+FmWWrJ3IJ2xrVifClJ1EFSuciGKRuMU?=
 =?us-ascii?Q?LzcLJucrUydpwl+DvWaAibRnxQI3WNy7KDs7dSO26sVS/wKxvRyAvfA1+v+/?=
 =?us-ascii?Q?IzYnSQT/3t9ZBTXM4BBlFpncurlEFTOBdS9UteVZzxUvjl04CRq1asg3jV0s?=
 =?us-ascii?Q?0wDWuxcPBCifAVwT7FsizoJA8oP63Cozt7Kx47Vstsp5y5cVoHd9Wv92W5FR?=
 =?us-ascii?Q?/3BzNgs/4up/V5yn1/t0gDfew+P/jDthCXLrPOGc5/p4T95V00Wa+AdbHO8c?=
 =?us-ascii?Q?AJnmzJu7ArOzHu8xFYmicTydcTxt6GPLd8mgUrcwa3nnJvJ/ovfhlc6CpusZ?=
 =?us-ascii?Q?aQKNK5EW815y+7jZH3+qNcT4SfueZSWvD6VzrvwN4SM4XehjHBcftdwwPzLJ?=
 =?us-ascii?Q?xx/loxdCouoMaBoSO2BVb8mQTyZocePlC3BF7iYLEe8oyMKLpPnhz+4UheiI?=
 =?us-ascii?Q?wUiZmzrusgkwOoo2lX9oXtas4KZUU16i3mu24zxn+12A1IZVlgi4ZtovMlnm?=
 =?us-ascii?Q?qCCLGb3mwvpszS6QywjOTmPfyNarqYEF6kRFQV8yBqAH14VKuBdTAADMiIpm?=
 =?us-ascii?Q?+tOfEWDe4TnV7EpOFafDNyxYZI54hYvCWwtjBYyHmgV36UqaCqMzmo3agRIy?=
 =?us-ascii?Q?tgYjCoVsDSqAUn1R0I9cfWIi6npVg5gflqQ+RnAl0Z+on/aqhWz7fvGw8SqC?=
 =?us-ascii?Q?w9yKlIleZGtkxURcBb2wmuT56/jXRjOROXAMmmu2jUJGFcu6CX5kHlZC9rq7?=
 =?us-ascii?Q?BKyu1TfjkSw2I0e3wehO7IR/Cdv04/e4HdjZZxsu8f2xHtBcO55XeSCFaheb?=
 =?us-ascii?Q?fMwxwSuyO2m1bxoA5sPuoN2rCnxWrjgtZUTq1xuDi7wRSJXhqhfVRllFssOm?=
 =?us-ascii?Q?U6CKPccw5kjhdECeLSPD5jh6jXsPRNQ6pFWy6HkzLA57WsZCX5rejrkJGYnk?=
 =?us-ascii?Q?HgA6ra0KDCMkO4x9D7yBwoSzyifSUOdjX2PP7D4E?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a0bafd-eb43-4c94-7403-08dcbada39b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 14:22:41.3253 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qm/Tw/5ZafG6s3tfnS5ukvQaO5hGzrGaGZ+6TpcYCS9RWYpwtdH/AiEyiQSIiQMkD9SymavrMTYvixDm+n1wdSP77ESD9lLoSYqUn/K6huY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5918
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Auld
Sent: Monday, August 12, 2024 7:14 AM
To: intel-xe@lists.freedesktop.org
Cc: Grzegorzek, Dominik <dominik.grzegorzek@intel.com>; Mika Kuoppala <mika=
.kuoppala@linux.intel.com>; Brost, Matthew <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: fix engine_class bounds check again
>=20
> This was fixed in commit b7dce525c4fc ("drm/xe/queue: fix engine_class
> bounds check"), but then re-introduced in commit 6f20fc09936e ("drm/xe:
> Move and export xe_hw_engine lookup.") which should only be simple code
> movement of the existing function.
>=20
> Fixes: 6f20fc09936e ("drm/xe: Move and export xe_hw_engine lookup.")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Verified.  LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index 402dfa748e16..e195022ca836 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1189,7 +1189,7 @@ xe_hw_engine_lookup(struct xe_device *xe,
>  {
>  	unsigned int idx;
> =20
> -	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
> +	if (eci.engine_class >=3D ARRAY_SIZE(user_to_xe_engine_class))
>  		return NULL;
> =20
>  	if (eci.gt_id >=3D xe->info.gt_count)
> --=20
> 2.46.0
>=20
>=20
