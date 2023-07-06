Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6937FEB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3832C10E435;
	Thu,  6 Jul 2023 15:07:39 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C42410E435
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 15:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688656056; x=1720192056;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rNM/hULbMpD5Ss5HJRWRnXZSzIwdQAQtOhM6c9NT49A=;
 b=CL0p0DFUE9H0zaIHxt0qaLcNdaacS6hNcaD47qZ1xKtuKkWNdqaFx3cP
 IEHOJiqTlArVWJLOp3mXnw1sSFTXUmF2wgJCPrtW/jjKqcdmHaBSNKU46
 fxptJbqHlRN1p8lDuxa/EK82cdfA5Lq7eHas4nL7HC9nmq5RXzxjBA/F7
 deIzrdEYC3peC44Dr4MNDLnbSFSeJtJkvoCX2DlmVGmbUkAFmQ63P+wkB
 Rt5h+cAK2GHhIK7CdhPy63wEvHV0B4slX4tuKxb15tF0/YWVaGQ4dLvTB
 RagFraVBr8fdI8Qjmcsr/lejacpBep0YDiaUHYCuVHa3q9k/w+QCoRCeT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="367116678"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="367116678"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 08:07:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="784959881"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="784959881"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 06 Jul 2023 08:07:34 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 08:07:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 08:07:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 08:07:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=judAO1wKKvkPZerCAwWkxiz2iOgU4dDy1KeswUn8Pbh7cky+Rixd/FMSSuNqryOZ1gvStrPP7PWNE0E7uAbhv4v3HOqLm/S37a+2ifaI7VjNnfYL7K2+mHEmjg5MLAo4nC4Vh88elL88VK11X1rOof5gclR+Lc0usk3YTD6kUkEgkChbSu5XZ2MNJXl0lgBEAeuQotZRiGJ9ZPtU23LICgcs+st+K6QneNnT0w+lXI3QadF1tuPprQ5lcFJmf9V54NFI+t6XFRcihA92WgnAtUHjq01WHTffTeQ1bGQ3gfnnB3FG3BoMSCGYbzpanClfK2m+vGhMGTg4ri6ssvk5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3vKVZvFxZUUcmEO1cpXBajEMCgIyDqWeds0RuM3UW0=;
 b=IYj+no74WQvmhXvCD9JNArUH1j6z81njc1NOq06tFx90pY1j/r7ggrD6FzAbJ5NmeopHmVAkF71tXWsg+BF92ONqyXevzjgBAN2xQS4FaxtTLER9sBKNZW/UAAQNV6aFVGu7QnFiO9zlyEwqm36ZfojkQXtB5tbV69pp7fTxHX2uXEN0Imn076LJZcZBpXSAUIP5wQHF+oVB9RrNzYmuzLYDiBrQxO82e7Si9Y8+bvJZEBGY+LyibVlYewVvXdJaicqIaOyPE1VZejxD1cPFza7J3RFetAleOCBrmwRWOSsGsW62VuNZ4zi5PsKOrrruR9H/SW3qlXVaw7EZ+a4AHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4783.namprd11.prod.outlook.com (2603:10b6:a03:2af::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24; Thu, 6 Jul
 2023 15:07:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 15:07:30 +0000
Date: Thu, 6 Jul 2023 15:06:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZKbYirfyP4mYna5L@DUT025-TGLU.fm.intel.com>
References: <20230630175804.1096370-1-matthew.brost@intel.com>
 <20230630175804.1096370-3-matthew.brost@intel.com>
 <e29d3bcf-7efc-0e92-5d2f-226d6e1f6d67@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e29d3bcf-7efc-0e92-5d2f-226d6e1f6d67@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::41) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4783:EE_
