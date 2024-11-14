Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CD8D65C7E
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 12:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E4010E340;
	Thu, 14 Nov 2024 12:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXoRbM1u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F9110E340
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 12:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731587219; x=1763123219;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TFyWY1UlCRIUR9J335vOSrzhig4ZuzX7TsxhJG3aZ9Y=;
 b=iXoRbM1uG3LAD/Dp1bZQ8H7VSFzpeR1wyL3tKM8P517DeA2OX0aPj0eR
 JKhiNG4QmH2DEceXRj4rgc6ir7eCNf5f0faLNvuldj0nIWChQ3gJ3MAWA
 8nXS4e4IDC5yti3jitEyeeMHc4vV99/6zfcfkBZveQBRkxEFn8Jba7R8m
 HpMtDuiNSjuODZSycrE+5Al0T6lHxFF4DsK4FFMOsQTVPOEMp/q32NMtj
 mSjx+Bp9wZMdet5Uq/1cE/+debaZT5LXvvBHGXtT/p7/dmC8SftQA8xOZ
 f2Y0m1nDgpX80w/uPxfa9s1RPJb2oJgm2lup623/78vGkZVHeHG0UzHjd Q==;
X-CSE-ConnectionGUID: GL7vc4/mTV27v9UHu+0zxw==
X-CSE-MsgGUID: MBli4FN+QuKAYSP6dtybrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="56917547"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="56917547"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 04:26:58 -0800
X-CSE-ConnectionGUID: VuIpT1LmTRCGYF8igqjxNg==
X-CSE-MsgGUID: eyPGNJ/DQcetUdgMWmIGWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="93139037"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 04:26:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 04:26:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 04:26:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 04:26:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ob9xfDzONvbC+hVRkn6kMYgLeLmlo+ywuAUHD63qfEE6dFnwF+l+jDSDdB5JaD7VWT7e71AhF7bw2ZZ2FQ1iwdRYP7BojhARFnwC37wr8O8yrVP7iWw8J7qs48yW1DVvh2nNBfLz3D6imn3lojckaDTXIOvOBQAcUt8mnzXdpbCXdmI3sWMuz6W+EL4HgzZh7F58qalij8wWgztl2NQJ2O2pQEF+TeHb+dpnweuKVjT3ttJ57EF+uUDKEaCHespDAOoeiURTcbS1b05OCo4kvubsbVnhz/OGzoHY8CVgskqvt9DTjo75BSbiJVl1itQSojcWgBO0D2+rZ1YA833tfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSpDC6VMGjiwXV2Xceo5EtGWQzKxEjHd9iEjUNLkBrM=;
 b=N76Ya8JQc/WKDmK1ad/yNH9qVosH4vMcPkyJETkXVbRnbY/jzvtkIXfgHXh16TDiDvvbMBLqTF4VxHBwziW+LenWLLAVG9V80j5ta8JP/zk1YpMTFkqSfaHSoXAY/N2a7oqu5cUP025aVA3BzuCJsb4H1vMJfAc/wPACQ3C66fjPJHd21MaOf0cywFL/fgWS0482Q04ZC1FF/IR3ZO7vuQWwW1E4gZTu2xZk++R3o61Fp+CF0FL91J404EYnOeHdkJS4R6iPPQSLAApUBV8frm7uQOCXDP7LRY2m2542Lsns+yi68Ada/gme//lzE0pyseJLJvMjluamAGeXf02dFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SJ2PR11MB7475.namprd11.prod.outlook.com (2603:10b6:a03:4c9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 12:26:54 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 12:26:53 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH] drm/xe/vram: drop 2G block restriction
