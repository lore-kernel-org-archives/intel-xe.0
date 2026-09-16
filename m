Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981D6C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 02:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0151210E253;
	Wed, 16 Sep 2026 02:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvQdK2+P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B079010E24F;
 Wed, 16 Sep 2026 02:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789526496; x=1821062496;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YWa4cC1st4MKuM8RoW5ABfh16oQdRx1Doc7S9insrNE=;
 b=LvQdK2+PAUNd1AApYVfrEGtDVgdcXw0/7tuJi+0UsLXUUibHEkgNOnnC
 T88NzLYWoi8WuW8ynPi79oE+6Q2BDnd13FQUYPY6UdKmAC8BYTQAxD5/b
 FcbaXGiQg1JLNlntGi2lu/eQ5mXTajHPhMNCIfKEw4hzQSiyIDBGd+SC/
 f/EfPz5cVDTPK23x9SpjEpfZ/LBh7xAwNo45uCKdYREkJGShAN1ZWXI0q
 +/yhO+N2/rbzm32DvfQUbKYv9Y+7MSA1gX02kdHt8MgjDE3wk/DUmRprL
 Pf5mGSCaoEuc1TaGNOmePg0bqx5STm7dRcJesJ/MJ1aolnGvKGu0iyfaS g==;
X-CSE-ConnectionGUID: nNdZaF6JSqGHNx8S2uZiIA==
X-CSE-MsgGUID: UMIE+LFIRpqVg0HcZUHO0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89034008"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89034008"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 19:41:36 -0700
X-CSE-ConnectionGUID: DVZKLLHCSgSIX/ennOgqkg==
X-CSE-MsgGUID: +nmFyaMQTGOM10sGXmh7Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277325148"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 19:41:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 19:41:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 19:41:35 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 19:41:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yijw8lsrfE1JGdFI4LRhbDgwpnU4m86v5riA92o2PKhrl44+0i6P141D881M2j6/NtDXmznI3kK4RoYP+K8O2GPQwa4ZgnX5OS10EGdNauDzEKr4o01VcEyu+5ZCC4U+DNxISN7C/WEYLMY+bTssS61FrFME74L5Hey83IzmXr0trwGMpkPIvHwUumRrnCqS7vv95Lrqsv83yD/kYGah5VH5V+mK0jJVuNgY/j1ej6WQeZEK3uWz4RslxE3m0t946HGaizbqhV7/HpjpRssaJVLDJQwwlTxpbxDlYjO+zgkZAKrEpmdqU3yCVXDhPWr1xdD4Mcpe5S4diA51pDOXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3kj28SM8dbt3WcsLsBijOEuwsuRRajpZxUEz0sje5g=;
 b=sJC3V2y74E935KAcperQJyU7o7vhFIQ5NOc5o8RqPuVHHnuRE4AreA0X/o9cUzk+hjMsAXI/3DHUA1dcQ0unYglSSxOjPDlMTm3702s2pkyFYnPxC+C7W44OLzwYac6k3Ao//cDqU0mf/f8S+DqfMlr4LycJk/gmVAoEABK4ZTI1FLWB/R7YlPOuqdkGlk+Oig4zt1uJw6HsYeKcm4ETRw3L8YpbqqPjVYaaATpJurfLIn3bmRLZq2Ai40s12cYXAXD2XD8e+huyfMQjOLw7lCQbda3tVfU8xT+15KM2ZwAfVABeTQ6+eKD8JVVWpVfVYTQoVfwwQq7vMFfL/8sicg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SN7PR11MB6923.namprd11.prod.outlook.com
 (2603:10b6:806:2aa::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 02:41:25 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 02:41:25 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v7 12/14] drm/i915/dp: Account VSC SDP in min guardband
Thread-Topic: [PATCH v7 12/14] drm/i915/dp: Account VSC SDP in min guardband
Thread-Index: AQHdRTQ4P/LP3J1cPECbn4xh+debxLbQfyrg
Date: Wed, 16 Sep 2026 02:41:25 +0000
Message-ID: <DS4PPFE901A304FFF18585AE6FB1D850B30E3B92@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
 <20260915164657.3429075-13-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260915164657.3429075-13-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SN7PR11MB6923:EE_