X-MS-Office365-Filtering-Correlation-Id: 39675dea-ee2f-434a-fffc-08db7e32b801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vw1rjuK5unmN19FftMYsThWXnlKUAkFBNC9Y77bIXAUucQPuHqXushkCvCx4uQNvNcNbG3nW1Y5UpUFGnuJ79Nn+CAYz+Zm63UF7M5Q7Zx6vSvd1giJIYbdqdjfDvvV+4Uh6itIbT2yGEgkYvbD4gA6ZN+OQJxt8McQOtrESEumgl77WAiTtw8Cc3+mu2Vrwqokhb6zUq07HSGYixwP9Ss3SJcrTCpbGgB8zxy9FTdl8v5DetxU0KWCtEWW++ncF2xKX3HhCW0pndg3WAPvEEu4PSAYidFZFfnevPr7OC9o2xe2sUS+XS2ZZ7LY79P+Y1UQud8Xgrk8R0Bxk7AVl0u4mdLevgwHANKf+t313OCf5sH7l83zVOezDTMLYJhymqoYTuGislXlzDYv0ru1DDx/qYopwpgvaz3+XnFMdxsLWS7EozQbsJpqJLPtxwgWbL2TyhOGwYBwX4vO64C01uvFlvSvtoYzev7gzMTzI1E7023iz4VVUrqnEwnxZt3jkODR4G6onHtzo/I0/4qIuiAgzJ0A1pI6YU81hOo20Cnd6ZYh79FJOsyA+pdXKHttk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(376002)(366004)(396003)(451199021)(5660300002)(66476007)(66556008)(6916009)(4326008)(66946007)(44832011)(38100700002)(41300700001)(316002)(8936002)(8676002)(86362001)(30864003)(2906002)(6666004)(66574015)(6486002)(83380400001)(6506007)(26005)(53546011)(186003)(6512007)(82960400001)(478600001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+XSse4e8CRI4Dfb3UpKAtxASFivF5GjGPEFk3v3BQlG3AS5sQUsU6kj8kT?=
 =?iso-8859-1?Q?46oSviLh2yVurbX09BBbf66xt0A9Z0OjMAkq0oh0rS+6ZYKaz/btn1LRWl?=
 =?iso-8859-1?Q?FUq2UOinBXRTNvH3/vkU918aQ70jLD7MbKPRKD4UiORivHk/qmTRFPlUb+?=
 =?iso-8859-1?Q?sqq5UGxjUwW54HuMz+XewiQsXZilvadb87QghxcQyPv5jOJ6+/1BaYJ3DP?=
 =?iso-8859-1?Q?mb/YQMnTN0iwVrhR7fiSomDbJQplKHAwG09xq/yKTQYd0GTbF02m3Nss82?=
 =?iso-8859-1?Q?Vx/rOnOU/zRPEyOzB9///fQQQWRLEv5jCkuKsxSmA/qTg8Auw17TMwjDG6?=
 =?iso-8859-1?Q?ueohkxHo6dlYxHZLbowHy4v0ugH1FygNr7vO7RZKabM6sHXlMVmLUoKL6s?=
 =?iso-8859-1?Q?OxVZKB9PjW1rdIJO+s7AAP+WFkV+kVM0U3w4pOWykj2JjsP0k7l0mpB5P1?=
 =?iso-8859-1?Q?+Jod1VVd3MoAa8FPDG9Pms+poxW+OYgUNrxad9UWhh6Unk+dq3j+wKEfQa?=
 =?iso-8859-1?Q?QM4EFiwmKHQLb6kpQNu18V7IoptVxPcdF2WwsoHH49x4fKEuBPRnZqbe5L?=
 =?iso-8859-1?Q?FQM2GW7ts3Z64YHsO7Z0UjbvF8+1Zn87yJk1dsWIT5m5vmGSlj8XjX9Zxw?=
 =?iso-8859-1?Q?gBG0iEuHBz2ZzWdKP5V4oa2/bWE8KoVsLI5XZFnfQu6IqmW5b22gxhZJ8b?=
 =?iso-8859-1?Q?0+Ug/z+Oa7hx2ntbkflm68aRHe6rg1yhnlURSF8k2hV41GZja83u1ILocI?=
 =?iso-8859-1?Q?PPNyFZvsY3u7+SHkcP0LpNUs9ZLATizQJ9l13eyzab+zp4WedgeGBrnJd7?=
 =?iso-8859-1?Q?3dIVXq7PoooQapwGj8VznZfLCUKWEB9UjJvl4VLe3RGbkgEmvwAvz/7V1F?=
 =?iso-8859-1?Q?ghfLWkJDEUQnRueOnl7qnbPM1/rFcRQjkcYD48K1yhsFxWOhUxgwEmE8uo?=
 =?iso-8859-1?Q?FM59iTxRumx1xY6ULL4QEHMYtXi4+xJtt8oQ7WlKr+kI8l7FlqJZGxnBP4?=
 =?iso-8859-1?Q?XunY3oEa9Um2A/6cx0oKrWts4hp01Ko9YWzyRsPMmH9NiL8hAzi4hunpwI?=
 =?iso-8859-1?Q?M6XW0EqruLUlM1MHuAFcAd25ZFPmqpVaMM4WcCFXZvyn3Cfgshdq9twZyg?=
 =?iso-8859-1?Q?XcyOtevdsIPYY+ZRK5xnZTJXMdRTFwVqWXVIOykdqy71ZQxNE6B7xCkiPQ?=
 =?iso-8859-1?Q?SjnaIudf5Z4cL19CkYB7QO2ovuAd8x4YwFF2992sYp2fMVvgbmdHNMxiw5?=
 =?iso-8859-1?Q?ljflQtWwPA3WR5fQhYh+DXH+m3RRyGCYfCxyW9+MMdOjh4jl783YebQx4H?=
 =?iso-8859-1?Q?iQZJsMliRU4VGP1QhotbFQ1UWwEr5SbNQpzkeI7U9Nu1UtbOqGd0P/pnQX?=
 =?iso-8859-1?Q?riWk2tmkwX3W4wPnDhOokegWzNs2t/FpQKvjwfMtHOh8Cplc+lsIanpWbC?=
 =?iso-8859-1?Q?X3U4XFopa+/WKmWudJnBF9BqUvoW/uSBzIDeVPvIzlwLSxrxMGL/WmLHCr?=
 =?iso-8859-1?Q?iJvXSqXNiwp/WJLwiDDGkjn8tVYoIgu1H+lDkWMRYofG1xzpPYOXpnr30R?=
 =?iso-8859-1?Q?C2cIt0/n5RrPYLvp6PpwXdg9faMQNCNs4/dKLUmAv6lZ60w7/fohW4d0Zi?=
 =?iso-8859-1?Q?D/xt/vEwdbNVPqRLDOpLPHT1tLXQt/3mopLsFrz5O0yQlrMZ0KrT5ZTQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39675dea-ee2f-434a-fffc-08db7e32b801
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 15:07:30.5093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jo/ASUcutxkVOTzUFXAC4Is69/m1/uTtYLO6DiSPHb9HNUahz/fJtwlEp45f4m7orJXEH/dvUmwQfDWlG/YsGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4783
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/9] drm/xe: Add helpers to hide struct
 xe_vma internals
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

