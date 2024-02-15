Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D226BC4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 06:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8878A10E229;
	Thu, 15 Feb 2024 06:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TXqCMcsk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB46810E211
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 06:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707977923; x=1739513923;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iW59i0ro1afo9Z+A0UMwPh4xuq4xcPRHgYR2rxUiY/E=;
 b=TXqCMcskRgTKt6HYD4BtJ1OrbcuVVrZJk1wVTcyaWnppfWowHPbrN6qF
 UicvrR0XNaE2yrMBcL1bUbrru7bbfTE2mFFgzc9F0a1ukWxp2ECNuzUAQ
 1hMxmTxxPr/dYJsGzyHf32S4PuhvHN+sWcRyMFIvZ61OkCokJAXpevWjV
 LBG4ka9mQpt3fLk/w+APuZrHCejZlOsiKQSoyxysd5wLWpNEej9upP22v
 UfuLa87AQxMGxYXoKpBnrvQPkwjcD3MgOtUqrsSsx3k2eQUwUyFKet/kX
 oNZManVmBovxFndsGpJMcDQ7+kYeUgTOQKylPohHVKM48GrHVjOwDqqCG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="13151686"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="13151686"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 22:18:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3802814"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 22:18:42 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 22:18:41 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 22:18:41 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 22:18:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGxv+L5SSIDpWNOZVGo7YK4T1Z2ipopW+pe3/GV/a8lwpEoEp7JhEpR4jxSsHVWsY2IISj3hUDBUxlExrQeG1Wx2ZaUHAIFzkah1lDOs6ZtMFraQex3HlpaQYtABUzCjcLOn6NopKRN7BSrKkZL1joa3OaLuUS9lNeWt5C5MzLdwM48e8V+IJEth7deP/CnEGESDPrGDDJQiF4ML17LvKcQLc6ky8sUzL5ariNyrcwQS1w23hWSjDVk4AvR47HnAAoZgU1ItfV20lUXr1uhKzZmvF1LpeJlnpTGT8udVDP4NC0riSoUpoaaK4DfvSGZioClwGlfOMEEXRwTkJGa9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cU7R19/U+kSByYIZAd+P4ri6F/Briiq92rEN87d23u4=;
 b=ah2CJeBeBhWtizBIPsjOZ8pYRvx8Z5Ov/IDsROw911ZEXew1b0U4bze6D9LH45+C4rytQV4qTgsNOcmhkZaapGXemSKcQs+HRpzNlRbu8FKrKuCxN6vs/ZJErcfNkkj+I5QddrJGxUvIGHYxVBTZcv38q9nf82tG0VX2dTMKmF6PWtd9qtobswqrOx+x4wNz4wHJ0cWdjJyXgOYI4gpEFV2sK9mxqp8jU0r+TWLgXNIT7e+EwcvWTmrQ9mmlyabDPEZmzrvmuaaQ3KfCFCZJHq2Sn+7bsOmDVp+DtFKP+I6jmd9J5tmtb/T0awWH4i3/bGW5vQfQ6xlikKz8x/PGHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.33; Thu, 15 Feb
 2024 06:18:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%7]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 06:18:39 +0000
