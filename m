Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1BDC3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 22:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F185F10E18D;
	Wed, 28 May 2025 22:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DuEQUptr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41BF10E18D
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 22:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748473076; x=1780009076;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g8Yd82Phfsb+6ae2vsw25Qa8Ta9+ArNapxf3ZJGz9jY=;
 b=DuEQUptr5xuStJ84jzAni0Z058usNuoEdnGofHVGsTCyQvOC0EUSwG0+
 6B4PjV+20xJfuJnuNRTlJBDFlDGDshgbBMHMr3YSVxn9G3SCbZU6CJ3B8
 XmKbY9mPURXhSxfUZu87jgDU7yCyEPjBsNsIrVUeZ/DWiqpweLMKWSWdX
 Lh+M5ht+vjBo90gdomsolX7HclvZIHXNmHNSiHfzAFh0y6GaCGEvec3iM
 v+/JLpUGAnCKqhnGzqZ2UjR2it4lWABFE+ORSunXCYdV1QBx37rOqS/vW
 iqhsZM5LG3SbomtpJKepjuTn9LT2UaMGrqUOvRZKxIKNx0Yh+hwLch/TR Q==;
X-CSE-ConnectionGUID: Rl6RLOxTRlSlRya6KhevXA==
X-CSE-MsgGUID: kTUJ6uCeRNOuFkNSdQkKDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="53144620"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="53144620"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 15:57:53 -0700
X-CSE-ConnectionGUID: AJdcvHj2QT2oBKyICiKDHg==
X-CSE-MsgGUID: jqHE1zA3TeKqoyl8IhAstw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143356383"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 15:57:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 15:57:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 15:57:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.88) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 15:57:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFSsAF41RFZ+Jb2Wwm9C8mwnO1pmLQcwCnb/X3426tALiR7r2g1sA3spOYrS5NlNZwsqUoGxCQrbR2pYrA91JN/Ti2wzrH86TFaWg1SLDhOQsyuWFfeDcPdUn7LveH98WEt4DT9YjDwq/QnZkoOnvHfDjTZe/SzTgR7501QyCGCsPp+pkRPNWe4grZAEBtFlUt7aBIne0NBRM+gm4tUjDoiNYtqN4u5+CfIWqEuYdm5xszPa8eveZtTOmmikmdIwjeb2dkfp5DUSoXhcNN9OKzx2+RrRy8rmba5sIntWyT3QBaWIZ/ae3Y5yCUB7v9GlnN4NEweNEKqGRJ54MXKF5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4PMk6rP1fKcXkG72YxIZw4AuZ+aH7Hwz3YGkByU81Q=;
 b=bNLfefs4C3QF+cSoQk3KJca6+n4nwrAnQr08UycwyoqzTfFYN3KE23QJKu/FHmc1s6Dlv9SXFG5t7/SHUQTt+mI5vJzAscijkSBsbZVOIecYxKiBP8gX5aJ7UX389ddgtF6ukqW1IZ4fsdaEtKdMYCsH5Pix5Ufe8UtHevQeenhVjyl1zuDE+ILDykQcZ3ss6AQaZtM0Wgi+WYgPVkUpDyLYyTv97tvTIKii7YPTjxGgM+1Aw8B2d80fKSuYUWQfg6QrbYtEKN92cPudfJIX1Wg4sA/XggRpdS0EFRtYmdWpX9BUgM4WZd/3zm2Ob4yHEzEvORuWeGSodM22CWdYWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4715.namprd11.prod.outlook.com (2603:10b6:303:57::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 22:57:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 22:57:20 +0000
Date: Wed, 28 May 2025 15:58:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 05/19] drm/xe/vma: Modify new_vma to accept struct
 xe_vma_mem_attr as parameter
