Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99175C55182
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 04:53:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DCC10E2E9;
	Mon,  3 Aug 2026 04:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHhhiK8n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0849810E0E1;
 Mon,  3 Aug 2026 04:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785732837; x=1817268837;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mRuKZQF496EkKOfAXv+djzmQLLA5SEFdGpkSqwPXRXI=;
 b=kHhhiK8nf1dljxrSwWv9XqOBnrsvvLq9XTW/AUwhov4lsjdYttU8cZ71
 LWkJwAeTzF2TQndv2b32m0IqV0ADUqqs6/5L76af66yt7KnbkU4eU1zk6
 4OEtX9lQJFonGVsM54DBeEbNsWC+nHd5SkIKOwceobCGPbWMphDCc8bkR
 MAXaxMSl5cQgcNUbO0/biU9aIloEp1M5JcdLnFaAA8uFM0ohb8Ao+qEt1
 TUbF/h6omeLKE0L1uGRqQ+FXmGeFZEVFCK6L/mKTIiJTYIBLpdm2KFfNg
 tx9P0sERcqTCF3gXGzYPCG+TLzVLeMQaidZNEXQaf0KXeodOBoy/5mmJ+ w==;
X-CSE-ConnectionGUID: xEZ/qNLtTRy1cxkoFzMiCQ==
X-CSE-MsgGUID: nY4efHqPQv+so8Z4IuHm/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86342964"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="86342964"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 21:53:56 -0700
X-CSE-ConnectionGUID: St+Iw3YeSayo4QZ36uQY3g==
X-CSE-MsgGUID: SRX8WEDNR8WAdYSxZL414Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="266214730"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 21:53:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 21:53:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 2 Aug 2026 21:53:55 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 21:53:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rz09hU1acFQTQ8LgoGHRmRNquNITFWwNJLORnaEIVWp8zUIuT6aykVbsGiH7RFumIlbUjdpLE9VfSanLj2F4XvGJBVXaeZl+p9iqSDSYQeIOzlMBgNuoD2/KKLRgaMwFGK+fmDnSYoh9oi5BawGDOQnYUSbYBAA/oSqXwrxqGQJZUUMSHoXfLxteVv+PDvxiavZpUSL0qBvnjZOkhY2OT2u4FXv1bYesk0soWZFk//GMFyx5pMxGYMZhPRFbVSMV1a4GC/l4s7nRi4X0n72vG63b5OFbLeTd0UJ+0lbeI0q4GkpOkrwRlfbg0LMy4eNixXyzDUtzZopN5gQF62rNqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOeTp5sfEfrSNZgrJLZSpSROeD1XV1Non3d61IyWJSU=;
 b=wT8mOWnjZWow5nf2CBfyPc6to0xUuYrOXUHKuTzWUV7ostSdSQhLVvkxsE7LJzJxCOr2ak21rHR73gwT7mttkTOIWFRaNnocEiqdLF+zbD0WmInlB8N1IAOzuFvualEFatOLgG2NT6Oc31fTKjzFq+WGp3kyOG3yY5+9UbNGHJWSk4Ih3lhS09dOxzr3RyJzsvEwDW/y9Xujtdmy9j7m6Hb6FVxolrcc3OXlS7rseHjMZPTLo3vsc4tH1wItuKt5qZm6B+/6BlwQdSW7rCtgsuX1uZoQh0tcMv1+2Zf3F6aly1DqzPl1360pdAUh8h8F/fsJZdemvhB0gGv1exGHpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SJ0PR11MB4847.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 04:53:53 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0270.012; Mon, 3 Aug 2026
 04:53:52 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 03/14] drm/i915/display: Pass bpc in intel_hdmi_dsc_get_bpp
Thread-Topic: [PATCH 03/14] drm/i915/display: Pass bpc in
 intel_hdmi_dsc_get_bpp
Thread-Index: AQHdIBP9X6lsaZtKRkGhZTeKSPe2rraLx7aA
Date: Mon, 3 Aug 2026 04:53:52 +0000
Message-ID: <DS4PPFE901A304F7078C21B87D927CB9786E3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
 <20260730105226.2731341-4-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260730105226.2731341-4-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SJ0PR11MB4847:EE_
