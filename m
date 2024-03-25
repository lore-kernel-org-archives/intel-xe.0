Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4862AC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 19:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE2510E06B;
	Mon, 25 Mar 2024 19:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+m9w/3D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFB910E06B
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 19:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711395367; x=1742931367;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ocMNELz6cbh8TKH5GOlFa90ud+bEQljvwpdgne2sugM=;
 b=n+m9w/3DeG9MTYWiiNKEmej0UuZ10dhXK67lnBmJGiYtLdolqGJf6FIo
 qLbXnpscgCz1qYX2+HKFVyFBB50Y9wALwn8BHMnPhQfucLVFHGjbz3NX3
 z80NtWQewQWnJlLvN8y5CcZ/463x0TvWK5ARya0UeazI1sKM328UzCpMC
 MDRrM7NsEIHt/fUy50Ceu8grGavfAelCiX1BH6Ppfd/oZKtHQ72ghVJkh
 5Lv5PHk0Jwp63J06BWuh2S6TdR7Wh1YPWE6MXYgYY4yJUHN2S6GOah0Fi
 veXKCX1aPiS0E/yBxfUqbTiH7kiIOLYJzmP+/WqZkJdjPPgo9twB+gi0g A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6281544"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6281544"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 12:36:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="20267528"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 12:36:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 12:36:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 12:36:06 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 12:36:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGWH299E6NCzXg2wiegUGSWH/K12FLiva0NcUjk5XCRCIR+4SgGQxnmsfNchW5t2tF3tblh9Rm6sAob/Mf6xQb1yq/rDfCBedtKCIYGXRez6QF8cyr4CZF7/dX3Ye+28iRmzLSpQLBJjLzdmPoe9izvrlSww6zFctMu8h/jSVuqkkhewMz/DqWzZg6HJzCLRr/80whPK8RMUNC8+Q+ynoDoQvp+n2dNY5tvUv4Oer3v8gsFodoXEX4A5pOLykNYQLGf8TbAOztk3Cctd6V+s6Lum2MiQBpY3yO44WjqD1O0NzDxoo6gqjUekdNAR07f3npOdM+ziSNEw4z7M60FlOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3Af13paEDivSBuiPOpIJosYAAYXplw3bJpUw0zWSMU=;
 b=G5nI4eFagYzSwcHlBcWzS8EyhHFfBVJecZN6tesYPe58Z0zzuT9BSJqjZiY/Igy1SsAK93AxYC/7w1z9ei1WdSzkRWeG6EXSjJ4kP1vP8RVnXFXmCfGBVpG4fhoW2b6gZeh0E6pOPVERtj1014fM/Rfv60qcDvGxqU5MP4gcfwQ7gGFhUjjG6R3My8uZsLb0R6MoRefPZdOi24dqPNYgTSs9nrF+RnWjDjmepWfkjlUZvkppjQPdzi7nhTfFIfPyzeZLK9hyNVnBnoqpVHIOFO61sS2dYiop2ABQ36TOuBl+SX7AnGay1ZqNvw51m9tgjbMZx3CphGFgndpsFbcNdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.32; Mon, 25 Mar 2024 19:36:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 19:36:04 +0000
Date: Mon, 25 Mar 2024 19:34:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 10/30] drm/xe: Add vm_bind_ioctl_ops_install_fences
 helper
