Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2F1C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 18:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFE01126E9;
	Fri, 22 Mar 2024 18:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cd0whC3C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F09A1126E9
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 18:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711132322; x=1742668322;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ok9mAdq4V9kmCUgXU44iHwced/EJWIKt4t5UZOXoLto=;
 b=cd0whC3CHYgI0mgk8/A/FIeit6LzjJvOwSnlfOukjFb5qTrlh7Zbfb8x
 TZEjX9GlYtOtQuPR0aIYZ2WDnA165YxepSU6OOOGBMFwyC00UIOQBBfGi
 0etj/xM064TDS2QgIBx4nKTxLG6hvXAsqTiXPGorIBtF9oXk34VKW8Hmy
 ry4nvcKRG4BeYGWvBZEjXWcmmcCiT0OkNUSZoZmYIJM9Kb/wQ7hdrSoS8
 AhPrTG0xINnTSZKuem//pJ4p9BMI6wBAxSpbf3y7+pb/hDHxzt/3Wz7D4
 4SSwPhy4i15KrAC1fTb5Dm2x1M/P8Lxpy4sH8hH1RQ20HCswLLcDgMV5L A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6026976"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6026976"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 11:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19558189"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 11:31:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 11:31:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 11:31:47 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 11:31:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgMxB5jvvpYaBK69IuytZYbm4AXe97EXceeJ1er5WJLM7rKaBfK0es1JDcf+4LsGCGTyxhrpC+iUJroTpizNcUHzDRklLx7nWz78BXFcqRoI5Lsds/rdD1pc1r5rCqiXTdNWsULlIxD6R2ERPxa7Qduj+3FuwVU4Z39otrNJmZhBdVc/bfyvogKA+W+vCE/CoAoIGa/jSsp7SrUgXE0TsRYCJvNmV35fZUs5fKAxoezw1SdTbTpF2gQ37V/nIKV5d0E01fvWJN+PF0WSYWWiHFsfPvV/dfaP9drzir/+P5e3xPjjK+jLUET4ajpvu6ROagEAOqgChpR/oAPJCcyW8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8ZkTo8Xx3GeyoeStaWw+il0Cst4mB7dbJqDFEei7/E=;
 b=HjeLss18ztkpIi2FiOzercpCG/AGpC1/vGkEWdv5tZgklaVCk2LOJd3RqXDKBW57fWMJ4NJFPv7YnMUSmHw0n3PbYfspo9MYTddIdLQ+3br41T0GY0Isv26oNoqkcjoYnR+MUCIbByYgPDe4OwDB3aO0mEy1ol/LcUdSJ6ESpSkWe5DU3xboBTJ27seSoQvYHdry+nswb+W57S5KFoheSxpBAbmCHj3Ew/Jxec+/Pl+vttmqVirNple3miy7FBqHqUPXaLMEfwJmTEE7O3ZWe+D4WMv3HZXdwrnHTEFH2p35NvOO9eLIRNN7esKWhsnH1dL0iDI2DaZqS8FAYja1og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8403.namprd11.prod.outlook.com (2603:10b6:a03:53c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 18:31:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 18:31:44 +0000
Date: Fri, 22 Mar 2024 18:30:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/7] drm/xe: Move vma rebinding to the drm_exec
 locking loop
