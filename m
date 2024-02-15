Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12E9C4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 22:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546C810EA4A;
	Thu, 15 Feb 2024 22:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdJGLNS5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3AF10EA4A
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 22:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708036676; x=1739572676;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZUBdgWVAvyGsxcijtc6xf5MrP8X0RIwjsLsBilc2NIY=;
 b=BdJGLNS524UpJXnBRrat42p67DLPqDzSRRoeLtwxPHEp/GbUKuVyTTmH
 Uvza9fTpfdejnZwIH10QsSjaR6Iu1IpcdP4AMKELLCrfQiMkm0BoUsyRW
 C6TGcdCM9m6CX0+hKnAHYsyThESMR8vP6Ju7t6wYgFcpzdKhoNVwDklRU
 Slb67dvgljzzSu11yLZSJPWXfIwhde/tj0oRskDMqtgMjSKvO4GEGejMO
 MAh5vTs/YJ6e0yGTdGHFWMnR3bOpqE/lg13qS6JpC+IcwmcpUv9a308pK
 T3CjJmw+lbHaa1sV2AqmPOwPGFU0rZMbgLedQhyy8iV1DJskM33nVOiiZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12705158"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="12705158"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 14:37:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="4032754"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 14:37:49 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 14:37:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 14:37:48 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 14:37:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtJiBLuGSF3maxFqiTBb/xKAdon9zjmrwAqXhk7SJNtVvzOaMMA0rcUN9Cui5jD19E56r0gyy+WDgShaIutjXAiLx6QItCBg50zLT7LClUn3PZDDXK7+G+BtiIgYMfgVnrMB746R+2Avq+MUbxoJHHHhshkGijh1xvgI20H/UHf0gt4MSuxNxGCPYgiP+xlsd4cWjTdfttclNDVnMWFVWGSRZuZZjdoVvdVJEzah10I4QDD6pUFxW41pRKYRv7OTa6rO9rfywJA89aimvbskRGX1zmpoC4bv5ADh6b3IB6lbBntLzGL/nNOAUwizB4OstMiMnO8SuSvVSDJ8YHbVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHQHU77+juhn2HaVVck8MLzrFVUUQtW4T/bjvJGenVw=;
 b=RBU2pgIPLf6f3+A7ExRNzEZItTPpNHBeXXnK1a2Io8mdXwAWbuAvDxxcXgidPWBTgdh29bbR6yRO35SHz7Nks/RrPWf0HPhzqO5JHhs7o68xFB3MEpUyVzIroni49Yqu3QEN6qF13ZbwllcEocsgsHoahxmmA58YLM/a3m7kd+5zO2rx3tBg96k5yFuXuAZRmkhpbjb3T8Hyhjakp879kWSu+phWljxIPbXOQysYuR38FgC0/pfEaRGWMyow7TM2RzpVu6yy2lKznRJ9IzSsfinps2suJBufTUUfJcz7T2eqdwbSyiWKIS2OhF0hN/JyvAEuxXXmkH/6S+2DTrHuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7148.namprd11.prod.outlook.com (2603:10b6:510:1ef::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Thu, 15 Feb
 2024 22:37:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 22:37:46 +0000
Date: Thu, 15 Feb 2024 17:37:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 26/34] drm/xe: VMs don't need the mem_access protection
 anymore
Message-ID: <Zc6SNp-6Im7QuCS7@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-27-rodrigo.vivi@intel.com>
 <e295d9fb-4a3f-43c9-b784-1bb37d38a72c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e295d9fb-4a3f-43c9-b784-1bb37d38a72c@intel.com>
