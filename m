Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45703C5DF9D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 06:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF14710E3A2;
	Thu, 27 Aug 2026 06:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AolVikEN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353E210E3AC;
 Thu, 27 Aug 2026 06:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787813357; x=1819349357;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3lpsE7qx3bBmPHrbPD+62cjks6PAogqkRfpAvW9d9iU=;
 b=AolVikEN+ceDoyrTws2mC/DehNwB2sGH8PchXMGdRrRBXzBk0y6nPahQ
 Hafl6TAVCoyeScOlxa8ZbHOirPUZDWwzZfzUeTK5vM+fg0ymaZbP6B5bO
 GAcJK9k/CFa3moofoEf8vXkzVu8voBUUwFXbqUfq1gve7Qjbxj8fcosmP
 PDh94KOkhVR6Ggp5OSCdO/t0+ylgK03s8sD4yNGk7GsTqEUYoDt3Mopcc
 YdgsTAz1PXQRw5T5tDcrXUJ17wyauOpZxxeKxtxUgWho1yNpdRXy2xPNy
 +sDKIDLBFksThw7xZK0DhW3LHMy4Uvw0ruxmmGXjNlu0ESl1nBF0nPchO Q==;
X-CSE-ConnectionGUID: naVUJQ9YSNqxGfrKv05NjQ==
X-CSE-MsgGUID: ZXESrUnPRiWev0+eR5+MmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92123264"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="92123264"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:49:14 -0700
X-CSE-ConnectionGUID: F/INr+McRFWOHz472C/nGQ==
X-CSE-MsgGUID: g8Dyob7mTGaiFRmUZG3UVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="263515284"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:49:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:49:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 23:49:13 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:49:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0OdC+HA8aK8pII6uR43EsKyAklaW25C74b1mAVGH6/oE5Px+onu2xdwk4lrJz4hy/w3DOmsl2EtAyIgxAwStpkZcVbnu+CQTDL4dzZi77xVPMRw0ZSb+OLuMB1YWaeXEPZJ0Yy1uhQ0jIihY6aCQD4/1Wdt3zHmtVOm7n8ZRO2pa3SgcJyBiyjGYyfDXS/3WjMt6hyQTMv4CXIjqBAeaOqpI27B8DefFPXhAFjY677vZyp+4pZl5s3e/73plIjgsegc+jd3p+exRyHOLKYLYkjhLDAe80yNV2RT1NsExuCI3ugHpPodfb5Vhn19M37G4X+WOxnmr2X9fVL3ybRQKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlRAup6VEsnhCeEEhYzpo4pKBx5wv/icSmFEF78+ASo=;
 b=qmGJgXNtCfxZhETLtPa+ERFc4Yh7Lqz+LRRDPTLkQHtlpzdmJUqWoJ24ZOnTPqTB0jCi1GEej56vFhGx0X9rqwOjbZo0yIc9qkgt5jnVw7QxgDTOx/rTmVmYkIOdrFp/PWCrcxTO7qml3ilusW9KOaOSJogTC4bl86xTT7SsG6tWXjJ/hHmqXPVr0IqS9LR3+1QEp+19RcmomngCEETFmjFxEJt9PpQHdNLmVIIFKLvw6h80dPRfaUgsshQxutwXfphNLulycK43qk833KPQTrzhAs2t3g/97Pn6u4KHpn1HU9MnIcR3qi1vOS7HyL01IuG75siHSoZWI6Bv7NOtZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by MN0PR11MB6253.namprd11.prod.outlook.com
 (2603:10b6:208:3c6::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 06:49:05 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 06:49:05 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v4 02/12] drm/i915/vrr: Use the helper to write
 EMP_AS_SDP_TL register
Thread-Topic: [PATCH v4 02/12] drm/i915/vrr: Use the helper to write
 EMP_AS_SDP_TL register
Thread-Index: AQHc+XcoIFDjJKfOW0O7ZamQRk7LyLax7TeQ
Date: Thu, 27 Aug 2026 06:49:05 +0000
Message-ID: <DS4PPFE901A304FC5F00ADB3C0274555349E3AD2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
 <20260611073316.1439306-3-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260611073316.1439306-3-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|MN0PR11MB6253:EE_
