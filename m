Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E89C5AD55
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 05:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85E110E281;
	Tue, 11 Aug 2026 05:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KNW9MxKh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D5910E281;
 Tue, 11 Aug 2026 05:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786427266; x=1817963266;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ea+b3x4TR8KC5oaC48k5928JwEH2TMkmUcJKE5YGsP8=;
 b=KNW9MxKhbm8WDphGMXXdYpAO4vi/j24zJX+48o1sSZrpyu+NTKV6Eyff
 4qMR/jwwOxJ9EM6uFdHMOzBruw5pOZZL5lE28C5pOUNCI9SU2lDmAApRb
 5vC3hh1IM4vTOUgTKXETYbbmmSSh+Y0x+D0Bn0WX0J9oYnuPHTDWfidVt
 kWbv17Ut10bR/WxkZm/fquqQmvT1SqERqHvrnu3tMV2ElH511PtvtWxV9
 SG+DtLCQnmUd1+k1H16kQAgg4mqLCNYw1Cprpm3Fapz/kEYjlvMvRM9Jp
 C/JexnjhIjGbXSwPFkjqJ2WWuyWn+e9QlSOS05lrRnpUrP3/GQs4UtUlN g==;
X-CSE-ConnectionGUID: Sj+C3rTXRFWUbvPC9b8iSg==
X-CSE-MsgGUID: 0oZrNtXGRIiQl5tuIlipOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="98466453"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="98466453"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 22:47:45 -0700
X-CSE-ConnectionGUID: 2Kvo9WBkRK2YSFiHGKuQyg==
X-CSE-MsgGUID: XjhysswDRk21nZUTtRnNEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="293184444"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 22:47:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 22:47:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 22:47:43 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 22:47:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXr89S3gakd8j3mguV0RrJC1bjiJRmzdSsCEoqJsMwvNK9MALU2VyGraAFpkX7z9LBgjdu9flGosyjf8jQq/lRoOD3l2UKYYRjfatXDvINVt5FjOktK0zotfuxcEHs19V4+JYLVOhlIVSGmom9v3OhLUlTr+qXcsY4tG7vTGED/omQD5OTcqKY0k5KAF65V1c9edEPoSPQZlSdWpF6594Q+Q2fRiK4LdHyoDNJu++lQlJfbe7NSoGCo+o7Z36FX68voVxiwW7YI+EVJQ40/GUjIlhjtMQC7FDpRGobon+yA32PRiwDR5esi80/Yy+DXaNWum+RdGpm+ruvlyhwETBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4g/oWISMF6AyQD3aw305tVN0b+jacCj9Ij2l6kPODLs=;
 b=cAGn5B5jwpRAd4TGbdIozvyuz5rfO1X0dGsit6szWfGAjCorSEb+Fdrl2GROFa7TXgmzqhGS2in7xq3hRTNVPMJNGLgN69FJgoCxJD6dTEg52nFx2FUJ+uv0sACLjTN3hRyMW5CBjFgwCXWYFSdD6Q5Hh6XAnW5SXxGWd1Q4alMp8h20Xpt11THp6mKPKNWOcKh4tZL7b0VaHlBJvpM+o55Veix8b9eufAMVj+t2zClF0NX20FfctmWS8WgRxMxmDfpHbDKf/Du6P+H4z0w+EnUI5+D3aVuwnuxt+6AuEvwwi9TYUWY1rt7DdV6PZtB/UzH//QnB6P2IhBl2zHj1Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by MN0PR11MB6057.namprd11.prod.outlook.com
 (2603:10b6:208:375::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Tue, 11 Aug
 2026 05:47:31 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 05:47:31 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/i915/dp: Gate UHBR SST SDP splitting on sink
 capability
Thread-Topic: [PATCH v2] drm/i915/dp: Gate UHBR SST SDP splitting on sink
 capability
Thread-Index: AQHdKUXWoW7bfElAn0mBvbvW5HjjoraYVOeg
Date: Tue, 11 Aug 2026 05:47:31 +0000
Message-ID: <DS4PPFE901A304F8AFBCC5032E3F6B87241E3DD2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260811034928.556990-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20260811034928.556990-1-mitulkumar.ajitkumar.golani@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|MN0PR11MB6057:EE_
x-ms-office365-filtering-correlation-id: 5956511d-3623-4bc5-7b4c-08def76c0938
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|38070700021|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info: iInOU+qA4OzCwc5tikhE3fS7kzxfRNjXm66fGBzWthQpqSD99Bal8kyKthYSPvlGgNWgyGDJfyVyzFHO+rYIa8qC3OOBL3bDWV+jbzo0N3u+WB9G4IJ0L9HVBvC+Wwge+vJQTZDlvJ/tUnpKGnj9Hso7eegpoLFvXSHtPfIUWFFuP42NK7c9jT6pik4/iH9API7u8zSOY5YH5+EKmffxlxtcByV0+nxDAqPkQ8EiVRbUzs9MvSdNlSXfthdgXEbE2VfnaA94enkjrvkDI1lPVxMQKrXcAhliaW8aSgSgoesW+MzZV6t4eg2kSUhdydcbLV7rylkaXsMSo6VHmHZfTWvZxsKjbfxO3j5WFYbt+PtxDDvyZYxOu3uB87Y49fd+mQDV/G01D8aYJgjvqth8cdtvF81DwgOVAMWJjFcotIaY8pdlTq5ZVgoRlXIRPcMOS4GRSleumAnNyC8Xu6f6T1zC4unZIjCX5tQryk8+NPZsgi1FydVshJtdwRYIKOfujPxH1QFenQeivFMZWUPrfdsNC4fCWLATsX5OBx+lkAL/IuGEgSgC2kSxmQIfbn+xIFkLN94v0JxGSF0gUvl4bS+9OdJTDSQlDY6Ut0lgWl3+flg1jGH7CbnLGdlItpiRq0tN2qLtE3Ya2dmY1wB9m0xByvRIKp2xdXeOlH2P6zpqRExWBzHDt/TeLQg3B2l6fu0s9yJvISXzKyl8u8ZJ7g7Fao6jJxitzq68in5sH6E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4E2QxIZZzrcK7X+qFbaqIKRKy9wH9XLNWBnEDKubnl2MgD9U2wncmUJj6L2p?=
 =?us-ascii?Q?JezYVc/+Al7AcVywna2c2GFXlv65VytbdetJMCa2hjaF25yB2EtQ089a64kS?=
 =?us-ascii?Q?Joi2sjokmUTqzITpcPbe22P2Fvtb8cBZO2Mwv6fAhZg3ABWLkwrzhRrwrq5T?=
 =?us-ascii?Q?GpLg4GBjXuPjCFqZhl55ftwabkT7NpTb2F8KFUhbZtxorVAJa7RUfyKM36VT?=
 =?us-ascii?Q?P1Kel/WCJPn1tbiGg08m0MWeu6RHA7MviQ+160LoCT1JU/PrNz3lGNGJY9Bq?=
 =?us-ascii?Q?yNSVao9e4ssraxgMi9MYViQylB6vl63saPDsAh2ePHkfDZ2mBxFSWrviPj9O?=
 =?us-ascii?Q?LoO1G/6pFhHBftd137t+s32iJb171CMSB7wZ7iRpM3zboplEFyWfg8m1GGdN?=
 =?us-ascii?Q?eT5GOPDLZqq6ikTk2uLyG2LzDEMeQkUip5Of5yaVJzHHcZ1XeTEEn5m+8vax?=
 =?us-ascii?Q?hw+nV3mBRh5R2Ax9WvN7EqSJcNOaCjrZ/vNJNR8FjGmM9IDX7fKgICziWou7?=
 =?us-ascii?Q?dv4l8u6LcM95rOeDZ8K6NHNpDwa+LHzVkq8QS+Ne3BFknbSlQukodQdNj+a/?=
 =?us-ascii?Q?ODAA6QFWcwhnls5O77afnkUmKEeowGRJ6Y+w3Sc0EAuXoii9lD1IxBtAXF3v?=
 =?us-ascii?Q?zJnbp0aA1266PK5//CCCgnvPCBOsewubb317xPEatXVDDHG55ejSin1PhMB0?=
 =?us-ascii?Q?js+tElIezb8ozZe5mJvGC8NLgVYpRcREy2p4HNgylWkIshJOiJjrK//tWk/z?=
 =?us-ascii?Q?F3XPS6vMd32Wmemd9DFqQ5CJMopfUqOp6bSAWpYTVkrnQ7zGpPPhZ3IWY7lA?=
 =?us-ascii?Q?fldUjEe2vF9JhRRg6MI9IvdwI1Y96O1A0pVwTFI1XFhc/nuJYR1HPjDPRrL4?=
 =?us-ascii?Q?97sjmrBBxF48lqndYGNEahI0WV9DgNKF44NNbaD3Cp0rSaI0QtAkF+4JsAAW?=
 =?us-ascii?Q?eNP8u0qcSSiGMLrjdKT20PlifZh6Lo5Qf7G0fuchxHq5EW9ufdaCTQ5gbkAk?=
 =?us-ascii?Q?L53Q5Nl/3jTPsNPW9Y/A87FKRZnhzQvRCKHx3rP8pnKtFp9TULFSEfF56ySs?=
 =?us-ascii?Q?zeUiVg5AJNnpWNTQs/KtACPbWVCUW9alJ0mEDtm2XlKC8AYz34ng4DB/eA8t?=
 =?us-ascii?Q?4yjxB2gOdGQjthKOrGA/OlnjdjBnYw/C+gJEfoNAjeGwk+86Yd2G6w3NyjD4?=
 =?us-ascii?Q?GkYpq65VgYTfriGVlNdAlc7bNMz691hwph/RH83WGiy6y9dwGZVqCL84II2W?=
 =?us-ascii?Q?zCZRh1F/Ik4mHkdRDM7EB7srfRm9EyZHUsbKHslJ/l99urceDghp1j+li2yK?=
 =?us-ascii?Q?XKEBvdx+Gw5mjQnRxSgxquocU1K2RtNmhXb89NxSuIfV3VMJSawNzbugqId0?=
 =?us-ascii?Q?TSrRFkAZKVwy+Nidomm1y9upHMacnfk/WAnVxgRl82w2MzdFeaJHec+n+IXX?=
 =?us-ascii?Q?btCGLdosJ2nwEusPty06cD5nrMjBkgPN/mQipLuaHMnj+K8nYV0OXP2VkwjS?=
 =?us-ascii?Q?tDkuU+5DuhjwXCd6mBRv2nspNw9skGBSXwX3uonHdlYSHvl3ldptClyrZfC8?=
 =?us-ascii?Q?6/cFnDcoEzPy2tMHSrW+Ywpiwmj+b411PvjkIuxdpnv4EXr22P2egAT/dyxw?=
 =?us-ascii?Q?0++rPiK2yTkdv+KDPPvoH14kpHKPWx7imO2EshfEoAIyxVB9p3GJwZj+u7p2?=
 =?us-ascii?Q?cuFV0nVQ073B3UbnzB6y+VOyx0wOdukpZMrbnTn2quvKFhR39tsYArlTHcsU?=
 =?us-ascii?Q?3RJxdVc+CA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TuBYt967Y8k/hqiAPvd1zVcraosAsFDL5jmlzrC39bWyau/4bXaDrLNjbuj675uUWnneulVKWJuSe+XJcCQqcn1JzL7D7kQF54oFOYyN3wFhrrb/haVYISk0TbmppDOWIqexlY5NHaV1WmosHfmAPSYL117UiEjJXbL0iivazJdE0Qj6MuxTMAmjc2ByBMdXwAYfMi/gyvjTwN/yKqfkM6OTxtZKawCBdq45A7+04p5vNHuELjDoKEWcJWfQivh2w88B/8mgZ/QuxvOZWG6aVnxFGqTvqEbPQ6+B8fEuRb2DnuVIaSNet02/qV/18yUlICBOJ6B83HjuGhkGCtvPaw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5956511d-3623-4bc5-7b4c-08def76c0938
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 05:47:31.5151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0rY6JlvWmBOoo84VQRtt0Ue0PO8VG0Rkq7vz3sdI7iiceQrRUnbzCNhb2bhhVSho9McyZLC818VH93uEE8+MgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
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

> Subject: [PATCH v2] drm/i915/dp: Gate UHBR SST SDP splitting on sink
> capability
>=20
> SDP splitting for 128b/132b (UHBR) SST audio must only be enabled when th=
e
> sink advertises support for it. Previously sdp_split_enable was set for e=
very
> UHBR SST stream carrying audio, regardless of sink capability.
>=20
> In MST mode SDP splitting is inherently supported, so the sink capability=
 check
> (DP_SST_SPLIT_SDP_CAP) is applied only to the SST path.

Please add the versioning diff

>=20
> Fixes: 8853750dbad8 ("drm/i915: Enable SDP split for DP2.0")
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Assisted-by: Claude:claude-opus-4-8

This need to move above the Signed-off-by

> ---
>  .../drm/i915/display/intel_display_types.h    |  2 +
>  drivers/gpu/drm/i915/display/intel_dp.c       | 44 ++++++++++++++++---
>  2 files changed, 40 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 20a07ea06b5e..5f0fe18c0614 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1951,6 +1951,8 @@ struct intel_dp {
>=20
>  	bool colorimetry_support;
>=20
> +	bool sst_split_sdp_support;
> +
>  	struct {
>  		enum transcoder transcoder;
>  		struct mutex lock;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 437b9e7bb864..81c9248516fd 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3414,12 +3414,22 @@ intel_dp_audio_compute_config(struct
> intel_encoder *encoder,
>  			      struct intel_crtc_state *pipe_config,
>  			      struct drm_connector_state *conn_state)  {
> +	struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
> +
>  	pipe_config->has_audio =3D
>  		intel_dp_has_audio(encoder, conn_state) &&
>  		intel_audio_compute_config(encoder, pipe_config, conn_state);
>=20
>  	pipe_config->sdp_split_enable =3D pipe_config->has_audio &&
>  					intel_dp_is_uhbr(pipe_config);
> +
> +	/*
> +	 * SDP splitting for UHBR audio requires explicit sink capability in
> +	 * SST mode, whereas in MST mode it is inherently supported.
> +	 */
> +	if (pipe_config->sdp_split_enable &&
> +	    !intel_crtc_has_type(pipe_config, INTEL_OUTPUT_DP_MST))
> +		pipe_config->sdp_split_enable =3D intel_dp-
> >sst_split_sdp_support;
>  }
>=20
>  void
> @@ -4461,16 +4471,25 @@ void intel_dp_configure_protocol_converter(struct
> intel_dp *intel_dp,
>  			    str_enable_disable(tmp));
>  }
>=20
> -static bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp)
> +static u8 intel_dp_read_dprx_feature_enum(struct intel_dp *intel_dp)
>  {
>  	u8 dprx =3D 0;
>=20
> -	if (drm_dp_dpcd_readb(&intel_dp->aux,
> DP_DPRX_FEATURE_ENUMERATION_LIST,
> -			      &dprx) !=3D 1)

Drm_dp_dpcd_read/writeb has been deprecated and it is recommended we use=20
drm_dp_dpcd_read/write_byte instead check  https://lore.kernel.org/r/202503=
24-drm-rework-dpcd-access-v4-1-e80ff89593df@oss.qualcomm.com
so please go through its usage and use that here instead.

With above comments addressed
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> -		return false;
> +	drm_dp_dpcd_readb(&intel_dp->aux,
> DP_DPRX_FEATURE_ENUMERATION_LIST,
> +			  &dprx);
> +	return dprx;
> +}
> +
> +static bool intel_dp_get_colorimetry_status(u8 dprx) {
>  	return dprx & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED;
>  }
>=20
> +static bool intel_dp_get_sst_split_sdp_status(u8 dprx) {
> +	return dprx & DP_SST_SPLIT_SDP_CAP;
> +}
> +
>  static int intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
>  				  u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
>  {
> @@ -4770,6 +4789,7 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, stru=
ct
> intel_connector *connector  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
>  	int ret;
> +	u8 dprx;
>=20
>  	/* this function is meant to be called only once */
>  	drm_WARN_ON(display->drm, intel_dp->dpcd[DP_DPCD_REV] !=3D 0);
> @@ -4781,8 +4801,13 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, str=
uct
> intel_connector *connector
>  			 drm_dp_is_branch(intel_dp->dpcd));
>  	intel_init_dpcd_quirks(intel_dp, &intel_dp->desc.ident);
>=20
> +	dprx =3D intel_dp_read_dprx_feature_enum(intel_dp);
> +
>  	intel_dp->colorimetry_support =3D
> -		intel_dp_get_colorimetry_status(intel_dp);
> +		intel_dp_get_colorimetry_status(dprx);
> +
> +	intel_dp->sst_split_sdp_support =3D
> +		intel_dp_get_sst_split_sdp_status(dprx);
>=20
>  	/*
>  	 * Read the eDP display control registers.
> @@ -4873,13 +4898,20 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
>  	 * the OUI/ID since we know it won't change.
>  	 */
>  	if (!intel_dp_is_edp(intel_dp)) {
> +		u8 dprx;
> +
>  		drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
>  				 drm_dp_is_branch(intel_dp->dpcd));
>=20
>  		intel_init_dpcd_quirks(intel_dp, &intel_dp->desc.ident);
>=20
> +		dprx =3D intel_dp_read_dprx_feature_enum(intel_dp);
> +
>  		intel_dp->colorimetry_support =3D
> -			intel_dp_get_colorimetry_status(intel_dp);
> +			intel_dp_get_colorimetry_status(dprx);
> +
> +		intel_dp->sst_split_sdp_support =3D
> +			intel_dp_get_sst_split_sdp_status(dprx);
>=20
>  		intel_dp_update_sink_caps(intel_dp);
>  	}
> --
> 2.48.1

