Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEC6C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 07:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A7310EA8F;
	Tue,  8 Sep 2026 07:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bts7kMnT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAB010EA8F;
 Tue,  8 Sep 2026 07:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788853839; x=1820389839;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FSVDcWafGqHXuWkVNLrYG1/BgADMiRtVuymPauu8iRw=;
 b=Bts7kMnT/1LZUlel1INVK/yyzY56b5v/K9CoNtx3byD4TN1LD7QHG2s3
 BXfaJK/Qb9FEFjslNjg+k+ttbeOXpmBtAWuG2tfYR7F0tPKr8kFd/a7Gw
 i7So6/Rya83+jrUKjx9Kjzxadq1QSrAxI/doE8opDJ1Sgy0sT8owxoDWC
 wFH9illzSNRWaiueqEqy0iDhSvqWZ8lV7rOAl0Udr7PJuLs9FkozY3ooB
 9OKKy/5p0sK26SSi931zJlIdIWzq+H255KmDhYM6LPmgN66tjOSNLTKfl
 xc1Ji5W07Ji/5nVNzX4GloYssUMDEDOqruT2bAkd7FdS1gkEbuh+mPTqT g==;
X-CSE-ConnectionGUID: 6TlfPsL9SOKpxg/aMlQAyQ==
X-CSE-MsgGUID: L51lSwXNRhKhop1SRN33UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100769737"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="100769737"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 00:50:39 -0700
X-CSE-ConnectionGUID: sT/JIvzzSFuYuUo/XufaaQ==
X-CSE-MsgGUID: /TBwPc03QOWpEYAwuRXnbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="274442145"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 00:50:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 00:50:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 00:50:38 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 00:50:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bm7oLTDK0K2XWU+EtmU4O67jddVMW7sa9hmDJwaq2hYpGYkn0iqqBtpJChsbHOH62j6CewNO/3WqQVFzIdvt/J5ewREo/vQYh6VlPyTAsn6DV6hFR/2xqoZW8eOnMaiOQr7XZXo56ypU7VQGCYP0bd9PqIgfnBvMV8r/BjfMdW1QU+J5p1QCRlOxWw8lOvZI5TGqhYqbAS1eAmiTz5W3jlYvsBRgLB8yohCxWrujWCEqPKwOy7rrSK9gVwN9liXHhUIeE/ffSX587Zrvlar/qoodSjghL2BC2sd2O4cZPCu2oqFk2rltoeIkVPScyL3sqszAgGOmLUHnEThx5l0JWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mi0aWV7T1PE7RYHYrhcsc8l/xYmUx21LnklKQp+WRJQ=;
 b=TzfbF58V6Lko8lvk3Cn/cSP2r5rrqpHZCkmhHuleoiucx605p0LR9QGgNVMjGAwV0s4QGS45OFpkL4bgbTHkU5bYpVbn58iZUM6TECA6Ozci4QNW/wcZD2QtGSBCY0+F/d7GHl+gJHOpfaHKOxF+6nDAB1Q8dai1Nd2GMWfb9LdEcsYhwkTpjB9yjrJPCB9Z13LtHf6GkzJF8NF6gZ5CzdYE/ZGbMDYtUNjuGz+ms4mRT5l90xRbyuEVpCrjY8/t6CCaLKIuSaHjvFEetgVyGI+dkb/NJWJTUvcxAqpLps4hYbnyVpRgf7+y0fSLcCVsgSeJeRnCmGLGUR+D7Kx8GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA0PR11MB7284.namprd11.prod.outlook.com
 (2603:10b6:208:438::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 07:50:32 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 07:50:32 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v5 09/12] drm/i915/dip: Store SDP transmission lines in
 crtc_state
Thread-Topic: [PATCH v5 09/12] drm/i915/dip: Store SDP transmission lines in
 crtc_state
Thread-Index: AQHdP1zMKUJuCcIG+k6ovRE66PXOLLbETpnw
Date: Tue, 8 Sep 2026 07:50:32 +0000
Message-ID: <DS4PPFE901A304FDA0079C7B0B8EF24331FE3B12@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
 <20260908062224.2897987-10-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260908062224.2897987-10-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA0PR11MB7284:EE_
