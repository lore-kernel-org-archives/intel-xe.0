Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABFDC47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 22:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175BF10E281;
	Fri, 22 Mar 2024 22:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEhSycsL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B9B10E2BA
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 22:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711147945; x=1742683945;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8bwBzMEmE67irMFLU7mcLZbZKNY5gLUoP/KiTaX9n6M=;
 b=TEhSycsLjk57d9f6krAdx6uCs9HPONxlErnZCPSfWJ8Pt4McEiCTZlAg
 92pSGrrKUyzeBlW78tkJ+BaUw6su5JblFBtRDZ99kLgOX9lHqFgGl7doW
 KSDA52zCXMwIxMJpYQCYgrtKje/6QX6tPN5mcaxJtcp6rk+KR7S3oaInE
 FeIvI3hkSu9PPLhMdngrkihSeaDt56Ioz3PjDMZ4esTK/6UFjguUZbXqE
 Yveb8lpVTlBtAaN3QGi6u9PUpYy1c7BcXkFYrlT3PQ9k9klrFxcSQCwtb
 QGG+O+xk0BSRE/zLbRRPUHYSPP4nFEkHOzWjP0cvGig//1cXIsXH0DLZK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="16851802"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="16851802"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 15:52:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="14950095"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 15:52:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 15:52:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 15:52:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 15:52:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VavI4fIPFlhCNBQt1KWxPul13+oH5yof2ZEQnXE7s3misUpixZIYRrVPag+5H/eOzLeBqU1jwbxgXeXM2iAIobZd4GOlNM3NSbUb/Y1n1jv2keTdvc+00LOA1jpz2TgQ9v9onyLLfMb/7OcChHA6xW9Oxq4ICUVvahLmNsUHiUI9kt+IWbJ3BS5ohMr8wEh3T13qs6urLDjJ48LEUXBpKHYWpizBNDXnAGCDSXqpi9xFzglZE/NRBfHr/9dCrO4N0CmH+v6lpePnS05/+WYeY1NSDYiS7JP47Nm7vhWB995LsBsRg5yXUI/pVaxPxDIxjWAbArpGqfyZW56I3UkTLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbGz3V6RGvekyeoc7NRPPwf9KfpzCVI4Cj7IVCWEEpg=;
 b=bPSTchDmkg3ubtUcDBYTXjLZpWSuMnaBFdPjouJSZrVxuQWgty/JiPxdJVoiUyrauVpIKKWxAijE0IS0r89gpeeklsJ4PdDAyldWGUsnjCamWSlc/rsyese30oF6MkqtI0pt0L75Y/9fbx9cRVHKGQ/vCPaaWt/fO2Clzj5sOM16lbOV/BPvhWMR3ms/V2uHKiYAG8nUQSjEXVRsN+HcXdW35NAPCFJj0wKatmabDSmQOxBCaY7LuDnJ6r0BngVXadBTxwaLkTvtdDrhVH3FUxIZPc+OnCZUQwMhJkqPxRd2O8XsGZQAIXBg3z7679nOkHZPHYu3UYgjGCgOErbTZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8113.namprd11.prod.outlook.com (2603:10b6:8:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 22:52:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 22:52:22 +0000
Date: Fri, 22 Mar 2024 22:51:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 05/30] drm/xe: Update xe_vm_rebind to use dummy VMA
 operations
