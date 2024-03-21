Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123EAC54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 19:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79A111206B;
	Thu, 21 Mar 2024 19:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mn+nWTD5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7984611206B
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 19:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711048929; x=1742584929;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=khGkGiOZkOSYjzZkQso1bbjQEyA7UcOr2DBjWnPCJ/4=;
 b=Mn+nWTD5EJDiB668mBt6ik/Yk/vo0Ts/0yc7I+z4axAGI3hct4fvQZo7
 c5Fynrw148riyFBMIRIHuXSjnrbIpe1IakEp4DT27+/1tsjWeVWmMUbF1
 phw8+qw6krHytNDBV4B2k/S2wzdDuVN9iN6O8XK8OHTR+nMl6TmWXJn32
 L9dt4ste6ezgufyau0Dfg3MmaK0CH4Llj9F8ZFu5oeJLAETFxhWhWdfCo
 0586DD4RnyXybkbH3w2xvsRkf3lGv6gS5F1Sk61YXHwYZVKPBMAV1ymmi
 Ls5P2f70HndszNLsC/zy6yLeNbgkpk/5Lv/4OXt0JbBdM016bQhNpT0Ps g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6191405"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="6191405"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 12:22:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14533343"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 12:22:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 12:22:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 12:22:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 12:21:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpS/5iUiKISR70GR5Ka94UpWZuRiEp17ycAa1NsshGK82dnRSKfrQWMt3Q/H10TSTSqrV0iux9LGvGE+Szr0+xHwMCKWu2hWD/n5kdc84SxHMcCdjGk8a+CtS/vo1UT9lGdnibXkaeG8R1RXHNdP+f4mM1krItZZHnc9JghK8DHtDc2s9EZpGrhExDtHkhlIF+JeewTHnQ+fMUwOzJYgDfpr/j9/A0J8y65hS7dVaqwAxl77J9t5yW/mXmuiXVWAwyoF7BE3C4HsIOAc7G9V7N6H/Yh2FN9dua+VutWgOyZJ2zM1iRt7Rdwt28Edlot0HkHW2KTrtB5PzGKsM8oGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9Xml1cViQlntPPqzMnoOibMphLLETCyNfWgMGQ36Gc=;
 b=jTxsKQRP8rpMTe2JXR7w0xtmtvJP5yPBmTNsfo1xzCVN28xc6Og8sS/pq0W0HhwPgN8l6au0PNIHyhzHv1WvEA25NZtf2WcP53cwWFsCkvdnNpUXKnpD1EBSQRHniIludAFGIwE9dGNS/miTZ+KmoKkF/ztSNfEXHNdA5m9UFQ5ILcfYLKJ3VgDx7EJ5hNLa6xAj4EUrrCEve7w5Gdb8o5u1gleG2lqkYGuWFaVvNI2jaCMnWZYiWULyEOMGld46dXs6tGM8F3PMbiPzPJCZFpCH98kYEE9nv4GBcm1ikRooDplHs+7bfSg/spM9nncfUnA09B+XiPIyghDcWxs+5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5896.namprd11.prod.outlook.com (2603:10b6:a03:42c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Thu, 21 Mar
 2024 19:21:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 19:21:55 +0000
Date: Thu, 21 Mar 2024 19:21:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 4/7] drm/xe: Move vma rebinding to the drm_exec locking loop
Message-ID: <ZfyIsim3qY/W38DY@DUT025-TGLU.fm.intel.com>
References: <20240312140447.50437-1-thomas.hellstrom@linux.intel.com>
 <20240312140447.50437-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240312140447.50437-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: 878e5f81-0937-404e-23cc-08dc49dc2bd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P8WMxDlQpXscy4W7kT3qfGFCFFcPiGWDqQjaQ/skQaHoT5vyeef7CegANuvHPFxMeu9Q0EGmgGgBlUgExCv13OGdEz6dHtAcVfki0Wy2gDmMEdmLkI0Fhtfg2PGJvxU+f19GGNy4dCkbcB4M+MfbsZE5Nb5wxxJc9paKf92tltVSDOAVdNZXvsw+Q12C1AZNcu+HJdtKpD93/9ZGbHhbObyPiLTG1sLO+lNTyaBqwVwyNEBcCS0bA+xDBtFvQSKmXwqIq5pPwpK5AU/gmZwNpWEmj3XfzF0ZjCxHrojEo/wq7dUWAhFX2unQGigytdwq2ImRc/A36dHEC4JVGGS66n9KPcxJzJ3i4kOXbMA+76G6/TmORtoiRD3QGZ8xyQcxqVplz1pXFrCW3MPyUoNJGtLAo5Q48em/EOZTHrySt/OlaX8YtH0ryMg7dFyaH8qamsSrpJSWzuCqmg7UC90rHu6mqovhz/DBmIxGQRIen/5hHdKNTRhGyKs4u6dzrDGYbbslbCYjyagJ53qJjHEZ2BgN6e0gmqTq170vuTfjn8+Qnr2eX1YMkCeoYUwshR1REcmiH702gNJV1PSdO4dj9IV4aNeOIhIEKsvg9rv+HePrOQtu9nRR+2w1FaGUZLgJiXBLHEO19z3WpFyBEyQjWa19Axh54MYYcMiwHtKRC9w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/BWoZEARcjAEUeCoWBPHrqLDcv7Fz8uD/q4CIWmA7RADu+fiJx4DH4tbeL?=
 =?iso-8859-1?Q?IjJUSb5ZnfL5wAI8pgsxmptbIHh3sjbr5KaWNarsUME6auaeS0mBnnYGCT?=
 =?iso-8859-1?Q?SPwxV0FlfztzuSsTwXRLHGlHsacHhPi0NxLgxqvzdeVelZ5BWwUV+NQh74?=
 =?iso-8859-1?Q?Hie0SxsATErUlj9oDupk2HwTOv0VZ1KXOCwVItBjmLupadzTsj3qTRZwsQ?=
 =?iso-8859-1?Q?4Won15jEqwxpK0rff6legN3msRYFprURVUyr6/Ud7pFjhhoisYYxdNFKVv?=
 =?iso-8859-1?Q?NhoxwH7WtTR/3r8JL3sPQ5BG0cPAzFJbr+uQfVbkwWGY1ZSHbNcWI/wEoZ?=
 =?iso-8859-1?Q?ULvUWxdVwfA/ufUDUHxyJmAcEHfXr2VK2MSBJke6pgAEXOiuBbwKvO8kDd?=
 =?iso-8859-1?Q?lBXvkehucpUHo4tEqp1zeutROZ5yw9i7d3A5qrGyAaw5I03/D6hfSE/NKm?=
 =?iso-8859-1?Q?Iu0EpujBX0L8ByxtSzXbafyIZGlLg19RFxWoH6JekBWotQZdqZJT9E/y1p?=
 =?iso-8859-1?Q?Fl+sjM4/GlaoL79AbxUymN7KzP0kxguW2iQByiF4UL7bF1M/k6QGILeSYw?=
 =?iso-8859-1?Q?D+ctCZFvEIDoK7tWof4S0bLjZtENc+MX8MlgcbNgmdSI5FabffMYEt/0hV?=
 =?iso-8859-1?Q?MHaw4c8MHAqq1ibajvVnawkQsWsWFBZ3miqxeY/Dg8VTtr6qbvmGYFNGUC?=
 =?iso-8859-1?Q?C0E+4wN2DgC01v+qqFDeqApn1WZpYYIt520o/CmBACFzHer7CukgvlqY2E?=
 =?iso-8859-1?Q?KHU3fWGxQQfdx1KICljIm7buVdsHtJ0H3aRyFOUF+qVvbi9lUvQ/BPjufn?=
 =?iso-8859-1?Q?ZAIT5H/05msbFN4CYnl2VsqoKroOQmcAVPBp9ay6+/lU/RHWzwYbcZMxTp?=
 =?iso-8859-1?Q?FnNrvvSE45+DWyh7JcBXecjDcXWzLLxq0iKOnmzo3vSO6NhAJgMQVsDfJI?=
 =?iso-8859-1?Q?9pvdqS10J6WaOZneV6NnhxkrOLlgZwS/unMsizqKhwyigmhRc4SN4bee33?=
 =?iso-8859-1?Q?Du8FeX+/2G8iQI0OCG55AXfYlijE0JLupAqJ/aNqpGAD4pnTqTpd7T3n6a?=
 =?iso-8859-1?Q?TnsR5oM1JEHraf1bNFABBMsnNgSTssPVSAk0wbAYkxB3y3tMJBw9yn6ali?=
 =?iso-8859-1?Q?BYe6/v3bmVDiLtRwXYeenDEaogqs6HuPKzyXf79x8vtl9ZJqPwFiB9FcyT?=
 =?iso-8859-1?Q?ZcNIwF6sbifhrkQn7WoNg9y5MK96Op+rUvcgF0ih+FJd7YOIj+W7fft0Bf?=
 =?iso-8859-1?Q?0KhIhrPiKodpMhHhY6qwRrCSP0TOJtN0Hfv50Ado0zR0Vq6RQ08tWnNtTg?=
 =?iso-8859-1?Q?GZZunmjZGBEu1vVaHdANvzZJ4Q7TgRQdNiaPEukW6bOHXKQFLr4QfIJSvF?=
 =?iso-8859-1?Q?Y1Ex22yzFqBgfaqs7U9AhdCKn8rD5w+Y7Nuy9UwNH8tzSanhy5JbO6t3T2?=
 =?iso-8859-1?Q?ZF0/uIF3TGY7PJU8z/ILfq+4CflbE0lnmveTRR296h9ZCUKigKP/Y+JEKZ?=
 =?iso-8859-1?Q?khCLoPs07L7tw7Vj1zznwxmkgbuyyyXkbwkp0/W98zI8umCqe6u8XvX8Dt?=
 =?iso-8859-1?Q?oFpgYHEbTbHEtDsJUKFfd9hMJFb4615LL+z859PUOQkUpSgnd+UnQ4D3xH?=
 =?iso-8859-1?Q?FrHvxiwzfU31Qz+ADHyNvQUZca2eadSzwPSc2R7mOMvRpwQzJPwi7auQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 878e5f81-0937-404e-23cc-08dc49dc2bd5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 19:21:55.8185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htDJ7O3e2GFSok/bAeCqAsEvWggaS143+2jplJabf+sn6WCG/lnK9AQMoWBQX1sEs5nT8jFsonzEW0GZYWPMow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5896
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

