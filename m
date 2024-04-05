Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B1BCD1284
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 01:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09B6113753;
	Fri,  5 Apr 2024 01:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAOsky+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ABB113753
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 01:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712279349; x=1743815349;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tbYhFTiLQ1w78JMKzEKHe3oIxT4RnFbn7w1vTFcObF4=;
 b=PAOsky+RrUosLziv9KFT2XA5IvqS91fwk6xXzkd4fNe8n5eCZvy+qJ/q
 37Ck3bN+Bb5HBCj7/SVshfIoRXNUbgY9TNErKgSQRFlIwVJkDfbaNAk0r
 iBW5q03c8GtPGB/yDcDGuDMFpKlK0yk8rURfSIL/BRebyPlvEXKwv0fS1
 j+URuZSCGxd9wPs8a9bO9PyZax/RWb49HAt8LX7g4xK6TYi9MNIA+eEBI
 mFpt1bRl9a2L6wH+gt399c3yDOtRchLPwszWZE8qCms8SVlH9xz/0pnSl
 M6ipwsLSQ8sOfaX24nhOicwiUWOvIb8VpYzQITn+T9j/Pi4ze0zsYBxWl A==;
X-CSE-ConnectionGUID: Ma6LWdRtSZKb+MjxRpGtGg==
X-CSE-MsgGUID: 6kt+H/MsSYG64tan4uum5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7440664"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7440664"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 18:09:09 -0700
X-CSE-ConnectionGUID: 7S/ntlwoQZOyytVflpfW1Q==
X-CSE-MsgGUID: 6ZS8DJSJRZeZQ9XZa2QnLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="18871430"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 18:08:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 18:08:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 18:08:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 18:08:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 18:08:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHw2Eq0obPhspeGSDSeqnkDVbAbuTCZS2tVr/jUwjTNd5N0KrhmRGGEReV2LVaPtGiusPGXnAwLu7Q2tao7aH4vEX/x0aKvwF4wQWIQ5zCCdgtxhcgcdxw1h8KQA2UYLdhE8dxdKfly3BPU3AbO7C+HDMjufPhaaebCQKqyaMZRsTm1KFL03lFzbLbvqEpNMkYI0zLpQ0G5zSe5fRj1oQpsfAwH8lhmWc2WIuaxGDqvPR+XBHTDoIFqvN8B6au8xfzofhhyBaynX2ce8I29zEKzRxievA1cFmtDwadMhi4D1oxL2jIu5gZnupGnIsSxuql/ozz0IGXf1tv7woxNnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AL8VQ4YpRirUYpjsGkibU+KHdq5qKeWc5nMO1yM375U=;
 b=og+NF/ArGsieJ4mOIKwErgvORMp3gJFfSrt/4OhogcVrrBrWp3kzv3ln/0u44xAJP6KgrSL79E/V/rOfUTPvB0JLBmuoZnzM5t2/LQxJk3idlBIJsxmyoB3wLVCW7/AjWELTyzzcVqMtzYOJKled0ODlQ0L5nXyWwDVrHHFJ4g7Y5zguRIbqDRHBWFgarnwnWyIk/s2ih6zg+d7iHp8xqHpT1o8c8QMMvD+9gzHVsgyfzEmqYKQBO1oJcVbyD8n7MLIuOP1qqsR5ulbcZ1lnYmvJYaB1lvA0vZ4HB0gHCvgREq4q/hAKpxMKdZ8azJ9DG2x6wuKR9F0flh3vAKf9VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6870.namprd11.prod.outlook.com (2603:10b6:806:2b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 01:08:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 01:08:55 +0000
Date: Fri, 5 Apr 2024 01:09:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Oak Zeng <oak.zeng@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe: Use hmm_range_fault to populate user pages
Message-ID: <Zg9PUhutYUXXm5+R@DUT025-TGLU.fm.intel.com>
References: <20240404061631.4150858-1-himal.prasad.ghimiray@intel.com>
 <20240404061631.4150858-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240404061631.4150858-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:a03:333::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6870:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vu/BpK+epAJkvceLQRc/tOuHCSsQqMcQQLSx3bMOHx2rO+/YAuC/RtjvX5QjLP5gDZ45MbgwE+f5MsozL3HDWZsTONg0ZeVHlSNprdGLkx5IsBq1PkxbLUu1W3B4gssOZIBeaAd/1nTV/WSo36PhEaW7Y4V+Mkqot+V0Yf3XqOsBqxsDHGOjmdkzKAwifVSfqmLHUbbKzu5H/RblfzLGigJi8k95F+tQ1axGihlMwU6Tlt10NH9P/BwP/pJDf45h7isGFkGEec2W9DTeIaGXR45PZk0njgXOl60twt/k5FGTGYTHDpyyw7QvtleoGuXJTrg2sfDqU67bUm/c3yo+FsjNDR3uu5flKXc6Z4PnsVnvZYjKMivvXl0P67/KLAML9KBZkcxzOoDSBauFpkRx61rxo32Qdsmubmr4acJs0JX6Ro81obhXWPIrMQl7O8XerTFbHqt2FwGTkvpH2s6/kdW1SEfcUSlL3N9glcFvWvPd1fZTuZx8wME5Sdz2d97g2DClyVODVu46K6Gvp4AWKqk3IRn3HJlmWRSWqiBY+59kSOH6jAZI5CDbDlMq4UF7kp4/WhQa6rBLyeO7xWlcSTg0zhoDHdwKDfhxV3cxNrr6+LJNETBAAlXbkua9OUPSlh8OG/lYZq0gD1LYoxf7lhGA5Z5oEind8U7m+LLpKwg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oabLyC/9HuxokvBwDqFRN6wo1wjfCivCctLyI/nE7WCobeyhG1rqk+9T4vlB?=
 =?us-ascii?Q?5NQLXcVAOKvlKaedxTrC3jrHytjG0IhGPC50/Ia0E4OzY6K0NawByvE2E30c?=
 =?us-ascii?Q?y82szEaO1w3TgXuap8ZxaayIen0jf++763SUFzcI5gcxjoLwz1sJpJanPR2r?=
 =?us-ascii?Q?K1dCz3IrcKtYxrlXBY2LoWDvqJ3oJSsBgxk/uFNnQF2xWyapxcpIlx52Srg3?=
 =?us-ascii?Q?3PdrsxgcBd97CYitUYyTsUxhHPzE6z5TD+YASYlw2tu/a0O5hzWeJXl9pSua?=
 =?us-ascii?Q?HuKYRqvO0tLER5vbySUAMW5RVAv2qpZXgZf5nkr1mqBA9OuVoXyq1IDv1+go?=
 =?us-ascii?Q?NCUHaSAWUiLA/rOV3j1g8ZQvkkQK8EornRxNbqNExzqC+8SegbOOV0TxTwHn?=
 =?us-ascii?Q?6fvUYpoZj6AfPeirP6ewEVn+Sb+yb65UryUKIE2e7omLw/mlLby/GP+X1Vfh?=
 =?us-ascii?Q?DqZ9hX6qzdFRBiGVcn3rBgP84V2lGO89ffAxpUuiSmzZ3JtRh+2rfVDuGSTZ?=
 =?us-ascii?Q?UTX2SN6dpJzgKb2FNN1ijKsdbhNQAER7QubSw9+uTiaufRLBcg3m8QQckkwk?=
 =?us-ascii?Q?RsWz8PSitbIQCpdNw9mmGshfiE6PPripr0cp5nNeTgI4q7YJD3R0R8+avLGf?=
 =?us-ascii?Q?ui5z/QP8QQy91Pm912tnoLqIZ00qdiIkvg6DnMyVsVqVrySSQaf56mw79HKa?=
 =?us-ascii?Q?WGo+esOKTGA8zq08JEdzmg8jgJKdwPcfja/LJo9H8SFeUrhnjgNV185ZMHvD?=
 =?us-ascii?Q?k+A4FJAGWG8N+huVPend+0ykcnXH0WxgaQnyVvcnqxs+k9YHWhpgIk+uaztO?=
 =?us-ascii?Q?HksAC2wcPoFn2Ca8a2UZqFAVGL2BsM+0iKfwZpord7uYCmXbs1uT95XlcwBM?=
 =?us-ascii?Q?maFuqUvGGAFDnDaKP/tKnZVYxbV8fPm7a3uNSVdsH7utm0wAPwqMvCXAHGmE?=
 =?us-ascii?Q?Em07PpO3WkGcAF0LhxFvA1g0ft/KuVy6gIaFdWkkSZjM8WkR4WTfww0ofJKJ?=
 =?us-ascii?Q?ycSXl3OBEN0mlWZGqziBn3NF6dEtRlQcrrsBP/kB4IacjMm3QgY522T8ODgf?=
 =?us-ascii?Q?hvoAKovc5q1ee58TOCQUOG7UKjRtUQHlCH7J4pIKbidLKoZzQLv5Cee9QFb3?=
 =?us-ascii?Q?AmwOPodSYGfjO9wkgH6RxBx+zckGZQ0yWMDKbokq1gxEyUT4hv4qgc9R0VzM?=
 =?us-ascii?Q?fGLrW9FVmYTlJjqUDXzXxDQLxqbV6YO5kyPcdTduTG3okwer3kI8QY2dUkFH?=
 =?us-ascii?Q?eQI8szHyst/tixacXzftFiZa/oB8gZvfY1q5hz0oAfGAuxt+m0ErkElIe8sP?=
 =?us-ascii?Q?xR56SE24IYv1ge4Tvb2BGkDh+O7J4DxnV6zGAoicQsN3oHPXHsqptr8wWj3u?=
 =?us-ascii?Q?RoFHWOk7V9cCUK6QlQA9Xdl0sJax+wDrXdtxO1DnhGY/Fedszb/lYM5qwc8w?=
 =?us-ascii?Q?BPihGeHs7RQRX16VmmW85vnbiKB/zgHXzYKwh6FU9iyYoaqhMDwaZbkYyOJj?=
 =?us-ascii?Q?joFaCzP6lGOv2fS4RXlRZNXc8ugxpvO2AqRQ8iCG0cJDwT68LztpA9pOoNEX?=
 =?us-ascii?Q?hSLXAlk2lOkHoCoEmZauVPH9AMChqd6Fu4dD55K5Aw8d2hMpXxIZ2BrEynnT?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01121258-dc01-4616-385b-08dc550cf6e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 01:08:55.0967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKvpsMWV/y9TqS8Gu+o0/pP7U/zrjrDd0kn/bon1gLn1YTW76cq1R26oIvJ2RvSD3rM6KLZ20vrnoWOP94WiGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6870
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

On Thu, Apr 04, 2024 at 11:46:31AM +0530, Himal Prasad Ghimiray wrote:
> From: Oak Zeng <oak.zeng@intel.com>
> 
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
> -v1
> use the function with parameter to confirm whether lock is
> acquired by the caller or needs to be acquired in hmm_range_fault.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 118 +++----------------------------------
>  1 file changed, 8 insertions(+), 110 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f4bfb2705956..61448e9520b0 100644
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
> @@ -65,113 +66,17 @@ int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
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
> +	ret = xe_hmm_userptr_populate_range(uvma, false);

Nit:
return xe_hmm_userptr_populate_range(uvma, false);

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

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
> @@ -955,8 +860,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  static void xe_vma_destroy_late(struct xe_vma *vma)
>  {
>  	struct xe_vm *vm = xe_vma_vm(vma);
> -	struct xe_device *xe = vm->xe;
> -	bool read_only = xe_vma_read_only(vma);
>  
>  	if (vma->ufence) {
>  		xe_sync_ufence_put(vma->ufence);
> @@ -964,16 +867,11 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
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
> +			xe_hmm_userptr_free_sg(uvma);
>  
>  		/*
>  		 * Since userptr pages are not pinned, we can't remove
> -- 
> 2.25.1
> 
