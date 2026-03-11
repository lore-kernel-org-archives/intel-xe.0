Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD1EFD0644
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 07:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E6710E25D;
	Wed, 11 Mar 2026 07:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QE2HSuv/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0832210E25D
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 07:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773213657; x=1804749657;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qny34TwbT2ToYEQVbRLeSWIelJXp+eYKB0teReHIGH4=;
 b=QE2HSuv/KGHjHCqEZBBcfsRvfWZkPm1wU8eVZoCRIMXlQLwT9PvJQczj
 W/uFKxIjYKmp/e8fa+Mz0qpQOa6bNdKSr/LBixDtI7Z2i18zvsQ+RzRBQ
 nNJM5WmZ33ZE791WSQI2N995jCx/8jq6OwhAHd5kH0MmYaWQdi3GQGfrQ
 Rx5xa4uFtSpe2MGT4E3NCVPuBeJ4L9pScQX/EyOTmiqVYFmm26JL8C017
 r6KKWlvehj4LuCY0C7VjAZRPLexfQDF7mhK32APoGJ8qq7/rzpbPpxlo2
 BX84Q+n/jSo3lkaS+LDeaZ3sONWRJIDW3aPwZkAP/RT1hCBu3/WogFaS2 g==;
X-CSE-ConnectionGUID: C23nNxp6S1W8GK4jDsJCuw==
X-CSE-MsgGUID: NdQJQp8pSW+fOVSVb6t2SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84905582"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="84905582"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 00:20:55 -0700
X-CSE-ConnectionGUID: 8A2eS7IMSyaZRvpaVvTDcQ==
X-CSE-MsgGUID: 0tPj6JJXQE6pDWBcGVRGkQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 00:20:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 00:20:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 00:20:54 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 00:20:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=veJh/yjVWdEswYPEvcR/nfTf0MEM6WY5HtCeJEKnwf6adQ5gv1+CSy40JqdKhB/2S7rxP3O6SAiplrUKCIpob0IQrBfaj/85SzsxiPa6bQsL/nSwPTKpdJ1ld9/ZktqaLyb5L4qchcme5WHTcvwlDHPipZtVGO5w7i9KJm4/9pSpUty4jgI4G//GA55zwbFOPoPIc/xTWgbYoDZHcsmxKAzRZUxbeVvuQUwBaMHjVEHgN/WfE2SK2686LSiO7AALSbvw218xa6ardY9mBENIOK+YoAdQq7BllXn+1lZWn8yi2oGhzC//8sS5KN5gxLwugKf8gbm3H3F9kTcLfnx7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGVnSQJZLRN5WX3hHuVbkDloU4Kudzwp/B7Xqx2YROQ=;
 b=lEzN0EMXz1ewytuQ6u/qvf81W9AzvIQpDnHcAri8Ktr4at0ek7mAyEvIPitCfLQ3Op7mQdVI6BDuoqprgUhBcErRq5JnOEpbeJRaRzLgaTdOVbjxvx0xKPFugHstGqDfb1I8s9D3oYSPe0wsfZ6ausHkR05rbyQ5FMsVOpFDGuZX8xui7hyi4WzAlPiIECKZHgh3mYwutMoOwdDCdZcBDI9nt/LIEG+s723ECSGO0UINUzmUCj6EEhEUpzB9XwD6HhQ1ajonDtI4TXCZfKP3ycgLAeudhDKIBkmEFMyw2BrXuzuocP/Qoo5UFc9kf7w5GoP3DhWOlRi7ggKR42IJ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 by MW4PR11MB7005.namprd11.prod.outlook.com (2603:10b6:303:22e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 07:20:50 +0000
Received: from BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5]) by BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 07:20:50 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Tauro,
 Riana" <riana.tauro@intel.com>