On Tue, Mar 12, 2024 at 03:04:44PM +0100, Thomas Hellström wrote:
> Rebinding might allocate page-table bos, causing evictions.
> To support blocking locking during these evictions,
> perform the rebinding in the drm_exec locking loop.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c | 13 ++++++++++---
>  drivers/gpu/drm/xe/xe_vm.c   | 16 +++++++++-------
>  2 files changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 13d1fba2c9d7..f36fb22a7861 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -96,13 +96,20 @@
>  
>  static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
>  {
> +	struct xe_vm *vm = container_of(vm_exec->vm, struct xe_vm, gpuvm);
>  	struct drm_gem_object *obj;
>  	unsigned long index;
>  	int ret;
>  
> -	ret = drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
> -	if (ret)
> -		return ret;
> +	do {
> +		ret = drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
> +		if (ret)
> +			return ret;
> +
> +		ret = xe_vm_rebind(vm, false);
> +		if (ret)
> +			return ret;
> +	} while (!list_empty(&vm->gpuvm.evict.list));
>  

You need to delete xe_vm_rebind from xe_exec_ioctl too.

>  	drm_exec_for_each_locked_object(&vm_exec->exec, index, obj) {
>  		ret = dma_resv_reserve_fences(obj->resv, 1);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index faad7f52b3ca..fad5b1ae7f2d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -513,9 +513,15 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>  	if (err)
>  		return err;
>  
> -	err = drm_gpuvm_validate(&vm->gpuvm, exec);
> -	if (err)
> -		return err;
> +	do {
> +		err = drm_gpuvm_validate(&vm->gpuvm, exec);
> +		if (err)
> +			return err;
> +
> +		err = xe_vm_rebind(vm, true);
> +		if (err)
> +			return err;
> +	} while (!list_empty(&vm->gpuvm.evict.list));

Same code pattern twice here? Opportunity for a helper?

Matt

>  
>  	drm_exec_for_each_locked_object(exec, index, obj) {
>  		err = dma_resv_reserve_fences(obj->resv, vm->preempt.num_exec_queues);
> @@ -575,10 +581,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	if (err)
>  		goto out_unlock;
>  
> -	err = xe_vm_rebind(vm, true);
> -	if (err)
> -		goto out_unlock;
> -
>  	if (vm->rebind_fence) {
>  		dma_fence_wait(vm->rebind_fence, false);
>  		dma_fence_put(vm->rebind_fence);
> -- 
> 2.44.0
> 