x-ms-office365-filtering-correlation-id: c779a42a-d32d-4f61-3875-08df04074981
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: fNBuTZbKsZzJCm5Dw/W5rkysKn4QMdBt37UoeUp51qblyMhSI8M7Kesr8cps4Yw5kZEiQVtVTmuaZDuYX++qok+qAmyk1iGnd70tUR2RzDWA1KoxjlzOovvMGK2SpQ5c3fRPPGNUTSlaUqRtSM7VnZIjL/yA5U7J/np3iYUcvHZSS0+3wwH4NAywINqZz59dhnagw2SNhxM5A07EiyvdI8OMOpuAu7YiAyba3X72wTbXBUxOrs/Yzb6p1JrqEndrMO9eoH2idrqp9eXpvj/mqUkjC78u0fE6/t7Dt/DoYuF+jhBDO2PnMEvZY0PKLLww/IrQV6eOaE/L0Xu1Qkxo8Q7gyI2/1xTwD8GOquJiNnJcmvqfb4wN5WXUjMQF8BbHpYIYFiiHWvi4NV6gUPamefzur9WgqL5F/lB59K6vqE5c9xz2IEyAggSSLx3Y3tgKg8P+4eISPnrzBsWJWYnn2QfsqhJL4CCHb2AuLTv+wmJsWj90j2eFoiEvmHgpvLeb3OuyiEixpQ/Z0IW2NZq6GnY3Co/37J3kE8ibdilfilYPHBMIT8AcAIQEEhZ8derGysx2mUSdr/gRcxtQQ5qwCVkIgNIgPFCavBGZzZH6E46xS7K1D03PLDAj7LPFM+8ywB7n56Bru562VWZa0zhFZbVnGVZ4zh0T5HplgZ0PjJwhPEKQ+8xixXp9G0YGU9RFJlJrPa9+SzcUdi0A1HFdzhD6xFvWvR45dqty2aKHcPU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0cHzCLSOVSE3kbBzHHy52OPESRL3mTkJfucSQmNTyDxJe/b4eCzB1WVjLR1T?=
 =?us-ascii?Q?VCtgvHs2/0mx0Q67Eq29jIEqajnQuGebU31v4b3PCj+UUIzC3jaSu6v5R6SL?=
 =?us-ascii?Q?oza0DrZtcq1Uks3PDkQdWmjOtrLnNPN1Hc9QlrjRabt+VXxS+xxyOuu8RgkG?=
 =?us-ascii?Q?q1LounnMjG9cFbh3y/ZrS9bXKyJeih8TjI81+5sCuOv2zu04o59KhVyvbqHE?=
 =?us-ascii?Q?wHLAGsW4Ne/cKMSWJPidVG9BqnCwzCl9w8wW7JxPv+yt9clGGMURZo/CRQR1?=
 =?us-ascii?Q?HYToLG4m6gxEDeLWKtuTKlj0+WE6js179e4QvCYTkFRypc5h11wSVh34m4zH?=
 =?us-ascii?Q?infUdmmHUsk3x+38MDDpi/EicMAhX0+pUKlGzsVxb0BVNp9FGYXfSXafrIsC?=
 =?us-ascii?Q?pOjvHRz0erHInB9hRHy4PMO8ZE1vWL6t0bBibPY4ycmvB9XlebhPTbkqEa+F?=
 =?us-ascii?Q?SoSDM0cubhujsongse7HIxEZAYlpQIF9YItJvoE1lvLqroj45mVyctXUhDkC?=
 =?us-ascii?Q?c56Hb63BWBB1GlAwiNEmgfNIM6K0RJngkpjjOfdG6hdU3oyrT3nhayOLol2K?=
 =?us-ascii?Q?g0j3TMQOXtsdyf1vBjvRXeUDUBq8Mc5GuBGih6emX4igsr78eMrL42sgNkPz?=
 =?us-ascii?Q?qKpMrFccNOmioUP+FbQbosr+x96779Pswjqn454hirE6OqmyV4I03tgON8iu?=
 =?us-ascii?Q?koHCKMxeTeohTodyK+xiTGvNIoE6MoBf0cSonbO7rHujjjDfLJ0j/WGcRfLY?=
 =?us-ascii?Q?mmeEgu1KkPLrRYK8JP4baGvIHh1jdkT3Od4mN9n1r9oQpNfCXX+8H6Vp5EC+?=
 =?us-ascii?Q?B+1JZzGSIpCZk9pqn1wdWedjW/17h1T1zZsVf4U/UkCo/Pi4gZnnbD0lX0Dm?=
 =?us-ascii?Q?3R696tzSZkFfdYR50U+I01DIwaUFGv3JcIkrvh9QlS5CMZWpAVEEsDnccXSU?=
 =?us-ascii?Q?zS60jj7B1HH+PGHrTpMHNP9MrTeipDgN8CkUvkhbIYyVflh1gRxnRZ3dztPF?=
 =?us-ascii?Q?ie27zdPp31zoa+4aN0lhie+AcQntQRTyENRmqgrE+oxXimwXUi+E+sY6q392?=
 =?us-ascii?Q?XkWqyS/O4Y0yO7C0kT3htLFGjkSarZBF9IkKW1+md/j2ePW9j9gX0/5HZJ9I?=
 =?us-ascii?Q?ZFHemFMNlr3cEqr7Sa9NJQL/ntkxC6SSw9G3nm1tqdugvoVt6YRO9XIprvMx?=
 =?us-ascii?Q?198WYD2X49jlHTh+UCXRpWiCnUbwa3wQUnR508XFb/7OgiAIxOPUkxpyQigH?=
 =?us-ascii?Q?1yT2MYXYb58zu+yZZzbOXbxr3ePsAiYzC5lg1lABlim4dIYUW9MoDVo36pJ9?=
 =?us-ascii?Q?p968S4HDo8kDUmoVJFgPlbxygLhnCZ2BT4I1/neS93agoVQw+5h0o2xMrP9O?=
 =?us-ascii?Q?NQUV5yns7b0SUSzTjODMMkFhGdu9EYXJC5bm7hVsdKlxqAKheyAo4xfw9Ovo?=
 =?us-ascii?Q?IACHxzUosXlyWcRqxPMIBCUNX5W+WyZD0d6JKIlRu7ta/kHBCcwlDAMCQS6I?=
 =?us-ascii?Q?XLxfbAWE24SeijfCB8tyOJWw2xYcBFgzkwcbDLzuYBP3D7UHAfx82eSgMNwr?=
 =?us-ascii?Q?brYFlBCMSSnup90x9nN5MOeZ1gUqBG4hjoSV2GWHnyW8wx/P0vxsLfvRDU2D?=
 =?us-ascii?Q?DgqKH6molRNT8ecfph925CxVTxfotO9TVJq/1AXPk0HGpdm8l8yS1Vcx3z97?=
 =?us-ascii?Q?2e6+1rTl/J8hxqoJ8WPs4aaL2uvvbeZmE3XxdF+zbyAa2bJiIhtLlMehUVur?=
 =?us-ascii?Q?3Rk1TbvtlA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eEzZ3XNsauIb4uPqGH+CEffruKTH5uRO8yEneJB58yK88bYIgL42a44rj2ck2nRU65b8q/4XPn0IVtziYFLj/NqD4RZPSkK2BL+7Ik329D5gC0Ziz8gfJ83tj/Bfv+qFVZ2d+MlBmH7QXyAJcejwsiogDLrLUTNeH9Ci2zcbhnItZN2zLpU/DhgymOMx+dcr6afdzscv8cNjtQLX/0vC1RkDSQMUG9O8LPS2vRyxoCXyuRkKSEPT2LMET7gk/AbGHdcrnTQMkafgArrGhgyE26mG8xkwYpujRJqhosOFDKXmqSFK89KROPNT5w0U4CAJt/3Y3g6k80aN6bEmd2E3mg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c779a42a-d32d-4f61-3875-08df04074981
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 06:49:05.4088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XevieneYEeHpPuqgjsd9YneuViA4ecaxMTFhyqCNS9W2eM11GnjGNpfSoStqlqNpx+OHOf4H5ETbHQcmXz21Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6253
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

