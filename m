Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F4EC61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 23:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5604B10E0D3;
	Wed, 15 Mar 2023 23:23:51 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8F710E06B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 23:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678922629; x=1710458629;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Jlm2DUPP3eI3VnjApj4lnzIu5m776w7DNfUS+7ajk0o=;
 b=c5H/yTUaNkegY2s2XeNglDYntbeTGE8KpV37dlggn/o88KPRurzr20Pb
 svfhi8riHNbZhSuHoCBczvVW4X3wtp2gz6uSJXH19d5ldnjlBYm4a60T3
 jBZi7oIYFXWDbSnMxBw55iGAF42TysS6FXevruUoHWA600yPm+iW2UZbR
 3dOQIJqy5uJGcppTNJFcLWTKPeob4hSb52QwA1LVm3iUeBAQBdQdAtyB4
 wVrTe70ZEy5B3525riZZ1RUMLrBkZWTugm6y86Yf1vtdd3cFqrAVOr1b8
 FtD+HTmpvPpp3h/t4EgbLOycR8Nonb7TH1kGbKB/OQX/EZ9my6Y1ZsKhR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="335326121"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="335326121"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 16:23:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="925511404"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="925511404"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 15 Mar 2023 16:23:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 16:23:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 15 Mar 2023 16:23:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 15 Mar 2023 16:23:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPCJ6/4gBmdG3+hUVgpUKul7Wcw5s0bH07Kn0WM981cRuHpBaHAxTE4Sml5clf3eJ9QCZc0eTJ2YegyCFyPnnmbwABFVeaY7OAOf/+WA0fd2TawJJmrhfneI6LDfqckxF3YuZfLOzFIbz4+6T6xjqm/OVlFo0e47xYle9CU6Cc2k8w9YE0sikM7aJ8TzyOmc4T1k2EWW21kpCU8oTzVuwU8ByHtG4wDzkON2aI43ny9sMGLdL4mzChVFluzn0vUA9aG70+bJLkDp7xXS5ZAovLdbweVJqptMZ37E9f07VGMd7ySNoo0Mrh0AWjLhtbeOjfi7Qdvkg+SfBXUsSNQdHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Tztlg+312+zY6ZiBaliT3Hx/FFH4SdxkrmmSY547yk=;
 b=BGXp1BBm7RWnUPSIsM56Q2e2DWJcAaVKf6DpWm8vePBNM0ki2REod0dysN3l6Lse2ZIHKqi2HLFpTtBdvarbvvVpVya2lkFgS58AuxxrI4h7bWpsr0YfM2cB5tJJFKRthWc3SkKVj998qofR7aHOORXO7PHpFa2KsJbN9YALzjo3LjMh/J/Qr0QVMyVsaWWzsFzbySe1mIRfOI7iBVlTej+eqtAh5d0MtGtqu8+Kj6RfEp5MEgdSJy6ANNpG9aAITFhP+7MCEbG27QoCdIOCwlDfe3tu1PNTUgE3tic1tQwkjtSVIFxYjlq6yn5AjvbWqWNidmkIhTV1tOZCxzLVFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5893.namprd11.prod.outlook.com (2603:10b6:a03:429::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 23:23:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.025; Wed, 15 Mar 2023
 23:23:45 +0000
Date: Wed, 15 Mar 2023 23:23:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZBJTXgqLMSjMvMVg@DUT025-TGLU.fm.intel.com>
References: <20230315155507.43933-1-thomas.hellstrom@linux.intel.com>
 <20230315155507.43933-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230315155507.43933-8-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0380.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: fd611fb7-33e5-4d2b-89ef-08db25ac5280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z/zAzuOgQvNCXsJCBC2QMbCdWnKEg5mIUVMKAagGhexbq4sia8jQlPaiv6j7vTrd/3Qmm4TgObz+9EVd971KjBrnPRwOQkDhCuc9yMqaxm8zul4WYUl5JVfM5qQhTpRnHQxfuEb71xTvpi17QqDk0geyaxJ+dFnwUP7Il3bcG+vaR/G7/1o6sMwkT9Xw5FCRIX0Xls+x3m68XBDRqOZOn+rqRYtV9dGeq91yyYzhINd4b8qYS15CqlBGFwsp8tEZMFyYszEMV3LFatW0mNzl3OqyoHPSFLsuhY6yPyPPk+dJw4+421q6NFo2a7O6b5yyf8pMDok21OP6map4LnidauaYBcGlDLm5Na+weIDjKwXVDvqES2760859YT2z8qw8bhzz2eq60lnB4QuDK3klXiH371yhv7wRdpQV5DSXWxqOuBKa6owI9tV3fuaDm9z6stZAVqWItJAr/1eCCpZExBqRf14TL8EPW7GJafsTC7+3we7dJJwxbyD1H+5VY2kyh31iJZlYd89+8AUSRP0xkbeRGxI5P8jZGa/jUgV7ohQr88GhqcZTWOqnMYPjx8NHCsMLdQZeEypifCOqW54KnXb22pcEKx7sWcS2m0QdClNIvP281J341TjBDZJmiwAb1JjIAqmIrqo18iSh2OUeDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(136003)(366004)(346002)(39860400002)(451199018)(41300700001)(5660300002)(8936002)(2906002)(38100700002)(86362001)(82960400001)(66556008)(478600001)(6486002)(66946007)(44832011)(6666004)(66476007)(8676002)(6916009)(4326008)(66574015)(316002)(26005)(186003)(6512007)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JcIlC2l3n19bf1YWa2WUgguHlXHZlxeALI8gY3IMdZtWK6gHAkTIHWUR+J?=
 =?iso-8859-1?Q?2zz0Ut15d6We7Nr+9n+5wniO5KiqY9ixGVYO7/MOBc2F0zvSHmNx6wnj04?=
 =?iso-8859-1?Q?ucOaxc8rFPlmUENbgDxEpTpC5ILEs6gPCerOYoSs/8UMYb1EsdtjGX96xz?=
 =?iso-8859-1?Q?FJET//gFV2vA/uvFEE4ltH3i5yrnzqiqEMswkPmDOXT4rxnk4zcDtL1fU/?=
 =?iso-8859-1?Q?5MEeFTvKk+Jqo4+mxQ2XfyrzkUiKkK9Gp6vzN4YU471Q1y/KPS/U9+lDRJ?=
 =?iso-8859-1?Q?ZGV+dtagUC2YvdGsOWgE88qLzQJLypbHsbPSh0Xe2mE0xcrnxNNsp3eBPg?=
 =?iso-8859-1?Q?6BqFbZljawlGKzbf0xN6V10l8oFUVtBb0jU2rUXZrzrPpNSo2pUxhEk1nb?=
 =?iso-8859-1?Q?VuWqLXIgeAO7rHEP8w59KBQXtE1YQA7eE7WsFIYtexNnlqgVKd0G+bSHG+?=
 =?iso-8859-1?Q?54Be/2vXL2gVMbLnAkin2i6nu2PFcr7G7wd+azT1yjo0As1TMy4pds6Zp2?=
 =?iso-8859-1?Q?krJIAboQfjVEziRrPBaR6TqT0RASY8CdSZ+jgooIXBzNuXt1C3+PURxdbf?=
 =?iso-8859-1?Q?dyzbFjAVjZIi0kv4I1wjD6WaEXoNsRsq9IbWyigvT9MChxNcYOlL0eUNzv?=
 =?iso-8859-1?Q?mtw95hK5P4MBCWCSanc396lcOBnoHKTU1hxpp5cjGEqbQniVrZJgk/1/hL?=
 =?iso-8859-1?Q?+u2SUF/qTt+YlsBJFazF4CdpMnHe0YqcaBj9aEKQHUVXMwHF+bA2TGwxCj?=
 =?iso-8859-1?Q?SsS2/j2JJ7hcYrqScf1FqZ3ZlxPWLoXRknkjl28LpQu8kJlknqOm6Ni+q4?=
 =?iso-8859-1?Q?+588ABv/RcExHoN9A0wrZ+GkMrqOrML+Gy2QXF/ySSb6Ki4HnmpRUOwiI6?=
 =?iso-8859-1?Q?Z2kE9ziCNKhtT7pKQhppADymtLxKEh8dkOOR/WvdQKojQ2nFxRpNILCjdD?=
 =?iso-8859-1?Q?m4eN7wGZk+oIFjvFWKGN48GAS+fQA/W+zx4SQe3tfexkom9Nc883+vIOgv?=
 =?iso-8859-1?Q?un/VHAD6KwWzAQf4cm37geClCd3GHipawuBI476kVreIwTLo1wF/NwhjFQ?=
 =?iso-8859-1?Q?TOVEQvFyi5/rvePSaVKpv4P5e38IHe5G+0qLIrcVhm1pEBdvHxb80iGw0d?=
 =?iso-8859-1?Q?/tK2vfR02ZsOsyOZrkDekKQhI5LvQTaIuvV8qaREWLWHZMfvyyxLxYTWQI?=
 =?iso-8859-1?Q?czgyhH3jaFTS5qXFB/2ZfcRJdFeWUd1E3mFWxZ94BZ8ZTvBBbnNlTNTD4U?=
 =?iso-8859-1?Q?NrAxbQzUWRH1xsruYtEwWS/wWsMOT1lBbp1zzuE5TwvZoPZVxpJE+J1evd?=
 =?iso-8859-1?Q?GOTguSp8LJAwEShPhhf8R1GPR2gaZkuSZ4EQmv4DhkUHAX7thCloNhqzVr?=
 =?iso-8859-1?Q?dZCX3I6DBwlyCc8uw/4W2VAFe0hOA+NAM4C+9WERZSmbzT9goWWP1bzZm6?=
 =?iso-8859-1?Q?oEW5Ecnn4x1tT9t8ViOjY/d6+wGW7+v9VM3L4SaKJXnf/UlKxXdCvObz3o?=
 =?iso-8859-1?Q?4apgtIa3eOJm51PleDtnfB97Ygm5uzZz0Uqi8FsmoELNVI2f6gPUEMc6Zn?=
 =?iso-8859-1?Q?ep0LciZNYu8Pr7N8BhODIR4c8q9ALNLuwukp8p+KeLZepkmWhup64ebugq?=
 =?iso-8859-1?Q?CaUu6JzS9nQUZJveRnXw+aWtysKOdrELTVdVKeE40835Uf5pw1QZCARg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd611fb7-33e5-4d2b-89ef-08db25ac5280
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 23:23:45.3703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5+HEzZYdFkzQd4u5+yMXEZ8fEW1j6zJLjHpZznJWpdTsn7/Pbfa5mCGt3w5/L2WHLXgoLPxlx7JW+5jS0kcww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5893
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 7/7] drm/xe/vm: Defer vm rebind until next
 exec if nothing to execute
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
Cc: intel-xe@lists.freedesktop.org, matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 15, 2023 at 04:55:07PM +0100, Thomas Hellström wrote:
> If all compute engines of a vm in compute mode are idle,
> defer a rebind to the next exec to avoid the VM unnecessarily trying
> to make memory resident and compete with other VMs for available
> memory space.
> 
> v2:
> - Patch added to series.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec.c     |  1 +
>  drivers/gpu/drm/xe/xe_vm.c       | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h       | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_types.h |  5 +++++
>  4 files changed, 41 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 97fd1a311f2d..ea869f2452ef 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -364,6 +364,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  				     &job->drm.s_fence->finished);
>  
>  	xe_sched_job_push(job);
> +	xe_vm_reactivate_rebind(vm);
>  
>  err_repin:
>  	if (!xe_vm_no_dma_fences(vm))
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e8e178922082..6c466c628395 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -226,6 +226,19 @@ static int wait_for_existing_preempt_fences(struct xe_vm *vm)
>  	return 0;
>  }
>  
> +static bool xe_vm_is_idle(struct xe_vm *vm)
> +{
> +	struct xe_engine *e;
> +
> +	xe_vm_assert_held(vm);
> +	list_for_each_entry(e, &vm->preempt.engines, compute.link) {
> +		if (!xe_engine_is_idle(e))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>  static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
>  {
>  	struct list_head *link;
> @@ -548,6 +561,11 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	if (err)
>  		goto out_unlock_outer;
>  
> +	if (xe_vm_is_idle(vm)) {
> +		vm->preempt.rebind_deactivated = true;
> +		goto out_unlock;
> +	}
> +			
>  	/* Fresh preempt fences already installed. Everyting is running. */
>  	if (!preempt_fences_waiting(vm))
>  		goto out_unlock;
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 3468ed9d0528..748dc16ebed9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -98,6 +98,23 @@ extern struct ttm_device_funcs xe_ttm_funcs;
>  
>  struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
>  
> +/**
> + * xe_vm_reactivate_rebind() - Reactivate the rebind functionality on compute
> + * vms.
> + * @vm: The vm.
> + *
> + * If the rebind functionality on a compute vm was disabled due
> + * to nothing to execute. Reactivate it and run the rebind worker.
> + * This function should be called after submitting a batch to a compute vm.
> + */
> +static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
> +{
> +	if (xe_vm_in_compute_mode(vm) && vm->preempt.rebind_deactivated) {
> +		vm->preempt.rebind_deactivated = false;
> +		queue_work(system_unbound_wq, &vm->preempt.rebind_work);
> +	}
> +}
> +
>  static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  {
>  	return !vma->bo;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 2a3b911ab358..fada7896867f 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -293,6 +293,11 @@ struct xe_vm {
>  		struct list_head engines;
>  		/** @num_engines: number user engines attached to this VM */
>  		int num_engines;
> +		/**
> +		 * @rebind_deactivated: Whether rebind has been temporarily deactivated
> +		 * due to no work available. Protected by the vm resv.
> +		 */
> +		bool rebind_deactivated;
>  		/**
>  		 * @rebind_work: worker to rebind invalidated userptrs / evicted
>  		 * BOs
> -- 
> 2.39.2
> 
