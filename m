Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5CCC55162
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 04:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6E810E50A;
	Mon,  3 Aug 2026 04:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgyzBlY9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0282510E436;
 Mon,  3 Aug 2026 04:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785731772; x=1817267772;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AcqcnUs0xuJnYDeiUvHd7AV1Wb/SJFB+mtwnwDKcZVk=;
 b=YgyzBlY9dCrvVACSsCW5F83+sBQ1juS75nfHFQR7gTLPSnrtM9SwaUkS
 NLHBdJKOuFUGHXg4M1YEdZxNzCIw/od/sOq996tjEjkVUXS100bRaYUoV
 ETMWTpBcB+vql5x508/Ip3Uji8jl8RqK22MBrQIe1gMmLLqRKFMjsomBv
 gJye25DOKR1B9j/1+3J23qnjYJp9qcHzXngJUE2FXsgsoMuQ+w232+dxZ
 oDX8lm+av4i0kdHa07H8+OOmZI53ukcCQuSqjsErHgblU4TdLh58zNaY5
 znQOrl/TH1lMxYIZWik2neL9tmcxkdZmiVoG3qAFNZPLiBt+F4aam5y6i Q==;
X-CSE-ConnectionGUID: rqYzMAXIQb2snEgXUkmg+Q==
X-CSE-MsgGUID: zXRCjILLQu6i3ZT3KMBXlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="96920139"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="96920139"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 21:36:12 -0700
X-CSE-ConnectionGUID: ro2WDjlSRKav2ynoQDrTSg==
X-CSE-MsgGUID: orC3pop4TVyL+XiZJ0ZRrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="258444232"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 21:36:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 21:36:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 2 Aug 2026 21:36:11 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.61)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 21:36:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIiROTKWEeDz6iKLXZPiks/og0T660MoLikQWvh6YHIoyugPLYjBCkKR9QD2zfjacYzgSqCRdvm1vsLxNYk0kh3mpotfq7KVIHzTkkOeKvOakUUwbJ7+nhLvHOyZ++ezUw5l1gKwADmLA+uwds1jY2/YoVS19F+Wdn3t8cXmtiiicUQzWIZLJwMoChh1KLQtbnyiGJvJsWt0DsZvFiTmf4zllMwQMd5xk3uGSsl9fLM25Xt/AnGKkNeoJuYTGQgcTZRtMlHfJo03R63vORhO2EPi/aktxCLtCcepbHompmXKE9MxoJuDtnwXSu+aSDQOz5Eth/BCa0/fXvBjw7Tegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/4ZYcdq0gh/NIFEepxyl9LRdXa5ys5ZrhBIMpKcowM=;
 b=Kc3AjErl9e3CGtUCuUKnbCipIaIvdNxWuv4XGPLdeG53Lw5xG6Xefx/ERiel15/Sc/Z/1kX6VoQiVVRhcf+QEFrv1xsOgnOl2aKANA7UFLdUWw3ZfRmcyLgnkGPWrp/QChquZ6GjTM0ensaGfK8yO4CJK6dD8pwggtHrsymN1lcP8wuX5cDZegrxCHoASb4BgrtsPE2jhy9dJHjpa8BC4JVDrKFvgKSDokL7DtKnyW9Co7nACLYz9Ru2eaJzypiDMhOHSAdwOX4YhxLHR75zJAuP4y6Jir2RnicZz4/DeDzlxcefXc95hmIqG9QseRD9ZDeNK4cSYeAqyU9qnhagmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS0PR11MB6352.namprd11.prod.outlook.com
 (2603:10b6:8:cb::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 04:36:08 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0270.012; Mon, 3 Aug 2026
 04:36:08 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 02/14] drm/i915/display: Generalize
 intel_hdmi_dsc_get_num_slices helper
Thread-Topic: [PATCH 02/14] drm/i915/display: Generalize
 intel_hdmi_dsc_get_num_slices helper
Thread-Index: AQHdIBQNsg+AaCuvkUChih/BI5o1WbaLwsUA
Date: Mon, 3 Aug 2026 04:36:08 +0000
Message-ID: <DS4PPFE901A304F7D63CDCF8A04FE08760BE3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
 <20260730105226.2731341-3-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260730105226.2731341-3-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS0PR11MB6352:EE_