Thread-Topic: [PATCH] drm/xe/vram: drop 2G block restriction
Thread-Index: AQHbNfDdg/SsfMi3u0WPQAEa/cVXhbK2tK1Q
Date: Thu, 14 Nov 2024 12:26:53 +0000
Message-ID: <LV3PR11MB8695FDCD8F23DED286F8F52DF95B2@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20241113172346.256165-2-matthew.auld@intel.com>
In-Reply-To: <20241113172346.256165-2-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|SJ2PR11MB7475:EE_
x-ms-office365-filtering-correlation-id: ac6093d5-7b4f-472a-9cb0-08dd04a79f8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?sPxQ6CswDYy2yBmJKo4HuHuB2LdhHYC1jAnRmcBitTVc0xzg25Nhg4HHqW/j?=
 =?us-ascii?Q?YNhFLPnl5Xm4cDBobOpfGgBjZM2WRKiQj65FAtokhpBi/8Kq3VGnot0IN9fr?=
 =?us-ascii?Q?T350jbd8hnf+B30MtP+Gl+rgDY7e88/Gkc+fLc4N6qoCUlut+HxFYk/93IFG?=
 =?us-ascii?Q?JdpfCjutt+73cjj1p7GxpSg4EnBidaPCR1jd36cX+XxRwmr/pD1U3bZEh3M5?=
 =?us-ascii?Q?heeUX1Cwb9CJ0LInS+/nVER8h0Lqy7odtgTQt8vtDcfTIxJuu7O89bhT+WJQ?=
 =?us-ascii?Q?DCpk/YOY2UAy2yRvCDjrx5WsJH3LOi7CDSEePg1XRHudRdLRk27amxwc2/TC?=
 =?us-ascii?Q?Tb0iipz2WqkJdAKx9xPm92XG3gVlqwyJe+l3j61RzkSuZPE76qwzjVQ7nH3m?=
 =?us-ascii?Q?NBLD4XmbKdLWIJWn+lyBkRAOyr9qLm3Xa2suTqjWpJC/Z3cwS4/T+la+O264?=
 =?us-ascii?Q?ilA1mA8LLEoYIm9R2vUa9s40ddWjfyG1hpiX+B5mtSmnGYBlZMvI4uiVqb51?=
 =?us-ascii?Q?7g/M9hPksGhTtli8xEg6SkR1UmC14xe3WyGbz+lfJwIex+lmfy7+85yoXL4I?=
 =?us-ascii?Q?zOAHNlyuZNhQrn5U+VKlgPY+OHPK/8QFtVos05gabOcUVEe/julHmvZpIH/m?=
 =?us-ascii?Q?ue4rXDb11w3PgnwcLO6OdFKMtO998afMd1vSi7wf65BU18VKHf0eb1/PNnJC?=
 =?us-ascii?Q?On9U0GRGE1m2+1+XIN9mlo1GfB5B9c0KwP7c5jjcqB54iiH1B1IeF4PfYV7Y?=
 =?us-ascii?Q?0SIav5pa5CYwjUCeeSd66Qo5YByUybjk0WNUuVSZL75Lec4ZMhbP3S5HezyB?=
 =?us-ascii?Q?PIvzc2NBpARKPDJk3hKggMw6Hok2Plbsp+kuPoheDiOhoo2ha86uh7bQ/OSG?=
 =?us-ascii?Q?rRLUYllzXcxeTCmxrMvrpT4SPOyf9jkMbc+65jeuP5ahBoTO0c5tb7K8Ksg0?=
 =?us-ascii?Q?dJIvHWou+VWd355u8JiUW14OCTRIlW9bRrBSfu0WSjKhIQXWZo7/kQKN8MfA?=
 =?us-ascii?Q?q8gCDgVD24h3TLYQh9kRsK+GeEG73uJ6dVFTui7LIPnDAxoADwS7ZWd1BsJw?=
 =?us-ascii?Q?byjc5w1sGgNCX/+TVPwYJMUwGhLXiYwLDk9aFMD+5tWMh9H2yKmiJ4ndWrHE?=
 =?us-ascii?Q?p2vYqn+dhQLv8LBc9FShEOxJ/WJbYrFuX0Zhsba2cjBVhY2Kggc3WbDboN2T?=
 =?us-ascii?Q?jljnCeQ6cg63EuGpQexgXBHROsT3glVc/4L3VRZOueHFxnkHyrBFnzoNKoAa?=
 =?us-ascii?Q?ZiiAFZ07dVUlSdQsdTH9RjSKEcv9Od0/jKPpbS2JaCYzI/kzQNhUMoC270SU?=
 =?us-ascii?Q?MkpjUeKSmwvJaEifmyqG86tLNKzYLpIKLJVtWr3rpoUId3xUINOXG6r30ZcJ?=
 =?us-ascii?Q?hJrDjE4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ABsRyt/BcYcuPq5NXFCmnPfkOIg8yY0wnFTsgrFXjZKJgA+01VbIc4Wypy9K?=
 =?us-ascii?Q?V7GuFc6VwtErCOfSU+yyNB5uoFWCAgRVCMwus8kcYiTBzZFQS8S9kH9qTm1L?=
 =?us-ascii?Q?d04HeAEIpl/BFCe8mtFeW3STBkI1SwgMUVrG+SN425HAkMlOlMJ9XZDvs4k5?=
 =?us-ascii?Q?IiTu+DP++9rtXsI/BoNOZ5xb02rMOxLOLKWWQYif7SszqRliUu6+eaQql2Gp?=
 =?us-ascii?Q?yX41aCBaBi5UNlDIPwZJPYQmlmCBqFCmP6UL+T9tD6pI9GBRLX8gAO/muSKw?=
 =?us-ascii?Q?dMKl1clakk5soTGCBlReGjVew1GqF0d9o15ZAvaifWeJkdKA4fl0gpq3DkA5?=
 =?us-ascii?Q?UKiNV+0uezSPvkKMUmwkICZtiIaAkdFwPWM7KzcQJKkr2dSV7yV9zpLDiWnz?=
 =?us-ascii?Q?2ARIv8LjHr093XQMbMCJEnOXK5i5W1D0wdPfYx/oR1SfHQAzhVnmPPD4ijmL?=
 =?us-ascii?Q?7m/vkmS1mHbNex1l7kF96oLp1wn/ZoOoqS5jB9t1r6eUwgRBqCbpetujI+7I?=
 =?us-ascii?Q?E4Ggj0Lg+LJlbqu/6RVHJSxaRDMyZ5CP85PlAw1Yg0U8UzUin6kxSV7gzttb?=
 =?us-ascii?Q?su99R8ZJvYNFUJBtvQkAKpx8y6w6L400KTjdeHYb/lDx4z8in3LVJjxn4cCx?=
 =?us-ascii?Q?v7xb70FVsZgu4GkpZOEKUmObYscqvkZjZcxwQ1EHdpE+0WVGKbMBoufHNucw?=
 =?us-ascii?Q?ZcGfhiXe7Ew/YdYJfc0L1PDmh3i94Vi4QbLeZTSzCYacmr+m+Ek84yHwTDEF?=
 =?us-ascii?Q?Uz3LkoLG61suuNPag0rJo6Kv9EvSDZwZ+AijXOW6O1acw4aeFQM+St+ucIIx?=
 =?us-ascii?Q?QvSQPwhrR6goTdeJY5qqrPH/jyGwKa9y05qNrjZMDABlYJfXq0bCjmh3hAB1?=
 =?us-ascii?Q?JNYXnwLacgDfn/B0nGpqSFaojT5CPHux1nlVGxJJWeXHCpHFw0441UatV9Il?=
 =?us-ascii?Q?Ny8rl77Zrp5eH9grg1EPuFeZfcSqhbMLEONn5Nng73kfogMLo5RtVucA1TJs?=
 =?us-ascii?Q?kzLcE5idFQbJ1rdmkw2kd+fS4NKvhaegtUPP+RxkP48EwfYy1ZkdaTeBv35X?=
 =?us-ascii?Q?GvizmO/JZQkPzafXR7IYbRxXd16DtWYoIvdK8JRmY7zdtQmUqI9N5oyCpsmY?=
 =?us-ascii?Q?Ucwr4DgbgJehRIlKZFByNVdi7dRYUssHjLVXrTfvcRxmWseskFNlteKfVxww?=
 =?us-ascii?Q?CnVBFIHaS+NZnC2v8wQ5lQRC8GH+BhOgR/ciuKC50UwlA98sBE6PM1/xAMcO?=
 =?us-ascii?Q?mkfkiOm45LZ/9wWODa/ryKhlAWlYzw6vuYdw7eVcA/liNdpkpbeB6+8PRODe?=
 =?us-ascii?Q?VgfPMxeb3CWJwnXbXxT+aDKOeTufWNbGie19QjAonCowiZyTRZxAJ3WG2qoW?=
 =?us-ascii?Q?9t/YTeNqQ6zZFtqDYDnNieZ3Kcc2OHKzV2yYuTrjMCrm2tRbUiqzf+lKr0Dr?=
 =?us-ascii?Q?fV0kHfLpbRdxrxbwv1IewLKbeRmjPHeW/E/XQ8qK8bQPO+Of6hb9/63/xHEF?=
 =?us-ascii?Q?a9vtBqcOhSuYX7KffufkvYumzx5FX5SDII+9JscZBtR7VXAgF0xdrCrOcYJz?=
 =?us-ascii?Q?+ReWbnNwnTdQF/vMIf6cCPRATDgeQXAx1KKqc8zhqmKfLntwiDg+EiwmELul?=
 =?us-ascii?Q?dA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6093d5-7b4f-472a-9cb0-08dd04a79f8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 12:26:53.9338 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MNec2JyuI3rOoUbgGTXhNw6enV6M9ivLCSnQCqGPTTB4d9OmShSp0Op2T4us4vbrffe89C9ICgu+Zwv+f0FZc1hu49G1hXi/xM5PY/ATPHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7475
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
> From: Auld, Matthew <matthew.auld@intel.com>
> Sent: Wednesday, November 13, 2024 10:54 PM
> To: intel-xe@lists.freedesktop.org
> Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: [PATCH] drm/xe/vram: drop 2G block restriction
>=20
> Currently we limit the max block size for all users to ensure each block
> can fit within a sg entry (uint). Drop this restriction and tweak the sg
> construction to instead handle this itself and break down blocks which
> are too big, if needed. Most users don't need an sg list in the first
> place.
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
Tested-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 51 +++++++---------------------
>  1 file changed, 12 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 423b261ea743..1d39a8c53b3a 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -52,7 +52,7 @@ static int xe_ttm_vram_mgr_new(struct
> ttm_resource_manager *man,
>  	struct xe_ttm_vram_mgr *mgr =3D to_xe_ttm_vram_mgr(man);
>  	struct xe_ttm_vram_mgr_resource *vres;
>  	struct drm_buddy *mm =3D &mgr->mm;
> -	u64 size, remaining_size, min_page_size;
> +	u64 size, min_page_size;
>  	unsigned long lpfn;
>  	int err;
>=20
> @@ -98,17 +98,6 @@ static int xe_ttm_vram_mgr_new(struct
> ttm_resource_manager *man,
>  		goto error_fini;
>  	}
>=20
> -	if (WARN_ON(min_page_size > SZ_2G)) { /* FIXME: sg limit */
> -		err =3D -EINVAL;
> -		goto error_fini;
> -	}
> -
> -	if (WARN_ON((size > SZ_2G &&
> -		     (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS))))
> {
> -		err =3D -EINVAL;
> -		goto error_fini;
> -	}
> -
>  	if (WARN_ON(!IS_ALIGNED(size, min_page_size))) {
>  		err =3D -EINVAL;
>  		goto error_fini;
> @@ -116,9 +105,8 @@ static int xe_ttm_vram_mgr_new(struct
> ttm_resource_manager *man,
>=20
>  	mutex_lock(&mgr->lock);
>  	if (lpfn <=3D mgr->visible_size >> PAGE_SHIFT && size > mgr-
> >visible_avail) {
> -		mutex_unlock(&mgr->lock);
>  		err =3D -ENOSPC;
> -		goto error_fini;
> +		goto error_unlock;
>  	}
>=20
>  	if (place->fpfn + (size >> PAGE_SHIFT) !=3D place->lpfn &&
> @@ -129,25 +117,11 @@ static int xe_ttm_vram_mgr_new(struct
> ttm_resource_manager *man,
>  		lpfn =3D max_t(unsigned long, place->fpfn + (size >>
> PAGE_SHIFT), lpfn);
>  	}
>=20
> -	remaining_size =3D size;
> -	do {
> -		/*
> -		 * Limit maximum size to 2GiB due to SG table limitations.
> -		 * FIXME: Should maybe be handled as part of sg construction.
> -		 */
> -		u64 alloc_size =3D min_t(u64, remaining_size, SZ_2G);
> -
> -		err =3D drm_buddy_alloc_blocks(mm, (u64)place->fpfn <<
> PAGE_SHIFT,
> -					     (u64)lpfn << PAGE_SHIFT,
> -					     alloc_size,
> -					     min_page_size,
> -					     &vres->blocks,
> -					     vres->flags);
> -		if (err)
> -			goto error_free_blocks;
> -
> -		remaining_size -=3D alloc_size;
> -	} while (remaining_size);
> +	err =3D drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
> +				     (u64)lpfn << PAGE_SHIFT, size,
> +				     min_page_size, &vres->blocks, vres->flags);
> +	if (err)
> +		goto error_unlock;
>=20
>  	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>  		if (!drm_buddy_block_trim(mm, NULL, vres->base.size,
> &vres->blocks))
> @@ -194,9 +168,7 @@ static int xe_ttm_vram_mgr_new(struct
> ttm_resource_manager *man,
>=20
>  	*res =3D &vres->base;
>  	return 0;
> -
> -error_free_blocks:
> -	drm_buddy_free_list(mm, &vres->blocks, 0);
> +error_unlock:
>  	mutex_unlock(&mgr->lock);
>  error_fini:
>  	ttm_resource_fini(man, &vres->base);
> @@ -393,7 +365,8 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>  	xe_res_first(res, offset, length, &cursor);
>  	while (cursor.remaining) {
>  		num_entries++;
> -		xe_res_next(&cursor, cursor.size);
> +		/* Limit maximum size to 2GiB due to SG table limitations. */
> +		xe_res_next(&cursor, min_t(u64, cursor.size, SZ_2G));
>  	}
>=20
>  	r =3D sg_alloc_table(*sgt, num_entries, GFP_KERNEL);
> @@ -413,7 +386,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>  	xe_res_first(res, offset, length, &cursor);
>  	for_each_sgtable_sg((*sgt), sg, i) {
>  		phys_addr_t phys =3D cursor.start + tile->mem.vram.io_start;
> -		size_t size =3D cursor.size;
> +		size_t size =3D min_t(u64, cursor.size, SZ_2G);
>  		dma_addr_t addr;
>=20
>  		addr =3D dma_map_resource(dev, phys, size, dir,
> @@ -426,7 +399,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>  		sg_dma_address(sg) =3D addr;
>  		sg_dma_len(sg) =3D size;
>=20
> -		xe_res_next(&cursor, cursor.size);
> +		xe_res_next(&cursor, size);
>  	}
>=20
>  	return 0;
> --
> 2.47.0
Looks good to me.=20
