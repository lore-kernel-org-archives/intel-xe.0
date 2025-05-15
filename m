Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B7AC3ABD8
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 00:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796AB10E75F;
	Thu, 15 May 2025 00:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8zjE7NS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D83E10E75F
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 00:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747267627; x=1778803627;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QqebGaj4tcYjMG1saojMcwqL3YNeMMAVPbdmbQxnBTU=;
 b=G8zjE7NSPoHDD24cRfcrLUQVvwcvhb48oVmmzjXKW+V3Cmk3YkZIyd15
 j5EgEhOUb4RXawN925qZIJVM/e4+R/dr4qhYwnR5obG1qY0OT6jS+DHf1
 jOYoliCL5fCxUCw52GUtNjMkXelM+XJmQUcVqD7qIdvYPetDlIuXPQvSs
 fOPxuM95k53yvSEhaslUX8l5T8I+Tzz/5FUH6bk0FADO78f/+J6yaeADd
 WjoondIZnILcZam2atLv1e/FC517yblR4uDu/rRlFkadg8/KW2pJF+d5a
 1Eg/3G0ADmyJv/rVTqzAAiTWV6QkhhO06vZUEGPcvhLmYyTCIiIzGaKE5 g==;
X-CSE-ConnectionGUID: HCq7KA9QTHeLFiNUwj/aAg==
X-CSE-MsgGUID: MpYWhXLLTT24l5wdU/YPMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60522686"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="60522686"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 17:07:07 -0700
X-CSE-ConnectionGUID: KjjBmnAWS8S7ybm1RyObNg==
X-CSE-MsgGUID: N4ZPUsbtSYeZcll9DxZunQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138719572"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 17:07:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 17:07:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 17:07:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 17:07:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPfVb+0UAUg42whRsQQElopJ7fBr9sEacLgUapKWsm18Dwu4mAbohLrGmfTH90H56nOnS8H9R4/fHe9Zbqz5xpxxYiTjsN8yRhNVb2IesC2a8ibshOZf1cAKZhCSF1vZsO0XKPs2ONhVzVABz6OQnRX3CoHojIiz8LroSrH9ENqeWGwgoYH1WRSMz7MgWkCm0CAD7vbcQ5KfIa2hB+MamdmonNkjZcXcodBQlmOIxEHEfdttjTgKxZ+a+1fWofyn0ukVWdpp0OvJjLMe+IOD0RFJZcglNJv6hJYFGgMOZCInufKkYXCjHF3H7GGFpoRSAtepXFk0lhKFdCRwrdEN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfAbCEs2T18rTHVfNczBQgpaIn+yxrHrxD4vC6+k/iA=;
 b=jsv08RTjsfQFpZQzXSUGLQ7DfYH6wZ3j3E5mFxqT8yccIgsypXgMCnt2WYfNBl6UiR/U93FxGlLqHs/r6Y2cIMlCNnXQdpSpNVrr5p9kFCLyrb6cTjXc2mz2TueApYaCo3coAqY7/6Hg6f2B+EiK3k92khPM+Lhe/rpc2JZmSgSbA5GOVU4EJ+zeaM6SSpsLJ2U2gvg0bGJ9IOzW1JedPT8r2cmJJKaLIXbRS323HFddWyZ0KDkl4LDSkWLYDHNM1KLXEZjTplC0voQUmwvuV6ezRIDc3ELjvwWIBQVIJGd5bsCza4xUY0uyjebZ7iwq3X7nGVxZnZT2+EkugdchNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB7495.namprd11.prod.outlook.com (2603:10b6:510:289::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 00:07:01 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 00:07:01 +0000
Date: Wed, 14 May 2025 17:08:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/vm: move xe_svm_init() earlier
Message-ID: <aCUwfHsm5ssOV0KB@lstrano-desk.jf.intel.com>
References: <20250514152424.149591-3-matthew.auld@intel.com>
 <20250514152424.149591-4-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250514152424.149591-4-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0380.namprd04.prod.outlook.com
 (2603:10b6:303:81::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c76787-ec31-4e58-403c-08dd93446a93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ntxssoDrZhS1qpjCOrBTpPyVk2p+ptOT649ts/TAHPAPnqq0/EtP3tPwVkuv?=
 =?us-ascii?Q?9NJD1UOExlgscBgsDTrlwVw2Ljgy6ewW71kLXgd6bXDiofyCxFJ67KsTqAK5?=
 =?us-ascii?Q?YR8qK9rzUgbDFx0QlM+mUp5EApFl7hs3297/1OyVyDtb8x8XxlmGo/luybq0?=
 =?us-ascii?Q?CwMVbS+iBSnKACzEUOW84ont9O3BBBC2G+DdHDD25hCdq6ZcOSAZnm/pwFCP?=
 =?us-ascii?Q?PDM/eFGc6HTCgqVfZavT49VFcAI38QXub4mdDQ7gggS7+6JJO/ZCMwW/goSP?=
 =?us-ascii?Q?gBkAXF9Z7gqd4fOOYlA8PZOLNOJvmHC4BLMFtt/ZKxUi0MGmrQxhjhe2l+yD?=
 =?us-ascii?Q?GEzXZ/0HQdqlV0P0tLMr0OfagzflVRHo26d2QwAEDIeg7nPrCFZzuPvs6pUC?=
 =?us-ascii?Q?kipe4i3t1/OX+NZMtvfAzslazzDWF6N5xFw7dwkYXB2UmPpwLv4sCq9Fo9YK?=
 =?us-ascii?Q?3sxK7A0HOvJWlFb6KXtZAq3byCQj85IrwblKyYmZpdIqldnFwJfvAULxD49d?=
 =?us-ascii?Q?2ZPb4+WqpBpFRiGV/JSVuXgzPQh5jbDwrdX3QwnvnkDTJETnn8GOAboXKcXS?=
 =?us-ascii?Q?giiqZmK+ZsSFub8ghcw2WzKAnvBOiubp76ftIv52wIrJh0lXe77yE2HiCtlJ?=
 =?us-ascii?Q?Pktu+zvupdfLTeEYRm/xaHQcDNCZpQ9vD6N8vDwDwskqxz5/ESjf7ib6uugc?=
 =?us-ascii?Q?6KZnGFETlZ6i8VAbptJhAgAffgUydHJR8LtN7R+0E3+9feggPgqaAQCuCfkP?=
 =?us-ascii?Q?LqefQKClomAFyRbdOYiARc2VauKvkCGk8jPoHXwyBYe6wTX8dKo+HePDAwgH?=
 =?us-ascii?Q?cSPZ60afvQb1MXXs1AcsD0eDyGtov7TCT6xcyO1cV/8TMc+2ncXtD75V9Wdp?=
 =?us-ascii?Q?TF0aUWrTIys5ilpPQIvTzSERdVlUvYfiTFxzIdG9wQhu736FtLnKadWABjCK?=
 =?us-ascii?Q?CdT1K5RoDrRt1Wd4kr6Yj2/DqgWiB2ikhDJ9X8Nd0RmLA/Bz62/yUvVrBMOf?=
 =?us-ascii?Q?9bry1koGNxSMtggvbiUKxtVHOBr1mKBN0X2LkPHYDBQE4RvQlFoKqwaCd3zr?=
 =?us-ascii?Q?hmu/xEEo4dLWKBXYCfvk2Zti0+ZAhjmfykQTS5F67h1kEDIftDzly7AwVWN/?=
 =?us-ascii?Q?FGr5bxAeZtmtazDt5bvioRlvBqGg3BdIEN1IojuhpALtYUgOf8gLyo4a8ks5?=
 =?us-ascii?Q?R/NXzpKvg2iq/xsabvWrUTvJmAVJjfUNKCDhswRPglB1wJ772AhrF7xTxYyO?=
 =?us-ascii?Q?lsZp90OPeRk1aFZKZGdPBQ/BaUsqJDos5dgT0Vr2aW3Unc8ELK2kJOxigwFH?=
 =?us-ascii?Q?VD/Sv+F1fnTCKoRFUg+TskatPD5fUIF/dOoDmMA0lfUw3Ls77Gau+VRiGP7O?=
 =?us-ascii?Q?0wwpmnw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ROgl9fDGAbL7hvZz27fE37Jw0HOtfJ7hu7U+j4S/ShYGG64uDZ1u0ziIhTdN?=
 =?us-ascii?Q?CNyA7ppXxNFqI1REr4WDMFG36rEpZqv38Nb1YuC16wXtPlN4TyEIYURKT6Ig?=
 =?us-ascii?Q?COmD/FCOM75shYQpXq+y/gJZkhR0XGlUV0UHBDTnzqCmPX8Zr7BMv6Fm3AMD?=
 =?us-ascii?Q?M8w8iSU56Nb+hSel0oAEoPp1i2kwI9DaEp3drQnUXmKHhVnFvaRJY2+hFFs+?=
 =?us-ascii?Q?dp9CFd5dsgSfgOAzMkGerkfSm5LMrQCuBh5yr/2YfTp++8hDpTqAbBU82zCp?=
 =?us-ascii?Q?JMUVkugayr1QBCcw/Kg+ACDxfd0iviHb3WYbDesLBUAiwIZy3gsl2qjlrA0X?=
 =?us-ascii?Q?RBYRo7P1+edebLC403FM0sj7QSW2S6EikY52sB/9+0WMD8nmVEHUsy0Wdg92?=
 =?us-ascii?Q?RMiW1Vimm68bv1qplH7tg/hLbXhNdhUNcu5RUIFGIOrSXWGB7RLkGbYNaiNu?=
 =?us-ascii?Q?aHVolCaTObOClKc1nc6d+Q3cH1nBU6xyVQr4eBXWFNnIJtWf+hh1VD0Ttnp4?=
 =?us-ascii?Q?UZjiaIR+GyoJzDEIDjmpYwIG5DFS0+keQ7A/6T0NZ37Ain+CDhKt8453Mn/5?=
 =?us-ascii?Q?K5v4a+VnE0OGZsq/PFM5VGE3pRwuBTjPj3dzn1h/6XU2liYVK7GMWm3gMG9v?=
 =?us-ascii?Q?IJBkgrb9hR5ghaZLH38N/Y5laF5JB59zvY9hX7qxE1AyibFAYYrbGaYDgSFI?=
 =?us-ascii?Q?z4BmOSt/Dy9n4DG98ZG0jUZlY6+ZoRvrAM3S/oOkBlpDd+d4BMFs+ZlpNIsU?=
 =?us-ascii?Q?Lt5qQSSLuT8hxl5pqfqJwpxUXSqrgW3SWnq45emumjHuu++4tNUOh1jtYkyT?=
 =?us-ascii?Q?+hsGaF889wTYtGtFTgCzvkeOyJIBag4m/lPyUFBCtqf/gsw+DXy0u4Jie2ho?=
 =?us-ascii?Q?kFHxPYCOjTPENdwUMAv0slVmrKo/NR840pmuqdtlwBfjIY57hnI2iAdQP0aq?=
 =?us-ascii?Q?rsLWOMBnLErLjFBQoG2cWPS8PoLTdWH4bya71Y/4jzIdmPqufulH1R5urzNz?=
 =?us-ascii?Q?PsUm1vGNMMPXtomkiIJUq+jXQQ/OSJajiM7ld1eBSIf71NJ9o0RPRJTtbc5F?=
 =?us-ascii?Q?xv+Fk/l6Uy9gvznP9SC/Vgb4GJTMjJ1sAW9FfqwcpX8caG27ujlgspo8s2Nt?=
 =?us-ascii?Q?VN00poDSwocQEMJJC4kDf4nLe8+OApJJqQSGXWq3Z2q6R5It/orazJVMCuby?=
 =?us-ascii?Q?drFi4FjYlz6HhtAg0GNpPZAieYs4HPyJ3l+4aqhqUj9BmU2v4xZHPdnXGOso?=
 =?us-ascii?Q?Uof5kTdqrnflh7eW7vZtSuFiDQygUyDMbyd1EffvT4mxDVjI0EWmaraUF9G/?=
 =?us-ascii?Q?UfHhHnOosYQoyID6uyKfSwf1DRGVK3auzUZEYOGYB9emEiLjNdnByt7CdUfg?=
 =?us-ascii?Q?i5IkOTQTHvW8d/KymVlfWBOeeZ0ljHqqa0OR40648UtwYjyoRNE3k+JM2753?=
 =?us-ascii?Q?ivTrkiQPKI6hFFLEjdkFdmBEpH1saSAIhLT3ZOCqRu9gknDtBY+FKwbKAu7P?=
 =?us-ascii?Q?ROaPp2BIUFPUHK6rh1oDJSIZOBnAwcZCuggPFWdZOa5j+jjZTiTHEDKrSs5U?=
 =?us-ascii?Q?+qsNpUSJkCM62+6LOCj8hZwONSWnsNewHMP05UZoKo9RBequgfI8uZSITqpV?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c76787-ec31-4e58-403c-08dd93446a93
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 00:07:01.3765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/8G2ZK5CxbuqRzHVF06wImPa+VJBpghub/HostGl2LWEAjt1vu/bevw3IWAeE+fpA4LtY9EUoLKv/kWpqamlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7495
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

On Wed, May 14, 2025 at 04:24:26PM +0100, Matthew Auld wrote:
> In xe_vm_close_and_put() we need to be able to call xe_svm_fini(),
> however during vm creation we can call this on the error path, before
> having actually initialised the svm state, leading to various splats
> followed by a fatal NPD.
> 
> Fixes: 6fd979c2f331 ("drm/xe: Add SVM init / close / fini to faulting VMs")
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4967
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 168756fb140b..7140d8856bad 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1709,10 +1709,16 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  		xe_pm_runtime_get_noresume(xe);
>  	}
>  
> +	if (flags & XE_VM_FLAG_FAULT_MODE) {
> +		err = xe_svm_init(vm);
> +		if (err)
> +			goto err_no_resv;
> +	}
> +
>  	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
>  	if (!vm_resv_obj) {
>  		err = -ENOMEM;
> -		goto err_no_resv;
> +		goto err_svm_fini;
>  	}
>  
>  	drm_gpuvm_init(&vm->gpuvm, "Xe VM", DRM_GPUVM_RESV_PROTECTED, &xe->drm,
> @@ -1783,12 +1789,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  		}
>  	}
>  
> -	if (flags & XE_VM_FLAG_FAULT_MODE) {
> -		err = xe_svm_init(vm);
> -		if (err)
> -			goto err_close;
> -	}
> -
>  	if (number_tiles > 1)
>  		vm->composite_fence_ctx = dma_fence_context_alloc(1);
>  
> @@ -1802,6 +1802,11 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	xe_vm_close_and_put(vm);
>  	return ERR_PTR(err);
>  
> +err_svm_fini:
> +	if (flags & XE_VM_FLAG_FAULT_MODE) {
> +		vm->size = 0; /* close the vm */
> +		xe_svm_fini(vm);
> +	}
>  err_no_resv:
>  	mutex_destroy(&vm->snap_mutex);
>  	for_each_tile(tile, xe, id)
> -- 
> 2.49.0
> 
