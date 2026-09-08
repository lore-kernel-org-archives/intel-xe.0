Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EF1C79FA0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 08:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EC610E25D;
	Tue,  8 Sep 2026 08:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQkrmlFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D83610E25D;
 Tue,  8 Sep 2026 08:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788854644; x=1820390644;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1hslPjlJlqhs4kVtQ0o1q+2shCbFVgjg0aHrk5ZrFbY=;
 b=EQkrmlFAqMWbQWk5+CIj9vLt9KSxK8DpIRJz8MpMxagvW3fqpuFdXlFz
 R3mDN25qApzy6onkq3DE72/dlgrFFTtpyng/Va6jiV07OECSjTPqMhpb8
 AZjOOHbu+6WBPPNwzuGp5Uqr6tGdsCjvgmmHaU9ame0xUzVa/jenmPEom
 v7EnJcpv74gHvYuWllvMXxMewNo/VOHbkFoJHz97JSxFRGqJ2nES9uA3U
 EL6xCRYV9wog28tQYhi4ojA9SkIzMt8n3j0x3X6bJF6zVvYxl6lul1ALi
 0herUMaDwh9/uicaCQA8BFESePGz0NcIIc3jLcMnKsNRWx6b62SHKUx3G A==;
X-CSE-ConnectionGUID: BAmSCUWZRZWn8NvtsCK8yQ==
X-CSE-MsgGUID: BqqZu0QsSX+EjXukTlLQcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89453118"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89453118"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 01:03:59 -0700
X-CSE-ConnectionGUID: NDHXqGDBT3aFfGRrgF7bVg==
X-CSE-MsgGUID: Erqr59olQDSUL66Q/KHjpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="272861765"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 01:03:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 01:03:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 01:03:57 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.45)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 01:03:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAklBxGZTlAxmz3gxgfcOPO1UwlpRzwG7ZdhKI8BT/Hg2052XYMPFf893zd9prinpxcQknwEB9trfsAF5cIanbVLeLYfTMjaopvZ/AB6bK6970qEWeFoW66Xw8lyEcOfm1d95Hs4of9W/7w6FrGDlD0sZzDHEBkqsGKBjHDsyRuexgNl9xOTJpgK1x7V5FHDfWf8gV778WL6F4tHX7++xw0koFKsuHtX2ey90h0nBAhMj+pfICXYqkLjRPMhMu+zHuLOTDKxe0F2pk/qUMxLw68Jb1u1GGSuzBXV8gDgZbYa9mh7iGrOhHolR2uE1dOtOsnpXDmYWzMAXhueVWlKGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3m1eAjuzc263OjBeoo5IlIbvp/MhJwV0gnLevAoyjTA=;
 b=LMNFRNRcdvypWh00Em0zbTeoNE4PEPj4u5IL3lKYjFfGjeHL23btCt8AQ7Ma+4zSUUd4AI/YAnhvAngj3jFJABqxK1Dh4q2wIo0WuFZuk/KzeFFY9TwuBbXsKXM7Xr+asGp4cBT5aceeJu/zahtmUfXHl7ktZYiPL09VjLXhJyosOTnCMN7Rtsfd+WjUzMtMnSAs6GKPIVvo99O2kh1+xrRYO2+5K3zPjLH1ZhxD9wPXwAb0rM8B3izQp7de4Qdyg1MIqyZ6Mf7tkpz78z1+BMl2nSo2p08zp6sIFzAHRhAcWWVrRiYKeAjlvhcuR94qpxi80Bem5ATESF7XArZ6Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH3PR11MB7913.namprd11.prod.outlook.com
 (2603:10b6:610:12e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 08:03:55 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 08:03:55 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v5 12/12] drm/i915/display: Dump DIP Transmission lines
Thread-Topic: [PATCH v5 12/12] drm/i915/display: Dump DIP Transmission lines
Thread-Index: AQHdP1zNx8IanWkY202ahndadwSNT7bEUltw
Date: Tue, 8 Sep 2026 08:03:54 +0000
Message-ID: <DS4PPFE901A304F841E901D9811F3690316E3B12@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
 <20260908062224.2897987-13-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260908062224.2897987-13-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH3PR11MB7913:EE_
