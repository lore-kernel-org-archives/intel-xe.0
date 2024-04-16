Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E169C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 17:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF3B10F216;
	Tue, 16 Apr 2024 17:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+FlAI0v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3507510F20F
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 17:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713286964; x=1744822964;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fdRX1DhbXCWlKRUH8ZLK7XgrL+0EwPiMCgBr8dTl4zQ=;
 b=D+FlAI0vea8LyolgmltfKsGUfS0LPworXvAMsRlF76zsKqxhE038eL+6
 XrnP4oC7TA9Xprnt1lkk5o51ybamuKHrvOmUZFaKQlj1MDvayk9DjsfBA
 niz0VPZ9CaohRpXhjU6vurNAChxd8m1v6ANGjlDeJ7ejtiHPb2CE8UP5Z
 AmiAN6v/zYoUuVAXfVcHfclhVEnwETKgoNS8rq5v5IcP/D0N6/xZYJtyb
 08cpsNzn7EjlCFxkGvETO7Oo2HKfqGMIvTFjlzcgx5YfCyFLoOsLcpSmC
 dtwVmpDthluFOB/nEMI/DgJ3ebHQ7adUnl37sXJIvqrJLZNxqFX0Qd/xV g==;
X-CSE-ConnectionGUID: FdViQwMaSS2o/YjmOLSfRg==
X-CSE-MsgGUID: V/42pkpLSb+/NiGL8CWBOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9292858"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="9292858"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 10:02:44 -0700
X-CSE-ConnectionGUID: VwaqTcXpQMCl3Sgc7q0TiQ==
X-CSE-MsgGUID: YcAtLjsCRWqnlTka583JjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="45610904"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 10:02:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 10:02:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 10:02:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 10:02:42 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 10:02:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUWvff0cM03bcdtAxLrizqadvxyeT4BZR7vACErlssfU4b/eGNV4wgIWxiYAQVGa+9OdpMDwCvrIdFVWZUWxnAU/UvIRb+uaFzwc3gzK0L23njXXjwGzzxyfzAAUwUJ4Fv2Rfrcjf4kAjere+g54PY8a2omHVlagtJjaiorJSJJ/4W4auBuobNegYhdQsfAG2UUvW17jpzw0GCDvd0NgAx2zsaEvL3NOdKER2Af/zENmjOB2zijDYKqh4y4PePxYUGzXQhKCkISOwSghfIKcQULn9KRFmfAzDRd5pGaV3dnM33Kv9FWd8Zb8xOpjH4cJdIS++EmFvNO6SiHS1sE29A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5eajW2asFSVqC9U7ZWRaBR12IG9e4fjmatLHPMC7hU=;
 b=WB4i/NdECBGU2RK/RcTwB6gHRd5e6CAGnkbx57Fa73QakMCZLWI+KTslOcNphQOcXq84mqrhjgnGV2moBTQ24LuvXN6FaKuT4YRlyrZ53Zom/CKOREYpJqNsIL1zoDUc1Wp+JdN1L5C3nu6O+eGaeQwaK2GMA0nYYsyQu3Cs9ZiM6Pht6Rffs9XtWtOEDxDMQvGEFCkGZdzSSnIP4UhTODVwuoWr1o6wD8zn1XgB6DAoac6pXZCOoitXvHbvMYb5L+FfgN2+5Oj+XBU9wy6gflm50/3jYMPQ+rfHxWJqbwizNF0tbfj+PyN+8F3CwU00vj5+DUnSsAUvQS9dpz6Cnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.30; Tue, 16 Apr
 2024 17:02:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Tue, 16 Apr 2024
 17:02:39 +0000
