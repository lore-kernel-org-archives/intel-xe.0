Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FD5C54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 17:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A71210E061;
	Tue, 27 May 2025 17:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkJTPD/M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0665410E0EF
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 17:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748366551; x=1779902551;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V5sCfQtmScAHW1fQwU9Yq3PVigWjLbDbTNJVZN99BPE=;
 b=fkJTPD/MpeCIcAh5wS73zy8ss0Q1TOu75LPjk1/5IZ56ikTQB0uG6Ssb
 yLMc/Ds3ldqN97LJxYVBu+KG0eVuNYQn7PYS8W1ng73Fp23HEZc5Tfh6z
 PpoNqf2Zx0kffXCDkHZU7xice8O7N7HTMJMFprbFjmONb8vOVAllxH7+c
 x122OZFgU4VAFWReeQVGuIjcfNwrqTEB47f22PVPFSWSvcnTv9pcfVZMv
 wmVPAVX2DPg4lfB8hlYmTNUPwE1w6H68jhFceQH1cFoVyTCTTx9eKCfA4
 5x3rgs5QTpe5PVDBubNw4rPZfjWqkFEWAB6fhiQNf5W1Ij/HKBfRT3DrI A==;
X-CSE-ConnectionGUID: 74kYnZXpRpOj49fUzdG6VA==
X-CSE-MsgGUID: vntQcQYPSa+49O/j2UiHmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50477152"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="50477152"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 10:22:20 -0700
X-CSE-ConnectionGUID: OrDTwz2BTg+rKyFJ0WEdcg==
X-CSE-MsgGUID: 8kAsYZCrRdqmM2IWFFICZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="143523411"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 10:22:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 10:22:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 10:22:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.54)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 10:22:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRkWnVtf6PkHHJXJvWkwJ6RgQctfHAWhNPB3OPcKXgbsj8K1cmU43alhowUQDa1pAv8alNyMUuBhh1M2ih2DsSr2OK6j/4yeJ6tzb/+SA8TjCBN0UtAlw0AYvFzPa7hLvzt/705qNEOxXVpGRX8owDI217Ny9/LiTsCnxsgmo80rzD5J/EnE8pVlfRI79rmix+ePp/FBSx7TDaz4jL4hiVjkYrR5YgitXCPnELMxLmqo0eW5SVkyfq1UT9BAgkt2GMiCfJXyl4wj0gSCRWVBrQhxDXnJjeq7cW/GbwdWh86cCH5MgClYQVL4660FhUaNEzh2k2TpSJNbD7f+vWdZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=610z3yV647EoLLmiX6aFhyr9DBHtVX6dcl1CHD+GOzM=;
 b=wtN3kNxtaQ9qGNzXBDCG+a7bip4LA+CBj0R/2JNJRWcxOg/+zECkSI3snyD5gZ/Y7iEB/sFsZYz6MueZ+0hay5tCuCeWtpdAS5ePMOUsXH8vbb6M1eP/5g34SYzTpCdFod5GvsMmt5zg2cSFk5YjTXiNy4GB0aLtIxysXMeTfFYDBFbS4qjASxS7D6J65aFkN5+kePSI53RBtGx1+LvXa04bQeyvzQetanxUKceF+O4sm0PjaYPqcQ3CVdtwKPJTZXvpFuOlzvWvipGw6j+YWxt5MgxQqk+SRmhMX5q4DB0c84SXvTV1eM2mC9abIcqfg0Pu7nzCDB2Gk3NYeSK+tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6540.namprd11.prod.outlook.com (2603:10b6:208:3a0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 17:21:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Tue, 27 May 2025
 17:21:35 +0000
Date: Tue, 27 May 2025 10:23:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe/svm: For atomic operations, continue with
 page fault handling
Message-ID: <aDX0+qlQ50wxHHqv@lstrano-desk.jf.intel.com>
References: <20250527163340.1067968-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527163340.1067968-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:a03:331::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba9ae2b-03e0-4206-e7cf-08dd9d42eec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y9uJaGY+Ht0fmd2KD44besOBUkuybIe604n0OeZX/emHSTtJwkovT7rDGrHp?=
 =?us-ascii?Q?5CiWCjDooyVqbNIIB0Qpf84+OeFMskdvhyvedCHS0ccMv6pZPs7H5aSwWllV?=
 =?us-ascii?Q?6SZrSkt9o4pcia/PQdDzfNEWLWtrykIhe3UBttxusQKmKKvRcH/ypiUdEFQa?=
 =?us-ascii?Q?5HdU+3KcdRsbTWsj9654RPb+a325m3m3fLwl0MLkm3+SaUC+FAS6FBOlYX1i?=
 =?us-ascii?Q?LLLQntgzD12C0WZoRhR5RIDu+laSULZFp+a3VoqUHYXVku24PFT9w1CYy41x?=
 =?us-ascii?Q?glt/cYjgsYswEuyzs5j7rwS+PQoHmPi3cOY/pz64siVPbZ8nrDvrYV4N14QF?=
 =?us-ascii?Q?i1W215cxSy4T0zfmxP4vXdN1Xxgi1RqkERTHqPlB6DmB6Vedhq9CWV5rPnDQ?=
 =?us-ascii?Q?l8xz/xtZ8SDuySzOcQzN7eyxBVQQYTaVl+uWzCMd5o7TsdBKxjY0ooczINP6?=
 =?us-ascii?Q?fpOL5e26EdVpz3oUMkBqOJKcmQHsh/evbJYIDcgW1t42589xdbaSO2DAleik?=
 =?us-ascii?Q?ejmFcACMoetFbAG+l2OFjxYhBo0SjmVAEOKfVkL1cF0HqFsV+oys6EHPj5pw?=
 =?us-ascii?Q?ScqaZAbMy5zscrsk3/SW81fqezReCn1dF6TKC+3CEsQT8wjYQMfkl+0CRObM?=
 =?us-ascii?Q?T2YOaytExQL+LGubgy6tnCFcSoPFYLaVG7SjHE3mTuSoJefC5SsuPi7NYU1l?=
 =?us-ascii?Q?CIUEVNJjWlgdK+qKtcnmiBuRUsMrzD4mdfFZaBXuOa+h1i/HYiiRLXMyhlHm?=
 =?us-ascii?Q?WlZgMMT23VR0ZY377ioT6N3OUqW0p9t4Yu537fAuK1zKvbmjnv93khzo1WUR?=
 =?us-ascii?Q?D2yKB4scGHTXyQ4LuFGZUxNCdgCgydA5ui/q6QGQXrcHjvRbCMrQQBbRx2d+?=
 =?us-ascii?Q?jzTUkfs7BeJnEPlqXEN+bE2Nl65oGf6QieP67RDdLDrQLESsuaHAYn1NrbBi?=
 =?us-ascii?Q?oy9ubJYnGxP8QV38UHxteurXbq+YYWriCgyVthv1chV3OvnNKKDmDhAXaflB?=
 =?us-ascii?Q?h+wc0JvPx1rgRtDFU/nHfdaTkXJUffazVmRLW5SBeklhG8bcUfCca11oQ3bi?=
 =?us-ascii?Q?YrAeTsaiwp5ZLJVivPxHvDqY8+vx3UVHYQ0GwkSio0pZYDBHbXeM7QNGNY/c?=
 =?us-ascii?Q?aXcetSIbrhAGueN3JY4+zLc7cELfT2wR5XV9VKXfNvY5J9i4GaFgo91nn06x?=
 =?us-ascii?Q?QDAQ6KuW6sV/BodOA8sptPhtpDSIve1utqjlCWfR+HPtdyNx0Apl4swAi7JN?=
 =?us-ascii?Q?yKqcr0cZjZ5KzB3VQXnWJtQb4G74aNIZgRCpQBNYSrXcX7/2GyVPn4sdjv7K?=
 =?us-ascii?Q?yGiSMdsJpvE5wacbmQsjjI4ard8tIYJgl01FcDo552Awmmde32Q2YRI8zOap?=
 =?us-ascii?Q?7IG28B9u20gs743m0/K/MXCWtHPcVU/Kfc6jG/EPZ6zoRUsOJtb+thwyVL4t?=
 =?us-ascii?Q?HDF1tpo2atM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i+FHPZIOyYWUw98FYj9m34V0f+P4BsgEl8dzZsHgOQOM+C3phDfirOonklte?=
 =?us-ascii?Q?/9AGdzyNM5/UcOC/YEzm0JrgQ/kSy5g7RfJqmRHz6ETlTDHlwPY2a8bdzzIl?=
 =?us-ascii?Q?ENBjayxk6Qo0OVAfgCNZW/UNhIAxOBYTU3R/Clp3NXOZU5+tIA7WbXuAzUGg?=
 =?us-ascii?Q?a72TRlxZsFr3UyhnbxKQG8L4ksIst6KZfvBstFT07CXeiEZ9dJ9LTFdwLd6A?=
 =?us-ascii?Q?wvANW9NOIjfi1dAlKw9joWBQR0jvCz3irr6F5LGdMWvKLQdijWraxWEzTNuf?=
 =?us-ascii?Q?CF4RAUja4cjVmqn/Kf0KOgbu6XIOsXq9eWEtw+nToMmi6p4aW3LTBzlhRXBH?=
 =?us-ascii?Q?8aYYYmAvVOVnzeoVTPi+cEUL1mlKl/4Fe4+Rh5cCY0r4ewD5M8HrVE5Zips8?=
 =?us-ascii?Q?N2nxbMTbLNNBfoTyPei0oVwxTPfl/PqEdUvVgtLZFr2lx/gTX+bOyvHXzOm6?=
 =?us-ascii?Q?Kwsa8a3D1UtBpuHEDVE6n5FJ1plPFxY/7STS+O6KO1Um7pCWeqUjG11GCxA8?=
 =?us-ascii?Q?L23UWJrHRu4VfBLQIFLgDG6fkjylJ2bI2MvI6JAsmn1NnihEqxpNRdWnMeoJ?=
 =?us-ascii?Q?Y3ve+fYP9BbLS4fyUs3nSQbuXVdCITTZv+ychh3BqxqB0dQC30O0B6IrtvnI?=
 =?us-ascii?Q?4FW29v1OBCLDp+2gN8lLNmDXq184E2eKXucZIrR7dqKDt2SmQx3fuNWsr+2d?=
 =?us-ascii?Q?FiaQ2eSuCcj+3XOVE+yOM3VnTtb9Jl0j7AWoKO1D4t+NJZ6PEGlUd7LIM/uq?=
 =?us-ascii?Q?8FmQQwvJ0oDHBDvlxbBzb1Th8lRkPZ62PHDkn7QbQ1dPVx1Kw/+h3FmkGjAI?=
 =?us-ascii?Q?omLrZoCA61U8eiMoam4pKzBthoe/pzAlqLrYYz+1ePngMSHNcdPjWvQqUwdn?=
 =?us-ascii?Q?9b0USCP/T9S/vhOeGEOGv08SDC8p2/VlBr8g22hYdmWLDS91QzxML7WJkHUb?=
 =?us-ascii?Q?HjJgoRncoq3blo4MbXKX/CgotE1hoXLPvd4KT6fG4O8JK16+ztjQqCyYJnFJ?=
 =?us-ascii?Q?LpteUdh/N6dqwcmIovFFB6Uex8x4OyTuFqeLiB9qXl0QRyIYfuEAq7/dafV5?=
 =?us-ascii?Q?8XJkRkGVCoWP6WpPpZWoQiBgwzPptnrvGNUmei+mORSbCiJRXF7SeZgsKiQJ?=
 =?us-ascii?Q?IpnQrHIqVtzx+rH/x/q0nTekJ+jRrSRgk5DeuT8lhwcK0fegr8Bl90K6Z9ZA?=
 =?us-ascii?Q?b+OHzRz9kSXc4oVjc4tjCN6qAUVQLC1V+KaCkcFQN4mqPUEbJMrgD4G2jYFJ?=
 =?us-ascii?Q?IrtEr+Ln2DzIbnABoT+uQH59Kg7e5od58OGyKDNQPq+ff/O+/JlHgN3queeq?=
 =?us-ascii?Q?rzXGi0fX/bXQ82y/2iIVkLgfJAtMTI5f4t3gwc7SiVGIJ9rT4oq+RJfoX8jq?=
 =?us-ascii?Q?kt5hhubjrCHVPaUgAceYexBFWvnM/gG8GEGunqQEyF6Jvsr8Z6U1GR9envQ2?=
 =?us-ascii?Q?ww3O7vTIMNecq+syNJTWz7bDTLnJ82hRnruppay/s+rBtzPwR5a3Mvk3hX8T?=
 =?us-ascii?Q?VTblM3xiUhrF/D+NBXPghoXgw/Yh1rdC7rrIBvjivbovEo+amsoBP9/T02Yg?=
 =?us-ascii?Q?AKrx2PxHbRAgny4jc//DrWuAr5KudBG0QvcC936fS825NpIH9TnrPkL1S+qn?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba9ae2b-03e0-4206-e7cf-08dd9d42eec0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 17:21:35.7809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6acLOSUlU4U9dsGi+A4UCjE3jdnlvbVU3WuZWdsje381aXBrUDm9DYM1tZyABlOoJ3D42ZJFXcMcZ75ib803A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6540
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

On Tue, May 27, 2025 at 10:03:40PM +0530, Himal Prasad Ghimiray wrote:
> Ranges might already be valid but lack AE flags in the PTE. Therefore,

Can you explain how we can get into a situation where the range is valid
but we haven't set the AE bit in the PTEs? 

Looking at xe_pt.c, xe_atomic_for_vram in particular, we unconditionaly
set the AE bit for all VRAM allocations. If we get an atomic fault, we
ensure the range is in VRAM in the xe_svm_range_is_valid check so I
think the AE bit would always be set here.

Matt

> continue with rebind of ranges for atomic operations.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 4432685936ed..d42d5df28115 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -884,7 +884,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	if (ctx.devmem_only && !range->base.flags.migrate_devmem)
>  		return -EACCES;
>  
> -	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
> +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only) && !atomic)
>  		return 0;
>  
>  	range_debug(range, "PAGE FAULT");
> -- 
> 2.34.1
> 