Message-ID: <Zf4LcyPsHYCuo9tE@DUT025-TGLU.fm.intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-6-matthew.brost@intel.com>
 <SA1PR11MB69912CD0231A3F2D7F5DC94A92312@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB69912CD0231A3F2D7F5DC94A92312@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0037.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa6f9ea-dffb-4286-d376-08dc4ac2bc1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UaTD9MaJRrGzZUjXFRqyrwznVWx+glPAYEMS3/FKQqxVdLgvxfpo8tdDrlIi9t86zjaWyOliST//Uc53uBOKHnMeDfJ8yc4IlQSDFPUfjKeqoEoftYIE4Dvx2YLc3/3C8tjVdZTkeJ62Amvm4QR3cM/JQUcCwiLtJ5xx5Pur9Dx2A1liIUZ6TzV3hd6VeB7XGjWcw4aWxMX9565a0VMFB57y7aSS3RNt5PfRl7TcHouy9MC0RZ1Y9Wtx2HxjSXjsnkW+YDn5eYhdQbcfScuXz5+7yEbrvTIHYFmbc6lvrMj7G3SVAqGpDrGXcF//77KwkuIh6rowDTw49PQcper1QV02V/yaV4m2NrUEedEZ0ncTJddRYzpditS+dYYOSiS8BlR5NuYGWxgqgCk3grreCss69HZMcd4/wUOUojT+7ZZehPMF7P1Pl90YSbAZwHwqSngqnh7eE/Bnrv5SDvIWmgm9Ow40BKIGIJknIfZg+sBh7bP1egXttCSF0ZMlRMbxZ5tz024NivQad1tB2x6TSKUor7MdOEtIP9TVMGDPvixXFiy7ALJjkx6t/0ot9hZOaddK2zHbCRn2tStu1z3m9TG8xKleorqnUmp7XvrLA/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kBWzMU59rhQp9oCxjmsZVjT0TS7J5jP5OykWqZozrDD3FedBTWuNtLmGcdGJ?=
 =?us-ascii?Q?QBFhBpjD3BcSX97HG2erHTvCbcDBDrJnE1m9aWnRFSREuDToydxLbO4kiWk9?=
 =?us-ascii?Q?AN/tUopn5oLrCs49tS6MP8Y7IDVST+/z3pDwRlwuub697QO0KMZeH4FFwsuJ?=
 =?us-ascii?Q?q1c7/nEsKoGRB2eJ0r9gEGhPLDPWNpkbC4+RJMt07Fyf//M0qZtCNCx0KSKQ?=
 =?us-ascii?Q?ZQHvWH+Kmo/K2rsYzYpN2mZWLciXtai7Zy9wBRpDdgrOcpveSA7ZRP8b8oz3?=
 =?us-ascii?Q?IYC3LxxPM7JJW0iYZm/k+eYz0iyIfcSMs7LIq8bp7WnO4HwAWuysKNHRgv+g?=
 =?us-ascii?Q?RTSVyXzxLpTWy5Gu1oBqClgg1PfMK7UK337zYyeQliO2ndebcIsYHDhssfNY?=
 =?us-ascii?Q?8Hi8BCKMhSl418s0zE/W6bzon29YZinV9qE3kjj8DticuBy1niW8CVov15z5?=
 =?us-ascii?Q?MFqhH08HyN5jBpeGJBHNEYZzA6kzcyQCeIRdeM9D6aRNcVSxzLrVa/DEDPF8?=
 =?us-ascii?Q?lhBzZG3g6UDVJxDS/UCwYxc6JDAMHKHyJmVgIbWX3rx2XXYgmGNHXohdqHTV?=
 =?us-ascii?Q?ucksPhStdTPVUjuFoz5mBjbK6JxVIWwWShPPld8GA3ayaaOC2PAJRElSsB5/?=
 =?us-ascii?Q?38nlCLm3rZvPMwS0gcPbzqGqX7ZKweVfxtS+NMcFdwxWFs7Mgm8g0v213BGv?=
 =?us-ascii?Q?+RCb4mw0iQQ1qwDECz+z8nAQap07vJfyppyUPu4T6Un3WF4bHdrZgB0qTEGi?=
 =?us-ascii?Q?Qzld3UzPiQerwk8v+UgG1rVO4oOGLNsCutkTq7CC/MBRdDmq0jIt+QagkrSH?=
 =?us-ascii?Q?wf827hIwzoKAlvuclpp8hnbigQoZetsw7KaLLYyEK6JdWCp1EO5ifg9WyQ+d?=
 =?us-ascii?Q?qHFXNvl/TZo+GygJ98ibY9Fll48T7ogQqPNpUeOh9DFGJAoVkmst4FCKmNnK?=
 =?us-ascii?Q?Qn6wCIwA6Z7FGTosEf4ULSOZ1Yyz9/8IAoi+cizelfmwMfgmR85dN6k+oARx?=
 =?us-ascii?Q?djmrGhHjEJeEs/5BMwUzlvDEowwUUKUAPB1WObMQvkpG+AvY/VVEbgokTx9U?=
 =?us-ascii?Q?QdzcVJxeJCZwdBGuq93PSzoAv16dMP47nPh4EblPSW5o5cpUsi5lSxxDQTse?=
 =?us-ascii?Q?kvCThTEuGeiScoaPMVAfCaD49MC3f03xH+b5zdsR2tEvBUxEiQFR5s+ERwsI?=
 =?us-ascii?Q?GL4VsDFH2X9R1bdo4ZZkUIzlGNV7kXis8oRuMVrBvZsYSyBZAOst9Qg3XhVf?=
 =?us-ascii?Q?OwZhemP7CtbDDdHBdPgzk1xa1QyhX7ONdSfiZN8uGqGszZBAjN3JiQAe776l?=
 =?us-ascii?Q?CwlW1IoqVCQNLwVgE4eOlBAjT56y0dpfJdUUPvfHzDpfjDK+IbUufiWRkAeZ?=
 =?us-ascii?Q?NvLuApsKVkAmFUAaRjX65hGuTjcOfDBs1WUrVz1AgC1yhjEjAsIlwjSnnP+y?=
 =?us-ascii?Q?70hyisd3vLnZ4hUjzkkfTM9EcZxJrnFbBtqlMQ8NwehRIWe3eRqTK2y1Nxn5?=
 =?us-ascii?Q?ItddrEchPadPSpP4AXJmtzJg1GLMCUWNfi7F8wht/C/VYCyY2xRnnaosmccb?=
 =?us-ascii?Q?TpmFUQh6jgL4lcByitEH4PHq8oUAx6DfzpZInOtAXQdwXgLWmzcPCyQInTXu?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa6f9ea-dffb-4286-d376-08dc4ac2bc1b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 22:52:22.1218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fqpVrpIKKsud5UKtZrgzPXMKsV6h7ijn2A7GA9MnwwK4Qm7JnFTSvhk3X3mNFxXASCnNRDVdRU6wU0/XaGVzcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
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