Subject: RE: [PATCH] drm/xe/hwmon: Enable energy attributes for CRI
Thread-Topic: [PATCH] drm/xe/hwmon: Enable energy attributes for CRI
Thread-Index: AQHcsIdwhvWQ7SLe+Uax9Owwsao2SbWo7YoQ
Date: Wed, 11 Mar 2026 07:20:50 +0000
Message-ID: <BN9PR11MB5242C3FBF0DE7AF260CA748D9547A@BN9PR11MB5242.namprd11.prod.outlook.com>
References: <20260310122018.2734260-1-karthik.poosa@intel.com>
In-Reply-To: <20260310122018.2734260-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5242:EE_|MW4PR11MB7005:EE_
x-ms-office365-filtering-correlation-id: bcf209a8-ed6b-4f17-13d2-08de7f3eb916
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: OFzFkr6c6I6DlSAxphiirkOdisNn4QAsUfWAcph1PwM+P+wdVc/8tDGrmTVMZ58QG8x4K3We8ulMaDD7iUKw0/ZwvP1CnvxjXwANh6+pMDAtiOJsza2QMv/UkVR79FTZster1VLoTnEN91d/l61OtdJ3Io1Raw0dSHyYev7qxRWSPsiXcRhqESJPEJC5ZilKtpKPsQX1JDDzH9xPKsIjqvXrrRaHEbp+JLQxJxHyikfBPwFWj/YdFvnsfrqckd6a0Z46r04xTayObP9GS85DSuicb06DiLJhi1BComFMjmylwX9h+ofn663NEDtbImD8oYTssHvgdni7NtY+WYTOMYdIZEWLpvbAOOJkhpCPq0cRNVIQhqu/VQ44+IU4SH7SrU4nYJmGDfTWspIDeIYNBrSdBrIi84TklduCFqVp8lG1wOTmUpX0HVnPCQ8N4e9KlueTsymcB1CoGVcxlp3hnh6jFNS8E9tIK8arkGVuf97pcKxlwi9rhhAawWrCNmPSPwVYVKhY2UM2Vu3Los8SVoLSnRHQ8Kwo7ttNRnIIkFmKDIfqnYdP03VFprGVjvE5bZnZIos7iUrVlJV8Gza9o/u2aTUGdLj8SjPVYiS2o0XdAUHr467KhNRWVFLgIPqHvoT1l52bk9oa/UG4C6kTWymfogchxv0VQOQSuA+66l66EgzGS5XavX1bzCtQyuxkO6ikmKtXNhRg+GcflqMnxVY1ubCdnz5h1SrqAUvsFWhEkPfIn9l+uwz8Ws2COOQfHq4BAkTP3Iy6XFrgf/BM0tIAKYUUGo4n7yJTqCXF1es=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5242.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+6R9h0KBEYXrH82RvjxybLvthXJhxr3cTnZiL4aL0PMNNArFeTiyHIumlASM?=
 =?us-ascii?Q?t3LvdoseFS9kNxptxIDLYpcFS5qHPEyt02XIa5b/Rv3Q6YBi9us+5vGurwtH?=
 =?us-ascii?Q?ZJr3bJkP641zh5BKyADUbzpqsarUKQTePs/41vw9ctjDjSAYVKxkJF8VfHnF?=
 =?us-ascii?Q?4QrS/vf63g5b0HhS5dra/jJnp2GUMhAoTvKWTOxdtgtb7r7QUu62s1phfMK7?=
 =?us-ascii?Q?cLtZih3pjcMlkFj+81hNB37EQmaXedWy7KyN5cO1XtlhF0AInLYpxOA3SI/u?=
 =?us-ascii?Q?FY/y7EHq0a0Bn/C3E4IjEgO4KfA4UOkaBlEIBRiGMTGNKMbF6huGYcr1n+X0?=
 =?us-ascii?Q?iJP9AQGjdnKYrHhLIEhT24qjoQ8cTaItbdZcuGwqnmxSyy/BMrriPgCUVpGH?=
 =?us-ascii?Q?mZ1p5drRp25rb8bWsVdEXsWKilIhcPpJsk3Uz5fPceolEVvYa+kGo/XL4LzT?=
 =?us-ascii?Q?3G0WcYxpDAPPsmj89IUXw3MRHVX6nmPiFrda0jQ/cmqYrrhHwE2GfQTmyLfs?=
 =?us-ascii?Q?oGTjNcgt4sQRg+w2cBDrLsh2Ip3MWeKW5Y6SNrIm8D1CsVD5VQdtG6sNr0eh?=
 =?us-ascii?Q?cXsYCg29drY+LE/TX81J8rzPv9LsMrHKPtCAyII81VoeaTqq6o9k1+RTXOmw?=
 =?us-ascii?Q?SsLvkTJNei2NChsb07s5O/M1Js8F5KO71j624I04GB/Syz1f73vtXzLBgzyf?=
 =?us-ascii?Q?annZYzx707GXp0Ne1Ot+fSVyh3rLfZ+G3GR20U69sI+0lWatVjlmfOic0Uw/?=
 =?us-ascii?Q?ET5RI18/+HjmdjOtfoySPpif/4ClHesw4wrrGLRQ+mygbQLKKKkf79hriM3C?=
 =?us-ascii?Q?zA6239NmNnVmro6BVJglcJ4zutRvcNREMMQplGO7KpyirL2qhq1aBVXdfTL7?=
 =?us-ascii?Q?7NZzykoOXXDREha6vpPiJ2ddfJWUHOZEwmMRqYP1OIvt6TP01pZM4b6RL8jB?=
 =?us-ascii?Q?aQaejNXYMApmkq2xk5AhL6+mrn6IY/l3v5TtftpvjZY6grvsnUxulIgD2XDo?=
 =?us-ascii?Q?xEwVWaxGM6gafgmNfX/sjW3444m1ugzk6hwGegsW+PEC2MFxWrEJhTWcEKlJ?=
 =?us-ascii?Q?d6Rdrx3k00+enTzudphoyO3b5PAcl3G/SFHrOd4cLLHAlNAZ765t6gVgEHp/?=
 =?us-ascii?Q?hxJZVB/5QaEbameRCpJYuIqNWbOIm013X97uQ5MBrxn/18xEPVnukzCBj72z?=
 =?us-ascii?Q?4J/pN+OAsmKkzFMAD/4imvxTENHufFEwBJjAwxx4WoCbLDHTYrTvTUS3r7/T?=
 =?us-ascii?Q?msQwOo1I3PAAjQQ4TepZ5Miw1w6nBVJo1Ie8Zv8TKaXt4yfxCi/2fkXpnKhf?=
 =?us-ascii?Q?CmwpUNdQJmv992Ni9zLdLzrhnuu2Tc5O589rwlJJjouR14AAE7djP0sXAM+L?=
 =?us-ascii?Q?uLunv8ey0IblI5V5vPdVzn1bPCx+omZ3WOdZ4sTnGoA5q3LD3R7TIhgG5lX4?=
 =?us-ascii?Q?imKBKtgOG6E9yonRDbgzNnleUfNKKFhW5wQtY01pRFJX0wz/dsfICa2cXOCo?=
 =?us-ascii?Q?Qq66A0Q+ppinqr3/SG6otPpY71wURnfXznZJuljxH/DTDodsiV8c/DQlaGjY?=
 =?us-ascii?Q?JsX/oeeJJZB/DGwyfWcYumP9kSKzSafNhjDV3OEb7A2RBKUhzsXxp2pjIvuZ?=
 =?us-ascii?Q?0dsByvDBtJXY+EP6suezTl5/tE7RFFuSNv4cTwTA/k6tU8jC4O56cY7Cpjk1?=
 =?us-ascii?Q?phV6pQ0cr1POy/7B/1A3eq7rA+HLEDnE05osPBOwoFPIn2YLhj1RmcfdKSBd?=
 =?us-ascii?Q?9mYbnjVudw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sv+TsllCigq3diQUEpn7UsbvA7O9weI2ffaSJlUrY49asReAug1sreP54pkVjoAQuwaA3xfELdM2RWZGquIL5VOH/Ja+Ot+oN1nP2zU5KgWzb/NqcHlFhf19tgXczNP17T4tsth//gNefa4vUGgq4DDa2XHFMoN6wjIPF8p+a9987S1+r4ltSakQPEVr62UvrVTfDDQAPLzvair5FjFKz6z5un0n/FaN43ZaLBbE8ANcFbKRxGAxLGQ+pppaG/sLT7dzT9jqPzrfE3uRJnG2pMj2D57CYCCvvFZQxEPjKcFTTvirsu//zhKIG9DouhhXZizP8ppxPGdu8zvkCateSQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5242.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf209a8-ed6b-4f17-13d2-08de7f3eb916
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 07:20:50.2957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oiki5sMBz3Z7gO5OsX7cQ6gisCh3EdRzS3/UY0n9V4FODrZNkkGsD9fEi5C5yGapXex998Bw/B8qv+KqQ6Nhd8gfST+oxq1EgOcy6Xq0ukg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7005
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
> From: Poosa, Karthik <karthik.poosa@intel.com>
> Sent: Tuesday, March 10, 2026 5:50 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Jadav,=
 Raag
