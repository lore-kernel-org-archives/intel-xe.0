Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F43EB8FAD
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 05:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A988E10E1B4;
	Wed,  6 Sep 2023 05:04:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F3010E1B4
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 05:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693976661; x=1725512661;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kXN8Fr122XWqNHlw/hkyoOgqpJyxo7Y7lXGaCGfg5xw=;
 b=BkMkZLR+j1WwwK7h18EbfmMeSNcOEmfsVaneTM3bMneQeY82hS1BVx7r
 bgV3OR3M1qkIh/8kRqGwm0uXqMJ90n8s3FvVXyrSKYwukpvAEpp9ZP22P
 KjhqTqyB1VNuzav2bFZInVyuLRxi5TW08+/5xVjfvYOC/drtKADUk7o/9
 hFjS0It424Wo6+SSrZFAz33XNgoczyW9VfF3uFOz9Y67iMiR4Ryws1Ddn
 P+saJ/+p6I4EW8lOeYaMYbrKtVEub3ty/fJQTBTjX4ckqvnqsuNQz9AN4
 PRhLxXq2krUfhpSbFKywaZ1Wy4wWEh5MXQMPHFAyVPzonkHI/qAqkFqpj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="362000348"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="362000348"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 22:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="776455606"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="776455606"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 22:04:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 22:04:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 22:04:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 22:04:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 22:04:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHkDkcZ4lZ6EKwjOML4Y4OBDtTCTWBQRgPd9zSf/CGsOmTH0z2/5juObMtz/SeYVR8yk/u6pgIYLg8csVkLhLsodcZilZ/fRf2xjeY5wijgQTVnvM3lJ5/aKuVrzIHgzAJz6rvl4RlF63V9v+zgMlLX9M4baQBpprPgvM1tW+x18fKFzlqLWo3Nlb7JzOBn2/tbSar+qRAxvxkc/HDLgAxHX5/6ScK5qub8i9oNQ6agu2SEYqu/kQstmMTE72edNLBsD0Gq7Lw7gzR8VoEMKN/jnlnitqtX2+GtVRsgZTITfhdp5CapDjROt+TXU5gl21uRv8LR0E+oYcC2AKV++Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvL7n07mblE/gM2qjv1agdwRT5ojBMktcnUtyOngdyU=;
 b=VWqhmC757eDNY8t/0iSYqg4DjrBt0IBPF1bx5v4fx6nvwGGbeQZz8n4L+XNir+DUsuAv0H6H+ZkeIbVhz6CiIsBWQ8PuY1qPSqnZjoIAjj7Lzg1vhuUTVrkAa+KEQUwHApBi8QynNOvu9U+1JkhQUboKULpgOk+vD5NY73OvbkpVJA2QxBf149Hz2hXU51EJSodNdHEdtxnOzH2EpX/tvsfHF92QZg9qwa5kh+jaybJwK09g2wt8IT6zncvddKnRoJLVGOX2V8W0MDbWnagA4s9pmugxxbBlmhhlh5CuEcEXUg5G+yEcx5zDmU4DXq9jb4uswfvZzkblBWEH+va5hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6824.namprd11.prod.outlook.com (2603:10b6:806:29e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 6 Sep
 2023 05:04:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 05:04:17 +0000
Date: Wed, 6 Sep 2023 05:02:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ZPgIAng55fM0O39h@DUT025-TGLU.fm.intel.com>
References: <20230831002931.2327568-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230831002931.2327568-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR02CA0051.namprd02.prod.outlook.com
 (2603:10b6:a03:54::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 48b93e75-ef87-494b-1b3d-08dbae96b8d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I295eMF4b8pEJFsb6AaKNeclpYriJIEM/Tc0WJUgcu+0S5VtYKuUSVBMUSbeN5KOM2HleW7P0uGUlU8GyrC4Hi71j9Yas3xD17EHk6wijXLhTAKdIMhFBSCpk9VkPuFipsilQajzrGB7z0qNCyKid3T3mvQLdmoLjhskU2ZY1cPXR9W47E+iOy2DHMu9KUeeOBakxeY99fzB8WUim3o1OcZJ5k2eEHjZVFAqVu6b6hLCBPS2Z0uAghOODRHCMqYJBgTZZ6XcfHC3mx+iX0wdTd1xnITqH4jgMHADicdkHlpTYzmxLUWKZwRHPN+ADh0/JPN/dlrDxjm4H9XwqCtVFWMVbnfms3OKtBGX8FoWI30NWwkFgzRuVmqm8wuW24/cXZduHIZTmO99F/ngsQ7fkmmPCLH7ytSNstQy8Z/NFI8JP4KIz4Bm5VLFsmsQa92OH7l/eXvRhPTKMI+6aGMgdsEH0+YOhtN9ggCjDPrH1S+bOmBi22Jwz0hZu1ra1yOg4pGNfUN2Mr6P/o1x1rRP7cdgkNsGdUqVcKlZvj854P8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199024)(186009)(1800799009)(66946007)(66476007)(107886003)(2906002)(966005)(316002)(66556008)(82960400001)(38100700002)(6636002)(478600001)(86362001)(8676002)(4326008)(6862004)(8936002)(5660300002)(6486002)(6506007)(41300700001)(44832011)(26005)(6512007)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vi+S23s3iW1IcyWJs46M8aaNf76j2hLJTiSI6AOTQG45CExoh7TOz4VQzi0U?=
 =?us-ascii?Q?ZTlLSKTA+epkayL3BB49HGOhxoWKvLvFRsoXi3Gcw2ynbMoTjkBx7kqyOavo?=
 =?us-ascii?Q?DmR+jrsFX6+5J3uLeNIql7LbXu6Vcb0fM7L42teBq/B9y3RDPfmwqHCIhIYK?=
 =?us-ascii?Q?jxLKJXvEO6TeDI02Iq+Dy7bBxwoF4p5ndX0CSPIOMJIsc9L3MevKHwdBN1zI?=
 =?us-ascii?Q?muIZ+zwpGbKmByziBlntSbM4/9EyorRnUamSN3Z/VhMuym1UsNSjZF11txlo?=
 =?us-ascii?Q?zHFtIlvy2+Kw3wYDnWlFRb7B1RA/NQUpOHWYk2wG32sffmxd1HymwEaRsFG/?=
 =?us-ascii?Q?5AAfxIonIgS41coRJ/SQCI6sQt5gpZP+T3yOHitZOArAzyHXe97rUvyaPgwY?=
 =?us-ascii?Q?ReMVJ98nnpGMVWHMWQ6pEu6YAJwV6yRocK+Yn2UNtfDH7xfX5YjTPPR+PXMZ?=
 =?us-ascii?Q?VRtuMNaSvtuHCSEP/zETAULus/9bj4YaEmoo1eppT6c+ujsLt14JZfNbrtiW?=
 =?us-ascii?Q?TkkLvU7EbqgYTM/ujQiDvf9ohL8oFljUOAuySzAb4CMSLp/zo0RShizD81XX?=
 =?us-ascii?Q?ot0YMZiTdeSue3A1g/IKBfc3cekHMO9tzfcBYT/NIXEFsLxtnPirYjwYPy0w?=
 =?us-ascii?Q?YMB8dvd2SiwrseWvRGBACnGY/IfXAnjJDEdgxpDbpMjhgvOIRdYoGd7d0vwf?=
 =?us-ascii?Q?AYS7bKnsOThlmbkHYwo6IQZ39WU3hyI/f1AE0SnYcgBuOcDISydmL1rmGhOs?=
 =?us-ascii?Q?eLf8X95g0hmWClqr3+cHR67DUtgSXZ2/2E7FqPT2HOrHfuntZuQ+V0yscajB?=
 =?us-ascii?Q?UCf/mPjXUQOP8F1jjw2/TYcY2+HIYZf7hUFUJ7ebn52WGHe0K2KxQzHBKrtP?=
 =?us-ascii?Q?nV0RfslnGv27aLA6pVyzJEJsX8K72qIGxGHrxLYSvU2MjlSbnkARR3c9hyhp?=
 =?us-ascii?Q?pI5SofTOtAdkeaehDlsQQH6TatvuVcGTJgDqYNNqYlQhCzzaTddNhG2CuWRm?=
 =?us-ascii?Q?jwZRWgor6mqNo4BHf44j+j2UsQZ8dCevoDqKwG7HARSwtcX1Vtkse0lGL5Fb?=
 =?us-ascii?Q?jxXwTgZyFBRVpnmNU55Lu42D91iqb8innYdfV3a0VDUc1RljAkA3YtLbdHO0?=
 =?us-ascii?Q?AylpWHo4roaRvOXBSWayc7aJzm3E1yQDnFg6TIGjeRn/EeD27SYZ0DMkagoh?=
 =?us-ascii?Q?uYoyN9Nctfc7eMxJ20OUkjnCo8lHq7ES6flvWTqeyX2Dew5zLBus4VfduhAk?=
 =?us-ascii?Q?+BIlz+g2uaXH5QchEG8RJqFBO1a8DYXUn6T2K2i7AT3ATf5Goy1DclaUwhTq?=
 =?us-ascii?Q?yyJ2V8QRN+fA6V7gFAt8pN5w93mCtuP4pBFdLykrkM0O9TDxsHItPMUDe8gw?=
 =?us-ascii?Q?hPlCuT3kw8DxZLrs5M4YD5oujrIooudT9dpHJ3Tncy/ExxHbm73CnmF3NA72?=
 =?us-ascii?Q?660cXHbGMqfMhtkefnIeQCVinC6kLKRFGLB7cFuCoFdsqZxe3EYkfOe+45VQ?=
 =?us-ascii?Q?Jd5QbiIvATAxm7e8DPSSHGafCAkzI351y5os1NAztoOe2r9cI07yms4Kj22R?=
 =?us-ascii?Q?Eme7+lyVdjmT4QQ9tfGxZd2xvnhhf8pR7gxFIokjHFQiPVFBBxaArU3GPDTO?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b93e75-ef87-494b-1b3d-08dbae96b8d9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 05:04:17.4754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enUK+k8uFzs+zRFzYJg4xME4bwOZq0J0Xx+lw2bSriUtXw47ygGB0IUmOPy6c1rEuVUZ3CBzH+YFMDOCBlFR4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6824
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add child contexts to the GuC
 context lookup
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 30, 2023 at 05:29:31PM -0700, Daniele Ceraolo Spurio wrote:
> The CAT_ERROR message from the GuC provides the guc id of the context
> that caused the problem, which can be a child context. We therefore
> need to be able to match that id to the exec_queue that owns it, which
> we do by adding child context to the context lookup.
> 
> While at it, fix the error path of the guc id allocation code to
> correctly free the ids allocated for parallel queues.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/590
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 44 ++++++++++++++++++++----------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index c6a9e17d6889..f912b6fd51ad 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -245,10 +245,28 @@ int xe_guc_submit_init(struct xe_guc *guc)
>  	return 0;
>  }
>  
> +static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa_count)
> +{
> +	int i;
> +
> +	lockdep_assert_held(&guc->submission_state.lock);
> +
> +	for (i = 0; i < xa_count; ++i)
> +		xa_erase(&guc->submission_state.exec_queue_lookup, q->guc->id + i);
> +
> +	if (xe_exec_queue_is_parallel(q))
> +		bitmap_release_region(guc->submission_state.guc_ids_bitmap,
> +				      q->guc->id - GUC_ID_START_MLRC,
> +				      order_base_2(q->width));
> +	else
> +		ida_simple_remove(&guc->submission_state.guc_ids, q->guc->id);
> +}
> +
>  static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
>  {
>  	int ret;
>  	void *ptr;
> +	int i;
>  
>  	/*
>  	 * Must use GFP_NOWAIT as this lock is in the dma fence signalling path,
> @@ -275,30 +293,27 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
>  	if (xe_exec_queue_is_parallel(q))
>  		q->guc->id += GUC_ID_START_MLRC;
>  
> -	ptr = xa_store(&guc->submission_state.exec_queue_lookup,
> -		       q->guc->id, q, GFP_NOWAIT);
> -	if (IS_ERR(ptr)) {
> -		ret = PTR_ERR(ptr);
> -		goto err_release;
> +	for (i = 0; i < q->width; ++i) {
> +		ptr = xa_store(&guc->submission_state.exec_queue_lookup,
> +			       q->guc->id + i, q, GFP_NOWAIT);
> +		if (IS_ERR(ptr)) {
> +			ret = PTR_ERR(ptr);
> +			goto err_release;
> +		}
>  	}
>  
>  	return 0;
>  
>  err_release:
> -	ida_simple_remove(&guc->submission_state.guc_ids, q->guc->id);
> +	__release_guc_id(guc, q, i);
> +
>  	return ret;
>  }
>  
>  static void release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
>  {
>  	mutex_lock(&guc->submission_state.lock);
> -	xa_erase(&guc->submission_state.exec_queue_lookup, q->guc->id);
> -	if (xe_exec_queue_is_parallel(q))
> -		bitmap_release_region(guc->submission_state.guc_ids_bitmap,
> -				      q->guc->id - GUC_ID_START_MLRC,
> -				      order_base_2(q->width));
> -	else
> -		ida_simple_remove(&guc->submission_state.guc_ids, q->guc->id);
> +	__release_guc_id(guc, q, q->width);
>  	mutex_unlock(&guc->submission_state.lock);
>  }
>  
> @@ -1473,7 +1488,8 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>  		return NULL;
>  	}
>  
> -	XE_WARN_ON(q->guc->id != guc_id);
> +	XE_WARN_ON(guc_id < q->guc->id);
> +	XE_WARN_ON(guc_id > (q->guc->id + q->width - 1));
>  
>  	return q;
>  }
> -- 
> 2.41.0
> 