x-ms-office365-filtering-correlation-id: 7291ecf8-ba50-4a5a-21c9-08def118bd26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|6133799003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: OtysfUv7+2O9nqwl2O1zZg426n2AI3lxE3gsc0UqnSW+bt+RFj0opRgVQxJBmIWFz3/2M0D4sD41KoBEfOcyQvmRJtSzNIhzazVKuNk8pbkyZD8qyJlsjrNhehOVcvuwKFIXnBysJVlPFTIDE8Y9nofvaQA0MhtU5i3p9NdDPB1ZsGN+4sCMWA/V7A0TNgqR/fwivsaEThCy7BcTqfOEfZ61k+fGGU93zTo1DvByWalKEQ4+qVokZVeeE3Kxs2Y598PlYlpkHZ4tMuNmKdn9GUlC1hv5b5SAtadcraEXcXR2OEN8Q/ptN/4CzcwJETTrn750JGeUGBj3Bsy9Hqx7W4sAR+ptKt+Szm0FxOf3fYCPfM7rCyhk8+C8dUL92piTW/8ZCqrHsLOWhnpiuNFeK/+M7SpWKsVMjer9B8jjEwOUzHOBMvkXpCzPC/zurw4y8zmLMzNfHi6NKUwIZoLiVz3ma59QwEx0gHj62/WsZU2gKWZLWkdL4kJuVAAkgpFWlpxzzdTpNE0SoWR/udipPd/UlG29SFiLQTlyCHMznyEtrnMMhgWXLGbsQxCrVpZqTdN8NBlh4pMHjOBulozzZXfgI/UNaawcP1xidmSPB3YnH8pW9aGH4IGwzAK4avROYqadml/CBZIkUJAVda8IO6GsmQd7ySYT6wCEaD4DfNMsM1Wd2/DIo7LBpF++M8d8UXYBCFWxm/XEe+3D9qZuuBjkZZnvvFjaf2sEIYpTNJk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sZO6iLYKkuymH8/IDzVRUocde8Ep75E7/vUPLB7727gOYiXPkWPz/gZzGpx1?=
 =?us-ascii?Q?C6G3VKYrP14j7sWQTlmocjhoxs07gurT2H2sYWw0+wr0nq2gEAjxlUZ51Xqa?=
 =?us-ascii?Q?7DqZCpc4XHFDGR/WIsl8Yt9Icru76X5JcruMbCiwTWTj3cr4pdAu/a8ha6qH?=
 =?us-ascii?Q?RpMyu+RzhisKBcmyfos48W6zZ2I/YAHghd2awvoaUFLcQTBD2Zib/0o0S0Fh?=
 =?us-ascii?Q?kPmlAigWEcZwHTWPHSejN7wLzRU/pO1vpcqfXfyZ1FWJ3rml8QkvpYEBL3D7?=
 =?us-ascii?Q?zErRR7Zw4MYTBxq9TH7F3btVWwR7XcHkp6PkDWtER36lDeD44LQDeMQNKtje?=
 =?us-ascii?Q?x21KwVgdGjFs/OcdoTNwQryTEHt295rTaXGO0W7a6KwK9GPY7WrarHQsVL7C?=
 =?us-ascii?Q?OSs7KEJgRZZ7O2bIsL/2U1Ok8Em7d/3GMn3s1YN6ssmOTqGIWTbSw5lRYl90?=
 =?us-ascii?Q?YOAhq16VViAhheUJrBGDa0r5066hu2MIp9236ifN6/eSaS9GnTw2SliwXaP9?=
 =?us-ascii?Q?+98dV/VftgdL1Wk7ed1Sxt96kDOYb9AE1pvgwEDD/SbqLBDbK398+D8NsEtL?=
 =?us-ascii?Q?8RmuzHxz/kqd/KYAMSSosw2vGfiaW+e6kvN29zKNbI4nk6/SjQ/5crUrtqqv?=
 =?us-ascii?Q?FLLt1nV5dBYg7/X8c35tEx1Bm8YPV0xrw10Gajh5OEp7plcmuzdsYVGE30w2?=
 =?us-ascii?Q?SbzlPk4OeTdh0oRHgBDtBafHKsxJIcKpRMHJW8sTu221IQyV3oVifWivru2W?=
 =?us-ascii?Q?/6RCM2NUPoKocH/gQHUUjyrI8/6HKz6sM+NfPSz7Iu0A78dSEtom7WPhjNea?=
 =?us-ascii?Q?PFy+ULBQgNI+4zjpxjUCs3B19Ljbe56iHwtsarI/lCYH5XYPsa1PqRvHFDxK?=
 =?us-ascii?Q?WEhzPS9En7QldGv7Q7+ipH1qwh9b5umeQgOo1f2iTTXAS9+x72aJoCELVPoH?=
 =?us-ascii?Q?XdLwnEn+FlSl66mtev67WukVZLFIFSOoGadCAR/c9kEqlHl0iz7fYZTtqwCT?=
 =?us-ascii?Q?jHasHNEtuJwVLOKvCaNPQ+wfdzXcG9dIxjZG6q+A6WUthtNqamRX0ZBjjNFj?=
 =?us-ascii?Q?aFSt8UBJWCEzvirC3dJ0ZHqo7+r/VmPXlmEdIyMPTcfrnu6eyF2+tfi9WjS/?=
 =?us-ascii?Q?UMW7S6jT0o2W5G16CcMzPIVG/UvnYh3io3WFHDrQJiHwjBBVyD0nbaQD2/8G?=
 =?us-ascii?Q?kxfLGbLUL82UNyN2aEupxdUKmJUNF5DXH2F/ZDkQP55Ur4hKIc33niowrBQF?=
 =?us-ascii?Q?y1GP4aXJITXh9GjCrbLOzxt0T7sVv4LpMyGKw1xMuxItDpZu++/2oEiPLFe+?=
 =?us-ascii?Q?pswm9WmPAKQAN9eh5DdxUX0PS5FVRUZzngSQPO1gputcH7DHhbw1OBaD2Enf?=
 =?us-ascii?Q?ZxkS3OHPNrMsgGfSVBcjVK60P/FvZHgAcwG3mAPAdYRBhRQi1uQB32et8JA1?=
 =?us-ascii?Q?j8au0PiX3UivwnoOjaL6yXcE0VFhZ4xMmJLvuqmFpOXrOPXZ7FQqA6EwpN34?=
 =?us-ascii?Q?zIcMvymH3DxfBXQ2TPfiXOhXFl5R1U+jlk4QGPhPYBC7oQLKctv2IJSzvs6/?=
 =?us-ascii?Q?ARPLUZMsRJtftOvxr2T9XsS2N1uP5Xx/l2uwqDe7qcIk4mdzNy4gSkSX2dLJ?=
 =?us-ascii?Q?yJ/2/biJ2qVn5De3qOMFluvHgjIgQe5jPJ+aKrEJgLqRHjoJAjc35wtFOgf4?=
 =?us-ascii?Q?I9qQPJUwZiGlD+ZKrwmmYgVQMBTNbmPEIOMrxSpjklfvwMRiZbqKzaX26IZh?=
 =?us-ascii?Q?3gSBA2jhOQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oj2PIWPMPffTLbZZHWIdHFg0KY0ivGFN3KvpK3fmS7E0RgYxXpTVzagpgWvP47iHClpof91/U62xQu3Vy7maTMXi0Yw0UUTzMfsTdRRHbh7hvY3L8DnOgRS6cUeuREefdkXUFeB4RauEEKcq8RTVG38I2lvavU2RsABeJIQBn+VV7OREqrZxrBT+edYMwd0J7ETpXRZyYUs8WLcGnh7JJ+R+RJVv69s4pHZ0HfVhM4C4EU6TiSJJT+ZJ7V1+kc7nl+xUgnYQSC5AJcrzZ8xcNEYD+bBq9UeoUNb+6WwJN1Q+rjXXuqQvGQNA5iRHtv8/XdlO/ZfR/MWR3TRnD3ClaA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7291ecf8-ba50-4a5a-21c9-08def118bd26
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 04:36:08.7683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rm71JsSABR1spruCPuckmZDuxWy9S4KHaoJK3wO6yJhATmQEZV+U0uCo7k6riksm0qqY9nSh/TSX7WrIA0eGPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6352
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


