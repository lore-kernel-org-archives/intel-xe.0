Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB328C5516F
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 05:26:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8423E10E38E;
	Mon,  3 Aug 2026 05:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HokyXcJ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5AB10E38E;
 Mon,  3 Aug 2026 05:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785734778; x=1817270778;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MqKF3qSvOLPC+PQykRx8LgzCg4uTvdTNjEqYh9a9f/w=;
 b=HokyXcJ9hqXtKqRChARI0Tjhf+HpX+eMsedtMLEDRJkAVCKlTD3MNPYU
 BkDzhGeapfGL9iSnOkO6/ADKjjmMgwyq1TSuVIu3pL48SgAJEKCKRu5E1
 /0GIF+M1j3b/nm71MxCpPDrh/zXiroUz5NvJXMKfIqPSqEceduClD0jwT
 0YY9aVZrxJ03nABpS1koYW1IAmTXwjkTHVOcTNc7blnp4o7nqifa3+O9H
 +JncFYE/+JGbblMLkXwJgdP993gIYZeFEhwTvvlLf4vdpf/ajM2ljTvXK
 Ghn/5X5sc+1hSX2nMgfQ46GNrO9pMrfT/y7XPr5u3s7jK65vb0Up8jHN7 w==;
X-CSE-ConnectionGUID: y9w/4QcsRuyo+rUz37NdyA==
X-CSE-MsgGUID: QejaXCsURRKPnY/fp0KV3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="90150131"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="90150131"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:26:17 -0700
X-CSE-ConnectionGUID: L+mFerbmSl6SbKEXg8Htlw==
X-CSE-MsgGUID: GGuPYnumS5aLFlnrmluNZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="261734320"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:26:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 22:26:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 2 Aug 2026 22:26:16 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 22:26:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHaJtSkdZHBdXUC7OCl6JQOCdwkgWJX3PDGArBmqDEFpclYgi7gIYorDJwDdrYYIUoAYB20RHHJ5c++zPeqZWH+m+zHfdj51/JeozyN6RxuR/Q07DgMSkDmqPEZ35i3ufnw7jMBQBe5axcK5zVElhuUzvVax0dOjVYsavOilrE6Z230iddL4En9nbPRL/fCpSnlksghXKT01G0tLx2gQG6QIAPgaNQTaYobkxP2S2yOThcaoOvRZIIDubEAdnECQ7t2HjYws2/479lIyl6bXZezfUqaK4PsIc02zv+8Sp5nxhWRIDznLKnzUmENKN6scdMOo2qBqhi9PkYH1MSRe3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6de4iSUhSYc2UQvHKSC7DAP7bbD0U3qg0OtssqZkfA=;
 b=fu/ShsfZTBc2J2OI6SALzcid9PYWOpulwfiQMIUpZQLFc56S1lmtsLcUZBA4zoVPwexuvpckobjloo7x4lLnGTu3LNon5Y/iGOLMxUKrXscLC065P+cTsmImuI4tOjaFRFJ36rEqv8KKxWc8tuCEfvfXXUQ8QUz87rmCM5WVldY5+3Kqhi9oofDJG8TUC1qmWuwaokLXgn7lvuyz+lx6v6X9nDY4zucfsofEOybct9vm2nlAWP/RDKDaaOLRJaJ8vdXupt9jnVtgB6lZVeszaQqrq4QU7uFi0dK8XW8NL8n/TMxvh4kAIQhligYt9UM9vRgefq8oO/0DHGrQR3L5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SA3PR11MB8074.namprd11.prod.outlook.com
 (2603:10b6:806:302::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 05:26:12 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0270.012; Mon, 3 Aug 2026
 05:26:12 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 09/14] drm/i915/hdmi: Expose DSC min/max bpp helpers
