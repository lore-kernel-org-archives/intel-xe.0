Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73953CC6B39
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 08:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E15310EB95;
	Thu, 15 Oct 2026 08:25:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6730610E5AC;
 Thu, 15 Oct 2026 08:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792052745; x=1823588745;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jn4oGo+UdwKRg8meQmgoOQvuZs4NvbOq9q4lVzeXVzI=;
 b=jppBmipqUJF46stPDD33kK4m5/wNiBQGR1dPiOwVQcWI07JDwqtcYWD7
 weQs27f/t6Y6uPsl9nXQooOU/japn7imSigFpx7BTSxXVTD8125EXUIQs
 0eqfOgkE7IwMw0/zzwKKpcnylhWmjaCC8z5SIrAiOqaUT0xFpr1z9fWq3
 EUswqPnaxKmDadlZZMybNgqKWM2DQ8vPT0AvRRKN74JryVPneimHdu7Nl
 Jz8oujtpPzYg/V0fXVRp6RZ6bx8rQVzyqE/9Yt4DrjB18DpVgXyTEoifD
 LE8MwWAcQ+aDm6seJMB0yqkmfgySbFQFVziKSffLewS5jpGIIqRpeSHfB A==;
X-CSE-ConnectionGUID: vUwGSIvKQ9qrDzUvNRXJ3g==
X-CSE-MsgGUID: K9bYTjQBTKq4dBly4tL22w==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="703440"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="703440"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 01:25:45 -0700
X-CSE-ConnectionGUID: b8JZGphbTti6/bhol+J0nw==
X-CSE-MsgGUID: wwajVKzNSLW6D/sRohes/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="3469192"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 01:25:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 01:25:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 01:25:43 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 01:25:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htq1ztNJmZQ6zdo/uxwGl71lrYfDRjjh338eQzHzcesDxYXJnQ4lV4IBtDL+pOMQhhoYepnbRBB/TmBE/RhbWAONaUq1ZapKCS3TXbBw+USUB9aJ7MsAYBgzgVqYGvGq6g/FXqzaAWnZGVQvYcuNyl7nvwMBWmeGZc85z8JxaXC1LYHL6TcbkVmEkqybU/9eSZd+mJPosjQx4EfNthbKznqiGm2j3CzhbbbdhWy3iWlzujaHBFU9VNgBt9vfI2JC6Lb9tyEGreE269AR+0L5RPUWYbb56TfluiE8cjWKfQZ6iioKh1om2wmRAUjTZtfWYTbnt5djUpuWWi8pZ1iBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/8GgEQ23lb6F1bZcOjxn6RVVsrQKKnqqTr/PUW7ig4=;
 b=r53jj3cBpXNHSNU7mkQTHiHOU27CQsKsOYkuRNgbed+S1cveM/ICXPtN2IwBPTp5jxqbXVZO73LJGjTxaxBq3dWC/O/CLCuylP5JVF6qgmu/kg0vOzgd0u42BiOmpMiHR8+LaDOIKadyTqWydCwUtDXIkv1+yRlswZr6yTCCllBZW+4YrLKEi0BL87cmVjDpx+RnwVlIjP7PjwkNIvLzbiMPdnQlevnfbhL3crXLfODqTs5sr3h4baMgk0yNG3qRtjpKXtvyOh4s/3k1kSf3HH/KdoP6xTNbrmRkwayFdu4bKQULO661SAjXVY3Re3sSv2M8KxbHzza3vv9XlFfRyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 MN0PR11MB6206.namprd11.prod.outlook.com (2603:10b6:208:3c6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.13; Thu, 15 Oct 2026 08:25:40 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%6]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 08:25:40 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Charlton" <charlton.lin@intel.com>
Subject: RE: [PATCH] drm/i915/display: Limit scaler count and disable pipe
 joiner on WCL
Thread-Topic: [PATCH] drm/i915/display: Limit scaler count and disable pipe
 joiner on WCL
