Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF260C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 23:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D8210E714;
	Tue, 28 Jan 2025 23:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nHzikbjc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF53B10E714
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 23:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738105489; x=1769641489;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0sXg79U/1gkam9WGR7sk6KvUWEJFUX2vyIS7W7d8zpY=;
 b=nHzikbjco+zLobEbMiI8j2d8e2Jp2D9kSxHOiss1q7GE2nq5UxZEUaTL
 WvjrvafNh7EYEM7L97h2uI0ol571Ty9cyLZ9DEqIx25aMMyhHPIa6tFT/
 IlOSlBeBCvhK1ZIWoZGVRkLKUAvLJ7VfL5lZsunuFAr8/IaTTvRaHtLRS
 qIFfKLGTix5IWTGr65K/V7fN11OsjMEeMEKrO7y9XR85M2fACAwDFIv/0
 PFm8LP8BSqkQJaf8QkkIcKnYAmbR6QbL4LXUXi24XlJXi4Pu7c79iFNh+
 Kesp6oyGq2d6wWo11JrJ40S+iX0GOzYszgw8Gn/Hw8VTtIj2jZdEp8TuC A==;
X-CSE-ConnectionGUID: Rj8ahuicSmCXx9GUhbPmkQ==
X-CSE-MsgGUID: q47Y3L+3TaqRmu668vbPOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38312597"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38312597"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 15:04:49 -0800
X-CSE-ConnectionGUID: +ussVMTuSVKfWkieGHkWzA==
X-CSE-MsgGUID: IzLBe+nUT8iroP/DfKSGhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="113905458"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 15:04:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 15:04:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 15:04:48 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 15:04:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qK35zc443a4sFip7kdDuqcWvzC8ufbpGGmQyp0nkMKrwlm/zOzInb9sxcUpMqQO1p/mMX1eL3iksOx8paxI3ETBUvCwy9KPEGMVqEsJXmia5uVAvuvi/9P5CTxm3aIwARiK1xOFKXNBzy/1k7uBV/1jaziIz82TCKqp4PJ2JK3slTyZ6j5HNtKEMqKBUoUDEGDO0fkTcGKaexd8R5ZBPjXRqisR2ECSa9fbwGJGxRHchEWGR5bCMUavIvmt/K2zOaPoipQzKnTASx6U+sGFEo/N6gZj2qFRB2N1/DkA69cq54Nz+LczMryh1DSQFyIt/orLoDGfxk2gCHcK3kL3hlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eu6SBeJEyb+QVOtBU4SGT9Sp7nUflnzZmxsenuOP56U=;
 b=Wn6VQ9oWNMc/ZKve83uyo0ij6uUSnC9hu2PPDVmT3d3kVqGQWbyjD0C0SBOtshzC8uVeVvMuzR2MejZVNX1b3Pmr0t6SI9u70mK4CU+bI8v+zHiawPzAQeQ937SgriE3E7ha5F+rOhA/KsppKOXczfhqaD0xcSz6LVdZPQv12oE1nlW1t4gso2akrYs3ID3mlqsnpuefYMP1ugXUKbU09ovKaiYfN/EAdx4o1abNYyjai5SegAiwm7WojKrUgLCqOMdI8ubC8Gltv4ajXn6TmUdvR1hey0re07Jm7UpCF3hsDIrQrWil3doYGuBAabanrnSQGEnh11u20y0QRpSrfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Tue, 28 Jan
 2025 23:04:44 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 23:04:44 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/3] drm/xe: Add a function to zap page table by address
 range
Thread-Topic: [PATCH 1/3] drm/xe: Add a function to zap page table by address
 range
