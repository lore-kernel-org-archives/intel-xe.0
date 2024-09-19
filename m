Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4573ACE8D5D
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 08:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0019110E11E;
	Thu, 19 Sep 2024 08:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xy/PjHAj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B289910E11E
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 08:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726732881; x=1758268881;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wt59i/Df7vCqjt7iuniVaqhFcTA2E20vG9HxjxbniDw=;
 b=Xy/PjHAjId4vVgOrotR1P2QhQR79mTeBohA5jwasKNhcwM9zMGgVtY58
 MVNL25YnIyrgEko/pXIbQp+bLojJdxaVkMO0nLiSIfk6+D0Z0y0dSIKwG
 hfERYkgOkSjB+zNLokd/INxtRZzyhHCd0eMoWjXIhws4isKkPDzyZTNpf
 Y/GH8/x5q+rnWs970S7dMcMT0jbJbdnz2R//UW6hQc/ARrs4RJeCc3VPZ
 YC4+g87OsU7jSR356JoyHPtOZ8GiZsrO93mebbWJQ5UA2oUmPon9XoQD5
 TiD5vn4GrNOXWtoDAGQgkCpIVQaBdmuGL7o0h59MHZfAIbvC9nXFC1/J2 A==;
X-CSE-ConnectionGUID: 5pbRuMtEQMmOdc0CoJHuYA==
X-CSE-MsgGUID: 8/BKihAjR161uyfF95F41w==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36252582"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="36252582"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 01:01:20 -0700
X-CSE-ConnectionGUID: LW2hHnCtRGatE6ssv2XI4Q==
X-CSE-MsgGUID: PhTWuF3QSzCqRQ0mkn+NvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="107313563"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 01:01:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 01:01:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 01:01:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 01:01:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bz9OBrqKZ6NOlr5sP4QpiRdO0LQnp8N7Wf+S8k9ioJl9lfAcjJ8TXzOKkw4AtdeWuQ+rd3un6ATHFnGP2wA2PXWaxzQt8yaWVgyuNuy1i0Wl4PSBQTVD2LT+pVYaSJf1anyKb1IXHhvM0r+oS+igcKBAv2xO2eDtsercyO/U+FYrCO87Ttm+lTOsoD87YEBV+Lt/zwjTFNbP5mQxIoqjc25Qgpt4LMeUr0mAWlYX8EDeO6dv4TGlLV37qspABnwZ93doZ13hybaBoEIhOALpb2KMT/aTsmhOsaZ2o7F2Wx/3BQNZMSE1hvJRIIXfs2PgVgHvRwArZuHKIzR22n3Vsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7GfBQwaf5KsW1aUp97FTZhx9kUndhQJo28UD/JKkH0=;
 b=FuSHhlrXNgycw1roqmtlv021uQy0LqrjB9lsoNx+RJCMxC5RyNOO92muOnTSIg1ULo+UNQxHjLCHKDz1zmUBgyfg+4g1eSBUfUaiGKY0EaXpHUjVKPJg21+KxwuaT9dU4QGkjOSXOolE87vz5L8ii5j3QLHOHR6mZ6bFO8IT2U6fwM4qqSi+Eapg9ltS6IOCTwmShwrg+YXZ7uTd57GKL4hx0fA8HF0QMeqhlWY5CQxDxFtF4KowSXdkHD+zI5eoBvlOSSw2qJzVXTKFaqY2L3DCjWpw6be2K9ZqXd/ayPHiVYI4PF2MObRdf6bksa1LjGKNzckloyjqyk7gVsApNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SN7PR11MB7116.namprd11.prod.outlook.com (2603:10b6:806:29b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 08:01:11 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 08:01:11 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 2/3] drm/xe/xe2: Assume tuning settings also apply for
 future media GT
Thread-Topic: [PATCH 2/3] drm/xe/xe2: Assume tuning settings also apply for
 future media GT
Thread-Index: AQHbCgwv/eVdHjlyw02V+aDSGYMGVLJev+og
Date: Thu, 19 Sep 2024 08:01:11 +0000
Message-ID: <SJ1PR11MB6204DC19E75382B2D8FCCB3C81632@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240918204830.49880-1-gustavo.sousa@intel.com>
 <20240918204830.49880-3-gustavo.sousa@intel.com>
