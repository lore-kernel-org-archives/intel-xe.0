Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24BFC001DF
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 18:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA18A10E091;
	Wed, 26 Jul 2023 18:38:31 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8DF10E204
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 18:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690396709; x=1721932709;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zQTun2urhnemtxECEOIr4u+gFKg4WVNON89TACGA2gc=;
 b=hRWFspP/E2L49nUohQRsKS3b48Waq/35kveV5CpCMmtxkG3mad150O9c
 gJkqJqTIOmFjdysA0WxdRJTGar0YbC4XhCdqGrTYlu19HhbE3NEVLxi0D
 g5eLKN54C+ZOJyEZ9cRDjJ42H+XoLYl2z4j6WA4K/fNy4yRXPGWsIBpWi
 k0UMpdBZKhX0+NRq8X8fZ5ZX1qYcmVIOJ2Pb0WKjD9lvi8oEqpaomd49S
 IxHyacJh4spFQ4V6CtJ0C45o2MIwflQ5mXtwasZ+exPJPwl0UWoNaZorp
 5FWozU/3ANvgPinRPpZs9sySj21wQwOD4HLoVSQhrHUJSZvKBQ9WkMMxM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365560773"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="365560773"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 11:38:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="729965720"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="729965720"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2023 11:38:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 11:38:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 11:38:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 11:38:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKq16+glxDMsmlL2CPPqpR3UoxQmGoxmwdh8+hrpTHbHOJkQHz2plCJaPcTyH3ennub9+MsQP25L+7nCuzPLD7rNB6/hjWXsgj5QTOEVNY6/f/3iixu7+8/pGf86f7JFMwSuNpduEPEQpRUf6Xwi43aErxQzY4p79LGlW+iYL3OXlfL1uN9arJYxpCBvaaWziCr/CGsLuYDIz9nfINLS8xHnAnx9LNrLd7ge3IBby1/ujrDFtMUFdSKKK1DTxGIC1oCffCJdXHPGvIwXKlLNHB61hurEWMJhocI1UJr+8HoSEPos/cgi9s1CMxOhkThnqBn0gT/iM2PvFPOL7xBXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YHrETIT0x1RIrPqjeJHqlm/IbxbzHbeqamMKxXdfJA=;
 b=ECw5wNZE4Iggop8Ckp+tQxM8T2VegqUAb5U8iPSw6D0ywlPNIOegSHky8t0m6rsrTydvWiCmdbV8GVAsYgBr10CQOguCDnNR3EHw2s6O0F5o4hlEY/ILfaiE6+VQEYDGAFscGYiA4T9oyn2cDR6pe6yX2v6dCJbMhXiOIoAJUpHx9mS3QYK8cVukS7CgfPSFyMT6x+bZ8ciVxFVQHJbI3+2YkI9ucPzllSMdXbyFeBFuwB2OyyAibfB5l4+ajszB3tqrKgfH19ieCpQTqUwmBnRhcHRngaFCZh+ZocbBEgIcqdS1S0HUFvPM9gPqUfZVsNggxF6C0WbQ0DxKpdz39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6526.namprd11.prod.outlook.com (2603:10b6:8:8d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 18:38:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 18:38:27 +0000
Date: Wed, 26 Jul 2023 14:38:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZMFoHlNKMhrdT0KR@intel.com>
References: <20230726163721.353842-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726163721.353842-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0182.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2b8d58-9b7e-4e13-77c8-08db8e077fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vpGYsnsMuOXpKDYbz4ITTmZIZ8V4jjSKRGBQAPGImaHG5n+2RMSJsU7p74R13X/idjTb0yd9DhFtjnWIVLXmhssWQpbW9y4ALT3ySvHiD0UTygWj/A394elW2c366JHWVZMgSb6eGxY/Be2B2/RtND9qEg2/6JFMb4RTSmF5hG1kEpkRE7nmunAvuPhFtvrpur42AIeRwG2xT99SEWJrdeCnP8Y9tCS95ICnw+kKCO7PazJI4ssd+sbKXZaGE8M38jYZkXyz54/QP1ajT1xaCfoxrvCTaVWnyegM4al+ByChwF2O2fhb6J6iMxShb8OUYWkghdtxgNmSmqBNA8i5vWT5ua+N3l3/ljk/qEfxpoVwnsRM7Qo8TyJCutiMUUHakEKd+deF34XU3Drobnb2oEEtwHixm5/slQisWGNMq4s1hraw6WsKdYy0yR2tQVAlofSglSCX7FGbyBpAaWmhlRqUdSY7lZ5PCbFHWfJotCQvPLzjbp0KSL90B2C8agYMVFjLL7stWKexXWIy8ROFOdF4l2hppZlit2gO7EO9UpdaRzR5UIykvvF88D7xqcsR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199021)(6486002)(37006003)(478600001)(6666004)(6512007)(83380400001)(36756003)(86362001)(6862004)(2906002)(66476007)(66556008)(2616005)(186003)(6506007)(26005)(38100700002)(82960400001)(66946007)(6636002)(4326008)(44832011)(316002)(41300700001)(8936002)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6EjqJQi/csZCGNZdO2cfq0RKDS3gcg6NTODLQqAZosKVuLFVFeWKcMsRLwas?=
 =?us-ascii?Q?CLrlIjsSYGY0+lFYZzyTdFenxqKmaaaziXuhjGucTirocoj9HXfj5rlAG3aU?=
 =?us-ascii?Q?j+CHlsR+M7Pqh6zE7fN7zjg58H4y7IgT/ZiWC6SQ0JH+mgF77lg/TnYjyaIm?=
 =?us-ascii?Q?+wEC3GEKbt/iwIj/kz61yEcH7Z2/LcRZ70UmCLXB6Y5D+Qoj8uIBEtiTg0Tl?=
 =?us-ascii?Q?mKZMl14TUS8CwaL4J/vsjQlCT7gGS8MfXLWn0D3it+ydXxD9wOmgXdrK6FyI?=
 =?us-ascii?Q?htwTwo1Llap51mo+X1Y/IFGJJPLAQ/ZEgd2yrpAGmqdvpEN9qY6Kxh3wEOWb?=
 =?us-ascii?Q?gl6WNkpDvTJXRD3xr4Jpp8z5V9iBcB554c63emP3GE2mMOLQXWzkHAgdzzIj?=
 =?us-ascii?Q?siJVVlp3cz+hENkAcAMFaMNBegp0u+z7INkIRAa01RJhdLtmGPApzoHDT7+I?=
 =?us-ascii?Q?NEcuwQcdr8/8AxMJDPRR/uZy8g5eCn5guTkwj7RjgIrtAJ2xuQ2PX2mio2EQ?=
 =?us-ascii?Q?mLnZxUBIzHFkDxmuCeGff45JA9ckWfXVWoXWjUWSUYsiwQBJmUKfa5VNKHPz?=
 =?us-ascii?Q?VZKDUF3t5GXTZHE27PHJCX7oLBZTy/2GvKESwES/DXZ7rIq8bjmJbRG+/mKO?=
 =?us-ascii?Q?V8EJbdhN4RjRjAKsKby7ck5VHKh8824F9tQ9ksHFTgdnlC8RrSizTV9yhNcA?=
 =?us-ascii?Q?UO2vkltGzOwQRVtoOh9vfZsWa8H7GCWmnH00k5AQ2m388Ju0A9GD1Ro54UQd?=
 =?us-ascii?Q?w8hVCUEktMhTf4qDk0zm8yn7KsXueEpHmNwoCk+4I1Qa++Ct4+y5Ahap3Kx7?=
 =?us-ascii?Q?3E/Z3M5ZVpH/rLj0mkSpy9dd34xDwVjq+JT9d+x7Bi3uD3NWEV0F2qDRHXQk?=
 =?us-ascii?Q?pZpE9xZc7epvrKObfxMeonAPQZKKxa7FCVOLRqPxmhY7N/aMprYVHLq0Ghcf?=
 =?us-ascii?Q?g89rey33lBawkjILimPUEfJFbX+JAJTJQzB2xYvIoWNRD+yQ3wFJHJpOVAiL?=
 =?us-ascii?Q?HSW9xf205po73yThQA3vuM0u3BgRWT4n2DvKrb76FOAY2qWl3qjcNai3jv1L?=
 =?us-ascii?Q?fUW+uQkij2GG0QRKV/BUujLDmbZL14+nrHYkwHZe9k3nml+eAi2RS7VEXgvS?=
 =?us-ascii?Q?5kSl90fEyvoTQIFk5dSOmGREpl8FNV4m1d3DHjPbZfNFyGRP2BWUkX1fzbGN?=
 =?us-ascii?Q?V8JsX74ES5+Mpi98U/FOH5jpGTxcFYE28VcUU25km5noDaWTeKnrXWeZ6bNM?=
 =?us-ascii?Q?CYCEXMhW/6JJWrRJHoBtduAZhQ1yzie8h5O0Ja017XhdOdYEMhQokwKD4UA5?=
 =?us-ascii?Q?LZ7KWEw+uH7H9XKPpUlms+DOBlONIlcNTPUcECLbbNs3zvyGjW4GQOTcDLlg?=
 =?us-ascii?Q?KbRdl5c/7jPwQWdfMM0Fid3vzAce2rWXkvCxLlZI82Jb72z7XxU8AFfEXT0x?=
 =?us-ascii?Q?lBKvCqc3UTTaecdPvYlAv1dfr/Wzldc17HxRkAqC5UIcqYUh/dxj9SZkjpqL?=
 =?us-ascii?Q?4tzG5HMs58XT8OUbRje1LLkPLfqArG5TFb7DRShHr3XYW2aUBqXqa7bhJ1pC?=
 =?us-ascii?Q?RRhCaxNhixvErvCSpi/FBtCx89IbAIREiE2LS1sNptcX7Wyd/tzoeRJiph1k?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2b8d58-9b7e-4e13-77c8-08db8e077fb6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 18:38:26.9995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6o0jZTxfRkqRV4XBbolFJSOtS0n4ASFZAODPOsYBIyTqe5+HPFKY/lfwsN4MS/gbTwcRkt/0c32LbJcq9eexg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6526
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Always use xe_vm_queue_rebind_worker
 helper
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