x-ms-office365-filtering-correlation-id: 2f0149a7-a834-4942-ad27-08df0d7fba73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|4143699003|56012099006|11063799006|38070700021|10067099003|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info: YQvT8pzF9XHKGrRUsJUykD6S/k7OYwLsFGjOURuEAeQf1uyOyg5YT/ZQLRZp5/ixyz4coUX5XF2Wb1siXBJHDVDgEbcMgtR8Xp4kLIWgJn3rG6kVRPFgoxbD81nykjoTNbk9XgWEte4ykkTwnPBV9X1LACP4s2zqY8VBSdOEnsFQNW0tyaMhcG/YtC/WRkBLY/A9YC0sb//GOKGM7cxc3cL5BViNtwzVTn8AeBGVSM4lmG7cjGghZVKjDVxsQKyrj5JS+s1iXbTihRgMw+uIz/KeNRSW7Rd8QJpnN6ND5v+o3v95ccPbmJMyGIvAGV3ehbV6vW8W++Ov6AzocwMx4yaPv9FTgXDa2I5rM4wQ0Rx7o7MxRbU0KiLDo/aFgvzLsl4GlF8Hff4DuIaB33/u0mnluetP6DIep0zGkYgQSORJBASuW2YcIWsjNGsriIcC68SWNDGs7dhEg1hVYpRTLyZAxMY/ONyNu+V42ZojGXEWzzuy26bG3aily2z1yGX4EL3f3Fpg/otvwhxIev+vC/fVOWAA0ywap4OG951SNYm+XgQqOKXpE90Xk5wEe2YFhsnI2vJcNUSrkRZDWG+vcIILxWZ20AuLs/VX7N7sY+gMWfVcO0mmLlR9sudVHWXMZzeN3regH266gp3Z/VV6X+EdzZnTKhpq67ZPm1GgKkAE6YJjM6eBQ8zU3jIJhMqFwXUpnMMxWOCA00RG9LNBqy4fzuynDuKNmCloBguXi0Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(38070700021)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s18NW9CJ45OvHY9hT9PoSxXeHqCgOrNfkgSvItuysSK+E8Rmm1vlxvk19dWr?=
 =?us-ascii?Q?JdBE4fMTzxWazR+1oMDmNf4bl+8BNksjRt/qkDn8tm++GVaa7MRbsgK1bMh0?=
 =?us-ascii?Q?YoEhVrzUUaCOE4KlL3lOWyfFySb4iNXSaxjf4UJe9hcFW9x161w0e5weALsC?=
 =?us-ascii?Q?0ibbzsw58uICBPBirGWEEbdtB2Z+9LTFDRF+Pw2SlRyMOzzSX4KiV7lD787Y?=
 =?us-ascii?Q?qs1iLzdsdAyhk0uGbmeoV0FSIcGUQNjHXfplK3FMlLf8VYXDM1rzwuGxJHnA?=
 =?us-ascii?Q?pHmuU2oDv2YRFK2r7nNDoSzCWSlH0TuHBZ/ffHtEWk780H99Ay1X287VGLcr?=
 =?us-ascii?Q?gOeGEzivj8VTOIkLLjuW9BWCj5ZltV6afn22y2i6a2TiHl3iM1GlZV7dO9+I?=
 =?us-ascii?Q?swUErslBhLDReU+xsbmbiOeH2VjK2azmlqKi1vIgJfdayUd2FF7GTqQ1h6/g?=
 =?us-ascii?Q?qFnK1T85HacXMPSY/nwDx6x0qDW0/k5S89sVD0QP2cci2UHVTi2SegI1HVib?=
 =?us-ascii?Q?kcJWHqLgIXSbM3lLe4gaWqSuF6jv/IJ56fRQav4x92l/wEa11u4Xi7lM+gVB?=
 =?us-ascii?Q?8rYV6fG50t+YrJGh6rKNLD0/amd1ebDke87bLE1nHAQ7SnMiBsW6rItLktM6?=
 =?us-ascii?Q?8pIrtvMyolcZhldJ/xOnwLYAneO69ILXU9YyRwa7oXkh48PF9SXt36sQgiuQ?=
 =?us-ascii?Q?GmuV1eg6Axj3V1gQt/Yc0JiUCxMgQILMZQbTI0K76E875U1ZP49Dqz1dPHzq?=
 =?us-ascii?Q?/bdWKTvaGle+8Ojc2H4PBeVTaD6Qy3GyuvObluZwPiEp6mXqg8+8O0kNT8lO?=
 =?us-ascii?Q?N5oPhbMXNaRccAmc7bBbwgG5YHF2iv6jM6KzDgI4+TCkrVZ+QrO7gUi67Idv?=
 =?us-ascii?Q?W87XRD1OmFu8vFQ3w14Xj5zXb9HMs2sH/B27nxJLvc+qMRxtJrNjEBAHgiNU?=
 =?us-ascii?Q?wMEJ2/FVTYHBs2+3rHZfA/uZGh08KDx4cqwYSlJHOM9Lc0Pe62wf73ZHPFKQ?=
 =?us-ascii?Q?iRIGdPoq5BqJjm9Bukdn6fygouS6FY1EFaFbbWFO7K4gmiXs8hl1ApduttA/?=
 =?us-ascii?Q?jzgly96N64X3T2CSsbkk69Cys2k96Nx2CBJ6WfTsb9YhXDtKxTcV4bCmyvmI?=
 =?us-ascii?Q?/yCQUQR2rharM0yhRd2VDipdiuxUHZ156ruPxsIWUvst+oYl+uh43AN/01sI?=
 =?us-ascii?Q?RROjCMjywM931DvE3iitjN634L4UxYfMIQ9SysEl7BX0JyZ+cxAOgpotYI2S?=
 =?us-ascii?Q?wcjmGra/LR/VHC9tAXYtWuBvFARNb7xzox0JikTgprqN5hwLrrDVBLMkmHNp?=
 =?us-ascii?Q?dPvGF+0CiiZI5UxRm2H8eoLpyCBtw+egjjFliWAdk6KpdvFHcW4m78o/oCTF?=
 =?us-ascii?Q?85VEKXIxOzdPNb0SgCtM4aSyius2Ws56YRjmpWQYCIUrsWfNASfW94hFIglh?=
 =?us-ascii?Q?+npjPvdSSg0kWjbLPpb0ynizoQuhOFUYj402k+C5/05fumDR/qs3xjZQLmjQ?=
 =?us-ascii?Q?ud7H3YXgWOaTStMUnnGy45Ja/c8NbyeoXXmOi8fg5Ek0AGL3CAqVhH7rE+es?=
 =?us-ascii?Q?w56rsXmNas4Fta3dy+1RPFIGeo7npfQGUTdkLEXqqHS/opB0QVquPAM/GDWR?=
 =?us-ascii?Q?LGVsV/XkjUimhSBK1uSxV6gj/kyQfTP7F4NAKTCU/t5LqBPcmx9gIrqKQGEI?=
 =?us-ascii?Q?19/OKdjzs3TS6mlRKHueZu9d9R5Iu1I9KVsvS+R+EcasgellyoF0hBdMv1Y4?=
 =?us-ascii?Q?EvdcuzcPgg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iNQAL2FI8aSKuw8E0tfTKbB0qDX1/fm4pYY8QHyD+AkU8CbcsUzSHUd8ZVeJAO3DwfUeClaeQSm+zBMflJRH7XyRyVtTAmxlKzPUZ5T2n9gn/bbZ2FulNvQ7IOSaWgdsN7cUSfRf06fWZxX3XKdkujmhdORgmwJvjN2FJlRbmkzjmvb6eph4RASVIL9wIjAbCgseQCNj8NJZCxhu5TfiQBmL9Dzf8JhuiOg8Lj/jYe/scXb4Pe1BkKAsewJmPYpEkjCzrFb+zrtP+wWwWKfu/7WIQW/PL5qque3Jk4wRQ953A4P2BH1/2+0X8PhQhcPjmPJeNkaZf5PvxdPUTTNtTA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0149a7-a834-4942-ad27-08df0d7fba73
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 08:03:54.9789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JozKQEMaZczb2FsQwsFaTfqKDZa1p9BWoH4jE70+HJEFINu/YoX02CsdzP/u1/V1BWPhJAOPdv/iPr5DsXjNmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7913
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

