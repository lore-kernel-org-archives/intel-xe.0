Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AC6C00528
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 13:29:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6844010E0E1;
	Mon,  7 Aug 2023 13:29:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC80610E2A7
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Aug 2023 13:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691414973; x=1722950973;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BHDjSJlq8cqGN0qQlIEDGQMI22AKlQs5gr+9VmiLRNs=;
 b=DHRbeRT916lT6P68HAY4h2biK1132X3D3ErtFp3BzaxlXFJCPtFmUS7m
 pXnh7Q1hpTC0qJfIeeBrn0gS2XZSbkQgjZ30GMAOd2Xll6aj6irVMCfxA
 iSDk1/XFu8Wq+MnVz5uDAlx42p1/dIdY08mahhWzwr6g/5DhtiV/Yikph
 iNTy7BNjqlxsvFIIxdvxxB+s33+4ah/tH2xrIMkx3yVSAUTONY/K70E8e
 Tg7N0H14f2CsbOBxh7zjuMntx4NrrBdNlYlUKh+YKuV72Jz5LvcuSj/98
 ChFHYJJTqCQS0hUBzT0cN/9oe42/ERqP+VCSDJ4/iiyA4VqjnQfu2ukSg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369446955"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="369446955"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 06:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="734097090"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="734097090"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 07 Aug 2023 06:29:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 06:29:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 06:29:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 7 Aug 2023 06:29:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVzu5KcgSRIB1sX7WdBWNhNJ62/3pb2mwRpkqEEJ8AgVhdehIqZx1Yj/WJCashOqufIaEfHnRahkxFU25x7XQMRoy+XLFLgSs9mVM2t0DF6lckYuX2vHJfMPE5boy8ghYsmG2WNaMw9W7t2suUZIw4sYeqaj3JhhbzaL68Ht7RE2nUgBvg5m9oYpQs7uxfwztdqMBjSyt/teqU1UGB4xg9dAinOg6zQpxSlE3XxEPtA9yPTzqz1XLUZkae7jpsrlg2WaesQ8LIRjEbIbyyIzq2/4f22X3lm/qS94jbQjQL4JquzxFdj5VJ8Xi7iTF12TLw2R6oAJW4kVby0pC8KT0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N75EBi04ARCVYeXMZtjlCdDHSlDVkV6Q6qgl2CFzZh8=;
 b=K0reGzUlepobXTO4jGEkOg0qnso2N4SATHTnaaUZrESkRldELLnC1DTlo1OTFolZiuIL8E2Bazik2vplak8Kp8g50XVU9zGqdIR+znHHoduJyKMKMnKsq45SX+cAGYSYmyapKRcTssUVsIQwIWipUou2EK1vIwto+/9m1z0CoUvFkUkHU7QN6T3pfsO2mMvy1lh2t6FinYGdWxcJAb4wGOviLpfGloT84qrRZkQag15JOicZcGpLfjqlDUUoL+xjRUUYGvBl7LBZRX75XM8664G+U2ruB5OnctqsAf5RZxlCYU998SzhQ1MTTZz2fEM+HpnAEaRqwIHNfd79xukCMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 13:29:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 13:29:25 +0000
