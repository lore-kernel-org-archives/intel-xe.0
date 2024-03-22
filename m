Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C92C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 18:29:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABB71126E3;
	Fri, 22 Mar 2024 18:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OIu0VEwN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3763F1126E2
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 18:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711132189; x=1742668189;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PCPnsJippZzPSF9wldM1ZFxebtwL359N+ygtp0gUrfs=;
 b=OIu0VEwNkub6No+GsjS4ywEcm/pRpYMdZdQULTg9dW9KIakEAaskDnDj
 U74dM9m+nb7PmshlZeGl/Dx7if5Tc3/zScbeYRJqZd4jpOcggYr+jYxOF
 UK46HnySQ0OQ4t+PkpOkJ2HL5z3tRcvY2GXv65njlCGMQY/Cv7GPbrz7F
 l71P0inbilAal8wJ+PiRmUHliULCYNkuto2bDzTYBzEVE+zPru9tWKWeK
 rMsIzjgbCxurfKCY/XuLpgU8JCwRb+3gwuWyvyQB/8yqAalrgx4jVdw0U
 DhU7g0GMdxirseEaSeIIMsRLjBLXQfyx1BYRp10U2ujk43RqYU6eHV80n g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6095883"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6095883"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 11:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19722526"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 11:29:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 11:29:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 11:29:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 11:29:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 11:29:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RS3Uwf0SRnbjZ70kRTxZw+/RjGFQBKOGE19Vw++SwWKhYmiHfwqtaxFcgYQjPJqX5DsjlLYa7yc02womB1U/PWJhIl7mm9rLJOLxjVDF4lgITiCqyA9+5jPxbsFpcIgXTqhGMauBXGgIFCsFkkV8yF15y6VBEuX4LvRuooeVP+KNMCEDL7hdZ70ZugnfaGf5iEeEScFd8wj7AIH21y+8SpL83wIIsQBlJ0Y8Nfk1b00S+zN2Aa25Gr2w7hFRtxwXEuw2hBicaC3EnX4lh2B4t7f6p+q9NaeW6vwxa6ur7pfcEl7Asue4zBIejcIbIDtCM3xPpxQ4dyo6HZbvIqf2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XOeDCTNHnfsQS+QXKzrv61rP/o8H8O3udf0j0XLCtY=;
 b=eWb/YAw5AqfIVgtu7yp3arxwkbXJtmJBPq64+TPBmatMbWALOlrHnZkFUZEqczLpjXVi2DkAo0HCSmiihe0MlP2uc+CtyPCvxaevVtQED8xQmH1z/kJ9iG4Qsvd2138rU3lGmQkYtYatT9RCkl3o1FTSLMzIQqQmc2J0A4b5p1s2fAv3+AGFYqa15cBOVJWnz+/BUS0wnRzNzyDgxBZs6xlQy8GBqftwRCC1qnHG1YQKny4k3VXplhejydU2PbRXe00PDsywRj0a9766GqzlNbgsiYQmpaavFfLivzUXhf15QwXe6yUJny0g2PReYUJe1kn04qHcQSQfpA2V1+nTeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8403.namprd11.prod.outlook.com (2603:10b6:a03:53c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 18:29:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 18:29:45 +0000
Date: Fri, 22 Mar 2024 18:28:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 4/7] drm/xe: Reserve fences where needed
Message-ID: <Zf3N57ePWE4OK0CI@DUT025-TGLU.fm.intel.com>
References: <20240322090213.6091-1-thomas.hellstrom@linux.intel.com>
 <20240322090213.6091-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240322090213.6091-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0254.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: ed9d600e-71e0-41f7-e7f3-08dc4a9e0c9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VrC6m2F980gHq2jGNjVKTf2M4fI3UDONRws/eJD4RHq55LQWKVIs3NvHreO/oBozNFkrJB2Z5maqbZu/XW3ZOxifcbrtuqE2NtkF6uObp1Ti9wWUJ0c2gMVZkWAvx/JqGdWhoGubjwF/J55qh8bD+RhsoYAN8mxBn/1X8kE3DBglHwsbvkbwPFkRSIzdDOYAlgVOUfQS394i7CgTu8isos2CRThbATPhI6wUO3/OC8jWclUgBvMOa26TVMT6fwuQRB5gY9tFMKrxzooI6PFfG3SAekhxv+3WrZhmY5XWms63gTNeKcSdzFIzoBTdFo1P9gR2ko/QjPA3lDf18UCjVCNqQ9+M3WEsVkJess9BqtR6tPEjXK+466AwAchVEQmtLabD0VOn6wr8ltvLeGWpFF/5Ui+AHZ3J2jsB8K8kuiLQu/XZMD5BStMTSrf3xpbxQ07lRd0Go49LE7CA5YPSPE6f/vcbpiF1YmD9+xXcR5WtRym4hPtTlFlvJ2ttalYZMdIwJ5RBiuCJGDU6un1pbHmiofie1m77gG5NHUu9ma8+GAkVnls84Ywa7KZ7qLJgfNlAihOERVxW/l6KwATma7fJaxMAa/JFhFSK4CY9HhSSschWpEtBDtClfH6JH6C+ZGVdO+ZPYVtXnssAqYzCGHUwLwkCSLFb2JoLmSjbmzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sf4muK2fX7TOadQYU5JUZuVvPzGeOH7PHr34fwxUraIArriXZT2LDt0dXg?=
 =?iso-8859-1?Q?V+X10x86wPlxqQo5qjdfHSAA458MrHz0FwJ393JFZSzh99bkeWo1Qf9XUt?=
 =?iso-8859-1?Q?tuEYgcBjKcpfyNs1D9ak2cfpr+xu2/d+CIo5IuYd2kcMSZoWVN9J+iQWaF?=
 =?iso-8859-1?Q?FLzTAKdRsqzkPA6ZEXNGBJCP1wz/84VvCi4d/D5y8uTFm37imuWLVdYJ77?=
 =?iso-8859-1?Q?YwuGyVISahyta6gbQjHmKM1uGCk459HqwxRukSyVoNIrXscGmFbq+S+6NS?=
 =?iso-8859-1?Q?D3W38Vmj4X6Orj2q6rwLcaxrJzXVBSPi4XkkNGUFdHaSQVJFZkr6SruAgF?=
 =?iso-8859-1?Q?EK5FOIWidXYCwWH7HT3ZajLb+UTsZ20jfo8CQQz6ZEzNTR3Ee1w8sD4SCa?=
 =?iso-8859-1?Q?t7BFvWcd2k5N0qoV22ILXMTu7KtNW3Souqvd/XImERgsHs6VPSj/WQxakR?=
 =?iso-8859-1?Q?vl6yoJvhjcksItOAIBlEE7uH/IEFrraiCF5RrQ6UNtsNeomq8W6rKssLXY?=
 =?iso-8859-1?Q?gO1U6vmURbwA4Zu23vH6oWFrnITX3xOHSYun9xvI4Ioo0omE4UG7C5iW5q?=
 =?iso-8859-1?Q?V90aBui3BR+nhcJZhtWXlVboxueH0aMOYlVEe+9jzTUoE02Dsh+0rR3nPs?=
 =?iso-8859-1?Q?DPiL70raSm/7OeS2Q+O0RPCw51K+NMlUfDpmO5S5rylS3HfXyECgeWEQO4?=
 =?iso-8859-1?Q?9ir5VG/xqPtjSIUDnDbNomHUeKQqE7tPmyg4DKCb7ptUiT7h/IEQ3v4ZHa?=
 =?iso-8859-1?Q?pg9RjFjXjpGO4Fx2xgez6OLLHRbXtoXSKbBHCq/u/cLva6r6svL3F7hKXj?=
 =?iso-8859-1?Q?mTQePM9e9bBSbRHfS8mcks23TT5fskEeQqnxMGLgidDeIJadp/fNTgJjVq?=
 =?iso-8859-1?Q?JwJm+EMmw+Q5w7xqP8Fmb7vGcwl9CuaZMeWliNn7pJxQANgxoExKYyaXU1?=
 =?iso-8859-1?Q?JlaH3jQKG8v0+zXzyZHS31cRsfG2Luj7oWLJI+KdU/O2HrUxbyILZ1rkgw?=
 =?iso-8859-1?Q?JnAvknfRpqjL1xQ1O398ikJQZBQFrXop5P+R5RJ2bloPjx2LxJDQnOYQ2R?=
 =?iso-8859-1?Q?RBbAvdN/kk2YPCnKR8plMf83lmqKRO//fcLou5IvpEqVpiubG8h2FBTTP8?=
 =?iso-8859-1?Q?8hC2x8Rqih+EBxzX2baX/0m7kUrcUPI43M3XmjlP0Ug/KAZ4LZ3ww+gszq?=
 =?iso-8859-1?Q?3lh3lEGwlPYvv60eCpMxpR8TxeDGGCoXP0ZhWVUHoJdNqIp3n/do2vwkIH?=
 =?iso-8859-1?Q?C2y3D/bQK7Kkr3OhXcgOzP289Ayq8GoZiPWFJyMbu/zMakn9UIFhYNNmQq?=
 =?iso-8859-1?Q?XwIUZE5uwIFjSgUf8rfygFH7EenO03IOQ9AWnQApocPtwxW9mZwMLvUv8o?=
 =?iso-8859-1?Q?BIjAzNdaZI1aIBd+7s16qOVOhnOeu+qTNMujYUD9y69nj3KKh9LB27gDuM?=
 =?iso-8859-1?Q?0JfI4wkiKssn3Sn+3KdXnq0VYCbIta7s766jFvYiEP/qIjpdASEmwCSMNK?=
 =?iso-8859-1?Q?nTbu5wkNYHayFPQnk0rFnnJsl4LZsl/X47R7ZFFUnBV0JoONDCqjObfoxo?=
 =?iso-8859-1?Q?siq8q885nO6mByZykgf3iA0JQseLxPvx8LgqzOIiWkoQI7Vm/Ww0dgmzCW?=
 =?iso-8859-1?Q?fBUiemeNGQVmdVT+25n3tUdgWWMOwYlF/MdrDneQBJPxTh59efRquTFQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9d600e-71e0-41f7-e7f3-08dc4a9e0c9b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 18:29:45.7644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qdLQIWv5EJfq9wGZf6BNPY5u88SCzN7F0E1H2pNzjo+8HkhFQXQyd//yl+gqGxee1bggFJgvMdeUs8TM/gLqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8403
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