> Subject: [PATCH 02/14] drm/i915/display: Generalize
> intel_hdmi_dsc_get_num_slices helper
>=20
> Refactor intel_hdmi_dsc_get_num_slices to remove dependency on
> intel_crtc_state structure by accepting display mode and output format as
> parameters instead.
>=20
> This makes the function reusable for mode_valid cases where crtc_state is=
 not
> there.

Nit: *is not present

>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c   |  4 +++-
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 14 ++++++++------
> drivers/gpu/drm/i915/display/intel_hdmi.h |  4 +++-
>  3 files changed, 14 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 113d767e62e9..db64e6582286 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4316,7 +4316,9 @@ intel_dp_pcon_dsc_enc_slices(struct intel_dp
> *intel_dp,
>  	int pcon_max_slices =3D drm_dp_pcon_dsc_max_slices(intel_dp-
> >pcon_dsc_dpcd);
>  	int pcon_max_slice_width =3D
> drm_dp_pcon_dsc_max_slice_width(intel_dp->pcon_dsc_dpcd);
>=20
> -	return intel_hdmi_dsc_get_num_slices(crtc_state, pcon_max_slices,
> +	return intel_hdmi_dsc_get_num_slices(&crtc_state-
> >hw.adjusted_mode,
> +					     crtc_state->output_format,
> +					     pcon_max_slices,
>  					     pcon_max_slice_width,
>  					     hdmi_max_slices,
> hdmi_throughput);  } diff --git a/drivers/gpu/drm/i915/display/intel_hdmi=
.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 9af0f3aba0fc..228c5e2be164 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3216,7 +3216,8 @@ int intel_hdmi_dsc_get_slice_height(int vactive)
>   * intel_hdmi_dsc_get_num_slices - get no. of dsc slices based on dsc en=
coder
>   * and dsc decoder capabilities
>   *
> - * @crtc_state: intel crtc_state
> + * @mode: drm_display_mode for which num of slices are needed
> + * @output_format : pipe output format
>   * @src_max_slices: maximum slices supported by the DSC encoder
>   * @src_max_slice_width: maximum slice width supported by DSC encoder
>   * @hdmi_max_slices: maximum slices supported by sink DSC decoder @@ -
> 3226,7 +3227,8 @@ int intel_hdmi_dsc_get_slice_height(int vactive)
>   * and decoder.
>   */
>  int
> -intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
> +intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
> +			      enum intel_output_format output_format,
>  			      int src_max_slices, int src_max_slice_width,
>  			      int hdmi_max_slices, int hdmi_throughput)  { @@ -
> 3248,7 +3250,7 @@ intel_hdmi_dsc_get_num_slices(const struct
> intel_crtc_state *crtc_state,
>  	int max_throughput; /* max clock freq. in khz per slice */
>  	int max_slice_width;
>  	int slice_width;
> -	int pixel_clock =3D crtc_state->hw.adjusted_mode.crtc_clock;
> +	int pixel_clock =3D mode->crtc_clock;
>=20
>  	if (!hdmi_throughput)
>  		return 0;
> @@ -3259,8 +3261,8 @@ intel_hdmi_dsc_get_num_slices(const struct
> intel_crtc_state *crtc_state,
>  	 * for 4:4:4 is 1.0. Multiplying these factors by 10 and later
>  	 * dividing adjusted clock value by 10.
>  	 */
> -	if (crtc_state->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR444
> ||
> -	    crtc_state->output_format =3D=3D INTEL_OUTPUT_FORMAT_RGB)
> +	if (output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR444 ||
> +	    output_format =3D=3D INTEL_OUTPUT_FORMAT_RGB)
>  		kslice_adjust =3D 10;
>  	else
>  		kslice_adjust =3D 5;
> @@ -3315,7 +3317,7 @@ intel_hdmi_dsc_get_num_slices(const struct
> intel_crtc_state *crtc_state,
>  		else
>  			return 0;
>=20
> -		slice_width =3D DIV_ROUND_UP(crtc_state-
> >hw.adjusted_mode.hdisplay, target_slices);
> +		slice_width =3D DIV_ROUND_UP(mode->hdisplay, target_slices);
>  		if (slice_width >=3D max_slice_width)
>  			min_slices =3D target_slices + 1;
>  	} while (slice_width >=3D max_slice_width); diff --git
> a/drivers/gpu/drm/i915/display/intel_hdmi.h
> b/drivers/gpu/drm/i915/display/intel_hdmi.h
> index fb950fdd0e7a..4e2228ca0c5b 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
> @@ -13,6 +13,7 @@ enum intel_output_format;  enum port;  struct
> drm_connector;  struct drm_connector_state;
> +struct drm_display_mode;
>  struct drm_encoder;
>  struct intel_connector;
>  struct intel_crtc_state;
> @@ -56,7 +57,8 @@ int intel_hdmi_tmds_clock(int clock, int bpc, enum
> intel_output_format sink_form  int intel_hdmi_dsc_get_bpp(int
> src_fractional_bpp, int slice_width,
>  			   int num_slices, enum intel_output_format
> output_format,
>  			   bool hdmi_all_bpp, int hdmi_max_chunk_bytes); -int
> intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
> +int intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
> +				  enum intel_output_format output_format,
>  				  int src_max_slices, int src_max_slice_width,
>  				  int hdmi_max_slices, int hdmi_throughput);
> int intel_hdmi_dsc_get_slice_height(int vactive);
> --
> 2.50.1