Date: Mon, 7 Aug 2023 13:28:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZNDxdJtc96V3tRij@DUT025-TGLU.fm.intel.com>
References: <20230807130226.49777-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230807130226.49777-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR05CA0082.namprd05.prod.outlook.com
 (2603:10b6:a03:332::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a357b6-2428-4679-7469-08db974a5126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AOXZREjIzc9r+SyWr2NaAuLHg8rid7dO99Yp2Pug7BFfNUoKEoMjD1qAXAVzpuLHy2u3QYjgjjlxEo2U9BS9sTZBQofiC7sRGSwQhZxPHqGysIRhRp4nGPbRGsW54w4pgIRc+D2JII9FJAnn1LhrCLa+tfUtlmLQhhyLqC/O83FCvCaHVhxETHtohg83lXsnSuRDsbp87uALf+spgBifoscH3BEdd20g2XRI62e8Y0NUVDx/ZR7M4ZPbnUpHftO+EQr2Y+qZModo1g4yPVNMbRqcSEuUTsP5xmt3Byr2Ryo62gV8H5TzboRaQ1D1aDv2j48gVAse1Jf43wXOJF9DhEdy0OTsKEyDIRuiLIsfU2fEaZe8pkBIOTDDnEdHd6ZhfJ7724bAHpP/EoQrub87LApTkNM++csCVH2aoN1lOuWcQNg6PXOda5138Hn9xDsaabyMMdsdSUFRjR5xzZ9OYSEb8jQdAAyV3p9ZOJO13m6XQ3RT6NhIYlsMJZedGkgBrfNzhH1pyn2CfbN/2kL7/TwDu0KdKL1I09tbcwDDZng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199021)(1800799003)(186006)(6486002)(6666004)(6512007)(478600001)(86362001)(966005)(82960400001)(26005)(6506007)(41300700001)(316002)(8936002)(5660300002)(44832011)(8676002)(6862004)(4326008)(6636002)(2906002)(66946007)(66556008)(66476007)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oXoz2pX3cbGqxaydSHSn+ot+bDqTO33p7VUFdIK7lZgGQp+tYFQBLRvSGa3p?=
 =?us-ascii?Q?XpGAt5u2kQKPeChCsg/lEmZPq2iGanSjNYPrksS4+rnUM6eDM/uCmIWMby94?=
 =?us-ascii?Q?EEsSzIHCqAtB3dD9xvj8zcxaA7pttkOHOa2W4vPuj+bX1ZCRbRD/efPECYtK?=
 =?us-ascii?Q?149N2gyzAvu7ErhX8VuidOTjeqbXdAlBKfs733NEgBQGfWcwV//Smn88tt2d?=
 =?us-ascii?Q?WJXkgWSjBDqkwn8Gksa3177OwsMWj8zQGyi8fnmmIulNPAE7prMWBo2HBgb1?=
 =?us-ascii?Q?PL560rJHrmMRUijLM3el41XfZPboIAnVMceyS6C3jZH5P+BknRhdyJy0pLbK?=
 =?us-ascii?Q?a8sugiKrgt+hbTSKynoNaWTLEsNCgxQjAvXEOGqvS7Epsry66A6efRzmJirq?=
 =?us-ascii?Q?Sjavc1XllvApnVKcIDbWGfs+VgqAtsIlu0fURBAu8zOO9lyUyoGfACa/ohaV?=
 =?us-ascii?Q?hSWUm+1jTOKnEIe9ulN67jzWuiCZxrDd6wXFnyWw8FdW89rwV4LDWdyoggxV?=
 =?us-ascii?Q?8NQSEN/QYeLAtU75gEod9IRaweBkzXji3EsZxlF4lTjqmKzeiLay9sMFCEAB?=
 =?us-ascii?Q?ej3ltWVxIW6jEt+tkQmhdZvjwCdtPy5pRt4y+jzuOovRqkOqGWwjWvWj09Zl?=
 =?us-ascii?Q?aFXVlYmvCA9XmNWfaUzRl6hzphlam32Awjg4ygwtbmJxLySbr+xnJPCNy2Y+?=
 =?us-ascii?Q?cKyAN2eS6lmowu0YOhnNQYXtczdh5nBZKYbkOQFgJnixPAwGqLv4Ng8y2NB7?=
 =?us-ascii?Q?LNgtEz35k+Zelc3QmhX5f9s7flcpBaoNjgTjed1koz/cDv4bhg6mk3R1jmsm?=
 =?us-ascii?Q?leW1qBNtC7USXgvplTgZ/b6Bh7QWjVZz0UjGgLdsJC0d1O9bB6AmGPogNUwX?=
 =?us-ascii?Q?BXYW4fSZKzlE8/FbuA5+uEx9hrxaATQH5HvRnnVNaUA0lDYhixggVmPK1l9P?=
 =?us-ascii?Q?G5DhKrX1bKrcuuYXR7HkBCjl3LYpA6EOOlFbziEDxNvaz6TYt6i07gfDUZf5?=
 =?us-ascii?Q?FFQwfoHV8Itv076vWPcSI3j/gdiqcrgvnnyJfo6L0aGCeeaBVzr1zMfcNNJ0?=
 =?us-ascii?Q?kGyFIxX+YLOWfOVHxxq6R4Zu/VKLHapFyF1+wVE6Jlz3774xOUpBX/pK2WGf?=
 =?us-ascii?Q?FitMuyzrzpvjBUvriljbD3jYcwtzTzB3j/twqd5VNFKwWxgh/E3NNFmXzgyV?=
 =?us-ascii?Q?S5kN2OopwE9vL5N+VpTeogydo6Nd3PW+t9OiZe8JjKgYdYZs4+zHDlWXlqAm?=
 =?us-ascii?Q?a/Rcyb8LY59UbzeN8ecOl3cG4ITu3lgnjeMgL1hIHbkB72oKBKdJL7PbC8y2?=
 =?us-ascii?Q?lZfC35fSt5phlWrqH4p4IqoA4A0oBYxu3IOrLf4nErUvsLvBxhjsOa00KCat?=
 =?us-ascii?Q?qQVii6DUfadHXE7uO5quoubBLAHNmZ+ZYOKDSYjnabaXnkkdehlawpoy4DBv?=
 =?us-ascii?Q?xQJmcohNFgYTptSPodVP8yTZ1lkMVxczvpo4pksxX3dWqTDDeBBWqVmqL7q7?=
 =?us-ascii?Q?u1C3K6AdQSTHU+j7OEKaCFignVuZMgybcPaUW7BapA//uHCzyLPmhIjMc+Cp?=
 =?us-ascii?Q?VPHEglfvaG59bhkbkMp/CAN0Rw1+3i8dHrb+UTe28dkgdbw0wM9xbRVp2ILY?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a357b6-2428-4679-7469-08db974a5126
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 13:29:24.9395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7xS9m5ENeW4ZW9e+JxEbV9m03y5jol8nuvPXaiM04bHVIzv5vPpoyv4kL1wlcyG+FPqViHH/YXm7pJUxuGGVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/vm: uncombine the
 combined_links.destroy
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

