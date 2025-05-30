Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF628C3ABB2
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 04:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D6410E7CF;
	Fri, 30 May 2025 04:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QD+7+ofa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA45110E792
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 04:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748579034; x=1780115034;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6EcA44pRM+ogybwOgn6YW0KO34G05InOTmRwoE2YkGg=;
 b=QD+7+ofaKrW+ozw/BdnQtuxYSYe9hB2KdpnPR3Qmf96OspmTIRrlbAEY
 7FtUc3Wi2x4/6o3CnN4Cq8TvNN04Noq003ltdauJyMHYpz6E0vHabmlR2
 YzaCRCqzh4QHbwX6mnGIXKiBXfv+FQ9qXpZMc+S4wND6CFgql+qM2N8qH
 n2ObtbHFZ5LCiArXJ2SQzVuigkVsBGi6AL+6I/3+arcjjq9UXI2XhJa6i
 O+EIk5korg8Z9+TrquL+i4wpzLaBn7iCwSHoOYqUT9OiTP/zepwf37S+D
 B2+JgBPeJyvV9zZnncjfLjJW97kdUGrURcExLM07UTKzq4JaLCnjp4hkE Q==;
X-CSE-ConnectionGUID: hrzp6f1BTCSBl6SHmwmXdA==
X-CSE-MsgGUID: 2yubYlevRsqs/JZOOvscxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="68216782"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="68216782"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 21:23:48 -0700
X-CSE-ConnectionGUID: 6p2iDTghRE2ZpedJGHlP4A==
X-CSE-MsgGUID: nbpsGpEBR42UAHXasn8FYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="144746151"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 21:23:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 21:23:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 21:23:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.88) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 21:23:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yk7EzeMpyMTydDHRZ3vfD/cFA2JP8iDIKih5ZlA/tAVGjEtuOzh0rh5NB2WfHpby2lk/sF/xYX6QTi/xKgrNVmvtELjFw41gey4E6YAFPaNfGFaAVY8dbsOK2W9hsmkeqvpTjXzmUqB+kp0ozAr1aQaeiKjTQdPn0GnVeZ1N7LEYgxY9qhF4ktZupC7r0KJ7OnJceYQESgx1Of/rVLZkse+UyJohz1oZJTZG5L4cTcd8cwXrzXDOsH87S+H0BPklzkhRUL7QqJfcpOvIDw85w2Fm+RWy3ISZzeyEvKbc7B1BMd3SLVLaJKIIQa9O9xxoZigakAY+9NqD1ApwKOcOCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9K3h8AHB/a5RNigWcOGJfcMy0i9p97x+3Qyy/lPm+0=;
 b=LDv0UN5nC0EOjLfIk4ip9Lc+8komF1B6T46boQfnhCkNzI8IrjGSetWO1U3eWlnnXg6B99adGN4cI61H0OPZIoG1cNfinE195b5JFK7HOtbhY6W8JKHKCd2q4+0oh4efzmyxGltsIAgpssgcCHeGWtKiAeJVfBUjVbrpU7EDBI2AWoGj/8z0Xa3Ol58ffKEiLzDHnL8m+DKQBQE/vj+9MWdgZY/nwHbyaMzZPPlAItN6H2ANwbH07XEYJiatFYtm0NOiYansYa5RbTQigysFq/brQpiKxZdkX87IKgd+Gf+UJBBkZJ2Tj8qwMCb9eT7LimRDaF78BVteYSyZB5L4Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6036.namprd11.prod.outlook.com (2603:10b6:208:377::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 30 May
 2025 04:23:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 04:23:21 +0000
Date: Thu, 29 May 2025 21:24:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 16/19] drm/xe/svm: Consult madvise preferred location
 in prefetch