x-ms-office365-filtering-correlation-id: 6a7de0c7-5c74-48b1-f18c-08df0d7ddc25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: Cc8atokqb5noLwyi38di+TOVE3tjoU4qW8wuFZPHQmHNQLAUIVogibjz3BWmWKfjdiy9TsdgxI6/vPUWcVpJLTuptZNfxf8mYnmfCqCF1jEGuksfOmwQiUuyz3h2Uv235qIvRI7rvT1tl6b9h0r0n6DukT/3ivlsCOqMrSFzpttjuZB1SPgI6RNkJW6LrM3zRllrWe3CP5Lg5xx6gD3NDi1cYO2qv36pggWt1hmewdFXRStbnc9V3S4NsfDClJWofkvzW3w0euSv0IumoZX94oJVBag4q9yt2bcas2PyJoant63Jk6MbCEi8rsmm+zusdo/OKxo+bMUUKxOm2CK/7KzsBhMdK9rFw5P0oFCuN99RiMaDSkZWHqMKHUIVl6UnlKvMvWuNk41YMVoBTcQUCoqI10Dr5BBK1z5vIjZ6QR2X+hsQzfFURQd1QgP3e5z6D+MY0O6YGPiUFWFuLMyHHIky3Rm5HxqRioCOFN7sP7XbuTh3inb9tJyep/5gQ6TgHrOPIRWLz1KyBwhGOB4QT2pDMnCR9U04rktjG3lV1fsqLgaIgLt9FzqwhpPKvwEsyfkndKB0ZTE6ihpKnZMoH6FIsLssg9cvJDBC6HCRVDYjeR+SS8bD4jeP1JkGL5wUICv68JDVUneaazCtj+lVE3QSvIU3HfAxHrPbdBOgUdqf4qwCrIuA5s514qIVTrWdtHQ5g6qHYwU62za8OaFbVp0CIPpMOqYTSDDQYeDA3fU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HY8Ds3AopAK/2bpr0fEQ7dCl/UIhYpdcoYULMxWY3yKxnAgg7xLQP4XAmajI?=
 =?us-ascii?Q?Dn9/FK+J6MI6bCs1tRvxFDKor8/DS7fMR78CJOZQxc3XVsqFP4utmgIiQofJ?=
 =?us-ascii?Q?KDyvZxc7puYeqDU0RNlTFVEyltOPDhcOFUkCdSIkcc3JC5xdKZ4JnVrTTlAt?=
 =?us-ascii?Q?+i9TnmXMRzI7ncxHTmO8FxsYKxQxujKvFR99xW3u/CLF/DK9MAQkB64k65yu?=
 =?us-ascii?Q?3hLp+FENsenz7BHi7IVHtgqG2V164CTvOnm7u7vgmD7gSpYs+MgBlhiFDg9B?=
 =?us-ascii?Q?bdwI+oNcAvIBEmdWFNSAEzjT3INopsWtjP8T0mGZ/MQh3q3N3QpvNQB7S9iR?=
 =?us-ascii?Q?Ug3XiLHpAZZ1xlDSe44UdUILS4h2w2MARntn6uN9PHUc/+NNDXG0OrAeI69O?=
 =?us-ascii?Q?HxdjO28K64iwkCSPtglcPmmGjC0KaIaNx/55sqXVSW7jRfUTuWKq82WAI8n3?=
 =?us-ascii?Q?AKjh858sxTp3FtNXD0PuNyG91hHyPKrlGMDxn8Tka2WfA0a62sCaWDgPRYZ7?=
 =?us-ascii?Q?7+dpwbXTET3kuBk9JLl1LrWwt6tkDnOqZJ5/2yAEFr9jpFJAFUdhMJ/aR2Kc?=
 =?us-ascii?Q?buTE6SNwC3jZyIO7ja2jFGqPAuv3AavDolDgKZeMxxktM7ie4jMuNDjfJdPr?=
 =?us-ascii?Q?3K0lbCLj+3Lw783SpESI+tsQx9KsHs6Xf14ecR4UZKOd9QOCuKmh4mD4pKON?=
 =?us-ascii?Q?BT5/criFWq4XMi8jMeR9kPa3Y+JVlTKUUBofXVgS/tA4C0GbdKufMooGKKYP?=
 =?us-ascii?Q?16XEdaCnchYLhJTclA2ZA9SLXthKDaDBdrI+D/H79UrpjaYkexHhsu7Ifrwr?=
 =?us-ascii?Q?RfH0bofbnQQUykBDCbPGhhR9uHADiUu5z8om+5QeRi7nTWjs20FtVsYAp4SQ?=
 =?us-ascii?Q?Levt0pRhPyDXiU+X5Bd6nUgiu1epXsIaa7O8vBDOEt4UJ8WO+QSooxVyGX4Q?=
 =?us-ascii?Q?d+jnkKktKBFM2fNx3qigrtrMEj7wvRDTAPxEj3iDytbk6/1loPap1ZVQdwLX?=
 =?us-ascii?Q?eGYfPzja/zZdWhk5lwguUiiQ+KbbBkhTpWT6p1ziSAkGT/byU7sF6f81DVvo?=
 =?us-ascii?Q?XU86Y8y2RnX7g2j40dYy0SCA8gJA6NK1XHYAheitaDW8XqQdX4cfA/JJ5ack?=
 =?us-ascii?Q?WKqhJ+3eSRcOainA8CS9IZvdpJAndvMWnl8P3ay8WHMwSy5fqHYevqaTcGDV?=
 =?us-ascii?Q?bYFM7ms31LH3c/oLtkZSXzAwUPdWBia9nHhDAli6oYpzENLFkOPh4O4qCx+2?=
 =?us-ascii?Q?ZHD3ErbAiN1m6KqSfx8qRECWQCRSL0o4H+dc5VJXd4vGIpuVGARmRRLFnlgO?=
 =?us-ascii?Q?79Qjr4a5NocaptOaHBCUoLiSg8JbXcxS8A87i6S0ANklJ5tLK0kn55sCL7Tm?=
 =?us-ascii?Q?JIWIcHaMybEfOvh43MQqYMqxdFFrL4OdFDLcSmgf9tNQLrdBCOfnXDnWq4UD?=
 =?us-ascii?Q?x23So9AYlNxBAUjgnrWYJLHWGIg/u/Yp/6KjA6ZQnb5KFIYx9VSJUugKXvAK?=
 =?us-ascii?Q?Lm77Ndmsvp7DRFxVKsB6zcwl5AogpM5ZeZUvXP6sb7680zogTAwUGPEJvvZn?=
 =?us-ascii?Q?NzS0MpKzCEAQ+DshTL7Od4LdYkcfdRa6laIIaT8bsgOkytuz+to8WoSNDS9A?=
 =?us-ascii?Q?l2ZHzEOdVaXa41PMo0mse5KVNtWAIHbxHG+2mhIOLU4hy0hZMACQHy+hX3NY?=
 =?us-ascii?Q?B3WpN1qsRUoQk391/81vM8IEWQMxfLQIfkEDoVlbxJmg8UT6E5gOygL40QoF?=
 =?us-ascii?Q?I22E+uT2Eg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rGhsxvs4DDwIv6wX2Z8cpUuNsH8pYrNYL8uR7KXSzOT5SwqabbNPxEDODNC8RokMU+6xILuXQnAN4awNgXnrZPvpjABgyj49yyP7jvREwTRou64CiDNKaJgPoimwVfKG312pHIEUZ7IGqoIK+/4oEknsY8Vy8ikolz8M7J38BovgAU9lju7UJtYuEF/yl3k1gYwKCFNs3sfEnyRVWdBKgwV7FarNARZsips9vtH2us6cQ/ohggqC8Go+Y2V8949pOPguW2lUmafXkRXNMNBkpzryARdnEKvCNkhMMHppK7mIe9LufVvu1dpinL5Sb+sj2hE+cvFL0d3ThXQllq7T+A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7de0c7-5c74-48b1-f18c-08df0d7ddc25
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 07:50:32.5108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3pmHzJpBystjiAP0+dOTS+HipTw5hcVcpuFH5hlEHFR3pVZA/DdB5LwTkVP8fjhN8vvH6NpR2vqle6Gh9krwPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7284
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