X-ClientProxiedBy: SJ0PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: d7aff53f-e739-4aa7-190c-08dc2e76bb12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4KyaR9LApySrXbd5oY1MeTY6zoSKo/sELFxsealFnOq/ucaECV34MWl9f/cro8fH2rcFVeGYGPm3vidjDGfpxRJn/PJu3QicDU8LibAXjplqP4zy7ekfKS6Xqrv62A5JINAFadz8iBl//hT8gQ77MHo2HTKsoUaFLjmMInO9/8MGwfXBGXu6srg8VJSI15zFHJw7RKJVku9jqX3U5ixqmes4aibf0XcMd8Pyi0rO1tpbQGDvEkppOY7vYUHiduSzD+5QLixPR583xzpT6NaB1uymgJzyq/wHuJItlzJ/jUf9TykFw3gppoWPkF7C/GhZ/M9b8DIu5duF80gNnLud/SH0Xuk91uvPIOazg+zVbySSE2zWnDu76W65W5JhAyAWwTENDHUqdjO/CmotukeXkhHbeHuiT0u/l871VMnLUafLqzVpbm7r8eKM+xdo88FKgUgnKrU0CNvYhkk+YT+vnSSqh0BS7PXHUCJN2GCDQX/xiGfQBLa3JHeRvI3W/HI6Adn/NT0asaNYehVT6tLM8LVed+ejGLMIkVIMfqfUmCnjT9ZI+Vaqrs/OawkbUKut
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(2906002)(44832011)(66556008)(36756003)(4326008)(8936002)(8676002)(5660300002)(66946007)(66476007)(41300700001)(26005)(2616005)(83380400001)(6512007)(110136005)(6506007)(316002)(6666004)(6486002)(478600001)(53546011)(6636002)(38100700002)(86362001)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VnWy0/96ADTyDyU2EuKOcmWDkyx9Vx4Y0sm+BOgKsxyqxWziTKUdS/z2VaJI?=
 =?us-ascii?Q?7iZo9iBq3y5k1xlyZOyvm0ybRt/1DXDP1XCf4C6/RcKLg4Bo8wE06Erwkq8e?=
 =?us-ascii?Q?z3/NH1p+CytzvaXyk43md1AEHqdl6uRuShd6OW1BEYZy4eoUqnvfdnrjq7rR?=
 =?us-ascii?Q?0xyep0TCRRWaaVR3/LnZ6cZ+dUwKsEHXVRjrHhmaAXlzajuWRiLulAElTSuO?=
 =?us-ascii?Q?80Qx+/9yl8j5wK/jeLsMeVegy082eyjirSuQqccFcTpfX8Q+OtHNdPzRhy4I?=
 =?us-ascii?Q?iscr4BmVQpnuas3ScZy0+a+KjAPuH9Ejy8U3IvcgRw+bo0BL/ST9XfXPhA8e?=
 =?us-ascii?Q?7qN7dnJlswWnda3Tc6AZqx/laJZ/QFYWHom5nsBWaHlJCJ3vYV8iIMiTebid?=
 =?us-ascii?Q?BxzZRl8IvQAbHiojeVqRU/yNOYLKthLNnfUC/aOnGbvsl9Ybhue5dJ1dDsf9?=
 =?us-ascii?Q?mUp6b8y9z9ZgvFJkIDk7RtI8V6b5FU4q++dlSVImSl11hJ4mtuRPq8+Fp5aV?=
 =?us-ascii?Q?yw1vRWXTD0oxFHO4yZCZ4/bdIloR5Ac5B1qcEIgptPvXvwMK60+BG/ekKEC2?=
 =?us-ascii?Q?BXan8j8zQSwctSxrluIfBLHBQqq73qOyTGqVIE84YK9U8Y8W0kCsznT2sARv?=
 =?us-ascii?Q?agaARfc7P2PW9dzvTKIJVPN9l8EUJAWjmPMVg9wNH0w2t2PHivaQB6V8T9uq?=
 =?us-ascii?Q?pLR8OjGKjH5eVLjr/XSLOakwDN4zWp3/ck21Z2hphJADnt2ES97iuEp2tOk6?=
 =?us-ascii?Q?zsXM3BaRGdQIhM128qPCxYGyVIkvdRvjkf0C65WqCRD/BHpmUQq7u7hmnCTj?=
 =?us-ascii?Q?9XZdrCf4wTq/NthNAQJaZegQEPaQbnsHEfCOeQJmm389Knv11X9KIbXyKur2?=
 =?us-ascii?Q?FneW5R4Ox/8lse98YoNP2UZEmY9Hla8p3SFdauwCpdBV0POMHAYwY04hZEM9?=
 =?us-ascii?Q?+ssbWxDUQPUyAh3qH1wpuC3o4iUcW8qVk+6JXRx2kxFfRMIJ0m5xlOQ2E+k3?=
 =?us-ascii?Q?VV07uCk+FHhFcNyWb3mNF7yDuAg6eJYTG8K0Mgf9DqjEUXuuKYt0mUoQTvVm?=
 =?us-ascii?Q?MWsUEwe+fG3OobCxrshcSJSJKWSmBFt16xm8zSOL5SeA63giIc23IrZwiY+x?=
 =?us-ascii?Q?gLSQmkgEgVB2MKFEx6P4nKYmVOCkvMrR7QndsV/Sn4HV+toIE1Xv3KQ1xjHo?=
 =?us-ascii?Q?yvg0DLV8QaFE6zDOXdMaYohmYIeG3cgjSVdLmiTSyrN4DARKElR4Hto74CR3?=
 =?us-ascii?Q?2nAlkRuGK7wXlNXatGp0SXFybN3YSwGHqqPRrfu8Z7CD4Vg07dVrxafXWvVf?=
 =?us-ascii?Q?r32DQXj5kYdtkU2IpbbCfCmfBFynl5j8KYD8FLYAKmw7gBKjWtdzq+cWjV5n?=
 =?us-ascii?Q?7UVIjq0xI2J2iWWc/L19/Jb/tFW5mxmI/7faGE1bNkfe3cFEZtWMM64E+nlo?=
 =?us-ascii?Q?z5mGWDuTHo1DvGmG5YsJDpHidLiFAjf+t1kq1phdbB6c0KkGIFfE5lcEq2XU?=
 =?us-ascii?Q?HTv7JDUh4fKd07QKIWSotS5LLznUltSvB0FVqE6LUG+P+WQ0q+0xNWMNrQkO?=
 =?us-ascii?Q?0KFBKzaV9txS42f9ycgPicdJVWW9Cv+sVe9ZR6ax8LWdY82pfnJ8o0SRrvtd?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7aff53f-e739-4aa7-190c-08dc2e76bb12
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 22:37:46.1469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ryZu+z1c82/Rx//Db5zdfz+y4PGIZiTiX2CzMQXtqQIrPte4y3s0VrqnTDKqj+FcciypckhHrdM+WiamNwFTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7148
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