On Thu, Jul 06, 2023 at 03:22:43PM +0200, Thomas Hellström wrote:
> 
> On 6/30/23 19:57, Matthew Brost wrote:
> > This will help with the GPUVA port as the internals of struct xe_vma
> > will change.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo.c                  |   4 +-
> >   drivers/gpu/drm/xe/xe_exec.c                |   2 +-
> >   drivers/gpu/drm/xe/xe_gt_pagefault.c        |   7 +-
> >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  14 +-
> >   drivers/gpu/drm/xe/xe_pt.c                  |  88 +++++------
> >   drivers/gpu/drm/xe/xe_trace.h               |  10 +-
> >   drivers/gpu/drm/xe/xe_vm.c                  | 163 ++++++++++----------
> >   drivers/gpu/drm/xe/xe_vm.h                  |  76 +++++++--
> >   drivers/gpu/drm/xe/xe_vm_madvise.c          |  12 +-
> >   9 files changed, 211 insertions(+), 165 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 71a14e1f25be..0cd179ba41a5 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -411,7 +411,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
> >   	}
> >   	list_for_each_entry(vma, &bo->vmas, bo_link) {
> > -		struct xe_vm *vm = vma->vm;
> > +		struct xe_vm *vm = xe_vma_vm(vma);
> >   		trace_xe_vma_evict(vma);
> > @@ -439,7 +439,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
> >   		} else {
> >   			bool vm_resv_locked = false;
> > -			struct xe_vm *vm = vma->vm;
> > +			struct xe_vm *vm = xe_vma_vm(vma);
> >   			/*
> >   			 * We need to put the vma on the vm's rebind_list,
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index bdf00e59e7a4..ba13d20ed348 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -126,7 +126,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> >   		if (xe_vma_is_userptr(vma))
> >   			continue;
> > -		err = xe_bo_validate(vma->bo, vm, false);
> > +		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
> >   		if (err) {
> >   			xe_vm_unlock_dma_resv(vm, tv_onstack, *tv, ww, objs);
> >   			*tv = NULL;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index 6faebd02f3fb..0e91ab67d617 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -77,7 +77,8 @@ static bool vma_is_valid(struct xe_gt *gt, struct xe_vma *vma)
> >   static bool vma_matches(struct xe_vma *vma, struct xe_vma *lookup)
> >   {
> > -	if (lookup->start > vma->end || lookup->end < vma->start)
> > +	if (xe_vma_start(lookup) > xe_vma_end(vma) - 1 ||
> > +	    xe_vma_end(lookup) - 1 < xe_vma_start(vma))
> >   		return false;
> >   	return true;
> > @@ -171,7 +172,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> >   	}
> >   	/* Lock VM and BOs dma-resv */
> > -	bo = vma->bo;
> > +	bo = xe_vma_bo(vma);
> >   	if (only_needs_bo_lock(bo)) {
> >   		/* This path ensures the BO's LRU is updated */
> >   		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> > @@ -538,7 +539,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
> >   		goto unlock_vm;
> >   	/* Lock VM and BOs dma-resv */
> > -	bo = vma->bo;
> > +	bo = xe_vma_bo(vma);
> >   	if (only_needs_bo_lock(bo)) {
> >   		/* This path ensures the BO's LRU is updated */
> >   		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 2fcb477604e2..f77368a16409 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -203,8 +203,8 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> >   	if (!xe->info.has_range_tlb_invalidation) {
> >   		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
> >   	} else {
> > -		u64 start = vma->start;
> > -		u64 length = vma->end - vma->start + 1;
> > +		u64 start = xe_vma_start(vma);
> > +		u64 length = xe_vma_size(vma);
> >   		u64 align, end;
> >   		if (length < SZ_4K)
> > @@ -217,12 +217,12 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> >   		 * address mask covering the required range.
> >   		 */
> >   		align = roundup_pow_of_two(length);
> > -		start = ALIGN_DOWN(vma->start, align);
> > -		end = ALIGN(vma->start + length, align);
> > +		start = ALIGN_DOWN(xe_vma_start(vma), align);
> > +		end = ALIGN(xe_vma_end(vma), align);
> >   		length = align;
> >   		while (start + length < end) {
> >   			length <<= 1;
> > -			start = ALIGN_DOWN(vma->start, length);
> > +			start = ALIGN_DOWN(xe_vma_start(vma), length);
> >   		}
> >   		/*
> > @@ -231,7 +231,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> >   		 */
> >   		if (length >= SZ_2M) {
> >   			length = max_t(u64, SZ_16M, length);
> > -			start = ALIGN_DOWN(vma->start, length);
> > +			start = ALIGN_DOWN(xe_vma_start(vma), length);
> >   		}
> >   		XE_BUG_ON(length < SZ_4K);
> > @@ -240,7 +240,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> >   		XE_BUG_ON(!IS_ALIGNED(start, length));
> >   		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> > -		action[len++] = vma->vm->usm.asid;
> > +		action[len++] = xe_vma_vm(vma)->usm.asid;
> >   		action[len++] = lower_32_bits(start);
> >   		action[len++] = upper_32_bits(start);
> >   		action[len++] = ilog2(length) - ilog2(SZ_4K);
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index fe1c77b139e4..a697d43ec293 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -96,7 +96,7 @@ static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
> >   				&cur);
> >   		return xe_res_dma(&cur) + offset;
> >   	} else {
> > -		return xe_bo_addr(vma->bo, offset, page_size, is_vram);
> > +		return xe_bo_addr(xe_vma_bo(vma), offset, page_size, is_vram);
> >   	}
> >   }
> > @@ -749,7 +749,7 @@ static int
> >   xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> >   		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
> >   {
> > -	struct xe_bo *bo = vma->bo;
> > +	struct xe_bo *bo = xe_vma_bo(vma);
> >   	bool is_vram = !xe_vma_is_userptr(vma) && bo && xe_bo_is_vram(bo);
> >   	struct xe_res_cursor curs;
> >   	struct xe_pt_stage_bind_walk xe_walk = {
> > @@ -758,15 +758,15 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> >   			.shifts = xe_normal_pt_shifts,
> >   			.max_level = XE_PT_HIGHEST_LEVEL,
> >   		},
> > -		.vm = vma->vm,
> > +		.vm = xe_vma_vm(vma),
> >   		.tile = tile,
> >   		.curs = &curs,
> > -		.va_curs_start = vma->start,
> > +		.va_curs_start = xe_vma_start(vma),
> >   		.pte_flags = vma->pte_flags,
> >   		.wupd.entries = entries,
> > -		.needs_64K = (vma->vm->flags & XE_VM_FLAGS_64K) && is_vram,
> > +		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAGS_64K) && is_vram,
> >   	};
> > -	struct xe_pt *pt = vma->vm->pt_root[tile->id];
> > +	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> >   	int ret;
> >   	if (is_vram) {
> > @@ -788,20 +788,20 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> >   	if (!xe_vma_is_null(vma)) {
> >   		if (xe_vma_is_userptr(vma))
> > -			xe_res_first_sg(vma->userptr.sg, 0,
> > -					vma->end - vma->start + 1, &curs);
> > +			xe_res_first_sg(vma->userptr.sg, 0, xe_vma_size(vma),
> > +					&curs);
> >   		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
> > -			xe_res_first(bo->ttm.resource, vma->bo_offset,
> > -				     vma->end - vma->start + 1, &curs);
> > +			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
> > +				     xe_vma_size(vma), &curs);
> >   		else
> > -			xe_res_first_sg(xe_bo_get_sg(bo), vma->bo_offset,
> > -					vma->end - vma->start + 1, &curs);
> > +			xe_res_first_sg(xe_bo_get_sg(bo), xe_vma_bo_offset(vma),
> > +					xe_vma_size(vma), &curs);
> >   	} else {
> > -		curs.size = vma->end - vma->start + 1;
> > +		curs.size = xe_vma_size(vma);
> >   	}
> > -	ret = xe_pt_walk_range(&pt->base, pt->level, vma->start, vma->end + 1,
> > -				&xe_walk.base);
> > +	ret = xe_pt_walk_range(&pt->base, pt->level, xe_vma_start(vma),
> > +			       xe_vma_end(vma), &xe_walk.base);
> >   	*num_entries = xe_walk.wupd.num_used_entries;
> >   	return ret;
> > @@ -933,13 +933,13 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
> >   		},
> >   		.tile = tile,
> >   	};
> > -	struct xe_pt *pt = vma->vm->pt_root[tile->id];
> > +	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> >   	if (!(vma->tile_present & BIT(tile->id)))
> >   		return false;
> > -	(void)xe_pt_walk_shared(&pt->base, pt->level, vma->start, vma->end + 1,
> > -				 &xe_walk.base);
> > +	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
> > +				xe_vma_end(vma), &xe_walk.base);
> >   	return xe_walk.needs_invalidate;
> >   }
> > @@ -974,21 +974,21 @@ static void xe_pt_abort_bind(struct xe_vma *vma,
> >   			continue;
> >   		for (j = 0; j < entries[i].qwords; j++)
> > -			xe_pt_destroy(entries[i].pt_entries[j].pt, vma->vm->flags, NULL);
> > +			xe_pt_destroy(entries[i].pt_entries[j].pt, xe_vma_vm(vma)->flags, NULL);
> >   		kfree(entries[i].pt_entries);
> >   	}
> >   }
> >   static void xe_pt_commit_locks_assert(struct xe_vma *vma)
> >   {
> > -	struct xe_vm *vm = vma->vm;
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> >   	lockdep_assert_held(&vm->lock);
> >   	if (xe_vma_is_userptr(vma))
> >   		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> >   	else if (!xe_vma_is_null(vma))
> > -		dma_resv_assert_held(vma->bo->ttm.base.resv);
> > +		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
> >   	dma_resv_assert_held(&vm->resv);
> >   }
> > @@ -1021,7 +1021,7 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
> >   			if (xe_pt_entry(pt_dir, j_))
> >   				xe_pt_destroy(xe_pt_entry(pt_dir, j_),
> > -					      vma->vm->flags, deferred);
> > +					      xe_vma_vm(vma)->flags, deferred);
> >   			pt_dir->dir.entries[j_] = &newpte->base;
> >   		}
> > @@ -1082,7 +1082,7 @@ static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
> >   	static u32 count;
> >   	if (count++ % divisor == divisor - 1) {
> > -		struct xe_vm *vm = vma->vm;
> > +		struct xe_vm *vm = xe_vma_vm(vma);
> >   		vma->userptr.divisor = divisor << 1;
> >   		spin_lock(&vm->userptr.invalidated_lock);
> > @@ -1125,7 +1125,7 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
> >   		container_of(pt_update, typeof(*userptr_update), base);
> >   	struct xe_vma *vma = pt_update->vma;
> >   	unsigned long notifier_seq = vma->userptr.notifier_seq;
> > -	struct xe_vm *vm = vma->vm;
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> >   	userptr_update->locked = false;
> > @@ -1296,19 +1296,19 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
> >   		},
> >   		.bind = true,
> >   	};
> > -	struct xe_vm *vm = vma->vm;
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> >   	u32 num_entries;
> >   	struct dma_fence *fence;
> >   	struct invalidation_fence *ifence = NULL;
> >   	int err;
> >   	bind_pt_update.locked = false;
> > -	xe_bo_assert_held(vma->bo);
> > +	xe_bo_assert_held(xe_vma_bo(vma));
> >   	xe_vm_assert_held(vm);
> > -	vm_dbg(&vma->vm->xe->drm,
> > +	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> >   	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
> > -	       vma->start, vma->end, e);
> > +	       xe_vma_start(vma), xe_vma_end(vma) - 1, e);
> >   	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries, rebind);
> >   	if (err)
> > @@ -1337,7 +1337,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
> >   	}
> >   	fence = xe_migrate_update_pgtables(tile->migrate,
> > -					   vm, vma->bo,
> > +					   vm, xe_vma_bo(vma),
> >   					   e ? e : vm->eng[tile->id],
> >   					   entries, num_entries,
> >   					   syncs, num_syncs,
> > @@ -1363,8 +1363,8 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
> >   				   DMA_RESV_USAGE_KERNEL :
> >   				   DMA_RESV_USAGE_BOOKKEEP);
> > -		if (!xe_vma_has_no_bo(vma) && !vma->bo->vm)
> > -			dma_resv_add_fence(vma->bo->ttm.base.resv, fence,
> > +		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> > +			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> >   					   DMA_RESV_USAGE_BOOKKEEP);
> >   		xe_pt_commit_bind(vma, entries, num_entries, rebind,
> >   				  bind_pt_update.locked ? &deferred : NULL);
> > @@ -1526,14 +1526,14 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
> >   			.max_level = XE_PT_HIGHEST_LEVEL,
> >   		},
> >   		.tile = tile,
> > -		.modified_start = vma->start,
> > -		.modified_end = vma->end + 1,
> > +		.modified_start = xe_vma_start(vma),
> > +		.modified_end = xe_vma_end(vma),
> >   		.wupd.entries = entries,
> >   	};
> > -	struct xe_pt *pt = vma->vm->pt_root[tile->id];
> > +	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > -	(void)xe_pt_walk_shared(&pt->base, pt->level, vma->start, vma->end + 1,
> > -				 &xe_walk.base);
> > +	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
> > +				xe_vma_end(vma), &xe_walk.base);
> >   	return xe_walk.wupd.num_used_entries;
> >   }
> > @@ -1545,7 +1545,7 @@ xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
> >   				  const struct xe_vm_pgtable_update *update)
> >   {
> >   	struct xe_vma *vma = pt_update->vma;
> > -	u64 empty = __xe_pt_empty_pte(tile, vma->vm, update->pt->level);
> > +	u64 empty = __xe_pt_empty_pte(tile, xe_vma_vm(vma), update->pt->level);
> >   	int i;
> >   	if (map && map->is_iomem)
> > @@ -1581,7 +1581,7 @@ xe_pt_commit_unbind(struct xe_vma *vma,
> >   			     i++) {
> >   				if (xe_pt_entry(pt_dir, i))
> >   					xe_pt_destroy(xe_pt_entry(pt_dir, i),
> > -						      vma->vm->flags, deferred);
> > +						      xe_vma_vm(vma)->flags, deferred);
> >   				pt_dir->dir.entries[i] = NULL;
> >   			}
> > @@ -1630,18 +1630,18 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
> >   			.vma = vma,
> >   		},
> >   	};
> > -	struct xe_vm *vm = vma->vm;
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> >   	u32 num_entries;
> >   	struct dma_fence *fence = NULL;
> >   	struct invalidation_fence *ifence;
> >   	LLIST_HEAD(deferred);
> > -	xe_bo_assert_held(vma->bo);
> > +	xe_bo_assert_held(xe_vma_bo(vma));
> >   	xe_vm_assert_held(vm);
> > -	vm_dbg(&vma->vm->xe->drm,
> > +	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> >   	       "Preparing unbind, with range [%llx...%llx) engine %p.\n",
> > -	       vma->start, vma->end, e);
> > +	       xe_vma_start(vma), xe_vma_end(vma) - 1, e);
> >   	num_entries = xe_pt_stage_unbind(tile, vma, entries);
> >   	XE_BUG_ON(num_entries > ARRAY_SIZE(entries));
> > @@ -1680,8 +1680,8 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
> >   				   DMA_RESV_USAGE_BOOKKEEP);
> >   		/* This fence will be installed by caller when doing eviction */
> > -		if (!xe_vma_has_no_bo(vma) && !vma->bo->vm)
> > -			dma_resv_add_fence(vma->bo->ttm.base.resv, fence,
> > +		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> > +			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> >   					   DMA_RESV_USAGE_BOOKKEEP);
> >   		xe_pt_commit_unbind(vma, entries, num_entries,
> >   				    unbind_pt_update.locked ? &deferred : NULL);
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index ca96a0a4bb80..b3828e2f0aab 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -18,7 +18,7 @@
> >   #include "xe_gt_types.h"
> >   #include "xe_guc_engine_types.h"
> >   #include "xe_sched_job.h"
> > -#include "xe_vm_types.h"
> > +#include "xe_vm.h"
> >   DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
> >   		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
> > @@ -373,10 +373,10 @@ DECLARE_EVENT_CLASS(xe_vma,
> >   		    TP_fast_assign(
> >   			   __entry->vma = (unsigned long)vma;
> > -			   __entry->asid = vma->vm->usm.asid;
> > -			   __entry->start = vma->start;
> > -			   __entry->end = vma->end;
> > -			   __entry->ptr = (u64)vma->userptr.ptr;
> > +			   __entry->asid = xe_vma_vm(vma)->usm.asid;
> > +			   __entry->start = xe_vma_start(vma);
> > +			   __entry->end = xe_vma_end(vma) - 1;
> > +			   __entry->ptr = xe_vma_userptr(vma);
> >   			   ),
> >   		    TP_printk("vma=0x%016llx, asid=0x%05x, start=0x%012llx, end=0x%012llx, ptr=0x%012llx,",
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 3c8a48f9a0d3..7be4436272f7 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -53,15 +53,14 @@ int xe_vma_userptr_check_repin(struct xe_vma *vma)
> >   int xe_vma_userptr_pin_pages(struct xe_vma *vma)
> >   {
> > -	struct xe_vm *vm = vma->vm;
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> >   	struct xe_device *xe = vm->xe;
> > -	const unsigned long num_pages =
> > -		(vma->end - vma->start + 1) >> PAGE_SHIFT;
> > +	const unsigned long num_pages = xe_vma_size(vma) >> PAGE_SHIFT;
> >   	struct page **pages;
> >   	bool in_kthread = !current->mm;
> >   	unsigned long notifier_seq;
> >   	int pinned, ret, i;
> > -	bool read_only = vma->pte_flags & XE_PTE_FLAG_READ_ONLY;
> > +	bool read_only = xe_vma_read_only(vma);
> >   	lockdep_assert_held(&vm->lock);
> >   	XE_BUG_ON(!xe_vma_is_userptr(vma));
> > @@ -96,7 +95,8 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
> >   	}
> >   	while (pinned < num_pages) {
> > -		ret = get_user_pages_fast(vma->userptr.ptr + pinned * PAGE_SIZE,
> > +		ret = get_user_pages_fast(xe_vma_userptr(vma) +
> > +					  pinned * PAGE_SIZE,
> >   					  num_pages - pinned,
> >   					  read_only ? 0 : FOLL_WRITE,
> >   					  &pages[pinned]);
> > @@ -299,7 +299,7 @@ void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
> >   	struct xe_vma *vma;
> >   	list_for_each_entry(vma, &vm->extobj.list, extobj.link)
> > -		dma_resv_add_fence(vma->bo->ttm.base.resv, fence, usage);
> > +		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence, usage);
> >   }
> >   static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
> > @@ -448,7 +448,7 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> >   	INIT_LIST_HEAD(objs);
> >   	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
> >   		tv_bo->num_shared = num_shared;
> > -		tv_bo->bo = &vma->bo->ttm;
> > +		tv_bo->bo = &xe_vma_bo(vma)->ttm;
> >   		list_add_tail(&tv_bo->head, objs);
> >   		tv_bo++;
> > @@ -463,7 +463,7 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> >   	spin_lock(&vm->notifier.list_lock);
> >   	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
> >   				 notifier.rebind_link) {
> > -		xe_bo_assert_held(vma->bo);
> > +		xe_bo_assert_held(xe_vma_bo(vma));
> >   		list_del_init(&vma->notifier.rebind_link);
> >   		if (vma->tile_present && !vma->destroyed)
> > @@ -612,7 +612,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> >   		if (xe_vma_has_no_bo(vma) || vma->destroyed)
> >   			continue;
> > -		err = xe_bo_validate(vma->bo, vm, false);
> > +		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
> >   		if (err)
> >   			goto out_unlock;
> >   	}
> > @@ -704,7 +704,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
> >   				   unsigned long cur_seq)
> >   {
> >   	struct xe_vma *vma = container_of(mni, struct xe_vma, userptr.notifier);
> > -	struct xe_vm *vm = vma->vm;
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> >   	struct dma_resv_iter cursor;
> >   	struct dma_fence *fence;
> >   	long err;
> > @@ -923,7 +923,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >   			err = mmu_interval_notifier_insert(&vma->userptr.notifier,
> >   							   current->mm,
> > -							   vma->userptr.ptr, size,
> > +							   xe_vma_userptr(vma), size,
> >   							   &vma_userptr_notifier_ops);
> >   			if (err) {
> >   				kfree(vma);
> > @@ -943,7 +943,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >   static bool vm_remove_extobj(struct xe_vma *vma)
> >   {
> >   	if (!list_empty(&vma->extobj.link)) {
> > -		vma->vm->extobj.entries--;
> > +		xe_vma_vm(vma)->extobj.entries--;
> >   		list_del_init(&vma->extobj.link);
> >   		return true;
> >   	}
> > @@ -952,9 +952,9 @@ static bool vm_remove_extobj(struct xe_vma *vma)
> >   static void xe_vma_destroy_late(struct xe_vma *vma)
> >   {
> > -	struct xe_vm *vm = vma->vm;
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> >   	struct xe_device *xe = vm->xe;
> > -	bool read_only = vma->pte_flags & XE_PTE_FLAG_READ_ONLY;
> > +	bool read_only = xe_vma_read_only(vma);
> >   	if (xe_vma_is_userptr(vma)) {
> >   		if (vma->userptr.sg) {
> > @@ -976,7 +976,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
> >   	} else if (xe_vma_is_null(vma)) {
> >   		xe_vm_put(vm);
> >   	} else {
> > -		xe_bo_put(vma->bo);
> > +		xe_bo_put(xe_vma_bo(vma));
> >   	}
> >   	kfree(vma);
> > @@ -997,7 +997,7 @@ bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
> >   	struct xe_vma *vma;
> >   	list_for_each_entry(vma, &bo->vmas, bo_link) {
> > -		if (vma != ignore && vma->vm == vm)
> > +		if (vma != ignore && xe_vma_vm(vma) == vm)
> >   			return vma;
> >   	}
> > @@ -1025,7 +1025,7 @@ static void __vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
> >   static void vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
> >   {
> > -	struct xe_bo *bo = vma->bo;
> > +	struct xe_bo *bo = xe_vma_bo(vma);
> >   	lockdep_assert_held_write(&vm->lock);
> > @@ -1046,7 +1046,7 @@ static void vma_destroy_cb(struct dma_fence *fence,
> >   static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> >   {
> > -	struct xe_vm *vm = vma->vm;
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> >   	lockdep_assert_held_write(&vm->lock);
> >   	XE_BUG_ON(!list_empty(&vma->unbind_link));
> > @@ -1058,17 +1058,17 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> >   		spin_unlock(&vm->userptr.invalidated_lock);
> >   		list_del(&vma->userptr_link);
> >   	} else if (!xe_vma_is_null(vma)) {
> > -		xe_bo_assert_held(vma->bo);
> > +		xe_bo_assert_held(xe_vma_bo(vma));
> >   		list_del(&vma->bo_link);
> >   		spin_lock(&vm->notifier.list_lock);
> >   		list_del(&vma->notifier.rebind_link);
> >   		spin_unlock(&vm->notifier.list_lock);
> > -		if (!vma->bo->vm && vm_remove_extobj(vma)) {
> > +		if (!xe_vma_bo(vma)->vm && vm_remove_extobj(vma)) {
> >   			struct xe_vma *other;
> > -			other = bo_has_vm_references_locked(vma->bo, vm, NULL);
> > +			other = bo_has_vm_references_locked(xe_vma_bo(vma), vm, NULL);
> >   			if (other)
> >   				__vm_insert_extobj(vm, other);
> > @@ -1096,13 +1096,13 @@ static void xe_vma_destroy_unlocked(struct xe_vma *vma)
> >   {
> >   	struct ttm_validate_buffer tv[2];
> >   	struct ww_acquire_ctx ww;
> > -	struct xe_bo *bo = vma->bo;
> > +	struct xe_bo *bo = xe_vma_bo(vma);
> >   	LIST_HEAD(objs);
> >   	LIST_HEAD(dups);
> >   	int err;
> >   	memset(tv, 0, sizeof(tv));
> > -	tv[0].bo = xe_vm_ttm_bo(vma->vm);
> > +	tv[0].bo = xe_vm_ttm_bo(xe_vma_vm(vma));
> >   	list_add(&tv[0].head, &objs);
> >   	if (bo) {
> > @@ -1125,11 +1125,11 @@ static struct xe_vma *to_xe_vma(const struct rb_node *node)
> >   	return (struct xe_vma *)node;
> >   }
> > -static int xe_vma_cmp(const struct xe_vma *a, const struct xe_vma *b)
> > +static int xe_vma_cmp(struct xe_vma *a, struct xe_vma *b)
> >   {
> > -	if (a->end < b->start) {
> > +	if (xe_vma_end(a) - 1 < xe_vma_start(b)) {
> >   		return -1;
> > -	} else if (b->end < a->start) {
> > +	} else if (xe_vma_end(b) - 1 < xe_vma_start(a)) {
> >   		return 1;
> >   	} else {
> >   		return 0;
> > @@ -1144,19 +1144,19 @@ static bool xe_vma_less_cb(struct rb_node *a, const struct rb_node *b)
> >   int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node)
> >   {
> >   	struct xe_vma *cmp = to_xe_vma(node);
> > -	const struct xe_vma *own = key;
> > +	struct xe_vma *own = (struct xe_vma *)key;
> > -	if (own->start > cmp->end)
> > +	if (xe_vma_start(own) > xe_vma_end(cmp) - 1)
> >   		return 1;
> > -	if (own->end < cmp->start)
> > +	if (xe_vma_end(own) - 1 < xe_vma_start(cmp))
> >   		return -1;
> >   	return 0;
> >   }
> >   struct xe_vma *
> > -xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma)
> > +xe_vm_find_overlapping_vma(struct xe_vm *vm, struct xe_vma *vma)
> >   {
> >   	struct rb_node *node;
> > @@ -1165,7 +1165,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma)
> >   	if (xe_vm_is_closed_or_banned(vm))
> >   		return NULL;
> > -	XE_BUG_ON(vma->end >= vm->size);
> > +	XE_BUG_ON(xe_vma_end(vma) > vm->size);
> >   	node = rb_find(vma, &vm->vmas, xe_vma_cmp_vma_cb);
> > @@ -1174,7 +1174,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma)
> >   static void xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
> >   {
> > -	XE_BUG_ON(vma->vm != vm);
> > +	XE_BUG_ON(xe_vma_vm(vma) != vm);
> >   	lockdep_assert_held(&vm->lock);
> >   	rb_add(&vma->vm_node, &vm->vmas, xe_vma_less_cb);
> > @@ -1182,7 +1182,7 @@ static void xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
> >   static void xe_vm_remove_vma(struct xe_vm *vm, struct xe_vma *vma)
> >   {
> > -	XE_BUG_ON(vma->vm != vm);
> > +	XE_BUG_ON(xe_vma_vm(vma) != vm);
> >   	lockdep_assert_held(&vm->lock);
> >   	rb_erase(&vma->vm_node, &vm->vmas);
> > @@ -1436,7 +1436,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >   		rb_erase(&vma->vm_node, &vm->vmas);
> >   		/* easy case, remove from VMA? */
> > -		if (xe_vma_has_no_bo(vma) || vma->bo->vm) {
> > +		if (xe_vma_has_no_bo(vma) || xe_vma_bo(vma)->vm) {
> >   			xe_vma_destroy(vma, NULL);
> >   			continue;
> >   		}
> > @@ -1576,7 +1576,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
> >   	struct dma_fence *fence = NULL;
> >   	struct dma_fence **fences = NULL;
> >   	struct dma_fence_array *cf = NULL;
> > -	struct xe_vm *vm = vma->vm;
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> >   	int cur_fence = 0, i;
> >   	int number_tiles = hweight_long(vma->tile_present);
> >   	int err;
> > @@ -1646,7 +1646,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
> >   	struct dma_fence *fence;
> >   	struct dma_fence **fences = NULL;
> >   	struct dma_fence_array *cf = NULL;
> > -	struct xe_vm *vm = vma->vm;
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> >   	int cur_fence = 0, i;
> >   	int number_tiles = hweight_long(vma->tile_mask);
> >   	int err;
> > @@ -1832,7 +1832,7 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> >   	struct dma_fence *fence;
> >   	xe_vm_assert_held(vm);
> > -	xe_bo_assert_held(vma->bo);
> > +	xe_bo_assert_held(xe_vma_bo(vma));
> >   	fence = xe_vm_unbind_vma(vma, e, syncs, num_syncs);
> >   	if (IS_ERR(fence))
> > @@ -2071,13 +2071,13 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> >   	XE_BUG_ON(region > ARRAY_SIZE(region_to_mem_type));
> >   	if (!xe_vma_has_no_bo(vma)) {
> > -		err = xe_bo_migrate(vma->bo, region_to_mem_type[region]);
> > +		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
> >   		if (err)
> >   			return err;
> >   	}
> >   	if (vma->tile_mask != (vma->tile_present & ~vma->usm.tile_invalidated)) {
> > -		return xe_vm_bind(vm, vma, e, vma->bo, syncs, num_syncs,
> > +		return xe_vm_bind(vm, vma, e, xe_vma_bo(vma), syncs, num_syncs,
> >   				  afence);
> >   	} else {
> >   		int i;
> > @@ -2173,7 +2173,7 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
> >   	xe_vm_tv_populate(vm, &tv_vm);
> >   	list_add_tail(&tv_vm.head, &objs);
> > -	vbo = vma->bo;
> > +	vbo = xe_vma_bo(vma);
> >   	if (vbo) {
> >   		/*
> >   		 * An unbind can drop the last reference to the BO and
> > @@ -2533,7 +2533,7 @@ static int vm_bind_ioctl_async(struct xe_vm *vm, struct xe_vma *vma,
> >   		} else {
> >   			bind_op->op = XE_VM_BIND_FLAG_ASYNC |
> >   				XE_VM_BIND_OP_MAP;
> > -			xe_bo_get(__vma->bo);
> > +			xe_bo_get(xe_vma_bo(__vma));
> >   		}
> >   		if (!last) {
> > @@ -2543,7 +2543,7 @@ static int vm_bind_ioctl_async(struct xe_vm *vm, struct xe_vma *vma,
> >   		}
> >   		err = __vm_bind_ioctl_async(vm, __vma, e,
> > -					    __vma->bo, bind_op, last ?
> > +					    xe_vma_bo(__vma), bind_op, last ?
> >   					    out_syncs : NULL,
> >   					    last ? num_out_syncs : 0);
> >   		if (err) {
> > @@ -2590,8 +2590,8 @@ static int __vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
> >   	case XE_VM_BIND_OP_PREFETCH:
> >   		vma = xe_vm_find_overlapping_vma(vm, &lookup);
> >   		if (XE_IOCTL_ERR(xe, !vma) ||
> > -		    XE_IOCTL_ERR(xe, (vma->start != addr ||
> > -				 vma->end != addr + range - 1) && !async))
> > +		    XE_IOCTL_ERR(xe, (xe_vma_start(vma) != addr ||
> > +				 xe_vma_end(vma) != addr + range) && !async))
> >   			return -EINVAL;
> >   		break;
> >   	case XE_VM_BIND_OP_UNMAP_ALL:
> > @@ -2616,9 +2616,9 @@ static int prep_replacement_vma(struct xe_vm *vm, struct xe_vma *vma)
> >   {
> >   	int err;
> > -	if (vma->bo && !vma->bo->vm) {
> > +	if (xe_vma_bo(vma) && !xe_vma_bo(vma)->vm) {
> >   		vm_insert_extobj(vm, vma);
> > -		err = add_preempt_fences(vm, vma->bo);
> > +		err = add_preempt_fences(vm, xe_vma_bo(vma));
> >   		if (err)
> >   			return err;
> >   	}
> > @@ -2667,25 +2667,25 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
> >   		}
> >   	}
> > -	if (first->start != lookup->start) {
> > +	if (xe_vma_start(first) != xe_vma_start(lookup)) {
> >   		struct ww_acquire_ctx ww;
> > -		if (first->bo)
> > -			err = xe_bo_lock(first->bo, &ww, 0, true);
> > +		if (xe_vma_bo(first))
> > +			err = xe_bo_lock(xe_vma_bo(first), &ww, 0, true);
> >   		if (err)
> >   			goto unwind;
> > -		new_first = xe_vma_create(first->vm, first->bo,
> > -					  first->bo ? first->bo_offset :
> > -					  first->userptr.ptr,
> > -					  first->start,
> > -					  lookup->start - 1,
> > -					  (first->pte_flags &
> > -					   XE_PTE_FLAG_READ_ONLY),
> > +		new_first = xe_vma_create(xe_vma_vm(first), xe_vma_bo(first),
> > +					  xe_vma_bo(first) ?
> > +					  xe_vma_bo_offset(first) :
> > +					  xe_vma_userptr(first),
> > +					  xe_vma_start(first),
> > +					  xe_vma_start(lookup) - 1,
> > +					  xe_vma_read_only(first),
> >   					  (first->pte_flags &
> >   					   XE_PTE_FLAG_NULL),
> >   					  first->tile_mask);
> > -		if (first->bo)
> > -			xe_bo_unlock(first->bo, &ww);
> > +		if (xe_vma_bo(first))
> > +			xe_bo_unlock(xe_vma_bo(first), &ww);
> >   		if (!new_first) {
> >   			err = -ENOMEM;
> >   			goto unwind;
> > @@ -2700,25 +2700,25 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
> >   			goto unwind;
> >   	}
> > -	if (last->end != lookup->end) {
> > +	if (xe_vma_end(last) != xe_vma_end(lookup)) {
> >   		struct ww_acquire_ctx ww;
> > -		u64 chunk = lookup->end + 1 - last->start;
> > +		u64 chunk = xe_vma_end(lookup) - xe_vma_start(last);
> > -		if (last->bo)
> > -			err = xe_bo_lock(last->bo, &ww, 0, true);
> > +		if (xe_vma_bo(last))
> > +			err = xe_bo_lock(xe_vma_bo(last), &ww, 0, true);
> >   		if (err)
> >   			goto unwind;
> > -		new_last = xe_vma_create(last->vm, last->bo,
> > -					 last->bo ? last->bo_offset + chunk :
> > -					 last->userptr.ptr + chunk,
> > -					 last->start + chunk,
> > -					 last->end,
> > -					 (last->pte_flags &
> > -					  XE_PTE_FLAG_READ_ONLY),
> > +		new_last = xe_vma_create(xe_vma_vm(last), xe_vma_bo(last),
> > +					 xe_vma_bo(last) ?
> > +					 xe_vma_bo_offset(last) + chunk :
> > +					 xe_vma_userptr(last) + chunk,
> > +					 xe_vma_start(last) + chunk,
> > +					 xe_vma_end(last) - 1,
> > +					 xe_vma_read_only(last),
> >   					 (last->pte_flags & XE_PTE_FLAG_NULL),
> >   					 last->tile_mask);
> > -		if (last->bo)
> > -			xe_bo_unlock(last->bo, &ww);
> > +		if (xe_vma_bo(last))
> > +			xe_bo_unlock(xe_vma_bo(last), &ww);
> >   		if (!new_last) {
> >   			err = -ENOMEM;
> >   			goto unwind;
> > @@ -2784,7 +2784,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
> >   	struct rb_node *node;
> >   	if (!xe_vma_has_no_bo(vma)) {
> > -		if (!xe_bo_can_migrate(vma->bo, region_to_mem_type[region]))
> > +		if (!xe_bo_can_migrate(xe_vma_bo(vma), region_to_mem_type[region]))
> >   			return ERR_PTR(-EINVAL);
> >   	}
> > @@ -2793,7 +2793,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
> >   		if (!xe_vma_cmp_vma_cb(lookup, node)) {
> >   			__vma = to_xe_vma(node);
> >   			if (!xe_vma_has_no_bo(__vma)) {
> > -				if (!xe_bo_can_migrate(__vma->bo, region_to_mem_type[region]))
> > +				if (!xe_bo_can_migrate(xe_vma_bo(__vma), region_to_mem_type[region]))
> >   					goto flush_list;
> >   			}
> >   			list_add_tail(&__vma->unbind_link, &vma->unbind_link);
> > @@ -2807,7 +2807,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
> >   		if (!xe_vma_cmp_vma_cb(lookup, node)) {
> >   			__vma = to_xe_vma(node);
> >   			if (!xe_vma_has_no_bo(__vma)) {
> > -				if (!xe_bo_can_migrate(__vma->bo, region_to_mem_type[region]))
> > +				if (!xe_bo_can_migrate(xe_vma_bo(__vma), region_to_mem_type[region]))
> >   					goto flush_list;
> >   			}
> >   			list_add(&__vma->unbind_link, &vma->unbind_link);
> > @@ -2835,7 +2835,7 @@ static struct xe_vma *vm_unbind_all_lookup_vmas(struct xe_vm *vm,
> >   	xe_bo_assert_held(bo);
> >   	list_for_each_entry(vma, &bo->vmas, bo_link) {
> > -		if (vma->vm != vm)
> > +		if (xe_vma_vm(vma) != vm)
> >   			continue;
> >   		prep_vma_destroy(vm, vma);
> > @@ -3430,14 +3430,14 @@ void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
> >    */
> >   int xe_vm_invalidate_vma(struct xe_vma *vma)
> >   {
> > -	struct xe_device *xe = vma->vm->xe;
> > +	struct xe_device *xe = xe_vma_vm(vma)->xe;
> >   	struct xe_tile *tile;
> >   	u32 tile_needs_invalidate = 0;
> >   	int seqno[XE_MAX_TILES_PER_DEVICE];
> >   	u8 id;
> >   	int ret;
> > -	XE_BUG_ON(!xe_vm_in_fault_mode(vma->vm));
> > +	XE_BUG_ON(!xe_vm_in_fault_mode(xe_vma_vm(vma)));
> >   	XE_WARN_ON(xe_vma_is_null(vma));
> >   	trace_xe_vma_usm_invalidate(vma);
> > @@ -3447,11 +3447,11 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >   			WARN_ON_ONCE(!mmu_interval_check_retry
> >   				     (&vma->userptr.notifier,
> >   				      vma->userptr.notifier_seq));
> > -			WARN_ON_ONCE(!dma_resv_test_signaled(&vma->vm->resv,
> > +			WARN_ON_ONCE(!dma_resv_test_signaled(&xe_vma_vm(vma)->resv,
> >   							     DMA_RESV_USAGE_BOOKKEEP));
> >   		} else {
> > -			xe_bo_assert_held(vma->bo);
> > +			xe_bo_assert_held(xe_vma_bo(vma));
> >   		}
> >   	}
> > @@ -3516,10 +3516,11 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
> >   				addr = 0;
> >   			}
> >   		} else {
> > -			addr = __xe_bo_addr(vma->bo, 0, XE_PAGE_SIZE, &is_vram);
> > +			addr = __xe_bo_addr(xe_vma_bo(vma), 0, XE_PAGE_SIZE, &is_vram);
> >   		}
> >   		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
> > -			   vma->start, vma->end, vma->end - vma->start + 1ull,
> > +			   xe_vma_start(vma), xe_vma_end(vma) - 1,
> > +			   xe_vma_size(vma),
> >   			   addr, is_null ? "NULL" : is_userptr ? "USR" :
> >   			   is_vram ? "VRAM" : "SYS");
> >   	}
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 47bc7fbb2f50..3d542ceb5327 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -61,7 +61,66 @@ static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
> >   }
> >   struct xe_vma *
> > -xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma);
> > +xe_vm_find_overlapping_vma(struct xe_vm *vm, struct xe_vma *vma);
> > +
> > +/*
> > + * Let's abstract start, size, end, bo_offset, vm, and bo as the underlying
> > + * implementation may change
> > + */
> 
> According to the linux kernel patch guidelines we're required to kerneldoc
> those below.
> Not going to insist on that, but perhaps just a more formal summarizing
> comment:
> 
> /**
> * DOC: Provide accessors for vma members to facilitate easy change of
> implementation.
> */
>

Sure.

> Otherwise
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.kernel.org>
> 
> 
> > +static inline u64 xe_vma_start(struct xe_vma *vma)
> > +{
> > +	return vma->start;
> > +}
> > +
> > +static inline u64 xe_vma_size(struct xe_vma *vma)
> > +{
> > +	return vma->end - vma->start + 1;
> > +}
> > +
> > +static inline u64 xe_vma_end(struct xe_vma *vma)
> > +{
> > +	return xe_vma_start(vma) + xe_vma_size(vma);
> > +}
> vma->end - 1; ?

xe_vma_end() == vma->end + 1, I intentionally made this change as this
more aligns with the gpuva usage.

Probably going to rebase and merge this one asap as this one is really
hard to get it to apply.

Matt

> > +
> > +static inline u64 xe_vma_bo_offset(struct xe_vma *vma)
> > +{
> > +	return vma->bo_offset;
> > +}
> > +
> > +static inline struct xe_bo *xe_vma_bo(struct xe_vma *vma)
> > +{
> > +	return vma->bo;
> > +}
> > +
> > +static inline struct xe_vm *xe_vma_vm(struct xe_vma *vma)
> > +{
> > +	return vma->vm;
> > +}
> > +
> > +static inline bool xe_vma_read_only(struct xe_vma *vma)
> > +{
> > +	return vma->pte_flags & XE_PTE_FLAG_READ_ONLY;
> > +}
> > +
> > +static inline u64 xe_vma_userptr(struct xe_vma *vma)
> > +{
> > +	return vma->userptr.ptr;
> > +}
> > +
> > +static inline bool xe_vma_is_null(struct xe_vma *vma)
> > +{
> > +	return vma->pte_flags & XE_PTE_FLAG_NULL;
> > +}
> > +
> > +static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
> > +{
> > +	return !xe_vma_bo(vma);
> > +}
> > +
> > +static inline bool xe_vma_is_userptr(struct xe_vma *vma)
> > +{
> > +	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
> > +}
> >   #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
> > @@ -126,21 +185,6 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
> >   	}
> >   }
> > -static inline bool xe_vma_is_null(struct xe_vma *vma)
> > -{
> > -	return vma->pte_flags & XE_PTE_FLAG_NULL;
> > -}
> > -
> > -static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
> > -{
> > -	return !vma->bo;
> > -}
> > -
> > -static inline bool xe_vma_is_userptr(struct xe_vma *vma)
> > -{
> > -	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
> > -}
> > -
> >   int xe_vma_userptr_pin_pages(struct xe_vma *vma);
> >   int xe_vma_userptr_check_repin(struct xe_vma *vma);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > index 76458f8d57f3..f29a67cb941f 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -30,7 +30,7 @@ static int madvise_preferred_mem_class(struct xe_device *xe, struct xe_vm *vm,
> >   		struct xe_bo *bo;
> >   		struct ww_acquire_ctx ww;
> > -		bo = vmas[i]->bo;
> > +		bo = xe_vma_bo(vmas[i]);
> >   		err = xe_bo_lock(bo, &ww, 0, true);
> >   		if (err)
> > @@ -55,7 +55,7 @@ static int madvise_preferred_gt(struct xe_device *xe, struct xe_vm *vm,
> >   		struct xe_bo *bo;
> >   		struct ww_acquire_ctx ww;
> > -		bo = vmas[i]->bo;
> > +		bo = xe_vma_bo(vmas[i]);
> >   		err = xe_bo_lock(bo, &ww, 0, true);
> >   		if (err)
> > @@ -91,7 +91,7 @@ static int madvise_preferred_mem_class_gt(struct xe_device *xe,
> >   		struct xe_bo *bo;
> >   		struct ww_acquire_ctx ww;
> > -		bo = vmas[i]->bo;
> > +		bo = xe_vma_bo(vmas[i]);
> >   		err = xe_bo_lock(bo, &ww, 0, true);
> >   		if (err)
> > @@ -114,7 +114,7 @@ static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
> >   		struct xe_bo *bo;
> >   		struct ww_acquire_ctx ww;
> > -		bo = vmas[i]->bo;
> > +		bo = xe_vma_bo(vmas[i]);
> >   		if (XE_IOCTL_ERR(xe, !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)))
> >   			return -EINVAL;
> > @@ -145,7 +145,7 @@ static int madvise_device_atomic(struct xe_device *xe, struct xe_vm *vm,
> >   		struct xe_bo *bo;
> >   		struct ww_acquire_ctx ww;
> > -		bo = vmas[i]->bo;
> > +		bo = xe_vma_bo(vmas[i]);
> >   		if (XE_IOCTL_ERR(xe, !(bo->flags & XE_BO_CREATE_VRAM0_BIT) &&
> >   				 !(bo->flags & XE_BO_CREATE_VRAM1_BIT)))
> >   			return -EINVAL;
> > @@ -176,7 +176,7 @@ static int madvise_priority(struct xe_device *xe, struct xe_vm *vm,
> >   		struct xe_bo *bo;
> >   		struct ww_acquire_ctx ww;
> > -		bo = vmas[i]->bo;
> > +		bo = xe_vma_bo(vmas[i]);
> >   		err = xe_bo_lock(bo, &ww, 0, true);
> >   		if (err)