On Fri, Mar 22, 2024 at 03:23:08PM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew
> > Brost
> > Sent: Friday, March 8, 2024 12:08 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH v4 05/30] drm/xe: Update xe_vm_rebind to use dummy VMA
> > operations
> > 
> > All bind interfaces are transitioning to use VMA ops, update
> > xe_vm_rebind to use VMA ops.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c       |  47 +++++---
> >  drivers/gpu/drm/xe/xe_vm_types.h | 189 ++++++++++++++++---------------
> >  2 files changed, 132 insertions(+), 104 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index e342af6b51b1..0bb807c05d7b 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -755,10 +755,22 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
> >  		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
> >  }
> > 
> > -static struct dma_fence *
> > -xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
> > -	       struct xe_sync_entry *syncs, u32 num_syncs,
> > -	       bool first_op, bool last_op);
> > +static void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma
> > *vma)
> > +{
> > +	vm->dummy_ops.op.base.op = DRM_GPUVA_OP_MAP;
> > +	vm->dummy_ops.op.base.map.va.addr = vma->gpuva.va.addr;
> > +	vm->dummy_ops.op.base.map.va.range = vma->gpuva.va.range;
> > +	vm->dummy_ops.op.base.map.gem.obj = vma->gpuva.gem.obj;
> > +	vm->dummy_ops.op.base.map.gem.offset = vma->gpuva.gem.offset;
> > +	vm->dummy_ops.op.map.vma = vma;
> > +	vm->dummy_ops.op.map.immediate = true;
> > +	vm->dummy_ops.op.map.dumpable = vma->gpuva.flags &
> > XE_VMA_DUMPABLE;
> > +	vm->dummy_ops.op.map.is_null = xe_vma_is_null(vma);
> > +}
> > +
> > +static struct dma_fence *ops_execute(struct xe_vm *vm,
> > +				     struct xe_vma_ops *vops,
> > +				     bool cleanup);
> > 
> >  struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
> >  {
> > @@ -780,7 +792,9 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm,
> > bool rebind_worker)
> >  			trace_xe_vma_rebind_worker(vma);
> >  		else
> >  			trace_xe_vma_rebind_exec(vma);
> > -		fence = xe_vm_bind_vma(vma, NULL, NULL, 0, false, false);
> > +
> > +		xe_vm_populate_dummy_rebind(vm, vma);
> > +		fence = ops_execute(vm, &vm->dummy_ops.vops, false);
> >  		if (IS_ERR(fence))
> >  			return fence;
> >  	}
> > @@ -1289,6 +1303,11 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
> >  	}
> >  }
> > 
> > +static void xe_vma_ops_init(struct xe_vma_ops *vops)
> > +{
> > +	INIT_LIST_HEAD(&vops->list);
> > +}
> 
> this already showed up on patch 4... you just add it in patch5, then moved it to another location on patch 5...
> 
> can this be better organized?
> 

Yes.