Message-ID: <aDeVI66CwVQmIM9j@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-6-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-6-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY5PR17CA0029.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::42) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4715:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fbea3a1-7334-4fdc-4ae2-08dd9e3b0094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i9jonfKWjNtaPjvmpsbW7Fe6JT/bylp0hwZVjKrYAN7LBOgvaKQlH2nWt9v6?=
 =?us-ascii?Q?sWeRcYAVytlQIZiTDXCgRyqCBedB2dyhoNp4I5hWsuKt/QmY3Z6uEdh2u1Wk?=
 =?us-ascii?Q?LZoq/cIGfIc7hmKCRNBNtaGAtgiTsa9co3Z3H9BitNx2thWF/EcF5E9H1Vru?=
 =?us-ascii?Q?X9iAkVAqLpvEbmX6X1VmuUMemDCKjvuDyIXiwj9vTMoQF9m+8EegDAxLo9he?=
 =?us-ascii?Q?HYo1SoWV8FkdtBnGmnNuIR4NL+4TI5tQIajpWKfBAkvfCubM/bF4eIJrL0Um?=
 =?us-ascii?Q?QjP0QkZ0eOdBGQaHZXnBotTT0cl7LYfU4n3UI7ekaxk8PpIygDC2lLTQRaaV?=
 =?us-ascii?Q?1KiIibC4tr8KkvheH0Oz9LH/dqp2e6p3jFd1BDuoA112id+uDg3fGcQRL8/M?=
 =?us-ascii?Q?OCPg3qB5nQsp5HYZkrytoR1/OO84fq+aMWcY5EPx8p1VcSjgMxGFk6UzBnZ7?=
 =?us-ascii?Q?An34vrIBrAth7KZblkcv5QA0M2Ce7fQxSA5HysXXjA/Vzki4J9hvqFnz8o2S?=
 =?us-ascii?Q?vDPoUB4Is2dTrfjMUaK8jQDidNdw7K3shLIGFyF/oOSqw0QmJPZbD9RdxWOL?=
 =?us-ascii?Q?sDBCZeNW7TYEgvNE+5wjIWvggYPNlRLR89zWju8L1zlly67Y2xp/EjP7kDzt?=
 =?us-ascii?Q?txfCb1tGUS2CsBSAFQsA16gDr9uDqslgf5PqDd//v3LfB8+jPKuhBtEgZTsA?=
 =?us-ascii?Q?6o0CAd6fFjLXgsVWLGivzdRV9U6d1CskCE55vW98kzfQX8HlJq0Z74S4fI07?=
 =?us-ascii?Q?byaBf8zjMLw9XwTtaHAdm/CqS31q5QfGAHbnvIgSGSoz+kE2btBddXlV5nBe?=
 =?us-ascii?Q?YKQukyDwSjPZmtbT7n1TUBC21YpC2bpE57k9Ihk+CQ3q8vwycWn4ilj0J6U3?=
 =?us-ascii?Q?Zydvo1Rx6siP/Q8kBbzeknAztiEqmEopSGiHF3UF1J8IhlX2Hi/X3EAaDP3A?=
 =?us-ascii?Q?r0lk+e8fSvRbW4CiQPtqdaSlOM6la1HmvuBhasaYHSycRjI+T3xYK1BYUSrK?=
 =?us-ascii?Q?uwvjdMloGJseAsdcV7xkpJoI19ebDw2ovIB2DwuwpARI1OaVz5OyPF5PsHMJ?=
 =?us-ascii?Q?pKwj0DBoZhSFrz4+DGyOWagsbO59wEs1traTtqvoevb/Z/5C9F8LMaspI7Z5?=
 =?us-ascii?Q?fdGpUz4Rk+nS6hPPTF/52b1IrvUZ8Yk0HW9pkK+ZNv+yr6oKW5Y03TsRGMUE?=
 =?us-ascii?Q?FEdFaVpYSsqwUW3ObS85vj30YQqm0dDA7nW6xhfYV2IWQXWEh1eHzGxV5iQr?=
 =?us-ascii?Q?jEb8bOe2IRJ19ixMUxMWZLSAZdwTMm04a1Kh6pFKhfPYeLN13NAbW1rzj/BY?=
 =?us-ascii?Q?1rzukbhCvddRv7MlXaJnm9mreg+LC/ku2xWtX1Qe3niy+LsqwnNi2e27tYXN?=
 =?us-ascii?Q?LJhDfWh2GhAW67XBz1udhbdhpLlWLo47AVKgwwVYeU46tuGfMg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ruDYzwNR/DWCauIavgPWdBNHXfVl39jbV/SgP1b7Bf/N6CoAHE4t0akQrklK?=
 =?us-ascii?Q?2m9SZMniu84L7AWxRVl5+pCW2iKmR9sQ8LKwaZEtRFOIUyZyIRPdCOfqAqUS?=
 =?us-ascii?Q?XQGmf/LYZdbJY31mg4zH3snrya1t4/ltQonP0pEKvi3EiniU/rC4DD47bJBD?=
 =?us-ascii?Q?IsmSx/0dJnGukX6Wd2ktNzSIIjeWVYdSZ1h8j92GKpMrVPsTAiYiBYDO88Wt?=
 =?us-ascii?Q?NFtmMQej5JeE2YsvEIoiwqfIRtgEEZV1DYOuhIFPl2LmBfB1UXqtaZbaczAz?=
 =?us-ascii?Q?cU5B8PXQ0xdFEljg9rnHFNCHU1Mk3yxAMCm4qkW9qa0qpRjaGIkbBwOpz0Fe?=
 =?us-ascii?Q?T++YvTkqU61ZfRdvrPeFXICodHmedat1tOHhmWO5d6W14nwg6pA1WsR53nC9?=
 =?us-ascii?Q?kHx4cSzDdw1H4qE7fEV25YFxC+Z/g/KPLl1jF296gtLQR2C+FV+OmuN1bqIw?=
 =?us-ascii?Q?f03wfhFf8w4V/neHzMKbGZLeTZSh3OG5ZQojopCIyb9oWCsHOHxhg3Px8jsj?=
 =?us-ascii?Q?OSyO8p600wBs5Te/SahESUUaMj3EFC1JWP2gShl0E3Q5JYKA6j28gKSq7J3t?=
 =?us-ascii?Q?Hheo6EZy9psg/lQfFsXRYs+QaYjc4/4YzKdNaN2Wckmw/dEsS+UE9p8TPwHI?=
 =?us-ascii?Q?Gz2SJp8idmA0dbRUiBr5ijYOEZkfhmTJ4GBQxN1e0NwWBeR4xgU+YurpMcJh?=
 =?us-ascii?Q?A3HU32vs4oNLjtaAd+lARu/WvwSUHMR0P0ZN7FDeQO5C5Pqfvr5e79xK7gPM?=
 =?us-ascii?Q?+MRbI3tMaC2zKyooFU3s/oeTYUfxj7241sJj/gzDK/PDNvDjZ/tQutNu6CO3?=
 =?us-ascii?Q?AVnvoGK0MT+cF/88sITMb16wvV0dxmKn/4JOKNzZqKRif+umFkG91zi1N31k?=
 =?us-ascii?Q?3s5SNVtAqTTv7iimM2T51HFMThdeY2uI3Xk4tFVBV7c4gW/1hbYVG9y6o/MK?=
 =?us-ascii?Q?ZRPAl9JdY6Wlrnw3aPXwUz82ygVX+JiisoFnY3pc0g2Ti/0Jbe8DoUs68d45?=
 =?us-ascii?Q?CflB2dEPnJMm7+hKLrufdMRDHlrHrqMbqOOB5hDKQZ1pbCNQR3smkITls+nl?=
 =?us-ascii?Q?NcklGOalnYxsBAunmXQmPbRrZS9hH0KZCLq32WaJRD5ICKFMCpEyN8O+AQsG?=
 =?us-ascii?Q?3uPmZ9qTqze0xJNtQKP+TMyXo3LBtHcEmSuYxZE4UP9lRK5M/DfI7GdOXHEf?=
 =?us-ascii?Q?4AgV6BMYSAggeNrRQN4h7GtHdJkhKCozexeC26/fauag10ePvGC/w0Tu69gu?=
 =?us-ascii?Q?O8ltH4x164WVviXG1wZxLbpg7QxG6m/cFznknbt1acJMbPdfFgX6TWceAIXn?=
 =?us-ascii?Q?kPMr8tbRDpQBe7ic88bAR9G9M4/qw/B9YXtH9Wv0IZDQNy7/yEpmndy+ZtVw?=
 =?us-ascii?Q?8u4PRz/Cv5FkMXmU6wcBYcwjN+pAyeB+mDg4ApQgVoJpMF+/QjQx2ZD0t80G?=
 =?us-ascii?Q?nIGoo8SkqgSlC4R6hwbA1gmXtmMdh8muTLiO0ZWWNrSi7/6C+7aUOEbbcIsG?=
 =?us-ascii?Q?ADU+vdSzLX07O9DxCh/nBxNFK+vLWtvIYjBBDBUNwVjl9pn+KX0hwEomSkk7?=
 =?us-ascii?Q?lTRlL1YqD2iu+0F1R5WayQylBgwJS8McSDQ9xFZE4aUC4+zWbkFAeGf2ZG9/?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbea3a1-7334-4fdc-4ae2-08dd9e3b0094
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 22:57:20.8437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbM4uc3wxcHto2fv95XBLuG0IhZ9wvN6IwAYOTC0v8s3qwYJiez1g0B9EfCbJuzX3Io8PuBec/Cd2/gAjAJmnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4715
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

