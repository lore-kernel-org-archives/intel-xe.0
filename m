Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076D3C9830E
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 05:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A104F10E5AC;
	Wed, 30 Sep 2026 05:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzfEcJ1N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3195110E5AC;
 Wed, 30 Sep 2026 05:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790747150; x=1822283150;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jmV0Wyk1x5CkzxqZy8AAkP3VT1VlT2wcTyz9M7FAVuo=;
 b=IzfEcJ1NThMG3HJ7G95gSUT/F0QvdRZCFKaFzI+oKD7ur44aQwUCcvfm
 cztMqwgDwi2Q0Ok1RQwnBOpZSDD9TEYpz8vujaBAb39ajkFCiAVIGe0/L
 X+r3ifLY2fIFDheFm1DtlSuZNq8dUQNAS6eTZdDG9Xm13oXdUkNSUpD7j
 kBlbRR0ncQuspypEVdvVIbR35nvgC88NnciU7dWW7FDlq901ng9tu7K0M
 mPDUv0w6XJRqNomKwqKR1LbFhGMic05A2yWhwRKfUl0aYm2BD84BYaLI5
 MOG4HdokybNKaj5vKbva+TQCubj201GdqSSoo8JveBLehM9l0yQnbeF6S A==;
X-CSE-ConnectionGUID: 0rkoFO4tTDqCtfffSt31zg==
X-CSE-MsgGUID: L2jnceVzQnuADvoh5YDaZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90337345"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="90337345"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 22:45:49 -0700
X-CSE-ConnectionGUID: yyljRZF1Re61fl/ToklMlg==
X-CSE-MsgGUID: KBOmJczJRzCi0Fwg3XJxbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="279385219"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 22:45:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 22:45:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 22:45:49 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 22:45:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzOUZPHDfawI7otrBLziI/3BgqQka+TnwsalOG0EXQGsIZFykKrCbVbhtqz4awLJ1Tg12c5nfUlWd0mwh+EgtZFWtd2mCiGecgdNPhdVFcjrUgFUzVqpgmLBYphcLqdyRvsOHgUsogNcSsLg+B+0p2ax6uCuJRBS4M1PjYroFWVgcob7FtXMgNKNXz4EY+/d2VnyvQZJ5vWRfVZSAKODyyEvCKUT002gFz1uiqfvnHNd2R84jD69CVkhvn182WON8D5NrcdVBls/9iMSOrjcHtlENrGg+1t4EYsulIaU6q5YDvs8mGoJ9sOmC+h1lGLwXNW7pISETUR1C0g17ROWYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+erhJdF15AhC3ebP2xHGWXUSFkdRcmOGVHJZDFGNkes=;
 b=rnbownqvCrZJA08y+2lnAET9qRALJfYZK50fOTjfxjCCDLYkvNv7fuOJ/WXpZlE5oc0EKUrajmE3nthquzD5MVEGc6cCgqYPQTiEV74RbIpaqUdOSrhlJ7hUrjKi0RwfNZoxQIqkjr+KIeTH7F6KbfhWWOVa8u8BtxMSHu5rbhLC4cXfRHE5kwsLObjk+4GmLmxUQjzTVwFZ6jrnnwu0la/MIRYUqKeOUVkOASdOT50LQx143vOwDNNsI7lr9bGhUU6zqwfWEMPmA5Ss5r0pkdE9Lgx4vcg2nRRot3nmyjFZa3PLVnIpjjDQZxw/IDsXR3HUMgBB6FcHnvG2O6B6xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH7PR11MB5768.namprd11.prod.outlook.com
 (2603:10b6:510:131::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 05:45:46 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 05:45:46 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>,
 "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH v3 09/10] drm/i915/hdmi: Clamp the target_bpp only when it
 equals the pipe bpp
Thread-Topic: [PATCH v3 09/10] drm/i915/hdmi: Clamp the target_bpp only when
 it equals the pipe bpp
Thread-Index: AQHdUAJ1CZfP1n52a06h6YY3Vg0IvLbmnPvg
Date: Wed, 30 Sep 2026 05:45:46 +0000
Message-ID: <DS4PPFE901A304F445B4B0FCF3CA34176D4E38B2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260929104835.1050882-1-ankit.k.nautiyal@intel.com>
 <20260929104835.1050882-10-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260929104835.1050882-10-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH7PR11MB5768:EE_
x-ms-office365-filtering-correlation-id: db5c6981-ec1e-455c-b650-08df1eb612f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: UTVkUIx47KlEtK/p1MEzZVAvFyhEOyeg7HBzXnd7H4F3STjBFFHlBFluXcaKFAjLAi0FK9WCV2VH99bhz1TWunfPkFYUJRlIVGu9i3oTnqIjhPz5WGRmxtirgDZFOfJHwFycbF08Qk3siwRT7cTr16ViltG/ibJ0VwDKaPFGlF/sbYs9TzB4KatAYp07nIXEVxqHyLLNj/OnBgI42Ya4akUHUc8gKZ7Z55pdBSm3CRHOIhxac4rRD0XemB01acfNQ3Bt7Q50DqwbH0pxrPqdCcZ2N3B8ONFXyKQR3PbbhJfFbaFQim3EUW7XrsyF6e10qSb/kBILWfPk6ulqT+b9CMSLsFU0+6AFvHCIraF7N+lwUcX3Pk5uT21y2z/NjKMAZkwP7D6DZCpk6PIA3sSD39NijHosnSAT0zCIaqNit0wsiDxptbDj8tvCD+KaOFJDeMsh2/KnbrnZK90eQrnOZDByDgV+NGnsTn2bfmqM6RLLp6glBwVNWJll4fTsjSYO9kJJAmwDhUZXfjhyDRQhk78jCG1te2Bom86Uw4jXF7sJuDtSTElzlbBsO3jFFxyDjcepecYe6JyGXVlyUVLr1MHRmYAAiegkwsyBMaaY6hgg/6sIyRvzwdn78pvV2yN2Krtg5wepfHADXKierM5a8tUaAcqcpCgmmUzKkbC1QIgaLWfC74YXpdD8zCAp3sE4KiPmhAlOAOqKN7C0nndQkwZtlMFxQxXXp2wriRsBgHc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xCtVV0i/h1Lm89svgs6TL+/v678f2s+jC2i8kshZzGoPEUt8evEkGkvd4eAN?=
 =?us-ascii?Q?bR44wipZE9kKFqfefHBapuZ+tEDqOKPQtR9RGbnNrgpumrjSJReoqCSjku5F?=
 =?us-ascii?Q?9L90nIL98u28HWMpG98O4+p++dDXmE2RJ4D8uRcbGXgR5FXYHjNVOBsFlaO8?=
 =?us-ascii?Q?zH0LO/Mwp5cR57/2UC7bUKBshCdeGh7wzSprHZykFdjw7/81c4ItuGZ4lqQR?=
 =?us-ascii?Q?BkP1UvsL2SnLDumUnzqsU3mwqlzzxLAs1ezu4D5bF8/OJqiaRuQostxlSRHn?=
 =?us-ascii?Q?7JMtMlcYhF5R3Yh/IZMazshyWqQnzYX3EE+QRevSkl4d0u4HzqM7zdZzJMOi?=
 =?us-ascii?Q?HlKVVm1J9fCxCLkPsG9WA3VURp72UC8FLNT0EI4xIAEyFdfuNddd27tB1gsu?=
 =?us-ascii?Q?Up7hCQl6zMw/f5M6Gx+YEeve+PigPy7JQzgHrF3rNkr3YylNXHykHP3z2+UR?=
 =?us-ascii?Q?1Grbm17a9nKtwprAszhjt6Ow4Kc1QhoL2vAZcTLMWOgXKN6wignfMKuGM4YP?=
 =?us-ascii?Q?qu7T43D6CfSI1WpGj2VYwE6fSv5bcX574ElwAaoGT3RDQ4tiw2TED6mDhmOq?=
 =?us-ascii?Q?x8Yj1UWsrzmihZhAryfNn8/YRAeat6OfDqD45qpktmKvjSLLBFV88JrsdF3y?=
 =?us-ascii?Q?HTUWAH8GY8Lr1qvif4/ECtt1nHgS+48GCuEjb1SuDZCQDQ+eTCWFQQkcSDF9?=
 =?us-ascii?Q?yN4WWqV2i8rP9UcwINlijKTvVQrRNIu/kup42cXr0NE/jRSlFOARvk6gCDQ0?=
 =?us-ascii?Q?of6yFQLYBWEEIseTdTrp41yvdR9kjjezs8CjQ/Ox0mVtQN9YCO+v6cEaB0dG?=
 =?us-ascii?Q?YloIet8wjBsjkc2piOQX9XGrUyyXKpsIRy2cKCv6R9S5iQ3viQZwVKJQcNoM?=
 =?us-ascii?Q?9XwSL4n+fG7ygX/4x4Vi2wiNYtO3QtPZQTr0fiwdcXr6V5EtR89BPkV4W0AR?=
 =?us-ascii?Q?0ZB5zpN/iEmULROYKIGWmkNESB7kMdURgbgHxvx9WlYLmqaATZMoPoPW7iqc?=
 =?us-ascii?Q?0X21f4bi5cNAsyLA+Lizr/ElB/E9KRvQaCd6G98b5AaY0Kcw37MD+7jEE5sh?=
 =?us-ascii?Q?EPlkSdbgJHviIDXJa8yi8de0wNZyR5aax7aag4l7Sg5m+UhC1AdEg1Kzoufv?=
 =?us-ascii?Q?07Q77HbGCo2PG4HmsXC4vdvoZBfhUsAnUFNldPoEZrRrWz5TWq4vwCZt0wLC?=
 =?us-ascii?Q?Q0x2iUErBEyH0a3QCeiLlWOs00nbYvABzKe3tiEsEdjrqWahOrfuyGGEqNnB?=
 =?us-ascii?Q?cYdLwZubnMtiF8VPQvqa6Z39qhWZg0b3sEsSzFOzYmBUz3jdchT7O+OdF5tu?=
 =?us-ascii?Q?/+tFXhqkSdHGFfv8nntgC0wZ75i5X55xMFEUroEZ4+m74Mtq7kh7mMBPy91r?=
 =?us-ascii?Q?lTWj8foBDMZK/EWpiIB0m51dyrkDIWrRfOGjEW8Q7B+F++ldvitr5uTQHQXW?=
 =?us-ascii?Q?faZay5IZV5/6CkySgMkFX/R4PolyD4pekMAqgqbJg0KnINDB/nkOk+lArxql?=
 =?us-ascii?Q?VKxoWVBg8vEfWjeUGqHoJeLx4p1xDcuozbTSQKEWfVPiCluu9P4yJ9xMZ7cF?=
 =?us-ascii?Q?JygPtDSbmQ0MtBDLHxhrFh3X2vnlVAUODARFb7yWc2lHrhnweHgA+byd75PW?=
 =?us-ascii?Q?ySncsYzRYuq8h5Ion3YJzF3oY0y2Td8yuZLhljW2wyyWiDEKYi04K/JSHF+G?=
 =?us-ascii?Q?T1Ve5dDnbIW+yDSZsGvqqx5acd0TD9Kgs9dc0Qn7Ftkd4jfqRqcIQP5EqiuF?=
 =?us-ascii?Q?WN5Zm8Ybgw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: phftCvJSPC9n5ccrdvussOCvIi/LMk0MA1OThs8YLSXhHM4H8aJj8Mr8aVcQ1GVrgS1kgqdXYPA2/83HaIBEqduvSSFldR+YuVmgstyGybWatYIIxcSVZDxTn8+G8YJWWpKLE6ZSZ9TmpD85MTOtdYNwUz0P7bHHwKTLaaLfNALMTXGJ8Up0VZXOL6Cov6q6B+7fodPFJVbp6IqxoxjMHrx2G+BmywhU6l++p1n++LGjZnPh8abCKKNhVA1YaCaBNP6BgaOHxYr7aFFdFWDSQoKFgL7KOxG9jm1tEzblgECCg9y4oyDEuCp3wJDbbGs2923Fx4uOqmKcLF+sCnqPxA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5c6981-ec1e-455c-b650-08df1eb612f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 05:45:46.0496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y+y0lr5ZYbZhmTvEefl3FrIFJLSYRzWXdOu9a5vg/H4gPPxaSUDjkmY/HASHkkBhmEjJPk1ea0chpqMlaDVb6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5768
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

> Subject: [PATCH v3 09/10] drm/i915/hdmi: Clamp the target_bpp only when
> it equals the pipe bpp
>=20
> The max bpp from intel_hdmi_dsc_get_min_max_bpp() is at most the pipe
> bpp,=20

I think you mean link_bpp

so when picking the compressed bpp we reduce the target to keep it
> below the uncompressed pipe bpp. Doing this unconditionally makes the
> search skip both the max and min boundaries, returning 0 when max_dsc_bpp
> equals min_dsc_bpp.
>=20
> That case isn't hit as of now, but an upcoming FRL link-bandwidth clamp c=
an
> make max_dsc_bpp =3D=3D min_dsc_bpp.
>=20
> Reduce the target only when it equals the uncompressed pipe bpp, start at
> max_dsc_bpp otherwise, and iterate down to and including min_dsc_bpp.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Assisted-by: Claude:claude-opus-4.8

Move this above Signed-off-by

> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 27 +++++++++++++++++++---- [=
v3,09/10] drm/i915/hdmi: Clamp the target_bpp only when it equals the pipe =
bpp
>  1 file changed, 23 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 83a5a6e14ebc..ee76391c77e8 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3390,14 +3390,26 @@ intel_hdmi_dsc_bpp_fits_chunk_bytes(int bpp,
> int num_slices, int slice_width,
>  	return target_bytes <=3D hdmi_max_chunk_bytes;  }
>=20
> +static int intel_hdmi_output_format_link_bpp_x16(enum

Also we have a similar helper in intel_dp.c int intel_dp_output_format_link=
_bpp_x16
Should we just reuse that instead ?

> +intel_output_format output_format, int bpc) {
> +	int pipe_bpp =3D 3 * bpc;

Maybe link_bpp


Regards,
Suraj Kandpal

> +
> +	if (output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420)
> +		pipe_bpp /=3D 2;
> +
> +	return fxp_q4_from_int(pipe_bpp);
> +}
> +
>  static int
> -get_dsc_compressed_bpp(int num_slices, int slice_width, int
> hdmi_max_chunk_bytes,
> +get_dsc_compressed_bpp(enum intel_output_format output_format, int
> bpc,
> +		       int num_slices, int slice_width, int
> hdmi_max_chunk_bytes,
>  		       int src_fractional_bpp, int min_dsc_bpp, int max_dsc_bpp)
> {
>  	bool bpp_found =3D false;
>  	int bpp_decrement_x16;
>  	int bpp_target;
>  	int bpp_target_x16;
> +	int link_bpp_x16 =3D
> +intel_hdmi_output_format_link_bpp_x16(output_format, bpc);
>=20
>  	/*
>  	 * The Sink has a limit of compressed data in bytes for a scanline, @@ =
-
> 3421,10 +3433,16 @@ get_dsc_compressed_bpp(int num_slices, int
> slice_width, int hdmi_max_chunk_bytes
>  	/* src does not support fractional bpp implies decrement by 16 for
> bppx16 */
>  	if (!src_fractional_bpp)
>  		src_fractional_bpp =3D 1;
> +
>  	bpp_decrement_x16 =3D DIV_ROUND_UP(16, src_fractional_bpp);
> -	bpp_target_x16 =3D (bpp_target * 16) - bpp_decrement_x16;
>=20
> -	while (bpp_target_x16 > (min_dsc_bpp * 16)) {
> +	bpp_target_x16 =3D (bpp_target * 16);
> +
> +	/* the compressed bpp cannot be same as the uncompressed pipe
> bpp */
> +	if (link_bpp_x16 =3D=3D bpp_target_x16)
> +		bpp_target_x16 -=3D bpp_decrement_x16;
> +
> +	while (bpp_target_x16 >=3D (min_dsc_bpp * 16)) {
>  		int bpp;
>=20
>  		bpp =3D DIV_ROUND_UP(bpp_target_x16, 16); @@ -3466,7
> +3484,8 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width=
,
> int num_slices,
>  	intel_hdmi_dsc_get_min_max_bpp(output_format, bpc,
> hdmi_all_bpp,
>  				       &min_dsc_bpp, &max_dsc_bpp);
>=20
> -	dsc_bpp_x16 =3D get_dsc_compressed_bpp(num_slices, slice_width,
> +	dsc_bpp_x16 =3D get_dsc_compressed_bpp(output_format, bpc,
> +					     num_slices, slice_width,
>  					     hdmi_max_chunk_bytes,
>  					     src_fractional_bpp,
>  					     min_dsc_bpp, max_dsc_bpp);
> --
> 2.50.1

