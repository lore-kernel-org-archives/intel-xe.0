Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05FFC10DCE
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 19:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B9010E067;
	Thu,  7 Dec 2023 19:08:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05F810E067
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 19:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701976112; x=1733512112;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=y58AWb5R67/jHdnbptZ3Q26nt/JK9TQ93x1+etveFrk=;
 b=JiRXQc+7pqhHGz3pQxUEejbMkhloJpGa1U1NHUZY8foYrAmOlWw1ol/p
 hCD2dfLEGitTcEuDXXysoRODPJ4juceIe7yimcwMbJuUp7RMqBNLAQEoE
 CV0CH3nVdBeJ22AFUhCrxBfEc9GBETHp+1B8E51xoRJCC8oazvEu+ZZC4
 AmwVRPJzEXLlQTal1z0OhaoV/OvBJotM+/xerMXeDz/FMLTta0HTqmVtG
 BSxtE6YvOZQQxGqUqTCzSQCb8UXaaj6NgTeR2rAuQZgplCtBLXJUt2pX5
 szwTORq+B55P397vdLFT+mFBbuy3n55juHrZ37W/Dou1XdBZMdwrZvyek A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1357928"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="1357928"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 11:08:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="19821985"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 11:08:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 11:08:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 11:08:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 11:08:30 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 11:08:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCIJl8pDN9ILM5VEc2B4BVP9THD/UO9f7R345LTAURNBHK3x4wXhENLx5D/bqiVlOPoF3bGPAKd+PpfWtMTWBTs4MZt7gsoZ9E/rIY4ssj3DqCi7D+o5oJuCuCApGDs1KFQ0Frb/exi8jqWSr5OxqR6LE/H6ZsH9nuOFBQrQ1vLi91pVfh+RrVpMagHBE4I0lJUCtedUnis9u9/6zKdEGDP9h38mW5Gf8jxHdMIw9yMWgdVIRfyLbzKs81LEtvKOse6MxPJ380ld8V6vG3OTuIuqcEjdEu5I6Xn9WZTy7k2chBQXnwO6aWHj0cEYHhgv/t0di+2Yhtf2Ae7N0PRuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpNQsJX4O9k6VJN0DHJmaakxsqkHh9IBX29jyxYl6+I=;
 b=bePPuG2B6L40Zt+YTX8KHE/A9N0ZY7KZYvFi22w5zg5+NmKeqkB3ne7IWOuStJNeYjF9QbxOWbq7njAuLxNCdXFVoQsuxaom03iwq3vV6pw8LSTtewAPqdZKWyhH6IaubY0P8Ma0AJY8nZ1kxXDU1HQ+NnarScD1vL/3qGF6jLHEoFioVaVFLjDJ76Gx+zdEm01yMldbNhPMOvgXEyl6sj/vBvgGP9DYgNcY1ZI9UsEJC6M2GCk0KolIUogC7cJR77LJHiKUCiWw6WCLpIq2MHNc04Hox9xzGW96lp5s+AxNPWfxtZXd6GHLTegVtFUwUs9P/n+IYKbt2lvmtHNQFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6899.namprd11.prod.outlook.com (2603:10b6:806:2a7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 19:08:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 19:08:27 +0000
Date: Thu, 7 Dec 2023 14:08:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 12/16] drm/xe: Adjust to "drm/gpuvm: add common dma-resv
 per struct drm_gpuvm"
