Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ED6C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 17:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADA489A88;
	Fri, 22 Mar 2024 17:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nnb4dAjD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311A6112663
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 17:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711129037; x=1742665037;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fcpe+ueDUl9c5UF8wrTc9F80LGA0Q4AzPYZQ9PvvmwE=;
 b=Nnb4dAjDXTo//8UlkaBTfJw+jgtmzTFiP7JCEGBjwXGIi4AY0l0qKlAK
 8wL9dgV0WT5cYGmZ/QBzO6VEyWvZef89WV1y3lljTMFxnpPyH0qKKmTbY
 2/bmEbSGMjPH/HE4C/0GhjPZhvgEYCHBG/ZpFr7GeAMLOpTdJxaqNYw7R
 sWQDZ1pNjuPdzZNi675ppQ8YJJJ1RDPZLplUfFoW0HI6EnPVPNkOW89TS
 3tt5gqhenEDL14KY7b2Q3ttt6J0uHv1f6cPj9+1sc3lP0La/J4DSK+Yoy
 nq4yJiCYJ56JuBD5RS80kJwKW4iF3sTiuZFtegeGZgMGZSUXNB8gBoBTB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17623344"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="17623344"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 10:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="14874038"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 10:37:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 10:37:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 10:37:16 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 10:37:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNe2u7fkz2HjVHRd60OGk0SdHrYNGA8hUGBgebsbaSicjVJdyBL7tTpao3+Z2It5NujFFDWBfrW6+wTQ4yuLFGAAKsQmDe1HCgdsbJ0KlXvgItenlR+uPj/edn9Uconz8NyRufRw7i+4+F5fUGyzn9TRYO67cO+m75bhfYiVLOP9Fd633z5cRxpg5TRaImwxYbHO6eoXDsJUNWx4l16dDOLkk359st3L8zFtP1Z1XZb4h5x18XfrtQVKze7Pc3XV0AVwGZtNU7OZk+Guw5PqUywWBH4qeccCAkhqLSrQSWAnshOPEJdPuF3vVOiaxJJ6CW8EyY4vysyQ7vxkQat55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCkfZrZaxiI9JPoeiS+c4//oudLjJUdbNz3KXFtgN8E=;
 b=daQI8KJa2Z2xqeRdnKorPxaYGljcBGPb/pRZE5citxwhmL19F6y1/3LzFdY8PRw7Bo6iEFRfQi1HCpXzc77OV7RjlnEelahoootK4qozA034llyIBmoSliCl3nTncafctUY3r0EEtEQteapfZy9r+rMD+a3hMB5ibApjRMBXy16DWGiiilAsh2fhGoBrN9D/nDVxXdGE/O2Ew+1UznQz9Unqi57iSeEUkxYejs6PTgrMURFNKBREbtCmLi/1DqqAwPy/Dzk+1bpk/Be8cvkueYSSiDhCtWKTlkcbNBrdG7UnGMs4j3/WJmHYHPfT71OP1l/aP+rItBzQcD7Bm6vjsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7423.namprd11.prod.outlook.com (2603:10b6:510:282::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 17:37:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 17:37:13 +0000
Date: Fri, 22 Mar 2024 17:36:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 03/30] drm/xe: Move migrate to prefetch to op_lock
 function