Message-ID: <ZgHR4qXDFWIT0umE@DUT025-TGLU.fm.intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-11-matthew.brost@intel.com>
 <SA1PR11MB699123EE17279306D203608992362@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB699123EE17279306D203608992362@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6454:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 46WOS6Lv2qZw15IRDf/7vcpBrDyFT1q8ns9KMalrW8uZ+LDYOH3cmqyJC+kqME8Ujbz13yVUWpP7qWugrZC77m/uRmziogPBHyiGS54brchx7un4OehqUIo84TUPpPyj+MAK2dcf7XxFK7RlnwCKd9ORNhyQeTYY/JawVk28rqVKDyncoaJq4qd+Wg/30TkJ57eByglCgLobi/1sKeFWw2lriT6jkw1ye6klpuzHTkXoO/5EW4z4+yBY0HJRvr63OHtSK/OO60dRuGybYeOJpVqlXtVuO+7ekdLoRjpsDRlkczfbvnSb+00sO810IJNYxdj/OPqF+Ph7eh6UrT0toTF6B8FThyQD4N9jv5ezVQ/qDlw/8iwh6oPHWiiN+X0FOw+86zZ1/JGEYXFJ4YPV6EUbH4/0bKhbcWgkyK5LGn8Q9XuoW/q126PSva1VYMkO6Kgmz6h1AMJe2YzqnVskLSt6PwFGs/RyLBH+feCoHdwwMVU1eIPE2fGulFmWMHWN3VnvZR64nl+nc0DfRcmz7ZQPWvYKrn2s9mIxg7J+9pgHfdmdpDWVzJhJaH3g31YpwZn78n3/4/PjfwR5XzEsaUshoyTQXkr7t76o5NCujuQ7fuyytWZ5AwtY/hxU/meIrAPja37H3sqX0ADOUBPl0zHzYaFjkpzPGIEoEl8K/sc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kpb6t1nIvBvE8orQ0xoI6cjQkS8QVEfTNSEAKtFPY/jW8glK92sT55060uWW?=
 =?us-ascii?Q?ez9XqBiHqLYZAbVRV/XcYgiK5/RYha7Zl07W0I2jsxM9vdSrllcljtql+OXi?=
 =?us-ascii?Q?+C4BEi5QdaAbthcrGo14OalSE3cZsVBCcxQOwvHjDAG0huVXrN3H+eNfYEta?=
 =?us-ascii?Q?3WedpVnHHcP7Y8OxPyABtg75nCtTSto+c2VGGnlEF79n6Jii3w5sNdL7utGU?=
 =?us-ascii?Q?ceHmkgQV4HlDv3GPZDcSvwQonAer/oqF/sbGHIuJKzt0Jzrozvqqno5HZRmm?=
 =?us-ascii?Q?BbwoA8C55psGYEY8BYSG5y4orrZxcHfHAIFnuUIIy9UCTJEGgym3p+q0Im5V?=
 =?us-ascii?Q?13ISCCT2tfiMLWzN6HrTW8RXxrisZE+rAI8m6VsiQsap+AEEsezUVeAtpfJ5?=
 =?us-ascii?Q?JUVf8lGGv/v8cMY0RYjqx93A9IDLFxIiIsap1shLeosqsx8BPOeCXuDmPJNm?=
 =?us-ascii?Q?jOSSRGlZl3slNYa3on1BnpgVg4titvtwvkviUPzsYaBgI/jwhf1YVBwt8ud2?=
 =?us-ascii?Q?doqn+jst0MRBrepiZG76xI4aWKIp3koyqGJdDrsrUMvA3r52ju1yGceDHE/y?=
 =?us-ascii?Q?lFZzDVH6ykL31G/DoSgXdOuqwVWZUirAP/P09AttX1e94kTrfVZuTcV4RKzk?=
 =?us-ascii?Q?xMXlN4lmaU/vtg2otP/iJhGDFhz08YPchMa2W9uOSinBrgx8NZYVEhZsUe7Q?=
 =?us-ascii?Q?QeN1eNTX0C3TUxTKg49eAUN0AdlR3EaLRj6xB1PwNrljidwdmJwupHc6xYXH?=
 =?us-ascii?Q?YfjCzJQ/MDbX4ui8hy9fNmLkLZK98/hKZ/LvmLZwGn8T1f+D36niLBhqYYqG?=
 =?us-ascii?Q?eZiD1oeWy9lyzri98hG1ZPSw0Fs1mrxiqbjDr49gYbWfZWxlZNlYSayKql8l?=
 =?us-ascii?Q?gMs5Mw3w0UmnWA3LLDjKnH8qiveBuAMbCw5fZk71xeTLglugZSJYwuOQhfq/?=
 =?us-ascii?Q?QP3CQHUL54DbV2urYDy1xzfNCQNfYYpjW4lQwf6YYQUYms6QIvsI/tQhOYHa?=
 =?us-ascii?Q?pRz4HQy1t7FwDt/e1Nlm4snJswbRpqNa6NUs8/rf6HCn1+jLVruCpc3AcjY9?=
 =?us-ascii?Q?ysSOycbbeTj4cbpYhz+Cx8jVy8bb7GpqPrG9jaJNJ6SUvxx2oGQlPWEBGHVc?=
 =?us-ascii?Q?uqBLSw0Pw786+0KGUS50If2UoW6zX8ZKkOFBvEAY3De1cB700ME6NGDdCS/9?=
 =?us-ascii?Q?87xOdAlGhHJCuVP47Zz7lMnJ4ryqpxs0j79H7yg5ED+QY3hE/Fp0HUu2JPdg?=
 =?us-ascii?Q?NtqXPnho9cxDIYc1RQX3J9G2u/l+uUzUGdHdagzOXG7Ci1/dLF7FWql0fAV5?=
 =?us-ascii?Q?h7C128rUG/NS9pxFKOLAib8KZVLLFW1Q6cGk3GYBdOQoE8XeEzoM1WNGcJ/O?=
 =?us-ascii?Q?47mMemXCEIqpkZPeUjaDzB6ScnPya8qZQowcS5dFzVDyEcTXxJJH92Lwnpn8?=
 =?us-ascii?Q?xHiLS42rkdGuPm02UKGHxXOaUs1WA2UOYRO0TcbGmkDUXuvuUHPdQ4kO/T9c?=
 =?us-ascii?Q?u4IVIFtd2sRz+0W+2mm1qMefvNHmhinNvtiRvgEKpUBc8+JVjXUFRSqcbPrU?=
 =?us-ascii?Q?z+AufBzIJokW/KvFOPSDULvPz5uhRApEa1xwBsvnB4ns6/2vNsDwBT09JmBY?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e78adf-d4f3-4e6e-cb99-08dc4d02cf35
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 19:36:04.2998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNRkDgm1IEcmrjSn4XMzWThpXq1+Dv+u3OtOtvpXsZ85f5ZGB4YV26kQC+jKY2RkXRw+peD4nANbUyy03PRwFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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