Message-ID: <ZXIYKJr_Ur95M6Jj@intel.com>
References: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
 <20231207141157.26014-13-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231207141157.26014-13-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: 8656b274-0f24-4d2d-b123-08dbf757e473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0qf5PFFuHOYMbbTbvaIc1AwsZNxgHDvIVxG4KlqGQbCIi3eJ1f+S/zUEPzB92i/FxaCsM6jncWa5Cu28YM5Qvq/oy81rkjqqWMb4tDqbe9amfDZtOlH11y8hTwvs0g171whb9cUyxCIHfzkrqgJe8kchx8BkLMw0Uk7UHp2dScnIdGzWA4Tc7g552hisMsJ94nwGisTgGL/mxZBEawlikAJEUW4JI8ac9aMjTULUBkx31QiXi06mptbQeoiYtziJQmvs7aZeXS4vz3h5ktvnC5anPd/e3s8TcT0OtPjri/D/UriEpdYsI3NH5Ec6+xy3sYKvMVuQpiBWUaKQxHyy4mFvuhig0BuxvQcysyOaZPTvWmv9xaBqkDXe1g6st4C3NaP12lDteVSi6+se9YkT+g+hob7yxPqmFbwOYPLhF5C8iMzD9rTPAjgfLEP3R6lSrBwdiXlLs090rWg0qs2Mi4J7skFnjw0/ujd4zeomkeIf0XNPKvGANVltZ1S7GA8HDlr+kXI8Qn/4kk5PYLQ2dG693DGTCVpO+QMYCW7Jxf5yySqmcfBMb2CGrX2RN3/l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(2616005)(6512007)(66574015)(26005)(83380400001)(6916009)(66556008)(478600001)(66476007)(316002)(66946007)(6486002)(6506007)(5660300002)(6666004)(44832011)(82960400001)(38100700002)(2906002)(30864003)(36756003)(41300700001)(8936002)(8676002)(4326008)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qNmjAQyVTn8JUhCcV6mBzwwGKlZtYXjM9XFjkabDNjrz8WQJ9A8TZUwPls?=
 =?iso-8859-1?Q?iqvd0qwZZD7R9LdhK2a7+tjTn8x63BSGlk6YLcMJV77REy7xB158ARQQ7j?=
 =?iso-8859-1?Q?U8fcs+MR6FiSL+KsDIXPacFfSgRPJQNALM5BPPGtCWgmOoCO4QEb4MVrHs?=
 =?iso-8859-1?Q?Bp4PWpgC4MAbgwZgtIhohJxDN7J3HJpdzZ2Pi2tkj5ftfheAIqoB48THUe?=
 =?iso-8859-1?Q?Gy1XGCATuo1foJwWreajB8XJaVtzanjxEqouYxUWJz1yDZ1cSKiHa+T5fB?=
 =?iso-8859-1?Q?NBsobLcUDSf5zq6Gd2PSvQbaow/HFbr7lidExI1MyojUR9Z33RiDQwt6gm?=
 =?iso-8859-1?Q?jSbAKfjBM61Zhr6hKIF8ybbuPAZAvGaH0gsEp7VAK/TF5FZ2lr976QeAz0?=
 =?iso-8859-1?Q?ikP91i6XEoRV6EaYlc5azWTMm17amF/0weEZjuvbKk8Z4RYb+nb8hV/Lfn?=
 =?iso-8859-1?Q?z47BdCz27pe8752LSLUjyAVXf30OO29478V/lGO3Ar0AioUp8HIK5NLKz1?=
 =?iso-8859-1?Q?rPnnTOw7A/6w+1jkdWULHkxLUDTum0NpU2qlr41WTak0/vTymV5llWKBRh?=
 =?iso-8859-1?Q?F/LnQRGlq1D1gZJlk2JUBY9QaxezCEXJzqPa24l8QBFTg/UrUz5vJ03uxU?=
 =?iso-8859-1?Q?kn9tL0Os2JFE6FWFd5bthFeRegJdmIJLqYo5ZMi+/s7fZk5D9Gqvje/5oI?=
 =?iso-8859-1?Q?fzJscx9M/qWcR7fQHz8At2txziDwD9WDwDa32dVSEDnqqc9JYVaz0ltvcY?=
 =?iso-8859-1?Q?DQiiNvp5blGU9lyxMRFA4gQF1ch+b4RTx9dR/ub4iUOMU2UeyyIb8ppqau?=
 =?iso-8859-1?Q?NJ6mdnJpVG6MZpZynPzTNVrjNZG7/ojKKjGkKeXLQTMS0DJ3awGJ0a6H77?=
 =?iso-8859-1?Q?ZlqMa9Oa0nZQZIUvCynp80/KsVzKYIFyBJVEhx50bpOmckzUmw4FXx0dnF?=
 =?iso-8859-1?Q?ydSOCOQS4nUtOVhZ3fD9TJtfSCNW/PUZOWXzEPg9lcoUMusJtK2f4Q4988?=
 =?iso-8859-1?Q?WIqAztYfYXLeyuKB8T2l4XKuq+64Z9X3LYnKgC8VV3jDCm+dL6yKq580Og?=
 =?iso-8859-1?Q?0Wt8kR9od9KCkAIU17ejnKaYSXq4onSbOOJSQ14Il5v6B3Q+Y3f2m6xbxp?=
 =?iso-8859-1?Q?+FSFLlJUa3EXP5AqUCmIP07fdR8cTf/z7xSb/filEPFu+zoArIc4wyokKT?=
 =?iso-8859-1?Q?30sNS7MNEiJHYiBTgSbzenlxIR11dIhz6Hdw5Lup99QV2tg7hLo7Q9M7f1?=
 =?iso-8859-1?Q?9GQupjbeBVhsETOEOqN0nUy+uUR09BMQQfkiitOYHg4tAbfcbr7lPVszOz?=
 =?iso-8859-1?Q?iIh0jJAPDwNMlTdsuUDYLpPAqrrqP0sezwt48OB1T45fioFMWe0nFR4jTh?=
 =?iso-8859-1?Q?YhFnwNB4gQpkB/Z/l5nVfgln3C4tn4Ewb+B2l9HC2DkqsYtI9V+v1EiOhz?=
 =?iso-8859-1?Q?9DDEDRsFza96Vurit2ikKfqcbUKNvRW4EGqKbMOYxh925p8uwWSe+W+N69?=
 =?iso-8859-1?Q?e8+YYYoaKn1cvEbnFgEdE5iX6PeUt/k50lGkhgkGMq2fUwquCCPTZV15H7?=
 =?iso-8859-1?Q?n+jtoqMr+eE/uxslod3nzQ84eVw2WIjcse51amDF8ElQjoCvffEUe0pth5?=
 =?iso-8859-1?Q?mhs0E+2p0V1tdBAbqLxvqKZenIN9PZ7BjW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8656b274-0f24-4d2d-b123-08dbf757e473
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 19:08:27.2526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqJzSPJ1PXRMhcosuLT2GZGzTVt4L2XxCSEiWmu1sihX3Xedy4+hsyewwcHl1JzSDEBItjdfGYWc5Hn56n9Gnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6899
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 03:11:52PM +0100, Thomas Hellström wrote:

