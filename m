Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2303CD11DD
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 18:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9363611251D;
	Thu, 28 Mar 2024 18:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGgAx/Ll";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E81911253B
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 18:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711652215; x=1743188215;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+di2HFGQLPfx0T1pFxb7kxt+Rnf78xRaX30t5TYcZTM=;
 b=bGgAx/LlJ+BbM8my99PuEAw8mhcCqohrf3FksBE+XSu449UCnHyLVdiX
 1dI84HZyREkyB+nRrhpQ6b+HkCpViW52sR18uJic7iDPzORvHg5o7n+Rr
 ucPoNVbXHKcLzBLXsd5lHBiHpJpBVj7kpWRljvA9jBoQ6Kk/U6homdmYD
 HUKJhtBios2EHYolWrgaFf14kX0Zq9piH7YaicMWEJOdrCiotKlJGLUbx
 v4au7hMX5sVP4xAtFquZrUoIq0PJtIdIMQ0pSRVz2Aj2Tja84u0ghjoXH
 EI/sOpO7OrIVjJeIw9spdvVimO0CWUc9d/VSNExbsL0Obr9rOOlZA+eid Q==;
X-CSE-ConnectionGUID: jOAVDlPrTlazcwLlUmyoyw==
X-CSE-MsgGUID: Bal9SaYyQcKvpzeWHnTpXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6761679"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6761679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:56:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="54186991"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 11:56:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 11:56:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 11:56:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 11:56:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDNtUo2qu82CmWah8JQMVLSuK3xtjaiv87ZK1De7uybl/ugvAcx/sg8GxyaBc29K3jmtQ2HSqFhjpVL/w7gIciQ51wkQnoc8HhkymVs9EPvfY+p14f4yZJpIUJnizvZTJFKjnpU4qoJedN9wVLOGZSFeqlRG3RaG2yJKO4W9NBcsUturtYzX3kfQDWcjjtq6NH25ku5zlv8kdamatt1dpCi+nZV91wplvVsNGhnQoNhvV3v8Q+5xbYfntyqdlpPzjw0S3j2N1KgG9+NbMkinUKvrsVSIRcP07oz5+bULpvfWNLGDUV55jgUnQTnxLh1RUHg5PPyqRc/pBSV3JQSi2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExVAnHZIb2SJDS/xU7I3cj91EtHu08piV0gJAxP/maA=;
 b=LqGGZnCyjJr9wpeKviWCinlRtMSZTLy4fk7Lc4Yo/KcfLRzBeErC3AHiN2gRBFGmpTyo2Kp26EsVidw/re98BmeyiBbcvmbeNmXR9VgwOv6FSrer3XFOxjZEXw2lUdSjjSCyWxTZPqBleDGtBO1iUSRVZfhIlcgxrKziL3fJdhwfuPub1XkGcs1Yhy6cGHf0J7l9TFlvRiETDYC6kMbOtn2aNSDYbQpNGnRokr7cmq67OXaDYexbfA3SJhVC3mnYJi1fhSMPHhAojJUWyA/v4Nl9GaQpjf+rhh7sj0H/5QHuoCxpPNMuy2MJ7nJzLJ4A4+QJeeb/kRUzarZSrTidNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6606.namprd11.prod.outlook.com (2603:10b6:510:1b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 18:56:51 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Thu, 28 Mar 2024
 18:56:50 +0000
Date: Thu, 28 Mar 2024 11:56:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Use ordered wq for preempt fence waiting
Message-ID: <20240328185648.GJ718896@mdroper-desk1.amr.corp.intel.com>
References: <20240328182147.4169656-1-matthew.brost@intel.com>
 <20240328182147.4169656-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240328182147.4169656-2-matthew.brost@intel.com>
X-ClientProxiedBy: BY5PR17CA0057.namprd17.prod.outlook.com
 (2603:10b6:a03:167::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6606:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H6LwMfMnUd+/cO4O8KoxrXv1Nii5h7bWanQj5WGtpiG/M+E8tfo+Dt5xt5C3KofT3EZelYenYUbFCjXHyzO+XQYh52W8UhiYGcV2GnUdXd5Jvu3slcUb9K7XozAcof7lKt+DZQPkwf49fpt6t0VvNgoN1LBkPGqXGzDi/YYY2y00Mlx5sEnDDl0HkdmJrcOrSRyfCQAepqHnGxgub3hvRLz/2tf0LCrpIXDf2bV48B6g0afJBbzEjqzCgCC7o12XQ+UPf5+Yq8gvKpXRhNGKnyUghhI/MhmlI5HTvDxhLY1QRcz5G3egDf5oRjowOnpIK8oRV5I/1bgPsusEE6zs37ySUtuOkInUHx9WQwX8XkgLRriKLpN8DUq+1Z6ubiZUwokm1Z2aGNa/R4Y+vzIkQFq5mJYBuHVw+cPbLiyPPjXBDU1CQj8L2mnBIGaKkA/KqCl1F2oQdeErrLabm/ILguHziYP2fXa11nOQdPpVoIcXUc1BommpuQLu1LMOUqCnW7DvIXjlshZ7CtLUFF+yqKC5uwFIic8DdhavfAh6lK7qkS7CIChzeg3fs4JpJe3Lm1BJHH9s9ihJEacyP8u4AVVsBUOl/I3OMA/PA+Cidf/QZgWlXvd+xweh7S+lfEWfx5F6vN6j/Bd0+uX4w8RDGJOOxz/edCrcb5Dsp7LOcu8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uxTHQruXyLIFZuZpnWR52qePcECC91lC6Snzz2P65jJHS0Idk3cWCgkuFLFP?=
 =?us-ascii?Q?/gPlnvH0jgvS8Nr3tG6Gidozq33WDIfG6cP1q0QZR+nCRix2zrfSNFM7Ct0g?=
 =?us-ascii?Q?8awVXP1HiA/4Uuztqs8wt0echJSEpYM8LlOS3kOkCvP9fFn+dC3XSqbICHr4?=
 =?us-ascii?Q?nLFm8DzWfI8lo7H1TbYBxdcZWq7kfDjyT+Wtaz4hMXPO31cegeP63/b4tgkw?=
 =?us-ascii?Q?Kodwx5vua598igECF4rCBpOgHmOo8FSRasQ98Zd1EI1Q6K+sbGteMqT84Dwl?=
 =?us-ascii?Q?Gk4UgNXoNRd7DRH6bc81rT4QnvNkRzKg1ztcqx+kWxd2Ki9vVCGfRR3UK1qG?=
 =?us-ascii?Q?+SUcbNX6YtkbxxNYm/F6zVE1+/D429dRnZoOT/91Gm+szjo6F4xj5tzaqtqT?=
 =?us-ascii?Q?nfEAJCH8hxxMJQz19dGAFW4FGcrO9IuDsV1Mx4lGbveOAV4ATb8tp28rk9iA?=
 =?us-ascii?Q?E4tTRyE9A2kqR8y/ewOFfP/qoF5qdn8QZ9lh6wpEOG1u4CQyrvG63f6xGz78?=
 =?us-ascii?Q?4YBBcguc6TsEcmdJXoNePfcrGOldTu7Iji3bIFLSy5kPVdMjpOD+xoDihMgf?=
 =?us-ascii?Q?PKIKjV2xHwGfYQuOzYYj+DEEFrCP1G69J+QoSfGVfSBIeZvo/21jlg9hYira?=
 =?us-ascii?Q?LfGq7aC9S4BK8iEvuMcEvm26dGaA/WDBarOUhZuUOgXDXU+MOIWCysYMAvM2?=
 =?us-ascii?Q?4++l8v6Ahqviuj4Rl9/20q0PnIMms1NFcT2a3SPo6LWsyCLM2SuzcFrF4t/6?=
 =?us-ascii?Q?6cePk5vPOnY1YVxEr1rB+fr94AMo2rv978VTTK+QbkGEBpXYeZ/7DlsbmNpp?=
 =?us-ascii?Q?wNwv2vHqP9Q2rUTFM85CokvpWeRk3G/dCgYzEjaRJAXage1qqRIItKBaxclI?=
 =?us-ascii?Q?adC6CaWsW3f7ImI264Ar0rn0L85xFgIcUza+PoFxMqa3Thx9TUc6QP2HEkcT?=
 =?us-ascii?Q?yvxnByctojA5MKPX3iJv71RokeQ0jEz2f7EqUoF4uXp9Xr8czAKn0Ge3/QS/?=
 =?us-ascii?Q?W4V7szQwj6g6l8jgOXKYbnZFkz8KpKJol8ikUY7QSKTvI7bYrzQz09rfdqSN?=
 =?us-ascii?Q?X7uk664drjxawzTuxdDJqJ2GNeyTBwl9PkSBiufQVZBBhZ3t+VYWtfxnkI4J?=
 =?us-ascii?Q?glELxJIfUFCmJ93RSuKEK21R0zwwLTeysSa4mAB2Q7yynTXvbHufRIJa18SW?=
 =?us-ascii?Q?80HHaotddNGDS+7WjCWM7rCW8T8U3C5FlPbFGcPHjTllCSpwnfcSrUOKbdS4?=
 =?us-ascii?Q?Z1UC1wd3R/y2TpZh5XYVPgQX0z8UPj1wHH54LIiMncljjpWE5IAUomruufST?=
 =?us-ascii?Q?zhyzWEw9h/oBT8qmU7/+rdsFF+Y/PHAGaUB/kui3by4KOdjgZPdJmfDKcX/q?=
 =?us-ascii?Q?nSOnOFoYSDhtua1akpEHYRdA/t9jPNruKApMfTJiwefZqC22MV3f6K8fJ09X?=
 =?us-ascii?Q?0N5q+orJx2HBTxi+KkB5VLX6Qb6f7dUJ6laqxQceim1AGjE1/fii3tGZ73Ap?=
 =?us-ascii?Q?whumRbT6HqEEUhnwvmrPg6RvdNEP64Y32uCEqF3Sse0zfJoSCmHfkt+YlRj8?=
 =?us-ascii?Q?BMMqLkjCIAPbhPeOd1lJS8xVxUAas9/imcAaZih2YTGMwpkbIzrm/ZDINE5O?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d764a0-6406-4e78-8b57-08dc4f58d3b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 18:56:50.9029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JwystDpv1f9vwLkQEIu4ilvND+Eugbe9GAu95n/C9WU7qjWAKKgNmS2G6JoUlBa9H/xZAcMClSjtdWy8K6Jp4G/4FEG5vOHjcJmHI6WoBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6606
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

On Thu, Mar 28, 2024 at 11:21:45AM -0700, Matthew Brost wrote:
> Preempt fences can sleep waiting for an exec quuee suspend operation to
> complete. Use a device private work queue to avoid hogging system
> resources. Even though suspend operations can complete out-of-order, all
> suspend operations within a VM need to complete before the preempt
> rebind worker can start. With that, use a device private ordered wq for
> preempt fence waiting.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c        | 7 ++++++-
>  drivers/gpu/drm/xe/xe_device_types.h  | 3 +++
>  drivers/gpu/drm/xe/xe_preempt_fence.c | 2 +-
>  3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 01bd5ccf05ca..559bd72fde57 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -226,6 +226,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
>  
> +	if (xe->preempt_fence_wq)
> +		destroy_workqueue(xe->preempt_fence_wq);
> +
>  	if (xe->ordered_wq)
>  		destroy_workqueue(xe->ordered_wq);
>  
> @@ -291,9 +294,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	INIT_LIST_HEAD(&xe->pinned.external_vram);
>  	INIT_LIST_HEAD(&xe->pinned.evicted);
>  
> +	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq", 0);
>  	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
>  	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
> -	if (!xe->ordered_wq || !xe->unordered_wq) {
> +	if (!xe->ordered_wq || !xe->unordered_wq ||
> +	    !xe->preempt_fence_wq) {
>  		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
>  		err = -ENOMEM;
>  		goto err;

Not the fault of this patch, but in cases where some of the workqueues
are allocated successfully, but at least one allocation fails, is the
error handling in this function correct?  It looks like it might be
leaking the ones that were actually allocated?  Same if
xe_display_create() fails later in the function.


Matt

> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 1df3dcc17d75..c710cec835a7 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -363,6 +363,9 @@ struct xe_device {
>  	/** @ufence_wq: user fence wait queue */
>  	wait_queue_head_t ufence_wq;
>  
> +	/** @preempt_fence_wq: used to serialize preempt fences */
> +	struct workqueue_struct *preempt_fence_wq;
> +
>  	/** @ordered_wq: used to serialize compute mode resume */
>  	struct workqueue_struct *ordered_wq;
>  
> diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> index 7bce2a332603..7d50c6e89d8e 100644
> --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> @@ -49,7 +49,7 @@ static bool preempt_fence_enable_signaling(struct dma_fence *fence)
>  	struct xe_exec_queue *q = pfence->q;
>  
>  	pfence->error = q->ops->suspend(q);
> -	queue_work(system_unbound_wq, &pfence->preempt_work);
> +	queue_work(q->vm->xe->preempt_fence_wq, &pfence->preempt_work);
>  	return true;
>  }
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