On Mon, Aug 07, 2023 at 02:02:27PM +0100, Matthew Auld wrote:
> It looks like it's plausible for eviction to be happening as we are
> closing the vm, however the rebind_link and destroy links are in this
> case not mutually exclusive, since eviction only needs the vm dma-resv
> lock which the vm close drops when accessing the contested list. If we
> race with eviction here it can run rampant and corrupt the list since
> both the destroy and rebind links are the same list entry underneath.
> Simplest is to just split these entries into separate links.
> 

I think there is another problem here too, I think
vm->notifier.rebind_list could be corrupted too.

I think a better solution is to check the XE_VMA_DESTROYED bit in
xe_bo_trigger_rebind before adding to either the
vm->notifier.rebind_list or vm->rebind_list. Both checks should done
under the list locks.

Matt

> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/514
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 10 +++++-----
>  drivers/gpu/drm/xe/xe_vm_types.h | 11 ++++++-----
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index cb28dbc2bdbb..aa13b2bcda86 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -891,6 +891,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	}
>  
>  	INIT_LIST_HEAD(&vma->combined_links.rebind);
> +	INIT_LIST_HEAD(&vma->destroy_link);
>  	INIT_LIST_HEAD(&vma->notifier.rebind_link);
>  	INIT_LIST_HEAD(&vma->extobj.link);
>  
> @@ -1063,7 +1064,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  
>  	lockdep_assert_held_write(&vm->lock);
> -	XE_WARN_ON(!list_empty(&vma->combined_links.destroy));
> +	XE_WARN_ON(!list_empty(&vma->destroy_link));
>  
>  	if (xe_vma_is_userptr(vma)) {
>  		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
> @@ -1449,7 +1450,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  			continue;
>  		}
>  
> -		list_move_tail(&vma->combined_links.destroy, &contested);
> +		list_add_tail(&vma->destroy_link, &contested);
>  	}
>  
>  	/*
> @@ -1477,9 +1478,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	 * Since we hold a refcount to the bo, we can remove and free
>  	 * the members safely without locking.
>  	 */
> -	list_for_each_entry_safe(vma, next_vma, &contested,
> -				 combined_links.destroy) {
> -		list_del_init(&vma->combined_links.destroy);
> +	list_for_each_entry_safe(vma, next_vma, &contested, destroy_link) {
> +		list_del_init(&vma->destroy_link);
>  		xe_vma_destroy_unlocked(vma);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 3681a5ff588b..a01dde418803 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -79,13 +79,14 @@ struct xe_vma {
>  		 * mutually exclusive execution with userptr.
>  		 */
>  		struct list_head rebind;
> -		/**
> -		 * @destroy: link to contested list when VM is being closed.
> -		 * Protected by vm->lock in write mode and vm's resv lock.
> -		 */
> -		struct list_head destroy;
>  	} combined_links;
>  
> +	/**
> +	 * @destroy_link: link to contested list when VM is being closed.
> +	 * Protected by vm->lock in write mode and vm's resv lock.
> +	 */
> +	struct list_head destroy_link;
> +
>  	union {
>  		/** @destroy_cb: callback to destroy VMA when unbind job is done */
>  		struct dma_fence_cb destroy_cb;
> -- 
> 2.41.0
> 