x-ms-office365-filtering-correlation-id: 03c0d285-cf09-4eca-6a69-08df139c006c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|38070700021|4143699003|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info: 6cecV2weLjYpAvX0IxoXgt2+qaodNUfR+n9UATT2fntKcsgxdIfMkBWuEdW2sl2vigPwADL+finslscSeBydRyFuuSJvfNpOfPPxuzvDWiTjV1nGTLasS+tXT++df0Oxe0GseR5Jc75jAdAwJPXGRgBNpBTulWknNGT+gFQg9NNguLSfFc30tfm7r4SA6ZqfopANLurzaO6M9l0TxS21V8lCccp2ZxBIccQhU1+XQJNdFugrvALrBnirfMt4rnxOcvBuRzqdnH7RO4NDK7Y1G95s6/BfsLLwyM0oQXpvbv68AMWVKTF/4hCHyuvUMdfWiGs7a9JrEcfHvZfuNGV7uYnPiZ0KHq64OkBAWZpRyVEt1zd163CcASGHN1ci4Boz+XHQpjDq8kDzmro+XNstwXNG35j9f8nJxEFJmkA8NJ4dK7uElyLtiRlBCGrPaeKPjJLAOpDzaOMAqDx221SALH3XC3+lnLjwqj4+SIfJJWyYmA3AYYhS8JqaUG7TCanW+HS9LusdqpAeSVYDNas+oGg83hp5C7iiyk7ngXzJODPLn09IrI3NEcBM3YkIUbgNcQpmHQvp6z26IkSR8GyVtNuBxG1Pjt9YWq3275wH8j5z/oP23MX7GNyByQE94zdhlyVNEyn4etsnGuI35FC/31kWawj9rC8ZsX4FLkCSoDv39vGv0zIlPSTiurHUUI2ZX7jNfz9AbTIjb3n2K4jIux4UozC1K9NO98p7kVx0GFk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XBEA8Fcz+z7EB1AEvs+wypjyir/vV+mb4VCNRNOBrjT4IX4MGdSSOVITEtPQ?=
 =?us-ascii?Q?SzDOWP+nOHG++9HuRtezsYbti27pwQowUaubkzrjFsFqFC+TGQi2hNWBnrqp?=
 =?us-ascii?Q?GB0kYOoKPrdDF8sbQVCj7aKHAcqRf8U0T3Fgk9GAQE6C5RHs9XYczuJKj1/P?=
 =?us-ascii?Q?HoXHm7qaGb8zAba7XACAD+jguc1amgcsdjcPmXjqowPoxMDjS7UhUSLz4l/Y?=
 =?us-ascii?Q?0RU0iUOZs+u08ar/dyDbQdfSaQ1+49ORJPngyTC36ah/CVh8vBU0RQWevsXp?=
 =?us-ascii?Q?Crc/vGgjKbALh5zy/G+RVSLxQmeua9TpDSF2rcTcFEgZCzDpdRASDloZ57Xp?=
 =?us-ascii?Q?j332axeb/j2E8ktUScGrX/sSlB7O0ljcsNZejThS5LHbwNPnksLFwwveh7v+?=
 =?us-ascii?Q?4f+CW6/I2URcvKioNjj34h1EwTJ/PQ4nRtAUbBRKFgcs+kUc/X/hXL7xs1P8?=
 =?us-ascii?Q?WGYijvHZ6QMqioSYAzI9QhDCdTMuVVsqinMhhTfv+SO8u3+VGFfgLLtOm6AB?=
 =?us-ascii?Q?QaFpX8JHUbgti9d4OHuHHQKl+tyWJRAnu2cWKQA99I4XUrB2QRzqg8W0907m?=
 =?us-ascii?Q?cQa7urdTs8z90VUR+MpvUtqSHqpREkAgpsq/HERQLFSdUTNZo9xDX2QvdXxU?=
 =?us-ascii?Q?a2sSPHGNXFio53/R1RKNke7lUzSan3N+VKlyD7bIaosuI9UtE9g4q0acFeTz?=
 =?us-ascii?Q?EfrSlUeV1C2BRnasMsLkgvjF7LW9sdqsKjONMRX5YCVVOgR5IF72bVQfUyPe?=
 =?us-ascii?Q?laISU3Kfl4e5V6AqimFaA7nYI9k/aRdACQJZ9YOqoPn7nPB5uzF0uFcRPZMk?=
 =?us-ascii?Q?5bOWonTx3ho5BOXG7N8sWXJQ1zAeZMz7WTRZE0ka/f4cPKGkJ3V5E1zF4UfL?=
 =?us-ascii?Q?51Vd2GmValSyJTlEkBW6xmB+LOG6foTjdwcnCHGtRP/P6JB8v8ui53CzSwcO?=
 =?us-ascii?Q?tAask/dDQTEfDASQaJFIaa9WGQSTv3iPdBDgENQtnellmHMF27N61j91PJ/7?=
 =?us-ascii?Q?IRjmPPWX5iJOrme69EVtQo4UGXrqKuJQq17Mm7dhUhUdM+XTOKwPk455DdE9?=
 =?us-ascii?Q?YtrbFOv6huZrpNsEgmdsS5wfiLsfyr6Ku36TqeoxzG8OXrjvWQmtuOARzfgP?=
 =?us-ascii?Q?IpXMiRkujSwz5+yiz5bHwXgyaa+J34wMKdgjcm0yOS+kNR5ltGfqkeWWG7PS?=
 =?us-ascii?Q?IObGPmgVygRRhk52pW9Ccz5g89RWPqTOucctYh8x2UB3L3PGxyP8kyaffHzs?=
 =?us-ascii?Q?YtrXwLQyVk9vQuHOlm0z9kDEYKSMiFExjL6TRuqGfN2pmCJuxHLi/pzoC1Ta?=
 =?us-ascii?Q?ZoQmfX8O+pTiytF6mvKQsUrt5sl88Gp8xyJUKzBg1pTGoqZRpV7Cei6NVTYs?=
 =?us-ascii?Q?VPkar70IIL7lqVPnl6sYxV/X4onYMk8oOlPkfTi2wGeN32ng69KGCIrDarjc?=
 =?us-ascii?Q?0JL+CdRaIYg0nhx31fzOs7SrUbGcpbuyR1x3QENgCohgygEArrKd7kKyjv8d?=
 =?us-ascii?Q?MdJ57ZgANSNXX7wL4Gjs+xeTNrs5Se8Q041no0A5q8cP0n70N5DEWAgg6nsL?=
 =?us-ascii?Q?Ev5g6kRfbrXZ24SeUfD8/EZUhPYxhQCV+ZK3FiAXGJB3yQ2zjIPXBvoxQQJD?=
 =?us-ascii?Q?vRgCtMwte5ZKK6npp5hfgdLFZfaDVypMiZjn8yTa4dQre6ipGsK7EOMfD2FD?=
 =?us-ascii?Q?ro6PNA6Pqe/AYfuTcLGaFZEbRO6jbVgTaVafc8V7r4unSmrWBp1Mu6jD+xjg?=
 =?us-ascii?Q?d428kwR+tA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PATteKIY8GdurmG80phAxY+vLS8Zq8dE6JBaEnKhzQDnpziOpKN3Sf5pCNwY9EmoHgWAMnS9LjNrEl0xJfgsxWmoU2YBU1g0FyvULkmc6Qmo/aCMYBJYo6uACwHzvGyvMtV0n+JUCZiBt9yMDHkd+UKeJnqQKo8t9gRize8EaZ4qLxQrK9DyuSe1WVD806BxNtREnrpS7wj5jc3x6uInzHsaejmZR4G3CVf6LZq8Ht6RBeONRq/eF+X/1BaEyqGEcLNblUdaOGwKkv1fzyZ1KhOTMaTLmPew/NsNcPd3g6dv3zwgfiwHVYkm4a25Xpoosno35mLW58baN2sUygtdfA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c0d285-cf09-4eca-6a69-08df139c006c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 02:41:25.2374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0/jQ+AyTYClZ/lhYydo060VqGN6Di0PujylhRAmEqcHKnAwxW6zOl6VIq1X6uq5Rmw9Au2TZxRgHYwO7soWvqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6923
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

