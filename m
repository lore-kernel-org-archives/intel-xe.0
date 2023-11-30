Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73D2C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 16:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F68E10E025;
	Thu, 30 Nov 2023 16:12:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD54310E025
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 16:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701360773; x=1732896773;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=83pLGkiTarxcapnl53ivpKIJYF7E79/TsMyqqu8pU2c=;
 b=Gc2nCeTvC+LF/se7p12uN2dqbI2j6sZ8osPz6OiOZZ8qzNMdqdOQ3wT7
 c21JuqPZh5HDuEt1KGi96CDy5w2IOFwOE7sUKWDOJsntWllt33IWCSW3R
 adiX2TpcjyWJqM//2ztT0IjV+Zv/tjGZ7ef8Ft1ScGBYU5GlRKkYExpU/
 Tlb9amEfzsJlwtolcXDjVh8f0e18Q06NlKAbMCFpWVPBTFovMXmCziguX
 blISX3KfPdS1XxTBOW41kt85lzzlArW7rBNPH0rgRrIwiFQpqEWi1gIjM
 fINGa91T0a5WahZLY7GNzrHJlrPcQyeAMnC4AG6KhvSmWU0BILXFxeZ1T Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="12055806"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="12055806"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 08:09:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1016682666"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="1016682666"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 08:09:14 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 08:09:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 08:09:13 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 08:09:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URvEX5ByP8TaxtnPTY+UdOA5w/cX36VYW40YNoiOxdzHoAvinbO/YMqZTwFRLzw0T3uX4Bm6Y9pu5XGSrNekGR+gqnnZErykR+7OyFaX2/4PvKMtlDALgtow/U3USXjbRBslNq1gU2AhXIuStJ0XD09TYH3MGGuPA15bLHF9y1SbywcMPISuwjiWI/1UhSe5JcQpAbsCB+wT4LpzGmv3q25MPb3vOD4gpZ2vBq5QK0fRKrPjKF2zq7Z2fVPvettE4tVQkxPQkZ8JCwuSuW/wKyYrrmghuSiPChJ2urz5y3UTVgD2qqyCCxsc5IQvIm5mqqdjlkLGv9T+AwDtdFgxFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCuOPUQdrJgT3cFhUGyB5iv39mKuKAK2REktf4lw+jE=;
 b=G4AUz5dkK26n7XI4U9BEV6Rgw/ipMymyMUn3aeZc/g/ZYMdp/QH7/9osCUqi99eYG4LC4bzfiNYn+xcQcra90PibuteH+QpEX6gWmDwnVSyGMrkk8OGBB2MjGxB+IdZwKQP2+z5zWnvo2omlARs1mtHpxY0qEMh4ODYT8wQvIfYyCeUG9Yxzge6wyg5rDeX+pwJ89t+O0vms18xd2EaAM2gaHa3ETiHXFOAT0vYyK+Hi3hmCmkE6Rw5i255WXEJ3E70EIZ/oas/pQtC1dfjlUnavUZsWuyfXq+i4Q27WuoHfAxUqb8mgncXamzxg+JCyycuJ/KjffRonq20Ml4iHDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Thu, 30 Nov
 2023 16:09:11 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::dfa4:95a8:ac5:bc37]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::dfa4:95a8:ac5:bc37%5]) with mapi id 15.20.7046.023; Thu, 30 Nov 2023
 16:09:11 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH] fixup! drm/xe/uapi: Add support for CPU caching mode