Message-ID: <Zf3OXvxc/UFKSje7@DUT025-TGLU.fm.intel.com>
References: <20240322090213.6091-1-thomas.hellstrom@linux.intel.com>
 <20240322090213.6091-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240322090213.6091-6-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0204.namprd05.prod.outlook.com
 (2603:10b6:a03:330::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 814c4297-74c8-4619-dda0-08dc4a9e5397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S7U9lAB67jXXEey5XeBIxvLODsG477SauL5FA9jwzwxH2qEGpgASo/2/PBgkMbU9p5uBA3InZGAmUbwEWzEBfQMbOD8U3U3S61/arSZ2k6Ll5tHJQ7etP9pKKyKpCnV6fF7yKFK/0bUHDmbDqV0cCQA/yg6AFl05jiflSL9fDnwLhzAVhRGxXpkhyhKF0AYmxlNNsADwplZNd31keRH8nL5Jzzs7/YktaGzxyra237TOo7MdPBTMzWANoIws2ieyBMbrLLf/63QcVEPqPXfk7AYkjfUdlHN5kSLh6fwbW4SFkWeOwEf6TAUTOwkhZ7BpkfKSGSt0INx0BtgTlvljSxL/bEl/eZRnhsSpWhU11kO2tyv92gt8ZKcCDeHsJw/GLHsyQP5i/HGU3w3jyRmb22k7CtK6gHLHGS7m36ER3uVqQxtan7BUAHB4QOIQs/mMgE+wa0hjBVt89VeQ+T81ULIR44fVfvgQzyRcRpI92EYsnev67gW6HvdrKt0IGJAvpWxJlSZgwgLfWthgQLcHqAJPCZN3lrkJma66oGGW44tpGZCg5CbEsBYln1QFmk6Cmu3mjrntYPayb9x5yVFnjTA+R86DC3N4s5WqS6FVDLicvb1VOBLyl8hcMTGgjETuIxLcqH1Zneg+t9H4AgMLDG3yleGVWyKUjYR+1fQcF4Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0S0MGCblbn25wF11IjS+W1sdWY5s2FAGJtUca72cTxpsI5tUpJxsFGVdTs?=
 =?iso-8859-1?Q?Je1jgZOOm4GZlIc4/Y55fkHZGtuqZeCK4tA6VHVKH/CvX023gHxwXBFjbD?=
 =?iso-8859-1?Q?9jCbPV3F1rCRfg1AD0OgXRBw6+gGylp1B7aDjHAZvj+EFFTswddgecDfmx?=
 =?iso-8859-1?Q?v/ZL4oEN+sZg6BcPiCN8AhMb+YjmPlk2+hMtB2rV79ZyUkBWWZE6ukE4gd?=
 =?iso-8859-1?Q?mmdDsngOJdvH3n2OI6wIDMY0XNTXMhrpdY6aOUD/zqVYotnZcsrGJ0uhOv?=
 =?iso-8859-1?Q?JwwrgLro59pHIrVvGb9FIhqnIvqM7Z0Qd38iOzd9xXUnJEEig2GuON4QFw?=
 =?iso-8859-1?Q?79h3IlFPxMwtIyexFNoUBApHXi7d90iZeSnJcBQ60MBt+HBN2xoNS7zmjM?=
 =?iso-8859-1?Q?MLHwV7FgI4BLfOF/cvv9jh85/XCAYQBeTKGvCnisXIyox0yDUB8bOLmpaL?=
 =?iso-8859-1?Q?W+FfG06fzxQSQhmlH8PoXtqSF4yb3AJxqU95of+fyj/b/emwtqNB6Vjc9n?=
 =?iso-8859-1?Q?KXoQ5G6m9/12dacwc5N6ZddFtx4tk5cO9giQQDPfdZCPM03Xp75AYbK4hu?=
 =?iso-8859-1?Q?XXIMCjETHCIcyzu7XmOghl1sYXjy3Am1r65YgXglON9E/BvUIn8RhQH8aY?=
 =?iso-8859-1?Q?vOarvkFE+DuYfCIjfnX0//qPhZd/sJcCRmFbPl1qkfpaYgEx8n5rICD1rj?=
 =?iso-8859-1?Q?D5+y6636CO8z7mZgxOSmmzvIZOabu3R2AyDIvSaCGLqAThHYrQPZmdBHrn?=
 =?iso-8859-1?Q?2b4Fxnz/dCl9JEY+SedlAEIrqLsNYoSzvq2zUYPp/NpdKZoKDJ3/zrKcZk?=
 =?iso-8859-1?Q?U3SLPN3Lm8bWFXrSFnQSIcHB9xm8Q7DfiLRieH5XTOAoKrA7JVX4K1mexw?=
 =?iso-8859-1?Q?UuZ+KsQJJorfDkw2caofbRYIt7GbS4SR3YdVS5kI9wq41J70ogiutmIWRn?=
 =?iso-8859-1?Q?1ozxeBXfqmA6dkMBtVDKKkv0zHCv35gkNM6pekBx9ShvE9v+H5JpwX1Wy2?=
 =?iso-8859-1?Q?9FddfMwRvA1rDI/wkkAnS8Fv8CW3ho66oCD9uS+9LTNvKxCcTbqjSjisT1?=
 =?iso-8859-1?Q?fze7MPJzrEE2dtWPS8uUOtYbOjfCcxRW7pMs9C9YT3yD8OlTZqOvcRr8qq?=
 =?iso-8859-1?Q?V+7wseVMviWeAXsDxUm2wUI37rTwqS9uQkKU161Ee5iq6LGMQlSO5cT4IA?=
 =?iso-8859-1?Q?8wSBNBjWU1dPqxaUhx6BusPjj6zPlctOfJVusoJZICqCNhUfpk4LC9eFJq?=
 =?iso-8859-1?Q?u+00yjkvnlMLSWJFDDehGba9PRQIgz8faV+K2ZWvGppvWdypI9CG+r8xgv?=
 =?iso-8859-1?Q?BZ2cUlT6bTRJ3kVF9yxa6YExsrGDZdcFAPaVYbIO9NQsNDaWU79sNhENOx?=
 =?iso-8859-1?Q?FVbV1TbujsCyEFTvGar+VZoskMUECwFrAyESy5AKCtkjqLzZN2g2Ub5/lP?=
 =?iso-8859-1?Q?UA8FzJNYmAx/cjzmSEvTr9WPMEgvm0hW6WjhC+5sFSHqaxL/7bq2dNZkIK?=
 =?iso-8859-1?Q?NO1MhbnwMGYgbgc1hROnCwaoCyZ47+PRyiW32Mvp5KP9JAbZQXkMiDjOBN?=
 =?iso-8859-1?Q?AqORVnAZDqVtBbFLN8tKOS+ej8bAf0/g4xI6WMdqS9Bf05/RZN3xK1YblA?=
 =?iso-8859-1?Q?pIk45kW1DC3SOp0t7ZAxf0lTQX1Zv5MrXacQ/9e2Nwp8voWh+5U+J5qg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 814c4297-74c8-4619-dda0-08dc4a9e5397
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 18:31:44.8641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgqY11Xw3edW3Pfk8st0euPt473kbyHHkVOKN8k/6JVEPDrA9VN8Oza7zuXvqnV1jFdUUV1Qpy4/P9u5W3Ju5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8403
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

On Fri, Mar 22, 2024 at 10:02:11AM +0100, Thomas Hellström wrote:
> Rebinding might allocate page-table bos, causing evictions.
> To support blocking locking during these evictions,
> perform the rebinding in the drm_exec locking loop.
> 
> v2:
> - Remove a leftover call to xe_vm_rebind() (Matt Brost)
> - Add a helper function xe_vm_validate_rebind() (Matt Brost)
> 
> Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c | 24 ++--------------
>  drivers/gpu/drm/xe/xe_vm.c   | 55 +++++++++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_vm.h   |  3 ++
>  3 files changed, 47 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 397a49b731f1..f442ef495235 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -96,21 +96,9 @@
>  
>  static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
>  {
> -	struct drm_gem_object *obj;
> -	unsigned long index;
> -	int ret;
> -
> -	ret = drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
> -	if (ret)
> -		return ret;
> -
> -	drm_exec_for_each_locked_object(&vm_exec->exec, index, obj) {
> -		ret = dma_resv_reserve_fences(obj->resv, 1);
> -		if (ret)
> -			return ret;
> -	}
> +	struct xe_vm *vm = container_of(vm_exec->vm, struct xe_vm, gpuvm);
>  
> -	return 0;

Same comment as previous patch, maybe reorder these two / squash if you
think that is required + have a comment here.

> +	return xe_vm_validate_rebind(vm, &vm_exec->exec, 1);
>  }
>  
>  int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> @@ -264,14 +252,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		goto err_exec;
>  	}
>  
> -	/*
> -	 * Rebind any invalidated userptr or evicted BOs in the VM, non-compute
> -	 * VM mode only.
> -	 */
> -	err = xe_vm_rebind(vm, false);
> -	if (err)
> -		goto err_put_job;
> -
>  	/* Wait behind rebinds */
>  	if (!xe_vm_in_lr_mode(vm)) {
>  		err = drm_sched_job_add_resv_dependencies(&job->drm,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6aefd6602310..b1d0df178a2d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -482,11 +482,50 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
>  	return 0;
>  }
>  
> -static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
> -				 bool *done)
> +/**
> + * xe_vm_validate_rebind() - Validate buffer objects and rebind vmas
> + * @vm: The vm for which we are rebinding.
> + * @exec: The struct drm_exec with the locked GEM objects.
> + * @num_fences: The number of fences to reserve for the operation, not
> + * including rebinds and validations.
> + *
> + * Validates all evicted gem objects and rebinds their vmas. Note that
> + * rebindings may cause evictions and hence the validation-rebind
> + * sequence is rerun until there are no more objects to validate.
> + *
> + * Return: 0 on success, negative error code on error. In particular,
> + * may return -EINTR or -ERESTARTSYS if interrupted, and -EDEADLK if
> + * the drm_exec transaction needs to be restarted.
> + */
> +int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
> +			  unsigned int num_fences)
>  {
>  	struct drm_gem_object *obj;
>  	unsigned long index;
> +	int ret;
> +
> +	do {
> +		ret = drm_gpuvm_validate(&vm->gpuvm, exec);
> +		if (ret)
> +			return ret;
> +
> +		ret = xe_vm_rebind(vm, false);
> +		if (ret)
> +			return ret;
> +	} while (!list_empty(&vm->gpuvm.evict.list));
> +
> +	drm_exec_for_each_locked_object(exec, index, obj) {
> +		ret = dma_resv_reserve_fences(obj->resv, num_fences);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
> +				 bool *done)
> +{
>  	int err;
>  
>  	err = drm_gpuvm_prepare_vm(&vm->gpuvm, exec, 0);
> @@ -512,17 +551,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>  	if (err)
>  		return err;
>  
> -	err = drm_gpuvm_validate(&vm->gpuvm, exec);
> -	if (err)
> -		return err;
> -
> -	drm_exec_for_each_locked_object(exec, index, obj) {
> -		err = dma_resv_reserve_fences(obj->resv, vm->preempt.num_exec_queues);
> -		if (err)
> -			return err;
> -	}
> -
> -	return 0;

Same goes here wrt a comment, it wouldn't hurt to have one.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +	return xe_vm_validate_rebind(vm, exec, vm->preempt.num_exec_queues);
>  }
>  
>  static void preempt_rebind_work_func(struct work_struct *w)
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 20009d8b4702..306cd0934a19 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -244,6 +244,9 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
>  
>  int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
>  
> +int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
> +			  unsigned int num_fences);
> +
>  /**
>   * xe_vm_resv() - Return's the vm's reservation object
>   * @vm: The vm
> -- 
> 2.44.0
> 