> Subject: [PATCH v5 09/12] drm/i915/dip: Store SDP transmission lines in
> crtc_state
>=20
> Currently the driver only programs the transmission line for the Adaptive=
-Sync
> SDP, while the hardware controls the transmission lines for other SDPs.
>=20
> Starting with Xe3p_lpd, the hardware allows the driver to program transmi=
ssion
> lines for additional DP SDPs. Prepare for this by adding fields to struct
> intel_crtc_state to store SDP transmission lines, and include them in pip=
e config
> comparison.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dip.h     | 6 ++++++
>  drivers/gpu/drm/i915/display/intel_display.c | 5 +++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dip.h
> b/drivers/gpu/drm/i915/display/intel_dip.h
> index e9959356226e..03ef749a79ca 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.h
> +++ b/drivers/gpu/drm/i915/display/intel_dip.h
> @@ -51,6 +51,12 @@ struct intel_dip {
>  	 * The programmed transmit line is (Vtotal - value)
>  	 */
>  	u16 emp_as_sdp_tl;
> +	u16 gmp_sdp_tl;
> +	u16 pps_sdp_tl;
> +	u16 vsc_sdp_tl;
> +	u16 vsc_ext_sdp_tl;
> +	/* Common SDP Base transmission line (Xe3p_lpd+) */
> +	u16 cmn_sdp_tl;
>  };
>=20
>  void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_=
state);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 6dd2626256cf..9f4be9bf150e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5604,6 +5604,11 @@ intel_pipe_config_compare(const struct
> intel_crtc_state *current_config,
>  	PIPE_CONF_CHECK_I(set_context_latency);
>=20
>  	PIPE_CONF_CHECK_I(dip.emp_as_sdp_tl);
> +	PIPE_CONF_CHECK_I(dip.gmp_sdp_tl);
> +	PIPE_CONF_CHECK_I(dip.pps_sdp_tl);
> +	PIPE_CONF_CHECK_I(dip.vsc_sdp_tl);
> +	PIPE_CONF_CHECK_I(dip.vsc_ext_sdp_tl);
> +	PIPE_CONF_CHECK_I(dip.cmn_sdp_tl);
>=20
>  #undef PIPE_CONF_CHECK_X
>  #undef PIPE_CONF_CHECK_I
> --
> 2.50.1