On Mon, Mar 25, 2024 at 10:51:43AM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew
> > Brost
> > Sent: Friday, March 8, 2024 12:08 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH v4 10/30] drm/xe: Add vm_bind_ioctl_ops_install_fences helper
> > 
> > Simplify VM bind code by signaling out-fences / destroying VMAs in a
> > single location. Will help with transition single job for many bind ops.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 55 ++++++++++++++++----------------------
> >  1 file changed, 23 insertions(+), 32 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index f8b27746e5a7..8c96c98cba37 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1658,7 +1658,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct
> > xe_exec_queue *q,
> >  	struct dma_fence *fence = NULL;
> >  	struct dma_fence **fences = NULL;
> >  	struct dma_fence_array *cf = NULL;
> > -	int cur_fence = 0, i;
> > +	int cur_fence = 0;
> >  	int number_tiles = hweight8(vma->tile_present);
> >  	int err;
> >  	u8 id;
> > @@ -1716,10 +1716,6 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct
> > xe_exec_queue *q,
> > 
> >  	fence = cf ? &cf->base : !fence ?
> >  		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
> > -	if (last_op) {
> > -		for (i = 0; i < num_syncs; i++)
> > -			xe_sync_entry_signal(&syncs[i], NULL, fence);
> > -	}
> > 
> >  	return fence;
> > 
> > @@ -1743,7 +1739,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct
> > xe_exec_queue *q,
> >  	struct dma_fence **fences = NULL;
> >  	struct dma_fence_array *cf = NULL;
> >  	struct xe_vm *vm = xe_vma_vm(vma);
> > -	int cur_fence = 0, i;
> > +	int cur_fence = 0;
> >  	int number_tiles = hweight8(vma->tile_mask);
> >  	int err;
> >  	u8 id;
> > @@ -1790,12 +1786,6 @@ xe_vm_bind_vma(struct xe_vma *vma, struct
> > xe_exec_queue *q,
> >  		}
> >  	}
> > 
> > -	if (last_op) {
> > -		for (i = 0; i < num_syncs; i++)
> > -			xe_sync_entry_signal(&syncs[i], NULL,
> > -					     cf ? &cf->base : fence);
> > -	}
> > -
> >  	return cf ? &cf->base : fence;
> > 
> >  err_fences:
> > @@ -1847,15 +1837,8 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> > struct xe_exec_queue *q,
> >  		if (IS_ERR(fence))
> >  			return fence;
> >  	} else {
> > -		int i;
> > -
> >  		xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
> > -
> >  		fence = xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> > -		if (last_op) {
> > -			for (i = 0; i < num_syncs; i++)
> > -				xe_sync_entry_signal(&syncs[i], NULL, fence);
> > -		}
> >  	}
> > 
> >  	if (last_op)
> > @@ -1879,7 +1862,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> >  	if (IS_ERR(fence))
> >  		return fence;
> > 
> > -	xe_vma_destroy(vma, fence);
> >  	if (last_op)
> >  		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > 
> > @@ -2037,17 +2019,7 @@ xe_vm_prefetch(struct xe_vm *vm, struct xe_vma
> > *vma,
> >  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> > num_syncs,
> >  				  vma->tile_mask, true, first_op, last_op);
> >  	} else {
> > -		struct dma_fence *fence =
> > -			xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> > -		int i;
> > -
> > -		/* Nothing to do, signal fences now */
> > -		if (last_op) {
> > -			for (i = 0; i < num_syncs; i++)
> > -				xe_sync_entry_signal(&syncs[i], NULL, fence);
> > -		}
> > -
> > -		return fence;
> > +		return xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> >  	}
> >  }
> > 
> > @@ -2844,6 +2816,25 @@ struct dma_fence *xe_vm_ops_execute(struct xe_vm
> > *vm, struct xe_vma_ops *vops)
> >  	return fence;
> >  }
> > 
> > +static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
> > +					     struct xe_vma_ops *vops,
> > +					     struct dma_fence *fence)
> 
> Is this a correct function name? from the codes below, you destroyed the temporary vmas during vm_ioctl, then signaled all the sync entries, then you destroyed the fence generated from the last operation.... it is more like a cleanup stage of the vm_bind.... But I don't quite understand the code, see below questions...
> 

