Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B02C4452D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 22:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAE010E136;
	Tue, 21 Jul 2026 22:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmXDq2SZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BD210E136
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 22:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784671522; x=1816207522;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PQAg04OcumViC9BGDoKmjP9CSv9jpAYLku5Rh2MWbmw=;
 b=hmXDq2SZoxxPjEkMDXyAgfnO6Qu/DScThIte2DfWiyeQoQnLNo8Jqibn
 uXB/JNms8hLen+uNI8NWbbPP0BK1rOxhEV8P6w7VP1uOR9nB+a/xiB866
 ArraF+1Jzp9gJz2BMMHTEBI3wSZ5ez4I1e/Vjx3hJRQAGX09FZyHbowPn
 +ZkgRFNJb5p28hRW285/trk5/ii9FmJL983qgo8Fu0XA2EYg4gPDyCedp
 sE5w/S6khwanjvr9ORJE5msRbLy04hRyCi+lGRB0IOB7rtyqiYW6vRVyy
 muiiUU2jT39IDpqaz/7vj1vJcHuuMo7SabD4VAlHy1/ZmYMJUSZ2IctRm w==;
X-CSE-ConnectionGUID: pw3POj1gSpuDCcP96aiTTA==
X-CSE-MsgGUID: vkUddaOUReaLW4luMi6lUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="89182613"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="89182613"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 15:05:21 -0700
X-CSE-ConnectionGUID: UyU5IRnoT9iKbJdAhH9hRw==
X-CSE-MsgGUID: 1atPXepqSeWv9JdtSs0esA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="256677252"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 15:05:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 15:05:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 15:05:20 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 15:05:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fk3Gtz+H/9miTF64cGIN/m3k/MkOQSiBoTgmprPIR9l3JpTwKj8dft5+hlrhk0MkbJUZ7WSBI7ODsPejDa97h+MTxjnTw16yURrZBJqFl//Vj1wk67ITSIj1LEQ/naI2v7NIjdnS4ySbqRRLPaxR/RkAe+D8sEH9CWrG/Xb7iq9FBiZOkN/IO1K0zufgQnGVq0nTv3NUPBH1Fk5TxEJpuT48Hy2Xy41++kJ4DPYU4WzRhBECtfqO2N2+MRsHTh6mpMH1V1bGcz5jypyob92LgTsYZgqRsA94j+a0/Fy7dHKdNrATvUFQmqWAlH0HKBgH//KVOYY8ZgvMjN3Ft01flA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQGpyirBir6G17oQlXXoJbSg9QmxTEJKvaFLVEMN7ak=;
 b=tgmiz1+6Nwq+p51C53bUzo8yHxgv7O7pAJgieGC5RukODmcJb8lzT1N/1COj3eQDJ9IaNt4WOEklgOqWILlCfoMjTbB1WYgYsNvJDaSVSgu3vVZ8qFiEKEmXmO7qdqs0KyhO3ynnj+ZGX+jeI56iOwzNrLUxbxPZANNXry02yuegDOAIOktHJIsNS/RyD0iv0RRzguDpJhFtBcuf0ALgcx63rLYwcmmcqG0P5WXqORMnD4pH7TmY1ZTnOKkt3XftozFd+Sd3c3WIVzHp41XPfSRx/xdzmn2fcW3mlo+UggZusYdP0039mCQ+L+Kz7L7Nwm8VFyjm1aY4hN7se35PYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8537.namprd11.prod.outlook.com (2603:10b6:a03:56f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Tue, 21 Jul
 2026 22:05:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 22:05:16 +0000
Date: Tue, 21 Jul 2026 15:05:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/vm: Fix SVM leak on resv obj alloc failure in
 xe_vm_create()
Message-ID: <al/tGnJXhwe2b5xY@gsse-cloud1.jf.intel.com>
References: <20260721205516.4058959-1-shuicheng.lin@intel.com>
 <20260721205516.4058959-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260721205516.4058959-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR04CA0337.namprd04.prod.outlook.com
 (2603:10b6:303:8a::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d8da79-6c9d-4b66-b00a-08dee774258f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: w+Q7i5YNozQtYVazxlTgdnHGmjJyuwV7+AqpuiPFOowwW1Y4YmVETj/IQ7gv23rKdwII8YDsGPNU+uf9BDV2hyIJEt3G/p++z6AoDnkBZoWOt91uZw7PAe22wDxB8HmY+mW7zzuMO9Zygr7+2H72xdfPcaYzqqQ56mvT5t73n+Hjpe0iRJ4d1VwfQAkIQkwDk2NQ6nQjIMjrHCaYWzq5vCFpDtdDXfUwYl1ihyUTgPmr3Zc1EQ6YQY1USsA4jBFdTXwyoDJKPvciBF41BudyoE/Cmw+qQ7CloXmvbCeBcfzf0NPICoGz6xG2IwyMcX9Pt5J1K/T3hUjowBRW4q4Y3MWEZ0zuYblur+Lf7zK04zhNLd4Euw9SwCcQ74gszlZRqAroQVbcogxF8QEpY1Qeme4FozBY7GoSYX1zErkas2003B2qxKUnYbxH71DCzlai32pLUJm90T+0GABOe8rK0zWgw6MWZq2plrbqh28u2q/82TOUkhyccromBxgcXxV/Hg7J2aM/R5o/hOoMp88CI3XSCcimVd8l3Z0wq9SoLy/oOC1J9u3Nsth9X/oVDFxuHO2cr6N21BmwZfM5sp/5Kxgsh4DUkKqTENffvRFf8lyMiNO+ZFBSgFr0auTn1k8oSC3GSkbHMMTmBKFpaiVqzistxOMQ/MOnuXZgUHXMsfQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(22082099003)(18002099003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rITG17P2v+a0nlNWImbtbG82NdGEeBDsepZzgNWxl8x4arSMVXi8S4F5S8pe?=
 =?us-ascii?Q?wPAHftYyScFY6nrjdCt6NHK+wNKgh70RIhkCIcDNnOnyhFjjp0H3to/Q1o1y?=
 =?us-ascii?Q?W3oOTve/qWVeYUZrzKFGAmR3uDHS0DrMUfPyOOprxPVvFp/ToCVVRtqACFVO?=
 =?us-ascii?Q?jnfFxyGs0EPRad8gqIn5VWpMZZJun5mcGa7YrKr/RWr6I9Ld7++ipkSmVKl4?=
 =?us-ascii?Q?wLIBtu+juxDyoAM8cUHDjTTxlawqbvFLKrgVBkSWS+woZqeDMa/3q6wa2Cd0?=
 =?us-ascii?Q?5lizXYzD+w2s85XABWEC/bACH+tBJzwCzejekGrYQ0uFkMBQy3r/gJeYeudB?=
 =?us-ascii?Q?mX8iUyUxYmabQ9Id3kNckZ5MdkZHdy/cBkC4J8Javdi/X9aLH4nk41tHVO2+?=
 =?us-ascii?Q?ltcXjvFgnUuEfIRYION5MlTxLetNAZ+8FxyJVKVzp4g1G96Bt3DIgYSuUZym?=
 =?us-ascii?Q?w0CwtNDFNVrobbbVv2V/p2PL4NAo8f8tFR9CiCsa8yv20udKiFWN3MH707Ti?=
 =?us-ascii?Q?Kh9FFEAWptldobmVqqia42Aw8G+GjpcevrNfUhQ3e5n2Bd2WrRRiBxolPK6c?=
 =?us-ascii?Q?p4iRSMmko0D7zsM5mMSKyW85oX5ajNTUHwy7/6CSjcGAN1RmTCwmvnox+6hC?=
 =?us-ascii?Q?cHg0iNP2aPB4TUIGs0zuvK5oAIaaCTdKFkhnATzwtvB+3+jJukZDX+M1CX3K?=
 =?us-ascii?Q?fxVpbpagGesO+oUyy72JEYhpb0oktZz77NOzAdzO+iTvCl6nlngFzUCatlCZ?=
 =?us-ascii?Q?Ixfq8gBIZod9IQDVL/0bcwwqlHdkFfMBf/YE1T3GibFKTgUM58QbhlLCXnGy?=
 =?us-ascii?Q?LlLOYiFag7OUHWM4+QW6G/QOnBVeT3c+ZZkKTwpO0oCL8XWukcsdD4FGYXsG?=
 =?us-ascii?Q?Mv1QVCk6bE7lPPFHHO/f3340E62e1bIt0yJaliUek8aTjyw6S4OlnEHnQgo5?=
 =?us-ascii?Q?PaylGg9KNtZDmDv1QIweVYubP7Tc22ybqIj2X++0xJOm8+7rGjXhBZ4KNUYU?=
 =?us-ascii?Q?in1/Bpl/RRCsN1BhvMH4nwBmzY4dphpWVR19reh1e6H87OAss9oyhH9zmn2M?=
 =?us-ascii?Q?ZWoc+myML2FBatFe+f2WFVYYgqcRFb4PNsCv6d7+gnbTz3OxWkhCryu+5vZd?=
 =?us-ascii?Q?rdpXQWt53+lcq7DoP99Qeg3jViUJHjcAKGajNtpjzkOVXL1OYgxTZ4fydNwx?=
 =?us-ascii?Q?M9WO5v6JD24bTfQGkHYZgmus+Vp0WigfOe/w5AAKlE2v83oOP3pZgzIE3Tol?=
 =?us-ascii?Q?y/SPcsNL7Ehh4bOSTiSMb8lvjj5jKKQ+ygVFUiiq+vqHOzRKkKn8udIoDzYq?=
 =?us-ascii?Q?KoUjK+Xtl5VbacqhMuqsRkAViET9O3VLx0okFJsCWCNIfFENaC7gFbhF7Sp5?=
 =?us-ascii?Q?0EEpfS4h96ASDW4sC3PwvefnE1WHuvk98nnXst81EUaGlybp0tYsPsq/RBAp?=
 =?us-ascii?Q?pZhIiKf4dOH44zIYzAX/GnBTX5F0b5UPswAiaAC1/hsDNB658E9Xyn2WqSZs?=
 =?us-ascii?Q?Ne5cSbiU2vbuK0rpwMoZWsc2HAf9wiUvnCDoJtUyksn04F+Gd5+bG+OeJ/p+?=
 =?us-ascii?Q?Gajavdljy4WXaw6sY6aKw7BPf+N7i79VOoVBkyPKLhZ3OG9G/DrSnn+CMBOp?=
 =?us-ascii?Q?MDJ3+LRBwoGQ63lV56SXR9aJ4qH36VWM/lfKQnJgJxGXmLGNo4PR228O8d6q?=
 =?us-ascii?Q?R6TtgnP6a4GVxU0yMZLAt1m9ScPQ9PhxH37uVNch0au55StLR9ZWaFZyWj4+?=
 =?us-ascii?Q?rwbhqc80E5Xx1p7M65Dhept5jc6ddJk=3D?=
X-Exchange-RoutingPolicyChecked: n46dMq03ZkK6Gw2ItXlcRg9IaSyyAIaLi/F6lMMdfQ3giGr99stG3L12dRJTuZ3rIbLfDA/WmScJCyYgRnd3QPgLco81m9Bm47C5QzRIiV1VoPpz92rhPid0DHSo3nlDqhZByuOhXz/7gEXLb6uP4M6o9OR6gjAgDXFOu8bAdW6nm+7MzGaMksvPeull/FjPFPkNHLhugkEg4apoIDcXUEF5W34FubnBY8StKoe7zjVxH4XUtL9Tv5Gtd66Wl/viMQuRvIG0RYNN7QHMNcPpoyF+3Srxr035Fe4xJPuWYsVNrhInLlQdayfjCNcti08WkEYhDgVx4gXtYVXBXVZUjA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d8da79-6c9d-4b66-b00a-08dee774258f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 22:05:16.7070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCnyLj5iUH4tKwHaz8vGNeTBwJ7pqxVwKrBA9OJrgDmn5AwFGp/zY5aWYFIJ8ZNlE9DarwKLPfdGA1Z0jjBFSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8537
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

On Tue, Jul 21, 2026 at 08:55:14PM +0000, Shuicheng Lin wrote:
> Commit 9e9787414882 ("drm/xe/userptr: replace xe_hmm with gpusvm") made
> xe_svm_init() unconditional in xe_vm_create() and extended it to also
> initialize a "simple" gpusvm state for non-fault-mode VMs. The matching
> xe_svm_fini() call in xe_vm_close_and_put() was updated to run
> unconditionally, but the error unwind path in xe_vm_create() was not.
> 
> On the drm_gpuvm_resv_object_alloc() failure path, xe_svm_init() has
> already succeeded but xe_svm_fini() is only called when
> XE_VM_FLAG_FAULT_MODE is set. For non-fault-mode VMs this leaves
> vm->svm.gpusvm partially initialized and leaks the resources allocated
> by drm_gpusvm_init().
> 
> For fault-mode VMs, xe_svm_init() additionally acquires the pagemap
> owner via drm_pagemap_acquire_owner() and the pagemaps via
> xe_svm_get_pagemaps(). Those resources are released by xe_svm_close(),
> not xe_svm_fini(). On the same error path, xe_svm_close() is not
> called either, so fault-mode VMs leak the pagemap owner and pagemaps.
> 
> Fix both leaks:
> 
> - Call xe_svm_fini() unconditionally on the err_svm_fini path, matching
>   the unconditional xe_svm_init() call. Move the vm->size = 0
>   assignment out of the conditional so the xe_vm_is_closed() assert in
>   xe_svm_fini() (and xe_svm_close()) holds for both modes.
> 
> - Call xe_svm_close() for fault-mode VMs before xe_svm_fini(), matching
>   the ordering used in xe_vm_close_and_put().
> 
> Fixes: 9e9787414882 ("drm/xe/userptr: replace xe_hmm with gpusvm")
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Assisted-by: Claude:claude-opus-4.7
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b9c8641e1e15..83f35d8f5323 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1825,10 +1825,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  	return ERR_PTR(err);
>  
>  err_svm_fini:
> -	if (flags & XE_VM_FLAG_FAULT_MODE) {
> -		vm->size = 0; /* close the vm */
> -		xe_svm_fini(vm);
> -	}
> +	vm->size = 0; /* close the vm */
> +	if (flags & XE_VM_FLAG_FAULT_MODE)
> +		xe_svm_close(vm);
> +	xe_svm_fini(vm);
>  err_no_resv:
>  	mutex_destroy(&vm->snap_mutex);
>  	for_each_tile(tile, xe, id)
> -- 
> 2.43.0
> 
