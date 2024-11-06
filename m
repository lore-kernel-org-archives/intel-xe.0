Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15199D3E78D
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 06:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C7810E088;
	Wed,  6 Nov 2024 06:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ailDiQ25";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C164B10E088
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 06:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730873110; x=1762409110;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BgdV4aArmkc4kkfVQJPgjofe5Y4LIZzjsFxGUSoCc6I=;
 b=ailDiQ25oRf3AbSzbqxlV64Zgd0PgFp3zmUeSY+dO1q58Qkd3mIC+2Mh
 or6Nq7Tp6zQt3+MdrkybyBet+kqEh8P3UUEo4P4gpq3VGuR/aFBhTfwPs
 M0lqPhyHrE9eMH4HTvwzV0Bu8AfGGaYqlg45sCDUzf7difTut8SnnnbfO
 94VSuEvGceWjRXTBceVV+ze7QuBmRbb0k/XBrz6JhCGrTPA1ib9iiHN76
 xNF0X2ZxS98eFd/mS+v1kSoiXKfOke0fEZXtCSLre1J50b2k3FLsYfgqm
 K4ZCTPJ/4v8vei+cxmWPM/bgV4DWep0MQhOTCFyw3Rsh8epHZWE973nzr g==;
X-CSE-ConnectionGUID: OUMPBO+pQuCUaccxrNAoBQ==
X-CSE-MsgGUID: pT0SA9h2SlOppOYYRg0APg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30534065"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="30534065"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 22:05:09 -0800
X-CSE-ConnectionGUID: hJD9ZJ5XSkqdhLun9aAQAA==
X-CSE-MsgGUID: bfgBesuCSAu7Rn8sTLf4zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="89156841"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 22:05:09 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 22:05:08 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 22:05:08 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 22:05:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtSBnAj+hutlvkr1E6iynUe3GWlY4q75PZBzfI+hDjzr1otlPBznYCDh8Yj80vg7at/IrKsCOM4sFs/3QndejosHzqG1w4Av6TR0JyXtasoT/7fUCyy1Gh9Jo0VWEnbpRP8RuhN7z5mde/CJzMNndHD8ijSdlEIoptYugys6fBCCp5MuRSl4K9wocm1bBXUHpZiF3YTA9Y5ryE5/Vr4oR9Jr39cXc8H3y8D7mBUmCKDzSSOqKwkIvesiwOQZW/K4fRQdm7r38tI+LJ/WHo6U01W65xxd99Imlpyo0iikCD2Q9wYYCRYq9fZFY6aoZdij0LVTRTvfHcA/67mNznwmAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gnoul3kduUnvrbN8A3nlXG3ZNjQVTSba88Sot9IpdPc=;
 b=G/MkKCvi6xk17cNAs0/ZrrMrHdpdSGXzVJ74ssTvgOMMd10cVKxSbRzr8otXq+GRrIa/zmYpTKnVReRuTvZ0qSZdkIwGO/Or58pKHrRAQDBfUiZseeHPqNB3juB9r2F15REI3qCuYbpU8O6ErM1kXEwwShfvnovYMDzmi1Xmjv8l/HQdjExb7T0esMKJRwQdu/s6I/BW1IMGW3Cv/cmynHkJfme6xeJ8XVWf4v73IiN0oOHs5IPkymoM7aL9YyiYrokqYgC7dGtFZoA+R+2DS5xnNPV4v4ZBTAuiBRpAJzynattp8v9Bq2bf1WtxOF724JgwDGq502Mwn9HuRPyUxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA1PR11MB8396.namprd11.prod.outlook.com (2603:10b6:806:38d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 06:05:05 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 06:05:04 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Singh, Apoorva" <apoorva.singh@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Singh, Apoorva" <apoorva.singh@intel.com>
Subject: RE: [PATCH] drm/xe/xe3lpg: Add Wa_16024792527
Thread-Topic: [PATCH] drm/xe/xe3lpg: Add Wa_16024792527
Thread-Index: AQHbKg6YcX9zWfs0AkujMiKfGofUGbKpzmbA
Date: Wed, 6 Nov 2024 06:05:04 +0000
Message-ID: <SJ1PR11MB6204617BEECD58B19ECD8CE681532@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241029143740.1296020-1-apoorva.singh@intel.com>
In-Reply-To: <20241029143740.1296020-1-apoorva.singh@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA1PR11MB8396:EE_
x-ms-office365-filtering-correlation-id: 08d8d8ec-1f1d-4a04-955d-08dcfe28f553
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?D+TkH4WET9T3OVVjmh8QITn8a5GzASSs72WFDLkxEN/nKwcugJ+L7fGiV8/0?=
 =?us-ascii?Q?pxQLFGmqqAUjIjRGQlXPG0GYAVXM7jY/benXzWQcoVy6J3sqMkLWrFj3ljpB?=
 =?us-ascii?Q?JNhCbJmzH1oQ67+8EtSOtmdoClkUGzOI9wyrQ5nR9yOAkaA90z8XeQokKDCS?=
 =?us-ascii?Q?W8jQDbP/CTskAn4TG9AvCvSawqPK9uXAJdzIm7LiVEu6Yosl2E7vaPlxyxrG?=
 =?us-ascii?Q?idyJT8SnD0bnN8Ea9nxoLQ9816u9FGorFakNpqTLpxkBxh3Q2GlvuwyGoJun?=
 =?us-ascii?Q?aeEQb05fM1l6cDTb0vyl+FYkSh3XXt3ixFpwHj1DoJu7mNUIYlOT4RnZa/Ox?=
 =?us-ascii?Q?M1NJcfdV51IIP+tKWytlr1203r7sxBRc7O6qSPtlTOLLlnI38E9MFJz0QSJ4?=
 =?us-ascii?Q?/g47d1i5h4o3GoCreY/upYBN5uVPJtFLeLFvOunQgTrEgto9oynkJqmrZFgF?=
 =?us-ascii?Q?VYEtg815oMfiRP74iQGbziOGuyckjVEcp0CSKphzN3BOhQ5/aETA2QY0StPf?=
 =?us-ascii?Q?zEVRRpvJM8z2pDFx4YvmTZ0kWh6S70akDuIXvAT5rj8wbunMukO9M2HQurPS?=
 =?us-ascii?Q?77W9cBkL98TY2BQ8SOh+LyJ7qMg3ZWgNUhyU7+seSXC+TLdrCgqVHwlz//z+?=
 =?us-ascii?Q?GYw54T94eOFFszgEPKWnACVJIrYA/9d2Bv8TCOo6uETfDBoSsb0GbkCvSWoV?=
 =?us-ascii?Q?FMm7rLQ33az1jyDoOBxNETHpz880O2r5eB1Fhs4qxB1zYPUGJKiki04ay4sX?=
 =?us-ascii?Q?8PYzgX/k6WzUN88JTD2+xRVG/pPqEBlKXy5W9JfIFUs2+N1AkEUmZTDumB2r?=
 =?us-ascii?Q?NFCT26x3gOspAOoVaDmIKYG660gC/p/qg4qkbTlHGrI/G02ta83V8/oyT9NA?=
 =?us-ascii?Q?Tpa/MXKdZ7ldY3BbrUKAZO+zP9QjgAbU8KpkdywxUVMi6DgYJUF8J2PKm1KA?=
 =?us-ascii?Q?fObY+0GXuiGl0uLDD1WcF0+NKYMtr5naxwkAE7WSq3XBDvdPa0ktpE9JWpCT?=
 =?us-ascii?Q?yh0Sy3peOKnf8ezeoZirhNjNJhT9yr05DAT58P7Sptr/RZ50uEjpH9MQsq9z?=
 =?us-ascii?Q?plW9kJYWKMt2OGfcIF+vPlJOMYCprZczywb42cmgItS1hOvMsM+Sv4T4aOv2?=
 =?us-ascii?Q?Oq1lfrTR0bohQyXaeTYeG/O2ARt2JXNQYG6CZu0wX43/O4s5YuiFxHh8UpYI?=
 =?us-ascii?Q?CHZHu8bGWQ5QRkJmhef9TJn2DNdXKhXucJuLVKXDdKTKolHJH/eRNunMQq3w?=
 =?us-ascii?Q?CYmXEdb7QaV3qHrjeZPenv4GVFYgBN8HkaPIFTcuygT5aJIdmOAGjEnvVefb?=
 =?us-ascii?Q?1i3pWUsSp/98cw8sud5xJZ8Z9VRsolR2JViX00B7+QejUOYKWbOYKlMnVA/q?=
 =?us-ascii?Q?llV5dMs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SqH6bULtJqrLTAYqUcShHc6jCOnzoLSXWj6zXa38HHzkN4P5fWTe56zXENt8?=
 =?us-ascii?Q?9kovNxVplpvifoBnek0R+c5UYshFXZIjlMVv9nh4di8F1fOczHX/o5AMMxIz?=
 =?us-ascii?Q?3/g8XngHRLTnTJDK9z1s5r+FadIXy0mQz8tPd+UXevp6iOssEt/OLWEN9Vsj?=
 =?us-ascii?Q?6tublyEGyFh77EezMxQ+JkROvDicTazz2ePUoaAThBhGchXZA1R8xDVVOM+J?=
 =?us-ascii?Q?JEfNWPO+VMdXjlX7qni7OMPC/pRe52MedJv5JCZVF+cqUlmw+FdXf833w6vu?=
 =?us-ascii?Q?eI/X5YaWtacm3CzQXedJ5GMdoxQYgPe1PS+U0ZguxPEHwolDGh97Vc8wvLpl?=
 =?us-ascii?Q?SYXFdx5nP1mjl4hQ8t+TibSA7+QGFasoZGPCku2RroPTq0s+z1xBAD/zaq5p?=
 =?us-ascii?Q?o1UEcDB4TgvmH0HdUoEWpiIdNxd3gfkXTcSKjdDzN2VYiM6X6aKbB7mIMFy8?=
 =?us-ascii?Q?740Yxq6ORIHaJ3KuQQldXeSxXBa+zGyESDTUWcZVHcsl6mkaR0TNqSu6Xpql?=
 =?us-ascii?Q?SWLGub0PuVBTRSe3Jga/6cKlXENsG9gHsLcM8TSYTG11xnPwvuCxSovsgRxq?=
 =?us-ascii?Q?AF6d8e1BNkh+/VMtCz9iVQ/ZfPXAzdE3jQSHzMn8JnmsTEZyuTVdG4p4kkEJ?=
 =?us-ascii?Q?37KM1Z9xNE0JtJC0LSQS8xyhvIJzbhvACyFylC49kRQ13pDH+9I7HRYFdihG?=
 =?us-ascii?Q?nM5mtxAgjWeIluJIHBfvGk/igBc2B7DJXiAk5UGuFSv6e+NGCFUymkZtAMW1?=
 =?us-ascii?Q?KD4piOgxE2EJQ6HL+kwPUoPVyaB06iKMqvBynwiBztdbthNUkweAFA73PE8L?=
 =?us-ascii?Q?QgKODd9ju6MTd2dV7xwAxfeG7A4ztUPHbF50Et/3GC6kUgJyxI0k0G6sK4bo?=
 =?us-ascii?Q?6ut/+gUPHQdZRd4EzYyQc8ixc+UdiPIVMQe8GVLb9DIWZwxwSb4LzIITosor?=
 =?us-ascii?Q?tBQCxIETkczRzaRWDeMCJg7cXVmdit8qmWoLokTv99JQD9jfqykHyTr5xGpM?=
 =?us-ascii?Q?2eaAZMNugAeDBB9czC3rKjK2EHbanx51aEdxOCPp+te7e0H9w4kj7MvZGnL2?=
 =?us-ascii?Q?hkeozfpee0jxgw4XMs2aLjm6Ms85iChYzY0n3zhiEGB8Pj8grDx1nTRv45L2?=
 =?us-ascii?Q?sxIE7vbONfPJlypLiBuVR+MGv7vMw6IeBm2l0B3SjmecN4pVKsAuF9HxpRQ/?=
 =?us-ascii?Q?evrvnMYdIqi11YKL+6dzCZeYU19lZLJX17+AIK5cRPOpK3wX8BANCw3p1A+i?=
 =?us-ascii?Q?aXlnBhY6cJGWqJg280wPnBrGS+FmVKc9dOx/u+RHz3rmm1WBIbCKUtErBT1G?=
 =?us-ascii?Q?HVai5n4/uN1wgVCw+285FzbGEQ0KR2jqJhVj0GUSL9+1cMZdHetEl0U/XKm1?=
 =?us-ascii?Q?QZGbbPPzn0VW1gtfjXgRtjWF7Hvv+Q1IAahR3U5G1Xub0weHNfSU85gWdJJa?=
 =?us-ascii?Q?iV1mYp36XeqLcJw6pH3xJuhjrY+39/FNT0ldNnhhp0+gILATBOYwGhhAjp+d?=
 =?us-ascii?Q?fezEumdkQogWw7is4zgF596+TBq9z1SdRSikv8KwmcwsK83n9wTbUtWzAfzV?=
 =?us-ascii?Q?wjcQ0QdPD/nFhY2Qql5eXuVCTvMSEI2kevp10mAy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d8d8ec-1f1d-4a04-955d-08dcfe28f553
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 06:05:04.7735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AtoWNqnEY1Sx+g2akjofKKzA1nGDoEUGykaeXtNxWq7K430dFcanCZnT0yQE/Vy3WAioTgg7L387mf0iu8o7wtWKz09zgJLnHbKsQWwqskg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8396
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
> apoorva.singh@intel.com
> Sent: Tuesday, October 29, 2024 8:08 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Singh, Apoorva <apoorva.singh@intel.com>
> Subject: [PATCH] drm/xe/xe3lpg: Add Wa_16024792527
>=20
> From: Apoorva Singh <apoorva.singh@intel.com>
>=20
> Force Sampler Tile64 Overfetch via MMIO
>=20
> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
>  drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 42dc55cb23f4..7ed6addd795a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -445,6 +445,8 @@
>=20
>  #define SAMPLER_MODE				XE_REG_MCR(0xe18c,
> XE_REG_OPTION_MASKED)
>  #define   ENABLE_SMALLPL			REG_BIT(15)
> +#define   SMP_WAIT_FETCH_MERGING_COUNTER	REG_GENMASK(11,
> 10)
> +#define   SMP_FORCE_128B_OVERFETCH
> 	REG_FIELD_PREP(SMP_WAIT_FETCH_MERGING_COUNTER, 1)
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>  #define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
>  #define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c inde=
x
> 02cf647f86d8..18dc5cdf7c43 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -607,6 +607,11 @@ static const struct xe_rtp_entry_sr engine_was[] =3D=
 {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>  	},
> +	{ XE_RTP_NAME("16024792527"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(SAMPLER_MODE,
> SMP_FORCE_128B_OVERFETCH))
> +	},

Please check any of FIELD_SET example in xe_wa.c.

You need something like below,
XE_RTP_ACTIONS(FIELD_SET(SAMPLER_MODE, SMP_WAIT_FETCH_MERGING_COUNTER
                                   SMP_FORCE_128B_OVERFETCH))

Tejas
>=20
>  	{}
>  };
> --
> 2.34.1

