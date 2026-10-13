Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C62CA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 04:06:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B881E10E41D;
	Tue, 13 Oct 2026 04:06:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F46E10E41D
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 04:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791864369; x=1823400369;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zge9ayGQyfsmFzW3TNVmDYQdxxUuTaozwcISdUyowHs=;
 b=dBzbsaMbude4IofTT6I06NHGGZeRukjMYM0pG6yf6jCFZK2pr80ZkhZv
 RJYnG+BU7lAaxKvSG0jEe2s476/gLH0hWhdHygEMiP+/n1AZlUnUeUdzD
 +IM6J6MDIw3E6/pM1AQdPQxNPAtZPNu21/Q6pUFupxW3fb562ysR2Ighf
 oi9RemXUK00LZc6UUSh6CHKcxcIUQZBxJZUAc+xk5J6/iotOpOjLnOrDm
 bIWEX4vLdJHooaRpZa65HRnhnieRUdx/c5geKCfXBy1d85tveh7EVq2Sn
 CC8BgG6PSuqc/staMePR2ficBmvQES0SoVi25bgLiRZL/m5O3JHQyX35f g==;
X-CSE-ConnectionGUID: jZ5aFljaRSeUg/rULa1NDA==
X-CSE-MsgGUID: LMOSpokSR2m3OdcdWMpZHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="588640"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="588640"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 21:06:08 -0700
X-CSE-ConnectionGUID: QAIE3ld+SIyiPNANBHnkyg==
X-CSE-MsgGUID: mD+vdUjyRmO1mJ4wLAn87w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1037052"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 21:06:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 21:06:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 21:06:07 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 21:06:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAabj0qzrMFTKMhDiCxgYGEYrFSNI31CgiPMnmbQHdbYurnjYfvEqpBm9jLF93LiuaRMZ28bURFUQ73sIAwVvez7pSJDGDLYMU5+zDMZGCnIynlLuNN6ShR9gqhiGdx9i0Mbt8e/CuYVNXZM6WNd0Vfidd02ahBMOO1gfNWTfvj/WM6tlT2fOdTV8/Ss1DtR1CUj8ry6LYQnfAqdr3Q3nW9W9PUmKob4cg42x08jIdKIOtDKkRqYLV2j4GbxyilAW1kCBP84Ij/VvQrruT7UIGoRa2vyl1UUzNHEfdlqJYWn+O8jV+nKh02Kkhg6qkpJco+lnGf2/NNLCq+YQRN11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYmL4CprlGG9gfNGqvKlJ+izdLryYYjhxMwK92V+6MA=;
 b=Q9MjZDSYW6T0u/f/jh+kecT37UGBkTXZP35/ExzRWmtRsrDPY9avVJ1CGMIY6wuVsGu2ICjR3S6gZbIt+WdIsVliMQVip+PqL/A+SaSHhTK0UIAUcwfEwssId/9yl07WFYCqcJau0FwdjziQtSGPdLkT0mhvpbxz4hslfMxXDl1muacuv9VqgbG1veIGY/S/U43LzBCsNH6QcbXneXN7FVS3d/rU7vRBxfR7Wv1lQzUOdT+wzYhYilKbrHPiW9S95pA8lTGn3TXCIcpJ0sIE5xOwb8Fy0WOkTy94zyQfb7jz9ldgJHRjDN0dvYyM8eFwkj+bGhEIEnvqRJWfUK+iow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by DM4PR11MB6431.namprd11.prod.outlook.com (2603:10b6:8:b8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.23; Tue, 13 Oct 2026 04:06:02 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 04:06:02 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ghimiray@freedesktop.org"
 <Ghimiray@freedesktop.org>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: drm/xe/oa: Zero OA buffer at allocation
Thread-Topic: drm/xe/oa: Zero OA buffer at allocation
Thread-Index: AQHdVTVRdWvDWyk7x0K90dVZnDV28bb65YRw
Date: Tue, 13 Oct 2026 04:06:01 +0000
Message-ID: <DS0PR11MB8718AE2ED3BB2A04A2FFA00C819E2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261006020314.2711762-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20261006020314.2711762-1-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|DM4PR11MB6431:EE_
x-ms-office365-filtering-correlation-id: f8e106d5-c27f-4f64-8e51-08df28df4b85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|22082099003|10067099003|261009223027099003|11063799006|38070700021|56012099006;
x-microsoft-antispam-message-info: s3wwVKXbCjj22JOdyMcE4y1HU+T3ajzdzAIYkWb3vzVcJO1RH5jkf2mbSBeGR3yI0fnUPqAQ5Nj6T3VAW9Ij659Q3Kwf57tAv+hIVhbRNRlPG5gHIjlOVvf7DPThh7mbeMe+fjEnoxJ1K6yXEEOdl3B/weQ9M7nq69y+kziI0ZFiOAmohC5SmzrXZdBThH4nvjI5QQYI0jpwv+W+2Op6Hf4TBDabdyYJJC2kIkxtRgGi/aPJGNSPQJhF+HhxGDgnfqF9iLOnuNMfrsPmiPhoTgAY23FaJw84ejLrrGO37coh+IQjfUypl+mEk75H9DY7SJvaAmwqMDjTyU38qmWjf2aK1K768BPJ/xOurHUIBeHw1UPrFMwdCFsy5HvqdF07uV+EO3WExRJCIsAgMDVi/fmTF9sYWnhgBfKoh5dO+yhInB0ZmodAAGIuU1DR2we6uXTrukWQXvfhQc5Hb31UzfG+85ouNpOU2YSfyIApBwYbKqsBbU/I3RzwaKrI9o+lmKficd4hXNhTrfVF2yj9ysqQXmS6AsIjSkvd7x2R/4Ay/+GAAHYq7dQ8s5P0UcTDmFASQtzjgvLfL+tAiq5EXCB5D/6DUvQwtPCBG/NcH8DesonvkVGjNF0jl+Th5TKIHxTh1ji/eLIxZXFqn3RWf/6K+WeORBkndk5Ts9hW7jd8laL1E8zirZym9iPzN6c7LRJdG0tBjhr/LeuOy1reHNmkAr71lGmfuvHakefEZUo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(10067099003)(261009223027099003)(11063799006)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/bf4ssBbLJ+mrPD64oyXXMeemXNzp0ewCWMG7r8SI+FHHdJ6v8nR/mIsYoEp?=
 =?us-ascii?Q?bB6EdnJtYoSBFlqWU/Mc3oRmLeTCDHSgwej/76Z0pzsYS6FXT92Q5llRHHUe?=
 =?us-ascii?Q?EtANouNTgsvc3TtlyBnlh37jugzWEciHvt+MNab7RrzyrN2EYtxkS/Ux/iLj?=
 =?us-ascii?Q?emT6okVHgNokhd+uv3XWnp8gKEJatPrsMmsamDn1vZ+Wk3Tm6xbNvm4TrfQv?=
 =?us-ascii?Q?nxSk9+E0gSJDWZBtcf7sFl4yQZ6FZ3HrwMINlXDWSAX1iH+rXTjvU27CpnP4?=
 =?us-ascii?Q?khQx+5/0M0PfzirbjYJ0ARGJvPzd6qilSQUXTDwia1BPYHXtGEcqA2ixn6ml?=
 =?us-ascii?Q?vpmKImVk3LUXF1m0DtQ4rK9wbw9kPSNFkWAl/KmZMHWm7M/81KmULmVxg4oK?=
 =?us-ascii?Q?J3achERdvB10j2Tpm124HHwTcI9c6ae0SU4EV27jP+KLNtuUxxyfwdQTQM5M?=
 =?us-ascii?Q?TTODXxUyqnEqKSip83lyi1IRzXDKy8V+LMAdvN7G+PZjy0fTUbH4lcrpfTW6?=
 =?us-ascii?Q?aeAUslWoabXyejNQRJA1Z29oM8nmsvyxXPPt8kx9iaf50eJqZSRHo/Am35oq?=
 =?us-ascii?Q?Nt7EexfWn9iMHC4HSZLtBT0tQ8E22x40QtjXIxQlxmyNAzVRwy3958aSKAMz?=
 =?us-ascii?Q?rMkHbQtr0QJoRyBJ2e8od6fHBDc8KDdiCUmlZi9rxw2Ck0q5oniCuaczG09O?=
 =?us-ascii?Q?SBa/qdp3mFm1dC6k0fe7HlddISbgVdmWvxETt2YVkvtyJOjY4g8/FfRfU/yj?=
 =?us-ascii?Q?6XPOq6XNFOmzTVpriQ3TO1E4+HnSZm4Tbl2sRptJS1eg7hcALihmsCNOPt8K?=
 =?us-ascii?Q?f8eYNR94YfcAgS+Pqq2SPrJDd3Mge87oGwSqwVw2xPbMaaFgnKnjh2v8AAG5?=
 =?us-ascii?Q?t+fniPE7ZnUM2vqPcJutz6rRy9Hfuan6sm6b/dzfVTTpToHyLN59GeuLK7PN?=
 =?us-ascii?Q?ymd4K/RvAxUU3VQKKYB688cV7lz0SsuKVd337tGPomj70DlLl8ecnwNP+ZCk?=
 =?us-ascii?Q?C3hNL4/SSMcrsyJO5KUYKJebH/0vJXj+a/y2f2t8q9Ik/YjbHX2e4eyMbZ+W?=
 =?us-ascii?Q?VHTlUM3Ig0ZfBxb8Bptn1kgjvuO+qyVF+ZVczA+HtOgv2bsVmSMyOP8WnRSg?=
 =?us-ascii?Q?VaeHKWPBVArm1scWGx+OufrmmbWzfP4Q/8/KggylIsr3/vi5zXXLnsVbRuqx?=
 =?us-ascii?Q?QyvDv21fSlHqVyLemqCRvkxMfAK0dAMfE7kmly94igE9qhi6TR6h9tFhGayZ?=
 =?us-ascii?Q?cd9Sxq6e470NzQD6TrgMpDv9zIS1ueQXcmCvc+XhOhUbmmmaYBcNp2Sq0PFh?=
 =?us-ascii?Q?tuPSgEU+5Q7sQOPbXjfOrOPOq3whfeUekg6pl4qoRow9v9pFXvywjUFrbjt/?=
 =?us-ascii?Q?FKiQqhO7m3QPtE1E45CbJB0/c7KLsEyuXKaq8/J+9cH/q1mAeyP9i9J83JWP?=
 =?us-ascii?Q?Qc2dQCCmXunuNPo9RxMqxQgfI/Q0WIYp8CJ+U0xW7S5u+5POE5bL+0UL7A0p?=
 =?us-ascii?Q?dXxzP/KK0v8Pxv2hRcoYOBrk1UznwF8z0IbGfB+4DYPzKnFoPpK4kJJdha8I?=
 =?us-ascii?Q?W3tfqCtgxZHj/K/MZuG9xfRzcOETs/NOpwfY4wOPEQSzJAvZ9v4fnKeJOfXK?=
 =?us-ascii?Q?SCkXbI3laoOMctuiPVjdfLCiikWtlGBt7A48WdG/He6J2mKEa9cUINkw0M2G?=
 =?us-ascii?Q?NKKKufl/Gcx2FCIbnot/O/IUYjloHmpKI96UwatQQ6r4vDFuNTOR1NChSx6a?=
 =?us-ascii?Q?2up9odhQDg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XXcPz1pLOlJRI1o/3X9ZNsM4aD2L6vFUO2uTGNbu1Nxe0Sl+eHlF+8KFkCb3LFP4siNLRgq1Ly/Lv8OLL3U2QODvEX+yndBCDEO8M1da7X0DrJhjk0tJVUAVE1hPY5Ri9c8SRHMt2+wqGD6mkFnJcsk5rinrM3ycrgSIqgf68XE61VPvcvBBdrsWLs2WnXfM63vCHziSaDOBWzp68M9C2hrPSOvxmYWyckjDX6BlU+3/epTocm65QDC9tTNh8MlCb76i1qWP/VDubiN+jO7+LSygvQpXrJTJCTx9UQr3/Tfk1t8k3SmKLZrf/ClcZk5qUqEds3osFYUOdwq8/81iJg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e106d5-c27f-4f64-8e51-08df28df4b85
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 04:06:01.9341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sc+rY5uMkH577I7FloAsDYUteM0Wr9g/8jHZ1uSqzjOTP/NYMpOlDZ8uuBqb+54KXPYckCkLp2N/eNn2o+QdhNEBg4dQhGXeRkepv9vMgxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6431
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Bomm=
u
> Krishnaiah
> Sent: 06 October 2026 07:33
> To: intel-xe@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Nerlige Ramappa,
> Umesh <umesh.nerlige.ramappa@intel.com>; Ghimiray@freedesktop.org;
> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Subject: drm/xe/oa: Zero OA buffer at allocation
>=20
> ttm_bo_type_kernel BOs are not guaranteed to be zeroed on allocation and
> may contain data from previously freed pages. Since the OA buffer is
> mmap'able by userspace, this can expose stale kernel memory contents.
>=20
> Streams opened with DRM_XE_OA_PROPERTY_OA_DISABLED allocate the OA
> buffer without calling xe_oa_init_oa_buffer(). Zero the buffer at allocat=
ion to
> prevent information disclosure through mmap.
>=20
> The existing zeroing in xe_oa_init_oa_buffer() remains necessary for zero
> report-id/timestamp detection on enable/re-enable.
>=20
> Fixes: 392bf22238ff ("drm/xe/oa/uapi: OA buffer mmap")
> Assisted-by: LLM
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c inde=
x
> a3484e943c55..3bb8bbef4c37 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -914,6 +914,13 @@ static int xe_oa_alloc_oa_buffer(struct
> xe_oa_stream *stream, size_t size)
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>=20
> +	/*
> +	 * ttm_bo_type_kernel BOs are not zeroed on allocation, so the buffer
> can
> +	 * hold stale data from previously freed pages. Since the OA buffer is
> +	 * mmap'able by userspace, clear it here to avoid leaking kernel
> memory.
> +	 */
> +	xe_map_memset(stream->oa->xe, &bo->vmap, 0, 0, xe_bo_size(bo));
> +

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Merging.=20
Thanks
>  	stream->oa_buffer.bo =3D bo;
>=20
>  	stream->oa_buffer.bounce =3D kmalloc(stream->oa_buffer.format->size,
> GFP_KERNEL);
> --
> 2.43.0