Message-ID: <Zf3Bl5l3mgKveFjq@DUT025-TGLU.fm.intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-4-matthew.brost@intel.com>
 <SA1PR11MB699179AF93251BACE99405A592312@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB699179AF93251BACE99405A592312@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:254::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f25e68e-ad2d-4aef-5096-08dc4a96b5d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QcoLkVowslACCvNo+poSwnTTybNnaOFrOARA0YMWmzQHo0VVyUGAIVZBRgASnQvZgbSShbSzcP/O79xMIO4Np0qkrvQiCdxf4TqBovSMNTx7pTWKUyH8+BTM+954Zz2VjlnK0z48Eoio+CYuAO0aPS8FykSm+ri+DxjRtDWv+q7ypuuqPzmsttLk9UuWHTv6Ip+1i4pB1aqCA/ZeSrQroTQQtOoqvUWwWXntMNXeoOFvm4Xzartq9M6msMT4FE9Y1qo+mNO08HtQiFsyiWYe5764lRo8GRat8heXnqsfYCEru1zCnOQKjw2QoiU803bizph9/cMp43tmbVT0RbaeroULoaWkuxxlqRDWnLjJeD6mSln7QnII5BJYymqtJaT95juilJDHPuaFkoupML6hdU9Gn6JA5uAzj52Rihj204pghGP+jgrQSpH59UNDTFLjLOlk5T6oLPGlKpa+LqEbHVNbfhOjX9PHS29j7ACPv/VrT9qJaAfXTzw17JKvSDwqn0mkE6BgLWzWnGPFMsV3YmcMC8rLEiu9hmO4AW4+pnwubQYqYjOwFXOKXfsFhoCK76D/8k7CWRHQVfdVUEu4jYJIaQqfBMFJUBInRZFscgjvR+uD1mXiE2vEbWc4o7G0ETZX7JMeAsru3knTTMEPrVxAO4HwTgoT31qB4Q88bjI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aUca5g2qJvtMBDjEZbpcJ8tcNd8ZjVHnyIBXx/b+8D55K64VSeIg239gJNzn?=
 =?us-ascii?Q?q0vE+qHubvGl9AkEfaj8Q6Njfn2ODyyY/WH3UHc5pd+gfP1DWHdQQuYmHroW?=
 =?us-ascii?Q?Z1oEF2FiR4fVLddHDxfBlDyfD71T02F+x3bIZsbc2OjOq8yndh3Z/vV+UwgH?=
 =?us-ascii?Q?mfaCkEYeIOdx2myKY1sDMkUY7Htv1AjcqE9EWtVPekpIHPEGsdGCtvulEv5y?=
 =?us-ascii?Q?zqHkQiXP0z9VOZ/aPCkrtrABk0g49cZZC3MqJE8rWl0qL54orTOPkzAdK2Cr?=
 =?us-ascii?Q?+6txAfyeRS1hOtc+cZH75HqcA2c2pUxObYV7GVjC5TbUj9uIa+Ww3tnATqc2?=
 =?us-ascii?Q?TveJnkjhCpsVpIm+fJBBPib22PT87S1UA/I7Mt/twP8eh1A7naDF4LkdpVtF?=
 =?us-ascii?Q?FRSnO0e5doqIcqmVQSvprlCH1B3DSIb7eFlSMC0YoHPLS9qNsPmKhLcCQpwb?=
 =?us-ascii?Q?dDX7PEUGDNrc97YeGrxZPZPrZdYMEpHIfdwV9mrOrcQ56nUQejBk0gl0wkOx?=
 =?us-ascii?Q?DVCOgS/qDSGRtDalI6dNqiPlWSFBXMDIf1mKF29lBitWHSzbzXtxE62gpBk5?=
 =?us-ascii?Q?3ZTJl/YYqlyYKFe4CSGP6sHha7MUCNIwDP4tQT54V3vTZf9o7+kg4hhXhem7?=
 =?us-ascii?Q?PCHhAmaLDTzKOZDq/aoffYalgm/xi/JcBL2h0KLMmMP0F5TI8vSX0OG4P2Dd?=
 =?us-ascii?Q?s0sjAA2WZVRgNfsDeMQQoK2qi4BG01L8tAdNW9wAiNmq48xsUDxXkAS88HSm?=
 =?us-ascii?Q?f8dpdT9TYD2XiewEe2JI8NzbUkcBx/AZvqp1PfohBO+CgtoxMdIUmB5dha10?=
 =?us-ascii?Q?uezsmXtKMOo3kx0rVtec7MjVt1rrsKuX4WiQiTYgvLDdfHnQ+oJXJ6/wZOi8?=
 =?us-ascii?Q?Hzf/2/Kfg9K8IQXCFTgjad8b5BPtZRASM7mpvghNJ3+yiE1Gawri5H+GofbW?=
 =?us-ascii?Q?9K9SiddN0LvK0Oo2axBynI50O+sUqUYKAMIMavDWi9yFSdfKZW0SnnHCuzeB?=
 =?us-ascii?Q?yKEWvpTui2GXADR1CVZPQYYk9seTtNIx5swAyDV1RJb/ENtnd3sBa1ptaAXB?=
 =?us-ascii?Q?5Yj/Ar7o/rEEbcThtL4AslNqeIWrUjQdNj9ABHxZMZ9euzol6dWqJSgVM9M1?=
 =?us-ascii?Q?eabiFCBY0s7Pz9rEsLd74PN6lVOQH3hhhhHF0OatTJ+gEm9v6gf/Kc2Jx4U3?=
 =?us-ascii?Q?tJ7lNYuk2BE9SeX+im7ekforNFjkI4tGcqae9U9ltEywJ6he/bBZHySbgQi1?=
 =?us-ascii?Q?Md43PChClpKxzp1osSu9Iae5blFVJH+4Q97ZmeBOIDKUgmoEFrtqQieLlYWP?=
 =?us-ascii?Q?noKT7H/6mmIakMtuTvkfPC6jHwUVQ9ARaRn1J5lMgPEMuNKQ10hT6a8YPum5?=
 =?us-ascii?Q?W5zVVpDpoCxyqAs9CHNp2BXSdiumSQywQksLTOPy2JhkQzUsTwT1CsbWrreU?=
 =?us-ascii?Q?C0R+uFN+iYuwwRrRBw6u8xGz17c6ccA2PsAoRum3jZE+G7DavHkp93Gd2NjG?=
 =?us-ascii?Q?7aN7aPAPrEH/FQANn4A6eM+JHeWIC1FAcuCO/duumbAxqkMC7vnEatdtVH3u?=
 =?us-ascii?Q?X/8EdWRROg/hx9dcMVQ8eEg6jrZgbDQFDJH/J1d1rA4J4+ofQerkEDoSNirG?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f25e68e-ad2d-4aef-5096-08dc4a96b5d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 17:37:13.7381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xhe3ZledN9Bnt2LSjgGJQBATbUTYiWaXYiTVW+1YZiec3Nsj+qweSteHQM4aqYyv3mjEf1VrmyQYUWGFB1VBPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7423
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