> <raag.jadav@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Poosa, Kart=
hik
> <karthik.poosa@intel.com>
> Subject: [PATCH] drm/xe/hwmon: Enable energy attributes for CRI
>=20
> Enable HWMON energy attributes for CRI which is available through MMIO
> registers.
Can you explain why this change required in commit message ?
BR,
Anshuman
>=20
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_pcode_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_hwmon.c           | 7 ++++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index 4b3c46eb858f..c63b409d7a82 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -27,4 +27,7 @@
>  #define   TEMP_SIGN_MASK			REG_BIT(31)
>  #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>=20
> +#define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> +#define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
> +
>  #endif /* _XE_PCODE_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> b/drivers/gpu/drm/xe/xe_hwmon.c index 0fd4d4f1014a..852681bdb84c
> 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -296,7 +296,12 @@ static struct xe_reg xe_hwmon_get_reg(struct
> xe_hwmon *hwmon, enum xe_hwmon_reg
>  			return GT_PERF_STATUS;
>  		break;
>  	case REG_PKG_ENERGY_STATUS:
> -		if (xe->info.platform =3D=3D XE_PVC && channel =3D=3D CHANNEL_PKG)
> {
> +		if (xe->info.platform =3D=3D XE_CRESCENTISLAND) {
> +			if (channel =3D=3D CHANNEL_CARD)
> +				return CRI_PLATFORM_ENERGY_STATUS;
> +			else if (channel =3D=3D CHANNEL_PKG)
> +				return CRI_PACKAGE_ENERGY_STATUS;
> +		} else if (xe->info.platform =3D=3D XE_PVC && channel =3D=3D
> CHANNEL_PKG) {
>  			return PVC_GT0_PLATFORM_ENERGY_STATUS;
>  		} else if ((xe->info.platform =3D=3D XE_DG2) && (channel =3D=3D
> CHANNEL_PKG)) {
>  			return PCU_CR_PACKAGE_ENERGY_STATUS;
> --
> 2.25.1

