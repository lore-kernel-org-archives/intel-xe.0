Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8425C5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 19:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB95112C4D;
	Mon, 11 Mar 2024 19:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RzNSJcUW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B74D112C4D
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 19:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710186611; x=1741722611;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mz6r5IJfG6eSZ01kLW4V20bJSoTnZTNMqpw0+VdU5Nc=;
 b=RzNSJcUWe7FcI1LXlqlH7NHbXXvi4HTiCypyUOH78KAsMMgzJ1JMmOcc
 m8HDPs1GuGJTHX8XcK0OjkbPJxpQVNCmPShrPQKogmQ11G+kR4/i8EFeb
 hpAc0CMhYu6/u12Fh7SkIAXzyniF1JYuYxT6D8hn+YECAHoyy83K65f//
 33EEnoLVLlheOEiWiN619dS+wMNRZ38zbtfob2v3U7fFIsXOxlsOIFvys
 k5L1/4PGX5YQbBgLorOOzxVlwBchsUUzBySM7K6zh957raiDv+DeT6sAG
 4zmkn2Vi44jjZIYtHdzM2mG2LH4ZroUAcqjGfZHjepA9NCCA2kAyMLmbI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5474908"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="5474908"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="15849156"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 12:50:06 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:50:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 12:50:06 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 12:50:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eb3jmv3/18kkEqd0TK+kWrr9hI5Wn1PmshVzKV/NR2A9pm+EhueT4nOL96bRc0oNUZOTFFRinfc3lYWNsAle9NqF052xZcdcxQ/Bw26gyob/B04dnoUQznMTn4ZtHj/ptpp6rCpAowNPQqfZwo9ndwJKoHje6uGhewYqFmGnHUYnXE7nrDFkl1WY0rheDI92BS7VJ0ypxUWxyUeNV94M/VBZbJSmhdb3BCsxEAjjqv+Qq2I9W8gQlD8gjjfFT733t2zEFt91D/LAXNfVP+rCqGwTndFDoCNjpBUR4XK47jeJa4lon3wrqnQy3CMb3Z8imAlNZpqy9700xGCodIr+mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBAth2x8SYM2f2U1/Zf78mhmMxHpGMfTZtmIQ2Qrtbo=;
 b=oO9sGCFKsmbMHEySRVheItUFO+rE280mpj00zgGBoeCFlV7iM2bOn0sfxS0bxWVXXmu0fjtbOkFWzA5oq5kcYvRpsyvDzLNHwTWyUCPAuV8NxJ9oPJHKAIhBxKdxTwLydO+gLR5JVZQzBGEgmrSzIrH90stvfPWY8nacMC0pzjDLd3OtQ2oyYhGKV7SZlDbS1SMmWhTpMRNHwZcjX3tYv2qQGclYqtdNRwZabKSh4yuXSLvaupjNjMZl6o6GQ/C+1XEirdu9hTnj6A1PYwftOIZ8gjD9rxXew7tQm+G9nNdZG0pTzpzGd8fKSOCrL47uqFLtvF1zXWm9sMeCKay8FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4576.namprd11.prod.outlook.com (2603:10b6:806:97::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 11 Mar
 2024 19:49:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 19:49:59 +0000
Date: Mon, 11 Mar 2024 19:48:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 01/30] drm/xe: Lock all gpuva ops during VM bind IOCTL
Message-ID: <Ze9gKyDiycibP6g5@DUT025-TGLU.fm.intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-2-matthew.brost@intel.com>
 <SA1PR11MB6991E7ECA4A2ADD89DA05C1792252@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6991E7ECA4A2ADD89DA05C1792252@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0130.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4576:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9fab8a-aeb7-4709-cba9-08dc42046f00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tR14Toi0AvTIeKJHJ3Swwra6O6T8+J64aaevKtEHK67MHe7ESr6gNuIkTt+AH+w6bnPYPytQmZMIPZdkQRv0Srm51lpmLVlcLnygPR8UjaCSVM+vFDrPYVLPQ5fzceemYypqmh2OgA0hk/oP071eB9bUWdh0qqkmQl1fbxKoqbR+wx5zeRPP0AI46eZzppibQzEOA4kWfI+nqwCk1voCf+WOeOx5Q4Quen3bDLqtS2R7KAutfhjD8Wd/Vw7aPkNMc7FveCchTQATh6P5uRxVFESKoiTDjlLj0Qj5v9wPjuJ2zK9gGIUuN/KI1yiNFYyMh+Oayh2lhyJHg1fQwFArQcGtD53DGdUx0BBQpEcUAqH+a9OntiUcYFX9tv92kJbjLVW8qXxxvBcL5UAO5B9hFyH2hOIKQP0FoKwlA9eUSHpyMhMXyr4Xw3j7zQhr4msNLwVJHbcPOOEHCKK/HJAJZxX3Pk5qiiFldm+OjJzMLR8PZ9EkuiRUpPzlSgwLfkC4ScCqEW+4xvlyuHpID00fAT95EBwtXvx/Tm0Jo05W7v5KDrshZ14Uapm//CPEWrcAkYSk13vA0ZR3DHsg/C5rYPpRu3NfC1cLOP1vkbPetXQpFLG5SofwqkJt8vItJcjRpO5MNRDmWXj00BuufLADNicHw3VoiBGvYioIA8f8Q7s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HqfPl2ctFIZa1NONgDb5fKYG/upRNKkXHtdc/O/4aKxao1L103mkVNG52Ko4?=
 =?us-ascii?Q?XRIHRhZdf5JXfcPSz/HNddbGpqhJiFpywcDYWRY8vr6umxJ3IznQzzE528us?=
 =?us-ascii?Q?ZRqYQ9oPl/w3wvdpcFuXzz7mTJQxzrCE4VVSkdgYWP/K79vFyA/fJmeNUYWp?=
 =?us-ascii?Q?pW6oXHB2UTpGFhJVHrUKEYXpmDOov8DgiUkh2lMaxdH1kJtQ9w9z7YBJUpfc?=
 =?us-ascii?Q?XcmY/B/lLGSi4YX4G0wukQ4Pdq/IQCsRou3VjPXDcISOVh3Fsw0VjCJhlYIK?=
 =?us-ascii?Q?QkmdUch8EJIU/d/xAoaAH9+tJPeAFJLwKs1AlC5LYK8ZborbTNHrQItPapcx?=
 =?us-ascii?Q?HeKxvQOxWjPLA6KNykycFho+B2tgJibycCNBejG9iECLe8jDbiYD1cT5WhoZ?=
 =?us-ascii?Q?aVpWd1RubgJW2R7CiBhG219qoabLNyJo8urOp/G8tsFv7YsE/qbB9Rq3Bafk?=
 =?us-ascii?Q?6SUmYX86igzbDxgkkQNxBaFQRfkXH39jevrJfdryGSGL8M/ymsdy0KfsxSu3?=
 =?us-ascii?Q?PNV9gZA1wU0S4miuDPSZXRvxkNo6WVYPxm/vpO8vI+mYOQwCqcKxTH8uhF/0?=
 =?us-ascii?Q?KC0EKXgci5iDSPIJu2BUU18TjNLcnVx/POKwaoNONBCxgOTKzbcRubLXk6fU?=
 =?us-ascii?Q?c2dmRavdnGhlUlNxXwe95mTga/jRoKEalLeayCqaEabXmfuQJUM+RDC00/8C?=
 =?us-ascii?Q?ES5eTxmUkh4dHl7UL/uWVkL5acjGH8Zipu2t9Eg3iuMQGo0sk1fYNPHdHfT/?=
 =?us-ascii?Q?m1z7av9+j1Le9IdHA56+V3MlDUC3MpgvclO/80dF4tIOrkLRC06ni2OuBwz8?=
 =?us-ascii?Q?wP8miWEdyLk+HaPe32TEzgH28Cl1/NbPNRXG8Ea3DY3cUrpHS1pbJg7o6Lwc?=
 =?us-ascii?Q?OaF2UNFzlF4IVTL5sAwCe4MmzpCItlA8yNtH9+Losu8mR9kosoOas+XCzd6U?=
 =?us-ascii?Q?fJWTDo8S8AVUkJkFrxQNCFzDT98bd1z3fbtNrPogEjXzljy65VBiAvuEmWDc?=
 =?us-ascii?Q?6O1k5dn/EUaa/bmDYsyumfyXc8EBV0TiXQFWj489UHpiXqzhYrQ9QOB80jWx?=
 =?us-ascii?Q?Z3c1rqOe/DZwZ6k9h+/EnZ6JiBqx5Cc7JaHvx6gCppSuCtOoXk7ea7qXt0Le?=
 =?us-ascii?Q?DtalVVlTf5o+rspm3kLxnheeFq6P/wXoDg03OCmib5HlZh8Gqs2S/899X1zR?=
 =?us-ascii?Q?fY8yvJJDdpaHLaQCW3OEeXbigOlpWUmFX5Pb+ZGDmhFcuX73dlrKB/uw7EW2?=
 =?us-ascii?Q?h/3+fUrBqsW8O3tC2VQttRYLDxNsSuxaqpWMw3Wx/+fExJ6U7T5nkYkl7qO/?=
 =?us-ascii?Q?+ilDvZnr3SE1vKDJ6DIaFjckZ9mrUCizkl00E9ztum6X4jygwc99tws7bSPe?=
 =?us-ascii?Q?1E+ST1VCwdZAVRtYs8dceE92Z59d2+c2OzPF9scGdNJTUU1Qwf725dqtFhAs?=
 =?us-ascii?Q?g8X8s46yE1VLDe0wfgnRaw1SQ4io+HxHvc0iNH4WggnxwWIMcbkd8xHQ8RbS?=
 =?us-ascii?Q?xiaiddCTty8+GpTywz+8cOjW+6yV1vZihHWJMU3q7Nk+Zxghr1IDAs6YVsI2?=
 =?us-ascii?Q?WrY+7HAjURU78pOYo6rMwOL0nCoQ6qIKXZA7EjEHhmvpVEnJLhj1gzUVZ7a3?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9fab8a-aeb7-4709-cba9-08dc42046f00
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:49:59.0900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfnJTtW27j2BfHr2fy5tP3LgymJ803y7ihLJkdy2fu6EUnas1c1ZsVa0Ahr9EWmW181i7zZoyrNydgfKs1uoUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4576
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

