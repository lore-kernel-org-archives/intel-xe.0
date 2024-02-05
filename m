Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2ACC4828D
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 23:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C671126AE;
	Mon,  5 Feb 2024 23:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wp8CZaXg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120311126AE
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 23:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707175401; x=1738711401;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XkaSvnVtPpjKf+hgpB4KzRIJy8tb6aKK7Ev79uD/Y6o=;
 b=Wp8CZaXgpF+lqbw4gMF6CQrjiKowEhFgQYaJcLNzHibNBi44i3hgd0G6
 iuPydDoSFg0IVOc7jI+temF3DScWku5afYytmtOSyTH8xRAjaUedD2o+G
 lEnfHCZKOxBwD5Z1y4fxIb1LbwLoZgfWkoBkNRvEEdJAKORDiCAH+hyRD
 nw76okIX0jzTbKWrCvTW80NFDW32xeIpPGiL6TGnGIxZac2l6PxZV36GS
 PoHjh7KAbVA/C7ZdIdkRH5n+HPIPdC6mQsxxBldzYoQ/jfLnn0v3FMapM
 BfyHvlt5Ts7Se/X7O9OV43Ixk+Swbe8EDJ/zbtME7GdHZiscwB570x023 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11995256"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="11995256"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 15:23:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="5457368"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2024 15:23:20 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 15:23:19 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 15:23:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 15:23:18 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 15:23:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYBipe88yQAJwPQ6iBYP2m8FOBcRIV31IKO6vS9kk2Hxubzcfmz+an39/MDcko0/EK/nTTStzehrkqxxRL4JO4vppVK6TRyH/k4fD4BXeiY/hZk66DpRwBejlmeWNsBQCJ150PUTkD1SSCd/dDz5uV9sFgiEbMJAOLX5fXeqwpP772fhxuDfm57rtJo4PvSA+bof+QQUskkQY/RNw5aeBmaEwe97svGKfTuuMorb1N4ug7GmuNoU5mLvw8RX+DWY1kmhm1AxoEoGqL09l94Rcw3dHFNfrjSwvpH6pchwfEOHPh0d2FxO5BV3AJIk5W41nu4ubX6Kf3eqBu/6dDDjfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orv0Cs00uPxwCOYCM7Z0/ZyGpS9BRNgDyAZtZSX4cZ4=;
 b=GTDkItTBElhZFOFbS3qcrGMyQmUVU0Xqn+yq4c2SQF9uUqZOei6jFqpH+3ngPq2rACRmDdXicYf36qRaejULR6XIuBep+62OXpyvHOulRgdckeoJFJlvVZoZMFTvT80glz1/31ZoSD5nYeaNGpVh+TwM+ycixvRS1Z2qeJgxIRNYDh8IAyt3qp+Qz5UVsA0tK9u1xAyfMjq6Y5GTm5uBHtoL3euT7nmN+XrNK2qRWlm9NsgSS5DfZHcQ2tucGF44A/DSgmeqei0UE+Lx9s37ohf+Iq+szfhNdm1g+KtZWo0jJ3TNhLPLBEulYU8Bh9PWjzJX4WVQZ1STm5cGwRRblg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7258.namprd11.prod.outlook.com (2603:10b6:208:43d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Mon, 5 Feb
 2024 23:23:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 23:23:16 +0000
Date: Mon, 5 Feb 2024 18:23:14 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Assume large page size if VMA not yet bound
Message-ID: <ZcFt4oK10BuObd1r@intel.com>
References: <20240205231714.2956225-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240205231714.2956225-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f995863-c761-47e6-735e-08dc26a16e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gs3T8besKJui0tfxoNyT6stZ1CCPQkPOe8ozXuMmk6xwoJmAZE7V+3JGki4g3BzVwwDrnZpQUw0iEWG9hKYcMLCeOegkQjQVXUYUmrH49p5jdA09pgQOWERLJsw4y5azGEyNEntOpGGmEOoDCiV4XwuiCacApjlH2tRPdqQIeHBnLfCJ880Fmf6gDLMhogjuEbfQTdQJ26qjzRW+mhOUSrLWmeFH4RlQw6Ev2kfDxRrxDU+FdnORsZTkLdZnzaV46shKBkk1rrZWESJUuJ5z927eNt8qkKd/3GtzlAL/t4fMSfl/1vozwdFjMoKA2Fnyrd7WfQkIj7Xwrg1O9Y6STCL6eCrXW4IZhLALIRL3G/JcyeLnZLBvO/RsPY6HYbcSiRAElm9K5NXdLsRgENEK20KC5A0fP1r4T+qnaharP9z8+jbnNqo9+oYmm2u4weF1V5z2GE0YWzrdVS5vafbxu54wanQu9ONh2HKaNcdtr9Hh6ktNOx5fIIANN0OVQkq9H9ZYVButCsWvvZ8B1mWECx/p0n2aRyEl2ajSPyG9YBUMZ58jUl2nrlr+/Okjzis3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(41300700001)(2616005)(26005)(86362001)(6486002)(5660300002)(478600001)(2906002)(6636002)(37006003)(66476007)(44832011)(66556008)(66946007)(8936002)(4326008)(8676002)(6862004)(6512007)(36756003)(6506007)(316002)(82960400001)(38100700002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Ww7sEIvn2KP3i0lENh45t2uRFIpEgo/5kHQhfswFa9d1IMnNZL4wC2X3Teo?=
 =?us-ascii?Q?PKCsdkR+PbWZk1zcbx3SMP9v4HH21wQ6IbQffb6WH5xlWVYs7VQXH6DbYZOH?=
 =?us-ascii?Q?a9Y9aFV8spVX8fYt/XxiG5y+ImmYd1eaufNAqG0YcKyEm4V8yv18skD4RYOh?=
 =?us-ascii?Q?o3t0kCgmw3MVzzs3Um9QD3zeLgzqv/1ugZW/soBtiJiXdfc3IupZEci/awG5?=
 =?us-ascii?Q?/ckGWyGl+hDYptwpigPucDNpaSP9hfpIUx39lpKIhbhQkiVzY87/wTNnCE04?=
 =?us-ascii?Q?63EoYppPA5VTe0KmpWdpK+DSRR/9iNR7fDiPefWC2TfJpcXLUNBl7ArddIl0?=
 =?us-ascii?Q?vQEJ9pc/+iAs+veeXSk9ga29OirN8Shf4jtKzIv8K0zgBPy0bVAX8pd1SYxG?=
 =?us-ascii?Q?V5gtOjN5ZIWOLhzkd+8bxp3NMDG4moyEUbEVXAZbn7oyQg/BhZCv9CdUXNZu?=
 =?us-ascii?Q?rIg94ZYw8AWI69e4b7Q1xTiUfgdzR4Cfu60RP3fg9CiB6wHVNe10ByoBK8Zy?=
 =?us-ascii?Q?XO0f9iTNuZJNoDFR03EhpROxy8y5c1ulJ9Gq28C9ixHk9eUVY1xYCZotKy4g?=
 =?us-ascii?Q?6AKnOkyq00qVMe1gHMlnSzTV9haltw3BwH9RZHpis2EOFkzKrfZrJjdx+LqK?=
 =?us-ascii?Q?KiSz4cwJguDHuumnXJT9eEsCn+y2uPDUfvsih+ngGNhhfoWBJRa8gosi5pSy?=
 =?us-ascii?Q?mlJ6Zj6i8hGvdPPE768mro6BcA2BGE7V0W+ASi5cx8Ym4zwowWFVuwUiMr+B?=
 =?us-ascii?Q?myS0vwl3jE79zadOOqiKWgmDLZ0QBCQ3QkfQ/6QWn7bpzVK1IDJnW9YjvO8l?=
 =?us-ascii?Q?SpBmo/vx6FFVArjIVscymIHbiO0HBqcU9ToC3DfWjACidiimCKhBZWJtfNKr?=
 =?us-ascii?Q?orpvkm04/CBDjxHrO9yaTyC4ULSTLQIFM8lunUjur+CQNbM9rBBguf3CiohS?=
 =?us-ascii?Q?KTIqMHvdlnmF6H0aCrFb3rBgk7urItEA9Fr2H+sYolTOe/99xPhnylpuB9pp?=
 =?us-ascii?Q?Vo4JAzD9qyMbJTcQY7HVnm2lcMLQU0m/Pimv3pHdCzI9Amqj9nQwabSzmK4U?=
 =?us-ascii?Q?PZBlxFuDkvF7LZ0iiYI7OX5SySrVH0Ne0YsixA4qe80OqzV9X1fFVP2yckCH?=
 =?us-ascii?Q?m4oPgVNHOxfL57vWQtMAielDj5Cs9tD8lTqpiZLpBvAYi1SBHdmzmjMsMx/9?=
 =?us-ascii?Q?tHcOkzge3zclyWh4BA2xb0TpHWv0E6CGiTReamLWTq0bfhFV2xqGw0AIqPp3?=
 =?us-ascii?Q?6TNs2y0qq+Al0UmkXRmo67DpANo2wzunwWtJMpgm81+xIEVu5I1Yb0z2+fwB?=
 =?us-ascii?Q?Hv32F/nlcRxH/WiANivzacvxCZYXaZh016TAcfhL1T6sY50jILiDBlnNgOwa?=
 =?us-ascii?Q?IC3axJr4nibQG816Je3O/UXrLT611iG7gzYPnaoiOLHVe70uRGzPDWKsSods?=
 =?us-ascii?Q?lHtqycv6i5pc3/0g4KPdtIUhUr4MKmqhmxVvZaiRYOPHejYOXBZbS0dNEEcd?=
 =?us-ascii?Q?PWgG+TlrqHZf38E0nVoYWK5bE/1/4MyXqy9gEzvgokb59KjNzEKZGCV8Zwto?=
 =?us-ascii?Q?MowSWRhUDT3j2qTmaQyb8O33KgiSWGRoW578IgPkTkG5fa2lZ1akYyQdwgho?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f995863-c761-47e6-735e-08dc26a16e86
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 23:23:16.8149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmr8H8ISKl5E2ZaUUKLJSQNc5Mz6pH1GqHZgc1rn3/PqsDUBr7k7a0GxYYOlrQqHVNbvOh8Yeg62T6LubwI8iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7258
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

On Mon, Feb 05, 2024 at 03:17:14PM -0800, Matthew Brost wrote:
> The calculation to determine max page size of a VMA during a REMAP
> operations assumes the VMA has been bound. This assumption is not true
> if the VMA is from an eariler operation in an array of binds. If a VMA
> has not been bound use the maximum page size which will ensure the
> previous / next REMAP operations are not incorrectly skipped.
> 
> Fixes: 8f33b4f054fc ("drm/xe: Avoid doing rebinds")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7e29b816c4d4..ed594fa2f8da 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2200,8 +2200,10 @@ static u64 xe_vma_max_pte_size(struct xe_vma *vma)
>  		return SZ_1G;
>  	else if (vma->gpuva.flags & XE_VMA_PTE_2M)
>  		return SZ_2M;
> +	else if (vma->gpuva.flags & XE_VMA_PTE_4K)
> +		return SZ_4K;

I wonder if we should also have something like:
else if (vma->gpuva.flags & XE_VMA_PTE_1G)
     return SZ_1G;

drm_err("Something wrong with gpuva flags, using max known page anyway\n");
return SZ_1G;

but up to you...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  
> -	return SZ_4K;
> +	return SZ_1G;	/* Uninitialized, used max size */
>  }
>  
>  static u64 xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
> -- 
> 2.34.1
> 
