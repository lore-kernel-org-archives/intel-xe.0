Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924CCC5AD7B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 06:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354E110E28A;
	Tue, 11 Aug 2026 06:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJtfNlnO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C361010E28A;
 Tue, 11 Aug 2026 06:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786428871; x=1817964871;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OeZ1/clVwMTpsXTEqR7vOM914QmYaIzk4pIGWJBbT60=;
 b=NJtfNlnOeAV+R3Nnb3I/z5DU1GrcQG6dfBOzqkhv2eABcr5S5IgTvpb5
 IXCgx0oF6FhiDqjIjZtdqMUfu/5AyOTeSkw7v6XqkXykugJC0lZnTd1pK
 NNnc/RDVAv/cK9+3MLepXMOjpkLj+83KGSuxys3fFV+X9qIVfdpYN/ILs
 sx8+vB+1YDgA234qFBaD5MSAAveTuHVb+YSUdC8ou6sytmKsr5hdv5tnV
 CRi+D+RCY7V3ZCc5dPUgJZ6k+guza0uJuAA3q+b0FaJshJ91eNvoCgqpO
 xNHvuXCn1mT33uUkMyuJ6YpToh9boDRXKYMfrSv6IPxblx3fPIrOctufo w==;
X-CSE-ConnectionGUID: BFA28oQBSrGMFhXenyvMbQ==
X-CSE-MsgGUID: ZPapKGyZS4a5u/XJSMtGlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="87167868"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="87167868"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 23:14:31 -0700
X-CSE-ConnectionGUID: 2atM6edcS6SwVtyQCW3Pjw==
X-CSE-MsgGUID: E2pK44S8SFCYH19ZcjgiCQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 23:14:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 23:14:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 23:14:30 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 23:14:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5OxMcMHv3E3kF96tbKukI+g6+hfa2mAuaTnd40mx9vke08rm0MaFJnULw/S5+MHMepRvSK1dOofQE+AzW0wdKcsiZj81PqfJuKHNy0HZdKzH/kjMFgvOW81hkw+RAIFhXFT9vDR8LkEV999V7Pk+8m81+H3d4GJQaBSr2L15iFZyTdtNxKaMc2IGPGLgMEZP4W6KILCPxbdFsdbcT3sCPUJFqtX5OjY8pkchRsbNINFjZ4CGGHeyAwchDvYiJgWocs4YbMZrlaOeId3AStmMf6xqg95Yk/YVarQT/XnFe6IXcfic1gmVY2oUpuz03uHxmA0DPDbNepfv3smD/ufEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmxp6aU4hLU+oqphJmhxdCUbpc82iWWJooeARbboRdc=;
 b=Is2TyuQkbhBpLikSVdZRL+ynncSGXWEUHVZq6yNDgzh3jhtF5hC3EFfii3FDcdk/p/I6alu4YZOYAOYxnj4RHERgy04SK0+cAW7FwGP5Tp24uL5Dwi5KITTeivI6k2tToopV2kYMRuxz7M6VLmUJa+PnVyxfOSj/lhvqe9bukFm0G9VEo5BcTLQifJlkTeb3wHzGVhG+Iz2AU40aQBVRmpZ85nJg7cHqEiRHaj/C4/G/kzL5gaSH8o+N9+OODw2zDGolKTft8o2KRw8fJIJmyUDxfSgs/Vlz6wgqPPPf6E043ps6aAiaIkHfUyWeomLq1G3vHetRmIC4ZdsZWVnoAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH0PR11MB5251.namprd11.prod.outlook.com
 (2603:10b6:610:e2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:14:27 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 06:14:27 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>
Subject: RE: [PATCH v2 8/8] drm/i915/dp: Clamp PCON DSC bpp to the FRL link
 bandwidth
Thread-Topic: [PATCH v2 8/8] drm/i915/dp: Clamp PCON DSC bpp to the FRL link
 bandwidth
Thread-Index: AQHdKU49o5OM0cK4Uk2Qltuu4GEzX7aYXo9g
Date: Tue, 11 Aug 2026 06:14:27 +0000
Message-ID: <DS4PPFE901A304FD3A93430718652C17B17E3DD2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260811044234.593986-1-ankit.k.nautiyal@intel.com>
 <20260811044234.593986-9-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260811044234.593986-9-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH0PR11MB5251:EE_
x-ms-office365-filtering-correlation-id: 4430e1ff-58b6-439d-9738-08def76fcc1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|11063799006|4143699003|38070700021|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info: qLj28OQn5wmL0qeCSs2hFw96d+OnNPje0FR7pvyw+o+bVl0TNvc1d60CBQMQ18gwkHLN2uiA9reYgi37kv8vDEJ9/hBQQPaVTVC9I+tes3fF/OBrwh3JIhUHHiXnyq6f3dncr2WwbJj6/3qialXu6Q74/b37lCYkVwhtfvBPCrgDL9JLVXMkQJ8sudFF62vLlMPtjj1HEXis8UhbC9MjNGNDqYJXzmJSejZucUZec48Zcg2sLGEp7gWW7Zkx6ltFOIA3CJjtwPD8m7jAjE5qzyy6IGSTTXZ1x7M9gkR83gexhocrqruVN3RUVQ8v7158g5yzxZQ6z0BFU0TSMgeJEhqD+/Ld+Lx2fwNz7gAVeg005yJumnPYbGIdMbMAkgIXLq8Y2XoP0zpItMEQufMn01OjG4JlRmuUMZRVWFd6kQ4zwJKbXtWRst1SQByYE0AVjdPGmPfX9xhFAyG8HDzrGmwPHxZ/bTb8ZHx2Sar4JBcKL2rbUIHodQAaSXeGwaE6au3yPiXLwOEDS0SvWy4eyaJqm6/Z0t30BfxgxdK2h7CvBpx4QAzwtu2kfjgRIs5dZ9WIvskGOHwgnwUq1zZl21MFSEmoet/fKYIgugArjZfmSPwRo+6WEAWIqJWiIYCZ/CFVWxzWauwC73oqrQMOUDMaLyF29Xu9HkhEfBWh/fU/PuC8/F4SI4WKiWWrj7fVwIFOAfnWAJiiyZ7clGzLjZbYJ9PWhmA3pkTT0Y6RBOE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(38070700021)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rTIEeR9nyswq/Xz5dnat8A3f+EdElvsGN7uN8ERlVHm1CdcF1lWtnmSyw7YF?=
 =?us-ascii?Q?eVEZ43jldWwkekCQFfiD+6sOpy/O0lLLANJ/OzKKIHos21nJ8PD9a0K06mRe?=
 =?us-ascii?Q?FjxNEaZ2r8C5TRDqXzjoKTOLDYJhlSnI3pxYup8y3JerRHKBtV16kngYo3FT?=
 =?us-ascii?Q?oFBqUE/PzwULSRPohc5BdnrOhTAKyIs4J6SLBP9iIxr5VdaJ3vv+ifkDLkxQ?=
 =?us-ascii?Q?ffOcyAh0DAt70q7abDPymF6oE4dO6S3yRJvNKrI9wA/fdfDzos5dDCVcX/3J?=
 =?us-ascii?Q?4v82v1NXTqnKEgEH1anjCZbR2DWLU8HPao96e6T4M9msfNPRBbvA00QdYbKl?=
 =?us-ascii?Q?KhFIVwd0hwB7acEMOQQaMs5VC4MxSG1vL4PSb3Q1y2BhDww4/U8sxkz5hUbV?=
 =?us-ascii?Q?8HB3LrwbK0toZiAAAeEVAOw6Me47I2K1fT2j9/6ueGbwUSAk60vb6EU4bsFp?=
 =?us-ascii?Q?nN3nY17TS7n/frKi5VvXxcYHTDQPydHZAtmfw9HhCjWiHeu7499XugcERPN8?=
 =?us-ascii?Q?8MCLrTbaKFxrCxWYEcT8Vkl1/2Ccq/VHKogwy/N6yXQYY1CLkAcCU0IkJFfH?=
 =?us-ascii?Q?1lG1mQt75AG78rdQ9luAZF+VZ4XdEFl+sPPP3jIdC/1Tv860Z3sJm/Ajs1UY?=
 =?us-ascii?Q?QXsIo0s4ph+gCr7oVJMXtp4KNakQd2FeVMTEBJrMu0VK79b5F52ypnM8JWJ4?=
 =?us-ascii?Q?99Kf8meYRHKwfrBsuqiBkO1lG93PffQJwOV2V80lC3CNKMJhoaO0C/yNeQof?=
 =?us-ascii?Q?Ku5pttVRzGbjDkl0kvsFa1Kx7bKGJsXnH+ppN2+59RRr0VExDCpHFM+PAjzy?=
 =?us-ascii?Q?izMqCAN6F6eGesyDPWbeLDBqMCcK/Hkw7IomPfpUH7TZTUBFbs3spO4jIDq9?=
 =?us-ascii?Q?KjCjrOwNFdOMP0TYLPvVg65pCwZjsFsG1CvGt/81QRn1wxyJsOSrk4eYqie8?=
 =?us-ascii?Q?4+q0TXlCIuImeE5NvwxMJ/e5vmavHBEZI3glQRmL3zVsqquvZgEye9htqOdH?=
 =?us-ascii?Q?8cshwl0iou3UFOSfBF/mCPQZMtOL9i/QQzHBd7vRuUsNfVStefXyJbT2X5uZ?=
 =?us-ascii?Q?YbuNd7Kg5T44BuigoAL4mdZsxYAecY03RJljMOlyQ3x+CLiWyU9oY324imcu?=
 =?us-ascii?Q?Fylbp4VvP1CgeCJXrBtz698PTnuUfacze+lkSsH36js+hhWNyN8/guEJEWRY?=
 =?us-ascii?Q?Jrqb8hip5Jhfv1w/lpw3K+liwxRMMCijVOE/AOvhSTC7mCwat2xGfr5Yqrrk?=
 =?us-ascii?Q?IQVL6GHhsiW0gkPJ/Q/pwb1yQxshzkPS8MyulkWeyHJOPRTmBV2ms6OuLWth?=
 =?us-ascii?Q?b0lMEwSnJoKmV7+DYSrzUE7+a7CYm4vWjnkFhQBXTF7J78RIGZPIE9/99x8i?=
 =?us-ascii?Q?FaQOOoyZspZ0a/ND+yv2w7j49BsrqESad+2+wY0YxNzKHvK8BJbYcjWFPvEb?=
 =?us-ascii?Q?EYvvWV+gVlMO1/XENBiLWQOGaO7kSXpFYg9YWvZhYdj3fVntknMK5dOyfrO1?=
 =?us-ascii?Q?USNR6wRRBsDi8Wll9ypNiXYj+aCWjPxDaUgAinzUGh2+19x/ODctis9m294p?=
 =?us-ascii?Q?aF9hMr3HoTFzeXwjw4L9ni/NRxGFRjq9qgj5UBQjuLmxwdGK40Q2EG2jF5SY?=
 =?us-ascii?Q?eJ8lfHZq0Xr1TEpPItg0J11ZMQioeo6ZBdEToKJYZn83FMvxCoPzgL8wJVlh?=
 =?us-ascii?Q?5C4XlBu3hqd+TeSG2sZKrZI6ihBy2r+qDsHK61ORH8jxd00aGOPhvMu8ly5e?=
 =?us-ascii?Q?H2glznml/Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CA1kfAxEhRzT7pb+hKZP2JjtJOFf76JnV0ojTYttJxmlWkUWWrdsM04LvvC5k/7Cl36twA26Irzdxm0HVysOWK+ABYj+1a2VCuZePvsCYAj4GbCaUmMHad2g8QeahmPT0B1c5+fCisEPNzXjr4JFHjQqKhf29joYC4eNwhrqzy2DS1VYFisViHBf8TbL7YiuZclGXLRAxSCcvq1usxqaG2VVosZeFO9KsRQ9VoT0he535EsK0efwMVx9GR5/SfBGpgbiOqJ8CMWKb8TCT5kYr7B5w8QjfB9PaT+B5OlPiOpIyx8FuGkobLtwv0QX8rUPFLUr3183U53tdPcP8jIH4w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4430e1ff-58b6-439d-9738-08def76fcc1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 06:14:27.0848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 916YRbPOKssikQDc+lEqFy0cHJvp55SXRVWxZT7hgSMPGQKaWL8RUhuY+3zzQnrs+EaToYKwebGrG6YY26b4Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5251
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

> Subject: [PATCH v2 8/8] drm/i915/dp: Clamp PCON DSC bpp to the FRL link
> bandwidth
>=20
> While configuring the PCON DSC encoder, intel_hdmi_dsc_get_bpp() picks th=
e
> highest compressed bpp that fits the sink's per-scanline chunk-bytes limi=
t.
> However it does not account for the FRL link bandwidth, so the selected b=
pp can
> end up exceeding what the trained PCON/sink FRL link can actually carry.
>=20
> Compute the maximum compressed bpp that the FRL bandwidth can carry and
> pass it down to intel_hdmi_dsc_get_bpp() as an upper bound, so the chosen
> DSC bpp stays within both the sink's chunk-bytes limit and the FRL link b=
udget.
> The mode_valid/compute phase already guarantees the lowest compressed bpp
> fits the FRL bandwidth, so this cap never falls below the minimum allowed=
 bpp.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c   | 9 ++++++++-
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 8 +++++++-
> drivers/gpu/drm/i915/display/intel_hdmi.h | 3 ++-
>  3 files changed, 17 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 938e11bc6a46..98c3ef1d39fa 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4425,10 +4425,17 @@ intel_dp_pcon_dsc_enc_bpp(struct intel_dp
> *intel_dp,
>  	int hdmi_max_chunk_bytes =3D
>  		info->hdmi.dsc_cap.total_chunk_kbytes * 1024;
>  	int bpc =3D crtc_state->pipe_bpp / 3;
> +	int clock =3D crtc_state->hw.adjusted_mode.clock;
> +	int max_frl_bw, max_frl_bpp;
> +
> +	max_frl_bw =3D min(intel_dp->dfp.pcon_max_frl_bw,
> +			 intel_dp_hdmi_sink_max_frl(intel_dp)) * 1000000;
> +
> +	max_frl_bpp =3D clock ? max_frl_bw / clock : 0;
>=20
>  	return intel_hdmi_dsc_get_bpp(pcon_fractional_bpp, slice_width,
>  				      num_slices, output_format, bpc,
> hdmi_all_bpp,
> -				      hdmi_max_chunk_bytes);
> +				      hdmi_max_chunk_bytes, max_frl_bpp);
>  }
>=20
>  void
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 6ab62a9e941c..7fcba556bdb1 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3451,13 +3451,15 @@ get_dsc_compressed_bpp(int num_slices, int
> slice_width, int hdmi_max_chunk_bytes
>   * @bpc: bits per color
>   * @hdmi_all_bpp: sink supports decoding of 1/16th bpp setting
>   * @hdmi_max_chunk_bytes: max bytes in a line of chunks supported by sin=
k
> + * @max_link_dsc_bpp: max compressed bpp the link bandwidth can carry,
> + or 0 if not limited
>   *
>   * @return: compressed bits_per_pixel in step of 1/16 of bits_per_pixel
>   */
>  int
>  intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_=
slices,
>  		       enum intel_output_format output_format, int bpc,
> -		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)
> +		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes,
> +		       int max_link_dsc_bpp)
>  {
>  	int max_dsc_bpp, min_dsc_bpp;
>  	int dsc_bpp_x16;
> @@ -3465,6 +3467,10 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int
> slice_width, int num_slices,
>  	intel_hdmi_dsc_get_min_max_bpp(output_format, bpc, hdmi_all_bpp,
>  				       &min_dsc_bpp, &max_dsc_bpp);
>=20
> +	/* Limit the bpp to what the link bandwidth can carry */
> +	if (max_link_dsc_bpp)
> +		max_dsc_bpp =3D min(max_dsc_bpp, max_link_dsc_bpp);
> +
>  	dsc_bpp_x16 =3D get_dsc_compressed_bpp(num_slices, slice_width,
>  					     hdmi_max_chunk_bytes,
>  					     src_fractional_bpp,
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h
> b/drivers/gpu/drm/i915/display/intel_hdmi.h
> index db87656eb27f..f7a494df19e6 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
> @@ -56,7 +56,8 @@ bool intel_hdmi_bpc_possible(const struct
> intel_crtc_state *crtc_state,  int intel_hdmi_tmds_clock(int clock, int b=
pc, enum
> intel_output_format sink_format);  int intel_hdmi_dsc_get_bpp(int
> src_fractional_bpp, int slice_width,
>  			   int num_slices, enum intel_output_format
> output_format,
> -			   int bpc, bool hdmi_all_bpp, int
> hdmi_max_chunk_bytes);
> +			   int bpc, bool hdmi_all_bpp, int
> hdmi_max_chunk_bytes,
> +			   int max_link_dsc_bpp);
>  void intel_hdmi_dsc_get_min_max_bpp(enum intel_output_format
> output_format, u8 bpc,
>  				    bool hdmi_all_bpp, int *min_dsc_bpp, int
> *max_dsc_bpp);  bool intel_hdmi_dsc_bpp_fits_chunk_bytes(int bpp, int
> num_slices, int slice_width,
> --
> 2.50.1