Date: Tue, 16 Apr 2024 17:02:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 01/13] drm/xe: Lock all gpuva ops during VM bind IOCTL
Message-ID: <Zh6vKzuCL3LhiOSx@DUT025-TGLU.fm.intel.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-2-matthew.brost@intel.com>
 <SA1PR11MB6991AC5A46A3177C4742AEE292082@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6991AC5A46A3177C4742AEE292082@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: c95849c5-7063-4845-c791-08dc5e3705c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZX8HXubdPpK3FDtCvKNigyZAWW6xhPvk/DUtsJmSaR3IrFvrTge11C1/5tyEbutQdVcUcs83bMEXwTNC1i54xod0cRaCLNOaKrjqldxYZABWZ4uMWGf9DuzetCcvQ+PxppCBrOu1AYTJVbA/w2ggBfyA23TZXGmFbZbdcf3LW+2xrfIRB2ZPcrq9BkZe/ZstP0Ff7aUQ0T2eeYafjzfFW7r7ZkpdH9Wz4WHhWds+S1GmwXXh2OvjZ0K/EtZ2Iz+teaggMaiJ/yXtqIUaNWBnpFod/tWeAZWv77PHbwt4yLuIu1hLOV4jsDE48h7AYMU/Oy6Ny+Ny1cNvjCF9Gik9Dg353FrdWt0GzV+edThyq77s6eQS29ApSvDzzTpj5BqT91LKMVSfVT7vtU6OK9bbfq+aW1EvIdJAMPuRzBVS7CeoI7jzBoAO7I5q46aoKSxAuGM9sajZe4PYlrCxa7QxFPmwZrtysRgoBKPe4M9LJWg5QhCmriQ8PFjEmNWLlaXB4ZBJIA1bqMgWb4WvUuAV9OxdCYehcKckgT7lJ+YoiCrYbKIccvgeDuHTMLHowLuReCzTn1P+H4prHFHfDb43CKM8ikoCNOVX876R+4hJqHU4g27xFikY7ysO746T/nh/d9LhPevoseq4xTBspenLHe9AqzKHChuX9fcQyQ3mpt4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kx5tE3TGyPIq3F2Dzm6rkgRlRBJsNWR2lHEKw7YBPYgk0MqyLNpw17APJJiw?=
 =?us-ascii?Q?g/yLAFepQ5XLUiBeBI4PMOMCwUHbM/v99VdO3jhdFsdMMnF6mVEnjK0o49J2?=
 =?us-ascii?Q?rJ2i5VbsOZ2uD/O3VU4YuXJ33GCQXkypAoGFixE1q+J/eHCmkWR7ikw1MBkF?=
 =?us-ascii?Q?S2sJSZaoa+7vlvHIA8JuGxA6jFrxtQzoAYNgF+m7LozVWEHnjpz1CE8oFQPp?=
 =?us-ascii?Q?+hNkkOflpYpcHaxjWm5GtGz4aZX/y99kgKBgRraTql4GlQjcZGvubsnWVdQI?=
 =?us-ascii?Q?PEEnMK8MR9+rVgFHPqvEEzq1JsUlqgdBE5XXGfHLZuYq01fHyjPsgKDcMUAs?=
 =?us-ascii?Q?SRAPg3A7pBwTgbyzm+26siOQe/ysWdRuiS+s4acqv6XYCYe5me/R6YIP3QjU?=
 =?us-ascii?Q?ff0zg4T+pVaoAjnk+VSB54JXLV7X+S2FvX7kqr8NVotRLVqDxnPGfpLjqi6M?=
 =?us-ascii?Q?m2fLW4PJ07Rg+dQvRqmORR5AzOEEvnDoCM0whFZr3Bf0OH6RvMpLXbmI3QFR?=
 =?us-ascii?Q?i95ZkZ95XRqi6iprcFgEaOZxpLQFUI/lUIKyEB7yJiz0J++4CaTnQGuSFRqy?=
 =?us-ascii?Q?TBfJMvbINrx+ZPam6qdRcjk7TKpHH9tDST5AhnkqAeuG70unW48k6uAifaFJ?=
 =?us-ascii?Q?vTreegU0ZbzmvzeOpINKnzXEmpwGhLYJ2KJ1v3fsHpoUaininReXBJgM13xz?=
 =?us-ascii?Q?CvzVwD/I1JqFp/KSSpLZfIHGmpqdwzfZDmEDnvEo8xRzXTmvXmt5W9rOYbKK?=
 =?us-ascii?Q?HgMT+Nil4aU0OAmArNxTmai/3eBcS73uz8S7V8NhImQIHn0Tn82I6nsllWYP?=
 =?us-ascii?Q?s4jzeVMzG3391KgepuF1d4dkdU7laNGNWWV53QMp3rKM5SFIeiULlvYJkUeg?=
 =?us-ascii?Q?bQi1sd3AS95w/tM6oG7oVbq6SBVJxK9DPRGKAimHBRjsStYnEYwOo7Om0Hrw?=
 =?us-ascii?Q?VR28OdOD1KbWAz8yefB+je6tNG2IcBCZS07vUc9CwMnbgYtRSc/B1rtD3Us1?=
 =?us-ascii?Q?U+hPy/NlL832EuO/gNvZKEgjHxuYtdt5FZ0p0P1Az6D3SjLEryiBNfQJEAQR?=
 =?us-ascii?Q?nJV24oBg3Kn6HgFIMK/XQmLQtYO54RH0QvQJ4rPPiciJ70OOyrbNWZl9CzsX?=
 =?us-ascii?Q?fp2DEXlnlODmeTOFJqaTKhyb3zw96IZZRjrlf49tUYieNobIKHPfXtfxCbYJ?=
 =?us-ascii?Q?W82w5GV6q4VRS5yCA1IfOEr0JpNXvXw+3BIe2gQq5Sz5opEgIBG+mKX0AFtO?=
 =?us-ascii?Q?jwRI1BLAEYJbPTFmYXhNXcL0xjM8f+uP6OfnL48xpLOx6cT9G0lTcc0rUAzz?=
 =?us-ascii?Q?6ue40FvuRzys5BRFRAGcd/M+ByisP77HFgwX6loVDrTbR9bB5+4m444ujZ5x?=
 =?us-ascii?Q?dT7++hzHS2OoqNQBJQTIDJCgygt/N6eDmRgt+6T0ZGt1dzhlMZI/GtoU5esb?=
 =?us-ascii?Q?r6icOY6jxKZEbPPWLMOSfu3e6cX8ptP9r45wGbKdVnqVua7rouF4+CKD6OoO?=
 =?us-ascii?Q?rKWrsIpgCO1jey6djmNOG0V85Goo/2+vLCsWdYPODcaUdWMn+v+6KkmBFdvi?=
 =?us-ascii?Q?Bfjp0Hav9nzRhzSDif2Wn1onI6y27/PI85wrgN2S0CQK4MgF3/msNSYBWw0+?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c95849c5-7063-4845-c791-08dc5e3705c2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 17:02:39.3958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ClUo14YeEsQnXwCsEehATMXb5Ml4qtheRBJsxjQNnmk/ciKAgxHOZ4O7ra2vGxFLICkYuqo51H0ALhx+K+X1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
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