On Fri, Mar 22, 2024 at 11:06:28AM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew
> > Brost
> > Sent: Friday, March 8, 2024 12:08 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH v4 03/30] drm/xe: Move migrate to prefetch to op_lock function
> > 
> > Migrates need to be done under drm exec to make lockdep happy,
> 
> 
> Can you explain more here? By under drm exec, do you mean drm_exec_until_all_locked? I do see xe_vm_prefetch/xe_bo_migrate is called inside drm_exec_until_all_locked, in patch 1 of this series, in function vm_bind_ioctl_ops_execute
> 

This is a stale comment, will fix. Something like:

All non-binding operations in VM bind IOCTL should be in the lock and
prepare step rather than the execution step. Move prefetch to conform to
this pattern.

>  move
> > the migrate done for prefetches under the op_lock function.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 28 +++++++++++++---------------
> >  1 file changed, 13 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index fb73afcab3b7..70a5ba621e4e 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1994,20 +1994,10 @@ static const u32 region_to_mem_type[] = {
> > 
> >  static struct dma_fence *
> >  xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> > -	       struct xe_exec_queue *q, u32 region,
> > -	       struct xe_sync_entry *syncs, u32 num_syncs,
> > -	       bool first_op, bool last_op)
> > +	       struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> > +	       u32 num_syncs, bool first_op, bool last_op)
> >  {
> >  	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm,
> > q);
> > -	int err;
> > -
> > -	xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
> > -
> > -	if (!xe_vma_has_no_bo(vma)) {
> > -		err = xe_bo_migrate(xe_vma_bo(vma),
> > region_to_mem_type[region]);
> > -		if (err)
> > -			return ERR_PTR(err);
> > -	}
> > 
> >  	if (vma->tile_mask != (vma->tile_present & ~vma->usm.tile_invalidated))
> > {
> >  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> > num_syncs,
> > @@ -2540,8 +2530,7 @@ static struct dma_fence *op_execute(struct xe_vm
> > *vm, struct xe_vma *vma,
> >  				     op->flags & XE_VMA_OP_LAST);
> >  		break;
> >  	case DRM_GPUVA_OP_PREFETCH:
> > -		fence = xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
> > -				       op->syncs, op->num_syncs,
> > +		fence = xe_vm_prefetch(vm, vma, op->q, op->syncs, op-
> > >num_syncs,
> >  				       op->flags & XE_VMA_OP_FIRST,
> >  				       op->flags & XE_VMA_OP_LAST);
> >  		break;
> > @@ -2766,8 +2755,17 @@ static int op_lock(struct drm_exec *exec, struct xe_vm
> > *vm,
> >  		err = vma_lock(exec, gpuva_to_vma(op->base.unmap.va), false);
> >  		break;
> >  	case DRM_GPUVA_OP_PREFETCH:
> > -		err = vma_lock(exec, gpuva_to_vma(op->base.prefetch.va),
> > true);
> > +	{
> > +		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > +		u32 region = op->prefetch.region;
> > +
> > +		xe_assert(vm->xe, region <=
> > ARRAY_SIZE(region_to_mem_type));
> > +
> > +		err = vma_lock(exec, vma, false);
> > +		if (!err && !xe_vma_has_no_bo(vma))
> > +			err = xe_bo_migrate(xe_vma_bo(vma), region);
> >  		break;
> > +	}
> 
> Understand you have a reason to do this. It does introduce confusion: the function is called op_lock and now you have a migration operation inside.
> 

Yes, how about? s/op_lock/op_lock_and_prepare/

Likewise: s/vma_lock/vma_lock/vma_lock_and_validate/

Matt

> 
> Oak
> 
> 
> >  	default:
> >  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> >  	}
> > --
> > 2.34.1
> 
