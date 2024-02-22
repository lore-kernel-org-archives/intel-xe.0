Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CF6C5478C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 21:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E120C10EA7C;
	Thu, 22 Feb 2024 21:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ubr/xDSW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6646A10EA7C
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 21:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708638191; x=1740174191;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LO50Yx3kLI/x0EcP8KIOKoBmea6ig08h1unr/ciaYgw=;
 b=Ubr/xDSWBRxWG1SetESA5swa+7co8/ez/kQpci71J5j3oT5Nh/uIdl+/
 hQf52W64i8+KD7YRCm06hXTuJMSqdaWoK3QwgB4kxXJPPBYwcBkC8AYqZ
 tttct03wa8dea4OSk9ZzlVooR41M+X/xTFGzwGB361W26JnwqwTPy4g8c
 5pM4EF1QmuC4xzlZaVUC3l0AqQheiW8CdESMkaATZn0Rls5SvqIkdUR7k
 nDekLB+yEap/pMmxSMmZBKeExPVuKHQjRKT0TJmjmFruI6n4cm/AZq81A
 a4pttiRzmA5BerI+WVqcrNT8ZYgWWOPPqNqIwj1ZLcSzYLzEXvve3I7uQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2765147"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2765147"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 13:43:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5570566"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 13:43:05 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 13:43:04 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 13:43:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 13:43:04 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 13:43:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXeHPvhD2cJlxq5fIORaOKBSVjwFqxCypHmk8l4pD+OPIjc1COvUtM/qr6qz/8hjIXPehXpXq1IAOlwNgWCp2oQyr18psd8QAalOZ2FL1XT4Zj5fo5vyrYsH36F/GOYB2zyh6ZzPC42xjekam6TCIxib9lJ+xWyL9ZkZv5QoV4GARZVDElxstkzkCrzgsSWt6LxhrRArT+iT3mY2nrdh8jv9+i38zUsHQDMgvVKO78XzJkkYZkF8xxn5Suq3lRlKcj0rx1EkPc9QG64FfuMF7/jCG2YP6dCQJ/r94foJ3d+/3dF4Jl0jDila4fDJjkVFkbnN8Xem1wk+RnODKJokKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3LKs+JkaoeIsY544StjTfj99TwYygVn8/rFJCHENS0=;
 b=glUoqdG7dvmNRFYm8LPYwRz5rZ3GOluxweVaowtrwCQJEys84IiJQ/5bk6fZn5cfLEryKpkd2BhRzXyYsSoJY3Pr7oBd+WEwO8Xnt6eoeSJJfbI+3lP3NJT/OaPoiqi/ICT9xeX2lKwpkYcz2Eaq6HxXW3kOIF6qnGI7mCZ7iDxf3kKR/2Sfwv/3vfz4YdB/LNEUtEilizhQ6aYyuhAKV52WXUatHNw8nVh37Xzx+NGalosxH+SJaFnMBrvxooa+MMKN89Wr8yexihrHXrul0XNvSRyHeWoG7W/krkrBERNDH2W9MLmnWFaf41k0f3pSgQw+qYjqOKJhlQ155z6JzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5580.namprd11.prod.outlook.com (2603:10b6:510:e5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 21:43:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 21:43:01 +0000
Date: Thu, 22 Feb 2024 16:42:57 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe: Don't issue TLB invalidations for VMAs if
 using execlists
Message-ID: <Zde_4ZO9L4Q8jDRB@intel.com>
References: <20240222035906.3835257-1-matthew.brost@intel.com>
 <20240222035906.3835257-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240222035906.3835257-3-matthew.brost@intel.com>
X-ClientProxiedBy: BY5PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:180::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5580:EE_
X-MS-Office365-Filtering-Correlation-Id: 700a2110-c5ae-4140-f74b-08dc33ef3e4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7XvWsUkhy/9RVAEEzVU05UhB/LlBkPjABKG3QllD+kP9w7fmoMZhCsSQNC2UVuyGTXkFoFjrWNXVA7lIEmKyAxQgxUXcLzYINBaJq0yRQ4mpsK6Gf6ZK4zCV6UMtOQcqWvhRtR6ixftKf8b91ULH0hE6DptbCWQLsnZGHgQwTZXQOkY6ztukrRNY7758VuAHgutnO0+zBzCcaCSqJKapg4WdjT5RlVaA1adZosk/KWvkZHSpA4djVg/TMA12ATqqqm+Z9dyD+yDBvIl+i9F5iOkzXPZndniRCzOhMnb0QaroNzZ1LeHZJxzbQqj429LCVkdeihts8HRelh2B3Z62aPOMEhKjaX4IyARDFtCXxFFCPFGpHf1Ll0k0CUYuL4+7fjNcStokls4StzC8eIHsbU/lsd57pwkFU5Wj6z04h8ByPGlDItBkAj+s8hCkRf0ygFQcR2Nr+v4U0u04BHcXvzAur2b6JfKNXMUQ8ZipIkAFpf+GvOM6nQu7sYvelbl3cSQyGSTEeUfqrcTvUKrCRojA8+0OQvNE93kjJ2Ofc5M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aDd6Vkw7pqgtBL5v7vlKES+ELJwJLYl79vXXIQGnBbpj7NFQlv3HhTNTsMg3?=
 =?us-ascii?Q?zbXIPM6gcksPSN8txtik2GruQruyN15gVqpOOMxs/sgBPj3yfmYLJxxyVGBq?=
 =?us-ascii?Q?/4aLs3HsBEOHUinlpIMuR2xLNv0SP2ZeJSbOqk8XmdJy32iGy/7w/mTc1zeA?=
 =?us-ascii?Q?LFZ9annejlgpF7XF001W1TQ4rFJYfZQFhQ6gwjKticWiX97tTB953PiEFi7G?=
 =?us-ascii?Q?mERerVuZYQkCtSwwipqRxq0Z6m/2BDQpqXcg6cL/1Ziw1EBXwXvlxmyayTzb?=
 =?us-ascii?Q?rByJhX+y0QjJkUKPzHyhVnS4baK2QeFgYbrhRQ4ikP7iAmxcJ35LC1UucOsk?=
 =?us-ascii?Q?MCUTrTFlSJvzc1fl/Hq8x6rAUmP0liDfjwcWWDXLyAS0zO7uCWCzjNlNYJF4?=
 =?us-ascii?Q?tV3x693FD3NQMr5pIxRbP+7sHq1D5xlBWwZAn9L0Mz4pRcfqaMYjTiOqPBUw?=
 =?us-ascii?Q?+MO1ZZJNKwDeiMo8aGEqIAnlPEcs1bPQvKWl7pbg2hJD9CVgpL1Mo5yF4a0q?=
 =?us-ascii?Q?FLQgzjPSaU+/KbZf0e4zoUh+7fQkx/o9MT0gPwUlf0XlfUvimzLQaUKVCy+X?=
 =?us-ascii?Q?yEGXLUYImWRMGbCoIjfDXp3QgEeRJmIU+sMo4ZxakpD9heT9vY3C7z7muumh?=
 =?us-ascii?Q?IAppf+IQRj2vDQ7jTBzsU/QmegAK8WjgNdOKRvSN+XqC4fLSPsx5Shtt4QqU?=
 =?us-ascii?Q?STqjR6PzjGbPWjng/R52P+6MByrRLcKXR68FE9wejDttXEZnMqvTFS7xYtcv?=
 =?us-ascii?Q?MTOMsxR4Xne9mR9JZhs5kpMrEq/W8B9D8sK0R6st6u8nHwOarrmHhWE59l7/?=
 =?us-ascii?Q?9W6nSu7KF3YY27OxdFuDlkM9nv9kH/xYUlxDTe500ztXy7qKSVgPLfTo7Fj6?=
 =?us-ascii?Q?Q0d3ebKimKmi6xJT+vrNuH+scweDBm1D0Bn4687paKjoDVgTIfe+Wv+90xXq?=
 =?us-ascii?Q?JIhd4RQdus6f5hkdvb26NmBkeBk73hmA0PQk/Ghhgf2t6Vm+KkTbRY2y0oPG?=
 =?us-ascii?Q?7Kssip/Rab1yrryutPGwV5vfAeOptl3J9CBvu1DWfgFCXWxi0C1qFom2Z5XB?=
 =?us-ascii?Q?51mUPiHNIQObZkZAYHmOPYX2zwUeDCVXdtjGR8h5PzCfLS48HcsGxFlf57SU?=
 =?us-ascii?Q?dKEKlmvCFCM2ay3Lo1Q8LbKNMzoodQUdA7fQ8YVMoG5Td3/OQb8WC0TWFUFO?=
 =?us-ascii?Q?eR6LM1nwWq7RXToP2BzbLpSV/pN7/gCqRPhvv9bKjid5ZSw0WcjNHNNus90x?=
 =?us-ascii?Q?ZemBQwXECMa4LdFeNBI1IfEEHCCpbzuU02hyC1FxrDM9m1kBQWDiXWPGBPnw?=
 =?us-ascii?Q?Cxb/VA4Z7URGRwQjTsiIssc4nx6fNY3wJQMk9I6N2eihQ6bhV9YQJvzVmuFo?=
 =?us-ascii?Q?bzGASjBo55snADetofzf9qf3ECPxQt2ME1mocPwuDJ3dAlX22du72QxdvEqZ?=
 =?us-ascii?Q?2oYfSjAkOXEF35DyGzr/63GamHhhaFaswfukccguFjaKHleyJZ+m4biSb+yy?=
 =?us-ascii?Q?KwAT/scb0ZMQyqtY4spIVTydTE2om8G07J+3+RW179h/zSzuIpveUEOcpHjo?=
 =?us-ascii?Q?ku3mfc1YCok8PlA8Icgnt1zsR5AQZZ15BmdDEUBNE5s6nRZTy/LKoKVK99AO?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 700a2110-c5ae-4140-f74b-08dc33ef3e4b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 21:43:01.7076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtbjRL2ChT8doM+h12p44HgwTE8W77IPcCVt0uIlQRVpx3H22Asy/qeO30p1Ilc/5QRnaLKUvczTEa0ZG/V47g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5580
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

On Wed, Feb 21, 2024 at 07:59:06PM -0800, Matthew Brost wrote:
> TLB invalidations for VMAs are currently only implemented with the GuC
> enabled. Do not issue TLB invalidations if using execlists. A longer
> term fix would be up the TLB invalidation layer to be execlist aware.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 7f54bc3e389d..c4de13bcfe85 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1256,9 +1256,11 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>  	 */
>  	if ((rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb) ||
>  	    (!rebind && xe_vm_has_scratch(vm) && xe_vm_in_preempt_fence_mode(vm))) {
> -		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> -		if (!ifence)
> -			return ERR_PTR(-ENOMEM);
> +		if (!vm->xe->info.force_execlist) {
> +			ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> +			if (!ifence)
> +				return ERR_PTR(-ENOMEM);
> +		}
>  	}
>  
>  	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> @@ -1574,7 +1576,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  	u32 num_entries;
>  	struct dma_fence *fence = NULL;
> -	struct invalidation_fence *ifence;
> +	struct invalidation_fence *ifence = NULL;
>  	struct xe_range_fence *rfence;
>  
>  	LLIST_HEAD(deferred);
> @@ -1593,9 +1595,11 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>  	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
>  				   num_entries);
>  
> -	ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> -	if (!ifence)
> -		return ERR_PTR(-ENOMEM);
> +	if (!vm->xe->info.force_execlist) {
> +		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> +		if (!ifence)
> +			return ERR_PTR(-ENOMEM);
> +	}
>  
>  	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
>  	if (!rfence) {
> @@ -1625,13 +1629,15 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>  			dma_fence_wait(fence, false);
>  
>  		/* TLB invalidation must be done before signaling unbind */
> -		err = invalidation_fence_init(tile->primary_gt, ifence, fence, vma);
> -		if (err) {
> -			dma_fence_put(fence);
> -			kfree(ifence);
> -			return ERR_PTR(err);
> +		if (ifence) {

I'm not so sure about the indirections of the conditions here...

probably deserves some refactor with earlier return or different functions?

But anyway, let's unbreak things first while we think on a better
organization/separation.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +			err = invalidation_fence_init(tile->primary_gt, ifence, fence, vma);
> +			if (err) {
> +				dma_fence_put(fence);
> +				kfree(ifence);
> +				return ERR_PTR(err);
> +			}
> +			fence = &ifence->base.base;
>  		}
> -		fence = &ifence->base.base;
>  
>  		/* add shared fence now for pagetable delayed destroy */
>  		dma_resv_add_fence(xe_vm_resv(vm), fence,
> -- 
> 2.34.1
> 