Message-ID: <aDkzFXMYot1XDEGc@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-17-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-17-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0101.namprd04.prod.outlook.com
 (2603:10b6:303:83::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fca575d-e9d0-4357-cc3d-08dd9f31b641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8Aol1EDs07wIibfN8rQibLo7X3jWbCUxReMko8pt0Aj64LSDh1KaPfJrgTjr?=
 =?us-ascii?Q?lEswDrI29f0tQxGCnR89Muw3QKFyAkkGHFp6fg5K7DR9W1IJdwj7HwHdKgJR?=
 =?us-ascii?Q?bTdQ23iJWWGDZPcoHe32JIHIR/0Dd1vwGI6U7GbwtZojn4EGDDAV9eZ6EVm0?=
 =?us-ascii?Q?GEJDv0wP/XHYfsbCQ6tlFhsEEL8ADL1B5zovbPR9tbIOAfnSuDZQjDOJUll+?=
 =?us-ascii?Q?9/CYSuuekkwmQaaLMxV+acGYxEKzCoAhm/d5CfqkR2DVdQihgnoWoZql+2Hd?=
 =?us-ascii?Q?f4MToq2wA+lmlO8Dm12Jt9hnq0Rp+Lr8tmGWpT2/w+lI80uvo68hlfy1P6+5?=
 =?us-ascii?Q?2uaUzaeivyb1UjTS+WdrC6ZICL/PB2WjfKjK5Vu8WOUZW741EVvCWK1YKdZz?=
 =?us-ascii?Q?2Erxs82vBns8ayUVMpVVq3fDlAcpiOVIioy9s7tZluVF/R/XyIXbFCwWEVXZ?=
 =?us-ascii?Q?BoRpKrbXkv3zCPILOuLPxscxf0i7ljeWfE0DVZcBFH1yL7QqJ0Ij1+UXsYOL?=
 =?us-ascii?Q?uu2zRafSkLQOk1bIpnERbqDG4fA+DmLZ0t7lBOWK//H/RqgDE7BetXjyOFNH?=
 =?us-ascii?Q?HRUdSk34f6/pF4+YIDA/jpfMhBRmQ0eaOrvXTgedPRKu39arWatNVukj/olS?=
 =?us-ascii?Q?qdJb9yk/xR0ItXFBEkpHoV7sjE9z7yr42gPy4pcdVsqm5ZwwJrPzK1WzBwIi?=
 =?us-ascii?Q?Z+YCqcGV4y24RO/j56R095iv29fMr+K6VGXazFFWyqFclRy9f9+IwpiYN6Bq?=
 =?us-ascii?Q?TdD9Vx8GtxRERVIihzs7L8r4tRLnVGiWch9deD1+bFWW0cJFfStAaoA2wQu7?=
 =?us-ascii?Q?bChFYDa/QV5tSv9zBe9x/nsgfRfvOVgNepBb9Z/SD3RviNCPEVTG1pr63CJK?=
 =?us-ascii?Q?H1VYRsBKHSTZssScNip+MToXhVopHcdY+zE34tzc65oH+ELwmvpdqAtKdn4b?=
 =?us-ascii?Q?lQQGBqHfTGN0cfEDytSTaV/hsiTVF1nE7yTI28F2EJhrwNMXjCMaPQyOpt2u?=
 =?us-ascii?Q?3kMqInUy0c0GWm8AzxNiJOvo6VSgKaj2c4/SccPxCJi/y3gsm1qTAUdGl6RT?=
 =?us-ascii?Q?oKH4UUcc1HlxCFNPPUEDYzjFJfh8wSNT+0Kqvf614FJ1vKr6930qr7J+JXz1?=
 =?us-ascii?Q?tN/7b+UrIXhRuo6hXOc9U6CMYyNYKnsINITnusYEqkbWlNzwkUKoJA6F6750?=
 =?us-ascii?Q?T1EkbbZ4H09z+4fILf495KXJ8U+C4BTpe7YI3TMUV0Pb4aJu04D/Iu3V3+8R?=
 =?us-ascii?Q?ELgMMwaaOHJ4Sm0jGvJ0qDS/U6w6qnOG3XBGN1iQdoB2JOU9fMORvoYsrBHR?=
 =?us-ascii?Q?I6wCUBPjthLHNq4T8VQnACeRgqj3MCwJFnscSPB2LlVZKEr5LLUL21PFuy8t?=
 =?us-ascii?Q?HCflqiCawqPXdsIrNfz6KIwOxzRU/U9Fmhj41RYlFXThKL5Te8D00D6KLz/5?=
 =?us-ascii?Q?1WsAr82xTVE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jfga1J/urR56P7ZQyjVmkbOjzsIXOe6zQQFfS9bPxccgncL0GUDJ4f3Bq0qY?=
 =?us-ascii?Q?SzpL9D3Zqj5VBK9a/nT0yhhIJrtiXXcgG82t9z3zrfYEU4ydye3obE5+5e5w?=
 =?us-ascii?Q?SI4Y15c46I0MCMkY/2i6iTbYY6x+dRMw+Jp9YVN86CEw/VEmHWHs9lw/+Y+v?=
 =?us-ascii?Q?WZHnHdGcr2ppRnrsQ1Grcwi1hFtkfcad9IoGB8oZ0mV5Veq4+o4qYG+6jMqp?=
 =?us-ascii?Q?+uQcZJFRYOg6yf9KtK5Nhlv7zMmdGNedMl2b54Y0+qP2aQ3D1RlCkUUt9sW0?=
 =?us-ascii?Q?CHn4FOXtQpb1ddZF2LDTQRMPBo+380ShpmEiKw/5iwNS3MTx8OFJe8p/RPUk?=
 =?us-ascii?Q?Zr8lQRuEUNprOTvUyk7ZIym/wToB9sZse2WzXrGwbqF7OWgl8cP/3FUffOad?=
 =?us-ascii?Q?2i0Xn5XZnTkBK5VwuZPfwyTTLl2iwrEbEVzn43auiQePUtqVzNZJizuenj0p?=
 =?us-ascii?Q?tDBfr5Merim6bv63/ENT7gMxp9fo++GpfcAOWRtMe11DFnOvOKugli+1ZuBU?=
 =?us-ascii?Q?KhF6WDN6I4zvWqbYJzDo8fEIIZxsDJiIerFcnUsdChuc+FCLEdKULQrHWska?=
 =?us-ascii?Q?59nKpG6JuZ2ISEeE1HcmrPTL4EWLsut6ERja5lfx4VZvVnqYx8c8Zt9cLoGm?=
 =?us-ascii?Q?vYeKFlMYxtIeB8VdRYimhw4MH2kIFyXfeconE9In/UMW3XVOWGUKPwnyckfp?=
 =?us-ascii?Q?JTgcbWPhUO0Xni8ca4KsuCNIRPi5N06gl6s1AT8xjJVL03cOGeoL5zxiOqBQ?=
 =?us-ascii?Q?eTFQ6TU910C8G/zGW3iM2pnLH7AtPWap3YL8j1VOjJTlQpgoCGsID5WbAv0Y?=
 =?us-ascii?Q?7lriB7UhdceWvCbZALVrtzKClQXMU34T729Xip/ZXpmrXOGnpKoI2g9t6gOh?=
 =?us-ascii?Q?a4EoesPAXKrTKMp7AyxT9nEoHItGp6d6mQ/KdDrL02ueipjfPBT+6HpXD1iI?=
 =?us-ascii?Q?E3W3Rwu3NLkdFCgY4vF1jze5beaDmNg2lAqjz9RYll9dg0npysY7VbsgyGY2?=
 =?us-ascii?Q?iwCpcHKouoZEGd8QDpHx3FmWCt0CngpX8ciMcLgwU2Uc2JJ49d3haaW3NYEr?=
 =?us-ascii?Q?wDSHg1Yih1jl2TEnIp6YGyH+a/7D3+SmwckfR1pXr+hOqMXeG9ACKO47qtoY?=
 =?us-ascii?Q?oz7eJo7jp2LDhgOvB9dQi9yVJmFAJTNN7s2f0g9Xb9wd2F1VE69IVu+jF5LQ?=
 =?us-ascii?Q?vEmfdKLgAuHV5RGLMy8XOMH7/GoYQ63ZkbjrioYIa+TDPZiEYjLKm804X6/G?=
 =?us-ascii?Q?exKX/GE6rN7uJK224LbAZi1ZWeOSgQm//BRt7mB8DngAQlzKzGy8nhrW+ruz?=
 =?us-ascii?Q?7Hd7uG1Ap3/GxBnFu+ctKfhP60y45CzP8hwy4XOfDOZmJgy7XbpK97HSgc95?=
 =?us-ascii?Q?y82+agMpGF//Wt/8YrxA9NUwlmou2IZ2pe5xQoiSZ+j8iHoaMvxiD/W1Sqjw?=
 =?us-ascii?Q?EvhcbDGytH3vBoKtuNhyIpys2I3Z5EpPINpsLI3MI8F2fJoAjiEYSU8KzYOd?=
 =?us-ascii?Q?ox2Wf0sRNF9AEARMWKq386W0LjsJjmPhUQnLFvQIY/CcC56jHU84DnODOgAn?=
 =?us-ascii?Q?LX9HzzdzUU2wMRaap7AqRPENNO9vF1qc10QanLVg8enwLczXWZLbnC/7Oigf?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fca575d-e9d0-4357-cc3d-08dd9f31b641
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 04:23:21.8999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKQzVAbKzfmOrDcoazn+dpDS1AlTf8rLbHsB2LAn/NLAbgycfADgDZvjAk4tCZ/XaBnweWWdCGwuFhEXLGKZog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6036
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

On Tue, May 27, 2025 at 10:10:00PM +0530, Himal Prasad Ghimiray wrote:
> When prefetch region is DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, prefetch svm
> ranges to preferred location provided by madvise.
> 
> v2 (Matthew Brost)
> - Fix region, devmem_fd usages
> - consult madvise is applicable for other vma's too.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
>  drivers/gpu/drm/xe/xe_vm.c  | 30 ++++++++++++++++++++----------
>  3 files changed, 38 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 8b6546ebac72..0c929eb192e7 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -822,6 +822,17 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>  	return NULL;
>  }
>  
> +/**
> + * xe_tile_from_dpagemap - Find xe_tile from drm_pagemap
> + * @dpagemap: pointer to struct drm_pagemap
> + *
> + * Return: Pointer to xe_tile
> + */
> +struct xe_tile *xe_tile_from_dpagemap(struct drm_pagemap *dpagemap)
> +{
> +	return container_of(dpagemap, struct xe_tile, mem.vram.dpagemap);
> +}
> +