x-ms-office365-filtering-correlation-id: b3bd445d-85f5-4fe0-87e5-08def11b3758
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|4143699003|11063799006|3023799007|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: auZ68suROYavGwa1ISnf6/p5puRQar/SPJWg4Rdw8IZVCU87Z7EXilv8eQ6mADLmQvsGwhvo2PWKS6HIldlR+cP90v+wsFCabvv47/rH+20e+r/Ix1kIQ4RiRVX06Q/atw+ca7t9Q8fq5q7Nj8Y+THAFlbZc539Ns9fQktkUFa9/1O4buLEdaf88ycLdNsOISfwstejHOnTm52pLpr3QxmqXFu7GYZLIz/faH5bpLgZSqlJbtOrRu7vyULis70Zou+4uC1WY3sCKcfwpDiVH0FQezxDgm+oW0QdrnVHsPZF7R1TZ4zT3DqRhWV95S6vTiYVCdooOHAiYdeOHirfnllTHJuTQUJmo4tCOMhSlE2wsilp9i8VRvOey+KEGxO/1s7Bz7/gMH0HWOhL2l+djnDgat03JyewVGbKNSH7o48R+fhp4omK4Oj6+Fwaq7/9SZzKet4nyS9xu8IMLROD/EZM5rfnGNpF0cTSSv3UTBWjWYBu3y4n7xp4nr5VHix37Y819AZBYT1e8+5FTOf/dodfg+mV+ttC5cY81IzOtlPlss8rxf8VSQehj9gbQdmtgJSOOqN8N8REJBk1UqZKI/JjS/X7bJVdJoA/wswubuAJE/x44E4rlFrD0lVlJPJljNDhsbmjaywMYptJ6IFIiNOQXh4ndjikrKJQJsJl46vfvoVm0FbT3az8bFxG4N+lo3hpRaoh3iotoPfqAiXo5f8WN9Wq9iDKC80ZPM7rpfHU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(3023799007)(38070700021)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4ZwUff1tTYX6BaMAzcgkIBcPeihopjHamCLgH12hmDVYAX8HYDgqrTRzbabw?=
 =?us-ascii?Q?7MCHUzDaC882k/qVGQZM+qyzUzffSPpNRT02u4nn9W+JZsRHpf4CrHhza4lB?=
 =?us-ascii?Q?WspgpYHOXbaP/mJi8EhSCdN5MLCt0kj1w1cEtcfsQWhYF/atE1ZDerKxQGzt?=
 =?us-ascii?Q?AXcCDDSfGDax4zbvZcoGvLGrmcNzo6nxVY4bSGFqrU7L37cdTUl091Ejy64M?=
 =?us-ascii?Q?ohV5hhN/HF/GloYLodZ1cPseo6MkTzAyt7S64CoeQFV/LLmx5UxyaP/I04XF?=
 =?us-ascii?Q?46TeHTz3mXIPCna4JDsbNL2u24cco3W9dJRVcdknraH46BwT2VQprYBpY3qX?=
 =?us-ascii?Q?YH1sxrSCaFVZSMrV+SSQi0LjB+IvsVfCIzV7x8dQ1a/QbA46QxJLYhylIDM1?=
 =?us-ascii?Q?f9Bv34zmPzM4CZVQeTR6Rb1nOw5XZLcV0rdR7IA33MPZDT/relbh5a5TokRj?=
 =?us-ascii?Q?2LSPE+BrOP659wPIuIw7boUwjBios8lIRaG2cUj/UvjwOtRLDI2JDpPtPflj?=
 =?us-ascii?Q?qYGiSI1K8QvqNBEBGOfWIQok7Ti8wBOmfrbU+PBNR6iBhMlcPC+xb4FDPf0U?=
 =?us-ascii?Q?appNzGvghrRWClF8ZJuboxTWiHBmsi92c90qkS7smTZwtrMkIJNco+lRGpAe?=
 =?us-ascii?Q?s7ljC44iECBZbaaWB6U9WPtQ7b/1VyVgjorSw5e9iXq8HtaCRz4SGXml6p0D?=
 =?us-ascii?Q?gF/hrVLEJp/1Xl8cKfcXn1YuZGpWtRid9m+M98LsQZTdmUm/DVZFdGh4K8JZ?=
 =?us-ascii?Q?8YjNCtNQ/SkUQ/Q4DmRsIu3H/rbVNyQtL//MsgY2yHpF2HK4E/NhrPMHFRl2?=
 =?us-ascii?Q?ppllcF9g0K1UW2j2qHkajkkrsk+iRRIgpMGBpQ5zl6l0/yiXWl6uGiupRFDU?=
 =?us-ascii?Q?T64EoHD3rxNJxN37FcOe/UX69sv01gvAhhJYoUVU1zew4doBM7u7TVSIGpvJ?=
 =?us-ascii?Q?sOe4o/mZ/lANagvUcE2WPDpoJx97CR57fm6JAePbZJFlXCmvwL+Q3M7CL1HL?=
 =?us-ascii?Q?6OjlKDIFhth+1avGKb/j2KOcaaS0EO6Mq21HkdNrThiuHxyefSFzIHNL59z5?=
 =?us-ascii?Q?WfHaSNWxnJiIbcFOmlZBUB6mN7DSUBxMdHZqNpKZgAs64J7kj7JIZqHbNPz4?=
 =?us-ascii?Q?tTbGbS6uuIePVAXiJurpHJXyF+jE64ZmIVSak3Mtz4SLw4FhZHx8Ite8Jdip?=
 =?us-ascii?Q?XsbI0WcBnOXsC6vp+TPGOAFuz5yhz6ZPFiKmAf6bD+uHT9oXkgrOKjvLmi9x?=
 =?us-ascii?Q?hF8kP8YGD6RLChUn5de4E6j9S8ehn05wVe/GkC5edu9ubS/bsGcFbP0NAqwf?=
 =?us-ascii?Q?13kbFThiWgU1QMkE6WnoEy/9G0n80TTBXzeaaW6NjdTShhP29/BBNqOdpL4K?=
 =?us-ascii?Q?rAQ/dENzzQdlo+ZBn4GuRDKBmuuj1Yk1G+NAMe77ZYtasq2PLRttoBx1Cyh4?=
 =?us-ascii?Q?iQhoJCUa9RTXkEDsFp/Op6pKLamkzdGldF/qmSTS2WMoMZExVw/h5R+wSqJg?=
 =?us-ascii?Q?jFeW8zgg/bZtpmYqKAtfmjJXRA+Eb2JErsw5mZXVBoR2kXxrLd6xS/fRrUH/?=
 =?us-ascii?Q?GvpIgRHFV1aHbVeOoeF1GLbzxUFWYWfDWAnyLVg8az9FwU/SZKGOabTYIMbq?=
 =?us-ascii?Q?pXLFrNT2IJsggsuSm4vdm9yu3hrFa1lLe3HGFQifAs9tAd4/9QGNZC57LLj4?=
 =?us-ascii?Q?JnIsyU6iwPBmXF1w9HyCCOiTibSrHlM9J60+ZlMZPyGOvvQQqdidHlypNvxQ?=
 =?us-ascii?Q?nTP+xYsrjg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MO519rGKhmRyhWjKIOoeH4ndVqru93+QufFG/VMJhc4jKaee44dTVDSBuunuETDLv2VUMRlRoHgrHIzyElCpXMj0tzX0XcOaCx5rS8qMVEU2+fFG/wrpS5fTFGTvSx+ZsdZeFBrxq4ZOSi9O6OavOqdBy/f2Ms3MYeDGJL4sa2VskRSnd//iUVPPen6JPs83dMfN35VHUOPqb6cG5PKbNND3uSQFKh24wUe6qrjSZKYx5YWmk9pf+smZyaw/nkCktRzNTpxMr8QEPajzRmiC3CkXME3plWSmOqcUF9wzAixo3ODdQ7R+jbycyuKVXAcFcSrW4gZufwNoMtFICTZ22w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3bd445d-85f5-4fe0-87e5-08def11b3758
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 04:53:52.7948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tBh2rZPHY4Cr+dmHuo1Kvs1UgdBqDMnyIn7b1rqsYqB5pfuu9d1hX9MvlcGq1CZi7XBniCiX7dp1mKruQrT1+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
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

