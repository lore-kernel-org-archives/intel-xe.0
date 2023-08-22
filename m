Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C31EE49AB
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 23:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B7610E078;
	Tue, 22 Aug 2023 23:33:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3EC10E090
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 23:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692747236; x=1724283236;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wGtIyoMg1CsCCFqjK4HjYBHmXdqoCcOEE+wBZxDqKzk=;
 b=NPOx+lLscX25Zn8Frvkl/6g+S/5ubXSbTgjHK6GZME+IU32G88MpxJtv
 G6YJXFzEBBrYM4aXDm3aZAfBVa0KvZjIOpSj8nvhPC98FuXDutaB4k2z9
 SxECtwOtecyTM/7/2A8MTtncDbj/+eN9MV5ecSI2MTfTdD6PPSOvbP8Fo
 KHqfKu6A8162LQhblwgIr08YZcmEHUIooXeQ2i7GmtGg8BVEgrhnTeDk4
 i+aelDz19DBxunc10MvM6WBx024zntdghUdkQQy4t6fbl+oUbhqgLc8Iy
 a2wXzEqxlALaCnTLkE1Z1fAQbpHoXWwcMlOpRE5NxaJ1A8XT5Lq++9Ev3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372906071"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="372906071"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 16:33:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="739515020"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="739515020"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 22 Aug 2023 16:33:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 16:33:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 16:33:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 16:33:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 16:33:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=my+BGC84YHKierNQNZmvAcSttKUmN1/0I30csC1CKGkdBK8v0JF7dKsWZTJjAngIlkePZCPGW4NXfVkeAtp19Pr/+8tozvyKLvXD9R+gAQthZvikZbvgdDJZeAArSpeGTXdFLf2DLE5wlWVgeFlwOIWiz0c7l/jhME4ZCX98tF3ugPG9XolJHe3JXwn8zcC33R1n1W0jmdMajQNgNmP+yIeSgUox3sSEWSqPplC7WksiCsneOegU4mDYHJeGyNNdcMn6+P8JnFmYOx9vt1+TYUjlCW5sedOlsDJSH2y0fHUmE4uRDeLIVc6tpqLZ0dQG4VpazwXRM1rLFAjfCMkPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OFEWBX8RmdEjQltWigLOH7vBxR0LVEidavQxxpJd6k=;
 b=XW6NRMxLDrzwkFkYODifqhHTdBlsX3qXaQPiBOldgxGpT0B6FcWsoAI4kCBqBVGx9ooyo4CBSOMpygGWskCManOnSpxnRe2p46Xyfr1OGvAYaorK8YOjKd2mfDkuCiJ0F49dHPmK8GGsOnOw41w5V6UAD3sd6w02HROKL8CF1jtw/NgqQTefKB8Hf/OS3uqVODzNG8szJ4IkR3uyBc+QIg+XYskpOztrwjGOFGJSqVdZ5rtNUtcLsq8DUrif9budb2HjHbvarcCSIz7CTkgXU2/5tzfxeAO0itPdc60htBnFTU7Gc4SGZH+iEnx4wXh8Fp7Pd8Cu+4Gn3/ZRLBGtoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5618.namprd11.prod.outlook.com (2603:10b6:303:13f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Tue, 22 Aug
 2023 23:33:52 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 23:33:52 +0000
Date: Tue, 22 Aug 2023 19:33:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZOVF3AxP8tEkTY1M@intel.com>
References: <20230817043148.740495-1-matthew.brost@intel.com>
 <20230817043148.740495-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230817043148.740495-2-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0187.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5618:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8a6cac-7443-4c5a-e789-08dba3683e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tNtFKkbI5IFJk3haqCZcxGrvmfTLn78hR9vT5FWHv9LdpJSjp8p6QvePQX5+oDDp7+52wAuIRnuNjmA/hT48UsfWZRMzHLPYzX7W7sx6O0Wf4o/phtjfGC/i1Aq12BilKFS95xRNgwWfUhCQJl9jA+qkbWfzBVMg92kGi+ukwjK2hLwReFT4AQa2PILzyL1dseqOniFgN4o8wHeEVQodyimD5USJ+2/E3iRjt2qa2RAghR5lwk+LSdre/urpMz4SB5IIhPVtCV5V5/FKnGNOGyGQILEo7DNVATJghPFID0L/8AAZyZdOlyFFSCLYAQ6zNZS6oJm9Pk2rnrRSZ/GYZtdi/+Gkg7n2WUQ9b4tue/NT7sZMee2+kvIhdAl9kPETxYKO3b7FxqyFthEIhDMG7Wn/53e0pO+6w84hur8V+gPdzTj50andY0vFDqumbfKxsvyjqjF6yr3x644sj3EE+vzACZWwbHsnZw5USb48ZXCuDC0H/8wNQF6FIzCizDPKICYjTiXCOLH9LhYiHZ0/lJYug45KYFIVSqjFkahuobc/o3Fcx4RkhEawLEaqnlzb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199024)(1800799009)(186009)(83380400001)(478600001)(26005)(6506007)(6486002)(2616005)(6512007)(6666004)(4326008)(44832011)(2906002)(5660300002)(37006003)(66556008)(82960400001)(38100700002)(6636002)(316002)(66476007)(41300700001)(66946007)(36756003)(8676002)(6862004)(8936002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FGy2X9xA+CGrFiYGpAp3ajYW7AQQ1T7WtYa8Qor9NZxyXp8W1YvatfZxEYip?=
 =?us-ascii?Q?i9cUIb1ZRjYs9dryANV6XUnb+G4ZiR/lhpgxQVNSdn+/ANPo45wjZ/9T7pgq?=
 =?us-ascii?Q?yPxLDXG5ZFpcuJ6a+syYIl+D6Rrxe/1y1P0W9CPzlQUgBLokOHjLRX2OERE6?=
 =?us-ascii?Q?GHfbk36kvblF1K+kYZIfoOBTTA/SxbrdwJinG/j36TmolZVoC46C0zBshFjs?=
 =?us-ascii?Q?EF8Yhq1eBFbg8li/WcZ45SqXEJWGl7OaUxEppfZlG2zoELgl9NfGOy7UQyKo?=
 =?us-ascii?Q?yyNtAeho5PT53FhpZt150OvmykeDPqtimMBNb1dgq7g/7Ts68W8FFPRVvPFw?=
 =?us-ascii?Q?PTDGZLxr5KcH8zQ8lyhw2+8NHl5tO2WFOYqEw4HCmpGbR2ry4/xaKe9/lqtl?=
 =?us-ascii?Q?+Vfg/OiRCfKdnzxnnHmGW/lrjgNkaty4kN0y/L3rViTYxw/GiGnxfZtuRmO9?=
 =?us-ascii?Q?TOZ135QpG3uEBH03uuX3+D4PRWqG7wjVCaR7ENT3EVMDYlhwnatADl08MV4V?=
 =?us-ascii?Q?Kg9skzdC8kJ2XgRfm5P0iP9WJ1Ae5XRxtpR2loJuj/08pzMIndHRe3DNxgbD?=
 =?us-ascii?Q?bfZv4b/Hxr6fEh+IwBrt+PTDBDkuby2v7kEri9hByebn/YXVW0FusG9gSoQ6?=
 =?us-ascii?Q?QgXu8rsv/taX/X3aNkEbqsWxeZAKiAmSv2CrzWA6YQU1tAx4ND3EtoDfreSY?=
 =?us-ascii?Q?SULg2Jk4LND3vt5Eu9K/oUjKkMCqtLJ4aC52TzhKNGgWJnGkiFvtk0Ck8tI7?=
 =?us-ascii?Q?uCDOZ/1clbZni3dOr68PTojWccG4Fd226EkGnCYVykxXVCoYfQqZncKCiOtS?=
 =?us-ascii?Q?KWHmOIRP6EzmBaNmfcXAU4LPmXRMyRIiy6azixvN8RtBDSrKw28btGsFgeUQ?=
 =?us-ascii?Q?zjIO4Ycepl7G/ntVPtU0gtYdG4C+5hPuij+1FMFdn2+cSRAkmMXOyCftPlhQ?=
 =?us-ascii?Q?29nv2Q8GG+5+61kb8f86SCbbimZikgIrEsoiyLo2oNLu5FWIyBhMXUVAV64O?=
 =?us-ascii?Q?oF/g6ziNEZNUNsWE/jfL2cUtVdU0L6fL6CBWp+blW6Q9nhIo5CVRjPKDdwGa?=
 =?us-ascii?Q?iLZ+RAPWFkiM6z1EtcnfBe8pSbeU7LWVnWYCrlF4X2VEFD5tDYDn2I9mYhdL?=
 =?us-ascii?Q?em/DUeXGGOWzw/U7pfzRrqwJLZ3pctlm7p0d82VjjRrvSJ0Y67cYemzZSV9v?=
 =?us-ascii?Q?wLDxU/aMXg35HmT8DSmsuBaW2+94cZphJvipr8QxVewfklNxdJ0TdamqIqLg?=
 =?us-ascii?Q?LGW+tPLtRuZZMM4vRdYWOEwap5krzt3GAbGG/ziI/G6NK3bYppdupYwCeNi7?=
 =?us-ascii?Q?HRwn3Mr1IvpxmXhrFoF1Q+FaL2hYiYJt0rFMzOTRc8k2avaA7tH0Qn2a9new?=
 =?us-ascii?Q?b4XpShxU2SRleWxZgHB8TX9KG1TzXQZz2Sbfp6VFOkvnQM/NYizRcxdosoli?=
 =?us-ascii?Q?4tXKeeTDwOmpc1HA5lkZontXaVZjm2FnMvvCUrRUsfmXL7GikMDHJOC/XMwI?=
 =?us-ascii?Q?pCeSpUdcBqe36p28zdvUCg+ICiAZ8dTG0sBSoK9nPm6uOKZKWQmBCKHdEjHy?=
 =?us-ascii?Q?dhGRZaYJBK0NbThxOj/QwtvJhrYisD15UVtF1l0i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8a6cac-7443-4c5a-e789-08dba3683e23
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 23:33:52.6610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqolBwhANCbNy7SlP5onQsMhTI8CUiEZwBivfO26kV5OkfWUz6juy+HMnJOockAajlQM4gnoWuJ202gKzUwRnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5618
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Fixup unwind on VM ops errors
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

On Wed, Aug 16, 2023 at 09:31:46PM -0700, Matthew Brost wrote:
> Remap ops have 3 parts: unmap, prev, and next. The commit step can fail
> on any of these. Add a flag for each to these so the unwind is only done
> the steps that have been committed.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 24 +++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_vm_types.h | 10 +++++++---
>  2 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2e99f865d7ec..bd20840616ca 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2618,18 +2618,25 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
>  		err |= xe_vm_insert_vma(vm, op->map.vma);
> +		if (!err)
> +			op->flags |= XE_VMA_OP_COMMITTED;
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
>  				 true);
> +		op->flags |= XE_VMA_OP_COMMITTED;
>  
>  		if (op->remap.prev) {
>  			err |= xe_vm_insert_vma(vm, op->remap.prev);
> +			if (!err)
> +				op->flags |= XE_VMA_OP_PREV_COMMITTED;
>  			if (!err && op->remap.skip_prev)
>  				op->remap.prev = NULL;
>  		}
>  		if (op->remap.next) {
>  			err |= xe_vm_insert_vma(vm, op->remap.next);
> +			if (!err)
> +				op->flags |= XE_VMA_OP_NEXT_COMMITTED;
>  			if (!err && op->remap.skip_next)
>  				op->remap.next = NULL;
>  		}
> @@ -2642,15 +2649,15 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
>  		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
> +		op->flags |= XE_VMA_OP_COMMITTED;
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
> -		/* Nothing to do */
> +		op->flags |= XE_VMA_OP_COMMITTED;
>  		break;
>  	default:
>  		XE_WARN_ON("NOT POSSIBLE");
>  	}
>  
> -	op->flags |= XE_VMA_OP_COMMITTED;
>  	return err;
>  }
>  
> @@ -2855,7 +2862,8 @@ static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op)
>  }
>  
>  static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
> -			     bool post_commit)
> +			     bool post_commit, bool prev_post_commit,
> +			     bool next_post_commit)
>  {
>  	lockdep_assert_held_write(&vm->lock);
>  
> @@ -2882,11 +2890,11 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  		struct xe_vma *vma = gpuva_to_vma(op->base.remap.unmap->va);
>  
>  		if (op->remap.prev) {
> -			prep_vma_destroy(vm, op->remap.prev, post_commit);
> +			prep_vma_destroy(vm, op->remap.prev, prev_post_commit);
>  			xe_vma_destroy_unlocked(op->remap.prev);
>  		}
>  		if (op->remap.next) {
> -			prep_vma_destroy(vm, op->remap.next, post_commit);
> +			prep_vma_destroy(vm, op->remap.next, next_post_commit);
>  			xe_vma_destroy_unlocked(op->remap.next);
>  		}
>  		down_read(&vm->userptr.notifier_lock);
> @@ -3025,7 +3033,9 @@ static int vm_bind_ioctl_ops_commit(struct xe_vm *vm,
>  
>  unwind:
>  	list_for_each_entry_reverse(op, ops_list, link)
> -		xe_vma_op_unwind(vm, op, op->flags & XE_VMA_OP_COMMITTED);
> +		xe_vma_op_unwind(vm, op, op->flags & XE_VMA_OP_COMMITTED,
> +				 op->flags & XE_VMA_OP_PREV_COMMITTED,
> +				 op->flags & XE_VMA_OP_NEXT_COMMITTED);
>  	list_for_each_entry_safe(op, next, ops_list, link)
>  		xe_vma_op_cleanup(vm, op);
>  
> @@ -3052,7 +3062,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
>  		drm_gpuva_for_each_op(__op, __ops) {
>  			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>  
> -			xe_vma_op_unwind(vm, op, false);
> +			xe_vma_op_unwind(vm, op, false, false, false);
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 3681a5ff588b..23b6e10a5080 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -377,11 +377,15 @@ struct xe_vma_op_prefetch {
>  /** enum xe_vma_op_flags - flags for VMA operation */
>  enum xe_vma_op_flags {
>  	/** @XE_VMA_OP_FIRST: first VMA operation for a set of syncs */
> -	XE_VMA_OP_FIRST		= (0x1 << 0),
> +	XE_VMA_OP_FIRST			= (0x1 << 0),
>  	/** @XE_VMA_OP_LAST: last VMA operation for a set of syncs */
> -	XE_VMA_OP_LAST		= (0x1 << 1),
> +	XE_VMA_OP_LAST			= (0x1 << 1),
>  	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
> -	XE_VMA_OP_COMMITTED	= (0x1 << 2),
> +	XE_VMA_OP_COMMITTED		= (0x1 << 2),
> +	/** @XE_VMA_OP_PREV_COMMITTED: Previous VMA operation committed */
> +	XE_VMA_OP_PREV_COMMITTED	= (0x1 << 3),
> +	/** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation committed */
> +	XE_VMA_OP_NEXT_COMMITTED	= (0x1 << 4),

only small comment is that it should be good to change to BIT() macros here.

But up to you:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


>  };
>  
>  /** struct xe_vma_op - VMA operation */
> -- 
> 2.34.1
> 