Thread-Index: AQHaI35sonNj9UQiV0adpmBsugseJrCTB/PQ
Date: Thu, 30 Nov 2023 16:09:11 +0000
Message-ID: <PH0PR11MB57823E4D59ADA9117B0CD57A8282A@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20231130111423.434744-2-matthew.auld@intel.com>
In-Reply-To: <20231130111423.434744-2-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|CH0PR11MB5690:EE_
x-ms-office365-filtering-correlation-id: a358606f-ced5-4a45-1910-08dbf1beb0c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rdWBPmuqVePdbdvbis75ELVR4fJVMIfsJpJpN2CEtSwhUKzWg7WAO6fMM83XkTM3hFuUjZSzvvGybJf9AdHXN7/Lynaq8D2paoUW9KvLSTn5SGYGnn9t5MP+asgJn/y9klGdgb6tb7P4YGrA5FKqVbnDf6Tmitd/+Vpr3E3zLLbgm96GVei4ZqJtsLUilAxOTq6TSejy1gZU5qm1LmXeuzjhfTdQy6ZfA2MAsUzRCN6L0q9oLeTbkuHoDDUe5ptl8GZhUix09NUTxcPO9bBvgvYDXjddssnnjB8r6QW5gm/YemEz8c2tMaobelK3jQ+WdVdTIZVfASt1NXZNlzs5tIkJSFUki4iPltKMRpzqlufz3HstXbNL+T5RzDwbO585hw94FnlQcw0P3M+oSIj0cQWJ3wF78QcRnR8PAPoEJsuLzpBJ+CFab1Yp8BCYUkX+rbIhgZlEjUnSIv4dcnFiJwvzA+vUAYS/G+cYI2pP44R9l3DFP10Q+PmobO9qIPn1KotL2e0EQPtysFUYFZzjANa45DzDW05po80bCT+Zgg5Gz1tb1LG90Ryq69yk0B9MEL9DjlifxwgLz5YP8/ZWUpoRqBjrnUSVwgv42J4A2k/3DYggZ3lSJT565pt7TgNh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(396003)(346002)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(2906002)(76116006)(52536014)(5660300002)(316002)(64756008)(66476007)(8936002)(66556008)(4326008)(66946007)(66446008)(110136005)(55016003)(41300700001)(8676002)(478600001)(7696005)(9686003)(6506007)(53546011)(71200400001)(26005)(107886003)(83380400001)(122000001)(38070700009)(82960400001)(38100700002)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sWAwFs3rdAvUgIKMhYkWLdggW68e+IhLVryuyfVJ6+a1Hxm0BhJHHepsAzbA?=
 =?us-ascii?Q?Lx2twUPCEhEfZeUnTogM3dueo752Ao4BSfwBWpw8ggikhH1BdrhTFR+GvHbZ?=
 =?us-ascii?Q?/W1pwBy6r5g/9HMPCKbWP4h2/3TBY/7WcYurVojek7ThZ5JjFu8ktiCrg9Lb?=
 =?us-ascii?Q?g3VVMk3dXTjQ0AVP1rq/beCsJD8l+ml0tSIXQ3YmJXBijI1a1V3gQqnkajfj?=
 =?us-ascii?Q?3M6gVHyDjbOsatPmhwzzLU+qz6lj2oAk6knb99ARwDDv0R8YWyxmSDNZ8pz2?=
 =?us-ascii?Q?4gpVSLcwd96zTfo9QJW35DOHE5aSai2q2C+njM+AheNFQpfvuXTEwjPqEwIC?=
 =?us-ascii?Q?t2CYGI+84JKQGKp/oViaN2TUfw4UFZajvwEiOjHmasCiWgAozvvEuWBaoa6g?=
 =?us-ascii?Q?yKcjd5F8NonC3RzaMZ5Sy5AbyWPhbN5ao9DXqkkmai8EMjKcmNL/ralW+eQP?=
 =?us-ascii?Q?ipD1g8JoEFHkij5OHGJ7VrhM7w5oAJYKRRlapciK/6W+Yi/GtyJTm5XIttrv?=
 =?us-ascii?Q?/12UKVG1nGwZmuhyuimWdkW1YwlZfu72hY2cTEwMdRneCr5YRJ5eUIgIZGoy?=
 =?us-ascii?Q?attiWpRw4S51Kq0agch5DV7GrO/AUgpdWSeauIck0MEOVJnq9SvB+stKotDU?=
 =?us-ascii?Q?N8kqkuP4fzoNRaLX81/FkzgBdc29cuzCB7YXCZjBFr8Lrh9ioSz1bjAZOrd5?=
 =?us-ascii?Q?rBI8AQ4oLqdVrzQi879q7ukWPtbT5i7SIH2z68UMfB+xKaqzJJmtuRBfPumW?=
 =?us-ascii?Q?5PGmANrkj7UtZb0VZ/TYdgYRvXgf0DVU88iaadQXycwNNvckU29TJ/z8qSNA?=
 =?us-ascii?Q?QRcHMv7Qim9Yk1t8+bH0rGAOKRavEnfXnng9QF4moILLztc7LErJmkKJTPK9?=
 =?us-ascii?Q?T4UPHsks9P3ZV0uitPhyJqTq2RWxKbKt7zKIfgY9Lnyz1jtKg7EM55btYXmx?=
 =?us-ascii?Q?oq50KHOhMFwaMcuwvgFj4D0LJ1KJ0MivQ74bIe4aLOkaz7wcc4nbYzgd/Yjq?=
 =?us-ascii?Q?KxnRJ/VYqUotyhsM/0o1bkzxUsvRV/T6vQm2/r6zsXw0yz9cXgzOjdGPI1F9?=
 =?us-ascii?Q?EEY+Z4qggn/XgULuGOVMqOgUd4hJU85je3JxyV0az/WPeh7xOw1eUjtAUTrJ?=
 =?us-ascii?Q?vjrnFRdPHLyohkLOLKJ0CKUza4RGD0gv2fZRsdXSBvj/g86wcyfNaAGQERwp?=
 =?us-ascii?Q?llTdpEWCz/0FgpW3YFgo/2k9fKYY6UtymdR6ZeVMJeU4XO0ZIY3654EKVlJA?=
 =?us-ascii?Q?vaXm9dyf4sXWwOB0OewepOdNUnsXgKHNltqV3tD8wXsEw5Kv+sIdZsW7VRZy?=
 =?us-ascii?Q?VkrGet+gzCGJVkieEv4MzXYPWibIyArF2MknYOKYicVH6Leq/rSDSlTefCVw?=
 =?us-ascii?Q?PVuqClWkL5P9Yp7MkeBhcjEJaf24wN0S3WbRz4TDtL/JESgeC/+2dlwRO4IF?=
 =?us-ascii?Q?lGMGKe2wS/nR1JX5H+jIYKfxoUWDK5vYh8RKUtXB9J6lw0R/AbpfYqz+UoD4?=
 =?us-ascii?Q?IiaViNKIH1Eg6In6L6gkWfWQqGW5jaMCN6+vq9F8VHlHOIEvi/JbQtI1jTxP?=
 =?us-ascii?Q?RKcwRmkcACqsJGInscHtsPRzYtdCr8kcKhWxT0rU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a358606f-ced5-4a45-1910-08dbf1beb0c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 16:09:11.4432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MPLRNWjQM+zFn0s3G5wDotGqT3dfeHooNqEHhqMqUhpmNfIwFbdxFMK7eKTWvaru98l7yT91XfZReKjclUmS8JZdSMIF/vP/JVRqJ6p+O48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5690
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/uapi: Add support for CPU
 caching mode
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Auld, Matthew <matthew.auld@intel.com>
> Sent: Thursday, November 30, 2023 3:14 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Mishra, Pallavi <pallavi.mishra@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>
> Subject: [PATCH] fixup! drm/xe/uapi: Add support for CPU caching mode
>=20
> Add back the padding check. It was removed since we originally used the
> other u16 for the coh_mode, but that was removed and never merged.
>=20
> Testcase: igt@xe_create@create-invalid-mbz
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c inde=
x
> d59501ffc22a..7f012f4c2b2d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1840,7 +1840,7 @@ int xe_gem_create_ioctl(struct drm_device *dev,
> void *data,
>  	u32 handle;
>  	int err;
>=20
> -	if (XE_IOCTL_DBG(xe, args->extensions) ||
> +	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args-
> >pad)
> +||
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>=20
> --
> 2.43.0