> Subject: [PATCH v5 12/12] drm/i915/display: Dump DIP Transmission lines
>=20
> Add DIP transmission lines to the CRTC state dump.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> index ad4f362e0c09..92675a88b969 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -251,6 +251,15 @@ void intel_crtc_state_dump(const struct
> intel_crtc_state *pipe_config,
>  			   str_enabled_disabled(pipe_config-
> >has_panel_replay),
>  			   str_enabled_disabled(pipe_config-
> >enable_psr2_sel_fetch));
>  		drm_printf(&p, "minimum hblank: %d\n", pipe_config-
> >min_hblank);
> +
> +		drm_printf(&p, "DIP Transmission Lines: EMP/AS SDP: %u\n",
> +			   pipe_config->dip.emp_as_sdp_tl);
> +		drm_printf(&p, "DIP Transmission Lines: Common Base SDP:
> %u, GMP SDP: %u, PPS SDP: %u, VSC SDP: %u, VSC_EXT SDP: %u\n",
> +			   pipe_config->dip.cmn_sdp_tl,
> +			   pipe_config->dip.gmp_sdp_tl,
> +			   pipe_config->dip.pps_sdp_tl,
> +			   pipe_config->dip.vsc_sdp_tl,
> +			   pipe_config->dip.vsc_ext_sdp_tl);
>  	}
>=20
>  	drm_printf(&p, "audio: %i, infoframes: %i, infoframes enabled:
> 0x%x\n",
> --
> 2.50.1

