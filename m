Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB93CC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 22:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919FA10E381;
	Fri, 12 Apr 2024 22:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oE7nihRF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A35A10E381
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 22:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712961241; x=1744497241;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OdLj/dPMfZEq3tW+YKqja/j2Dec8IE3G/231xlliu4w=;
 b=oE7nihRF+eDoQGPFygRRMH7AYgLiaLhP9JN7bfM2oxcttkVjixdwFuEc
 jSSOvFOCdviud7nLf3QobcWaTBUT/k8VY0ybQYqJ0c6fQ/Azch1VOgKIH
 vCIBZTYfHG3HCBRHHCK3yQ/k/JdIRhHodAFGWh8bELfyFiMs+5totKYS3
 Q9VmX60OYCbEO1Bk16aywW93rxxILuZgp3o6xEkl1ifBAaqlaudX/VsnA
 AQhJkXNimcSX7JQutVEA05SHwyTlQGDnkvYtIg0rOsHGOELMMln89J06X
 9wiB49vD/F6DzMD7+D28V3GPHwGWBYADjlcizg8TkGje6J+mv0piaBlHt Q==;
X-CSE-ConnectionGUID: e0xGkHgeRfSZvT8Qcf4RhQ==
X-CSE-MsgGUID: cpuxLXAEQuKC0ppzU/IasA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19582295"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="19582295"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 15:34:01 -0700
X-CSE-ConnectionGUID: p32765lJRLygQRamDDAzaA==
X-CSE-MsgGUID: 8/l4dhjpT6mIzqezlIdAUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="26159798"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 15:34:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 15:34:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 15:33:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 15:33:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 15:33:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cx5CR2WypU9dUYVCL28GWYz+CSRRpVKaVCnit9P+5OPMNNKeR+m5+2P898v2zX/LkYQb8eh/cMNyn60NDv2Ig8A/MYhDnqr3GCnwMYrtMCgz5FdfhnGd6CPrqSr5JcHHrRoiHPXquWdnGou0m/XfzufVwvwCWo3yMzRK1keedVx1R0G2ID+6eBblNtVfEtlP0fFBtf96LA6aFEBEAALtimH4rVJX2wAfv2HQcizBEN15Oj7amnVsSSxrM/sK+AxSdw5rgnyHVS/5gGRJjtopoS7YUzU5gzJg4VKCsSnORyw87y/jBE2bPFtJe0e3PsfbkQEUp1YcCFSJ+FrRJpXcxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FF89DumCV9pYvOPzs0hzwA9M8ByH1uCzhliG84cXc8Q=;
 b=gmrJ0Xp4xw4ZS/As22zL07amRo9GAbQtjKW6rKZKr8chWb/kPnImzkR8KgjES1OCci5nYrtAZN/seXVf74AQ3UfxklcmHR5+65aFPfVaQfQ0g+B7JmockdafKKyqo5HAHUX/ihMmWb0Tj2+DYXsqWXxFZttPapULbMUXD2dB8rOWM+PtguktOKy9PbNp5b3UsQ2H2GPFNIhjYty9YIQOm6wxuXVrVr9N5kZPL7KEjstzg7TDxzalxMl82LCYlPrPoHryXCXrbcGcm61/Y5IGGR4Wut4xR8hMPYPucs9wN9OVcJ5+WVbInS6dwwtr7msdXhugQ/foj8MM05XHdY/iqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6147.namprd11.prod.outlook.com (2603:10b6:208:3ed::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Fri, 12 Apr
 2024 22:33:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 22:33:53 +0000
Date: Fri, 12 Apr 2024 22:32:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/vm: drop vm->destroy_work
Message-ID: <Zhm2huZGAm+pr9Z9@DUT025-TGLU.fm.intel.com>
References: <20240412113144.259426-4-matthew.auld@intel.com>
 <20240412113144.259426-5-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240412113144.259426-5-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR07CA0066.namprd07.prod.outlook.com
 (2603:10b6:a03:60::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: 6280a22f-d25e-4bd3-be7a-08dc5b40a1c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7rNI/j7jVTP2W92zVpPenOPEH9qoZMI9DNgRkMaFVwqn8TELnwjy1ykjOZQd7vgc3/+BYz81WaaP2u9JtcxRJaaEJEycJX/22EEKO7B+mK4NndwOsrOvZt02FKjbqyY1Cqx5ux2ARBPOOOsw9+NzjS9eapuGuzDBmjW/gVzrrMKLsUf3k9BOyUrHbn7vBXSGfbmZQrlml5HTRP3yzBYhWbNjNAk30CEpMkJW3DXHMGvHnV57DEs9uubwtKiDIanQVVJ8nezZknzg2rDW2WI6DDOqNEJWg673MTdzMw8Hg3vzUvO4yflZVyOi+yrnVeZRFI1PTUqD9Z8PHrtPzeWK4A/cs8bEcutTtFloIKFQHjfF8iI6p479z0c4KV1SnDc0RNz24KLocfFIHK+qNOGc7UsadxMp9AVfRJi7h6/EqMadRLfSYiTkiVVLIa0zaN5eMMPLjPr0aSkrbvbpLr6u84kk1GBUpT5lXvHd5uctl43i1rgtcLmID3FDLX3ripcu7XuaZKKeHGq54gco1RJE2vs48gK0Q2FmXrD9nAk/KPvEGOsRLl538p3XW0yWUlQ1JxcnDVR7Xc2ZRXEyoOpztoZu8ZwHunYYynW5RqYzB0g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MiQHv3d067Qe9OFtfg43H9bBV0VpAolx33pXkWizho68ovhzCwSdQ0PkGyDE?=
 =?us-ascii?Q?0FOWAZk7Leevr+Dbk2LTVMRNPdRHMLLD1v0BEkPxPnIv7Lf96ZhaEuVA/5na?=
 =?us-ascii?Q?cwqLPjJjj+qpvsT0BzwlCMifDkyln2uCjJhD8XazHyID482pYWQdG9uIZYZZ?=
 =?us-ascii?Q?z1aKn05ZwWqirf8DqoFcX0JN23JCpu/CE5V7d8sgQMB4tuWcIUyMGdMxCahl?=
 =?us-ascii?Q?26ONgy/Du4M/R3oNYJ9AtHqVThpjStVrgwQX0weoA2ExKCXbeLdVleJpLzM8?=
 =?us-ascii?Q?1GoH/GGhIPPt1Lo0mP6XJXeKmsMHTzWzgRvQpG1O6KQPCUsajM3zfEfbvk/A?=
 =?us-ascii?Q?gzY8aULjuOJl/KW53Dk6dpORY5M8hkoiy3j0+mhZS4DbpNSMuD+85lE2poSf?=
 =?us-ascii?Q?elgcQbmLzq84x+w6tOkzBScigTrtKYzLY108DNSnTi+sRHvX3Q7ekTbU1JZQ?=
 =?us-ascii?Q?mLGCNN5Nr1FGZeburl9EjBZ+XWAZM1TuQbmeZ/fzQ2zHXPW4Pm+4k9ZNZSbQ?=
 =?us-ascii?Q?U2FQvRzdx1XInjmcRlFrFbQnvZNSEx72CjFxGaBIZcwhe5w6S4w5BwoJB689?=
 =?us-ascii?Q?YUCzzRuzHqrJISoYbZCNyszW2/PQBRzyFfbS2u/pwAPYX96FX52xspih89CH?=
 =?us-ascii?Q?U2H/h3IY9uBwAlGwzfK8hOCIKy9YGSLrjdnF2U4HgA0Sd81cWyUJZtB3yRp4?=
 =?us-ascii?Q?mqDAQmdG+qpXK+C5fyZtaNDmxqDvxHhJAJdpMUFTPnlt3DbqTOWTSpnFZ//H?=
 =?us-ascii?Q?n24x+sRNFjh4nuQK8AnhS5sLY2YUaNC3NTx1J02UuSZNwxA8CmGtGfbBNyIK?=
 =?us-ascii?Q?c6qW1xuQs+AYkirqm3BB48hDn/62ohJtihgUn/QIfOXRDec7HbUNuofqAsKY?=
 =?us-ascii?Q?mwM5o0UFcM6G0CXvzgQltsJIWH4efu7TzjrhHpXYVLIpjlJcquzXF/rx/TVe?=
 =?us-ascii?Q?k4Za+IOkNsNdZS6YfXGSv06R05Q7JghLQtsUKk1rMIWO1G/f8IZnTyTzslRt?=
 =?us-ascii?Q?6Q6hVsL73Zy7vGIcQiJr8kLzgQ2XFaeWZxhrFocmxmAFaLE7zHKlzRSCnFwj?=
 =?us-ascii?Q?o07f9teDKRaE9Cjs977l5LM00dr0pMdmxTKULNOxydkgClHdRbrNqj5x1EQK?=
 =?us-ascii?Q?a1sQtm9ypE2h9MuSbfCgMgtU7y+EK9cSaOMZtaCpfuaesvhIvzmHb+uHTxE9?=
 =?us-ascii?Q?5k3opoRZKIGPRFTco0ISlNL93tqHljLW0xBd5h53yT07GD73J66vB29/8I88?=
 =?us-ascii?Q?f/hkqrCb317WvpdIUdGR/gHAy/TbPC5pBH08Cr4fc6n6s6X7wqsOSPm3mUJU?=
 =?us-ascii?Q?STUrre0IoScdSc5qbV2RyQLMrYnjN+VwtlkyzsfI73HmglQCMSPXv8+n90aQ?=
 =?us-ascii?Q?YoCXDaGBsqTsRIB1lrjsxBN0WydSKtvYe+uHBBRcWW76Go8/DvG6ZNWMjrf9?=
 =?us-ascii?Q?NxtM+6nGxL1drOq70nEkepNWsY82D52ESglSDyVAQsgaMB00f8ln/nC7LGNB?=
 =?us-ascii?Q?DNLb3fkbCHSS03GyxT1Gq0HOT2FiuoPErEWH3qUxGUYHPqgeZmvlBCc42jXf?=
 =?us-ascii?Q?uNOEiZftb+t4NEkLTBBw/Cs3ieHzlUclHhYbOq2Nd5PPYJvSjV2bCCjfr9bg?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6280a22f-d25e-4bd3-be7a-08dc5b40a1c6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 22:33:53.0969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVYBRj51JPyfIYV00BxHqqLWcn6K0xY7k6Pd9T3EShKHcODOSq8U1uW1V4UqdFwoex4lsTq4WJ916YUM6l3dzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6147
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

On Fri, Apr 12, 2024 at 12:31:46PM +0100, Matthew Auld wrote:
> Now that we no longer grab the usm.lock mutex (which might sleep) it
> looks like it should be safe to directly perform xe_vm_free when vm
> refcount reaches zero, instead of punting that off to some worker.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

This does look right in the current code base / series. However in [1] I
do suggest deferring 'close' part of xe_vm_close_and_put to the final put
if the device is wedged. If we do that, we might need worker again? I
guess we can figure it out if / when we decide to take my suggestion.

With that, this looks like a good cleanup:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/patch/588557/?series=132232&rev=1

> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 17 ++---------------
>  drivers/gpu/drm/xe/xe_vm_types.h |  7 -------
>  2 files changed, 2 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c5c26b3d1b76..300d166f412e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1279,8 +1279,6 @@ static const struct xe_pt_ops xelp_pt_ops = {
>  	.pde_encode_bo = xelp_pde_encode_bo,
>  };
>  
> -static void vm_destroy_work_func(struct work_struct *w);
> -
>  /**
>   * xe_vm_create_scratch() - Setup a scratch memory pagetable tree for the
>   * given tile and vm.
> @@ -1360,8 +1358,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	init_rwsem(&vm->userptr.notifier_lock);
>  	spin_lock_init(&vm->userptr.invalidated_lock);
>  
> -	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> -
>  	INIT_LIST_HEAD(&vm->preempt.exec_queues);
>  	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
>  
> @@ -1599,10 +1595,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	xe_vm_put(vm);
>  }
>  
> -static void vm_destroy_work_func(struct work_struct *w)
> +static void xe_vm_free(struct drm_gpuvm *gpuvm)
>  {
> -	struct xe_vm *vm =
> -		container_of(w, struct xe_vm, destroy_work);
> +	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
>  	struct xe_device *xe = vm->xe;
>  	struct xe_tile *tile;
>  	u8 id;
> @@ -1622,14 +1617,6 @@ static void vm_destroy_work_func(struct work_struct *w)
>  	kfree(vm);
>  }
>  
> -static void xe_vm_free(struct drm_gpuvm *gpuvm)
> -{
> -	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
> -
> -	/* To destroy the VM we need to be able to sleep */
> -	queue_work(system_unbound_wq, &vm->destroy_work);
> -}
> -
>  struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
>  {
>  	struct xe_vm *vm;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index badf3945083d..7570c2c6c463 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -177,13 +177,6 @@ struct xe_vm {
>  	 */
>  	struct list_head rebind_list;
>  
> -	/**
> -	 * @destroy_work: worker to destroy VM, needed as a dma_fence signaling
> -	 * from an irq context can be last put and the destroy needs to be able
> -	 * to sleep.
> -	 */
> -	struct work_struct destroy_work;
> -
>  	/**
>  	 * @rftree: range fence tree to track updates to page table structure.
>  	 * Used to implement conflict tracking between independent bind engines.
> -- 
> 2.44.0
> 
