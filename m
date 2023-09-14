Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41C3EEAA4E
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 15:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8429910E144;
	Thu, 14 Sep 2023 15:36:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6DF10E144
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 15:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694705802; x=1726241802;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KFTWYBtgEIcYoLRe9Yx7uC8GXm+vyhRPMQdScBTALXY=;
 b=YVNFixRDAchhIv8U16DDcyR9gzvxmScWeRn4CWNw7gPXfb/Ccn0/kSnv
 wW9RN5FSdHmrnpzADfG1E+9V0p/OyLwIAN08n3dexOVC+uKxmR2ySe5o3
 9BjGXXVWFa6dFADpwYobE06AUaudItmWONhtJewp5/a6P5HRbedTDOXH7
 /qHgh8WD3ot9ywE5gsO8jTpXyNBX/ZD3ocUK7IgCKa2LKN2FezN3rQ9Wc
 CKkVZyQFM0UneW5v7sXqhZsgV3H415Ml+/v3LoTO1ECSl8kIvTuBjt7Ww
 RIWs9I1Ra9VGw6jSlWd+EFmyxOv8u5i/GQxuxad4HCk8i7Gou43NY2ITc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465358467"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="465358467"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="868284167"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="868284167"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 08:36:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 08:36:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 08:36:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 08:36:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjKkENzw2tNVwnKAOwcF+zMQLtoBew3yM6hsmU5UY2u4leTgNfib3SnKtTlrwcQVg1IAf/SARVSOOm0XKOuNIFsLFWVFkgaTacu00mv8HA2jPS2bcSWb1AG/KT2Xbx88JyfoHlzN+1E2UryBveIJmvIZ//6l/FY4xxpHl5jfE2rKt8eciEbaXVoUxWTH1grgDjBcL2vKN3Sn9Fo1lpZijTb4nzYTp8YaiB5NcDoMddScTUdICvuwd+z692Pbbx8gYEbm/h+3+uZNxnJCGh8xQD2jlr/ThFlCwlTcL9m8BJLG03F8/y9HbiomWAU5/lvtpN1X4xnSORfFyuJFs+PbZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJTw7txF497gkxeg7C+odh8veYajs11NQO4MIznNyYA=;
 b=mH3o1W43n6tTa4kFdGHxaebsaOpCYJ4kUyERomD4GM5dRPL83LuFUr9zXw5r4pB7B1QsSqi9ccLX8rPaUDxUsX0wCck2Bdn9Px8wTWhJJvolSXGHuU8pqxLLrPz3v+6wJwI6aHmygN9pUvKD3WX0fPtm4zy3zDTNMPp6rvFQFXZqGXQw7019t8133Y6cFWBcRT987jADVjqM3O/PRgEyQqBjTGjFagrcnfNdCf2O/3fPSE9NHDb7CXdooNOGnHKgcKU1Ax1gRO0dtKCbLEgS5ctjlmUoYpSFnJqCWgRY3PF/WOPbAtuTE8ygU0rcJG+jfIrqiQjIaK1JBgSaK0yWng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8740.namprd11.prod.outlook.com (2603:10b6:8:1b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.36; Thu, 14 Sep
 2023 15:36:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 15:36:31 +0000
Date: Thu, 14 Sep 2023 15:35:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZQMoPtxx+HpKYBh3@DUT025-TGLU.fm.intel.com>
References: <20230914075325.1936-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230914075325.1936-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0053.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a1453b6-ea6b-4518-ff66-08dbb5385e62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FSbWVdFKIbjTnlQdwIl29nfKvrl6MuHgGeXkk+bJbUvYEHnJapveBoJqtGpqiOvD0uYdx3G54w6W7T5sT32XxjifQ7zXg36t+EZd4EOhOF1gB25gPPy3MLZWr7AfsSG+pfTdAbh0Cl+PWLvc4o0s4Biwm8La1FDpjR1ggPiWwipkMwny3grbgCYnZdzWhjvug1b7oCRlVySSm7RK/JojwrwBL0Y89qVvcwEf+cZbRitWF+BZxpzqvVNf9mRAPb08aaT60iOqEQoecGibxWzHvUy1aLsBKqGs4P4brSbKQ04M5Q6GkeM3VWdRTM09gpgMveMD1ChBCECTbcpWgkRCPFVPlLJTG7wqy6Np1p+znxYzsZK7nSdfUdcUxRe2O6+fDVUOoh45s0PIz0MQHJ8T4dHLP1ABVAovh9Rv13dBzG2RO1hbGLj4Pkl6n5iZiS5qkS/cN/3ZiywHOMREX2L6UDJhEPe1iThs+frUiIfCbJR7NOVewd/hpgXA72XEKvjupNFMTWDVN9bactd3jbixbOoFzuGVcg7RaQlIeX+AaXGLvnGD7X0N1k6lOdwATQ2i0iPxlIhyacG5CHVNxsJR4nWWIUf21mjZebbDM/lFQvE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(366004)(39860400002)(136003)(1800799009)(451199024)(186009)(86362001)(83380400001)(66574015)(26005)(6666004)(6506007)(6486002)(82960400001)(38100700002)(6512007)(2906002)(478600001)(5660300002)(66556008)(8676002)(66476007)(4326008)(44832011)(6916009)(8936002)(316002)(66946007)(41300700001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oxFTw3UnSTZVQP4bI92bJ4v7e3O/phOGaJ5UOWe0yb+LwxoEL+ATvtX/N6?=
 =?iso-8859-1?Q?YdFrz1GZbZbmh9yEisz4os/mzfDFN5w36hTm8B54zvsih6knketuTm+0lg?=
 =?iso-8859-1?Q?t0mjw0jaOqLbjSlEF1jTFc+DSTR5yOE4cA5te9jINc7Tu4MF55uxOIcIBj?=
 =?iso-8859-1?Q?CnoDtHzDBwmy6HJzXzbElbLTgin26DNMR7pf0bAMgaQvc4WwaGFkGrKeeU?=
 =?iso-8859-1?Q?QbGucSgCh8vfopm4D0p7TflHmOrwY40edOo+/PvZAr1JH4sA49EjaMeozi?=
 =?iso-8859-1?Q?ZHxagG9vx/+BdG2HrASqRo9aF2rRf/M6+LJ2zIV5sVu0GXUmEyptwd1ot/?=
 =?iso-8859-1?Q?B7r4ieUXchX53yDg9rrUPuuSaCxS8K8TxTHdn1EYsjnobaTs8umLPg8oUW?=
 =?iso-8859-1?Q?y2CMKMt9I1EwNgeR/dhrdJ0kAJkriXyw6Hqj+BvG4B16d0t8/lnFBub5cx?=
 =?iso-8859-1?Q?BUvXtkrR/D8Yc9np+PpL32GhSlTtlVpWxW6rLv3SHkmlhhSXMhM4VtuWaF?=
 =?iso-8859-1?Q?58+IUztw5Lmgdi0kZvR0QQhvBR5epdh8SyRRnjdx+jJbTt9qzjukMDlits?=
 =?iso-8859-1?Q?fr3HfBxMgUgrx4RqfQgBoqIFixMuBowmiTLSNBiPtE8jT6ekcDf9TyGJpq?=
 =?iso-8859-1?Q?DRxH4FvPieGgB/vtBlfRAY7fpiJHgXE9kVyfwo13VmBTiXGKUYymHAefuc?=
 =?iso-8859-1?Q?5XkjEfD06ppsf71sFSnFFGWMDv9AxoLqSE6xCVO09weR610FP4HHl7fWtI?=
 =?iso-8859-1?Q?kIdyMFANY4AeQsvVfWS4wQFpDx81yKnS7BiYUJTQvj6lOslq5fz3gDS5PI?=
 =?iso-8859-1?Q?n5rC7p3JugBYk74wsZrsjN4XE6vNWSCFK59CJ95tuUekp5yDFamGwZ0MLi?=
 =?iso-8859-1?Q?pvdlYQgYJ4/F1mLns7spFBjriQNgXz3mFd7hgbyXHnz7EE8djvzunC3kyL?=
 =?iso-8859-1?Q?bmC7Hnx3H0CYAzUpsFHdusZv3QVTMCNbBqWJTx7yxLkA9dm/7fvNEJgWW8?=
 =?iso-8859-1?Q?lvajxBzFmZmxwrwBoucxMzviVxNdYMrMzDyey81g13xWWSBeb1LeP8C91S?=
 =?iso-8859-1?Q?rMbhDLGmURwOJj9OQedFAwFAMk9p97pf4ZgqoAaBQwqEsgbpXMFAmAIyz3?=
 =?iso-8859-1?Q?Dfp0A7Vk4c7g7D2ILWjPPPGvtdKw9IIgHnnPl92ibNwNnmE2oIcTv/qmAA?=
 =?iso-8859-1?Q?VMwUEZhMEcACQn1oYVpGulwvMzf36cjQ1mVvQylpd1/Wrgpt/wE2fo28Cy?=
 =?iso-8859-1?Q?GjDP8j7Kz2weJNmfHXFCH1JG1oGN+UCG1gF+Xs/9bKK153zAxP6mCFEyi+?=
 =?iso-8859-1?Q?c3JejnB3XLcyKhy25ToIFlxFCQL2/L7kZt+jMlEMsGEYrdbAZaNb4O9Jcf?=
 =?iso-8859-1?Q?4PUY76TgvfujsPgbu9WyyFPgczDyafB/Pv0XWEvWzIQMZsPTbeXCStYRf/?=
 =?iso-8859-1?Q?l+au7Nllz/qF0G1SKRfP5D1cNcL8KJHGKenbAe1AjWoeRIjN5t+I+dv+Vj?=
 =?iso-8859-1?Q?EOFseQ1IU+zHibvXmyqI298VZEb/664ibVSpaloYwGXJ14Xs1cBFeeuhHD?=
 =?iso-8859-1?Q?8/k1Og64i33p6HHYtkEA1AfyGbHbs2ALKU4tOFMV+4Ly1rzPtI/iseLOH1?=
 =?iso-8859-1?Q?LJxZAtAfDvcnuqnVGLy2jmeBcIFvi5rijtL3Dz+YEjy9wZdBOBKV9syw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1453b6-ea6b-4518-ff66-08dbb5385e62
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 15:36:31.1075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTYM1tUXGIIabbVZf7WaDx765N57Nq9svo3lfHCVMosOAO5y3W/DuiWkUWc4y5x8wFgzQL2dJL/RLE0i7PUp+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8740
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Reinstate pipelined fence
 enable_signaling
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

On Thu, Sep 14, 2023 at 09:53:24AM +0200, Thomas Hellström wrote:
> With the GPUVA conversion, the xe_bo::vmas member became replaced with
> drm_gem_object::gpuva.list, however there was a couple of usage instances
> left using the old member. Most notably the pipelined fence
> enable_signaling.
> 
> Remove the xe_bo::vmas member completely, fix usage instances and
> also enable this pipelined fence enable_signaling even for faulting
> VM:s since we actually wait for bind fences to complete.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 5 ++---
>  drivers/gpu/drm/xe/xe_bo_types.h | 2 --
>  drivers/gpu/drm/xe/xe_pt.c       | 2 +-
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 25fdc04627ca..3fdd0bab2fd5 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -455,7 +455,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  
>  	dma_resv_assert_held(bo->ttm.base.resv);
>  
> -	if (!xe_device_in_fault_mode(xe) && !list_empty(&bo->vmas)) {
> +	if (!list_empty(&bo->ttm.base.gpuva.list)) {
>  		dma_resv_iter_begin(&cursor, bo->ttm.base.resv,
>  				    DMA_RESV_USAGE_BOOKKEEP);
>  		dma_resv_for_each_fence_unlocked(&cursor, fence)
> @@ -1043,7 +1043,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>  		drm_prime_gem_destroy(&bo->ttm.base, NULL);
>  	drm_gem_object_release(&bo->ttm.base);
>  
> -	WARN_ON(!list_empty(&bo->vmas));
> +	WARN_ON(!list_empty(&ttm_bo->base.gpuva.list));
>  
>  	if (bo->ggtt_node.size)
>  		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
> @@ -1226,7 +1226,6 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  	bo->props.preferred_gt = XE_BO_PROPS_INVALID;
>  	bo->props.preferred_mem_type = XE_BO_PROPS_INVALID;
>  	bo->ttm.priority = DRM_XE_VMA_PRIORITY_NORMAL;
> -	INIT_LIST_HEAD(&bo->vmas);
>  	INIT_LIST_HEAD(&bo->pinned_link);
>  
>  	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index f6ee920303af..27fe72129ee6 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -31,8 +31,6 @@ struct xe_bo {
>  	struct xe_vm *vm;
>  	/** @tile: Tile this BO is attached to (kernel BO only) */
>  	struct xe_tile *tile;
> -	/** @vmas: List of VMAs for this BO */
> -	struct list_head vmas;
>  	/** @placements: valid placements for this BO */
>  	struct ttm_place placements[XE_BO_MAX_PLACEMENTS];
>  	/** @placement: current placement for this BO */
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5709518e314b..5e4d8f89d8e1 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -265,7 +265,7 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
>  	if (!pt)
>  		return;
>  
> -	XE_WARN_ON(!list_empty(&pt->bo->vmas));
> +	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
>  	xe_bo_unpin(pt->bo);
>  	xe_bo_put_deferred(pt->bo, deferred);
>  
> -- 
> 2.41.0
> 
