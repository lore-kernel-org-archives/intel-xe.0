Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDB160A261B
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 05:14:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C777F10E1DE;
	Mon,  2 Nov 2026 05:14:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B111810E1DE;
 Mon,  2 Nov 2026 05:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793596442; x=1825132442;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UgAJi6eOjfg7i6i/2mFldGju0F5/wb21yXFeRHNzsCg=;
 b=av2QaDOAZCUpguczWju59UuVuRkMZdXg2dAKy6jg6+BQt9S5/jiED1IC
 QjhEZ+zWevbQzssBYSr77v7yDkX3OIH8UGjCOtkskJKj4cq41e5GuEMpH
 wEupC63ZTGDN23GeKNMR1JdPdUiFI3KPTX+7AW6TjDtUuw0iV6+klm+BS
 wDnWz9qy83/mlB/1z364owJvUVZlxs7UPZQNxCl/pGN6X6h0aaDWqGB/m
 lUogAIbjFtRtXCepv+aE9qXgi38yDid11h8PvW3vpJYhAckciYNhU8cFV
 +EVQDSFBZGU0pfBMtY3dE2oB8pUofhNoE0i3j3ufnqSBz596N9a9bZsjl A==;
X-CSE-ConnectionGUID: BgOPYMxuRM6IJZmylipJCA==
X-CSE-MsgGUID: vEfTFWXWSBGabz+6opyWng==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2154497"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2154497"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2026 21:14:01 -0800
X-CSE-ConnectionGUID: i0B0GZ74Q6GjApzcPmoNXg==
X-CSE-MsgGUID: vx14uV8dQTWOnIH+gAfC6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6028411"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2026 21:14:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 21:14:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 1 Nov 2026 21:14:00 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.21)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 21:14:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZNh0+ZvDoTBwDiw3wvS6+CaKrG/ADc04ZLH2L5cPEMHP7O+sHOqAhclzCcp8fsUDgmSw2ccPwnKPwwBM8hIrazsaYqsjkGKILFXphnZmiN7WVsFiXA2sqqB8N7qIqEmkCCjropnal4sLCplyO+D7V9S4KB1S7NEDDhg9WO98MsaputpU0Mvd4fjdvytmjWlKsApxm3ODzJRVKWb5zptDBwT274m5eZUWiFTkDjqSVwqeQztI1FDfONJmm1WsdGyBlFSzHzlw2OTBGFV4mq8O1b/FJoiaKt4vQcxfpBrEkVOnJj6FupyCAcvTBkapYjq+XIQksg/i7To7l5M61K0/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ze1T9xnFuqqmlF6aZLMLaT33ncDBdNH+Vt7fYu7TASY=;
 b=btHIJB3pZ2Thgf/MlgX2pYw/t/922zhTDwmtsOmJE9NvBAOfamcEQUyW+6g5gNgy8yuIOl6sijw0aC2RPYDYcU2aMPmqxOnEMgu88kTdFhmr0DRz99o1khfZaaBokHSjnMvL+DZLSuXyu0kgfrYprOJqLkVNsqXlIEjyczLEZoLlOKhXpldd0NRiV1hZ+b8TYFbh+Z2dbV2tv/lDovZfC80EwDVz/YojlXqhTUjYwumCP74M406bveK+4Mc9U62uS3tckeoAg0yGuFy0n4nx3zc5X4vlU2wWJCMpNirhzVhDS0HD4PEkvQ+8/e8U7vdpO9vDpABMXW6IDaVRFowttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DM6PR11MB4612.namprd11.prod.outlook.com
 (2603:10b6:5:2a8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 05:13:58 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 05:13:58 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH] drm/i915/display: fix a few i915_reg_t usages that have
 crept back
Thread-Topic: [PATCH] drm/i915/display: fix a few i915_reg_t usages that have
 crept back