Date: Thu, 15 Feb 2024 06:18:08 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Expose user fence from xe_sync_entry
Message-ID: <Zc2soDWzolSghIT/@DUT025-TGLU.fm.intel.com>
References: <20240214141217.361122-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240214141217.361122-1-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BY3PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:a03:255::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 145932d7-43d2-444c-ce6e-08dc2dedf32a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JkJud4XJ1UdYWDhGvtE+hAVpJfQLToVirTQnjp1u2EG11Cd4JnAFph3wrcULrHbW7sccHSJdsX7xelJzUgLQTTVcv7iSRovO7mu0qzLRTMpzaN17d665sQQnddXyh1qVOHais2n5rKSd4z8njfJcgO1eaKKAwkypop76XFrTZDAEgqgFhY/Iz9tD+FSxCFSWjvNUHuko0liEV0cVwlmZiyoSZtdo5nsHt/31A0Y8dZt/3PZoemES5xFlMu22PzyZ4GWBc2PwAIUWikex+ba/lyXo6frjOgT3at8G77hw9zW7sUILmEdVX6cTK7l0McCtXaFrqxSzT1r9tHh+dJf9YOo6f6AqbvGY4ob6fREjmWtnZMGOiE0xiUZml5mukfWVnMiT4/xS3+sT0J9fphrKZ3Qz2U4VEH3c2qJAGA0P+t0gkhJ76GCCTZQyUN32eihoKBmUCM3+qlyfhWdsLxZiadRk5jmh0ggkPykigPiPe6W8eaScKgXeIAe0KgnFeYkftMqvEjAYB8zIOnR9sFgQtvLAv7k/+hGch1/RJLkirCODFr4UZJ3FLqJMRTaVHBpH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(8676002)(8936002)(5660300002)(41300700001)(26005)(2906002)(4326008)(83380400001)(66556008)(66476007)(6916009)(66946007)(478600001)(44832011)(316002)(6666004)(6506007)(6486002)(6512007)(66574015)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fAX+TX9N3DRkDJX47FUvKRMxfvs+6RyyJ9npKpd6bwJokFGtc+qmgigoVH?=
 =?iso-8859-1?Q?LEL0yPmY6LugCaPHs4z48kLzjIWVRZtLCC5OYQUnHAWEisB/hXG3nTgp7a?=
 =?iso-8859-1?Q?hyTrgcSYRJeSpfJtmjmGpN2uHHU/KGqMQTdEKekT10FCakMPwxzlbgT5LP?=
 =?iso-8859-1?Q?jCoaRwkpEjipFKecsjd8O0c0CJtuOL/tcoV15DiszixoFcvp5lF+y0qjt8?=
 =?iso-8859-1?Q?iS3tgPAfoOCMhB/ip8LKqtquwPaUUAkQip3Uhcg0I9QmEyKl+UlK5fRkBc?=
 =?iso-8859-1?Q?wDWy9lfxibY9Q94asrEwg4eQHffrk8W13w1Io2TQflngXZQypUVI+RHURt?=
 =?iso-8859-1?Q?G0imyS2UIKUJ59A4n9ZIAQN5blWbTuCCqlQyF+kxGWPEOTY57WwZ8k88o6?=
 =?iso-8859-1?Q?qVwZiqdre5/dZJad3wJDEqDyEAacoRrrw06XAxOTzjb5VCYxXpGKhcxwUY?=
 =?iso-8859-1?Q?7qMSEU3WfjMoymUrDBzZDn6miIVDq/9D5BlTlr6yH+P4X39P2oq38TERfk?=
 =?iso-8859-1?Q?ebReYi9O7BU5RXS5btykRUZhbVyHe+hNERLm2Ir4O2AHRcyLKQ5YOlkYLB?=
 =?iso-8859-1?Q?EtKukmOlY5XlrQO8Fs/nPfCXX2VsEjB72ELd1TdmDr0mg+ZPq4MHdXXnGz?=
 =?iso-8859-1?Q?kCN+uiH0qhDSi3UWaZEI0v+FooLQef8Xminaoymom50vvgszr09bLBO5tT?=
 =?iso-8859-1?Q?EypXwmWqiXNnIr35l7bhJl74dQI3t0sXXTHxi1gZ9CTRgPieGMj+du/5fz?=
 =?iso-8859-1?Q?Ph5FwfFZnqpI9AKWohjt1Dx2/wdTLC4eZsPyznAT9JO/PC1mpgabv6Km79?=
 =?iso-8859-1?Q?tAikPIISWczL4ENcIJ//UAW1MaT3WxQKbSErMISg9er3t03rouVGju/qbr?=
 =?iso-8859-1?Q?KQyolpzHj8WH/ADFCoM0M1uw7eUCWe2rtHFdoOjVf73aBl0trOaXjqNxO9?=
 =?iso-8859-1?Q?s+YHCONqmq9JeaJ9+6oVl9l6aajw01OePRTUTG7po7RIsJ9NGO+iQpX+vW?=
 =?iso-8859-1?Q?K1a7wkI3KQr+ZCoVH7tMi+XORTS25J3WcOFCLZDjeCrhW3zqilCKvQNNZk?=
 =?iso-8859-1?Q?zHcjOFI0OxJvZiTc8jT3FL0ttbZBMWR2vbJnCVORtBG1yFWAVDRQV3+mMN?=
 =?iso-8859-1?Q?Ur/ZPi5CP9ikBQnIJJniqsHU+O7rY/c0VlzMT/ye0fGUvkoIqxN85f4ChK?=
 =?iso-8859-1?Q?0NumJKrB60kWQ2V6e6h890lXaHF1BrgahR6/2gxhqG3orb2ZA5QtjUmgmm?=
 =?iso-8859-1?Q?BtrJ1mPL8HVunAIOR4MaXhBQmc+kSHVONIAcjtq9RiCS0jsyivP68oGVDZ?=
 =?iso-8859-1?Q?NnuV6OztFeocp1LrlWiU6eA5up5Mu0nl4iWktQ3rur21+ioVhTyKV2/3F5?=
 =?iso-8859-1?Q?vuRjQ/VSbtxowxuRGAmvwu/uewkh2vPhqRdYasJr6uBe53eiSo7YlT7Rd0?=
 =?iso-8859-1?Q?VIfjRin7J3hU0nIUiS92P21jtpbE/rVs61g5rkP7bKAQx+c3N/y/2AvrdY?=
 =?iso-8859-1?Q?tD5grfrmPDFx1AuOoFnwdDtU0SE81kqG5wAXyWVZt5BNRA5bOB3+oP/j9y?=
 =?iso-8859-1?Q?uFacN5rQx2R82+Rk2usrb6pjk6zHRLcscagcqqyFF172Hyly/1Aseme94n?=
 =?iso-8859-1?Q?dH62LHkyr1dw3QgLbBE/5DwP1FOTt1HT/d68ZwZ577bFDJae6JtfJkQg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 145932d7-43d2-444c-ce6e-08dc2dedf32a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 06:18:39.0957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvQjQyPXi9VwBJDNs9QuCz2Tj6RqhLXq+4X/cfiv7j+P7rAnNh0y0MyCNk9v7auDwiY0Ocd9m54aBVZkwbp77w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
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