In-Reply-To: <20240918204830.49880-3-gustavo.sousa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SN7PR11MB7116:EE_
x-ms-office365-filtering-correlation-id: 869bc08b-a4fb-459a-f5de-08dcd88139fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?7S3sNhskIBaBdnZMZmp1d/Iboa11dYLlj/RV/xkMwZtaBu4smqAu+dR4Cnvh?=
 =?us-ascii?Q?3079IVhJfULu1KwQSISNhX/UViNSayiQTKyxib4DUdgQmKoe9NPrc+4OMYF0?=
 =?us-ascii?Q?29yyI4/J/1GoSez//Wnz/0O0nUHijmx+90f5CA0JerpjKjL9xKB5idP0GvZg?=
 =?us-ascii?Q?XX6S8LGF2xCZW09gvUkg7gyvS3AAVvJrVjbsxwPaTQsNoWCoBMhKH4uaWnwI?=
 =?us-ascii?Q?C3bkMtkD5T68IRMMw32Qd19jE5VRi/IXBcsmFjRcWebg03AQEdvFQ0lg5ndc?=
 =?us-ascii?Q?NVc7g69IfmpOJjCnfjosCc5ApqFlXFnGwIaET+xctvpSSWv9tLmgFgv7TQ+K?=
 =?us-ascii?Q?AiglKhhQ6XN8VcCkuOt/yLBXeCxDY3nO6Joo1+OLN7YI+ij7vwjIWRaG3jVO?=
 =?us-ascii?Q?FgK81qY7TfhPebwybxOnQvCWa9ez6uVOc7jue8xoMkJVjGpQO9Xi2AwNlD2B?=
 =?us-ascii?Q?DxcSmc3AAeiScwNUKtzPfNGnHB/kFTqR70BLEsHafVoucEn8XLSod273ZcJ9?=
 =?us-ascii?Q?d5fbGOTOV2yu9dVk/Ik0X74K+3OCkkNxCXhBpMWpf+FlOhnhKQpPRfTTpqEt?=
 =?us-ascii?Q?PMx28riq69T02A7gxas0VQLQUAJ/vS59CFPdTYAsR3MVwfdxEfSBTJ6n5Y8u?=
 =?us-ascii?Q?C5rvNswm7oJWUJG5hWpew0Gsw+uXbc+R/sQxVbS98dIB4iLUCtMWZBeRIYHO?=
 =?us-ascii?Q?aMpCd1dMGTK1U35P6sRVddtFIi4i/cyUgYcxmcOhJiRnAmYiM8HMPCesmqXE?=
 =?us-ascii?Q?ziRnlCGfRhUtpKGNtfdJGhXx5mmWDr6r3K0P+LRpDEmbO9NrITmXnSqZgOfs?=
 =?us-ascii?Q?f8HOc/CcORIzY1zn5o0Mz9sp2GQ+ePW0Q6CXVd4EUeVCH27WK7RxDSZo5zxz?=
 =?us-ascii?Q?frk88FsY9u7ea26oRYXWtjpnMKqjsNNbxtMiVY8m3daTsrp6UHvk/5d3k+de?=
 =?us-ascii?Q?tVMWZOGzgOWX/GY4xp/0cpEn3FSARD+29OyFzqCsooi3/zzelvh93pA6Mz5S?=
 =?us-ascii?Q?DDtbZaaPeXlEyFZ0twBmy8wT/SqHHvTN51f+ejyW27PXbZf7ch7sOJ6GJXDQ?=
 =?us-ascii?Q?6zDF4VYjYv9f+w6p5P/7yLC8cyzmuTfiVPSXcgr/B+aSJqUpGRLovyEdzBDu?=
 =?us-ascii?Q?H+IsuggcNZ39DyVm1x2Uc71EnZfisx7i6d8AGBGgZkN5byZRwoAU6aRaz4Z2?=
 =?us-ascii?Q?MyuuWy/vHVEr44Aqfrz0P88+O2UePdd/xGfDWlzhuNY++hCoeuv7B69J2l+M?=
 =?us-ascii?Q?Ds0Pvx16+jRUvwkJ7wqRFsXId/N6NZ1l7kOruVGjrfle/iKePvgobxNTJWaL?=
 =?us-ascii?Q?x0m3lEQSRktJAFRFKkrcV9cn/DRvzOF959aWw5QRAvMwtedFfafe3PkcaCye?=
 =?us-ascii?Q?wDm/EnAT1SbOoxpNrfKUXrxnjypBdlPFQkg64XdQpy5HA5SQWA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FGd5JkRYc1JE85oxIx4KByKGvKfmav0nz5QcYM+5+LfPeANemEsZ2+eQ7om2?=
 =?us-ascii?Q?XtfR0yZ1tpwkgphrIHhLfw++33YdB/D5VLVLI9ohw1J86l0Ww352+m1zdvnb?=
 =?us-ascii?Q?ooFT3wg40DFbRjbz1GTQyZBMIRLWUW0yLD4NlPb9bp4crWIQB94a4g3XfFDN?=
 =?us-ascii?Q?GRYg7I9OV9PVsxkAkh2HClwq0SGi74OQ6kHQbBJ24CD24C84QNEBSm1bZkUP?=
 =?us-ascii?Q?pPRQ+/2/PKHhfynzvF7arK0NTmLDaQyTRdqHxZEjzUmh+ymjnlwRzkTC5EGm?=
 =?us-ascii?Q?aq/SdnnN9JZHMBQp6a2nmYTFDh2R2NB0VmHmibh+CpCxbLTM/YZ1WH2VsRUc?=
 =?us-ascii?Q?WQHaonVc5ajLHj5261ZfGCbt3l3q+XaZv2Ae18GkoGIXkRcFLYRJy2PKwPwk?=
 =?us-ascii?Q?kwRbd/9Op6qirJX8zWQ/VuKbyYPchlCgiahHb+fsnQ+uPU4UvfhNCEB/m9+D?=
 =?us-ascii?Q?meXRgNUuTsMNAYf3hvf5t2JgcTtXrK0h/ekjj8dF2XJrRoZ3R7vGOuWSIpfu?=
 =?us-ascii?Q?jDhxkscx1PTWI9YkKyLphn+HC91dIuwI7HsTGFDFshrpwbAXuCaWGJxi50Gl?=
 =?us-ascii?Q?yTbvuaGBgwBc7ceGeBJ5xktIw7f8hFMNUjAcJSxNIPHE5QTmroKYnynSMK9T?=
 =?us-ascii?Q?s5htFNiuIZMMeem6KOuAx/yz+0wcQmynQ9eWFzoj9bwNT0mJWacDtoabT760?=
 =?us-ascii?Q?Md39WGwmyyVp8jzEQhzbBySkNHhjFq+Q85WUpqwanxv2brHAqOZEK9Kda7Kp?=
 =?us-ascii?Q?7/jr3SlXZOj01oCw3llmgvqspkt2Zcy9+jZHPkf5iDnzu0KijMnYHskM8qqZ?=
 =?us-ascii?Q?2rU6FGJrrgTfN7iQ0elEh+Co8Ga4rsOUPrhLgodHBS2oII2tr0HRYt1kSfoA?=
 =?us-ascii?Q?U0ZP3RqYZtgIC9hARUthihe1WgifFKIpYqciyAPHcxuhzLQP2yTpep9KAwmt?=
 =?us-ascii?Q?9wtqEXLiGm4czULqpUuDx9w2rGwwSaCRAveWNQKXtWD5sqr8MXDZF2f3KPgI?=
 =?us-ascii?Q?tmGFUvGOVQsPIbxF4Cr61xBzjI5SNMCYn4NUndHNKMM0fdgdZf6BH6vPrbRM?=
 =?us-ascii?Q?44HRCH2iDSJerJ9BTKduhoaxqfVHnddEaM/TpAE7COZS1IMV2Fww+cWv/m2W?=
 =?us-ascii?Q?+5N5ob1vRb5dtmZwK6ukuXuJ2D405Abvl7v/qkM2daScKnsjSE4zRqIl2lPd?=
 =?us-ascii?Q?opepqZ3j3plEXtj9HO42pz7OS/904YEIZy09ZKdl7aB09TML0wGuv1T3xKg1?=
 =?us-ascii?Q?we0czP1Kz3TLdV33PWd4CUOirkEBShzswrBqcMVRgMOWu0uEIwuqqgOTOFvG?=
 =?us-ascii?Q?9dQZNAgVNs7/euD2UWC/KByVGugUAfGmg6G/ja2Teek1PWZgSvJP4psp9RU2?=
 =?us-ascii?Q?UTbPhxbaZGSsyE4zmdv+DqdBXN2ANkbuu8G3vbvJuPB5a3O7wUNeWbeYmsp4?=
 =?us-ascii?Q?4zX+wQQ0kRbgzliaIieHyGF559V+TwDgUzjn7dRXIl9e9m8zFyJJPyZA75k/?=
 =?us-ascii?Q?AkVKosbMFCg4qcag09A5MuqVyBNcIQioDxI7AI5cvl5xujtRasXc2b9RiEpn?=
 =?us-ascii?Q?4Qn4c6s+D6ua1L6VDXihiquiJMzq1e3OMdcmomua?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 869bc08b-a4fb-459a-f5de-08dcd88139fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 08:01:11.4771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rQNeuMsgtSZk1bmm0ECfRChe9ID6jhOGsDTAd5h1zh85B1u2kyh9mR87zSkCEpeSd0FBzJ3R1AGIIcbjXsfhh88bs91kEMMiaov+navoiEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7116
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Gust=
avo
> Sousa
> Sent: Thursday, September 19, 2024 2:18 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH 2/3] drm/xe/xe2: Assume tuning settings also apply for fu=
ture
> media GT
>=20
> We already make the assumption that recommended tuning settings for
> primary GT on Xe2 will also apply for future releases. Let's make the sam=
e
> assumption for the media GT. We can come back and define closed ranges
> when that becomes necessary.
>=20
> Bspec: 72161
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tuning.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tunin=
g.c
> index 7a5b852af8d7..f62622f0be85 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -33,7 +33,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D {
>=20
> REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>  	},
>  	{ XE_RTP_NAME("Tuning: L3 cache - media"),
> -	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000,
> +XE_RTP_END_VERSION_UNDEFINED)),
>  	  XE_RTP_ACTIONS(FIELD_SET(XE2LPM_L3SQCREG5,
> L3_PWM_TIMER_INIT_VAL_MASK,
>=20
> REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>  	},
> @@ -43,7 +43,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D {
>  			 SET(CCCHKNREG1, L3CMPCTRL))
>  	},
>  	{ XE_RTP_NAME("Tuning: Compression Overfetch - media"),
> -	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000,
> +XE_RTP_END_VERSION_UNDEFINED)),
>  	  XE_RTP_ACTIONS(CLR(XE2LPM_CCCHKNREG1, ENCOMPPERFFIX),
>  			 SET(XE2LPM_CCCHKNREG1, L3CMPCTRL))
>  	},
> @@ -52,7 +52,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D {
>  	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
>  	},
>  	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch
> in L3 - media"),
> -	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000,
> +XE_RTP_END_VERSION_UNDEFINED)),
>  	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3,
> COMPPWOVERFETCHEN))
>  	},
>  	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"), @@ -
> 61,7 +61,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D {
>  			     COMPMEMRD256BOVRFETCHEN))
>  	},
>  	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media"),
> -	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000,
> +XE_RTP_END_VERSION_UNDEFINED)),
>  	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
>  			     COMPMEMRD256BOVRFETCHEN))
>  	},
> @@ -71,7 +71,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D {
>=20
> REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
>  	},
>  	{ XE_RTP_NAME("Tuning: Stateless compression control - media"),
> -	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000,
> +XE_RTP_END_VERSION_UNDEFINED)),
>  	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL,
> UNIFIED_COMPRESSION_FORMAT,

Looks fine,=20
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
> REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
>  	},
> --
> 2.46.1