> Subject: [PATCH v7 12/14] drm/i915/dp: Account VSC SDP in min guardband
>=20
> The transmission line for VSC SDP is the same as AS SDP
> (EMP_AS_SDP_TL) when AS SDP is enabled. Otherwise, it uses the second lin=
e
> of delayed vblank. For VSC without AS SDP, this requires 2 lines plus 1 s=
etup
> line, so the VRR guardband must be at least 3 lines.
>=20
> When both AS SDP and VSC SDP are enabled, the guardband requirement is
> already accounted for during optimized guardband calculation and the fina=
l
> guardband validation in compute_config_late(). However, when VSC SDP is
> enabled without AS SDP, the VSC SDP requirement is not checked explicitly=
.
>=20
> Even in the unlikely case where the optimized guardband is clamped to vbl=
ank
> length, it cannot fall below 5 lines since such modes are already pruned.=
 Still,
> for completeness, account for VSC SDP and ensure a minimum guardband of 3
> lines.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 8c3a324e164e..018dc6303dfe 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -7359,6 +7359,8 @@ int intel_dp_get_lines_for_sdp(const struct
> intel_crtc_state *crtc_state, u32 ty
>  		return 8;
>  	case DP_SDP_PPS:
>  		return 7;
> +	case DP_SDP_VSC:
> +		return 3;
>  	case DP_SDP_ADAPTIVE_SYNC:
>  		return crtc_state->vrr.vsync_start + 1;
>  	default:
> @@ -7390,6 +7392,11 @@ int intel_dp_sdp_min_guardband(const struct
> intel_crtc_state *crtc_state,
>  		sdp_guardband =3D max(sdp_guardband,
>  				    intel_dp_get_lines_for_sdp(crtc_state,
> DP_SDP_ADAPTIVE_SYNC));
>=20
> +	if (crtc_state->infoframes.enable &
> +	    intel_hdmi_infoframe_enable(DP_SDP_VSC))
> +		sdp_guardband =3D max(sdp_guardband,
> +				    intel_dp_get_lines_for_sdp(crtc_state,
> DP_SDP_VSC));
> +
>  	return sdp_guardband;
>  }
>=20
> --
> 2.50.1

