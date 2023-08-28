Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21365C83F11
	for <intel-xe@archiver.kernel.org>; Mon, 28 Aug 2023 19:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA29010E341;
	Mon, 28 Aug 2023 19:24:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32A710E0A8
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Aug 2023 19:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693250640; x=1724786640;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9oUfpgxTgRdv5eXt1w8CUuI6ZlnUICMLk/aVYwn/QH8=;
 b=gVm75lIi8cDzgQ6DuDMRI029c2q3vRCkJX/h9FwPZonUpS3ablRl5b4K
 vd9DjJo3akRteXx7UPtEj5wiZCSfhU00jWFeuSZWnm1LEaOxDq6sOpcAP
 hVaVKUqmjmztM84PdHPQF2K3KYdBH+iweIaXG8Bblngwm2fNOT14ulCjG
 OQv2PeCQcgZJn+rjhYIjd1pUM6wKVOyu9pQDmsekf9pngnex88VC0otYa
 5lrOsjWgwb3gUz+LIsJup6NSc0oMhLaPjnt16QwKM8VgttklPKQwe9zHH
 O6GvbNAUCD2RaGFbcqeoWyLXn+PmSIB60hinQgRuYn92Z2pNJS2giadks g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="355515147"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="355515147"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 12:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="912127496"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="912127496"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 28 Aug 2023 12:23:58 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 12:23:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 12:23:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 12:23:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cu1/6+vclXfG6GLJy0Vz1GX+0+wrLy4AyDLtxyF8ZRSesCSwokdZMAYSlDeOHXrlcrnCOlBk5/UVMgH4wi0iBtRul/ExCo/KNjEM6MQXECL/d8SABjsHQYdVoSbmMmDpOI5WTm3dYVDR36ZYlXsQfnHfdb7jgd8xWqppgNuVg7YQ9H+9tK3ol9w8rmKpTcVdRdL/Xit1RoPIZgrJ03YlEqVJ6eDfAn9pDfkqDGzjLFgxpUFcYLd7FRrIsVwvCSR465INxxaqiz5LxFNKsWbrZ6VsAjAOqCASp8FglylniEFhErfQUfsmQgRCk3n/ga5aXtAcCylgMzTbKJEtJ9YPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibaypoF4Am4PTh433hAijwlUdXRIv8CfgXfBji4gxuI=;
 b=OXzz85n4OBK3c4i2F/Ttk2p9tfE+l7LMQG0A2zWveaXqraM9wnZoOC8e1pdBC+JPhv9j2fIpeh134UbVtBikaJhv9LImT32aFe3Gc71DqByeEj4E/QoR96g4K3f/8am3ZZOUh/QSwUCGe1JO6dNR7jNvdg5bqr3hBxaScbW94MIlRaFKKyLWOVRkyAWGHRxia7dTfASoouIr6UBNZVRO9GwYKoIFT08drX5LeiFwmgH9Zdc4a6z2mfDTT3oQF6CTwhbA1yucBB4idZTf4jw9dVqpODQvll3b6POK4A0FwraBXY0qAsch1GtEchqaiKT/tWGMYnVDN9zLNb6UqZQk7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7716.namprd11.prod.outlook.com (2603:10b6:a03:4f2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 19:23:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 19:23:56 +0000
Date: Mon, 28 Aug 2023 19:22:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Chang, Bruce" <yu.bruce.chang@intel.com>
Message-ID: <ZOzz6eMcc+ou494X@DUT025-TGLU.fm.intel.com>
References: <20230826001412.6949-1-yu.bruce.chang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230826001412.6949-1-yu.bruce.chang@intel.com>
X-ClientProxiedBy: BYAPR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7716:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d2448aa-8aa8-4b73-daee-08dba7fc529b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9l6faQVg3a4D8QiZzcf9CgD+UUOt0uEweNhq+SZmPbIfK/LM/zj2T3aSRxR9TTnaZvOUO++pCPKU/Fqf5tiPlR1dCzaFp3H92X3nvAY9kWbIFpD76yh7oTu6V28k0GRkZv3IkLC1OHhYGreP0KUi7oicdJNCwsId4THM/Hrh5aqm3DXzWS5e41aK8tN8DvXe6bo3NkSyj7NdSdaQffjS8Rz8Owi69QB//8mLHH6rxKOyqyr/7p2PMUdxG8GESs8XiYgVvYeFjuDnce8fUC9DcMWlfRbl7GsfrpxFftTOxSkszzxEPJm4l4dxZWHLISpIDiwE1vwr12amchzo9nSQuABy8JQYDV4jgG9VxNtc7VSPBATEu8b5+Adu/O3H1vWRENAGAuSgztXtuWd1vDtMrjlaZaZN73iI8YSrROO1M1FUtLokG+Z3pYXEoke2vYDdJ9jVc617y5tP8xWK6jQyg7ClNJFT89QL8/MeR463PBlanjDChMkhX7cvMQRaLeLMTm427MoUHB1NpoayABDsJGuOrsFoUxzDnYXZtqYk5y/0DHvFgvkgELwmXE5u3zq9WlnE47W7Ta+DbYHVsdLKMIWfNbjMeAmA8uZD/bBFjp0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199024)(1800799009)(186009)(8676002)(6862004)(8936002)(4326008)(2906002)(54906003)(66556008)(66946007)(6636002)(316002)(66476007)(5660300002)(44832011)(41300700001)(6486002)(6506007)(107886003)(26005)(6512007)(38100700002)(478600001)(82960400001)(83380400001)(6666004)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fh1JmKLMdgGyuDzjvOVtfJkehVY9s8jmvwg5hFcdHt1cr8N1ZzKgdMYFeXoY?=
 =?us-ascii?Q?W0/3we06qY5zaMYQnO7pcS9V3gkYG/ujD2tQsbU19xloAS7uYJapIYHPo18a?=
 =?us-ascii?Q?136ldGVFXOUJPFBUsa1duNU0x5kcYfveEgrs7Tg7PI+Jfwx02PdCLoMKl5Sy?=
 =?us-ascii?Q?5WiJCTR+wbU7XFd/zehi0YnPWlG3H3eaKOYlH7cVYJccFETAmufPhGdoIcBs?=
 =?us-ascii?Q?lA9gIa3svmsTXsCAsEnvynt1BedotvINxDjrDR4ByD1i4XopTHASuRvHctFJ?=
 =?us-ascii?Q?Fo/y0MoLH2XoDN2HKTb6qrK/qjKtWGR1GKzryh7RfGCC1GHSbYz8hK6bCaxB?=
 =?us-ascii?Q?GpnQwEPFyv1BkFCC/yczVp9Jwa03iGt622avkx5RChbmuoL6P66/iH7yFydR?=
 =?us-ascii?Q?bthfynDA59Zh+9MrgPfAltwkUJp83FG0OFFPbLKcqKzTXgPBQxsAsO3uQPhf?=
 =?us-ascii?Q?2D063KW2AtVnu68e5WmHKFANxXQssXIowqasmRolXb4rql43h4tSEY5WSbuM?=
 =?us-ascii?Q?2bfafMtfBrpsgktZTbqZCf6ShgGWcfzCdSHY1b0K+hLDbI3qNu30DBoUaUBZ?=
 =?us-ascii?Q?c1BLQBjZOLvuF4v1VcesB5JktDCwauyTaewBbcYJu/tBQjq8wtBdZ7PJl/gs?=
 =?us-ascii?Q?5H2XF5Ei/WWaaiw4ypvwqZjKFFSMqxqbeQycJ4+BhN+KL5/w2TyFCbnGYPLp?=
 =?us-ascii?Q?HgcFevGQUAIskZ0Z+JaU9cSPxjtL3KfstcU7xXvX3u+MsxXqCWPNZRY39bFx?=
 =?us-ascii?Q?Bxq1zbsCmg6dx6N5Kz11nnigbrDnjX1aBFS5rDPjo7Z3J4g0+wm0c5JXZ5eV?=
 =?us-ascii?Q?VoAayxkpktTKvyOZEEw7o5506sI76R55oZ4qvKC1zNxlM2FPT5GCSRdRSQJq?=
 =?us-ascii?Q?di4RzwaEMA5khK5Y7DSmDW22TEKQ7SlqmGPMX6fPgn0l7Dfw1ZftiwVsnAfl?=
 =?us-ascii?Q?9I5EsdBuWXFh2JcuXD8tn77NRgXkoGUjUuGR+sqZK9XCuW4cU10yHzux1aEF?=
 =?us-ascii?Q?/7aEwdOGU2GQK5GNWYh7XX6FZLi5A23a4HH0G7HNkXu7BNz9i398QyKECrZn?=
 =?us-ascii?Q?zjfyv4OrnwUZRX0gUr1SLrCx3mXwCEKg2o82h8Z6oWNLLWlv2NobjAm7WjE+?=
 =?us-ascii?Q?/JdxwmtbzECJ8LcR/X6OjNCPYqxvms278FeVtO6B4I7AYF2FxXT2/579+bG8?=
 =?us-ascii?Q?VDYE7jtLU82yWHeNypNNBNhW0goa3vMcP4gQ1P4w8XG5f6kbupMdtmerGcd4?=
 =?us-ascii?Q?ckqkfxZdkWyFxuARGs6KVQOYHBpr1UoUtQcmwNVV/RD+JhTvTHOPkTdB2t2M?=
 =?us-ascii?Q?Rsr2hLZe8rMRL32ZUyio/q2tAxQuTqJ59sA5sfc1HpisgxaNuHGWg+A6Ugtr?=
 =?us-ascii?Q?cA4ldVSZ00kPe5OHq6G1iwjONKyp3O1DIRUD+ok1Jo4Ic/ttytDkVtDOogW5?=
 =?us-ascii?Q?GlqOx66LXbcYiFwrHx7TeH0T1MsFr8xdJE+I01SIhWCVJHk76Hgm++bWOYaz?=
 =?us-ascii?Q?RoOBWucGDygryJyEyQshocCiWRnfuK5F9BV/QNsNeghXC7e9puf5OzN8yEJC?=
 =?us-ascii?Q?H2gF6ydBXrlUHtIyP0C/+C/SlqrsxrUik4BBZBYc1JeJZFGj0zsNAVZJLhsJ?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2448aa-8aa8-4b73-daee-08dba7fc529b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 19:23:56.4914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xc1ex5d9Pp1dMjMVd3wnYUSsct5OfnEtpY6Z+VmW9gKMGXKx3Mnw/erEnMq2DlwqVjcVGtXDWjg5UxdTj7ukgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7716
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Enable scratch page when page fault
 is enabled
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
Cc: Stuart Summers <stuart.summers@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Aug 26, 2023 at 12:14:12AM +0000, Chang, Bruce wrote:
> i915 can use scratch page even when page fault is enabled, this patch
> is trying to port this feature over.
> 

I think we need to ask why do we support this before merging this.
Because the i915 does this is not a valid answer. Please explain why a
UMD needs this feature.

> The current i915 solution changes page table directly which may be hard
> to make to upstream, so a more complex solution is needed to apply to the
> current Xe framework if following the existing i915 solution.
> 
> This patch is trying to make the minimum impact to the existing driver,
> but still enable the scratch page support.
> 
> So, the idea is to bind a scratch vma if the page fault is from an
> invalid access. This patch is taking advantage of null pte at this
> point, we may introduce a special vma for scratch vma if needed.
> After the bind, the user app can continue to run without causing a
> fatal failure or reset and stop.
> 
> In case the app will bind this scratch vma to a valid address, it will
> fail the bind, this patch will handle the failre and unbind the scrach
> vma[s], so that the user binding will be retried to the valid address.
> 
> This patch only kicks in when there is a failure for both page fault
> and bind, so it should has no impact to the exiating code path. On
> another hand, it uses actual page tables instead of special scratch
> page tables, so it enables potential not to invalidate TLBs when doing
> unbind if all upper layer page tables are still being used.
> 
> tested on new scratch igt tests which will be sent out for review.
> 
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |  9 ++++--
>  drivers/gpu/drm/xe/xe_vm.c           | 48 +++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_vm.h           |  2 ++
>  3 files changed, 49 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index b6f781b3d9d7..524b38df3d7a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -137,8 +137,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	write_locked = true;
>  	vma = lookup_vma(vm, pf->page_addr);
>  	if (!vma) {
> -		ret = -EINVAL;
> -		goto unlock_vm;
> +		if (vm->flags & XE_VM_FLAG_SCRATCH_PAGE)
> +			vma = xe_bind_scratch_vma(vm, pf->page_addr, SZ_64K);

I think this would be better.

s/xe_bind_scratch_vma/xe_vm_create_scratch_vma


> +
> +		if (!vma) {
> +			ret = -EINVAL;
> +			goto unlock_vm;
> +		}
>  	}
>  
>  	if (!xe_vma_is_userptr(vma) || !xe_vma_userptr_check_repin(vma)) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 389ac5ba8ddf..4c3d5d781b58 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1262,7 +1262,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  		}
>  	}
>  
> -	if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
> +	if (flags & XE_VM_FLAG_SCRATCH_PAGE &&
> +	    (!(flags & XE_VM_FLAG_FAULT_MODE))) {
>  		for_each_tile(tile, xe, id) {
>  			if (!vm->pt_root[id])
>  				continue;
> @@ -1998,10 +1999,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE &&
> -			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
> -		return -EINVAL;
> -
>  	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE &&
>  			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
>  		return -EINVAL;
> @@ -2783,6 +2780,39 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>  	return err;
>  }
>  
> +struct xe_vma *xe_bind_scratch_vma(struct xe_vm *vm, u64 addr, u64 size)
> +{

Nit, the size argument really isn't needed.

> +	struct xe_vma *vma = 0;
> +
> +	if (!vm->size)

xe_vm_is_closed_or_banned rather than vm->size check.

> +		return 0;

Probably a ERR_PTR with correct return codes.

> +
> +	vma = xe_vma_create(vm, NULL, 0, addr, addr + size - 1, false, true, 0);
> +	if (!vma)
> +		return 0;
> +	xe_vm_insert_vma(vm, vma);
> +

Need to check the return of xe_vm_insert_vma, also probably WARN on this
as it shouldn't ever fail.

> +	/* fault will handle the bind */
> +
> +	return vma;
> +}
> +
> +int xe_unbind_scratch_vma(struct xe_vm *vm, u64 addr, u64 range)
> +{
> +	struct xe_vma *vma;
> +
> +	vma = xe_vm_find_overlapping_vma(vm, addr, range);
> +	if (!vma)
> +		return -ENXIO;
> +
> +	if (xe_vma_is_null(vma)) {
> +		prep_vma_destroy(vm, vma, true);
> +		xe_vm_unbind(vm, vma, NULL, NULL, 0, NULL, true, false);
> +	}
> +
> +	return 0;
> +}
> +
>  static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
>  {
>  	int ret = 0;
> @@ -3205,7 +3235,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	err = vm_bind_ioctl_check_args(xe, args, &bind_ops, &async);
>  	if (err)
>  		return err;
> -

Not related.

>  	if (args->exec_queue_id) {
>  		q = xe_exec_queue_lookup(xef, args->exec_queue_id);
>  		if (XE_IOCTL_DBG(xe, !q)) {
> @@ -3352,10 +3381,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u64 range = bind_ops[i].range;
>  		u64 addr = bind_ops[i].addr;
>  		u32 op = bind_ops[i].op;
> -
> +retry:
>  		err = vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
> -		if (err)
> +		if (err) {
> +			if (!xe_unbind_scratch_vma(vm, addr, range))
> +				goto retry;
>  			goto free_syncs;
> +		}

You don't need this change, GPUVA handles all of this (e.g. it will
create ops to unbind the old VMA, bind the new one).

Matt

>  	}
>  
>  	for (i = 0; i < args->num_binds; ++i) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 6de6e3edb24a..6447bed427b1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -212,6 +212,8 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
>  
>  int xe_vma_userptr_check_repin(struct xe_vma *vma);
>  
> +struct xe_vma *xe_bind_scratch_vma(struct xe_vm *vm, u64 addr, u64 size);
> +
>  /*
>   * XE_ONSTACK_TV is used to size the tv_onstack array that is input
>   * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
> -- 
> 2.25.1
> 