This looks to be in the wrong file. xe_tile.h would be my choice as
static inline.

>  /**
>   * xe_svm_handle_pagefault() - SVM handle page fault
>   * @vm: The VM.
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 344349313001..a8b5bebf7a54 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -97,6 +97,8 @@ void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end);
>  
>  struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile);
>  
> +struct xe_tile *xe_tile_from_dpagemap(struct drm_pagemap *dpagemap);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -328,6 +330,11 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>  	return NULL;
>  }
>  
> +static inline
> +struct xe_tile *xe_tile_from_dpagemap(struct drm_pagemap *dpagemap)
> +{
> +	return NULL;
> +}
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e5fc2c2be8b2..4520e475399e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2917,15 +2917,24 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  	int err = 0;
>  
>  	struct xe_svm_range *svm_range;
> +	struct drm_pagemap *dpagemap;
>  	struct drm_gpusvm_ctx ctx = {};
> -	struct xe_tile *tile;
> +	struct xe_tile *tile = NULL;
>  	unsigned long i;
>  	u32 region;
>  
>  	if (!xe_vma_is_cpu_addr_mirror(vma))
>  		return 0;
>  
> -	region = op->prefetch_range.region;
> +	if (op->prefetch_range.region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
> +		dpagemap = xe_vma_resolve_pagemap(vma, tile);
> +		if (dpagemap)
> +			tile = xe_tile_from_dpagemap(dpagemap);
> +	} else {
> +		region = op->prefetch_range.region;
> +		if (region)
> +			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> +	}
>  
>  	ctx.read_only = xe_vma_read_only(vma);
>  	ctx.devmem_possible = devmem_possible;
> @@ -2935,18 +2944,18 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  
>  	/* TODO: Threading the migration */
>  	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> -		bool needs_vram = xe_svm_range_needs_migrate_to_vram(svm_range, vma, region);
> +		bool needs_vram = xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!tile);
>  
>  		if (!needs_vram) {
>  			xe_svm_range_migrate_to_smem(vm, svm_range);
>  		} else if (needs_vram) {

else {

Matt

> -			/* If  migration is mandated by atomic attributes
> -			 * in vma and prefetch region is smem force prefetch
> +			/* If migration is mandated by atomic attributes
> +			 * in vma, and prefetch region is smem, force prefetch
>  			 * in vram of root tile.
>  			 */
> -			region = region ? region : 1;
> +			if (!tile)
> +				tile = xe_device_get_root_tile(vm->xe);
>  
> -			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
>  			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
>  			if (err) {
>  				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> @@ -3014,7 +3023,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  		else
>  			region = op->prefetch.region;
>  
> -		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
> +		xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
> +			  region <= ARRAY_SIZE(region_to_mem_type));
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.prefetch.va),
> @@ -3432,8 +3442,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, prefetch_region &&
>  				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
> -		    XE_IOCTL_DBG(xe, !(BIT(prefetch_region) &
> -				       xe->info.mem_region_mask)) ||
> +		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> +				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
>  		    XE_IOCTL_DBG(xe, obj &&
>  				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
>  			err = -EINVAL;
> -- 
> 2.34.1
> 
