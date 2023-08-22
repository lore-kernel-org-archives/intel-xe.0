Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1823EE49AB
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 23:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D1810E02D;
	Tue, 22 Aug 2023 23:38:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1DA10E02D
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 23:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692747534; x=1724283534;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9MKl76c2b4t3hCcNf2qD/Cg0EkDWDo6gsAv826BQojk=;
 b=ia2G3JymT4gmLxRTwstuPdi0DDWRBkAZX5gabfIYZXWy29Lj0Bx4oHkd
 TCvrJx9Gfxgp6eQO3B4+5gkX01xltaxtB9Vn+t7BRyBUVoIuK6syenJnz
 z7z8eqnG2cGosEyHQHtdv92z9opavK1l3DDwOmIjMQjwiRmw+jD+8GLcR
 hqTxN39+iw+6+q6zHJlbUXoRIUpjoIr81JxELKLXKRZnV25Mp0lmoywO2
 pyheW4ZCC2kyoHK8ZVKgWIJKKJzI1rNlFqlm7LD8tDsL+Uc674HY54MAF
 6DuMRbbop89Ypg5wgwpMr3xJvCBEaZoZznSy6EvT48w7cHmarBEI4kRF6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="405020402"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="405020402"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 16:38:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="686224340"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="686224340"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 22 Aug 2023 16:38:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 16:38:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 16:38:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 16:38:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 16:38:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFJsGNvOXX6sPlr2xM2BmF7BLu4WelxPm7Dg3Cy8nS325/BlXJjI1Ug1R/Dc/UL3LuP+gGIUhMQ0pISQOXXGMk21xRbHX+eTk03L3llfqjDJQ6WWk0hfc79uYlBRBbZ2yna8t5ROuI1Y0j1S8q1MOcySWiW5FYN5uhgd/LM1B8iVP6hnaKpscRuZIYyYpryiaYiQ9/k3OtCIAup72NgXvJ8ZKPN583dFdKQutw0ppl/mnyBAw7NN0Da/ruyUErEffynCk8nOlKzbSSB4A81TUH5LcXal87a24pUobQpFAHQRs+NAac7sbTWpm6aELGhLP1saFTS9BE1SnjcQOGAqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OoRDZOmAPb8R4bJTctnhITWXTDfUDj2hqTLF5Qw0VPs=;
 b=TcaWvn2QHirclLRxp69FU+mPYyFgNloH25Oe2cYpjs6q42H44XLXPeCxQaoee491liTmeSIFVXv3sCHWcGvIoCHQ/o1T8klyGa1RngJhHWPr+Qd/CPBx9rOyfApM/2yqsLiOp9SzP64WDJ7kbLlyYkn+I4qsZA1j1mK97KMwVKLZqn2tUVNTfw76bngKyFfWwAkoP1hP1v9rW+7hmSw+nIOoKIBFtddLmyJuYvgI2T0/u0vr2DJFKiCjaTl8uR8Y7wpM+jBRceAwgyLm9g4PZ6kE2X1fDhfCZTxT4EzmWX1BKNKRIcCFNvssDfEw5WEmGuuHbIzHOHiA2f0SVPu7NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6099.namprd11.prod.outlook.com (2603:10b6:208:3d5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 23:38:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 23:38:49 +0000
Date: Tue, 22 Aug 2023 19:38:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZOVHBhN+zodryU24@intel.com>
References: <20230817043148.740495-1-matthew.brost@intel.com>
 <20230817043148.740495-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230817043148.740495-4-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: f8298efa-19b0-4580-4e47-08dba368ef78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZAtLI4G3gMQeMBNWtGjCd4VDEQMS2CcZqfxyD2r59UJs558RJ5t/eNGq/DK0+pKMTUdK0uca4VqZFkrLoC1Gq1HeBoewZyBQ/d6EAiiE7nwfq2yTdMQT3fycqoMBuDZDVVwTszFuXlg7aAM6tUE/givsnTnVOn4Qe3JScbQDsQvbSEtPVi9M8X8aR7BAophvLcUecmlzOPqgiVTOnns1J5sPx5sNSS3CaZAkPq4jhnUExIBm+gkv8Kv32a7adHqgIToGc4Whdu+OORSN6G3J1h3ybHWeTDIABwBQf1yjzxkMSet6/RoIVmR6uu5aInxHmJLHIFgQPV4vfvkQIddGctv/SASCeXngqoOUf5fzmiWWdtzmkb7yyn+/LQnDGZC7aMgGtq2dM/npyK0Az4Izickydka75LBtI3nn7HlP72O26l5LRRtR3RJsFgs2tkoUrpzPgDgybSyA6KOZJJbojcAWEIDAN7inEky1EGuCpyID1VdbYFOXwSTeu7g79rF1KeSJhVDTQxbvl7ceGqnVKapVBO/bLOPNCxrh/97djuy0IRwfwGrWL/O3+B+2DDejmjf7eJTTHklUDfhCJLVZaq+qjS1CiSli10zfec3mJYc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199024)(186009)(1800799009)(83380400001)(2906002)(30864003)(6506007)(6486002)(38100700002)(5660300002)(44832011)(26005)(86362001)(8676002)(2616005)(8936002)(4326008)(6862004)(37006003)(66946007)(316002)(6512007)(6636002)(66476007)(66556008)(82960400001)(478600001)(6666004)(36756003)(41300700001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?72IGAHg9u95l50BalGF5V1sgZQZrqfT9xAAJARzRJjlGYaU95kqTUWOLu1Pn?=
 =?us-ascii?Q?pPxbqQwbO1UjCfzxrGouYR6R579eA5Xm9xpqR7Yl3v94FwtZ0J9VnjkkAhIQ?=
 =?us-ascii?Q?TPZEz+K7R4yhPxNxc/BTcq91CK/lXAjinGpGcGR1Rq8iHeV/GWUCdm7HPMZ9?=
 =?us-ascii?Q?nW8kY+UIxwIdc5xi6qJGg5jcfWoaHy9QiQwV2CZuQh8jUj8B25NXjpE9HrVZ?=
 =?us-ascii?Q?F+jhIRiRDkdVklYpgEr5B//TE3cfuPcawjzWVurvTzbrpH9IUv81kUo1acmx?=
 =?us-ascii?Q?9hPs0bO4rjavrYvRACmms8AAgSVhTmUEeKTrzNTWXhxoQwn1S08buYQWFwNu?=
 =?us-ascii?Q?Mx+FJ8E82mOwbSi9bOg8TTBnOc60GNgAB8D/wtvmXY3eHJZTYGm6EC/FQo66?=
 =?us-ascii?Q?+W8SwmGplFJbSS7EEsXIaE8qpE6Zd+dTdsUUv+sSYGqTo12pvRcEusK6wrlM?=
 =?us-ascii?Q?PSX2cVidXfyk0MAlUDxqoys1iikNiPh0z07qocGsdNrBfSsnQGaZhS/J/TbF?=
 =?us-ascii?Q?GzH0RCFIzuD3X+s2212nktv0mbSo/HR6tib/gtTed5+86RQLVAu9KyO1pWJR?=
 =?us-ascii?Q?37I8NfWIr1MFHDNxcbWXtNgPGxj5S6EVu5C5d1VPpqrg93KiVbdp3GfyvWkM?=
 =?us-ascii?Q?PD4jfpC/YgtmxlW4yeSdynvQmPOTKWJ8L7d4SAp/8+cZUiQv6KpxpNFJCu8T?=
 =?us-ascii?Q?0wsmzvdGCK6QnOHT1xo5XjznxLYqjHLs0epzSCEWbdgHwT9uea53BrCV/oBm?=
 =?us-ascii?Q?EcrUUOzy0YQGqEU9Se7kqrw60Hg9ZPveu+osN80wutijKAdTPFlZ33mzCtJL?=
 =?us-ascii?Q?gkZvfdzED83oPTtt07HiTEOsX/37vQ4lWa/IuDvniunZNbvpszoIghMPgV31?=
 =?us-ascii?Q?/h8szvxhU53lpqii4ke5n15wgeJIwYV70PNG1pD0cKzkKUtUasXmynpVLfn1?=
 =?us-ascii?Q?uvG694Af8wT/nMZpCXHSSkcT7mYfEURxanhsWKL0la43s4xSYdEFHu9kNA0x?=
 =?us-ascii?Q?wcxJ9TBt607VEP4OvZihJGm0W4m3rZMro3v08ThlaEsLKePqhZOoYqaqlgn0?=
 =?us-ascii?Q?lW8jPpquUAToT3EiHShiR6L0Pz5HaeAlD6lSqEX3ns2+eYJWE/M5anIev59i?=
 =?us-ascii?Q?XhJrZwQgORKkbpRGG6VPN/Qor8nOAvjvITrkQ8B599R6VBn1UiODX2GhDO0+?=
 =?us-ascii?Q?Kosllgh4eHR6osFfxMty1POesDIlZceWJBDORBeYxGWmoD2UJ+s4d3kqVlVN?=
 =?us-ascii?Q?aYmz2mjqOmE07Wm8V50fk2ikDuuXLU7wxlOssYBM5ovs0HuVkqX2PuiqEEyh?=
 =?us-ascii?Q?wKkLS75eDQlV4weqxCHknXHtrfrN2YI2xqxnoc4R39oBmaRqodLXOAJZ9t1H?=
 =?us-ascii?Q?wHv0cVWWV/bRpthVW1FCJKBY+75RpxWj60aHMavzgX0u7Ehj4Plly3ppe3jn?=
 =?us-ascii?Q?fNPC43NxWD0kcaC7s+U74JuixLr1TT7/qbOcW8Zk1cB/3mZIOIxVz4EeCKU0?=
 =?us-ascii?Q?Iy06Xvj6QACGRCJc3lf8vys+EISPSR8zFA4n0+XqBtF7xuuqZZA71sItJXIF?=
 =?us-ascii?Q?EZBzKZLdFmY4fxMjhwWaim3AtMbTuJIUaD7piyrZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8298efa-19b0-4580-4e47-08dba368ef78
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 23:38:49.6101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0ijF3uxtQqhq198NImWbKHa7iEp3IfvlboQCpF1MLGW3dUWZQga8NYHJxJdJRLGBP+RaNI0Y3mGPD430g/7Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6099
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Fix array of binds
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

On Wed, Aug 16, 2023 at 09:31:48PM -0700, Matthew Brost wrote:
> If multiple bind ops in an array of binds touch the same address range
> invalid GPUVA operations are generated as each GPUVA operation is
> generated based on the orignal GPUVA state. To fix this, after each
> GPUVA operations is generated, commit the GPUVA operation updating the
> GPUVA state so subsequent bind ops can see a current GPUVA state.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 418 +++++++++++++++++++------------------
>  1 file changed, 212 insertions(+), 206 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index bd20840616ca..2452e24fbc81 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2426,24 +2426,73 @@ static u64 xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
>  	return SZ_4K;
>  }
>  
> -/*
> - * Parse operations list and create any resources needed for the operations
> - * prior to fully committing to the operations. This setup can fail.
> - */
> +static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
> +{
> +	int err = 0;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		err |= xe_vm_insert_vma(vm, op->map.vma);
> +		if (!err)
> +			op->flags |= XE_VMA_OP_COMMITTED;
> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
> +				 true);
> +		op->flags |= XE_VMA_OP_COMMITTED;
> +
> +		if (op->remap.prev) {
> +			err |= xe_vm_insert_vma(vm, op->remap.prev);
> +			if (!err)
> +				op->flags |= XE_VMA_OP_PREV_COMMITTED;
> +			if (!err && op->remap.skip_prev)
> +				op->remap.prev = NULL;
> +		}
> +		if (op->remap.next) {
> +			err |= xe_vm_insert_vma(vm, op->remap.next);
> +			if (!err)
> +				op->flags |= XE_VMA_OP_NEXT_COMMITTED;
> +			if (!err && op->remap.skip_next)
> +				op->remap.next = NULL;
> +		}
> +
> +		/* Adjust for partial unbind after removin VMA from VM */
> +		if (!err) {
> +			op->base.remap.unmap->va->va.addr = op->remap.start;
> +			op->base.remap.unmap->va->va.range = op->remap.range;
> +		}
> +		break;
> +	case DRM_GPUVA_OP_UNMAP:
> +		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
> +		op->flags |= XE_VMA_OP_COMMITTED;
> +		break;
> +	case DRM_GPUVA_OP_PREFETCH:
> +		op->flags |= XE_VMA_OP_COMMITTED;
> +		break;
> +	default:
> +		XE_WARN_ON("NOT POSSIBLE");
> +	}
> +
> +	return err;
> +}
> +
> +
>  static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> -				   struct drm_gpuva_ops **ops, int num_ops_list,
> +				   struct drm_gpuva_ops *ops,
>  				   struct xe_sync_entry *syncs, u32 num_syncs,
> -				   struct list_head *ops_list, bool async)
> +				   struct list_head *ops_list, bool last,
> +				   bool async)
>  {
>  	struct xe_vma_op *last_op = NULL;
> -	struct list_head *async_list = NULL;
>  	struct async_op_fence *fence = NULL;
> -	int err, i;
> +	struct drm_gpuva_op *__op;
> +	int err = 0;
>  
>  	lockdep_assert_held_write(&vm->lock);
> -	XE_WARN_ON(num_ops_list > 1 && !async);
>  
> -	if (num_syncs && async) {
> +	if (last && num_syncs && async) {
>  		u64 seqno;
>  
>  		fence = kmalloc(sizeof(*fence), GFP_KERNEL);
> @@ -2462,145 +2511,145 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  		}
>  	}
>  
> -	for (i = 0; i < num_ops_list; ++i) {
> -		struct drm_gpuva_ops *__ops = ops[i];
> -		struct drm_gpuva_op *__op;

I got a bit confused here. why we were iterating on the op list,
but suddenly this iteration is not needed anymore?

> +	drm_gpuva_for_each_op(__op, ops) {
> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +		bool first = list_empty(ops_list);
>  
> -		drm_gpuva_for_each_op(__op, __ops) {
> -			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> -			bool first = !async_list;
> +		XE_WARN_ON(!first && !async);
> +
> +		INIT_LIST_HEAD(&op->link);
> +		list_add_tail(&op->link, ops_list);
>  
> -			XE_WARN_ON(!first && !async);
> +		if (first) {
> +			op->flags |= XE_VMA_OP_FIRST;
> +			op->num_syncs = num_syncs;
> +			op->syncs = syncs;
> +		}
>  
> -			INIT_LIST_HEAD(&op->link);
> -			if (first)
> -				async_list = ops_list;
> -			list_add_tail(&op->link, async_list);
> +		op->q = q;
> +
> +		switch (op->base.op) {
> +		case DRM_GPUVA_OP_MAP:
> +		{
> +			struct xe_vma *vma;
>  
> -			if (first) {
> -				op->flags |= XE_VMA_OP_FIRST;
> -				op->num_syncs = num_syncs;
> -				op->syncs = syncs;
> +			vma = new_vma(vm, &op->base.map,
> +				      op->tile_mask, op->map.read_only,
> +				      op->map.is_null);
> +			if (IS_ERR(vma)) {
> +				err = PTR_ERR(vma);
> +				goto free_fence;
>  			}
>  
> -			op->q = q;
> +			op->map.vma = vma;
> +			break;
> +		}
> +		case DRM_GPUVA_OP_REMAP:
> +		{
> +			struct xe_vma *old =
> +				gpuva_to_vma(op->base.remap.unmap->va);
>  
> -			switch (op->base.op) {
> -			case DRM_GPUVA_OP_MAP:
> -			{
> -				struct xe_vma *vma;
> +			op->remap.start = xe_vma_start(old);
> +			op->remap.range = xe_vma_size(old);
>  
> -				vma = new_vma(vm, &op->base.map,
> -					      op->tile_mask, op->map.read_only,
> -					      op->map.is_null);
> +			if (op->base.remap.prev) {
> +				struct xe_vma *vma;
> +				bool read_only =
> +					op->base.remap.unmap->va->flags &
> +					XE_VMA_READ_ONLY;
> +				bool is_null =
> +					op->base.remap.unmap->va->flags &
> +					DRM_GPUVA_SPARSE;
> +
> +				vma = new_vma(vm, op->base.remap.prev,
> +					      op->tile_mask, read_only,
> +					      is_null);
>  				if (IS_ERR(vma)) {
>  					err = PTR_ERR(vma);
>  					goto free_fence;
>  				}
>  
> -				op->map.vma = vma;
> -				break;
> +				op->remap.prev = vma;
> +
> +				/*
> +				 * Userptr creates a new SG mapping so
> +				 * we must also rebind.
> +				 */
> +				op->remap.skip_prev = !xe_vma_is_userptr(old) &&
> +					IS_ALIGNED(xe_vma_end(vma),
> +						   xe_vma_max_pte_size(old));
> +				if (op->remap.skip_prev) {
> +					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
> +					op->remap.range -=
> +						xe_vma_end(vma) -
> +						xe_vma_start(old);
> +					op->remap.start = xe_vma_end(vma);
> +				}
>  			}
> -			case DRM_GPUVA_OP_REMAP:
> -			{
> -				struct xe_vma *old =
> -					gpuva_to_vma(op->base.remap.unmap->va);
> -
> -				op->remap.start = xe_vma_start(old);
> -				op->remap.range = xe_vma_size(old);
> -
> -				if (op->base.remap.prev) {
> -					struct xe_vma *vma;
> -					bool read_only =
> -						op->base.remap.unmap->va->flags &
> -						XE_VMA_READ_ONLY;
> -					bool is_null =
> -						op->base.remap.unmap->va->flags &
> -						DRM_GPUVA_SPARSE;
> -
> -					vma = new_vma(vm, op->base.remap.prev,
> -						      op->tile_mask, read_only,
> -						      is_null);
> -					if (IS_ERR(vma)) {
> -						err = PTR_ERR(vma);
> -						goto free_fence;
> -					}
> -
> -					op->remap.prev = vma;
> -
> -					/*
> -					 * Userptr creates a new SG mapping so
> -					 * we must also rebind.
> -					 */
> -					op->remap.skip_prev = !xe_vma_is_userptr(old) &&
> -						IS_ALIGNED(xe_vma_end(vma),
> -							   xe_vma_max_pte_size(old));
> -					if (op->remap.skip_prev) {
> -						xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
> -						op->remap.range -=
> -							xe_vma_end(vma) -
> -							xe_vma_start(old);
> -						op->remap.start = xe_vma_end(vma);
> -					}
> +
> +			if (op->base.remap.next) {
> +				struct xe_vma *vma;
> +				bool read_only =
> +					op->base.remap.unmap->va->flags &
> +					XE_VMA_READ_ONLY;
> +
> +				bool is_null =
> +					op->base.remap.unmap->va->flags &
> +					DRM_GPUVA_SPARSE;
> +
> +				vma = new_vma(vm, op->base.remap.next,
> +					      op->tile_mask, read_only,
> +					      is_null);
> +				if (IS_ERR(vma)) {
> +					err = PTR_ERR(vma);
> +					goto free_fence;
>  				}
>  
> -				if (op->base.remap.next) {
> -					struct xe_vma *vma;
> -					bool read_only =
> -						op->base.remap.unmap->va->flags &
> -						XE_VMA_READ_ONLY;
> -
> -					bool is_null =
> -						op->base.remap.unmap->va->flags &
> -						DRM_GPUVA_SPARSE;
> -
> -					vma = new_vma(vm, op->base.remap.next,
> -						      op->tile_mask, read_only,
> -						      is_null);
> -					if (IS_ERR(vma)) {
> -						err = PTR_ERR(vma);
> -						goto free_fence;
> -					}
> -
> -					op->remap.next = vma;
> -
> -					/*
> -					 * Userptr creates a new SG mapping so
> -					 * we must also rebind.
> -					 */
> -					op->remap.skip_next = !xe_vma_is_userptr(old) &&
> -						IS_ALIGNED(xe_vma_start(vma),
> -							   xe_vma_max_pte_size(old));
> -					if (op->remap.skip_next) {
> -						xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
> -						op->remap.range -=
> -							xe_vma_end(old) -
> -							xe_vma_start(vma);
> -					}
> +				op->remap.next = vma;
> +
> +				/*
> +				 * Userptr creates a new SG mapping so
> +				 * we must also rebind.
> +				 */
> +				op->remap.skip_next = !xe_vma_is_userptr(old) &&
> +					IS_ALIGNED(xe_vma_start(vma),
> +						   xe_vma_max_pte_size(old));
> +				if (op->remap.skip_next) {
> +					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
> +					op->remap.range -=
> +						xe_vma_end(old) -
> +						xe_vma_start(vma);
>  				}
> -				break;
> -			}
> -			case DRM_GPUVA_OP_UNMAP:
> -			case DRM_GPUVA_OP_PREFETCH:
> -				/* Nothing to do */
> -				break;
> -			default:
> -				XE_WARN_ON("NOT POSSIBLE");
>  			}
> -
> -			last_op = op;
> +			break;
> +		}
> +		case DRM_GPUVA_OP_UNMAP:
> +		case DRM_GPUVA_OP_PREFETCH:
> +			/* Nothing to do */
> +			break;
> +		default:
> +			XE_WARN_ON("NOT POSSIBLE");
>  		}
>  
> -		last_op->ops = __ops;
> +		last_op = op;
> +
> +		err = xe_vma_op_commit(vm, op);
> +		if (err)
> +			goto free_fence;
>  	}
>  
> -	if (!last_op)
> -		return -ENODATA;
> +	/* FIXME: Unhandled corner case */
> +	XE_WARN_ON(!last_op && last && !list_empty(ops_list));
>  
> -	last_op->flags |= XE_VMA_OP_LAST;
> -	last_op->num_syncs = num_syncs;
> -	last_op->syncs = syncs;
> -	last_op->fence = fence;
> +	if (!last_op)
> +		goto free_fence;
> +	last_op->ops = ops;
> +	if (last) {
> +		last_op->flags |= XE_VMA_OP_LAST;
> +		last_op->num_syncs = num_syncs;
> +		last_op->syncs = syncs;
> +		last_op->fence = fence;
> +	}
>  
>  	return 0;
>  
> @@ -2609,58 +2658,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  	return err;
>  }
>  
> -static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
> -{
> -	int err = 0;
> -
> -	lockdep_assert_held_write(&vm->lock);
> -
> -	switch (op->base.op) {
> -	case DRM_GPUVA_OP_MAP:
> -		err |= xe_vm_insert_vma(vm, op->map.vma);
> -		if (!err)
> -			op->flags |= XE_VMA_OP_COMMITTED;
> -		break;
> -	case DRM_GPUVA_OP_REMAP:
> -		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
> -				 true);
> -		op->flags |= XE_VMA_OP_COMMITTED;
> -
> -		if (op->remap.prev) {
> -			err |= xe_vm_insert_vma(vm, op->remap.prev);
> -			if (!err)
> -				op->flags |= XE_VMA_OP_PREV_COMMITTED;
> -			if (!err && op->remap.skip_prev)
> -				op->remap.prev = NULL;
> -		}
> -		if (op->remap.next) {
> -			err |= xe_vm_insert_vma(vm, op->remap.next);
> -			if (!err)
> -				op->flags |= XE_VMA_OP_NEXT_COMMITTED;
> -			if (!err && op->remap.skip_next)
> -				op->remap.next = NULL;
> -		}
> -
> -		/* Adjust for partial unbind after removin VMA from VM */
> -		if (!err) {
> -			op->base.remap.unmap->va->va.addr = op->remap.start;
> -			op->base.remap.unmap->va->va.range = op->remap.range;
> -		}
> -		break;
> -	case DRM_GPUVA_OP_UNMAP:
> -		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
> -		op->flags |= XE_VMA_OP_COMMITTED;
> -		break;
> -	case DRM_GPUVA_OP_PREFETCH:
> -		op->flags |= XE_VMA_OP_COMMITTED;
> -		break;
> -	default:
> -		XE_WARN_ON("NOT POSSIBLE");
> -	}
> -
> -	return err;
> -}
> -
>  static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>  			       struct xe_vma_op *op)
>  {
> @@ -2878,11 +2875,13 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
>  
> -		down_read(&vm->userptr.notifier_lock);
> -		vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> -		up_read(&vm->userptr.notifier_lock);
> -		if (post_commit)
> -			xe_vm_insert_vma(vm, vma);
> +		if (vma) {
> +			down_read(&vm->userptr.notifier_lock);
> +			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> +			up_read(&vm->userptr.notifier_lock);
> +			if (post_commit)
> +				xe_vm_insert_vma(vm, vma);
> +		}
>  		break;
>  	}
>  	case DRM_GPUVA_OP_REMAP:
> @@ -2897,11 +2896,13 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  			prep_vma_destroy(vm, op->remap.next, next_post_commit);
>  			xe_vma_destroy_unlocked(op->remap.next);
>  		}
> -		down_read(&vm->userptr.notifier_lock);
> -		vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> -		up_read(&vm->userptr.notifier_lock);
> -		if (post_commit)
> -			xe_vm_insert_vma(vm, vma);
> +		if (vma) {
> +			down_read(&vm->userptr.notifier_lock);
> +			vma->gpuva.flags &= ~XE_VMA_DESTROYED;

wouldn't we need to clear the other new commited flags here?

> +			up_read(&vm->userptr.notifier_lock);
> +			if (post_commit)
> +				xe_vm_insert_vma(vm, vma);
> +		}
>  		break;
>  	}
>  	case DRM_GPUVA_OP_PREFETCH:
> @@ -2990,20 +2991,16 @@ static void xe_vma_op_work_func(struct work_struct *w)
>  	}
>  }
>  
> -static int vm_bind_ioctl_ops_commit(struct xe_vm *vm,
> -				    struct list_head *ops_list, bool async)
> +static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> +				     struct list_head *ops_list, bool async)
>  {
>  	struct xe_vma_op *op, *last_op, *next;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> -	list_for_each_entry(op, ops_list, link) {
> +	list_for_each_entry(op, ops_list, link)
>  		last_op = op;
> -		err = xe_vma_op_commit(vm, op);
> -		if (err)
> -			goto unwind;
> -	}
>  
>  	if (!async) {
>  		err = xe_vma_op_execute(vm, last_op);
> @@ -3042,28 +3039,29 @@ static int vm_bind_ioctl_ops_commit(struct xe_vm *vm,
>  	return err;
>  }
>  
> -/*
> - * Unwind operations list, called after a failure of vm_bind_ioctl_ops_create or
> - * vm_bind_ioctl_ops_parse.
> - */
>  static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
>  				     struct drm_gpuva_ops **ops,
>  				     int num_ops_list)
>  {
>  	int i;
>  
> -	for (i = 0; i < num_ops_list; ++i) {
> +	for (i = num_ops_list - 1; i; ++i) {
>  		struct drm_gpuva_ops *__ops = ops[i];
>  		struct drm_gpuva_op *__op;
>  
>  		if (!__ops)
>  			continue;
>  
> -		drm_gpuva_for_each_op(__op, __ops) {
> +		drm_gpuva_for_each_op_reverse(__op, __ops) {
>  			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>  
> -			xe_vma_op_unwind(vm, op, false, false, false);
> +			xe_vma_op_unwind(vm, op,
> +					 op->flags & XE_VMA_OP_COMMITTED,
> +					 op->flags & XE_VMA_OP_PREV_COMMITTED,
> +					 op->flags & XE_VMA_OP_NEXT_COMMITTED);
>  		}
> +
> +		drm_gpuva_ops_free(&vm->mgr, __ops);
>  	}
>  }
>  
> @@ -3384,14 +3382,22 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  			ops[i] = NULL;
>  			goto unwind_ops;
>  		}
> +
> +		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs, num_syncs,
> +					      &ops_list,
> +					      i == args->num_binds - 1,
> +					      async);
> +		if (err)
> +			goto unwind_ops;
>  	}
>  
> -	err = vm_bind_ioctl_ops_parse(vm, q, ops, args->num_binds,
> -				      syncs, num_syncs, &ops_list, async);
> -	if (err)
> +	/* Nothing to do */
> +	if (list_empty(&ops_list)) {
> +		err = -ENODATA;
>  		goto unwind_ops;
> +	}
>  
> -	err = vm_bind_ioctl_ops_commit(vm, &ops_list, async);
> +	err = vm_bind_ioctl_ops_execute(vm, &ops_list, async);
>  	up_write(&vm->lock);
>  
>  	for (i = 0; i < args->num_binds; ++i)
> -- 
> 2.34.1
> 