On Sun, Mar 10, 2024 at 11:44:00AM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew
> > Brost
> > Sent: Friday, March 8, 2024 12:08 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH v4 01/30] drm/xe: Lock all gpuva ops during VM bind IOCTL
> > 
> > Lock all gpuva ops
> 
> Can we have a better wording? Better to say locking all Bos used in gpuva ops? 
> 
> Or maybe lock ops by locking and validating all Bos used in ops.
> 
>  and validate all BOs in a single step durin the VM


Lock all BOs used in gpuva ops and validate all BOs in a single step
during the VM bind IOCTL?

> > bind IOCTL. This help with the transition to making all gpuva ops in a
> > VM bind IOCTL a single atomic job.
> 
> Can you also explain, why you want bind to be a atomic job? 
> 
> My guess is, bind ioctl can end up with a series of operations, if some (not all) of those operations fail in the middle, it is hard to revert the successful operations before failure. 

Yes, exactly. It is ensure if we fail at some point in the bind IOCTL
(e.g. memory allocation failure) we can unwind to the initial state.
Also another benefit is we get 1 fence per IOCTL which is installed
dma-resv slots and returned to the user via out-syncs. Lastly, it
logically makes sense that 1 IOCTL translates to 1 job.

The cover letter at some point explained this. I add something in the
next rev.

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 142 ++++++++++++++++++++++++++-----------
> >  1 file changed, 101 insertions(+), 41 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 643b3701a738..3b5dc6de07f7 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -413,19 +413,23 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
> > 
> >  #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> > 
> > -static void xe_vm_kill(struct xe_vm *vm)
> > +static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> >  {
> >  	struct xe_exec_queue *q;
> > 
> >  	lockdep_assert_held(&vm->lock);
> > 
> > -	xe_vm_lock(vm, false);
> > +	if (unlocked)
> > +		xe_vm_lock(vm, false);
> > +
> 
> Can you explain why we need xe_vm_lock in the first place here? 
> 
> My understanding is, xe_vm_lock protect gpu page table update. Below kill function eventually calls into guc_exec_queue_kill where I don't see any page table operation there. So I doubt whether we need the lock in the first place.
> 

I think it it protect vm->preempt.exec_queues list but that could
probably be reworked. For this series I'd rather leave the locking as is
and then in follow up rework the locking a bit and fully document it.

> >  	vm->flags |= XE_VM_FLAG_BANNED;
> >  	trace_xe_vm_kill(vm);
> > 
> >  	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
> >  		q->ops->kill(q);
> > -	xe_vm_unlock(vm);
> > +
> > +	if (unlocked)
> > +		xe_vm_unlock(vm);
> > 
> >  	/* TODO: Inform user the VM is banned */
> >  }
> > @@ -621,7 +625,7 @@ static void preempt_rebind_work_func(struct work_struct
> > *w)
> > 
> >  	if (err) {
> >  		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
> > -		xe_vm_kill(vm);
> > +		xe_vm_kill(vm, true);
> >  	}
> >  	up_write(&vm->lock);
> > 
> > @@ -1831,17 +1835,9 @@ static int xe_vm_bind(struct xe_vm *vm, struct xe_vma
> > *vma, struct xe_exec_queue
> >  		      u32 num_syncs, bool immediate, bool first_op,
> >  		      bool last_op)
> >  {
> > -	int err;
> > -
> >  	xe_vm_assert_held(vm);
> >  	xe_bo_assert_held(bo);
> > 
> > -	if (bo && immediate) {
> > -		err = xe_bo_validate(bo, vm, true);
> > -		if (err)
> > -			return err;
> > -	}
> > -
> >  	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate, first_op,
> >  			    last_op);
> >  }
> > @@ -2488,17 +2484,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm,
> > struct xe_exec_queue *q,
> >  	return 0;
> >  }
> > 
> > -static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> > -		      struct xe_vma *vma, struct xe_vma_op *op)
> > +static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > +		      struct xe_vma_op *op)
> >  {
> >  	int err;
> > 
> >  	lockdep_assert_held_write(&vm->lock);
> > -
> > -	err = xe_vm_prepare_vma(exec, vma, 1);
> > -	if (err)
> > -		return err;
> > -
> >  	xe_vm_assert_held(vm);
> >  	xe_bo_assert_held(xe_vma_bo(vma));
> > 
> > @@ -2579,19 +2570,10 @@ static int op_execute(struct drm_exec *exec, struct
> > xe_vm *vm,
> >  static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> >  			       struct xe_vma_op *op)
> >  {
> > -	struct drm_exec exec;
> >  	int err;
> > 
> >  retry_userptr:
> > -	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> > -	drm_exec_until_all_locked(&exec) {
> > -		err = op_execute(&exec, vm, vma, op);
> > -		drm_exec_retry_on_contention(&exec);
> > -		if (err)
> > -			break;
> > -	}
> > -	drm_exec_fini(&exec);
> > -
> > +	err = op_execute(vm, vma, op);
> >  	if (err == -EAGAIN) {
> >  		lockdep_assert_held_write(&vm->lock);
> > 
> > @@ -2756,29 +2738,107 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm
> > *vm,
> >  	}
> >  }
> > 
> > +static int vma_lock(struct drm_exec *exec, struct xe_vma *vma, bool validate)
> > +{
> > +	struct xe_bo *bo = xe_vma_bo(vma);
> > +	int err = 0;
> > +
> > +	if (bo) {
> > +		if (!bo->vm)
> > +			err = drm_exec_prepare_obj(exec, &bo->ttm.base, 1);
> > +		if (!err && validate)
> > +			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +static int op_lock(struct drm_exec *exec, struct xe_vm *vm,
> > +		   struct xe_vma_op *op)
> > +{
> > +	int err = 0;
> > +
> > +	switch (op->base.op) {
> > +	case DRM_GPUVA_OP_MAP:
> > +		err = vma_lock(exec, op->map.vma, !xe_vm_in_fault_mode(vm));
> > +		break;
> > +	case DRM_GPUVA_OP_REMAP:
> > +		err = vma_lock(exec, gpuva_to_vma(op->base.remap.unmap->va),
> > +			       false);
> > +		if (!err && op->remap.prev)
> > +			err = vma_lock(exec, op->remap.prev, true);
> > +		if (!err && op->remap.next)
> > +			err = vma_lock(exec, op->remap.next, true);
> > +		break;
> > +	case DRM_GPUVA_OP_UNMAP:
> > +		err = vma_lock(exec, gpuva_to_vma(op->base.unmap.va), false);
> > +		break;
> > +	case DRM_GPUVA_OP_PREFETCH:
> > +		err = vma_lock(exec, gpuva_to_vma(op->base.prefetch.va), true);
> > +		break;
> > +	default:
> > +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
> > +				  struct xe_vm *vm,
> > +				  struct list_head *ops_list)
> > +{
> > +	struct xe_vma_op *op;
> > +	int err;
> > +
> > +	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 1);
> > +	if (err)
> > +		return err;
> > +
> > +	list_for_each_entry(op, ops_list, link) {
> > +		err = op_lock(exec, vm, op);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> >  				     struct list_head *ops_list)
> >  {
> > +	struct drm_exec exec;
> >  	struct xe_vma_op *op, *next;
> >  	int err;
> > 
> >  	lockdep_assert_held_write(&vm->lock);
> > 
> > -	list_for_each_entry_safe(op, next, ops_list, link) {
> > -		err = xe_vma_op_execute(vm, op);
> > -		if (err) {
> > -			drm_warn(&vm->xe->drm, "VM op(%d) failed with %d",
> > -				 op->base.op, err);
> > -			/*
> > -			 * FIXME: Killing VM rather than proper error handling
> > -			 */
> > -			xe_vm_kill(vm);
> > -			return -ENOSPC;
> > +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> > +		      DRM_EXEC_IGNORE_DUPLICATES, 0);
> > +	drm_exec_until_all_locked(&exec) {
> > +		err = vm_bind_ioctl_ops_lock(&exec, vm, ops_list);
> > +		drm_exec_retry_on_contention(&exec);
> > +		if (err)
> > +			goto unlock;
> > +
> 
> Do you need below ops inside the drm_exec_until_all_locked loop? After you locked all objects, you can close the drm_exec_until_all_locked loop, then perform below out of drm_exec_until_all_locked loop. 
> 

Yes, xe_vma_op_execute can GPU allocate memory. GPU memory allocations
can trigger evictions which try to grab more locks. Once the
drm_exec_until_all_locked loop is broken we are not allowed try grab
more locks. Also eventually on memory allocations I think we will pass
in drm_exec state so the looking can hook into that.

Matt

> Oak 
> 
> > +		list_for_each_entry_safe(op, next, ops_list, link) {
> > +			err = xe_vma_op_execute(vm, op);
> > +			if (err) {
> > +				drm_warn(&vm->xe->drm, "VM op(%d) failed
> > with %d",
> > +					 op->base.op, err);
> > +				/*
> > +				 * FIXME: Killing VM rather than proper error
> > handling
> > +				 */
> > +				xe_vm_kill(vm, false);
> > +				err = -ENOSPC;
> > +				goto unlock;
> > +			}
> > +			xe_vma_op_cleanup(vm, op);
> >  		}
> > -		xe_vma_op_cleanup(vm, op);
> >  	}
> > 
> > -	return 0;
> > +unlock:
> > +	drm_exec_fini(&exec);
> > +	return err;
> >  }
> > 
> >  #define SUPPORTED_FLAGS	(DRM_XE_VM_BIND_FLAG_NULL | \
> > --
> > 2.34.1
> 