Thread-Index: AQHbcdD+yH2gu7gTAUSbGV/nZZzSBLMsyL1A
Date: Tue, 28 Jan 2025 23:04:44 +0000
Message-ID: <CH0PR11MB544425041F3B35E3A4F6F745E5EF2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250128222145.3849874-1-oak.zeng@intel.com>
In-Reply-To: <20250128222145.3849874-1-oak.zeng@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB7303:EE_
x-ms-office365-filtering-correlation-id: aa1715a7-13a9-414b-bdf5-08dd3ff02772
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?IyYCUDxTj2JVJNe14JQdT3sPlNgbb9wuDfA0a0lsdGss8wVG4UZgGUV4LmRv?=
 =?us-ascii?Q?aidF+bCjMOlrejsFqDkYOrupMs+YmjKNFfCUbYj054FJZrVg2n8JVqQ9kTbO?=
 =?us-ascii?Q?60KcCif6l6hnOYv7oqDx6r9+WA30HDcFfZoyrAsbUc/PLKXZZCd/D0Nxq1nF?=
 =?us-ascii?Q?2ZsInRGY2vwH08PQtc1bqNkssR6gYnWYAv9vhXt/8Ry14Y8N6cp3V7CCMbOD?=
 =?us-ascii?Q?yB8maBtslwKe7jgVZNykh+VNbW4ofKyGrx1l3gjGg/jNkk8PcermVionqq3e?=
 =?us-ascii?Q?tmapgdEyAdIi+Xj6XO3D6uf7FN4KiSomxzVZFJeg6TVsas2XBvfIptsCc56g?=
 =?us-ascii?Q?VuYJWidGN0/KMIUdASoKg3kgQcFV9nKUXPWFTlGyQVKJsvaaWiQgSLCkvPnJ?=
 =?us-ascii?Q?3sI2uma0Kzt2vb4rhLBCta015MR8DRN7qfqQ67fgHUmP85s6mxnSZ2ugPbrn?=
 =?us-ascii?Q?9jmL+KyrLFQO1GSOp1xbobxpWVk3BEd8A5XDmrbaOfbTFIvBZ5vmZYl0Tr3E?=
 =?us-ascii?Q?XOsjCrNOPwkAsQZwDv/jnxxy81s9SF0rXDDXz+MqF4Q5uWQWybbLtsyQencE?=
 =?us-ascii?Q?ReWqbppeL2B6/jpvgBC2E/USqN9ui1PzkeHtvu1AVBjk2oXt/Mt6cwaCaDsl?=
 =?us-ascii?Q?6ozubyMmKrMHcMQVAh0dQgqjWeTmaUbsdTfXNIvuhgAo7NBP3ffFlcqK7W+u?=
 =?us-ascii?Q?GAZul3JHYDyWe1gfrTkIGfCV3dyAsCu6fr1XYWSPIk85cCXjVXnJTVSl1WGE?=
 =?us-ascii?Q?bxXmABvWrORQ7vi8LEtwFjvz9RkqbktV2smuhGEZDqImtO3ftyE7OQ/Dnz1E?=
 =?us-ascii?Q?8L2xfIwj3NaH+4GUzkn8gxs2u2glq2Cjyk3WaHSY/4c95ZfoYHev9RHj4j1L?=
 =?us-ascii?Q?t3B9VOgAzW/WuEGYikmptnz9GLxUGvH9uz3lzmMwhZdvot7t8Bt+2W2thXfe?=
 =?us-ascii?Q?BcMGSkFBY6xpA4JaHY1U4JHHxkjA/TTvQQCeRBXniX3SntPqX3fhFNe7Nx69?=
 =?us-ascii?Q?Nze/kcvN6c1XI/wEu2FPS7cxry2+eosRYAOW5OmQKxdOG+DdimtpVhbxYiDM?=
 =?us-ascii?Q?x199rlS7T6UhkdkVpjF4+SOxnkyKevfhqHlsSAx6t4jWrAGnEExJS82rsQ+F?=
 =?us-ascii?Q?zC/B9+d29iKkjGPTnsC6KYBNCKl+xTdMTz1nOI7yF/WDQnRZ5ExKo6pVlig3?=
 =?us-ascii?Q?bnXYPjtvzZXdfFQu7857ubjQAcvnZVxV9Ev91BhN+wywMCuJ/3n9ycyQDwrM?=
 =?us-ascii?Q?TCw13Wv6btaZPfzqz9dKDPVZUx7oIhnzinS3lx2Suy3J7tTP96Fw5HiOv/ZT?=
 =?us-ascii?Q?PhijV4DCtx0CbIOPfPYM3s39o6h4zoFIhrsRMWZ/cUzS+Uwc+3qzFcVBhfhx?=
 =?us-ascii?Q?2VxaYS2eUxKOrPl5QhzJTfp0ItUR4/fArfBWkqebF1AVtuYONYofd0vpymDd?=
 =?us-ascii?Q?w3kXtgOaxJV7z2rd59fjlVbyLwEDdeqg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kyOdAE/c7TT12sJKUZ0orbMVxZJtU3vH1bCSWD1ZIM6y+cobZ7/X0WfOlc9/?=
 =?us-ascii?Q?e1eNjUblNK42c2z74ThKdmk9T7VWVf6B1K7k87Ckp3I5lb2r7l7uEDKZTl55?=
 =?us-ascii?Q?n0QY1sVInVzpY47gmRXNswlJvU1iXXNxmL/aCzPUZGvrqgUJQ69NGjHUGDIi?=
 =?us-ascii?Q?FNVIBLcWT7+cUqH4c4AwBjVlvi87/LL+WCAqHXpNdTsKFgfUssNe6nXh/AqE?=
 =?us-ascii?Q?R8vrnD0NJMxzulb1cRC8GDFGcxLCk2tU5B5ct7mUQIscpx5RfuIQ0IniYJiw?=
 =?us-ascii?Q?cFRM4C9chHBqUoyQVadyz6Q9B1xFlIDNokm2JM0qFooASIBBKbQbgCtow/cv?=
 =?us-ascii?Q?jwbbKD4q7GGghRmBCjHspz0JGNd6BaCIW3pcbKQVEYD2hLRVSBShl6XyDz+i?=
 =?us-ascii?Q?/S13ndhPtPYqZ8TGkbLc0FQRvZ4Z5AY+riRw8GGGSYHvzE2Y9XoXbHWmr99i?=
 =?us-ascii?Q?28ClpV8MPRZv1yPfvuYEYXvumgWjziy9nrpr6DG9MRHdgSx2+aybqqXwF3KZ?=
 =?us-ascii?Q?uTZ+zk3NiK/OgZW8C2d2fxJAl0FQuQoF/resLr+KswWRmqBXOF1L2C//e7eu?=
 =?us-ascii?Q?QE9X9/wbg6WgxUJlgt6Z/V42br1TrZKZ5yMAyoARCPkOpZussHU4IPPYYMa1?=
 =?us-ascii?Q?L5Kc1vaCoSqgiwrfu/c0LSDEC47KQmv4+J2gjlXW8R9+8Q6ghya+MfFEglgO?=
 =?us-ascii?Q?Zlc2KY3lnq78TuEwnkN1IEheplTYZIC9iGDcp0tC3PMGYVljnqNX9BSG1JNX?=
 =?us-ascii?Q?hDFbTK/gak2OTYZxPYdizpMkKbHne0P4uYFfs+iq8bdXP3SLaaXns0ZY314l?=
 =?us-ascii?Q?WoqY4i1tvTRvZffSJflP2omjJP2bX7vjkipoSTe3/uji2ZgDkx1IV9FAZy59?=
 =?us-ascii?Q?hbfhnyNOW5LZuLbRLG4mNZWTS9KoP4P9VQY8LnUQCdzeV6dm5jpb5I5V2RP8?=
 =?us-ascii?Q?0tiBv+P0sELPFENGB7IiuOHn9x9bRMp1THFzvMXcxlS+bpDm+dg7R3ATqx61?=
 =?us-ascii?Q?YXWSYIDss/c+lFiRHiiCThlSZWyEkSwO9coXffJvBXceEBVVL8O0jSvuWdRn?=
 =?us-ascii?Q?2rgnV8vSWG2eXxnnCjyfgvLk86JtTBJAe67l5CwWrCYjcnb+t5nCeLRXEWLZ?=
 =?us-ascii?Q?rzvubECQ6ZAse5GYLV+MHF3G0uqoGvhog1n3c8TASSUo7YSN9kjUHRPQWbkb?=
 =?us-ascii?Q?zNX8g/Ixia36oj9r3ljTozcpqla42js1C9MEbAU4DXqEqzpKu9lpDRI5QTay?=
 =?us-ascii?Q?xPXQC0RWW5qM/AkBimMk2tXZXwCGX3+DfnZD7MXm3nQMFTWs2lyNZf06GTeK?=
 =?us-ascii?Q?NSfujl1ymgV3sY3vk4iSn9wnyt6XoTINwCGPshw7hLSsRz3uDRPE22jSdhHJ?=
 =?us-ascii?Q?nHXxypvy8kFPXHhUWYzdNzCRMG9Swy0Zunxffx4cy0WM38YCKuP0sKGL7QTu?=
 =?us-ascii?Q?pYE6ox55VMnD2oHwb63stkxoFSlUb0jNcO2oOQg8yaKJR9j46WWJ8LpqA5aM?=
 =?us-ascii?Q?vjBDVNz+8qF9vdb2kNhZ1lOvXpBCWio/V7WeDg7X0gvmTBvhY0uVaWG5SdXF?=
 =?us-ascii?Q?fWLQg68+zrHZJnMHouCAaK1E9twKH/s9RuHcrH6w?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1715a7-13a9-414b-bdf5-08dd3ff02772
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 23:04:44.2850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aaH8PR/wlosi8pgY4rouY6FPINYwoGZobLxZshHLUrqQakQYe4ZwzI3DWjWycVBnDvUaxPZpqZgrzrltcm++3c6Qp2udVWWDMIaSE1r+wzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Oak Ze=
ng
Sent: Tuesday, January 28, 2025 2:22 PM
To: intel-xe@lists.freedesktop.org
Cc: joonas.lahtinen@linux.intel.com; Thomas.Hellstrom@linux.intel.com
Subject: [PATCH 1/3] drm/xe: Add a function to zap page table by address ra=
nge
>=20
> Add a function xe_pt_zap_range. This is similar to xe_pt_zap_ptes
> but is used when we don't have a vma to work with, such as zap
> a range mapped to scratch page where we don't have vma.
>=20
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 28 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pt.h |  2 ++
>  2 files changed, 30 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 1ddcc7e79a93..2363260da6a6 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -792,6 +792,34 @@ static const struct xe_pt_walk_ops xe_pt_zap_ptes_op=
s =3D {
>  	.pt_entry =3D xe_pt_zap_ptes_entry,
>  };
> =20
> +/**
> + * xe_pt_zap_range() - Zap (zero) gpu ptes of an virtual address range
> + * @tile: The tile we're zapping for.
> + * @vm: The vm we're zapping for.
> + * @start: Start of the virtual address range, inclusive.
> + * @end: End of the virtual address range, exclusive.
> + *
> + * This is similar to xe_pt_zap_ptes() but it's used when we don't have =
a
> + * vma to work with. This is used for example when we're clearing the sc=
ratch
> + * page mapping during vm_bind.
> + *

NIT:
The asterisk here can be removed.

> + */
> +void xe_pt_zap_range(struct xe_tile *tile, struct xe_vm *vm, u64 start, =
u64 end)