> Subject: [PATCH v4 02/12] drm/i915/vrr: Use the helper to write
> EMP_AS_SDP_TL register
>=20
> Now that intel_dip_write_emp_as_sdp_tl() exists, use it instead of the op=
en-
> coded EMP_AS_SDP_TL programming sequence in
> intel_vrr_set_transcoder_timings().
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_vrr.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c
> b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 6130854a706c..a3dfeaa12e8b 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -9,7 +9,7 @@
>  #include "intel_alpm.h"
>  #include "intel_crtc.h"
>  #include "intel_de.h"
> -#include "intel_dip_regs.h"
> +#include "intel_dip.h"
>  #include "intel_display_regs.h"
>  #include "intel_display_types.h"
>  #include "intel_dmc.h"
> @@ -658,17 +658,7 @@ void intel_vrr_set_transcoder_timings(const struct
> intel_crtc_state *crtc_state)
>  			       VRR_VSYNC_END(crtc_state->vrr.vsync_end) |
>  			       VRR_VSYNC_START(crtc_state->vrr.vsync_start));
>=20
> -	/*
> -	 * For BMG and LNL+ onwards the EMP_AS_SDP_TL is used for
> programming
> -	 * double buffering point and transmission line for VRR packets for
> -	 * HDMI2.1/DP/eDP/DP->HDMI2.1 PCON.
> -	 * Since currently we support VRR only for DP/eDP, so this is
> programmed
> -	 * to for Adaptive Sync SDP to Vsync start.
> -	 */
> -	if (DISPLAY_VERx100(display) =3D=3D 1401 || DISPLAY_VER(display) >=3D 2=
0)
> -		intel_de_write(display,
> -			       EMP_AS_SDP_TL(display, cpu_transcoder),
> -			       EMP_AS_SDP_DB_TL(crtc_state->vrr.vsync_start));
> +	intel_dip_write_emp_as_sdp_tl(crtc_state);
>  }
>=20
>  void
> --
> 2.45.2