On Tue, Apr 16, 2024 at 09:51:24AM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Wednesday, April 10, 2024 1:41 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> > <oak.zeng@intel.com>
> > Subject: [PATCH 01/13] drm/xe: Lock all gpuva ops during VM bind IOCTL
> > 
> > Lock all BOs used in gpuva ops and validate all BOs in a single step
> > during the VM bind IOCTL.
> > 
> > This help with the transition to making all gpuva ops in a VM bind IOCTL
> > a single atomic job which is required for proper error handling.
> > 
> > v2:
> >  - Better commit message (Oak)
> >  - s/op_lock/op_lock_and_prep, few other renames too (Oak)
> >  - Use DRM_EXEC_IGNORE_DUPLICATES flag in drm_exec_init (local testing)
> >  - Do not reserve slots in locking step (direction based on series from Thomas)
> > 
> > Cc: Oak Zeng <oak.zeng@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 147 +++++++++++++++++++++++++++----------
> >  1 file changed, 107 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 66b70fd3d105..6375c136e21a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -414,19 +414,23 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
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
> > @@ -656,7 +660,7 @@ static void preempt_rebind_work_func(struct
> > work_struct *w)
> > 
> >  	if (err) {
> >  		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
> > -		xe_vm_kill(vm);
> > +		xe_vm_kill(vm, true);
> >  	}
> >  	up_write(&vm->lock);
> > 
> > @@ -1876,17 +1880,9 @@ static int xe_vm_bind(struct xe_vm *vm, struct
> > xe_vma *vma, struct xe_exec_queue
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
> 
> In this original code, bo validate is conditional to this immediate bind flag. This flag is from DRM_XE_VM_BIND_FLAG_IMMEDIATE. It seems later in this patch, the immediate flag is not used any more... can you explain? See below
> 

The immediate code just got pulled back in and omitted this in the
rebase. Will fix.

Matt

> > -		if (err)
> > -			return err;
> > -	}
> > -
> >  	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate,
> > first_op,
> >  			    last_op);
> >  }
> > @@ -2539,17 +2535,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> > *vm, struct xe_exec_queue *q,
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
> > 
> > -	err = xe_vm_lock_vma(exec, vma);
> > -	if (err)
> > -		return err;
> > -
> >  	xe_vm_assert_held(vm);
> >  	xe_bo_assert_held(xe_vma_bo(vma));
> > 
> > @@ -2630,19 +2622,10 @@ static int op_execute(struct drm_exec *exec,
> > struct xe_vm *vm,
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
> > @@ -2807,29 +2790,113 @@ static void vm_bind_ioctl_ops_unwind(struct
> > xe_vm *vm,
> >  	}
> >  }
> > 
> > +static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
> > +				 bool validate)
> > +{
> > +	struct xe_bo *bo = xe_vma_bo(vma);
> > +	int err = 0;
> > +
> > +	if (bo) {
> > +		if (!bo->vm)
> > +			err = drm_exec_prepare_obj(exec, &bo->ttm.base, 0);
> > +		if (!err && validate)
> > +			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> > +			    struct xe_vma_op *op)
> > +{
> > +	int err = 0;
> > +
> > +	switch (op->base.op) {
> > +	case DRM_GPUVA_OP_MAP:
> > +		err = vma_lock_and_validate(exec, op->map.vma,
> > +					    !xe_vm_in_fault_mode(vm));
> 
> I meant here, should the last parameter be: !xe_vm_in_fault_mode(vm) && IMMEDIATE flag? Or maybe the IMMEDIATE flag is deleted? I did see it in xe_vm.c:
> 
> 2796 #define SUPPORTED_FLAGS \
> 2797     (DRM_XE_VM_BIND_FLAG_READONLY | \
> 2798      DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
> 2799      DRM_XE_VM_BIND_FLAG_NULL | \
> 
> Oak
> 
> 
> > +		break;
> > +	case DRM_GPUVA_OP_REMAP:
> > +		err = vma_lock_and_validate(exec,
> > +					    gpuva_to_vma(op-
> > >base.remap.unmap->va),
> > +					    false);
> > +		if (!err && op->remap.prev)
> > +			err = vma_lock_and_validate(exec, op->remap.prev,
> > true);
> > +		if (!err && op->remap.next)
> > +			err = vma_lock_and_validate(exec, op->remap.next,
> > true);
> > +		break;
> > +	case DRM_GPUVA_OP_UNMAP:
> > +		err = vma_lock_and_validate(exec,
> > +					    gpuva_to_vma(op->base.unmap.va),
> > +					    false);
> > +		break;
> > +	case DRM_GPUVA_OP_PREFETCH:
> > +		err = vma_lock_and_validate(exec,
> > +					    gpuva_to_vma(op-
> > >base.prefetch.va), true);
> > +		break;
> > +	default:
> > +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> > +					   struct xe_vm *vm,
> > +					   struct list_head *ops_list)
> > +{
> > +	struct xe_vma_op *op;
> > +	int err;
> > +
> > +	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 0);
> > +	if (err)
> > +		return err;
> > +
> > +	list_for_each_entry(op, ops_list, link) {
> > +		err = op_lock_and_prep(exec, vm, op);
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
> > +		err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm, ops_list);
> > +		drm_exec_retry_on_contention(&exec);
> > +		if (err)
> > +			goto unlock;
> > +
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
> >  #define SUPPORTED_FLAGS	\
> > --
> > 2.34.1
> 