Thread-Topic: [PATCH 09/14] drm/i915/hdmi: Expose DSC min/max bpp helpers
Thread-Index: AQHdIBUoJwSjy+7jI0yNTUwCcO2MfraL0OQw
Date: Mon, 3 Aug 2026 05:26:12 +0000
Message-ID: <DS4PPFE901A304FA7DC9DC880749A90AE9BE3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
 <20260730105226.2731341-10-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260730105226.2731341-10-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SA3PR11MB8074:EE_
x-ms-office365-filtering-correlation-id: 8fe1f6a7-97c1-426f-a018-08def11fbb99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|4143699003|11063799006|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: vj+UTIHaHLWzrX0csPxmHb9D/A2sE7BBoedKRvoKJwYU4VbuHMEgUEVa/+vr+/yJ+zYcIWwEtwmsagxmw7Ng1VZQk7j+Dus08acx65AwlxxC5s9FeAm6njotXpbFSKeL+ksGrhkf7PH1PI3zWn/O0R9SsqChNn+ClJUXn9e7N7X36Fnv9oRHOivavVi9/GdI1acb1NGMQ7umB99pWZSA9ZpBWLRbGCJz9uo56ca1qhKjeKzJx51b7/aATwsPCdbSlvqQHcGQG6g1n0i6wCxwmDxflw3qKnGgq6DqOsNPgBIt8d33+9lmkZ6w6gxw3lFQuWomS8ASAW2JqNvOhze7cL7uKQAO0yYrohAiITe55hTXVdZU+fJvWexdRe0RF05I32dd/Ns5UrSs7iDBl8wGbMzavbyWF9Uru0grzKFBcu8j0sZHj06u/r5J12101UuQGMMqmHd1ium5tInuTVSAzgTJOkaz6D9hc8x1rgvvx4zroUHd8Arv2k3weXiowmqZOt7/16NOwuWAnn+ulpVYTcVPeWw1ZugPuPG8B/zrv2zTvrQR6Ei+5sAxsSTAUJttFIUhORNpEnFq8dTZzObeIM2FuGql0kOeAJ/O0W70CbdPYa9Dx8Gp7y/658KnGw+hG5Wx3h6TgaJaakZZkogT+4GqlknVu5ilYl1puAe4OTFGrrKmbRcrjb65KB2Nx/ZtJUCGZroDKP29ewGifBGvTf4Yr/EzRjS/m+PAcqnNAuk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GNolGaCRSvhaScMc4JocfklYl4NZEjASjkMwwmCWMB1zhnN1FWJNOfrlJQe2?=
 =?us-ascii?Q?O1DFlmP6MhA0mErMIYcS4pHL+5++AZOA1TOIa1kjqEmnaQvezJ3fplH6mGHV?=
 =?us-ascii?Q?8eCzrfPSU/1EjxGfVhJfeFEV4I9N5xSLaoEcJFb5kc9bxTCI7cX4g/1p2Oc+?=
 =?us-ascii?Q?yDQi6PUUj7nFYvXLEWPKPU4HD4ub4Obpm3U302vWnz7jQVWCB4dh1R6vuDpv?=
 =?us-ascii?Q?sWoISdxMTVV/UApaEt3SIStS/b/yJuHuVptWVAhW6gnRK9PM+s5Ia+XgCDVx?=
 =?us-ascii?Q?pVneh9Gl3J5kdRJo89RuxyQ4wm4ycz45PzbCohpiEZQgQXKciv6Oj/s6M5jK?=
 =?us-ascii?Q?EKKxD3A9fEduRAuGWhpFq10PmjG5CdXPVAIBn/NwK9u2O1MPK3BKsESDA57n?=
 =?us-ascii?Q?V/gvfd/4URuIZxE4iiVrzuboNiDnAcP4qE8+zZrHrL7GVugeFTK4cq1Cffbu?=
 =?us-ascii?Q?TXrgLC6w0vu77/TXr6PWXp3wUzQDkI/R9sPGF6NNFkiZFp/9ObdfzklgcDTP?=
 =?us-ascii?Q?s2mQP28G7t3ktPSy+ISzHGBw46HcptoyNGeiRW2JOWW9QWgPTivkF47Wq1p5?=
 =?us-ascii?Q?bkK50K52AnWJQAhkEqzS2a4EFaFNgQ3UGLm7mJTnHApGEOKu9gq/dZJdI0rK?=
 =?us-ascii?Q?JHwQZWBJCRuu4WfXRca/CNRVzFQmUuMMKk0qM18PipEcArqKHOdU7iPwuK9e?=
 =?us-ascii?Q?avDChzmF9qDAxDpXFSkklCrXfIVoH0VyizaViNTYnJM374vHdErCnr++qjvT?=
 =?us-ascii?Q?LHSHYN2cpVseKLbvUIzIDBJa3yBZuKds+BiwfYqFKoCtllmGEy+KRWXab6pW?=
 =?us-ascii?Q?ohSJDfrcOjpbrzvdEsOtR9c4TsDdU5/66hInReys2x50y6AqJUTsWnaHP3qA?=
 =?us-ascii?Q?HKwdqtdXPJ7Vr6YjiP90bbjGqomY1lrhdNgIHTmMumk4PA6616aXzSY4fjog?=
 =?us-ascii?Q?nOunZ/7OHmoWq2XXFVVn7xHiGZx0K9KC4TJQ+mJHagH4gXyAQ+HnIL83Tlfh?=
 =?us-ascii?Q?OoIW8qw6czAuURlG47RBlhSHErx9EXKeNZ/pqvhGH18ad+5f5TdFdWoyRXav?=
 =?us-ascii?Q?at/U255md8tImnEmrS/fEGMoaJ/h6C0OBocOnTFb1duZfFKy6PKtCNX2hTt7?=
 =?us-ascii?Q?N6ydkZTmseXGuHKISpmij10m3537KWFnUF03c6KfhRV9RrQD1cjZH/5k7Efu?=
 =?us-ascii?Q?7UGI5rVV5vuTDbF6sPRblg/og+6AGp61flqSRZrNBuY5ORKEmR+GmkEpaW9K?=
 =?us-ascii?Q?xEQMbW6rSHyjXBMOkmIfOU6H6Jx1HkdkRG7MbZR1wTE6qd2ZB4IIBjeW6Jlr?=
 =?us-ascii?Q?UBK6ANhQuwRg3PcuwJKlqWpptjD+h20EYqRcOcCkXE7tol1uxPJRfkJpNnW4?=
 =?us-ascii?Q?1qADop358IRBC+O2U2uJrCCO9B3LJ52ZZKn758T2kJHuE50uF5tLdG89t3s8?=
 =?us-ascii?Q?p5mS7aIK0Lgeq3KtSQKHnWSM3FnC4Ts8BUKtk7dAK/ws9m2M3+poNx9sV5yF?=
 =?us-ascii?Q?HW86tPjmllkWtiR1qb1/i3Jpz8XD2v6QfSc4hRgFaUY3Wgr/OYrIObZyo77N?=
 =?us-ascii?Q?HToHmDeTgVRKeKVAeW3COGu3HQUMmedtvT8jfyP9KKijVUkrgy1edLw0/PpK?=
 =?us-ascii?Q?u2D9o3GFb31NZjn5NoJQCMxi8ruGdxjUDlvzMaBZC5fMSz+hDKSo14CwpgRl?=
 =?us-ascii?Q?/UXrhuxTos343M5rqCHu3KTVO+ei2TkRJooUv4uDY02ECJDdG2rlrMs8EVER?=
 =?us-ascii?Q?Tl3cd9WVmA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RcZozMu/FoXOA/rh4MbTesdwo1oyHtEgc06miR0DlTxI6tvnxEiDSP5LhVvmgXGSQ4ZTaWo/V0L8T7S6lY+ghOlGZYgCImy8H5+3CO1TORKS/+2C4FYOq7xUvZ8/czDYv9pljWKEYzpwIgssSm1VHGkZtkf3iRmUHueWLjgu9mDaeargvJbkHplgo7li2cjVNZXUwByKtuUk+dJHtBHN0HaJRVvH/4Gitsx8Bnx21YTWd7x8HEgJ3fEx5Z2/FjBLdMXtJBhH94zh43hMEHhyD9GMj3tpTnPGsfz3+aa43MGJ+9IS71b/zaHmrBs4zBGTK90hoAnyBETqbYmUacwQtw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe1f6a7-97c1-426f-a018-08def11fbb99
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 05:26:12.6496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pwfJQxvDK+l1Re4AW7yteyzgPQwnOno4JzctjeXhjgA99p4mB5ZDH066yNF5sI0S5/jCeEFK56J3rpnfUSbzIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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

