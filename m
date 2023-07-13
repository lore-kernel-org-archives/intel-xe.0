Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A642C001B0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 20:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FFA10E77E;
	Thu, 13 Jul 2023 20:18:36 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A246910E77E
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 20:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689279514; x=1720815514;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SUdmQcGi3C4rwE7iduNZYMvcNLHxGXdiQCS6p5gAIhA=;
 b=h5PAEReki7DighNqKXYLqRLKYNE5E2UqO9mAm0VIt+cplnHhbeh2Ms5V
 YS8URqf5Q/Mfovn14xZzA/S7S0+xlLkG4jIAFt6r3ecHIeHGP7f5xdxkd
 B60SnOrR1EwoVU4lPvRAgfGUYtjatqh+8uvYJqTJEnOvxi5MTewTpyuFk
 BCh80OOd5qfZTW05upxuMY8DV7E1L3+ZPc3s74T/lA1vAJSYfHttYF/e6
 vlrJJS+uodltFdK+ZzonWtjgajNI5q1pkWvEdvdcBljU4KOpD8Zo8+Ts0
 Cg+iI1ggH/pxjMI4bzyswZ150CNo3CKOHIyPfEFHMrgzg/vzAljYe2kWS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364180826"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="364180826"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 13:18:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="751784318"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="751784318"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 13 Jul 2023 13:18:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 13:18:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 13:18:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 13:18:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEFJKBAzQ3JBW04Je5sV92lZoqXiYrvZji3fP50OmQrg3WNdWl656lUihErfSx22/3VdKmesn2KHYAUD5g1gOUkyxaC5LbP5ya+TQwcIy/aFmZ1nhZ/r6E3IXcxbma5Xm7G2kxts2QwFBIXWu9RVJYAtWYfyKDL+M0tFxrb+/7F9CInenyhItw5xjgNRIsxJpmJS3FxBENcms16DSLfMzGidMF973/Q9HD/0mKPmYpZSi6klvG4Tb8yeGk8wYYCOHVeZykf1TXd7vM4KzYqn22gGLLUrmQTfewdR3YrDdVNt8XCHSsrVtrghMq/k+y7chGKCiOpaJjw2azpxE0AnCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+c8mJftssO5WktYwjQvWE3CYdJZqF6kWiag13sHGbE=;
 b=duahywwVM+l9Dg1hwrrh11KkHh7adPKW8n9t0Ii5NkuOO3JNEFegiwfHydq+zjCR4VR9KEFieWa20XYOhc4Ne3KbEdQn58ByqGlrqgGgFNCrGxlD7ZNVDC+Yeo2TyA7GN/o48mOTXVrvedkgFARJdoHS78LgP7u5JTxGTlymHE5y5BMjKWUSV8CYopsRsvyPmSfL0OvCppb0lVFBlu4sUOmy9WOzzTtDVI5b8e/JR2vAw3B+LUmiljxMRpf/MN4hGCJ9QcwMc0VNsjVRjMfnhm8uYMZLExKM4HyivnQZQlJf7MfVm3LudZejIrk1FoHZBh3aR6X8foTq8OfdgUNaOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7201.namprd11.prod.outlook.com (2603:10b6:610:143::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Thu, 13 Jul
 2023 20:18:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Thu, 13 Jul 2023
 20:18:25 +0000
Date: Thu, 13 Jul 2023 16:18:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLBcDIPK7xT2qANE@intel.com>
References: <20230711212748.2029455-1-matthew.brost@intel.com>
 <20230711212748.2029455-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230711212748.2029455-3-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:a03:331::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8d4b31-d13c-4b84-0a37-08db83de4f8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o97sQyylNtmvAz7dfdWcdceOHPQeEfcmHg3tmxbkunuSeyyIPZiP/8bWtB3YfNrc5woxYwbqqIeazpW4CkE32OTykXcJYJ4UwGH0ZRRffNkJ8B2B/JNvRDjUMcuVcWjQyzMP/8VGvMOa+a0P3+54330zd49st1YX+LLt63p8mM0v5QdZKNKxB933OL6Q/hfEuqfd+KDP76ptMwFJ2CNtZe6/v6Rp2241FC4Yt2+ylyo+DoznVlyJmAmm0vgdrQzIMHZqpyRvamXfA2xgU9rxNQ9hx8N+upcWPK/RFfJqRBEQ0nhZEYVDMN0cyhIt44aCyJG5Mp0EQyXWh+jau+j26ILs5P+xIrwlN1gUDXRA7i8NemOU+Z/VJzzjVzarq0fMBIKMGO34fThAaRUaX/mfRyhtFryW34Q7xgM5rylwYUcDl1m3ryYwAIrb/z/URtbIBW+PuuXfXxxfe55O+DdMFYP+BM364xU5Q/lhyPO1TCO+Wy4de493yKbieSLJQDhMYLE+cSeICKN2kdmyIov3uztozY8/D9I91CM2kN6wUJjUU71dAYdgfHOZvaJsrciw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(376002)(396003)(39860400002)(346002)(451199021)(478600001)(6666004)(6486002)(37006003)(6506007)(186003)(26005)(6512007)(2906002)(66476007)(66946007)(41300700001)(8936002)(316002)(5660300002)(44832011)(4326008)(6636002)(6862004)(66556008)(38100700002)(8676002)(82960400001)(86362001)(36756003)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RhZvDOTOf63s5da2u50odO8fVzWNaX9w84Uo2yBXNBpiEH0BVxtYdxgeMTL2?=
 =?us-ascii?Q?WFS2+UVETWtcWRwafvlF07wAMmP9lgnlUrBghNCXIXOwRHZ4lPVTq5ZMnmBy?=
 =?us-ascii?Q?QRwebs7AQ6DSHU/QIyLuupr0kqh7ry0Jg4WoN+/PRZMY/PnaO/dUHVsS/lVe?=
 =?us-ascii?Q?9qvlynzTZhXVKQA/kuAsTTKrqJswB7tsFXQv8PQa+GIl1Pv85bSJA+0Lt4zC?=
 =?us-ascii?Q?KeN6ESzu4jBvgOgZ+d2BjO1FodGjt0e3itkKluBlyzUiq0Bx2331f1PBcZ7P?=
 =?us-ascii?Q?PX50xJv7QhZibNy2YnJJwi6ICI6Tojmwva3bOU1KUlc4D2DQDbwmHDsF47cN?=
 =?us-ascii?Q?DJ4HQuzlJ1xifUTAOZ8n/A+/Rg6HdjJpyBxVqz6DHEBM4QSwhchaquXxgR4y?=
 =?us-ascii?Q?1SBuP8k5cjzHDsv7U1/2lG7dEjLd3dDoc4dniJ9AviN9cur3Sd78dl/t35il?=
 =?us-ascii?Q?ozgS8YcVoqkZRjE0jPSFgzlNy6GuabqcLSV+q2j6Ez1se1J6AyoAoYJsnKpM?=
 =?us-ascii?Q?460e3gY2/PoVBtcxpShfsTZRIAfGR/TwBQWehQselos3+0fuJ+l3Qi0VEB+w?=
 =?us-ascii?Q?WafcydYNx1PNmZd7MXZ2hFi6DHiiBmzAr35re8OwFFLj6TWMGBWuRuLDhaFI?=
 =?us-ascii?Q?yvfjHstAqbWwwxHD6h0uziip3vKs3kGTGjWF+ZO0/AMGaF3EUyMVYCeUgjxQ?=
 =?us-ascii?Q?8vt6NVL5gG5igQ+uFj7F6i1ZUM35cbHN8IPaETswFwLDBlnGqwbnZDRal/yk?=
 =?us-ascii?Q?PZCUzvxuNthZBNhfQUCbdzS5inrS6mwLPZnuNwTsKvBkh/Qg5fLrpqEQQzni?=
 =?us-ascii?Q?oj4qW2wHWYOSZZbnVUb/KRjjT4bMpYkP6jh+8W9lTj0KY1eBUqouA00Tnye7?=
 =?us-ascii?Q?W2przzf1iI4PFjk5CxcvWso+BOnxYQzHL82RUawER84+AvjENs0ukH+eNLEH?=
 =?us-ascii?Q?ZWD/8UxOk/dvT+PSkwc2rZnGDXNjZBEvubpDiWGT8gdNUEqGYKbHSixKpZ7C?=
 =?us-ascii?Q?UpQ/sjuMCH/vkg3cNdVXJemu2DW6sLurwiKZeGREO8Cnk+qpNNrNJSPSzGgs?=
 =?us-ascii?Q?OqvhzJ0UbmDyUjunLuXLFFWPxR2V8y+bOgulsTZELszLXWSLo9o0TqdakTdu?=
 =?us-ascii?Q?a+YKoR7FasPd7pyAGgYNnC1wePGOaYgP7YSpCm7mFj5bXTLwNtj9XJalnK68?=
 =?us-ascii?Q?UxDFg8iicLJtBqTWeNzV7Hmqyv2X0TWaSAbbiOQS4TuEr9YqfIGFtBme8VuB?=
 =?us-ascii?Q?wcbbhKTQ20LrTwxUgYeVmh+RM/VVTwQiHlJbVqaDMnwyNI1yu0dDfhI6N6m1?=
 =?us-ascii?Q?Z38dTjpvNMzis/qX4D9SjSGtJDB/ySYaMtJ+4MgXIKNHPNYjCRXeqohPoF//?=
 =?us-ascii?Q?YpRPZ7cBSJcxkqtVixct3aUKZlbAzKD/vV0KzJ0sxVkckZrHsVGcKoQzamlZ?=
 =?us-ascii?Q?p9RP567cRweppvkGhh0Yh+zpS2ji+gNMWy4HdnX+NzFliziPo2fJcys2eN1I?=
 =?us-ascii?Q?r+M6M9CUUDMgwf7izp5NED2swg1lA6teQSt1pcMEGxMEoV9ubPKz5mS2s5vg?=
 =?us-ascii?Q?25R55KEmsMTIwF9lKk3xbDkNAYlZOK3hRwR5J74C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8d4b31-d13c-4b84-0a37-08db83de4f8b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 20:18:24.6786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRc3jpq+UQmzwgdNdnzuRq8jkDRYmeUPid6roKmge+BgOjK5BAvcaKXd0oKyf1FFmh+jTc/MNCWBa0GXm8FEfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7201
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/5] drm/xe: Reduce the number list links in
 xe_vma
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