Thread-Index: AQHdaGlckVUhJ/QE6EWewhNoY7A5VrcaQPQA
Date: Mon, 2 Nov 2026 05:13:58 +0000
Message-ID: <DS4PPFE901A304FA4A537312A02AEDE54BCE36A2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261030122207.2835113-1-jani.nikula@intel.com>
In-Reply-To: <20261030122207.2835113-1-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DM6PR11MB4612:EE_
x-ms-office365-filtering-correlation-id: 20542e6e-2058-438f-76c6-08df38a01978
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|38070700021|11063799006|56012099006|261009223027099003|261021121427099003|261021123027099003|261022075727099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: iOxn4XA/PVBy+oOj4ID+rgAFzdqWKBVgXM/dXArzf50WeTL2CmBsV1OpzGvvdhy/y59MSI0qyDdE2eJmOMfP4nHBJi+0OpbBRWnnJv+VRws9daYHfic1pxiDfLOkAFY96vAzV08/YLMzYNEjrhdcimEnyVt1bbCPhTffTs3u9qYMJljjXB+8aIE1uhdt0QahogbNaK9Oz6PLD11X7mm6LYeAuYXDKx07tSoIyMDhmF4OExcLxTtcQXDo+GWxv0M70GzrozwLMsAs/kNAicruFTpQo4DlTDHlxHwx/WHq8gybd5VNTGm/2C31FnFV16OUDGIWOqt9kLMIVYyEUDnCgi5H00ghQNR61tDDx03qEilZwyDYdgWDD2dg1Fx1k1kRPVvv/gMS9HuD9/NoRsZJWSVNvKIn7l8Y6agAZK2Z5h0gbCMTsBP0UpXOzPxKKs2hNMpOXV0REkqr1/iQnY0pqBKCH7Lm40rSbv1TFNcC2RC1s8K2XjeOPbuKbrpMdfkFE/EYQSelL8doG8xrPZbbagsmfAw1H5rtq05C8tR3HesU3BYA3yrxi0x4WZr0XAs7///0m4EF/Li67Vmo4fRZlBIvfOgYrjY/b9argX3Xl2QN/UEh7LDeNf2u3kBNZoJCIyAG97UHHi7Jm1cHsDWwgL4Qrw4dF4HHyzaiFpz5XRrQGBd9y2fZ2HA1Uz+sJCKbg7F8JBgEp66wxQ7JzY8FxpT1Yxz4YsAOkyV7/pKLLPk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(261022075727099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6chA/GaVz172NSsgJX4yRTy5P58fkFUYJQYQIcAQ6y3CKn/2/As62O/p+JmV?=
 =?us-ascii?Q?oTkJFV29nvNq+NbdRfDS3bKKaxoFOPK7gBmjPHyLzJdWQSyO0f4B5P7+tKUr?=
 =?us-ascii?Q?DqW5Sxq4+xJONA4w07bqipJ2lIUQwHdmuamjn8Y+r/6BOz4EsOA6SN8rT7kl?=
 =?us-ascii?Q?4X7bEvzg617zc1+bnXiixfbDjb+Z1XXv24u5Ga+MDDxHWGGEdpBPhTq2NPv4?=
 =?us-ascii?Q?HOUIIsOx9mUI/Zd//hJaHSKYVYhfQTTz6+r4wt5TmnHoaemrEODuGEeP4jFX?=
 =?us-ascii?Q?uy2tVVRUXsw81g8QGqHA8h5W/a6tW4Zt4LV4FqRqu+WUCBV2Y3K5qBuQsKzq?=
 =?us-ascii?Q?DeLYQUVriFuN01Fxm4F52pAa6dn8JQi4PCYCIbpTI0nHEQATjIVzTpUAcY9x?=
 =?us-ascii?Q?KltWLWRsXC7Lb3VcIFBQadKQIHWHq85FbfrhnuvJw5MtTqM62DUKkp4xeQwv?=
 =?us-ascii?Q?Xj1aEUKmJEuxTnsgpUt0FUa6q9HjT0VRgcYT6pgeboOQgALLxAxU3r981ZOA?=
 =?us-ascii?Q?2BqPJSjQpXdigcXS/zqteq8C5MPfUODEzFYbkaTkMyICrptdQxkUjGVlBj5O?=
 =?us-ascii?Q?v9ctCrtq/aGLvbLUVCmKV2H27ywGXxOhYTMr/8vZU69h13HVoQoDk4uAAYLc?=
 =?us-ascii?Q?eHCD1SkYVyGb9nozeXs77zPPOma6FvkjTH5OzAnbhdxJ97MzkFKHYwoGxvKZ?=
 =?us-ascii?Q?ntM/4StGuGzbeDTOv9aNwY/2zxG9hAUiemMFuaV9iwnq7ah7IQzJZz/HudRI?=
 =?us-ascii?Q?vaMVpUetpCbGZt+x5M1mbeE3hJzOnmRjQwe5X8d2MHrKih9usuiZnXYnosEP?=
 =?us-ascii?Q?y31YaNlaARQ2URWBjhuJj63qRVoXKzH4wVlF06aLQQAJsSRTgS2/HDAf5F/5?=
 =?us-ascii?Q?2xggh7KmDYG3RvU7juZiN8N55k2yLjYxKYq868mgIpMeUluCbty0gYdDd5uX?=
 =?us-ascii?Q?1r50AAIQvTr2W5xt/pLCC/9g3wifa+t/DXtgMW3Ue1CBlh9fXb0PQXClaZ5m?=
 =?us-ascii?Q?pzCtDX+fgoAO73+2G6O5YeHdbVKLExUmm/qXfyXlyH6tEvs9C59I9zsy9vwi?=
 =?us-ascii?Q?oRFGxaaBGP5/Oa45FLe1+kjLy0DkhdNz7J/RQbxDSD8VRjMg9/2mHbbsEvLO?=
 =?us-ascii?Q?c2L9ByhWGUxrRqCrDsEwHHz5AjyW4WRlY8MVnYSwt05EQ9ptqy7h4KnFklmf?=
 =?us-ascii?Q?xm9lMdZxRa7eMR4vrrglS1BXHbqZVm+E/cut0iwpAFl7H+ZFEaFS0Tr/6mZW?=
 =?us-ascii?Q?qU0jCRq32DEaPOkk4X0eymUEBaHyZHvMcgHLiIEkc1AaEdWbswsLAliNoMIR?=
 =?us-ascii?Q?/Sj4ilR5k3XGKWIUsZPd1qTUg5L5LOZTN5MQd849FzJJqElZHPDoguyCVk9u?=
 =?us-ascii?Q?LmBM4Pdj9Cj7mtpb+5XhtAVvMAmRPCjvW3nGbtYYDSKElZ+YsVswh/gfTm4J?=
 =?us-ascii?Q?JOQtidN585muSyVzqaR8mnlBMtMzSWqQ2iMk7LGZF5Dz0GMbn4SQoYob3bXd?=
 =?us-ascii?Q?wa2IaMCKdHa2qp9L3/HCtUvVG/y2qKII2lUdSnZhb0kUCFAOq5KbmR83vgV/?=
 =?us-ascii?Q?dQpxjmODUyqw/g+GawKzddO2l5RrwEXW/XCKHM8zVZk0kNc5N11e0HRdeqyM?=
 =?us-ascii?Q?jfQa/bXX7yvjs1/iLo+VVMoyPVCdocPncWZjcpo/8rMg3A/gj6p4S43m+zbs?=
 =?us-ascii?Q?S5RGzvmBoN8wT4WVctS9c5ie9j6A4a1/U1byWUHIR3n3g+MiItje7noQ2HWl?=
 =?us-ascii?Q?DyDc0WeBrQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PvBNYK4DxfX2Iz7FS2lmDSxk6OtV3cq/PJgqMa3vcidqBisVZKX9TZo/MKo7hS1WQN6GgzFFxtmxfn0VT2NgR8pZgpqcoijI1A7W2aTeb68iAECyqaQwEEyRO5VnGIIy0jKIBu5SCiqobXu/IfRaj0yn+EWywymmgl+rzz8S5KXv/ZMP2VnVFe5oqIgodCWfvbjL5U05pS4K7Uhhpk++j4uKLDlv/cvoycGgWBpyh0keidlVzJwF5RZsffJ6DCpUH3s+XsXx2mo7QGXI6NYptMd+noB9xQwgh+lxRVVTWFl1UN18KCrhRujMVw94WvdfbPfUMHraRe/1CZt3WTiKIw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20542e6e-2058-438f-76c6-08df38a01978
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 05:13:58.2704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IWE8/BalQ6avEwWv9YC0nDDRrbLu6rwse2M1LoIngemgdzYJTntRP1lP6fV3mUmeJ6imgPpmOtYpj4jBAB2PGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4612
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Subject: [PATCH] drm/i915/display: fix a few i915_reg_t usages that have =
crept
> back
>=20
> Display code should use intel_reg_t instead of i915_reg_t. It's currently=
 just a
> typedef around i915_reg_t, but this will change in the future.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_de.h       | 2 +-
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h
> b/drivers/gpu/drm/i915/display/intel_de.h
> index 5d3aeaf6a70f..d0a239a36980 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -136,7 +136,7 @@ intel_de_rmw_fw(struct intel_display *display,
> intel_reg_t reg, u32 clear, u32 s
>=20
>  static inline u64
>  intel_de_read64_2x32_volatile_fw(struct intel_display *display,
> -				 i915_reg_t lower_reg, i915_reg_t upper_reg)
> +				 intel_reg_t lower_reg, intel_reg_t upper_reg)
>  {
>  	u32 old_upper, upper, lower;
>  	int loop =3D 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> index bfd6f0a19725..07a66db583dd 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> @@ -4798,7 +4798,7 @@ static bool dg2_mpllb_get_hw_state(struct
> intel_display *display,  {
>  	struct intel_encoder *encoder =3D dg2_get_intel_encoder(display, pll);
>  	enum phy phy;
> -	i915_reg_t enable_reg;
> +	intel_reg_t enable_reg;
>  	struct ref_tracker *wakeref;
>  	bool ret =3D false;
>  	u32 val;
> --
> 2.47.3