On Tue, May 27, 2025 at 10:09:49PM +0530, Himal Prasad Ghimiray wrote:
> This change simplifies the logic by ensuring that remapped previous or
> next VMAs are created with the same memory attributes as the original VMA.
> By passing struct xe_vma_mem_attr as a parameter, we maintain consistency
> in memory attributes.
> 
> -v2
>  *dst = *src (Matthew Brost)
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a48e1bc8b76a..de6ecff237a6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2436,8 +2436,13 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  
>  ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
>  
> +static void cp_vma_mem_attr(struct xe_vma_mem_attr *dst, struct xe_vma_mem_attr *src)
> +{
> +	*dst = *src;
> +}

I'm not sure if this worth a helper.

> +
>  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> -			      u16 pat_index, unsigned int flags)
> +			      struct xe_vma_mem_attr attr, unsigned int flags)

I'd make attr a pointer.

>  {
>  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
>  	struct drm_exec exec;
> @@ -2466,7 +2471,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  	}
>  	vma = xe_vma_create(vm, bo, op->gem.offset,
>  			    op->va.addr, op->va.addr +
> -			    op->va.range - 1, pat_index, flags);
> +			    op->va.range - 1, attr.pat_index, flags);

I'd pass attr in here and set vma->attr in that function.

>  	if (IS_ERR(vma))
>  		goto err_unlock;
>  
> @@ -2483,6 +2488,8 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  		prep_vma_destroy(vm, vma, false);
>  		xe_vma_destroy_unlocked(vma);
>  		vma = ERR_PTR(err);
> +	} else {
> +		cp_vma_mem_attr(&vma->attr, &attr);
>  	}
>  
>  	return vma;
> @@ -2609,6 +2616,14 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  		switch (op->base.op) {
>  		case DRM_GPUVA_OP_MAP:
>  		{
> +			struct xe_vma_mem_attr default_attr = {
> +				.preferred_loc = {
> +				.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVMEM_FD,

I'd indent .devmem_fd here.

Also should be initialize the migration policy?

> +				},
> +				.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED,
> +				.pat_index = op->map.pat_index

s/op->map.pat_index/op->map.pat_index,/

Is typically the style.

Matt

> +			};
> +
>  			flags |= op->map.read_only ?
>  				VMA_CREATE_FLAG_READ_ONLY : 0;
>  			flags |= op->map.is_null ?
> @@ -2618,7 +2633,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  			flags |= op->map.is_cpu_addr_mirror ?
>  				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
>  
> -			vma = new_vma(vm, &op->base.map, op->map.pat_index,
> +			vma = new_vma(vm, &op->base.map, default_attr,
>  				      flags);
>  			if (IS_ERR(vma))
>  				return PTR_ERR(vma);
> @@ -2666,7 +2681,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  
>  			if (op->base.remap.prev) {
>  				vma = new_vma(vm, op->base.remap.prev,
> -					      old->attr.pat_index, flags);
> +					      old->attr, flags);
>  				if (IS_ERR(vma))
>  					return PTR_ERR(vma);
>  
> @@ -2696,7 +2711,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  
>  			if (op->base.remap.next) {
>  				vma = new_vma(vm, op->base.remap.next,
> -					      old->attr.pat_index, flags);
> +					      old->attr, flags);
>  				if (IS_ERR(vma))
>  					return PTR_ERR(vma);
>  
> -- 
> 2.34.1
> 
