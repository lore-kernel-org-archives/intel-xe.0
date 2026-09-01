Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A324C61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 03:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341F710E372;
	Tue,  1 Sep 2026 03:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXfKt3Mj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA85D10E372;
 Tue,  1 Sep 2026 03:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788233405; x=1819769405;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gMpIdmcitn4sX1uC2wPTqOT+kUGo/Hrs/1aDfBSxOiU=;
 b=JXfKt3MjyGc7EgIRvfhOG19p5mLA4J9TIdtYP5HzQ8rJBxkeRDGeuDvy
 /Eto6tjkn8yzSdQJUwkl+/wNesfxjbmShbIs3nAytlWESN2IL4mlLirDt
 P1z3O1NMRnwqtJpXjTx+zqMxcw/UJRFjifujQZRqcp8IMXy2t0eK6mRD8
 mhbl8528C6+1Vg7FWNrwwD/9bjYGMWjQdobKkfXvB8F9Sq7VCb0QaEa2L
 Pjx6H0LBKBHJ84z0/3HGDueyznAye1VV+UTg0ybgOOykuoRuVW7NHdWrI
 mhRkR7Ik3oi5gWiyBxLOPNUTXReM+RBSTQ/qkbTfeiOPhocaCJ5tYJjDo A==;
X-CSE-ConnectionGUID: 6XoWaZtHRLGgWIJnZaDxPg==
X-CSE-MsgGUID: fdx1Z3YaSweMbqoAKr1YtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92336420"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="92336420"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 20:30:04 -0700
X-CSE-ConnectionGUID: Vn8OSk1bQS+4IBTD9WRzVQ==
X-CSE-MsgGUID: PntndVY6TO+YuUieSSogkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="270890095"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 20:30:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 20:30:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 20:30:03 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.47)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 20:30:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJ0S/q04uaQVbp9dUG/igdnFKqEP/NKUHWtwEd3UlIAevNSlF4eXHDjq5C6P1MSAlBK0HgVgBvTcwxGhCyk2Sp/hrgAM0WUSVPeAOOkDcIdq1J/rmAqLbW7+JxOTUT1M3hb/D+gI86XZM57p38mozxrBtAAJsiPiLVW2OdgbN13mxbXMC55QBTht51yFgojJ9eHAbJJ3YtvLyRSRlC4TZ4nA3r5v9pyS5K5UurWthoHXH1Q9FA1/HHiYGDC5KnNarZnbGz33P3mB6iHNGc/saI1/+UGM7ZvM8OSFy1ChDsRl9J3i1KQ3A+JwpTgLxfileYscBwrxr5p1bvdiieSpFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyVJkeFeZYI2FMlSNoqyMxcxvtvZ75X+l03qVKgfNNk=;
 b=HIXg6tXxHEGlotu7Y5Rr3829+q8jLe4AYIFenSukYaIN9sALbLZPesBhX8++RhikAUG2uBj/0kN0eB110FgBDZhdj+2BJZqVVhoLGLxQJaRmY0XThtjc/+8LwWAOtiTeSuqs5kniEUUFOcWQoBv0AJ3AE1pxULthY8jtAyA+ls25lx+05Bg6F2wqRNtsw3SSAMCiktNEVn7eI6T4kYTlxngOyUsu3WlkM39V7pvFA0n78HT/X7AFjUL4lEb9hkqgaZyztTS7aqfNDQzGnKZjGffuIzbGLy3JEZTpPLcbTSQgfiu2oxkCdbET/eZipGgaBCw4zTGU/gi8q77MkYpOlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH3PR11MB7676.namprd11.prod.outlook.com
 (2603:10b6:610:127::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 03:30:01 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 03:30:01 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v4 09/12] drm/i915/dp: Store SDP transmission lines in
 crtc_state
Thread-Topic: [PATCH v4 09/12] drm/i915/dp: Store SDP transmission lines in
 crtc_state
Thread-Index: AQHc+XcvVwV/e6CgtUqYYucIo78uQ7a5kMug
Date: Tue, 1 Sep 2026 03:30:01 +0000
Message-ID: <DS4PPFE901A304FF139C3FC58351950B2DBE3A82@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
 <20260611073316.1439306-10-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260611073316.1439306-10-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH3PR11MB7676:EE_