It looks like the function xe_pt_zap_ptes returns if the walk needs to be i=
nvalidated.
Will that also be needed here?

Assuming not:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +{
> +	struct xe_pt_zap_ptes_walk xe_walk =3D {
> +		.base =3D {
> +			.ops =3D &xe_pt_zap_ptes_ops,
> +			.shifts =3D xe_normal_pt_shifts,
> +			.max_level =3D XE_PT_HIGHEST_LEVEL,
> +		},
> +		.tile =3D tile,
> +	};
> +	struct xe_pt *pt =3D vm->pt_root[tile->id];
> +
> +	(void)xe_pt_walk_shared(&pt->base, pt->level, start,
> +				end, &xe_walk.base);
> +}
> +
>  /**
>   * xe_pt_zap_ptes() - Zap (zero) gpu ptes of an address range
>   * @tile: The tile we're zapping for.
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 9ab386431cad..b166b324f455 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -43,4 +43,6 @@ void xe_pt_update_ops_abort(struct xe_tile *tile, struc=
t xe_vma_ops *vops);
> =20
>  bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
> =20
> +void xe_pt_zap_range(struct xe_tile *tile, struct xe_vm *vm, u64 start, =
u64 end);
> +
>  #endif
> --=20
> 2.26.3
>=20
>=20
