Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E26CD11C2
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 03:08:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D8710F4C3;
	Wed,  3 Apr 2024 03:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLbjhoZT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C2A10F4C3
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 03:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712113694; x=1743649694;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zEkeCrzKMLKkqqRIqGwUskaJqVJgk75BqYmc2yHGJE8=;
 b=QLbjhoZTES+jmi4mEC2V61MiHOTbgcAXJdQ4CGMdnP/h9K0M0UdcGn5X
 LnF37A5MyrhpZCXVl3IGYOY0faDrjs1bJ2/ZIqY9wRjH6mfeAEQQ5cQhp
 pUmKqU1EMyZgDEynODhXNtvm1jm2EayIWuvVgPjmX2w0W07rpS2HbexRU
 BDj0vXRNv5DSQFF1FVVinQmWPicBj9mwTdHlQSymAutsFGivdFDvLb/Cc
 jI+XGbO3DpZ8/jaA614QEUa2VscHO2Rxk4/LAbkWEcsy+lxcumb1UUS8Y
 ElQfmkXD0tTlXTouLcwgxRfwbaByPT8BtfsT1kF3XnyUKYPqcU6dY9tlY g==;
X-CSE-ConnectionGUID: eq+hUh1GR0ekhg/1k5yU8g==
X-CSE-MsgGUID: VOQREh1tQyCClzl+1VyNaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7903141"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7903141"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 20:08:13 -0700
X-CSE-ConnectionGUID: F3LQk6cRTzu+diLQ5Zx7tw==
X-CSE-MsgGUID: 1rF2Cc1lSEai9W6ibJHrfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="18253341"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 20:08:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 20:08:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 20:08:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 20:08:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 20:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fa7+C0S5woirXfbe7ieraKcbXjBdlL45EdRzbm9h4ss5xtMgRrow8Sr0khZilD/C61sq3/Gl5psq/v0OSxS38oMW8xzrcu2u/7GZ/8/KqJlnZ5cCNajfWYEQYxhjKC2JqGlf0qU5uZLOuo/2Yx1OhAVfQS3oJRrfw7z/SH3vgquVBMSK/lMeupuZcVL33tkrdiFcb0rsPhWyN7GLMsCUvKf8cPzXeqBckyPayeImwdlYaUsZE/JOBD4v3ubX3rhUj2WLBM155hXt7yIyD74L8vGF/gBy7YsJ09EXCiM4vFU+5HmIOYX8ihjgB91gaRgNaFfoCIkHjmRrJmcPkCiKMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+/Kf4J9wck1wbFk/bXyBW1ahlPrPN20n2MEJnX+t7Q=;
 b=gZtJvh8cMpSnnYuWbU/Jas+ia2by+M07/MUPox8uqQIEVWqpVXRbbr4fVKZq3W/mbPPcnym97PWEq3Os9NWHCCNtJzf5DMPbTYWqLnZvR8kXw6RtXbd0eg6Hg48pyvAA0nDMpvxaeRmL+Nsx52YjcZHVDaFoCSRprwHkuvpxnbMMjCWL9+oxukcoWm7otO81R/OJJmAp5/0AsOOv0tzBv5EHyo9E5jBIPGtmP3UdEK4vZHUcCigPnjBND2y83h8YKN5/+jlON2VjIlf712kSoSY9ShD57FxBoyr9dIHjy2E3nRtJ0p7Ba7zFtmOPiVNXzEIEw9PK01Ul9h8y4Lix+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6219.namprd11.prod.outlook.com (2603:10b6:208:3e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 03:08:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 03:08:10 +0000
Date: Wed, 3 Apr 2024 03:09:00 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@intel.com>,
 <brian.welty@intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Use hmm_range_fault to populate user pages
Message-ID: <ZgzITDIi7oARG79h@DUT025-TGLU.fm.intel.com>
References: <20240322035520.2382600-1-oak.zeng@intel.com>
 <20240322035520.2382600-4-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240322035520.2382600-4-oak.zeng@intel.com>
X-ClientProxiedBy: BY5PR17CA0003.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6219:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rYJyCqv5imJ8l2rOEDZxlgeTn7K3+iPPKdun4W/eLACwoxEzKnu9dHHGad5julNUhQv8W5LMdugxodytmJG89BTYkN9xcMaelPH78CQAgRXER4zTbQgZrpWbkvknX0H5uxgyxsZe4EVko1YNgeCd037s+pIUKTQJ/XCzs9m27PqkHUPf6FkfFryS/sgfa9Pus3hLMBHNNSvv4CEc/q+7hnh4lEz34scr27seBnf9HbuJkGIMYVj1yxXhqb48b5qwmicxu4MhKwarHCeyYjwVnTUHws7cBQbdJ1qwSHDI4ZjBhPSyLDyCphjc/rbc0JzZbv+c1mqm0rVnliyxGFEcbmWN6LLwVXCk7QSInSotVY/KvlREx7GZ31UL1te3o4qAjgVK7ftv4bvI/neJyY7kNIYyY06yyr+TJ6ULiPJ1HFivViRrCrl7cbqFSsK9As0Q4Cw1WJFMgPbQko6QmeVYVO9LnzBS39C88nxpIKzM3/cVjjcw/dr5VOyZqu6Pxn+ko7IIb4XYemBINalsVrxBM0DJY2MP6hD3htv0dTT05G18ILHXA/pyLJ1t+928mOmTjgJV8wF8hDCD0f0sRlrctR5cQJL290ciFpqlZtlH+aqkz6zqmLw9KMkYFTryvqK4PM54aGFYr08MICyGYOQN8Tu++8FAkN6w9G6hzdK9NJI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JsADSEW06sKP78JVlMSK2+b5gHaT5EldXUL414wjLxxTCQtWIPUNQJOaFQW+?=
 =?us-ascii?Q?RXeC4NVLnlwMR3Fv8QFrAN0eY9aA/dQSluwbI68sT6ne70L0xPe7+22ETfWO?=
 =?us-ascii?Q?1mE0442P7a92u60f8nyDVmB8fBnAQ7tnpmIOSPErMxpic+UIFqSo/5URDzVo?=
 =?us-ascii?Q?LLUsEKSXm3dNgE1Ajet4cmoWSolgujXamLo9YHIS9ii7QW2NPvdBnibM7bwQ?=
 =?us-ascii?Q?ePy2BA2tgmf6elJCfb+66RBpIePjTWhbXpgdWi0vp6VqcRqWJlEot2deYfyP?=
 =?us-ascii?Q?WNCDwlWNmzb/xgl7YYd0Vw6LgxUWWr+SrGCVQ3pnQ14t1ZDbSdA/mrAVGhp5?=
 =?us-ascii?Q?RlO0b22ZpLxAPy0cZh6cw8h4SPzxqmn12vcqy3U41C0+EipwV/zaT9C1LVC8?=
 =?us-ascii?Q?1gqkEiUMsPrwcQrR0OYLrndGJCI+tahOc+zlzYMyoX40GAf51kkk9UJJmAvq?=
 =?us-ascii?Q?6Ge1WHjcRgrIkd99zsAnlRWtmmHRO23BBqnH+2U1HbFn7cKzvFNRch8FsmEE?=
 =?us-ascii?Q?gN76oZauTEEqOpnUu9y/eyIzpn7DFcgv2BS13vtch2wTk1w7Yy7zTiop9tdb?=
 =?us-ascii?Q?9eoQhBDvLQcJv5PS2ifKK6dkCCpx2gTpMqKKwcLq4GFvA11+PTuy09trpZM9?=
 =?us-ascii?Q?xvTMSzLd8QsMLeBo9ADffMiQnL3JIsZ9/mtQ1nqey7terqrHDfNyztaW5QVe?=
 =?us-ascii?Q?9VAF71hrQH9hOYIYO22EBZAFTJMxHe2qqZ9njAIN4pX99PY22Z+hRKtJImWZ?=
 =?us-ascii?Q?Lvb3ks9Ab7r4EbwXaP8kN4jenRaChgjh5BE7AS8+fM1CZQ253gV9OYdz20du?=
 =?us-ascii?Q?wC6uiFY4ROuLnnsEHd9/bU+o/q5/gKc7A0M4ocBLy3JVlmBHX/QuwG2gp62b?=
 =?us-ascii?Q?nsm9yZ5jxa/t2Nr46EyTMt0l7NHPg0Ov5LINPSfIs72FiBLQQPGyi3HFyWj7?=
 =?us-ascii?Q?2frfU6tsdmKTuuJcua5iI646qGLPkD/lRT6fG6ZvjUwDRUHL18tdihM2Ngsw?=
 =?us-ascii?Q?pPr1RZPwLrGAcDEyaZFNg7HxmFxK+9UE05CBk2uyKdYH7WIPGMmnOwg30SDG?=
 =?us-ascii?Q?QZMTwtfak0jwSQmeXATqOhT9SL1FZ9mAUh7+12SDIHbc1nsLRj7m5XfNO4Bw?=
 =?us-ascii?Q?v1fUSJbHZzvXpqT96ev38QhEhTfDHaIRoKLYyZ03IAOsRhoCCKwVTWNkR6pK?=
 =?us-ascii?Q?rZYFalD1Z2x2GQrHE10y9+rV+aPARXceb5TkkU87LxnFbwk4o70Ebwev/bCv?=
 =?us-ascii?Q?yy6Zxl+XJBOdC33NKmfpjbQAced1RJvG3w7WSVYjIAvQjlrK5XVM5Vm1ZtAm?=
 =?us-ascii?Q?2ej3ZWHi1d/HfikbxFGhsB+Es0yfe7VAGtbxqIApGysgOYKQwehWI68kp5Ze?=
 =?us-ascii?Q?QMV+wqyHqkkDXz5uIQ9Mzq+OyLyIfqIv9wWs/5ile0LKpkOzACQgsnCzwmwp?=
 =?us-ascii?Q?TwDUdIpDy69oBlElE1DMmir82Gn71AkJqnDtKmLJFm2GMZFblICCkuIeWk9+?=
 =?us-ascii?Q?6MZRteDjD7E/J//CzJX6kiBlW9qXOcEoHhiOQPFek2dRFf575d/R6CEO3Qqy?=
 =?us-ascii?Q?X7VjwLgFZ7ZaaSRoXAPZVSKhDVVEegcoxiQIn8NHa1KMYfaeK2VNy3H9M7Kw?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef7d6c4-95e8-416d-d78d-08dc538b4ad5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 03:08:10.2241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aibgLIHDKCgjAEr86qwGqMtWkqSx47AOZ9DiR//T1pppMC0C0sBVCkv6woAgFJnBPriupVADClpIowkx+HzkJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6219
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

On Thu, Mar 21, 2024 at 11:55:20PM -0400, Oak Zeng wrote:
> This is an effort to unify hmmptr (aka system allocator)
> and userptr code. hmm_range_fault is used to populate
> a virtual address range for both hmmptr and userptr,
> instead of hmmptr using hmm_range_fault and userptr
> using get_user_pages_fast.
> 
> This also aligns with AMD gpu driver's behavior. In
> long term, we plan to put some common helpers in this
> area to drm layer so it can be re-used by different
> vendors.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 122 ++++---------------------------------
>  1 file changed, 12 insertions(+), 110 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e3692b7e1711..c0a3bff1bb0e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -38,6 +38,7 @@
>  #include "xe_sync.h"
>  #include "xe_trace.h"
>  #include "xe_wa.h"
> +#include "xe_hmm.h"
>  
>  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>  {
> @@ -65,113 +66,21 @@ int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
>  
>  int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>  {
> -	struct xe_userptr *userptr = &uvma->userptr;
>  	struct xe_vma *vma = &uvma->vma;
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  	struct xe_device *xe = vm->xe;
> -	const unsigned long num_pages = xe_vma_size(vma) >> PAGE_SHIFT;
> -	struct page **pages;
> -	bool in_kthread = !current->mm;
> -	unsigned long notifier_seq;
> -	int pinned, ret, i;
> -	bool read_only = xe_vma_read_only(vma);
> +	struct xe_userptr *userptr;
> +	int ret;
>  
>  	lockdep_assert_held(&vm->lock);
>  	xe_assert(xe, xe_vma_is_userptr(vma));
> -retry:
> -	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> -		return 0;
> -
> -	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> -	if (notifier_seq == userptr->notifier_seq)
> -		return 0;
> -
> -	pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
> -	if (!pages)
> -		return -ENOMEM;
> -
> -	if (userptr->sg) {
> -		dma_unmap_sgtable(xe->drm.dev,
> -				  userptr->sg,
> -				  read_only ? DMA_TO_DEVICE :
> -				  DMA_BIDIRECTIONAL, 0);
> -		sg_free_table(userptr->sg);
> -		userptr->sg = NULL;
> -	}
>  
> -	pinned = ret = 0;
> -	if (in_kthread) {
> -		if (!mmget_not_zero(userptr->notifier.mm)) {
> -			ret = -EFAULT;
> -			goto mm_closed;
> -		}
> -		kthread_use_mm(userptr->notifier.mm);
> -	}
> -
> -	while (pinned < num_pages) {
> -		ret = get_user_pages_fast(xe_vma_userptr(vma) +
> -					  pinned * PAGE_SIZE,
> -					  num_pages - pinned,
> -					  read_only ? 0 : FOLL_WRITE,
> -					  &pages[pinned]);
> -		if (ret < 0)
> -			break;
> +	userptr = &uvma->userptr;
> +	mmap_read_lock(userptr->notifier.mm);

See my comments about locking and function arguments in previous patches.

Otherwise LGTM.

Matt

> +	ret = xe_userptr_populate_range(uvma);
> +	mmap_read_unlock(userptr->notifier.mm);
>  
> -		pinned += ret;
> -		ret = 0;
> -	}
> -
> -	if (in_kthread) {
> -		kthread_unuse_mm(userptr->notifier.mm);
> -		mmput(userptr->notifier.mm);
> -	}
> -mm_closed:
> -	if (ret)
> -		goto out;
> -
> -	ret = sg_alloc_table_from_pages_segment(&userptr->sgt, pages,
> -						pinned, 0,
> -						(u64)pinned << PAGE_SHIFT,
> -						xe_sg_segment_size(xe->drm.dev),
> -						GFP_KERNEL);
> -	if (ret) {
> -		userptr->sg = NULL;
> -		goto out;
> -	}
> -	userptr->sg = &userptr->sgt;
> -
> -	ret = dma_map_sgtable(xe->drm.dev, userptr->sg,
> -			      read_only ? DMA_TO_DEVICE :
> -			      DMA_BIDIRECTIONAL,
> -			      DMA_ATTR_SKIP_CPU_SYNC |
> -			      DMA_ATTR_NO_KERNEL_MAPPING);
> -	if (ret) {
> -		sg_free_table(userptr->sg);
> -		userptr->sg = NULL;
> -		goto out;
> -	}
> -
> -	for (i = 0; i < pinned; ++i) {
> -		if (!read_only) {
> -			lock_page(pages[i]);
> -			set_page_dirty(pages[i]);
> -			unlock_page(pages[i]);
> -		}
> -
> -		mark_page_accessed(pages[i]);
> -	}
> -
> -out:
> -	release_pages(pages, pinned);
> -	kvfree(pages);
> -
> -	if (!(ret < 0)) {
> -		userptr->notifier_seq = notifier_seq;
> -		if (xe_vma_userptr_check_repin(uvma) == -EAGAIN)
> -			goto retry;
> -	}
> -
> -	return ret < 0 ? ret : 0;
> +	return ret;
>  }
>  
>  static bool preempt_fences_waiting(struct xe_vm *vm)
> @@ -921,8 +830,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  static void xe_vma_destroy_late(struct xe_vma *vma)
>  {
>  	struct xe_vm *vm = xe_vma_vm(vma);
> -	struct xe_device *xe = vm->xe;
> -	bool read_only = xe_vma_read_only(vma);
>  
>  	if (vma->ufence) {
>  		xe_sync_ufence_put(vma->ufence);
> @@ -930,16 +837,11 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  	}
>  
>  	if (xe_vma_is_userptr(vma)) {
> -		struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
> +		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> +		struct xe_userptr *userptr = &uvma->userptr;
>  
> -		if (userptr->sg) {
> -			dma_unmap_sgtable(xe->drm.dev,
> -					  userptr->sg,
> -					  read_only ? DMA_TO_DEVICE :
> -					  DMA_BIDIRECTIONAL, 0);
> -			sg_free_table(userptr->sg);
> -			userptr->sg = NULL;
> -		}
> +		if (userptr->sg)
> +			xe_userptr_free_sg(uvma);
>  
>  		/*
>  		 * Since userptr pages are not pinned, we can't remove
> -- 
> 2.26.3
> 
