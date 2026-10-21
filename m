Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872A860A260B
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 06:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OymfQL4Z
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495B510F8FE;
	Wed, 21 Oct 2026 06:15:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FC910F8FE;
 Wed, 21 Oct 2026 06:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792563310; x=1824099310;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AfRsVWK7nuX2Dsmi3Ylx9HoTIXjxIUsJbrgyl6CcYb4=;
 b=OymfQL4ZsADBv/OfuHaiQax6ynIoh0nV3zn8cJo1/6kmuVs0SbfEdwsp
 3iELhYwnz6iS7Kbascw82u2Ksb9y02O6a/45NA9kOJ5u9DDOThKEIZoUd
 oiP3x4i1pwX/xrOtyu2nNfXdA7oiagEstmgy44sT5HnyhKiH1CpelDSyj
 nQLjCXqdMBWu/X4nMUp8l5KfGtAQ+DlkPsE7gsFjAxefGlSBrgycc2h/C
 gGdxtgJZjA1hPlfiRfL2MANpz0CSyureU4xt6OMElwVOs19HJroLNDNfo
 umY/ONiS2UGqJt5V//YCneHQKnI5hHsdBu4ZJ0Ta32MtQT37at4Hm90p9 A==;
X-CSE-ConnectionGUID: bh7BG8cGRIG6eXWHnFr62Q==
X-CSE-MsgGUID: uHjzJY9gSdSBg8thCvLAFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1271671"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1271671"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 23:15:09 -0700
X-CSE-ConnectionGUID: 9MwnZr92Rs25VTwrmWUbug==
X-CSE-MsgGUID: MmFuxSOUQ/mZoB6S9LWI+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3016652"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 23:15:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 23:15:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 23:15:08 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 23:15:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjJW52X/Di9WlYsl+AaEW2wS5LhHdRA2dKazTMvUjmQeqzsoIjx47SeHi6irDsJKsRpSRKruDyd2D4w8C7VoMaPL4NzFfckHa1q9bu3StlXphe3Tf/Tn6rNZrOfrdqYlUrQPodGRiYygA2WSKveD5TmXBkzyjXV7Y60Mkw4h/pi2o91DA6eTq3swtU2IgXrBSjKDZ67HshLC03N+5FcXd7SJ6Jh6Me9gX+zfyFaJFOwvCotEe6SYlK/d+G8iYLO2Ke2UGF51nKuteM9ttew8joPDcycFzqkDhfGu0SvcaIAfPxHqdet5PMzQzR5SrtGIRSZqpgGz9sbtOilVWz6zRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tHDRWolfpHBalJRGZPBq1hT0sF8U5fibkarO585/PI=;
 b=GbhL2CiKQaa7TU58abjaniGjAv0mtdRxUM92RZ85sYZzIBpGLVHvOPJmpldB+i8HYZg9W95IJ5XQaYUPcfhXE8AZB/Tn0UDQTjvxr23oOqEKn2NJduDkXJaaStLEv1fypW4vavws9SoJeIpFTN8ZXSfWSQNNv47Q3+NWL8KVFuJe8BjgPa9FXb0pF77SBFEcMU7fyfnuGeriZt9zY/ZgMEogaQMpUzhFedzfpzTLLpx0F1DoDCspZzTK5ExSHrKX2eckaRNT+0MfCbB5MctqfGjYGVIKvjR79GCsoN74/a6B1wbDgFDDg5W88dquFcULau/U45VTAz5JVYbS7KJd3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SA3PR11MB894536.namprd11.prod.outlook.com
 (2603:10b6:806:532::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 06:15:07 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.012; Wed, 21 Oct 2026
 06:15:07 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>
Subject: RE: [PATCH v3 1/1] drm/i915/cx0: convert the PLL power save W/A to
 the display W/A framework
Thread-Topic: [PATCH v3 1/1] drm/i915/cx0: convert the PLL power save W/A to
 the display W/A framework
Thread-Index: AQHdXVAejWDFVpwQ9ECG/tx8jtNL5LcHjEmg
Date: Wed, 21 Oct 2026 06:15:07 +0000
Message-ID: <DS4PPFE901A304F33F4F641FA38D7FC1035E3662@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261016092400.3112502-1-mika.kahola@intel.com>
 <20261016092400.3112502-2-mika.kahola@intel.com>
In-Reply-To: <20261016092400.3112502-2-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SA3PR11MB894536:EE_
x-ms-office365-filtering-correlation-id: 1cd0e816-972c-4b68-7438-08df2f3aa745
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|23010399003|261009223027099003|260925021911599003|260925021311599003|260925022911599003|10067099003|56012099006|38070700021|22082099003|18002099003|11063799006|4143699003;
x-microsoft-antispam-message-info: N7dcabXHnawiqiWRIDfGi1B9wR/9+sIlzMQ3+QDXiewrc+7nZjYsVHifsn950r2x9atDtnEFi+XKySXjM2CfzXoE4ULz7lJetpGFz3Wvx88Us4VEHjLzb8wavH4ULOcS2cWtrAOiNTbP1A1kvUA539k1bIeLTQl8f6LrtG7ASNJCJr/EvhUzsu17Y/LL5ofKpPtwio771TaP5qVOTq//dBhN9tUnrH5YPFNOHO4n0AJI6nP5ZFwgy+GfzeozbazileWf2a5q2wUbAFOUtRvgAmjRZZdwWoeEcFdMHhoiuG/Di1/jNhrnMjZHIEnIhJoLdoxGw4LO4HnGZLQlMZRtbDOCGZsQUYwa0pGSBNgxM5y5gdVVud2XRSLP8kh20qbOzBY06eT9C2y+rVSy2ftQL7N0B5kB3s1wTnjBXXxhJ7J2Jb9lIn66xNWYQd18llnbfMGIeuRvFB94JcSb/ubjPQQKleBTjHKQVIXDXLWEuQ4ixy6bF/LeXqBM8+AdzS3jd/R8/s6fBbigRA2saQsDru4aMtNIFxdT2Pu/ZlKg5FXvO7o3azVBSXR1qs+k8/yd4buM9aAS4+ScWw1myWSkXqFM5zjZOkKKxnOyfevkPOStA2rfuCZPvWlcME17MRDwg3J3ppcc2pXBgigR2A3sIxTMtycBh/s6Cra272x0DmuxYkru+O5WH82IT70ZhYoVhSpXpaQV7vMHKu+QmQ4xDc+Cwnho/UTcGP0JScL9gYc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(23010399003)(261009223027099003)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(56012099006)(38070700021)(22082099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Mwanf6PrZRMEHEwp+2M5uZxNHrXfR9AN0R8xAtnbe4BOFsrdOonGhwqjRBej?=
 =?us-ascii?Q?fwoh1hwRj3YHisZNZynYsYR8juat5tSrS4vVQZItw9rGqcmp2ySEpxQwVOVz?=
 =?us-ascii?Q?gQIeG/dnrRYDw1JQ1MaIZ5pJhTYqY+U8Aov6HiS0t4MLq89UHSG4udrXYrKh?=
 =?us-ascii?Q?KR5XyrBhOq8PGUX+CYU7hl7fztOOK2PjVd2znIIMRxg6JYXrHweb6d7xOfro?=
 =?us-ascii?Q?M2HWVs3T1Hyqi7CuSd6rCf+ED1OudnXjrWkn2BZ/HcDh1gyVu87ZnkcJJ9A9?=
 =?us-ascii?Q?5VdBcPAMBRO8pqT6zhhPkZk+RTxeIW/fJzfURgK7Lp1y+hWL/dWD+RS24yZi?=
 =?us-ascii?Q?nxEjdN8djfTbZVfYln9IFmtzl5HOOUjN3DD7NP8sCcx/ZcwqZLv3SJrvEXJg?=
 =?us-ascii?Q?ErmEIynGGSy+llUeMX7YZ+onvVBnl+eWvIuMAnK9HTTcEf8R6HfRP8V7AP6k?=
 =?us-ascii?Q?jkUyOqA+QsUPqwN1hVT2u85C/rKHao5g2he5ve2QAt6WL+mJ5xA81pumPuJF?=
 =?us-ascii?Q?doaost3fn9MRZAdzaRxzPj0fDoUYWX3DsNakTH2U+y5OTqHyIGoUP5sVy8ev?=
 =?us-ascii?Q?elZx5xxOMPbv9smR8g1qFJf2F19fSLVHImfDDEnQp6Q9VWytxDgKBEkH8Pbf?=
 =?us-ascii?Q?hEy0whZ+2CGYII6QFspg5VLk67AkLsAjFjiXfTp78AC2cN6cybAKWsnAV4JP?=
 =?us-ascii?Q?OhS8A9cfTzn+mt1SPNG+8s5lNrSEbd/OVLhcRGgxoAUYuUMtl5EIR7Cnrh1h?=
 =?us-ascii?Q?pngfbDh7KzeGjQmvT/0/WK6c0sbdtrrAojoDHxdH4z4WUr9O4fTc1KN5L8uj?=
 =?us-ascii?Q?jaC7naVPe+c8Ie5zV1+pTJluWdHJAmTurz1Wx14fsHqgPy9yjkrCml1GcKKi?=
 =?us-ascii?Q?BewRUY3SK5awS49nIK7HycH4iTj8axnUOOVVdK3Z7E+FZgbtMT6700+rB3qk?=
 =?us-ascii?Q?LhuyTSofiz+cEZZAcgxCwAByHMBBVnVSHFKzblt45o1PPUO1BxrQdkFkfvlm?=
 =?us-ascii?Q?iG11h8ulLh9FDliSlP2QAZsfQUSgjOqgzFzA4rdnCLcaQWTxem3p1kEwtx5Y?=
 =?us-ascii?Q?XRl6bV3+pgnN9chG0RK+U9L85/S+UxWhSuszTJNeHPm9hy2qZgLLMnkZ0sGg?=
 =?us-ascii?Q?6n6Qp7gzEMwBP7EZTNo7jnOwEZoHRY3DUCb7RWlMFMIs8BCVCRFboVsJv7nM?=
 =?us-ascii?Q?VGk25BoDYNy3IV2wS5Xi9ivI+ZIBVP7EmvRxJ+Z0tMiK02h1omBAYWKSFzmV?=
 =?us-ascii?Q?oNB9rk+SEvP3XYbklCLTZftmNLj2KCxLJAvy4GmT+cf45BX7dZT11RGMLLL/?=
 =?us-ascii?Q?6qyxZO9UNoS4pF8wNbw/N1yoTB9bgxcJkcHYZWVWtkVOvM3GpbY8bU+bqIC4?=
 =?us-ascii?Q?fiNverXN/dF5ltGu0cSqJrhTY6rXrqMaQZic/9GqTRf7MzSMDgRoh8CuzTHg?=
 =?us-ascii?Q?COdvaNIWacj9waSWe6LmLcGN0L8AO5XIUG5PIeb4jF0NN6dkrG2k08IurpLp?=
 =?us-ascii?Q?ZDs999qp44Aidkr53HP8VWwbHBakvbxzpcjIamdMlBCTCSyaRqlMxrRU+iWu?=
 =?us-ascii?Q?GHf1YrpPveRkWG2tTY49uFGdLxWYuVwYaEze5TyDWH7eMY45boIG6uKS6fOv?=
 =?us-ascii?Q?G7l4Ihe+CaDCwOcQ6CknpfG+uvoQ259FZjTbum39Gnac25ibyiJg7sb0xf1Q?=
 =?us-ascii?Q?7gv8jYtciBPADC1fSr6f2A7h+pfWw9EF6Cp/9WArVZNhOgzGBpfKe86FVp90?=
 =?us-ascii?Q?GJxGFR2VqwzNB3qwKap97OQzBOgXFqIYZjfG3819wUHRAyo+JfQTGjFlRpxO?=
x-ms-exchange-antispam-messagedata-1: gn+P9XRyi2dXZw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ocnP54DpLrJ0m4xzvO5zN7TDmInDqQz3rsKv4VlF+pmqs1GKoRM4nZ3fqAnF9jc6lTt8SU8LyVcFkoZiW+ljIQKwxLT2VY9Vd/h3vbE5dID2J2TRtyXgwdTsjGKhdHLJK22QflLI+HbDATEtQItCZ1uoZR0ZxuaV5DLoVAykw1Q3TMhFA73mnrG3SgazuEJzku8939QOVqZ4czzB3s7m6IPZ6BNDtECiKxOnAsAFTdhGIgcZ3HslDfhgXfe2r8nEA0nZugtHSBCj+eU5Ywhh7gFHSqXB2dK70UAQ9BN6dz9BGw6SalHFtnXuD5NWKO2GTZZFi+mDquJ68cFs7wT+pA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd0e816-972c-4b68-7438-08df2f3aa745
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 06:15:07.0507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ks7vLSk8cQeYiBR03jqrsAymBUvxOnoQQq+7KnyoTLA2Rx1oi/u14WMRIvCl9pDBF+KzBnVEOmWXv67UcXsLgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB894536
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kahola, Mika <mika.kahola@intel.com>
> Sent: 16 October 2026 14:54
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Deak, Imre <imre.deak@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Kahola, Mika <mika.kahola@intel.com>
> Subject: [PATCH v3 1/1] drm/i915/cx0: convert the PLL power save W/A to t=
he
> display W/A framework
>=20
> Replace the open-coded DISPLAY_VER() check for W/A 14022081154 in
> intel_cx0_pll_power_save_wa() with INTEL_DISPLAY_WA_14022081154.
>=20
> Drop the port A note from the comment while at it. It only holds for PTL,=
 on
> WCL port B is a C10 PHY too.
>=20
> No functional change.
>=20
> BSpec: 74151
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_cx0_phy.c    | 6 +++---
>  drivers/gpu/drm/i915/display/intel_display_wa.c | 2 ++
> drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
>  3 files changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> index b83f0afaa9b5..1b5a5dcb041b 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> @@ -19,6 +19,7 @@
>  #include "intel_de.h"
>  #include "intel_display_types.h"
>  #include "intel_display_utils.h"
> +#include "intel_display_wa.h"
>  #include "intel_dp.h"
>  #include "intel_dpll.h"
>  #include "intel_hdmi.h"
> @@ -3703,8 +3704,7 @@ int intel_cx0pll_calc_port_clock(struct
> intel_encoder *encoder,
>   * The dedicated display PHYs reset to a power state that blocks S0ix,
> increasing idle
>   * system power. After a system reset (cold boot, S3/4/5, warm reset) if=
 a
> dedicated
>   * PHY is not being brought up shortly, use these steps to move the PHY =
to
> the lowest
> - * power state to save power. For PTL the workaround is needed only for
> port A. Port B
> - * is not connected.
> + * power state to save power.
>   *
>   * 1. Follow the PLL Enable Sequence, using any valid frequency such as =
DP
> 1.62 GHz.
>   *    This brings lanes out of reset and enables the PLL to allow powerd=
own
> to be moved
> @@ -3715,7 +3715,7 @@ void intel_cx0_pll_power_save_wa(struct
> intel_display *display)  {
>  	struct intel_encoder *encoder;
>=20
> -	if (DISPLAY_VER(display) !=3D 30)
> +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14022081154))
>  		return;
>=20
>  	for_each_intel_encoder(display->drm, encoder) { diff --git
> a/drivers/gpu/drm/i915/display/intel_display_wa.c
> b/drivers/gpu/drm/i915/display/intel_display_wa.c
> index 888676693f5e..c8f65b55530f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
> @@ -111,6 +111,8 @@ bool __intel_display_wa(struct intel_display *display=
,
> enum intel_display_wa wa,
>  		return DISPLAY_VERx100(display) =3D=3D 3000 ||
>  			DISPLAY_VERx100(display) =3D=3D 2000 ||
>  			DISPLAY_VERx100(display) =3D=3D 1401;
> +	case INTEL_DISPLAY_WA_14022081154:
> +		return DISPLAY_VER(display) =3D=3D 30;
>  	case INTEL_DISPLAY_WA_14025769978:
>  		return DISPLAY_VER(display) =3D=3D 35;
>  	case INTEL_DISPLAY_WA_14026643300:
> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h
> b/drivers/gpu/drm/i915/display/intel_display_wa.h
> index 425a300840aa..acb45fa59aef 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
> @@ -33,6 +33,7 @@ enum intel_display_wa {
>  	INTEL_DISPLAY_WA_14014143976,
>  	INTEL_DISPLAY_WA_14016740474,
>  	INTEL_DISPLAY_WA_14020863754,
> +	INTEL_DISPLAY_WA_14022081154,
>  	INTEL_DISPLAY_WA_14025769978,
>  	INTEL_DISPLAY_WA_14026643300,
>  	INTEL_DISPLAY_WA_15013987218,
> --
> 2.43.0