On Wed, Feb 14, 2024 at 04:12:16PM +0200, Mika Kuoppala wrote:
> By allowing getting reference to user fence, we can
> control the lifetime outside of sync entries.
> 
> This is needed to allow vma to track the associated
> user fence that was provided with bind ioctl.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c       | 63 +++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_sync.h       |  4 ++
>  drivers/gpu/drm/xe/xe_sync_types.h | 20 +++++++---
>  3 files changed, 64 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index aab92bee1d7cf..c3e745c7778b9 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -19,39 +19,29 @@
>  #include "xe_macros.h"
>  #include "xe_sched_job_types.h"
>  
> -struct user_fence {
> -	struct xe_device *xe;
> -	struct kref refcount;
> -	struct dma_fence_cb cb;
> -	struct work_struct worker;
> -	struct mm_struct *mm;
> -	u64 __user *addr;
> -	u64 value;
> -};
> -
>  static void user_fence_destroy(struct kref *kref)
>  {
> -	struct user_fence *ufence = container_of(kref, struct user_fence,
> +	struct xe_user_fence *ufence = container_of(kref, struct xe_user_fence,
>  						 refcount);
>  
>  	mmdrop(ufence->mm);
>  	kfree(ufence);
>  }
>  
> -static void user_fence_get(struct user_fence *ufence)
> +static void user_fence_get(struct xe_user_fence *ufence)
>  {
>  	kref_get(&ufence->refcount);
>  }
>  
> -static void user_fence_put(struct user_fence *ufence)
> +static void user_fence_put(struct xe_user_fence *ufence)
>  {
>  	kref_put(&ufence->refcount, user_fence_destroy);
>  }
>  
> -static struct user_fence *user_fence_create(struct xe_device *xe, u64 addr,
> +static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
>  					    u64 value)
>  {
> -	struct user_fence *ufence;
> +	struct xe_user_fence *ufence;
>  
>  	ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
>  	if (!ufence)
> @@ -69,7 +59,7 @@ static struct user_fence *user_fence_create(struct xe_device *xe, u64 addr,
>  
>  static void user_fence_worker(struct work_struct *w)
>  {
> -	struct user_fence *ufence = container_of(w, struct user_fence, worker);
> +	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
>  
>  	if (mmget_not_zero(ufence->mm)) {
>  		kthread_use_mm(ufence->mm);
> @@ -80,10 +70,11 @@ static void user_fence_worker(struct work_struct *w)
>  	}
>  
>  	wake_up_all(&ufence->xe->ufence_wq);
> +	WRITE_ONCE(ufence->signalled, 1);
>  	user_fence_put(ufence);
>  }
>  
> -static void kick_ufence(struct user_fence *ufence, struct dma_fence *fence)
> +static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
>  {
>  	INIT_WORK(&ufence->worker, user_fence_worker);
>  	queue_work(ufence->xe->ordered_wq, &ufence->worker);
> @@ -92,7 +83,7 @@ static void kick_ufence(struct user_fence *ufence, struct dma_fence *fence)
>  
>  static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>  {
> -	struct user_fence *ufence = container_of(cb, struct user_fence, cb);
> +	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
>  
>  	kick_ufence(ufence, fence);
>  }
> @@ -340,3 +331,39 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
>  
>  	return ERR_PTR(-ENOMEM);
>  }
> +
> +/**
> + * xe_sync_ufence_get() - Get user fence from sync
> + * @sync: input syncs
> + *
> + * Get a user fence reference from sync.
> + *
> + * Return: xe_user_fence pointer with reference
> + */
> +struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync)
> +{
> +	user_fence_get(sync->ufence);
> +
> +	return sync->ufence;
> +}
> +
> +/**
> + * xe_sync_ufence_put() - Put user fence reference
> + * @ufence: user fence reference
> + *
> + */
> +void xe_sync_ufence_put(struct xe_user_fence *ufence)
> +{
> +	user_fence_put(ufence);
> +}
> +
> +/**
> + * xe_sync_ufence_get_status() - Get user fence status
> + * @ufence: user fence
> + *
> + * Return: 1 if signalled, 0 not signalled, <0 on error
> + */
> +int xe_sync_ufence_get_status(struct xe_user_fence *ufence)
> +{
> +	return READ_ONCE(ufence->signalled);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
> index f43cdcaca6c57..0fd0d51208e62 100644
> --- a/drivers/gpu/drm/xe/xe_sync.h
> +++ b/drivers/gpu/drm/xe/xe_sync.h
> @@ -38,4 +38,8 @@ static inline bool xe_sync_is_ufence(struct xe_sync_entry *sync)
>  	return !!sync->ufence;
>  }
>  
> +struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
> +void xe_sync_ufence_put(struct xe_user_fence *ufence);
> +int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sync_types.h b/drivers/gpu/drm/xe/xe_sync_types.h
> index 852db5e7884fc..6176ef9d65c72 100644
> --- a/drivers/gpu/drm/xe/xe_sync_types.h
> +++ b/drivers/gpu/drm/xe/xe_sync_types.h
> @@ -7,18 +7,28 @@
>  #define _XE_SYNC_TYPES_H_
>  
>  #include <linux/types.h>
> +#include <linux/kref.h>
> +#include <linux/dma-fence.h>
> +#include <linux/workqueue.h>
>  
> -struct drm_syncobj;
> -struct dma_fence;
> -struct dma_fence_chain;
>  struct drm_xe_sync;
> -struct user_fence;
> +
> +struct xe_user_fence {
> +	struct xe_device *xe;
> +	struct kref refcount;
> +	struct dma_fence_cb cb;
> +	struct work_struct worker;
> +	struct mm_struct *mm;
> +	u64 __user *addr;
> +	u64 value;
> +	int signalled;
> +};
>  

We really should have kernel doc for all structure in *_types.h files. I
suppose this is already missing in this file though.

Also we likely could leave struct xe_user_fence defined in xe_sync.c if
only xe_sync.c touches the members too.

Other than this LGTM.

Matt

>  struct xe_sync_entry {
>  	struct drm_syncobj *syncobj;
>  	struct dma_fence *fence;
>  	struct dma_fence_chain *chain_fence;
> -	struct user_fence *ufence;
> +	struct xe_user_fence *ufence;
>  	u64 addr;
>  	u64 timeline_value;
>  	u32 type;
> -- 
> 2.34.1
> 