> Subject: [PATCH 09/14] drm/i915/hdmi: Expose DSC min/max bpp helpers
>=20
> Expose intel_hdmi_dsc_get_min_max_bpp() to query the allowed compressed
> bpp range.
> This will be used in the subsequent change to compute the compressed bpp
> range in mode_valid() for an HDMI with DSC connected to a DP DFP.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 20 +++++++++++++++-----
> drivers/gpu/drm/i915/display/intel_hdmi.h |  2 ++
>  2 files changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 428631abca74..c58c9202fc10 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3325,9 +3325,19 @@ intel_hdmi_dsc_get_num_slices(const struct
> drm_display_mode *mode,
>  	return target_slices;
>  }
>=20
> -static void
> -get_dsc_min_max_bpp(enum intel_output_format output_format, u8 bpc,
> -		    bool hdmi_all_bpp, int *min_dsc_bpp, int *max_dsc_bpp)
> +/*
> + * intel_hdmi_dsc_get_min_max_bpp - get the min and max compressed bpp
> +range
> + * allowed for a given output format and bpc.
> + *
> + * @output_format: video output format
> + * @bpc: bits per color
> + * @hdmi_all_bpp: sink supports decoding of 1/16th bpp setting
> + * @min_dsc_bpp: returns the minimum allowed compressed bpp
> + * @max_dsc_bpp: returns the maximum allowed compressed bpp  */ void
> +intel_hdmi_dsc_get_min_max_bpp(enum intel_output_format output_format,
> u8 bpc,
> +			       bool hdmi_all_bpp, int *min_dsc_bpp, int
> *max_dsc_bpp)
>  {
>  	/*
>  	 * Get min bpp and max bpp as per Table 7.23, in HDMI2.1 spec @@ -
> 3434,8 +3444,8 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int
> slice_width, int num_slices,
>  	int max_dsc_bpp, min_dsc_bpp;
>  	int dsc_bpp_x16;
>=20
> -	get_dsc_min_max_bpp(output_format, bpc, hdmi_all_bpp,
> -			    &min_dsc_bpp, &max_dsc_bpp);
> +	intel_hdmi_dsc_get_min_max_bpp(output_format, bpc, hdmi_all_bpp,
> +				       &min_dsc_bpp, &max_dsc_bpp);
>=20
>  	dsc_bpp_x16 =3D get_dsc_compressed_bpp(num_slices, slice_width,
>  					     hdmi_max_chunk_bytes,
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h
> b/drivers/gpu/drm/i915/display/intel_hdmi.h
> index c3a0e81615e4..dc81a62aac5e 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
> @@ -57,6 +57,8 @@ int intel_hdmi_tmds_clock(int clock, int bpc, enum
> intel_output_format sink_form  int intel_hdmi_dsc_get_bpp(int
> src_fractional_bpp, int slice_width,
>  			   int num_slices, enum intel_output_format
> output_format,
>  			   int bpc, bool hdmi_all_bpp, int
> hdmi_max_chunk_bytes);
> +void intel_hdmi_dsc_get_min_max_bpp(enum intel_output_format
> output_format, u8 bpc,
> +				    bool hdmi_all_bpp, int *min_dsc_bpp, int
> *max_dsc_bpp);
>  int intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
>  				  enum intel_output_format output_format,
>  				  int src_max_slices, int src_max_slice_width,
> --
> 2.50.1