Thread-Index: AQHdVi4dK4XjX4Sn0EGYFfntOht3ubb+UKOg
Date: Thu, 15 Oct 2026 08:25:40 +0000
Message-ID: <DM4PR11MB6360C35FE5D3B33A5428667AF49C2@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20261007072334.1801956-1-vidya.srinivas@intel.com>
In-Reply-To: <20261007072334.1801956-1-vidya.srinivas@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|MN0PR11MB6206:EE_
x-ms-office365-filtering-correlation-id: 11bf6488-bd62-4dea-9c5e-08df2a95e5b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|38070700021|11063799006|56012099006|10067099003|260925022911599003|260925021911599003|260925021311599003|261009223027099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: aWg/RNKQ78OWSSHXVD16Lh+n4Wm636S85XTS9nznk8F0LaHXAeF7ipmiDCIa0V8ygA0eO51X622jp+ljluUWtfzgPwo2+DORmkAoyI5Hy7I5BOdzS2BqSQ0i6IHKkbWwZP35YTm+lsofLLfLfQ0MSw5Yq8xFCNYtL/VbDGVIkOeCdm2FwLg6T8UUeCZU93vhCjUacav+fy86wGxpBsxwx9WWOj7MnQQEeNITfIjUKyBE7WS2Q+KP+ZKmnfs0QxscoZXdJimp8UAPIjRq8uXjPKu3/Pph1oeBN1q4tniGzNCDh3Z9zNWdGbe1XCKy9vBylDrzPyguP4iceqhW+p4NkKhFzKAX69PTlfUvZchBwsa96yH53siq2hrZlJ+TMR2Bguu8dxs8Djbuz3Wzy9tSSwlnV0T/L3sZJeQ4wGs/CVY0fXLVlTtH5g+n91nWH/Zpq2Eieq4/eUyqHwYyk6BBOKqBzaUj+7OKTR2B1rjGMz65U/o+47bJ71suiLB7hRbpG6DZUIxOU7nyUyD1uEV1CueGRvY6JJQxXBjiSjuSLs6Ye/z8vkAE4cY5h3vexVkHgcUNF041CgRxWtxaX8ICInD6pvlK4/uOXWwxe2ixt44Aafs1yJ+hmh1FtzwkAlm186PyDoTf+hT7QtleXymQwAmvuigz3d6jcNI9Qjxc7Iv2I1mvXbFOnn8MnzTe9FsedMW/nNRsbrNY9oThc0zdGmkuEC3STzTL52ONo8siE3M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(38070700021)(11063799006)(56012099006)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yuGQWg2sL3f1dQRORAF4mqZjM67e6hNEMk4XAimf0aT0c7u87cvEs0JfHQl/?=
 =?us-ascii?Q?rWXmJHPTVE7T18/zIf9e2pShjRe9idH1lK2kVGGpfQgy47dQql1j5rn1h1lo?=
 =?us-ascii?Q?0c+K2RpflI/Ua4/sjCMnDSTksCXSrj+eDTwUw7aSymkD3FCdRCWj7GWunCDI?=
 =?us-ascii?Q?SHb5OGLmbdnE4GGMAVt9t18W6F6BT7rzFipUQlRuJZWV0S8/dHBQdo7HshbB?=
 =?us-ascii?Q?0geUNLsTDv1OgiI3/ZbOOEypyFe4Xh2+4vn7xTWYD5bfsC2Tyf/kBdneb6Vq?=
 =?us-ascii?Q?9K/h0BG8V0tfRxUwY9nFO7JsNNZaGBLUUvSfz94WkSOKyoXMdBsGhn/+qFyF?=
 =?us-ascii?Q?ZtxapnbVxel2Z5kGP9TTTdzR87RYMebmvx7qRGBB//AjaoKbS2Fk5RBGoW7i?=
 =?us-ascii?Q?xW/s8gTR0siRD+W+gVrDS3leC2DYlEpfi1jH5irebIjfbx4onhVeIIEDHCyG?=
 =?us-ascii?Q?v67bVB4DSHQfEBTE1vAfd4C77ctMiSXqb9T2FgA4VRTk+mrtCszr2HmkzL8b?=
 =?us-ascii?Q?dhtFKhAapaCZes24AteFKFMtamCyUokpmlo1h4AMMFHGdaPkLba2727CDS0v?=
 =?us-ascii?Q?Ulna+IeRgGKWx02UaOgnyauNBNlm9G/STkE4uQjBlDFgrdumz6zI9a20+BGa?=
 =?us-ascii?Q?/1oWW2ak27kgcmRkjWIH775aKcB3S84GdeD4Ql85Ti+540xCqmUck17Ctfwc?=
 =?us-ascii?Q?krodLfXTkwr6Ov+3bj9ebU38OxlK6+sM4v2B0Z7V8SnCIhq2K8VoIhyhphFe?=
 =?us-ascii?Q?TBhUS4edK6/sFC8gfrEqBQYZMNbq6sAyRm0Kng3VUKzLdxDFgb06VdkyeB59?=
 =?us-ascii?Q?iwCR1FZ7GwgUcrNtJMJ5qDtRYNOlGys72R7D87kwg611iEU4pMB8EOnR3QLr?=
 =?us-ascii?Q?QhDmr9HG8XkrohpXt0st0P5cJvPlbnVOVICqei3TRS0mhHHh8l0Gsy3unTNY?=
 =?us-ascii?Q?MZGsM5zxFk9l3PSxNGAnS5cArI34pr8PRORSl2YZWME4hb8J4uWRQGYUCZJD?=
 =?us-ascii?Q?cja2L6LD9KHt+B8hn1EeB18YBTpYTOMjU6AhQTd8hIy+dr7nCvFrhL/OBjO4?=
 =?us-ascii?Q?TVYUiSeb1TRMvbAr9hbEZyCowW+6Mmg3CakK4WTIYvfxENTz1IvCA/FWmE+i?=
 =?us-ascii?Q?ZATiZX12dCz9HxQKNURZoJl52T3p3NmHx2b7uD/EzzoH6T6SwT8E4IIW7Lnk?=
 =?us-ascii?Q?+DrqCnsx7u0YJB611Ru/se+5Jh9sC8xuVesY2J2sENPzduvI65V4GhYZF+yi?=
 =?us-ascii?Q?m13zw3ZVXSStErLxiIpv4DsLQI6D1iOJfbnUUCRhBh/njZX+faWOcbsaJJ6K?=
 =?us-ascii?Q?q/F9zZSnGsxTSwIWtxg5AH990qgCy+exw6XwerYBPa5ZIvrE1nAswrHPebZ+?=
 =?us-ascii?Q?KnyYWl5uGXvBcTZ1Bi3GpARdXrV0E2jKEoUxD9r/PrFcjmI9FihwTcv/mNZb?=
 =?us-ascii?Q?7POJXPTb2YPYdEVMyo7hcuKugQYrt/aTzdu+r5GKTMU2sYoRHy/3Th0H0+2M?=
 =?us-ascii?Q?7iGGIGdVcBRSFUbxxCCQQStngoMBBCUBm8ssYlRz5U7xtnJ0HN2LD3rEEORU?=
 =?us-ascii?Q?ESPm4bxBhUy2z+D6YgaFnHyUJDUxGGIPdYC0X3QpeYr77Zp2/JQBMxjRhWt1?=
 =?us-ascii?Q?6RbaoBsYSyQLKMVT+TzG8MC5NwM/t1+f0XPwt3yz6pwpI5ddq/N60kKK4gSU?=
 =?us-ascii?Q?GFOR+q8fChUQdLZG067yR9MxpahC21JC76NFzHH4sQYQZQ2Ok4tsgeoaHxna?=
 =?us-ascii?Q?bcOhP2CTng=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 27jg2DUp/G+LrewREmp39gzHrh08Wnfsri4+r1VMGH86vupUsXjYVecIaLcaBBahMHRMKpj94tvhdjCeFdvlZKXZD4SMfjG835YheWEo0jRaACSZCyQmf7yqXUi+r1tIHRghA+CAxKDoORDjvk8RgncK94Ucm9Okl8Pn5IwAHjgIdMzGDxSypzF1GdBx0smyuZW/moIBdfnT3BLikFZVQTz9/Yy0Be4IEoM8gzwGR1SM5fXBnLx395SiqWULv+fOuc2/3CLCZF3uZNCc0+LYkokBNJ3U4Dphb0S+DLe3U6Gcjum7oD4GETZdZ8xkkld4UEMLTCB+ujixSyi1umsdZA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bf6488-bd62-4dea-9c5e-08df2a95e5b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 08:25:40.1947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E9R///sw3z0J5uUXeyE7yRA7IpJhb0SDOuGjrijg7uml/tLUGZ3EGFAfFqUw7CrsKT61MFkQjXt3VM8gGz9a4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6206
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
> From: Srinivas, Vidya <vidya.srinivas@intel.com>
> Sent: Wednesday, October 7, 2026 12:54 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
> Srinivas, Vidya <vidya.srinivas@intel.com>; Lin, Charlton
> <charlton.lin@intel.com>
> Subject: [PATCH] drm/i915/display: Limit scaler count and disable pipe jo=
iner on
> WCL
>=20
> Pipe joining is not supported in the WCL display configuration.
> Modes that would require joining are rejected, matching the 4k 60Hz maxim=
um
> resolution documented for the platform.
>=20
> Single pipe scaler instead of two.
>=20
> Bspec: 74286

