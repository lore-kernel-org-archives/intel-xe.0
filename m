Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF82C44507
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 02:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E5B10EF3A;
	Thu, 16 Jul 2026 02:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1AM8jd6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F5A10EF3A;
 Thu, 16 Jul 2026 02:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784169713; x=1815705713;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BwDev9Sw9+T2qAzf1jzjYAhgiO+IueXoPkYFisxgaQw=;
 b=e1AM8jd6Yequpd3ciIKpbRfY5aYIi0tPWpoxEiOQUjQZ1t/PCBskC8pS
 u38U6Y7SbuX3P3FCk+EMvssD4mq6IKiZXbIMBfVb5sEtaZIEZDc0q3veY
 RgoqSeJ4xAYl+uryfvt0tZl03eX2YrrTfSoPu638OlcPjwPrgS+w2ZFer
 10FJNLHoapHtWfdTwu79uTNu/hCd9VMmpUR/a4ts08UGWZkZgfovEkNWc
 bki/1lak04ENRDpF27l3xXfhJTEL+r21rDLGEkJi8Llq0leT9TceUAzt7
 yPC8YV7subDUb+1kh3XA1Xvua3aPgBgM2ldOV7Oi59ioU33sPGHX44UkO Q==;
X-CSE-ConnectionGUID: hKpcsV3ZS06GbJWDtKaH/g==
X-CSE-MsgGUID: auwzPKEnTPS7B2wHjAO0kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102248102"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="102248102"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 19:41:52 -0700
X-CSE-ConnectionGUID: JTouzu+fTByhdHFtr1HcWw==
X-CSE-MsgGUID: /G8Oowd3Sl62T509SFUDJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="259938490"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 19:41:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 19:41:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 19:41:51 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 19:41:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnBkQvhomeBzY2i+w8kQhWJpsxwAJ/61XPMS+/zaHpeab90PGSEYPj1BleB3PAo3i9kYM9F3lBSrZWWzQDFMYw9mZ9Y9gnZgInwoCYC/oppJAkeoFXzp1Xc6tifZ3dFnZPUPobSflO31oWA2kdFcvUFDlwdmucr17NFY3mmYKzu+qnSdEy1gDmvys1lTNN/k3N/7bpgkUOuIjcQnZ77OM5mbmVMdA78V8kcPKr94k5Q2GErL1OopNNcDa/Lrndg6+rXwBAZObqi6r8RiDO6EnvzRhhs5kn9t4IjcZK2HyQreEaIwfb1kLMDtt4bc62kZO4NwufVZ/EiZ+AFq2pn2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9G3LB5M5gYi9TfF3epjXQIk/uKP9vBB2cGhOB4sQthM=;
 b=seapUBUG0QplYQzTlt7bSyPBsFZgFRTMDQkkwSnsi8XiQG1nFBYv8R0ccgG8Gswqg5khcT1VN/1YsZYw7Iy6JAfPnylsNFRbcLHkhzMF9X4GsCD+qC6AYhpPh+5btD9XkATHBItTOsps6CYrbZF5ajV/uuWbhaptDxZNhyaNReYjXKc1TaaM+PaXlN3re5BcKrczixDjdW2qZIEw7xeIom45y1MuEIMoHe7+qWQWTu/+XxqwJhdjNTjrlX4mrYY3pBLQVNLZhrA+8FHx22KWZE6bBoX28/DiWk3uRmsxMftDf662l3dPPgRW1QvKpemSUAXh+nJiqSpVcYTfM80UIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH3PR11MB8094.namprd11.prod.outlook.com
 (2603:10b6:610:156::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 02:41:43 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 02:41:43 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Subject: RE: [v3 2/2] drm/i915/xe3p/bw: Update bw calculation to account for
 16 channels
Thread-Topic: [v3 2/2] drm/i915/xe3p/bw: Update bw calculation to account for
 16 channels
Thread-Index: AQHdFGQu/J6yLOu3pUS7tCooUWgW5bZvcCOw
Date: Thu, 16 Jul 2026 02:41:43 +0000
Message-ID: <DS4PPFE901A304F29E0E5931701F3FE6390E3C72@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260715143243.4141208-1-uma.shankar@intel.com>
 <20260715143243.4141208-3-uma.shankar@intel.com>
In-Reply-To: <20260715143243.4141208-3-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH3PR11MB8094:EE_
x-ms-office365-filtering-correlation-id: b9a7b5f6-19bf-4584-a9f8-08dee2e3c57b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|38070700021|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: dPolF3NDY2+VHCR0MWrt7tj1nLVVJ7i1UudhyeXhUt/Vi7ki/8IRr2D85ywU8S3qjYLSuuhsBxQVT0/9bYUXRTZZLaJC/R6JTy8bvfKJhnOFpFekz3aMMkHSdRUKWw7niVcZq2Qj58HoBI5BEB+JF/gh/J8PQhaiW8e/gZyqgXkJHA1JaWPkqwHiB9Bj3n+LISjyDqLBZWlZRE/c0LcMFIh+n0YkPLBBBV7lQTZ8GTEA2A2KGLN4ubuJDeb9yknC6qjT87rpQpLkYoorONgjmg+A+97eQQcotXMF7nT0xTxgIUdtO+Cv0nYvj1rdGfpyaw4foHUE5b4NlJbtsEAQ/YV+O8xA9qh6ElxhLXyg8OlMO7nSeusoKXeAlTgqpYVgDzbfgdkmX5qHUY+jfO6rutiAu10qZD+x6MFebD/aVcruqUwg8iQBbak9tGlYdTNvxjEN7Du6cMrHXFEu+EuvHCfmjiw7qF31Rn4u+/HoJiPpiAPLQBHw3yvjp1v9tW96CkJO5h8vznWYDvFuNlDBvF/NnwNCYvFn9P5nHDtOkkZ+A9prc2q/qRwAJYO3xi+DFc62cg5R3ULHnAbBS0BJWQUqSgBJ+QGawvnOThKr/AI4nIai4HX1vcw1mxB4Az7qbJoJZXRKDFaK4OfYdIA23stW+IgIXNKCkmFU+C5MpPcnG+0BN2emUpwnRxxN6uNUd/s3EjMeDYJNA6V2KaxjorXM/u8eVTcSQincxjmVgfA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pxDgsq9JP8d9nQRA1O4vT8ymIV6riLGyJyLijVGVQZVL0NGeGWGCpejD2Ipu?=
 =?us-ascii?Q?InhXVNUGywNVsNK5MwLU1/d61vk+g5TwDSWAv6mx7hISnWTYoQ8WtOgxkym4?=
 =?us-ascii?Q?AoEN/CPMKG70LC7mPOC7N2LPp7qRBi9j/2iSOGKuebn1LQyTUnSFWx/qezry?=
 =?us-ascii?Q?GbuI2TXw0ERDAGanArWa00TZ47A6e8IWsaEGtgg6SZYk/TrLl1VOcun88v+9?=
 =?us-ascii?Q?tmkwUTvH4a7OQkLNZ/I9763NGd50IR3Vnrpqx3VYcgWcTyg6i6+3ZlJP6aDH?=
 =?us-ascii?Q?l5uzdsjXXPQhNR7Qg/pJ6d8pHDYonWd7aIPQfgRec0bM6rt1sgzsrwWh+vE9?=
 =?us-ascii?Q?fZRn0zFGhh+0/eF4e7553Qarpjq/M9VHsM4tX9uWCHk09+jxeI9u+/0RQI+J?=
 =?us-ascii?Q?yWWKlGph2yPwPAv54zTIKQfnn26gQRYhmrSaZugv/2nAyAc6edIE6MAQSrdC?=
 =?us-ascii?Q?i6SBP2WDsQU1tV13E+Edz+iH/pQ8Zc4Lq+Fb/yNznteZziQt3EbjyPosH7Zd?=
 =?us-ascii?Q?KZ+SWOv1XkI4bX/yLyjXsJR3ulcg4tvWI0m77Gp7gf4mJcrV6s40nkATfxnG?=
 =?us-ascii?Q?ZxoaYoMr2zbVCMVhXvgLN2ISl33mm3dr11cuVKJqoTwUl/+gftPY48QhK/4W?=
 =?us-ascii?Q?eJspwjkxO0w4VWWMjwkeJfnz1gWIBrOjB3l2wHZIBUAi59bSRv7lHh2XgD2A?=
 =?us-ascii?Q?fqaA7dnCMRIItZJdwTzDv4VDxlJ/+kAsV1P7/ZP98ijB7NPiHUjxMcpQhEDn?=
 =?us-ascii?Q?UnYHv3Op1tMe7OMRWzJ6zudeAaogWQVRxVJqsqw6Eb1UyElt3nT6U5RFTf5U?=
 =?us-ascii?Q?LuBen7datRU4aMX7Vi88S1Y3RXSNYUjAFtDJloY9ZtMRcyIbWKwiPvBqEfRw?=
 =?us-ascii?Q?4imOY2lx1bGr9UbvntL4c63JUzqI21b+MIX/YZDA2RZ4ZRUtenzcwTxs5Kpf?=
 =?us-ascii?Q?weQjTcZakkyVbhapv2MTlK24rGY+AflCa96KsjraJ3y9iHFrBh7pebNqODwo?=
 =?us-ascii?Q?zfiqckjJ6b/5xm6OSLdmsP0KMIaB3RUIikBOTKfPYuayewa7DOGhtPx5o5jq?=
 =?us-ascii?Q?P+jDHG7cJ9y2Uyz0bA9xaVN1hpTxlwz1GvV6hUsLOt12yDqB/tzfCckIKFq/?=
 =?us-ascii?Q?hJlenIPTV9dsGDz+TgyctYViCDucFvPNxPGW59t0d51G8GEpnML7Vu7mjGhm?=
 =?us-ascii?Q?0aMvOL4y6dFoZF7XVyTpb6ypFxXFvIxh1ZUFNuf0QFs8VcdLh8MbLOACzyIY?=
 =?us-ascii?Q?VkdoidLwgF/47fvySLLxTwBgK0sdZRE6D7QFBIQx3X7qSs2mQwlqV8nPh7Fs?=
 =?us-ascii?Q?NYv8Jw55ie0nXL5UG2KpYgoxaEmT5fNxwVzvXiqiDlFLItoz1+8iFQryNOL+?=
 =?us-ascii?Q?KVI5ZeGQGUXPYP9qDWU6uy4MTcfAFb1cJLjSO5NMEMSglwk/ErZyuki0kc6n?=
 =?us-ascii?Q?vb1tzuoyZ92Wlj+ipkeXimdWp1qOl4jhvlh5kP0iOooOsbsT95rtD/4NzBjf?=
 =?us-ascii?Q?te10ut7TZDzovioNbv4/ZWRybXyEQGOzZt/5apOrfeEJ8kr08PxPuNzQ2NSo?=
 =?us-ascii?Q?Ic+mDc2s/M7GS5OOByzQi7yJJYHa50O/yiY/qrnIFakGYTWIrWiLXxrqAa8o?=
 =?us-ascii?Q?F56wqoXBO0+TsxGscxDxdd2q8Thqsn068vw9ccd8lTlYK3nlybIFTZ4LKIuW?=
 =?us-ascii?Q?TJl4TX0j7LVYuttVv9LIKx0PDoFnULArTFfIIx3AjR/XuCYRBSPGabPUWk1h?=
 =?us-ascii?Q?BQ7HFBHxEg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: q1PXTPiy/7yuO2/VdpqLME0BJTDOwEie6CymHwpyaJeh7/8Qb2u4IAEvQyMGhGTrUrS2ydke79FTdY17wny9Y55AkCKjQtHoHFe2le0AoHuqZ+cHx2oV0JuUH9rWVAZrznam21BRJvUd/wNBwjARfJqtRnjxUV8Rrrm51oJJAi7EbytRAM4k3bWWUqtJxEsLuFIiISP3v7K/0pbYZRpNor+3hvNvyjxzgTd+OdY9V24BGUc1JRUfBqr+Y/9iZmlbPKRHAj1TLVlSULvosvypihHn6r1dF3JI3wVZ5/HUuIhmg4YIexsXc/ScYmXWY4f2gdvfXkeVVcRgNpjMPQmxGg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a7b5f6-19bf-4584-a9f8-08dee2e3c57b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 02:41:43.1246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +hQMy93oe7mcPivry+zb8U0gI5WHniAEmY2SQW01EKk1b6gXLo7SZR+pj5VrPjKaFM+KEYEoL2jHxDV3FDQOOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8094
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

> Subject: [v3 2/2] drm/i915/xe3p/bw: Update bw calculation to account for =
16
> channels

Just "drm/i915/bw:"
Can be fixed while merging
With above fixed
LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> Wa_16030862157:
> Update Bandwidth Calculation to account for 16channel memory config.
>=20
> v2: Logical separation of changes (Suraj, Vinod)
>=20
> WA: 16030862157, 16030875223
> Bspec: 69131, 68859
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_bw.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_bw.c
> b/drivers/gpu/drm/i915/display/intel_bw.c
> index 41539fdfeac5..aaa0350dca78 100644
> --- a/drivers/gpu/drm/i915/display/intel_bw.c
> +++ b/drivers/gpu/drm/i915/display/intel_bw.c
> @@ -14,6 +14,7 @@
>  #include "intel_display_regs.h"
>  #include "intel_display_types.h"
>  #include "intel_display_utils.h"
> +#include "intel_display_wa.h"
>  #include "intel_dram.h"
>  #include "intel_mchbar.h"
>  #include "intel_parent.h"
> @@ -272,7 +273,14 @@ static int icl_get_qgv_points(struct intel_display
> *display,
>  		case INTEL_DRAM_LPDDR4:
>  		case INTEL_DRAM_LPDDR5:
>  			qi->t_bl =3D 16;
> -			qi->max_numchannels =3D 8;
> +			/*
> +			 * Wa_16030862157
> +			 * Xe3p supports a fully-populated 16-channel LPDDR
> +			 * config (4 memory controllers x 4 channels); earlier
> +			 * D14+ platforms top out at 8.
> +			 */
> +			qi->max_numchannels =3D
> +				intel_display_wa(display,
> INTEL_DISPLAY_WA_16030862157) ? 16 : 8;
>  			qi->channel_width =3D 16;
>  			qi->deinterleave =3D 4;
>  			break;
> @@ -624,10 +632,16 @@ static int tgl_get_bw_info(struct intel_display
> *display,
>=20
>  	ipqdepth =3D min(ipqdepthpch, display_bw_params->displayrtids /
> num_channels);
>  	/*
> +	 * Wa_16030862157
>  	 * clperchgroup =3D 4kpagespermempage * clperchperblock,
> -	 * clperchperblock =3D 8 / num_channels * interleave
> +	 * clperchperblock =3D max(8 / num_channels, 1) * interleave
> +	 *
> +	 * The 8 / num_channels truncating divide collapses to 0 for
> +	 * >8-channel configs (16-channel: 8 / 16 =3D 0); the max(..., 1) floor
> +	 * keeps clperchperblock >=3D 1 there while preserving the literal
> +	 * truncating divide for <=3D8-channel configs.
>  	 */
> -	clperchgroup =3D 4 * (8 / num_channels) * qi.deinterleave;
> +	clperchgroup =3D 4 * max(8 / num_channels, 1) * qi.deinterleave;
>=20
>  	display->bw.num_qgv_points =3D qi.num_qgv_points;
>  	display->bw.num_psf_gv_points =3D qi.num_psf_points;
> --
> 2.50.1