On Wed, Jul 26, 2023 at 09:37:21AM -0700, Matthew Brost wrote:
> Do not queue the rebind worker directly, rather use the helper
> xe_vm_queue_rebind_worker. This ensures we use the correct work queue.

Although I believe we need to reduce the usage of the XE_WARN_ON
in favor of WARN_ON, or drm_warn, or err, or dbg, this patch makes
sense to me and any warn_on stuff should be handled in separated
fronts.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c |  3 +--
>  drivers/gpu/drm/xe/xe_vm.h | 14 +++++++-------
>  2 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d4660520ac2c..c4270e7747bf 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1472,8 +1472,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
>  		}
>  		if (!rebind && last_munmap_rebind &&
>  		    xe_vm_in_compute_mode(vm))
> -			queue_work(vm->xe->ordered_wq,
> -				   &vm->preempt.rebind_work);
> +			xe_vm_queue_rebind_worker(vm);
>  	} else {
>  		kfree(rfence);
>  		kfree(ifence);
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index eaf11ac8ff51..4db777d7e375 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -185,6 +185,12 @@ extern struct ttm_device_funcs xe_ttm_funcs;
>  
>  struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
>  
> +static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
> +{
> +	XE_WARN_ON(!xe_vm_in_compute_mode(vm));
> +	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
> +}
> +
>  /**
>   * xe_vm_reactivate_rebind() - Reactivate the rebind functionality on compute
>   * vms.
> @@ -198,7 +204,7 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
>  {
>  	if (xe_vm_in_compute_mode(vm) && vm->preempt.rebind_deactivated) {
>  		vm->preempt.rebind_deactivated = false;
> -		queue_work(system_unbound_wq, &vm->preempt.rebind_work);
> +		xe_vm_queue_rebind_worker(vm);
>  	}
>  }
>  
> @@ -206,12 +212,6 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
>  
>  int xe_vma_userptr_check_repin(struct xe_vma *vma);
>  
> -static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
> -{
> -	XE_WARN_ON(!xe_vm_in_compute_mode(vm));
> -	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
> -}
> -
>  /*
>   * XE_ONSTACK_TV is used to size the tv_onstack array that is input
>   * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
> -- 
> 2.34.1
> 