Change Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Suggested-by: Charlton Lin <charlton.lin@intel.com>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_device.c | 5 ++++-
>  drivers/gpu/drm/i915/display/intel_dp.c             | 4 ++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c
> b/drivers/gpu/drm/i915/display/intel_display_device.c
> index f17fc2c68472..c74256359c25 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> @@ -1813,7 +1813,10 @@ static void
> __intel_display_device_info_runtime_init(struct intel_display *displ
>  	if (intel_display_wa(display, INTEL_DISPLAY_WA_14011765242))
>  		for_each_pipe(display, pipe)
>  			display_runtime->num_scalers[pipe] =3D 0;
> -	else if (DISPLAY_VER(display) >=3D 11) {
> +	else if (DISPLAY_VERx100(display) =3D=3D 3002) {
> +		for_each_pipe(display, pipe)
> +			display_runtime->num_scalers[pipe] =3D 1;
> +	} else if (DISPLAY_VER(display) >=3D 11) {
>  		for_each_pipe(display, pipe)
>  			display_runtime->num_scalers[pipe] =3D 2;
>  	} else if (DISPLAY_VER(display) >=3D 9) { diff --git
> a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/=
intel_dp.c
> index d8c0d9381471..47741957935a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -477,9 +477,9 @@ bool intel_dp_has_joiner(struct intel_dp *intel_dp)
>  	    !connector->panel.vbt.edp.pipe_joiner_enable)
>  		return false;
>=20
> -	return DISPLAY_VER(display) >=3D 12 ||
> +	return ((DISPLAY_VER(display) >=3D 12 && DISPLAY_VERx100(display) !=3D
> +3002) ||
>  		(DISPLAY_VER(display) =3D=3D 11 &&
> -		 encoder->port !=3D PORT_A);
> +		 encoder->port !=3D PORT_A));
>  }
>=20
>  static int dg2_max_source_rate(struct intel_dp *intel_dp)
> --
> 2.45.2