On Fri, Mar 22, 2024 at 10:02:10AM +0100, Thomas Hellström wrote:
> Reserve fence slots where actually needed rather than trying to
> predict how many fence slots will be needed over a complete
> wound-wait transaction.
> 
> Fixes: 29f424eb8702 ("drm/xe/exec: move fence reservation")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c         | 27 +---------------
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |  3 +-
>  drivers/gpu/drm/xe/xe_pt.c           | 14 ++++++++
>  drivers/gpu/drm/xe/xe_vm.c           | 48 +++++++++++++---------------
>  drivers/gpu/drm/xe/xe_vm.h           |  3 +-
>  5 files changed, 40 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 759497d4a102..397a49b731f1 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -96,41 +96,16 @@
>  
>  static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
>  {
> -	struct xe_vm *vm = container_of(vm_exec->vm, struct xe_vm, gpuvm);
>  	struct drm_gem_object *obj;
>  	unsigned long index;
> -	int num_fences;
>  	int ret;
>  
>  	ret = drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
>  	if (ret)
>  		return ret;
>  
> -	/*
> -	 * 1 fence slot for the final submit, and 1 more for every per-tile for
> -	 * GPU bind and 1 extra for CPU bind. Note that there are potentially
> -	 * many vma per object/dma-resv, however the fence slot will just be
> -	 * re-used, since they are largely the same timeline and the seqno
> -	 * should be in order. In the case of CPU bind there is dummy fence used
> -	 * for all CPU binds, so no need to have a per-tile slot for that.
> -	 */
> -	num_fences = 1 + 1 + vm->xe->info.tile_count;
> -
> -	/*
> -	 * We don't know upfront exactly how many fence slots we will need at
> -	 * the start of the exec, since the TTM bo_validate above can consume
> -	 * numerous fence slots. Also due to how the dma_resv_reserve_fences()
> -	 * works it only ensures that at least that many fence slots are
> -	 * available i.e if there are already 10 slots available and we reserve
> -	 * two more, it can just noop without reserving anything.  With this it
> -	 * is quite possible that TTM steals some of the fence slots and then
> -	 * when it comes time to do the vma binding and final exec stage we are
> -	 * lacking enough fence slots, leading to some nasty BUG_ON() when
> -	 * adding the fences. Hence just add our own fences here, after the
> -	 * validate stage.
> -	 */
>  	drm_exec_for_each_locked_object(&vm_exec->exec, index, obj) {
> -		ret = dma_resv_reserve_fences(obj->resv, num_fences);
> +		ret = dma_resv_reserve_fences(obj->resv, 1);

What is 1 slot for? The job? Couldn't this slot be consumed by a rebind?

The proper place this then would be right before:

320          * Point of no return, if we error after this point just set an error on
321          * the job and let the DRM scheduler / backend clean up the job.
322          */
323         xe_sched_job_arm(job);
324         if (!xe_vm_in_lr_mode(vm))
325                 drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, &job->drm.s_fence->finished,
326                                          DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);

But I guess you fix this by moving the rebind in the following patch
before this reserve. I had to type this out to reach this conclusion so
my only concern is this is not all that clear this reserve belongs the
job. Can you add comment indicating that reserve belongs to the job and
also nothing else should use dma-resv slots between this function's
return and the fence being installed in the above snippet? 

If want to reorder or squash these two patches together go ahead as
technically we have a bug in this patch, I leave it up to you.

Otherwise a good cleanup as is a bit convolued to reserve slots for
something that may or may not happen in completely another part of the
code.

With an updated comment / reorder or squash if needed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 241c294270d9..fa9e9853c53b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -100,10 +100,9 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>  {
>  	struct xe_bo *bo = xe_vma_bo(vma);
>  	struct xe_vm *vm = xe_vma_vm(vma);
> -	unsigned int num_shared = 2; /* slots for bind + move */
>  	int err;
>  
> -	err = xe_vm_prepare_vma(exec, vma, num_shared);
> +	err = xe_vm_lock_vma(exec, vma);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d1b999dbc906..580fe869b414 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1235,6 +1235,13 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>  	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries);
>  	if (err)
>  		goto err;
> +
> +	err = dma_resv_reserve_fences(xe_vm_resv(vm), 1);
> +	if (!err && !xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> +		err = dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv, 1);
> +	if (err)
> +		goto err;
> +
>  	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
>  
>  	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
> @@ -1577,6 +1584,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>  	struct dma_fence *fence = NULL;
>  	struct invalidation_fence *ifence;
>  	struct xe_range_fence *rfence;
> +	int err;
>  
>  	LLIST_HEAD(deferred);
>  
> @@ -1594,6 +1602,12 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>  	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
>  				   num_entries);
>  
> +	err = dma_resv_reserve_fences(xe_vm_resv(vm), 1);
> +	if (!err && !xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> +		err = dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv, 1);
> +	if (err)
> +		return ERR_PTR(err);
> +
>  	ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
>  	if (!ifence)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 4cf49437bcd8..6aefd6602310 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -485,14 +485,11 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
>  static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>  				 bool *done)
>  {
> +	struct drm_gem_object *obj;
> +	unsigned long index;
>  	int err;
>  
> -	/*
> -	 * 1 fence for each preempt fence plus a fence for each tile from a
> -	 * possible rebind
> -	 */
> -	err = drm_gpuvm_prepare_vm(&vm->gpuvm, exec, vm->preempt.num_exec_queues +
> -				   vm->xe->info.tile_count);
> +	err = drm_gpuvm_prepare_vm(&vm->gpuvm, exec, 0);
>  	if (err)
>  		return err;
>  
> @@ -507,7 +504,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>  		return 0;
>  	}
>  
> -	err = drm_gpuvm_prepare_objects(&vm->gpuvm, exec, vm->preempt.num_exec_queues);
> +	err = drm_gpuvm_prepare_objects(&vm->gpuvm, exec, 0);
>  	if (err)
>  		return err;
>  
> @@ -515,7 +512,17 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>  	if (err)
>  		return err;
>  
> -	return drm_gpuvm_validate(&vm->gpuvm, exec);
> +	err = drm_gpuvm_validate(&vm->gpuvm, exec);
> +	if (err)
> +		return err;
> +
> +	drm_exec_for_each_locked_object(exec, index, obj) {
> +		err = dma_resv_reserve_fences(obj->resv, vm->preempt.num_exec_queues);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
>  }
>  
>  static void preempt_rebind_work_func(struct work_struct *w)
> @@ -1000,35 +1007,26 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  }
>  
>  /**
> - * xe_vm_prepare_vma() - drm_exec utility to lock a vma
> + * xe_vm_lock_vma() - drm_exec utility to lock a vma
>   * @exec: The drm_exec object we're currently locking for.
>   * @vma: The vma for witch we want to lock the vm resv and any attached
>   * object's resv.
> - * @num_shared: The number of dma-fence slots to pre-allocate in the
> - * objects' reservation objects.
>   *
>   * Return: 0 on success, negative error code on error. In particular
>   * may return -EDEADLK on WW transaction contention and -EINTR if
>   * an interruptible wait is terminated by a signal.
>   */
> -int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
> -		      unsigned int num_shared)
> +int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma)
>  {
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  	struct xe_bo *bo = xe_vma_bo(vma);
>  	int err;
>  
>  	XE_WARN_ON(!vm);
> -	if (num_shared)
> -		err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), num_shared);
> -	else
> -		err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
> -	if (!err && bo && !bo->vm) {
> -		if (num_shared)
> -			err = drm_exec_prepare_obj(exec, &bo->ttm.base, num_shared);
> -		else
> -			err = drm_exec_lock_obj(exec, &bo->ttm.base);
> -	}
> +
> +	err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
> +	if (!err && bo && !bo->vm)
> +		err = drm_exec_lock_obj(exec, &bo->ttm.base);
>  
>  	return err;
>  }
> @@ -1040,7 +1038,7 @@ static void xe_vma_destroy_unlocked(struct xe_vma *vma)
>  
>  	drm_exec_init(&exec, 0, 0);
>  	drm_exec_until_all_locked(&exec) {
> -		err = xe_vm_prepare_vma(&exec, vma, 0);
> +		err = xe_vm_lock_vma(&exec, vma);
>  		drm_exec_retry_on_contention(&exec);
>  		if (XE_WARN_ON(err))
>  			break;
> @@ -2506,7 +2504,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> -	err = xe_vm_prepare_vma(exec, vma, 1);
> +	err = xe_vm_lock_vma(exec, vma);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 4853354336f2..20009d8b4702 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -242,8 +242,7 @@ bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
>  
>  int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
>  
> -int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
> -		      unsigned int num_shared);
> +int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
>  
>  /**
>   * xe_vm_resv() - Return's the vm's reservation object
> -- 
> 2.44.0
> 
