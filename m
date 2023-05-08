Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B92C7EE22
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB8B10E004;
	Mon,  8 May 2023 21:44:00 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342CE10E004
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683582237; x=1715118237;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uyE0ZU9O1NwiWS6Q+FLoFAlGtkYcCygmU3AsUPegdH4=;
 b=KOdDnE+CU+zNcf7RPv2DA2l1AknPGS+to4R0UEZYVb1ClG2TwQfZtknN
 /VmyQDAsJXzoR1jgqNOD0CPA8g2Avqbsv23cV3LmZ7nmgb9WqOLTxvMLD
 UX1lCi1/E/7FrDC2algQbeqyCcWD4SZu0qQNOMKb39gzKHWpe/aIf7GT9
 ILaMgPtIcY8SrQsb7cXOoHqdNZpCmM/UlcNtOc6inzx4xbKdFzATserLX
 XpAJ5h7w9+OhB1nzVCi7aj0LFCh2ph30oQBqGsd4sPoujQ6dpP7dXV6u1
 Jiwkr/cSm883Ct2YMDeocpiZxmduV1NpsUGKSXx642f+SAFGHQvw6suA4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="413028051"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="413028051"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:43:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="701581517"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="701581517"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 08 May 2023 14:43:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:43:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:43:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:43:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmAvyvQBWZ6EFpSJ7roake7ihe9AU9QLOI8yFN82Nbs6UlqU4Q55iVm5J99llQYBGlzD3y6NXkKaosg5QDokrAljdI/v/iTo082rHNoYomLpYPqOcjG+1+RurVLm8SSmPWgLhbF8DN8YUE1t99NOudr+pvLHJITBCX4aS79smd8sNIBM7lpbldt/JGqFPm0un46t/0TyCQG3ba1FI7Kv9vLh0r1aOWBKb10JGSoqP7/M9/lmXrvxXKub5RshWT0Hqs5VixI+QR7WVnNi/XCjsMgGvQ9zvJx38pwZHNUe4dsPf7zxzY0xY1yMyYsnnQgJR+GQLnWonAnAWmT9cYm5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2q2WaQKZ8n4CRhibrRIBIo2nrAtT0vF0+vMis86aKc=;
 b=QjFXNcf1Q+2RzLPv/GE+76mo6th0lr6nN+tccmVov1ZcZd8PU12CYD9Uhpi81scjv8CX2y3eUosf+JMRTyx+z1df3pxQWseMrT7k8bhYWxKXiVXHQccvsTQxKP6z5FqVe2tD289oYxePUJMJw4F8q9rGTq093fIjjBzZ6hDoOOEn3PmVVaofwTBYULk5+LNmaY21Mr5g8gXQ7fr1DfQE/W7X1WBt/OlE5DIqrHZpUPlB1Pbxq4yFsdwPQCZCntJiVufNrso8KHlUqXelO5reBhc9gCzGSJtPijWuP5MJ+2nijSGDtXnAoGde8H56YEGLGo2x0tbvUx71MSPRDLBZ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB8227.namprd11.prod.outlook.com (2603:10b6:8:184::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Mon, 8 May
 2023 21:43:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:43:53 +0000
Date: Mon, 8 May 2023 17:43:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFltFm99mI7OcsCm@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-20-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230502001727.3211096-20-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR07CA0095.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 88cd0142-6755-4ac2-89dd-08db500d518c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4TrRuovqt4Ht/TZcPadSth6wSZ8D8nRrjo2t+cxReGgqNxU1HyiWPXAbBH3yn+bJW3IeKpDmDcc3IYVsQOkLDubt9iwPI6TGeNCCGT6ZBEr36o8JQa6pVDos241FqflRrFm6X38EDL8Hi2VuraBIr42fKiRN/hJ2GKpOd3VuvCOM5WNrCW+47fY3fncmuzIBkXU/YqttdwrC0d8eIC7Qg1Q8dUTZ7Ii0tEOOwFnUXxWQJGG7wmsB8i4pQ899P4pMd3wht8n+51vq2ORjVBESakAJBMgyiZV25vtISfBJ9yWdfX/lzfj8Grg7eQpDgcsTSC3gjgjNnDAmGT4JGBBx9zoKuB4/To551X/GNH4lBni98LJxR94FkcgHxuJlTpGQlb4/xxIdJhu7geZynrRyHA4gPu9mQMx0XGHq8a95HOPVVHCQ5HFI7FBhQ7DvTEZgPMKXSUNf4PGuFzKhlLl4HCZlKiecqwjApIJpeD2oRann9YMjffSaaA9UZzYlyCu7uvmRZevj3DOhWfR/M23dToUjchqG8dA3Rpu7TK41fJSK2/YsvF1BfVjRci+5KkZG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(478600001)(2906002)(8936002)(8676002)(316002)(6636002)(66556008)(4326008)(5660300002)(66476007)(6862004)(37006003)(41300700001)(44832011)(66946007)(6486002)(6512007)(26005)(6506007)(186003)(82960400001)(2616005)(36756003)(83380400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nlwGMnnVdBI8yNlamXRp8gaY30DU3kAO53yw3iA6Ya9XHsgw5Itqac+voE8m?=
 =?us-ascii?Q?TKnx6Jga1gyvs83VexXQeoevz6TDOK2j283lDAcfRMT6KisObe7pGZh8qcfU?=
 =?us-ascii?Q?yoyBsUIZCIRwzrEdmogd278hQOgtaZTXoY1yoebFf4+oxVc532nAeLDXjuc+?=
 =?us-ascii?Q?sWrNcIg2OP0OpL4IWPIcmFG0UycLbdCwxXAEmQ5ETc7uW4MNy0koy26zGmv6?=
 =?us-ascii?Q?ZQWHCPinLKTTCI7bD7U5WQHf2jI8BSNOgZKXzQzmxxJSXX93HRG8v+vNjPpF?=
 =?us-ascii?Q?1dAS2gHhGJwZ9VZJZG/rVXEQ9bHoIxEFE2+MnzG0Jda0M1xTmEMZgH9xZqcH?=
 =?us-ascii?Q?DdWK2HQmcX8gs4idfS0J+545+ZVCbl2MRgqgTO/1ppkX94AFqQDFQ6WErCZS?=
 =?us-ascii?Q?Qkq/LJJqiLJEiQKqvmXJiAFxSRB3PbI7O7L/Vy4bskBjsloXD9I2nC4iTAGs?=
 =?us-ascii?Q?lrFFsZjQjsVhTEgNv662xXmLDD/dDHBkWoO/An8iY3a7G2qUr9LRE6yabo6e?=
 =?us-ascii?Q?X27nS+6bLZtjkhq+7IxcSYb8T1paen8S/q1wzoRn0sd1P4w3nTyJu+HuOBNK?=
 =?us-ascii?Q?ADwKMs2dBGW0TFgtWKaY+hKWrV65gSnZV7tGIX2IUOXFV2c2NdfUUQNuKY2/?=
 =?us-ascii?Q?ahsOIupVitC4d0IJRHasVreZC0xAp8vUeFBQLaXscFDITH9u8IJexIfT0ic2?=
 =?us-ascii?Q?1A2vSrR8K0dQmiuKAPgoZl6yaMg2OFu2IZz9xCixG4WOHihz1G/WQPKiMvH0?=
 =?us-ascii?Q?ahF9rN5AHfqDL1u0yWZ93Few6EHbw+riUUwcYLMHTS698Am7s0nXj1F1nY/A?=
 =?us-ascii?Q?IfvmMEBX/9T2xFpZgv1lXvwNJkIEjgurfSDya3Qwdy1Djz6csJ5fPGNfVRzL?=
 =?us-ascii?Q?qdL7kYsfKVDvjdth1us7RAClsb+ngxMqNgNMV8Ta+O94/DgfcaB+47E/OJjP?=
 =?us-ascii?Q?/M8Cju4iyKe3cd0Dz19mS5/9E+hrBX6DL+CaAeyiMjQBNIeSZRm8zpLZZoIz?=
 =?us-ascii?Q?zlEhHFHF2BmdF3uqJCv06i9pqTfAVeR8/SIxIcJEcsMLPo9wcuiwqGztIL/U?=
 =?us-ascii?Q?bChRgVLaaJGMzncWvR1eTNBrDFRIAtZQsoU3IGWoYJnB41sX+YZRENMKIGUe?=
 =?us-ascii?Q?dyRunYaQi2IiPGJT9iZ2IbEI3lY3xIas0DcmKxGD5ZlywAxJlar+mVR0DORd?=
 =?us-ascii?Q?IZgJEA9oFK8tYvdALuhdOW/KhdKHmG9V1CvEvT646xna/soA8jUBi0E76UON?=
 =?us-ascii?Q?IM0U2u5u/g0K5Q0GuYBAMD+wED+eDrf9z3uMgNvn4zQiQwMosni9WyumOuBs?=
 =?us-ascii?Q?8j+FblxWVRlyQEzI43kEVbI7i8GJ7OwYshXWkxFveVWD7GO3mY/pZjRpudE+?=
 =?us-ascii?Q?qsztQgRT4wfDJSjTVHOQZ9CKykd6kxzm/t8KeF8q8uzb2WqIz76GrtkAk9cu?=
 =?us-ascii?Q?8fv+BxmYN3hCRTqrFLHrujffHPZ00U5sHdhdrRnz0xrBCh+U/U5QCs2hfFOQ?=
 =?us-ascii?Q?44mW5gmveDmMihq9lboPrnOV6t+pQ9CJwBoRptf7e/FeZY/yFp7HRqykDyf6?=
 =?us-ascii?Q?Mz5L8yZ0ThZ9xO5LaI1J1GtzMUfvbNXD9BXDtIJUYcJj801Q1W77XGWaKuak?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cd0142-6755-4ac2-89dd-08db500d518c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:43:53.8600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNi/LDNN87Vl7QjfX8tCuUkyllpTyqsQZEdOTJGhNkVKaQ3ODtyI/QX02Q26A0IVmBCXPHo5yvpXDj+fLIy9sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8227
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 19/31] drm/xe: Reduce the number list
 links in xe_vma
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

On Mon, May 01, 2023 at 05:17:15PM -0700, Matthew Brost wrote:
> 5 list links in can be squashed into a union in xe_vma as being on the
> various list is mutually exclusive.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |  2 +-
>  drivers/gpu/drm/xe/xe_pt.c           |  5 +-
>  drivers/gpu/drm/xe/xe_vm.c           | 29 ++++++------
>  drivers/gpu/drm/xe/xe_vm_types.h     | 71 +++++++++++++++-------------
>  4 files changed, 55 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index cfffe3398fe4..d7bf6b0a0697 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -157,7 +157,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  
>  	if (xe_vma_is_userptr(vma) && write_locked) {
>  		spin_lock(&vm->userptr.invalidated_lock);
> -		list_del_init(&vma->userptr.invalidate_link);
> +		list_del_init(&vma->invalidate_link);
>  		spin_unlock(&vm->userptr.invalidated_lock);
>  
>  		ret = xe_vma_userptr_pin_pages(vma);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 010f44260cda..8eab8e1bbaf0 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1116,8 +1116,7 @@ static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
>  
>  		vma->userptr.divisor = divisor << 1;
>  		spin_lock(&vm->userptr.invalidated_lock);
> -		list_move_tail(&vma->userptr.invalidate_link,
> -			       &vm->userptr.invalidated);
> +		list_move_tail(&vma->invalidate_link, &vm->userptr.invalidated);
>  		spin_unlock(&vm->userptr.invalidated_lock);
>  		return true;
>  	}
> @@ -1724,7 +1723,7 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
>  
>  		if (!vma->gt_present) {
>  			spin_lock(&vm->userptr.invalidated_lock);
> -			list_del_init(&vma->userptr.invalidate_link);
> +			list_del_init(&vma->invalidate_link);
>  			spin_unlock(&vm->userptr.invalidated_lock);
>  		}
>  		up_read(&vm->userptr.notifier_lock);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e0ed7201aeb0..e5f2fffb2aec 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -677,8 +677,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>  	if (!xe_vm_in_fault_mode(vm) &&
>  	    !(vma->gpuva.flags & XE_VMA_DESTROYED) && vma->gt_present) {
>  		spin_lock(&vm->userptr.invalidated_lock);
> -		list_move_tail(&vma->userptr.invalidate_link,
> -			       &vm->userptr.invalidated);
> +		list_move_tail(&vma->invalidate_link, &vm->userptr.invalidated);
>  		spin_unlock(&vm->userptr.invalidated_lock);
>  	}
>  
> @@ -726,8 +725,8 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  	/* Collect invalidated userptrs */
>  	spin_lock(&vm->userptr.invalidated_lock);
>  	list_for_each_entry_safe(vma, next, &vm->userptr.invalidated,
> -				 userptr.invalidate_link) {
> -		list_del_init(&vma->userptr.invalidate_link);
> +				 invalidate_link) {
> +		list_del_init(&vma->invalidate_link);
>  		list_move_tail(&vma->userptr_link, &vm->userptr.repin_list);
>  	}
>  	spin_unlock(&vm->userptr.invalidated_lock);
> @@ -830,12 +829,11 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  		return vma;
>  	}
>  
> -	/* FIXME: Way to many lists, should be able to reduce this */
> +	/*
> +	 * userptr_link, destroy_link, notifier.rebind_link,
> +	 * invalidate_link
> +	 */
>  	INIT_LIST_HEAD(&vma->rebind_link);
> -	INIT_LIST_HEAD(&vma->unbind_link);
> -	INIT_LIST_HEAD(&vma->userptr_link);
> -	INIT_LIST_HEAD(&vma->userptr.invalidate_link);
> -	INIT_LIST_HEAD(&vma->notifier.rebind_link);
>  	INIT_LIST_HEAD(&vma->extobj.link);
>  
>  	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
> @@ -953,15 +951,14 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  
>  	lockdep_assert_held_write(&vm->lock);
> -	XE_BUG_ON(!list_empty(&vma->unbind_link));
>  
>  	if (xe_vma_is_userptr(vma)) {
>  		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
>  
>  		spin_lock(&vm->userptr.invalidated_lock);
> -		list_del_init(&vma->userptr.invalidate_link);
> +		if (!list_empty(&vma->invalidate_link))
> +			list_del_init(&vma->invalidate_link);
>  		spin_unlock(&vm->userptr.invalidated_lock);
> -		list_del(&vma->userptr_link);
>  	} else if (!xe_vma_is_null(vma)) {
>  		xe_bo_assert_held(xe_vma_bo(vma));
>  		drm_gpuva_unlink(&vma->gpuva);
> @@ -1328,7 +1325,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  			continue;
>  		}
>  
> -		list_add_tail(&vma->unbind_link, &contested);
> +		if (!list_empty(&vma->destroy_link))
> +			list_del_init(&vma->destroy_link);
> +		list_add_tail(&vma->destroy_link, &contested);
>  	}
>  
>  	/*
> @@ -1356,8 +1355,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	 * Since we hold a refcount to the bo, we can remove and free
>  	 * the members safely without locking.
>  	 */
> -	list_for_each_entry_safe(vma, next_vma, &contested, unbind_link) {
> -		list_del_init(&vma->unbind_link);
> +	list_for_each_entry_safe(vma, next_vma, &contested, destroy_link) {
> +		list_del_init(&vma->destroy_link);
>  		xe_vma_destroy_unlocked(vma);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index d55ec8156caa..22def5483c12 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -50,21 +50,32 @@ struct xe_vma {
>  	 */
>  	u64 gt_present;
>  
> -	/** @userptr_link: link into VM repin list if userptr */
> -	struct list_head userptr_link;
> +	union {
> +		/** @userptr_link: link into VM repin list if userptr */
> +		struct list_head userptr_link;
>  
> -	/**
> -	 * @rebind_link: link into VM if this VMA needs rebinding, and
> -	 * if it's a bo (not userptr) needs validation after a possible
> -	 * eviction. Protected by the vm's resv lock.
> -	 */
> -	struct list_head rebind_link;
> +		/**
> +		 * @rebind_link: link into VM if this VMA needs rebinding, and
> +		 * if it's a bo (not userptr) needs validation after a possible
> +		 * eviction. Protected by the vm's resv lock.
> +		 */
> +		struct list_head rebind_link;
>  
> -	/**
> -	 * @unbind_link: link or list head if an unbind of multiple VMAs, in
> -	 * single unbind op, is being done.
> -	 */
> -	struct list_head unbind_link;
> +		/** @destroy_link: link for contested VMAs on VM close */
> +		struct list_head destroy_link;
> +
> +		/** @invalidate_link: Link for the vm::userptr.invalidated list */
> +		struct list_head invalidate_link;
> +
> +		struct {
> +			 /*
> +			  * @notifier.rebind_link: link for
> +			  * vm->notifier.rebind_list, protected by
> +			  * vm->notifier.list_lock
> +			  */
> +			struct list_head rebind_link;
> +		} notifier;
> +	};
>  
>  	/** @destroy_cb: callback to destroy VMA when unbind job is done */
>  	struct dma_fence_cb destroy_cb;
> @@ -72,10 +83,22 @@ struct xe_vma {
>  	/** @destroy_work: worker to destroy this BO */
>  	struct work_struct destroy_work;
>  
> +	/** @usm: unified shared memory state */
> +	struct {
> +		/** @gt_invalidated: VMA has been invalidated */
> +		u64 gt_invalidated;
> +	} usm;
> +
> +	struct {
> +		/**
> +		 * @extobj.link: Link into vm's external object list.
> +		 * protected by the vm lock.
> +		 */
> +		struct list_head link;
> +	} extobj;
> +
>  	/** @userptr: user pointer state */
>  	struct {
> -		/** @invalidate_link: Link for the vm::userptr.invalidated list */
> -		struct list_head invalidate_link;
>  		/**
>  		 * @notifier: MMU notifier for user pointer (invalidation call back)
>  		 */
> @@ -96,24 +119,6 @@ struct xe_vma {
>  		u32 divisor;
>  #endif
>  	} userptr;
> -
> -	/** @usm: unified shared memory state */
> -	struct {
> -		/** @gt_invalidated: VMA has been invalidated */
> -		u64 gt_invalidated;
> -	} usm;
> -
> -	struct {
> -		struct list_head rebind_link;
> -	} notifier;
> -
> -	struct {
> -		/**
> -		 * @extobj.link: Link into vm's external object list.
> -		 * protected by the vm lock.
> -		 */
> -		struct list_head link;
> -	} extobj;
>  };
>  
>  struct xe_device;
> -- 
> 2.34.1
> 