This will be fixup on multiple places, but I will take care of those.

The end result looks clean and right

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 17 +++++---
>  drivers/gpu/drm/xe/xe_bo.h       | 11 ++++-
>  drivers/gpu/drm/xe/xe_exec.c     |  4 +-
>  drivers/gpu/drm/xe/xe_migrate.c  |  4 +-
>  drivers/gpu/drm/xe/xe_pt.c       |  6 +--
>  drivers/gpu/drm/xe/xe_vm.c       | 72 ++++++++++++++++----------------
>  drivers/gpu/drm/xe/xe_vm.h       | 21 ++++++++--
>  drivers/gpu/drm/xe/xe_vm_types.h |  6 ---
>  8 files changed, 83 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 72dc4a4eed4e..ad9d8793db3e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -519,9 +519,9 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  			 * that we indeed have it locked, put the vma an the
>  			 * vm's notifier.rebind_list instead and scoop later.
>  			 */
> -			if (dma_resv_trylock(&vm->resv))
> +			if (dma_resv_trylock(xe_vm_resv(vm)))
>  				vm_resv_locked = true;
> -			else if (ctx->resv != &vm->resv) {
> +			else if (ctx->resv != xe_vm_resv(vm)) {
>  				spin_lock(&vm->notifier.list_lock);
>  				if (!(vma->gpuva.flags & XE_VMA_DESTROYED))
>  					list_move_tail(&vma->notifier.rebind_link,
> @@ -538,7 +538,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  					      &vm->rebind_list);
>  
>  			if (vm_resv_locked)
> -				dma_resv_unlock(&vm->resv);
> +				dma_resv_unlock(xe_vm_resv(vm));
>  		}
>  	}
>  
> @@ -1398,7 +1398,7 @@ __xe_bo_create_locked(struct xe_device *xe,
>  		}
>  	}
>  
> -	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
> +	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
>  				    vm && !xe_vm_in_fault_mode(vm) &&
>  				    flags & XE_BO_CREATE_USER_BIT ?
>  				    &vm->lru_bulk_move : NULL, size,
> @@ -1406,6 +1406,13 @@ __xe_bo_create_locked(struct xe_device *xe,
>  	if (IS_ERR(bo))
>  		return bo;
>  
> +	/*
> +	 * Note that instead of taking a reference no the drm_gpuvm_resv_bo(),
> +	 * to ensure the shared resv doesn't disappear under the bo, the bo
> +	 * will keep a reference to the vm, and avoid circular references
> +	 * by having all the vm's bo refereferences released at vm close
> +	 * time.
> +	 */
>  	if (vm && xe_bo_is_user(bo))
>  		xe_vm_get(vm);
>  	bo->vm = vm;
> @@ -1772,7 +1779,7 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
>  		xe_vm_assert_held(vm);
>  
>  		ctx.allow_res_evict = allow_res_evict;
> -		ctx.resv = &vm->resv;
> +		ctx.resv = xe_vm_resv(vm);
>  	}
>  
>  	return ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 098ccab7fa1e..9b1279aca127 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -11,6 +11,15 @@
>  #include "xe_bo_types.h"
>  #include "xe_macros.h"
>  #include "xe_vm_types.h"
> +#include "xe_vm.h"
> +
> +/**
> + * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
> + * @vm: The vm
> + */
> +#define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
> +
> +
>  
>  #define XE_DEFAULT_GTT_SIZE_MB          3072ULL /* 3GB by default */
>  
> @@ -168,7 +177,7 @@ void xe_bo_unlock(struct xe_bo *bo);
>  static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
>  {
>  	if (bo) {
> -		XE_WARN_ON(bo->vm && bo->ttm.base.resv != &bo->vm->resv);
> +		XE_WARN_ON(bo->vm && bo->ttm.base.resv != xe_vm_resv(bo->vm));
>  		if (bo->vm)
>  			xe_vm_assert_held(bo->vm);
>  		else
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 347239f28170..5ec37df33afe 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -281,7 +281,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	/* Wait behind munmap style rebinds */
>  	if (!xe_vm_in_lr_mode(vm)) {
>  		err = drm_sched_job_add_resv_dependencies(&job->drm,
> -							  &vm->resv,
> +							  xe_vm_resv(vm),
>  							  DMA_RESV_USAGE_KERNEL);
>  		if (err)
>  			goto err_put_job;
> @@ -309,7 +309,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	xe_sched_job_arm(job);
>  	if (!xe_vm_in_lr_mode(vm)) {
>  		/* Block userptr invalidations / BO eviction */
> -		dma_resv_add_fence(&vm->resv,
> +		dma_resv_add_fence(xe_vm_resv(vm),
>  				   &job->drm.s_fence->finished,
>  				   DMA_RESV_USAGE_BOOKKEEP);
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index e8b567708ac0..a25697cdc2cc 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1136,7 +1136,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
>  					  DMA_RESV_USAGE_KERNEL))
>  		return ERR_PTR(-ETIME);
>  
> -	if (wait_vm && !dma_resv_test_signaled(&vm->resv,
> +	if (wait_vm && !dma_resv_test_signaled(xe_vm_resv(vm),
>  					       DMA_RESV_USAGE_BOOKKEEP))
>  		return ERR_PTR(-ETIME);
>  
> @@ -1345,7 +1345,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  	 * trigger preempts before moving forward
>  	 */
>  	if (first_munmap_rebind) {
> -		err = job_add_deps(job, &vm->resv,
> +		err = job_add_deps(job, xe_vm_resv(vm),
>  				   DMA_RESV_USAGE_BOOKKEEP);
>  		if (err)
>  			goto err_job;
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 35bd7940a571..3b485313804a 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -866,7 +866,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
>  	else if (!xe_vma_is_null(vma))
>  		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
>  
> -	dma_resv_assert_held(&vm->resv);
> +	xe_vm_assert_held(vm);
>  }
>  
>  static void xe_pt_commit_bind(struct xe_vma *vma,
> @@ -1328,7 +1328,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>  		}
>  
>  		/* add shared fence now for pagetable delayed destroy */
> -		dma_resv_add_fence(&vm->resv, fence, !rebind &&
> +		dma_resv_add_fence(xe_vm_resv(vm), fence, !rebind &&
>  				   last_munmap_rebind ?
>  				   DMA_RESV_USAGE_KERNEL :
>  				   DMA_RESV_USAGE_BOOKKEEP);
> @@ -1665,7 +1665,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>  		fence = &ifence->base.base;
>  
>  		/* add shared fence now for pagetable delayed destroy */
> -		dma_resv_add_fence(&vm->resv, fence,
> +		dma_resv_add_fence(xe_vm_resv(vm), fence,
>  				   DMA_RESV_USAGE_BOOKKEEP);
>  
>  		/* This fence will be installed by caller when doing eviction */
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e09050f16f07..9a090f21f9af 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -39,6 +39,11 @@
>  
>  #define TEST_VM_ASYNC_OPS_ERROR
>  
> +static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> +{
> +	return vm->gpuvm.r_obj;
> +}
> +
>  /**
>   * xe_vma_userptr_check_repin() - Advisory check for repin needed
>   * @vma: The userptr vma
> @@ -323,7 +328,7 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
>  	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
>  		q->ops->resume(q);
>  
> -		dma_resv_add_fence(&vm->resv, q->compute.pfence,
> +		dma_resv_add_fence(xe_vm_resv(vm), q->compute.pfence,
>  				   DMA_RESV_USAGE_BOOKKEEP);
>  		xe_vm_fence_all_extobjs(vm, q->compute.pfence,
>  					DMA_RESV_USAGE_BOOKKEEP);
> @@ -361,7 +366,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  
>  	down_read(&vm->userptr.notifier_lock);
>  
> -	dma_resv_add_fence(&vm->resv, pfence,
> +	dma_resv_add_fence(xe_vm_resv(vm), pfence,
>  			   DMA_RESV_USAGE_BOOKKEEP);
>  
>  	xe_vm_fence_all_extobjs(vm, pfence, DMA_RESV_USAGE_BOOKKEEP);
> @@ -447,8 +452,7 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
>  	lockdep_assert_held(&vm->lock);
>  
>  	if (lock_vm) {
> -		err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base,
> -					   num_shared);
> +		err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), num_shared);
>  		if (err)
>  			return err;
>  	}
> @@ -544,7 +548,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>  	 * 1 fence for each preempt fence plus a fence for each tile from a
>  	 * possible rebind
>  	 */
> -	err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base,
> +	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm),
>  				   vm->preempt.num_exec_queues +
>  				   vm->xe->info.tile_count);
>  	if (err)
> @@ -643,7 +647,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	}
>  
>  	/* Wait on munmap style VM unbinds */
> -	wait = dma_resv_wait_timeout(&vm->resv,
> +	wait = dma_resv_wait_timeout(xe_vm_resv(vm),
>  				     DMA_RESV_USAGE_KERNEL,
>  				     false, MAX_SCHEDULE_TIMEOUT);
>  	if (wait <= 0) {
> @@ -738,13 +742,13 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>  	 * unbinds to complete, and those are attached as BOOKMARK fences
>  	 * to the vm.
>  	 */
> -	dma_resv_iter_begin(&cursor, &vm->resv,
> +	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
>  			    DMA_RESV_USAGE_BOOKKEEP);
>  	dma_resv_for_each_fence_unlocked(&cursor, fence)
>  		dma_fence_enable_sw_signaling(fence);
>  	dma_resv_iter_end(&cursor);
>  
> -	err = dma_resv_wait_timeout(&vm->resv,
> +	err = dma_resv_wait_timeout(xe_vm_resv(vm),
>  				    DMA_RESV_USAGE_BOOKKEEP,
>  				    false, MAX_SCHEDULE_TIMEOUT);
>  	XE_WARN_ON(err <= 0);
> @@ -793,14 +797,14 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  	}
>  
>  	/* Take lock and move to rebind_list for rebinding. */
> -	err = dma_resv_lock_interruptible(&vm->resv, NULL);
> +	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
>  	if (err)
>  		goto out_err;
>  
>  	list_for_each_entry_safe(vma, next, &tmp_evict, combined_links.userptr)
>  		list_move_tail(&vma->combined_links.rebind, &vm->rebind_list);
>  
> -	dma_resv_unlock(&vm->resv);
> +	dma_resv_unlock(xe_vm_resv(vm));
>  
>  	return 0;
>  
> @@ -1116,7 +1120,7 @@ int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
>  	int err;
>  
>  	XE_WARN_ON(!vm);
> -	err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base, num_shared);
> +	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), num_shared);
>  	if (!err && bo && !bo->vm)
>  		err = drm_exec_prepare_obj(exec, &bo->ttm.base, num_shared);
>  
> @@ -1331,6 +1335,7 @@ static void vm_destroy_work_func(struct work_struct *w);
>  
>  struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  {
> +	struct drm_gem_object *vm_resv_obj;
>  	struct xe_vm *vm;
>  	int err, i = 0, number_tiles = 0;
>  	struct xe_tile *tile;
> @@ -1342,7 +1347,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  	vm->xe = xe;
>  	kref_init(&vm->refcount);
> -	dma_resv_init(&vm->resv);
>  
>  	vm->size = 1ull << xe->info.va_bits;
>  
> @@ -1375,12 +1379,21 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	if (!(flags & XE_VM_FLAG_MIGRATION))
>  		xe_device_mem_access_get(xe);
>  
> -	err = dma_resv_lock_interruptible(&vm->resv, NULL);
> +	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
> +	if (!vm_resv_obj) {
> +		err = -ENOMEM;
> +		goto err_no_resv;
> +	}
> +
> +	drm_gpuvm_init(&vm->gpuvm, "Xe VM", &xe->drm, vm_resv_obj, 0, vm->size,
> +		       0, 0, &gpuvm_ops);
> +
> +	drm_gem_object_put(vm_resv_obj);
> +
> +	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
>  	if (err)
>  		goto err_put;
>  
> -	drm_gpuvm_init(&vm->gpuvm, "Xe VM", 0, vm->size, 0, 0,
> -		       &gpuvm_ops);
>  	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>  		vm->flags |= XE_VM_FLAG_64K;
>  
> @@ -1422,7 +1435,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
>  	}
> -	dma_resv_unlock(&vm->resv);
> +	dma_resv_unlock(xe_vm_resv(vm));
>  
>  	/* Kernel migration VM shouldn't have a circular loop.. */
>  	if (!(flags & XE_VM_FLAG_MIGRATION)) {
> @@ -1483,10 +1496,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  		if (vm->pt_root[id])
>  			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
>  	}
> -	dma_resv_unlock(&vm->resv);
> -	drm_gpuvm_destroy(&vm->gpuvm);
> +	dma_resv_unlock(xe_vm_resv(vm));
>  err_put:
> -	dma_resv_fini(&vm->resv);
> +	drm_gpuvm_destroy(&vm->gpuvm);
> +err_no_resv:
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
>  	kfree(vm);
> @@ -1590,8 +1603,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	xe_assert(xe, list_empty(&vm->extobj.list));
>  	up_write(&vm->lock);
>  
> -	drm_gpuvm_destroy(&vm->gpuvm);
> -
>  	mutex_lock(&xe->usm.lock);
>  	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
>  		xe->usm.num_vm_in_fault_mode--;
> @@ -1644,7 +1655,7 @@ static void vm_destroy_work_func(struct work_struct *w)
>  
>  	trace_xe_vm_free(vm);
>  	dma_fence_put(vm->rebind_fence);
> -	dma_resv_fini(&vm->resv);
> +	drm_gpuvm_destroy(&vm->gpuvm);
>  	kfree(vm);
>  }
>  
> @@ -2092,15 +2103,6 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
>  	}
>  }
>  
> -struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
> -{
> -	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
> -		XE_VM_FLAG_TILE_ID(vm->flags) : 0;
> -
> -	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
> -	return &vm->pt_root[idx]->bo->ttm;
> -}
> -
>  static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
>  			     bool post_commit)
>  {
> @@ -3205,9 +3207,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  int xe_vm_lock(struct xe_vm *vm, bool intr)
>  {
>  	if (intr)
> -		return dma_resv_lock_interruptible(&vm->resv, NULL);
> +		return dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
>  
> -	return dma_resv_lock(&vm->resv, NULL);
> +	return dma_resv_lock(xe_vm_resv(vm), NULL);
>  }
>  
>  /**
> @@ -3218,7 +3220,7 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
>   */
>  void xe_vm_unlock(struct xe_vm *vm)
>  {
> -	dma_resv_unlock(&vm->resv);
> +	dma_resv_unlock(xe_vm_resv(vm));
>  }
>  
>  /**
> @@ -3250,7 +3252,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  			WARN_ON_ONCE(!mmu_interval_check_retry
>  				     (&vma->userptr.notifier,
>  				      vma->userptr.notifier_seq));
> -			WARN_ON_ONCE(!dma_resv_test_signaled(&xe_vma_vm(vma)->resv,
> +			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
>  							     DMA_RESV_USAGE_BOOKKEEP));
>  
>  		} else {
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 9a0ae19c47b7..e4b5cb8a0f08 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -139,8 +139,6 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
>  }
>  
> -#define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
> -
>  u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile);
>  
>  int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> @@ -182,8 +180,6 @@ int xe_vm_invalidate_vma(struct xe_vma *vma);
>  
>  extern struct ttm_device_funcs xe_ttm_funcs;
>  
> -struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
> -
>  static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>  {
>  	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
> @@ -224,6 +220,23 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
>  int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
>  		      unsigned int num_shared);
>  
> +/**
> + * xe_vm_resv() - Return's the vm's reservation object
> + * @vm: The vm
> + *
> + * Return: Pointer to the vm's reservation object.
> + */
> +static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
> +{
> +	return drm_gpuvm_resv(&vm->gpuvm);
> +}
> +
> +/**
> + * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
> + * @vm: The vm
> + */
> +#define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
>  #define vm_dbg drm_dbg
>  #else
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 23abdfd8622f..4e540d013702 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -136,8 +136,6 @@ struct xe_vma {
>  
>  struct xe_device;
>  
> -#define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
> -
>  struct xe_vm {
>  	/** @gpuvm: base GPUVM used to track VMAs */
>  	struct drm_gpuvm gpuvm;
> @@ -149,9 +147,6 @@ struct xe_vm {
>  	/* exec queue used for (un)binding vma's */
>  	struct xe_exec_queue *q[XE_MAX_TILES_PER_DEVICE];
>  
> -	/** Protects @rebind_list and the page-table structures */
> -	struct dma_resv resv;
> -
>  	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
>  	struct ttm_lru_bulk_move lru_bulk_move;
>  
> @@ -424,5 +419,4 @@ struct xe_vma_op {
>  		struct xe_vma_op_prefetch prefetch;
>  	};
>  };
> -
>  #endif
> -- 
> 2.42.0
> 