> Subject: [PATCH 03/14] drm/i915/display: Pass bpc in intel_hdmi_dsc_get_b=
pp

Can be  drm/i915/{dp,hdmi} :

Otherwise LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> Generalize intel_hdmi_dsc_get_bpp helper to accept bpc as a parameter
> instead of assuming hardcoded value.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c   |  3 ++-
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 10 +++++-----
> drivers/gpu/drm/i915/display/intel_hdmi.h |  2 +-
>  3 files changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index db64e6582286..9d6f144d935f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4335,9 +4335,10 @@ intel_dp_pcon_dsc_enc_bpp(struct intel_dp
> *intel_dp,
>  	int pcon_fractional_bpp =3D drm_dp_pcon_dsc_bpp_incr(intel_dp-
> >pcon_dsc_dpcd);
>  	int hdmi_max_chunk_bytes =3D
>  		info->hdmi.dsc_cap.total_chunk_kbytes * 1024;
> +	int bpc =3D crtc_state->pipe_bpp / 3;
>=20
>  	return intel_hdmi_dsc_get_bpp(pcon_fractional_bpp, slice_width,
> -				      num_slices, output_format, hdmi_all_bpp,
> +				      num_slices, output_format, bpc,
> hdmi_all_bpp,
>  				      hdmi_max_chunk_bytes);
>  }
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 228c5e2be164..d3efd9e4e86a 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3333,6 +3333,7 @@ intel_hdmi_dsc_get_num_slices(const struct
> drm_display_mode *mode,
>   * @slice_width: dsc slice width supported by the source and sink
>   * @num_slices: num of slices supported by the source and sink
>   * @output_format: video output format
> + * @bpc: bits per color
>   * @hdmi_all_bpp: sink supports decoding of 1/16th bpp setting
>   * @hdmi_max_chunk_bytes: max bytes in a line of chunks supported by sin=
k
>   *
> @@ -3340,7 +3341,7 @@ intel_hdmi_dsc_get_num_slices(const struct
> drm_display_mode *mode,
>   */
>  int
>  intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int
> num_slices,
> -		       enum intel_output_format output_format,
> +		       enum intel_output_format output_format, int bpc,
>  		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)  {
>  	int max_dsc_bpp, min_dsc_bpp;
> @@ -3358,18 +3359,17 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp,
> int slice_width, int num_slices,
>  	 * for each bpp we check if no of bytes can be supported by HDMI sink
>  	 */
>=20
> -	/* Assuming: bpc as 8*/
>  	if (output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420) {
>  		min_dsc_bpp =3D 6;
> -		max_dsc_bpp =3D 3 * 4; /* 3*bpc/2 */
> +		max_dsc_bpp =3D 3 * bpc / 2;
>  	} else if (output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR444 ||
>  		   output_format =3D=3D INTEL_OUTPUT_FORMAT_RGB) {
>  		min_dsc_bpp =3D 8;
> -		max_dsc_bpp =3D 3 * 8; /* 3*bpc */
> +		max_dsc_bpp =3D 3 * bpc;
>  	} else {
>  		/* Assuming 4:2:2 encoding */
>  		min_dsc_bpp =3D 7;
> -		max_dsc_bpp =3D 2 * 8; /* 2*bpc */
> +		max_dsc_bpp =3D 2 * bpc;
>  	}
>=20
>  	/*
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h
> b/drivers/gpu/drm/i915/display/intel_hdmi.h
> index 4e2228ca0c5b..c3a0e81615e4 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
> @@ -56,7 +56,7 @@ bool intel_hdmi_bpc_possible(const struct
> intel_crtc_state *crtc_state,  int intel_hdmi_tmds_clock(int clock, int b=
pc,
> enum intel_output_format sink_format);  int intel_hdmi_dsc_get_bpp(int
> src_fractional_bpp, int slice_width,
>  			   int num_slices, enum intel_output_format
> output_format,
> -			   bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
> +			   int bpc, bool hdmi_all_bpp, int
> hdmi_max_chunk_bytes);
>  int intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
>  				  enum intel_output_format output_format,
>  				  int src_max_slices, int src_max_slice_width,
> --
> 2.50.1