On Tue, Jul 11, 2023 at 02:27:45PM -0700, Matthew Brost wrote:
> Combine the userptr, rebind, and destroy links into a union as
> the lists these links belong to are mutually exclusive.
> 
> v2: Adjust which lists are combined (Thomas H)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c       |  6 +++--
>  drivers/gpu/drm/xe/xe_exec.c     |  2 +-
>  drivers/gpu/drm/xe/xe_pt.c       |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c       | 45 ++++++++++++++++----------------
>  drivers/gpu/drm/xe/xe_vm_types.h | 28 +++++++++-----------
>  5 files changed, 41 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6353afa8d846..ca7f74ecb753 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -474,8 +474,10 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  			}
>  
>  			xe_vm_assert_held(vm);
> -			if (list_empty(&vma->rebind_link) && vma->tile_present)
> -				list_add_tail(&vma->rebind_link, &vm->rebind_list);
> +			if (list_empty(&vma->combined_links.rebind) &&
> +			    vma->tile_present)
> +				list_add_tail(&vma->combined_links.rebind,
> +					      &vm->rebind_list);
>  
>  			if (vm_resv_locked)
>  				dma_resv_unlock(&vm->resv);
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index ba13d20ed348..bc5bd4bdc582 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -120,7 +120,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>  	 * BOs have valid placements possibly moving an evicted BO back
>  	 * to a location where the GPU can access it).
>  	 */
> -	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> +	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
>  		XE_WARN_ON(xe_vma_is_null(vma));
>  
>  		if (xe_vma_is_userptr(vma))
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index a8d96cbd53e3..3b43b32f4a33 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1690,7 +1690,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
>  	}
>  
>  	if (!vma->tile_present)
> -		list_del_init(&vma->rebind_link);
> +		list_del_init(&vma->combined_links.rebind);
>  
>  	if (unbind_pt_update.locked) {
>  		XE_WARN_ON(!xe_vma_is_userptr(vma));
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5f4f6dab270a..b2847be6de6a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -467,7 +467,8 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>  
>  		list_del_init(&vma->notifier.rebind_link);
>  		if (vma->tile_present && !(vma->gpuva.flags & XE_VMA_DESTROYED))
> -			list_move_tail(&vma->rebind_link, &vm->rebind_list);
> +			list_move_tail(&vma->combined_links.rebind,
> +				       &vm->rebind_list);
>  	}
>  	spin_unlock(&vm->notifier.list_lock);
>  
> @@ -608,7 +609,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	if (err)
>  		goto out_unlock;
>  
> -	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> +	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
>  		if (xe_vma_has_no_bo(vma) ||
>  		    vma->gpuva.flags & XE_VMA_DESTROYED)
>  			continue;
> @@ -780,17 +781,20 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  	list_for_each_entry_safe(vma, next, &vm->userptr.invalidated,
>  				 userptr.invalidate_link) {
>  		list_del_init(&vma->userptr.invalidate_link);
> -		list_move_tail(&vma->userptr_link, &vm->userptr.repin_list);
> +		if (list_empty(&vma->combined_links.userptr))
> +			list_move_tail(&vma->combined_links.userptr,
> +				       &vm->userptr.repin_list);
>  	}
>  	spin_unlock(&vm->userptr.invalidated_lock);
>  
>  	/* Pin and move to temporary list */
> -	list_for_each_entry_safe(vma, next, &vm->userptr.repin_list, userptr_link) {
> +	list_for_each_entry_safe(vma, next, &vm->userptr.repin_list,
> +				 combined_links.userptr) {
>  		err = xe_vma_userptr_pin_pages(vma);
>  		if (err < 0)
>  			goto out_err;
>  
> -		list_move_tail(&vma->userptr_link, &tmp_evict);
> +		list_move_tail(&vma->combined_links.userptr, &tmp_evict);
>  	}
>  
>  	/* Take lock and move to rebind_list for rebinding. */
> @@ -798,10 +802,8 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  	if (err)
>  		goto out_err;
>  
> -	list_for_each_entry_safe(vma, next, &tmp_evict, userptr_link) {
> -		list_del_init(&vma->userptr_link);
> -		list_move_tail(&vma->rebind_link, &vm->rebind_list);
> -	}
> +	list_for_each_entry_safe(vma, next, &tmp_evict, combined_links.userptr)
> +		list_move_tail(&vma->combined_links.rebind, &vm->rebind_list);
>  
>  	dma_resv_unlock(&vm->resv);
>  
> @@ -845,10 +847,11 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>  		return NULL;
>  
>  	xe_vm_assert_held(vm);
> -	list_for_each_entry_safe(vma, next, &vm->rebind_list, rebind_link) {
> +	list_for_each_entry_safe(vma, next, &vm->rebind_list,
> +				 combined_links.rebind) {
>  		XE_WARN_ON(!vma->tile_present);
>  
> -		list_del_init(&vma->rebind_link);
> +		list_del_init(&vma->combined_links.rebind);
>  		dma_fence_put(fence);
>  		if (rebind_worker)
>  			trace_xe_vma_rebind_worker(vma);
> @@ -883,9 +886,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  		return vma;
>  	}
>  
> -	INIT_LIST_HEAD(&vma->rebind_link);
> -	INIT_LIST_HEAD(&vma->unbind_link);
> -	INIT_LIST_HEAD(&vma->userptr_link);
> +	INIT_LIST_HEAD(&vma->combined_links.rebind);
>  	INIT_LIST_HEAD(&vma->userptr.invalidate_link);
>  	INIT_LIST_HEAD(&vma->notifier.rebind_link);
>  	INIT_LIST_HEAD(&vma->extobj.link);
> @@ -1058,15 +1059,14 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  
>  	lockdep_assert_held_write(&vm->lock);
> -	XE_BUG_ON(!list_empty(&vma->unbind_link));
> +	XE_BUG_ON(!list_empty(&vma->combined_links.destroy));
>  
>  	if (xe_vma_is_userptr(vma)) {
>  		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
>  
>  		spin_lock(&vm->userptr.invalidated_lock);
> -		list_del_init(&vma->userptr.invalidate_link);
> +		list_del(&vma->userptr.invalidate_link);
>  		spin_unlock(&vm->userptr.invalidated_lock);
> -		list_del(&vma->userptr_link);

this chunk has nothing to do with the combined_links, so it needs a separated patch.

>  	} else if (!xe_vma_is_null(vma)) {
>  		xe_bo_assert_held(xe_vma_bo(vma));
>  
> @@ -1087,9 +1087,6 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  	}
>  
>  	xe_vm_assert_held(vm);
> -	if (!list_empty(&vma->rebind_link))
> -		list_del(&vma->rebind_link);
> -
>  	if (fence) {
>  		int ret = dma_fence_add_callback(fence, &vma->destroy_cb,
>  						 vma_destroy_cb);
> @@ -1443,11 +1440,12 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  
>  		/* easy case, remove from VMA? */
>  		if (xe_vma_has_no_bo(vma) || xe_vma_bo(vma)->vm) {
> +			list_del_init(&vma->combined_links.rebind);
>  			xe_vma_destroy(vma, NULL);
>  			continue;
>  		}
>  
> -		list_add_tail(&vma->unbind_link, &contested);
> +		list_move_tail(&vma->combined_links.destroy, &contested);
>  	}
>  
>  	/*
> @@ -1475,8 +1473,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	 * Since we hold a refcount to the bo, we can remove and free
>  	 * the members safely without locking.
>  	 */
> -	list_for_each_entry_safe(vma, next_vma, &contested, unbind_link) {
> -		list_del_init(&vma->unbind_link);
> +	list_for_each_entry_safe(vma, next_vma, &contested,
> +				 combined_links.destroy) {
> +		list_del_init(&vma->combined_links.destroy);
>  		xe_vma_destroy_unlocked(vma);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index f17dc5d7370e..84bf1620214c 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -49,21 +49,19 @@ struct xe_vma {
>  	 */
>  	u64 tile_present;
>  
> -	/** @userptr_link: link into VM repin list if userptr */
> -	struct list_head userptr_link;
> -
> -	/**
> -	 * @rebind_link: link into VM if this VMA needs rebinding, and
> -	 * if it's a bo (not userptr) needs validation after a possible
> -	 * eviction. Protected by the vm's resv lock.
> -	 */
> -	struct list_head rebind_link;
> -
> -	/**
> -	 * @unbind_link: link or list head if an unbind of multiple VMAs, in
> -	 * single unbind op, is being done.
> -	 */
> -	struct list_head unbind_link;
> +	/** @combined_links: links into lists which are mutually exclusive */
> +	union {
> +		/** @userptr: link into VM repin list if userptr */
> +		struct list_head userptr;
> +		/**
> +		 * @rebind: link into VM if this VMA needs rebinding, and
> +		 * if it's a bo (not userptr) needs validation after a possible
> +		 * eviction. Protected by the vm's resv lock.
> +		 */
> +		struct list_head rebind;
> +		/** @destroy: link to contested list when VM is being closed */
> +		struct list_head destroy;
> +	} combined_links;

this is a good optimization, but from the organization point of view and naming
this is getting confused... if we could at least find a generic name that makes
sense for these mutual exclusive operations other then 'combined_links'.... :/

but well, I'm also not good with names.

with separated patches,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
on both...

>  
>  	/** @destroy_cb: callback to destroy VMA when unbind job is done */
>  	struct dma_fence_cb destroy_cb;
> -- 
> 2.34.1
> 
