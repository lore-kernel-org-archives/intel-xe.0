Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449CB108E1DC
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 10:26:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086D710E89A;
	Thu, 19 Mar 2026 10:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVXv0w+x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E3610E89A
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 10:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773915982; x=1805451982;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TNty74fFDjJQiNQo5rqnVKeyHulYOYnUJpssk+9Td3Q=;
 b=YVXv0w+xXpu4TCpy0y3p91uxMXg5uHymrRwqVqnhn+oNHl7UuEyfvnnZ
 VqyEDIIZDhYOUFMKy9s8bahwYI2oqwy7n99SM7sdpud5+d4YhQwE9IBho
 JgAvab9NuID6IfNO1ltpukXhrTO/1NhwypA8RX+q9m9xExWZAxnZTYU3C
 6cWHaSz+X1BYWxoW29jB+HzVtAe7QjPt0t6MG7i1qwOc26+NUfNuox7ww
 RRz9QP9+Rzk/m3ynT8uzYSzuABPwShjP9RbfE8nwOICQnsobGF6DXs5ne
 KW8jPQam9eVZfr28D5w+TgTaFEy2Pc6u9whA2lwJWySwkRwZcMRk3YQQK g==;
X-CSE-ConnectionGUID: JybVl8E9SqGGpe8HwBZ2+g==
X-CSE-MsgGUID: qN3ghdciRz2k90c300AWsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="78887118"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="78887118"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 03:26:22 -0700
X-CSE-ConnectionGUID: AsKZ7pSzQMecdTbiDRzFsA==
X-CSE-MsgGUID: oSRWLXMvSXSMkqB3WaWE6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="227864609"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 03:26:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 03:26:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 03:26:21 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 03:26:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1MtRDqm3rJmbVOq/als0/PzInRY8etkm1rr2fTzKi0cHbu7RDZgdJZBVFsroSmXUxt0uqgsQvUFE9AbUHBVWpnxWATiSglXn1P7i3HisahljP1oqXFLLckd9rQBmJD0KaBOpDXk6o6gUKT+LemvYk21TCE+fY47/fwTAh/UlsL8rK1wbNa0IBPeAzHz6yCVvGyopIneLhPmedK/4e4xv2goHV8YEBzQNfm/oYEPi8yiRkJbH862IVFyAReRo5y2sUKy7vSt6S7yC7IsvKS6V655c2codeHKT9rvjMkEW9LmsUzR2b3j5B5Qhe9oNMZJvAN+oJIZBnmX6yurCnbBkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XV1pSCobMIlBmX/IxATjeWTej+fthOi88MRwKc2BqBE=;
 b=Y6FJEBSaDKwK1He/NeDZM3JsJ7l3YzsNjWwqvAJktxYKhWchcKrvB51JWiqS8lP3EWxfKUAQZmFwcYQ8BUEpILZvdA5KgTmFyETHmoSIjkwBeaot03Ni04bIHMHWYw6ole4ypYq2ej9MNWcKXYOEAE3XLWKi+vCHSB2yOv81uMXgk6KWZhfzvCWlIwP4n6GCAqvxjxS8CrAZmlUIxIXOrCIdNOSHtB0taPDVI19qgsMy824WpSZgahQbT6KKwQpjSwwamD6+qlMh8k1rne13ivIhthWGYovOzCSElOdnoKT8ySHQUA0SEgVbjAs9QpvSIpAzQEbsT5FCllfepAR1qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB6427.namprd11.prod.outlook.com (2603:10b6:510:1f5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 10:26:18 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 10:26:18 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/xe3p_lpg: Add Wa_16029437861
Thread-Topic: [PATCH] drm/xe/xe3p_lpg: Add Wa_16029437861
Thread-Index: AQHctcNCWnns/z44qUaaAjbfFWuBRrW1qd/g
Date: Thu, 19 Mar 2026 10:26:18 +0000
Message-ID: <SJ1PR11MB62049FAC80D3F0C34CD6AA31814FA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260317040447.1792687-1-varun.gupta@intel.com>
In-Reply-To: <20260317040447.1792687-1-varun.gupta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB6427:EE_
x-ms-office365-filtering-correlation-id: dd001a4f-ca73-409f-2b40-08de85a1f518
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|1800799024|38070700021|7053199007|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: Z3ZWN5zr7ZtfYmz2OHbXbrB2QJrtliO/yokgOP1WrRNCqc5Xl5bZMNANvgkSG/awtC5i265Tq1NQrkryd+tzvawxKu44Ick4fpm8oI2UNQ2jEqf5kbTU1nhZ6AXGed6jcl+XJOVYkJMBTNksaz/xeYSkEyZLTvchsrB+vz8QW2XH+DapZDy9D5xV3W7Oza3zZx+P5LCkuzvzfggN267XFLfA4cMwHqal+eey5Bu4NonwvWX4LNCMq6uMJ7gg5WO8NDBIcgKUya29Voyxy7UpcCiN4tsLIiMaurhi7N53Sat1yUsXrqnZe7bwv9NNkDCU6HARrRTPxUiR/w+tAAkp93jqu9+ImwaQddRvmG04VavH9loKnGTgl9DVMP2iYtdmkcXC4JfpPeIIBrt5jEpzsrI5e0nEVNaEZ2wGxjUsq7OrZ1p5b/CKIKz+vgXoOWZZau1c6DhXilKdqgdjiVw4CfAMZbX9UXLthjlHrQdOLWK2HdWbXKRgojl3jQcosCFd781o7C3O7eObnUGOYYLvgQa/UGDMMepwO4SYlG3OPXcXBTVIGjNd2O1DCXAakoQcIyO1X9ZEjBRHLjrI0+DPSnm0SEYDEyXFBqbTdEn6ITyzft2C+ygeuORkuiN5jp4RsI4Dzq+mJ61TXjoOpLLwJLqwKClbVMaxlhGrQma5fxTKnKI8i+yEA5kb9ah9J8h2Zl8WK8nTVY9dA+6gepAntiN9FeqFqDG0kqNblbfCm7WFKxia9QURSCRkTg3ll3dH/jOA+ejf4e4INiYankg572IO3wiKSqVqtMKo/hPIRWs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(38070700021)(7053199007)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+avPiFva2nLRX3QCZnp9piWHYT6A9AHAzqUu0T+Wd8QS0yW5ITVMtDC6zxQ/?=
 =?us-ascii?Q?lVvoCAR5tOVPY6T5rTlYNLHl4MYmBR0wlC4905h26ijE4LxZ/ELVUyjBJJgU?=
 =?us-ascii?Q?Gm3d1AUvzuUYHq10fMF8/V6wdOMEyt+xckfGh5tmcS/P1gWGKCk9NhM0Zv3O?=
 =?us-ascii?Q?d34mNSYtZpQOjnLDOyk7DdRASjbVU3DCnLUKVNkO29QS6lpS9bXbw2WPET83?=
 =?us-ascii?Q?XpCmzrQ0DrCLVLJl2ytegW6Lw7HFPbJpRFI70P6NripERJQN6YSHjvmFKDT1?=
 =?us-ascii?Q?fviFSpnQUt7L2El37G+P0Ta817M0U2EpcclMHLZuQWuPvcWlWOpxi1OTrrfQ?=
 =?us-ascii?Q?MjN0EwB6Rmdl3Xf8CoKPH1p3sE0MrCPG/RNTSGJSkoKOf7R4/9t//nyls/mY?=
 =?us-ascii?Q?qRsltygR+9Zz3Lzs7gtb6NJlv7NmJxg7dVHEe/Ve7LCybgi3LTr9HaHaw9nO?=
 =?us-ascii?Q?HeuzMg7sys06X9gRQxoTBpAhuhsPpjFuDt427ODRh1/5kpABT9joGyEwftoy?=
 =?us-ascii?Q?NRJ9vZ0gj5dWw55F6zRA1l9X6nr7S1K0M792CTHGAAZkSyviZZVhqDDT8ozX?=
 =?us-ascii?Q?eph0zlkjwXSobF5C+iTgP1uTZydcj+xAgOX4sqKdy7TWkGEolemAceTz8dYd?=
 =?us-ascii?Q?KdAjYqyjdXMadxqNaxotJbneAcAhOQ8snLDZxW09WPaJa2QyRXUd5lxbObZD?=
 =?us-ascii?Q?oDA1oM+alGB+BTHmHlY/D6YhO5Tslqyc0/DJGMDtHNkEU9VScOKCKoxXU3Mq?=
 =?us-ascii?Q?smsJVEzBCb++LoS/z01Dp6w1BWQKivkyKZGD6SAIWdqCga9oJMVTibc0SfEe?=
 =?us-ascii?Q?wT4RdAGoGkjxjvM917vbJI02KHwC0dKcyAWG4HFe0wSLlQV5XGqVzop281I+?=
 =?us-ascii?Q?sHlG8v49Kc1OTjkWeaMruZcykK2GWrK1sHX3a4oxT8eJdZGhkQiX3WM4lIir?=
 =?us-ascii?Q?2wgbXzZbNvId/zq9NxjcArx00GCSvYgFyzMt46djJPl3vqSfJfBW2r8DmnRp?=
 =?us-ascii?Q?z0YMjgMSHz8F4lMBZFLJzgWs4Em/2x3uCxXX5lPWQIWpRaqhUuejrw66EElj?=
 =?us-ascii?Q?Xd8y48Av9o2SL4UKokLIFYTxBZEZDEtU7oInoxLwBuAsUfz30PBqO+DQEK0H?=
 =?us-ascii?Q?Vr0ZI2CMXdrSEi3ugJWm/ZyXDBtnklcXRq2Hb02KOyqNJy1pdYR09t9Zlrgo?=
 =?us-ascii?Q?44EbbLJNlggvDJz41ZrgOGHALt6QbHgd4jNXTu8+nsXRAzG13IenhGdI/Wx8?=
 =?us-ascii?Q?9V/xBbf32PHpLg5ktPCzhrbm3cKWQmAwXuGJxkTMr9socOtn8/I6RyVotPhz?=
 =?us-ascii?Q?d4DrggktgVlwCaKzcz/VIDL4txSZ/W8DUE2cNJjfcPrAaPrHawzxclsUAyrr?=
 =?us-ascii?Q?ELVlNuz3lyO34/5mNIPD60bPGN7mmZETdLTAJvHIVqA/5HEn+RFsqp4UWHvl?=
 =?us-ascii?Q?Iu0i2BezgaNlxy9w8e/XLF+0nFJzp+tCKDqdV7Nw4/aDQS7WEs4elwW7ZsYi?=
 =?us-ascii?Q?fJP8rAotLCL2uUMbGVdW80aVBQUj+GyOFk53pMJUjMO+sRbe6cpwnIW718yH?=
 =?us-ascii?Q?S+kFNA7EKGP2Eb1SHOR1TcyNyIOzkYiv1KzGaR8bH+6GAeup50zD0froJgP6?=
 =?us-ascii?Q?mrzMmXBqHZ+IWlwgIiICcnHEbrPISGo5FzofyONoSPVBSXRsXzpNL2NoEpWz?=
 =?us-ascii?Q?TsQixURHp9yD/fLGQ17UwYNkWqXxCW1QzTbymlNlE+prc3s/5bGpE9Erwcu1?=
 =?us-ascii?Q?LbH3TKb7w+OOyxOA5/NJYsfvG2+4kyAhk+oiTgJJe87zXM1PN1n9rP/GC4iD?=
x-ms-exchange-antispam-messagedata-1: 4Y0wLZPDUIMhyw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UnGP3zuN+IwPw3yS8Hf36n4Jt4mpBxEH1hMunFHuSvnTU2Y65xYgz2TnkGIItHHQUZ7CV5JbNpVSbITOJydObPYi/PIXm/etg+okp6JobEhkd1mzDXi4q81hIgceFhnb5/w6ZTVtTfOHAIFBFH9WhAkj9KobQspc2iRGLPON/AwydcK1unBZ3uge8/uIkA17PTu0VZAkXgyFI+d2rQ4fNQaTxpUFZUset66HQzJ5U5b2DQ71JqTbaxLp8ou5egpPb/mDlgbzRg3jBad/Prq3WsP6VpP/EVKPMCjtBookTr1kzewx3r3cuVQNztg7RpEyfMMxwRsERvKsVBeyPUKVvg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd001a4f-ca73-409f-2b40-08de85a1f518
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 10:26:18.1183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H/VvIYw+CmN7UmNtl7ssN9GhDF+QisLmI0jj+Jk0bmfV2MvU+V+mZpjgdQxNGPI7P831XgEFTT7e697yEG8vCp6Y5GmvsnjemHPz/auLgO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6427
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
> From: Gupta, Varun <varun.gupta@intel.com>
> Sent: 17 March 2026 09:35
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe/xe3p_lpg: Add Wa_16029437861
>=20
> Wa_16029437861 requires disabling COAMA atomics by setting bit 22
> (SQ_DISABLE_COAMA) of L3SQCREG2 (0xb104) for Xe3p_LPG graphics
> version 35.10 stepping A0..B0. This bit is already set by the existing
> Wa_14026144927 entry, so add the new WA ID to the same implementation.
>=20
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c inde=
x
> d2fc1f50c508..1d77f5b6401f 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -292,7 +292,7 @@ static const struct xe_rtp_entry_sr gt_was[] =3D {
>  	  XE_RTP_ACTIONS(SET(MMIOATSREQLIMIT_GAM_WALK_3D,
>  			     DIS_ATS_WRONLY_PG))
>  	},
> -	{ XE_RTP_NAME("14026144927"),
> +	{ XE_RTP_NAME("14026144927, 16029437861"),

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>  	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0,
> B0)),
>  	  XE_RTP_ACTIONS(SET(L3SQCREG2,
> L3_SQ_DISABLE_COAMA_2WAY_COH |
>  			     L3_SQ_DISABLE_COAMA))
> --
> 2.43.0