> 
> > +
> >  struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> >  {
> >  	struct drm_gem_object *vm_resv_obj;
> > @@ -1310,6 +1329,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> > u32 flags)
> >  	init_rwsem(&vm->lock);
> >  	mutex_init(&vm->snap_mutex);
> > 
> > +	xe_vma_ops_init(&vm->dummy_ops.vops);
> > +	INIT_LIST_HEAD(&vm->dummy_ops.op.link);
> > +	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
> > +
> >  	INIT_LIST_HEAD(&vm->rebind_list);
> > 
> >  	INIT_LIST_HEAD(&vm->userptr.repin_list);
> > @@ -2140,6 +2163,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct
> > xe_bo *bo,
> >  		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> > 
> >  		if (__op->op == DRM_GPUVA_OP_MAP) {
> > +			op->map.immediate = !xe_vm_in_fault_mode(vm);
> >  			op->map.is_null = flags &
> > DRM_XE_VM_BIND_FLAG_NULL;
> >  			op->map.dumpable = flags &
> > DRM_XE_VM_BIND_FLAG_DUMPABLE;
> >  			op->map.pat_index = pat_index;
> > @@ -2465,7 +2489,7 @@ static struct dma_fence *op_execute(struct xe_vm
> > *vm, struct xe_vma *vma,
> >  {
> >  	struct dma_fence *fence = NULL;
> > 
> > -	lockdep_assert_held_write(&vm->lock);
> > +	lockdep_assert_held(&vm->lock);
> >  	xe_vm_assert_held(vm);
> >  	xe_bo_assert_held(xe_vma_bo(vma));
> > 
> > @@ -2473,7 +2497,7 @@ static struct dma_fence *op_execute(struct xe_vm
> > *vm, struct xe_vma *vma,
> >  	case DRM_GPUVA_OP_MAP:
> >  		fence = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> >  				   op->syncs, op->num_syncs,
> > -				   !xe_vm_in_fault_mode(vm),
> > +				   op->map.immediate,
> >  				   op->flags & XE_VMA_OP_FIRST,
> >  				   op->flags & XE_VMA_OP_LAST);
> >  		break;
> > @@ -2554,7 +2578,7 @@ __xe_vma_op_execute(struct xe_vm *vm, struct
> > xe_vma *vma,
> >  retry_userptr:
> >  	fence = op_execute(vm, vma, op);
> >  	if (IS_ERR(fence) && PTR_ERR(fence) == -EAGAIN) {
> > -		lockdep_assert_held_write(&vm->lock);
> > +		lockdep_assert_held(&vm->lock);
> > 
> >  		if (op->base.op == DRM_GPUVA_OP_REMAP) {
> >  			if (!op->remap.unmap_done)
> > @@ -2583,7 +2607,7 @@ xe_vma_op_execute(struct xe_vm *vm, struct
> > xe_vma_op *op)
> >  {
> >  	struct dma_fence *fence = ERR_PTR(-ENOMEM);
> > 
> > -	lockdep_assert_held_write(&vm->lock);
> > +	lockdep_assert_held(&vm->lock);
> > 
> >  	switch (op->base.op) {
> >  	case DRM_GPUVA_OP_MAP:
> > @@ -2992,11 +3016,6 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm
> > *vm,
> >  	return err;
> >  }
> > 
> > -static void xe_vma_ops_init(struct xe_vma_ops *vops)
> > -{
> > -	INIT_LIST_HEAD(&vops->list);
> > -}
> > -
> >  int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  {
> >  	struct xe_device *xe = to_xe_device(dev);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index cc3dce893f1e..7ef9e632154a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -18,6 +18,7 @@
> >  #include "xe_range_fence.h"
> > 
> >  struct xe_bo;
> > +struct xe_device;
> >  struct xe_sync_entry;
> >  struct xe_user_fence;
> >  struct xe_vm;
> > @@ -124,7 +125,96 @@ struct xe_userptr_vma {
> >  	struct xe_userptr userptr;
> >  };
> > 
> > -struct xe_device;
> > +/** struct xe_vma_op_map - VMA map operation */
> > +struct xe_vma_op_map {
> > +	/** @vma: VMA to map */
> > +	struct xe_vma *vma;
> > +	/** @immediate: Immediate bind */
> > +	bool immediate;
> > +	/** @is_null: is NULL binding */
> > +	bool is_null;
> > +	/** @dumpable: whether BO is dumped on GPU hang */
> > +	bool dumpable;
> > +	/** @pat_index: The pat index to use for this operation. */
> > +	u16 pat_index;
> > +};
> > +
> > +/** struct xe_vma_op_remap - VMA remap operation */
> > +struct xe_vma_op_remap {
> > +	/** @prev: VMA preceding part of a split mapping */
> > +	struct xe_vma *prev;
> > +	/** @next: VMA subsequent part of a split mapping */
> > +	struct xe_vma *next;
> > +	/** @start: start of the VMA unmap */
> > +	u64 start;
> > +	/** @range: range of the VMA unmap */
> > +	u64 range;
> > +	/** @skip_prev: skip prev rebind */
> > +	bool skip_prev;
> > +	/** @skip_next: skip next rebind */
> > +	bool skip_next;
> > +	/** @unmap_done: unmap operation in done */
> > +	bool unmap_done;
> > +};
> > +
> > +/** struct xe_vma_op_prefetch - VMA prefetch operation */
> > +struct xe_vma_op_prefetch {
> > +	/** @region: memory region to prefetch to */
> > +	u32 region;
> > +};
> > +
> > +/** enum xe_vma_op_flags - flags for VMA operation */
> > +enum xe_vma_op_flags {
> > +	/** @XE_VMA_OP_FIRST: first VMA operation for a set of syncs */
> > +	XE_VMA_OP_FIRST			= BIT(0),
> > +	/** @XE_VMA_OP_LAST: last VMA operation for a set of syncs */
> > +	XE_VMA_OP_LAST			= BIT(1),
> > +	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
> > +	XE_VMA_OP_COMMITTED		= BIT(2),
> > +	/** @XE_VMA_OP_PREV_COMMITTED: Previous VMA operation
> > committed */
> > +	XE_VMA_OP_PREV_COMMITTED	= BIT(3),
> > +	/** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation committed
> > */
> > +	XE_VMA_OP_NEXT_COMMITTED	= BIT(4),
> > +};
> > +
> > +/** struct xe_vma_op - VMA operation */
> > +struct xe_vma_op {
> > +	/** @base: GPUVA base operation */
> > +	struct drm_gpuva_op base;
> > +	/**
> > +	 * @ops: GPUVA ops, when set call drm_gpuva_ops_free after this
> > +	 * operations is processed
> > +	 */
> > +	struct drm_gpuva_ops *ops;
> > +	/** @q: exec queue for this operation */
> > +	struct xe_exec_queue *q;
> > +	/**
> > +	 * @syncs: syncs for this operation, only used on first and last
> > +	 * operation
> > +	 */
> > +	struct xe_sync_entry *syncs;
> > +	/** @num_syncs: number of syncs */
> > +	u32 num_syncs;
> > +	/** @link: async operation link */
> > +	struct list_head link;
> > +	/** @flags: operation flags */
> > +	enum xe_vma_op_flags flags;
> > +
> > +	union {
> > +		/** @map: VMA map operation specific data */
> > +		struct xe_vma_op_map map;
> > +		/** @remap: VMA remap operation specific data */
> > +		struct xe_vma_op_remap remap;
> > +		/** @prefetch: VMA prefetch operation specific data */
> > +		struct xe_vma_op_prefetch prefetch;
> > +	};
> > +};
> > +
> > +/** struct xe_vma_ops - VMA operations */
> > +struct xe_vma_ops {
> > +	/** @list: list of VMA operations */
> > +	struct list_head list;
> > +};
> 
> this already showed up on patch 4... you just add it in patch5, then moved it to another location on patch 5...
> 

Yes.

> > 
> >  struct xe_vm {
> >  	/** @gpuvm: base GPUVM used to track VMAs */
> > @@ -267,99 +357,18 @@ struct xe_vm {
> >  		bool capture_once;
> >  	} error_capture;
> > 
> > +	/** @dummy_ops: dummy VMA ops to issue rebinds */
> > +	struct {
> > +		/** @dummy_ops.ops: dummy VMA ops */
> > +		struct xe_vma_ops vops;
> > +		/** @dummy_ops.op: dummy VMA op */
> > +		struct xe_vma_op op;
> > +	} dummy_ops;
> 
> If only from this patch, it seems you don't have to introduce this dummy_ops member to xe_vm. For example, it can be a local variable in xe_vm_rebind function. But I will keep looking. Maybe you made it this way for future patches.
> 
>

I'm going to rewrite or already have rewritten this to use local
xe_vm_ops member and execute all rebinds an atomic unit.

You can ignore this patch and also [1] in this rev of the review.

[1] https://patchwork.freedesktop.org/patch/582015/?series=125608&rev=5

> > +
> >  	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
> >  	bool batch_invalidate_tlb;
> >  	/** @xef: XE file handle for tracking this VM's drm client */
> >  	struct xe_file *xef;
> >  };
> > 
> > -/** struct xe_vma_op_map - VMA map operation */
> > -struct xe_vma_op_map {
> > -	/** @vma: VMA to map */
> > -	struct xe_vma *vma;
> > -	/** @is_null: is NULL binding */
> > -	bool is_null;
> > -	/** @dumpable: whether BO is dumped on GPU hang */
> > -	bool dumpable;
> > -	/** @pat_index: The pat index to use for this operation. */
> > -	u16 pat_index;
> > -};
> > -
> > -/** struct xe_vma_op_remap - VMA remap operation */
> > -struct xe_vma_op_remap {
> > -	/** @prev: VMA preceding part of a split mapping */
> > -	struct xe_vma *prev;
> > -	/** @next: VMA subsequent part of a split mapping */
> > -	struct xe_vma *next;
> > -	/** @start: start of the VMA unmap */
> > -	u64 start;
> > -	/** @range: range of the VMA unmap */
> > -	u64 range;
> > -	/** @skip_prev: skip prev rebind */
> > -	bool skip_prev;
> > -	/** @skip_next: skip next rebind */
> > -	bool skip_next;
> > -	/** @unmap_done: unmap operation in done */
> > -	bool unmap_done;
> > -};
> > -
> > -/** struct xe_vma_op_prefetch - VMA prefetch operation */
> > -struct xe_vma_op_prefetch {
> > -	/** @region: memory region to prefetch to */
> > -	u32 region;
> > -};
> > -
> > -/** enum xe_vma_op_flags - flags for VMA operation */
> > -enum xe_vma_op_flags {
> > -	/** @XE_VMA_OP_FIRST: first VMA operation for a set of syncs */
> > -	XE_VMA_OP_FIRST			= BIT(0),
> > -	/** @XE_VMA_OP_LAST: last VMA operation for a set of syncs */
> > -	XE_VMA_OP_LAST			= BIT(1),
> > -	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
> > -	XE_VMA_OP_COMMITTED		= BIT(2),
> > -	/** @XE_VMA_OP_PREV_COMMITTED: Previous VMA operation
> > committed */
> > -	XE_VMA_OP_PREV_COMMITTED	= BIT(3),
> > -	/** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation committed
> > */
> > -	XE_VMA_OP_NEXT_COMMITTED	= BIT(4),
> > -};
> > -
> > -/** struct xe_vma_op - VMA operation */
> > -struct xe_vma_op {
> > -	/** @base: GPUVA base operation */
> > -	struct drm_gpuva_op base;
> > -	/**
> > -	 * @ops: GPUVA ops, when set call drm_gpuva_ops_free after this
> > -	 * operations is processed
> > -	 */
> > -	struct drm_gpuva_ops *ops;
> > -	/** @q: exec queue for this operation */
> > -	struct xe_exec_queue *q;
> > -	/**
> > -	 * @syncs: syncs for this operation, only used on first and last
> > -	 * operation
> > -	 */
> > -	struct xe_sync_entry *syncs;
> > -	/** @num_syncs: number of syncs */
> > -	u32 num_syncs;
> > -	/** @link: async operation link */
> > -	struct list_head link;
> > -	/** @flags: operation flags */
> > -	enum xe_vma_op_flags flags;
> > -
> > -	union {
> > -		/** @map: VMA map operation specific data */
> > -		struct xe_vma_op_map map;
> > -		/** @remap: VMA remap operation specific data */
> > -		struct xe_vma_op_remap remap;
> > -		/** @prefetch: VMA prefetch operation specific data */
> > -		struct xe_vma_op_prefetch prefetch;
> > -	};
> > -};
> > -
> > -/** struct xe_vma_ops - VMA operations */
> > -struct xe_vma_ops {
> > -	/** @list: list of VMA operations */
> > -	struct list_head list;
> > -};
> 
> It seems you moved a block of codes to another location. It caused more work for code review. Better to avoid this if we can.
> 

See above, with my refactor dummy binds and this moving this is not
required.

Matt

> Oak
> 
> > -
> >  #endif
> > --
> > 2.34.1
> 