On Mon, Feb 05, 2024 at 01:29:57PM +0000, Matthew Auld wrote:
> On 26/01/2024 20:30, Rodrigo Vivi wrote:
> > All the VM operations are now protected or by the IOCTL
> > calls, or by sched/exec operations or by the specific
> > xe_pm_runtime_{get,put} around the duration of the LR VMs.
> > 
> > So, these inner mem_access protections can be removed.
> 
> Would this be a good place to split the series?

yeap, it is good to split the series. Let's first try to get
that first part in so we protect the missing cases from the outer
bounds as we continue to discuss the rest and try to come up with
a good solution.

> AFAICT a lot of the
> nightmares originate from here. Like first part of the series moves the rpm
> to be the outermost thing, but we still keep the important vm rpm protection
> here, so shouldn't need the CT, sched stuff etc yet. And in theory there is
> still a path to d3cold without this patch, I think. Also playing devils
> advocate, since we already end up having rpm protection for LR vm, why not
> normal vm. Is it worth it?

hmmm... do we really have a path with this in place?

A regular client usage with discrete for instance.
The userspace creates the VM. And then user doesn't touch the input,
screen goes blank, display off, but the VM  is still there.
When we would enter the D3cold? Really only when we don't have
any compositor running? only on non-display cases?

For the LR ones that's a good question, Matt Brost was concerned with that.
Apparently we could have a case where ioctl returned, then the job was
freed because the hw fence is immediatelly signalled on that case.
So we wouldn't have other protection.

the job one seemed to be the easiest to take care of the exec_queue,
but there's this caveat of the LR case. Perhaps we need to find a
better outer place to protect executions?

> 
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_vm.c | 7 -------
> >   1 file changed, 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 9ad154a01ad7..f314ff128028 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1280,9 +1280,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> >   	vm->pt_ops = &xelp_pt_ops;
> > -	if (!(flags & XE_VM_FLAG_MIGRATION))
> > -		xe_device_mem_access_get(xe);
> > -
> >   	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
> >   	if (!vm_resv_obj) {
> >   		err = -ENOMEM;
> > @@ -1391,8 +1388,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> >   	for_each_tile(tile, xe, id)
> >   		xe_range_fence_tree_fini(&vm->rftree[id]);
> >   	kfree(vm);
> > -	if (!(flags & XE_VM_FLAG_MIGRATION))
> > -		xe_device_mem_access_put(xe);
> >   	return ERR_PTR(err);
> >   }
> > @@ -1515,8 +1510,6 @@ static void vm_destroy_work_func(struct work_struct *w)
> >   	xe_assert(xe, !vm->size);
> >   	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
> > -		xe_device_mem_access_put(xe);
> > -
> >   		if (xe->info.has_asid && vm->usm.asid) {
> >   			mutex_lock(&xe->usm.lock);
> >   			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