x-ms-office365-filtering-correlation-id: 9a71c294-f099-4429-6911-08df07d94e66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|38070700021|10067099003|11063799006|4143699003;
x-microsoft-antispam-message-info: 0mdYFrmaeqEnxKi0BkX3i/WHRdAk073oXb8GDAaX5jE8jESb1ZXcYvgqvIJgXb+P83vgCRJG+QbnekezF7HU5q7dkxZknSFxut+ZiHsQ+RKGsmfqwbDm0hFH9svRP58z/oniiWeYWdTCIi1l2h4uW96O+0l8BZvGky18UH7kKez8b56FtiYtPwvavHkO6eBi3MZ9xc+xBR57NXqeDcHu+FMIbUznJ1S7Q25ObziWmCwf2OqC3tc8/ChEKOjsdPq7xnu5w6cGLJaGQ7xKWy5kaAAdAxHzqx5hoY2m69PIIQEW1crXJQVi2iWyORmhGal18Lf9aadFSFd0G/yhDDxB4+VPG3TfUM6a7tXu6JqPvyYEFlflRsECpvFWwZRAlHXphGeODxfu4jgRy4OqpNbexqvd5MsLWWTB07vvV8nUEmITlwSGt1OCpejShImp4VjID1LZUElO/g5y4a5GV9fslHndFFeWH/gZWIRRob2HgbN690iQCMkHwbcWfgtoplEex3oY0UmuQ9HFFQy3WyLJHLkKiWD3rySSRVymJJwk4dWh3fC9g3kbWpbgocUB91qbiMZligtHljnNQcTP5NfDSfN83BE+REHM/bi24RBN45dAyOrPa9t7nFQcQ8Af5+Qu8eNqKOwWsr97o9cbUJFFkuDZ7L8TGnUzsVf0MEDlxiM7CtCqMoAyFuunOLhvQ+A1qCRhKfDRRukl2m16ErbnzmS1u1x+0nxzvVqY5C7mWFg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(38070700021)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/537dOjtrG7Kgrlp4u4SXKMCEtTEDl/kqEygGmcb6C2F8Cx/kln1lVk0iBcl?=
 =?us-ascii?Q?G+FB5kTlOdualuylo44jlnNqDZ/wAYn8G+KCjQn4+W8SXIx1Rk6GC/ZcW9xJ?=
 =?us-ascii?Q?eKq/R/i1zULyeFjnrzahRAL7XdYeeyZGFeAOXV/vfkCAyWYR9OQ6qYQ3fEsA?=
 =?us-ascii?Q?ir3NbMwu2Ca6oNCn6JTlWPi19Yabx3TFIVSZnWZLMPrmNV4uz+PVwM2Q3Kyz?=
 =?us-ascii?Q?XMscHLoqCLfyx2AKpxqPZi6Q0nuZRWggmb29IakNzR6/vnlAurn7o2QjdRI7?=
 =?us-ascii?Q?H5iAS1rbW0yZpcCDuXde+wQxj1uzGQm88dJ9/Vm8hk5WGnjiqL9la+LTxdhi?=
 =?us-ascii?Q?w/9HgEQJEbc4D++fE7NtwTcPc0kgec6n74R12sSseCpsZatMEBirSthKC9YB?=
 =?us-ascii?Q?Y3NX2V8H34vYGFZViLPnTzIyOQ92qMdWBO6g7v3+oEW9WjLAdXFFQHTvFq5y?=
 =?us-ascii?Q?Cfx+46icnscdAKY3Yjt8fOH0mue17+5SEu+bCaMutxB4Qsq6KZRjtvQIYYiz?=
 =?us-ascii?Q?XAJiExGDfr7tcCuBDE+scSLGxpA4LN1opJBaNO0SJFNOIgZtx/rJbw1qTV4M?=
 =?us-ascii?Q?mGgL5aR0SS/IYbC4a0x2OVg9uEFZIuf7AKAGWZh81LuWoMkei6uLsk4AxUch?=
 =?us-ascii?Q?nX5cqh2z4uQDp0ng5SAziLpTqpk/ZQl8whjYsjllXGIqANUWegW7Rm2jAyAX?=
 =?us-ascii?Q?jBtbmCRwlOYwQSIbcygE6QzD8G96Ef/c92zXtyt9Fs+9qkRfLqIsq1rk9bnu?=
 =?us-ascii?Q?5J48/cdGCL9Rx1u7b3s2PaHbMVj9odqdIBReCQs6l1/dIZenx7F0Kkp0kQfR?=
 =?us-ascii?Q?6t1CdRCz+/jDPat6+8ZmaaXL6QOun1ATXEocC/EvD0W5vnByagY+pUk5Ktg/?=
 =?us-ascii?Q?7166dnDoE2yyNWclcVnCaBz87rm4FYo2ASNEYG7b+0trujzGuHrLefJeK0Tp?=
 =?us-ascii?Q?P42TJFKr0P0xp2ypcI+fca10T0iouEHys3O+lzd8h7qFg8FoDEDlt2tk/EKa?=
 =?us-ascii?Q?zpSegHBij1xoSGG8CcF3pQqHItqcMsjPiqTIRNK0+e/znYQ14ZdHzdCdw/Yv?=
 =?us-ascii?Q?AOwp3iZnxAdcKJqFdtRWsMWXjk6jyMrJ2Miz9c1EeLHLXbAjrCjLxFNzCxw+?=
 =?us-ascii?Q?2Xj+rEp5RGthiZWCmwr06AQH5CltdlbkBE+1LTV/cLO2wMj6UYfhqDvlocAB?=
 =?us-ascii?Q?ImgoS8pElj7BtVSZEtFUmXIuv0zeOpSLDcJb8PlfTalssCZlCdBEiBgyPEuB?=
 =?us-ascii?Q?M9s48INVSYEEeXxMeHEmvomG5QHiVeWV/dcKEu0mlSn2dn2Iksp5PkpqbUKG?=
 =?us-ascii?Q?TSFktTT5AIDOHNFx5T9z2UsYdp634Iwo3DoQ6GAVclUSeYAgOedRWFT3b6pa?=
 =?us-ascii?Q?rMlhcIEJQqQXAOpgzZXhdv37WD7UBKLXGKUkbB3D0JDAhDn3fms2WR/gPuyx?=
 =?us-ascii?Q?hY7qkOno5I+UWfBQJuYqd6Znt2z/7iOOfGzESz3qggc2eObjzRqRkvIjf+c/?=
 =?us-ascii?Q?J74D+BKhEr7lwLF7KKGk5Hc0n2wYDXcZqHlHWYmVDx7rzMRkXuoSM6JLmA8+?=
 =?us-ascii?Q?oYB10V8K8Lvb71N1JM6AmRPi9URheiH8FL8VF/wwQ2irKRe6BDirFr90RIJh?=
 =?us-ascii?Q?nqGQB5Hm9AJvMeUIXAOBdHdvQlUCm4o4NswUOw/uQNj38FSBHVNqRY20aAQK?=
 =?us-ascii?Q?f8V+ASjcGbMV79kYn0jq73jqjARS5g/4iIk2LPcgnhrbqoL26D5g1TV5p3Wl?=
 =?us-ascii?Q?nE6F4kD/aQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: yYtG+r6RF76IAmdeAfTo3uuD91xG6+PWOfe6+n4hnf2Rut4G3oiYhiIbRKRSBmca6bJTkOXgybzg1qGJsoZm+XaCapiz4PKpTHC7/1Zbhxz135+Rn3Ec29iN0v74J0gh40pnAtSQiq57TZGn0SbYimrBV3e4/V8aN3bp8KtfCBVSuVO1QRkfpWhy1fhcoBrxZYo61MdjaI2g4gZdkR043QyBFtYaTPipyCKw05VCtS++EfeQmBwg/HEbxZes7BGwhlyrmURw4z9QryicONVt+/YSt2ZNZAWQhnRitzH1zNvG4vp9qOVmMOxqyMtbcTVW+qO3jae40Xyu70O/5b3J8A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a71c294-f099-4429-6911-08df07d94e66
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 03:30:01.4155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LvcOsJfxNpS+VEivgcZpNAUAqsAgyXRrcmCEUzeBHMXnoSMWuZBmHagECgCxRm121kCstn2zKdwpeeMA/pYBcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7676
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

> Subject: [PATCH v4 09/12] drm/i915/dp: Store SDP transmission lines in
> crtc_state

This needs to be either drm/i915/dip or drm/i915/display

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
> index c84ee0e865ee..8807897538a4 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5508,6 +5508,11 @@ intel_pipe_config_compare(const struct
> intel_crtc_state *current_config,
>  	PIPE_CONF_CHECK_I(set_context_latency);
>=20
>  	PIPE_CONF_CHECK_I(dip.emp_as_sdp_tl);
> +	PIPE_CONF_CHECK_I(dip.gmp_sdp_tl);
> +	PIPE_CONF_CHECK_I(dip.pps_sdp_tl);
> +	PIPE_CONF_CHECK_I(dip.vsc_sdp_tl);
> +	PIPE_CONF_CHECK_I(dip.vsc_ext_sdp_tl);
> +	PIPE_CONF_CHECK_I(dip.cmn_sdp_tl);

If you doing a compare in this patch itself should maybe assigning all thes=
e variables some values in comute config too in this patch too.

Regards,
Suraj Kandpal

>=20
>  #undef PIPE_CONF_CHECK_X
>  #undef PIPE_CONF_CHECK_I
> --
> 2.45.2