Yes, let me rename. How about vm_bind_ioctl_ops_execute_fini?

'destroyed the temporary vmas during vm_ioctl' - This is destroying
unmapped VMAs when the fence signals.

> 
> > +{
> > +	struct xe_vma_op *op;
> > +	int i;
> > +
> > +	list_for_each_entry(op, &vops->list, link) {
> > +		if (op->base.op == DRM_GPUVA_OP_UNMAP)
> > +			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va),
> > fence);
> > +		else if (op->base.op == DRM_GPUVA_OP_REMAP)
> > +			xe_vma_destroy(gpuva_to_vma(op-
> > >base.remap.unmap->va),
> > +				       fence);
> > +	}
> > +	for (i = 0; i < vops->num_syncs; i++)
> > +		xe_sync_entry_signal(vops->syncs + i, NULL, fence);
> 
> This signals the out-fence of vm_bind ioctl. Isn't this be done *after* fence is signaled (aka means the last vm bind operation is done)?
> 
> 

This, xe_sync_entry_signal, is a bad name. It really should be
xe_sync_entry_install_fence or something like that. It is really is
installing the fence in all out-syncs, the fence signals, then the
out-fence signals.

> > +	dma_fence_put(fence);
> 
> 
> I know this is also in the original code below... but I also don't understand why we can destroy fence here. As I understand it, this fence is generated during vm_bind operations. This is the last fence. Shouldn't we wait this fence somewhere so we know all the vm bind operations have been complete? I need your help to understand the picture here.
>

This isn't destroying the fence - it dropping a reference. This is
reference return from xe_vm_ops_execute, we install the fence anywhere
needed (this might take more refs) then drop the ref from
xe_vm_ops_execute.

Matt
 
> Oak
> 
> > +}
> > +
> >  static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> >  				     struct xe_vma_ops *vops)
> >  {
> > @@ -2868,7 +2859,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm
> > *vm,
> >  			xe_vm_kill(vm, false);
> >  			goto unlock;
> >  		} else {
> > -			dma_fence_put(fence);
> > +			vm_bind_ioctl_ops_install_fences(vm, vops, fence);
> >  		}
> >  	}
> > 
> > --
> > 2.34.1
> 
