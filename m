Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8222CC54798
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 04:42:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E09110F820;
	Thu,  7 Mar 2024 04:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfCbc/ZI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2057310F820
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 04:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709786540; x=1741322540;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GqHpwhqstVJTXiOxSpayCWayabsW8mjbh32Nj1kKH/o=;
 b=XfCbc/ZIDyle/sX9r4+6MZGfVty0JHfb58IGJkiMoJ4fUJ8O1QbJsula
 kcJF68Ctkh/kVnMYqxnUTbEpcqvs/dN2ntLaoj+6ay/svZm30Pb7KuBiX
 rZsOvPIYChLYGw/+rcgVD3j5c6rnOH0v8rmwh3f+fq3mnL8M1HHeyDxrM
 NRU7jNmHDgSM73cMmKOXpghqCHdJpxZnR6rvKpXjvzMVpTCvxgEd3PQ0B
 wx/gWpqjqGuq3/V6eUkSzZvchPm3d8JrQi1LKzDSSw7xbifmF0MbMEY5t
 Qy51ib0kS+E8qKgE1jybsFIpZXlgFdETtR2qYZroJV7d4pjMO7oq3OZhs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15013340"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="15013340"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 20:42:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="10154289"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 20:42:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 20:42:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 20:42:18 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 20:42:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bObZKSLrXpQfDYrI7UYF/VjLk/te0c7LrtFe40kmkgbMbSxINuHCqN4w5KxHNcB7p4nid7h+wjEQfBJ40acnMlF7KRriv9dkKKYUA2WvGwdoFGB4JNr6zWmdFEfjpDSyKH910LAHbkFvcx1JyBp2TTSa/rKeyHRD0VF1batc4vcxpr3qwXU0x8QkCE37ea+jI7FobmBky4VXd+sB3Vc2KEZQM8a5gBLunFFB88H8HdqS8RbYh0de1EqdxeDavVxEjvIfdcYp5mZyvula6ZrqlsWlyqa887ZpyXGxZoSLkRjA4ASNUOPkW1264YniKlOsP4yUNJaU9CJNw6g97mRzKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJmHVSDM8CYzmMvl2jkaODFv6Z1+qmVLp3IsExxwrsQ=;
 b=lRZkhZHEcaz33VgaRzPL6k7+zfHbFFob4S6eN1exrvsoh1AfDWxvv3d8odlEvClcMbY2aRycZZNlNm1fHkbAhdRPHuVi2nNVhltv2kwbjwaR6toZRfRHYWLBViXSNanhgY9CdGexGmIsr1A/b9wnsTB0UcMGV6nMFYhOM/1ZJGto/ZmPl9seawOMv2TfdGl2ds5zbthHgsgxA/zPCJhNz2rDY0AlVO+I/bnq2ZZUnorOI+1XQmMFwbW169KL9qCzByU+QoHvbtzbW6m4G3WFlyAeIU1L/6ndS/RzU45CRAjcrPRJydszsIJ4BXPGxw5XE/UVr7uJ0vYmfhpniH8yIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7462.namprd11.prod.outlook.com (2603:10b6:806:31d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.6; Thu, 7 Mar
 2024 04:42:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 04:42:16 +0000
Date: Thu, 7 Mar 2024 04:41:08 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 2/2] drm/xe: Move vma rebinding to the drm_exec locking loop
Message-ID: <ZelFZErU5GB0uN6Z@DUT025-TGLU.fm.intel.com>
References: <20240306100133.4962-1-thomas.hellstrom@linux.intel.com>
 <20240306100133.4962-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240306100133.4962-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:74::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: db96c67d-c10a-4792-f208-08dc3e60f6cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 81G3YLct4rLwB/QlsZhs9UmFcranGIVqE+TSuaeRO9aSgvBa7nGmx4QKusF3tOZZ/cXJcB7UVadlctPTGeNFYQk634gtAHglfWS4zhPIbaX5YITn/L6ggthb/c+m9CKjpMCl49m2Q7YV7qCHywxqzKtnhK5Bj4pR2zDOnRVdFyZ10WJKBUmNX6bx7QtCoFo7wOVLvx/j9dDzLHvdTBZrFM7P/UzvaArcunyDDLtB2b64MModll4ITSnRtJbOVmtyYUOtlgwT1oGsIxEetUFV8oGRyInUssnkOhIWpmziv21C121kMy9iOXlSpIr8RgWIjkz7Wnp8MHFQHw/7AAgZFGyZsi1ZeJZ0xcovB6FPlO1RaeQ110brEK6SbuPtZ+HLs+ltgLcIyWJHrpD2GyVQ5FIIQyVqpS/hVNeNCLwJxsNE9W4wM+/CS0RdsTTxrpzFMm4K/FZzkMDRUy+WaWMozdrRxDn5ZED+QL9RvV/iR2fTr9mdKc3YXaZH6jZNdJzshuj/N0wt3JyOYNPWefNXS0ds/Z14HFLK8Eoo7/uQHMQLDMo2Sb5leUTAji9mNisYjqigLTUmdce0BtuhM8ILpdzdXjp1Xic/3oWSlVHv6+VUGrlCmC1fQ5ZBYRbUBsqJEKmn+CYI1Da5dYHBK6gKCkV7cbqpmpyr+Yqh92bIZ0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wpXlJ0qvG/z9yxuvscvRT7ZuuSSAe18NSrhoqTWVVC2Bv85gjnU1l0brYV?=
 =?iso-8859-1?Q?Ggrw+0L8/WzJyiyxpN9MNp9UPEkrxdbdnDnTwAIcffPj0LnJl73DEky42+?=
 =?iso-8859-1?Q?mIC8GBZviLsVjAIAXjwxXZ4YkBo/re4JHJ4ZIp79I/n0KYglz+ojE18dbR?=
 =?iso-8859-1?Q?vyRmWnB6KmMwaaMNjjB27hW7N0LiICUPqWai5aEXlyh2CZryGLe93calpd?=
 =?iso-8859-1?Q?/7O2yRBeCjtUlHiO3eRGK54bu4Zeijz1MAMMaRUnSNXQLpcW4S4qdN/TIk?=
 =?iso-8859-1?Q?GfcyvSrR80Xjjife9h/S7YwYnezfBR+3SwmOlFhBQAntc9peothwEl/CDD?=
 =?iso-8859-1?Q?2zoHhHUd9W8h85Q0AwWpi5tttkWKV0wZX9rzyg2oZCBb4ldbMoxF94CdTL?=
 =?iso-8859-1?Q?EHf35ClHcarIGv5/mwYV9Db98O2BVow4bnwT0Ox2gNSaRwkuXgbFtd38Pv?=
 =?iso-8859-1?Q?lIZCawlLqFpg4AOD2oJ5apzWlWpcMUY4bET1Uj4zD+QTHmyaCgDESfyCuz?=
 =?iso-8859-1?Q?QKZpiTirTrYyWD13YLMManoPfxpxtag7zq04SANPjYw/EF+BjrZlVLFXtQ?=
 =?iso-8859-1?Q?LMkz3YnUhlW8FlkZ4dyZ57iDOBvmMBX+k+1obRaJUP7D+qT3LSryLn5K4t?=
 =?iso-8859-1?Q?o6bJytIsQsJi6b2I2WZytVENKzc+XP5TL9pE8MTAgmDkcJJ70crKfRMZtH?=
 =?iso-8859-1?Q?3tNZ+rWNRmpwqs9+dBlyzDBJ4WNvJm2pxjQoE/hKoDG6grJrdBgna7L+SX?=
 =?iso-8859-1?Q?qIlIdD5tIv5bIBjFnlWFBGEJvEWC9aqse7e4jl7EtS/J/Tpq2ZgQwHvc4V?=
 =?iso-8859-1?Q?aWMVcYnN8+b3GukotvwLDzijYug5f4AxGrXj7jdLLtRDTiXoBMksn3+MJ8?=
 =?iso-8859-1?Q?1FwnqESLB2vmaJTEPROn9q7X6uJUYjDaOB/8ZlsR8/CNHavKTbxaE016A8?=
 =?iso-8859-1?Q?Opax4zxfJivAwtBI2i97la+D8QWXH1k16SMO1qz1BtcWXhiB45dca17mAE?=
 =?iso-8859-1?Q?co0ZujWtw86nFk4a3yc4AwP9ICAu56/Kt/VRNmumrS9E5laddSfCcTP/kT?=
 =?iso-8859-1?Q?Kns1WACd/eqq/iXJwYj4Wq6l2BPUaRmYJzEUQdls7Dtu2kmqncd+kK+wMS?=
 =?iso-8859-1?Q?OZVInzr4y4hJdNJvm1EIDFga8nzyqkUGWii8kYAIaNIBf0hFMR1Dhwxj8J?=
 =?iso-8859-1?Q?z0PRs9dqPK4A0ZxrkDP1bUvQewa6u7XAEzZ+5hych7+er/06em9QmbXxHU?=
 =?iso-8859-1?Q?yreJrosTDJOebgqQMMCZNVqKPHbFkXVLb5PO6Er6T1DaCsQk/49fLIfyd2?=
 =?iso-8859-1?Q?62DGSuBpPBJN1CIEe10Ei4UWhXdDWPUrx4Ip/ZT7zCwqrrbKK0Mxz1L9s/?=
 =?iso-8859-1?Q?iVvCtkku1i9BfsGIJCDcf1dIEO3VMhkmItbSfrqRUj2XJvmM/cjag5P4KP?=
 =?iso-8859-1?Q?F/GWRFnJNzodnrVYXQdtQaZ8vVcwBmuKJljj9JmWOypVnhlkdlO14753uq?=
 =?iso-8859-1?Q?slHqWNJ2Mp0+pHZRrcdZRY1QLjTUq/52vpUEhMGT6AchnAOzfezjN6P0x+?=
 =?iso-8859-1?Q?pGa/A15+xPNctuiIRyJLtOy7Qwmw4GHGQ4RmFlQWwxJqT8tZrbygGX10V9?=
 =?iso-8859-1?Q?4o2jGsN66Ake7v+Qv5NOP7dRtm1WhkQKmhg77Pnj4mJfunOzqu1rNj4Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db96c67d-c10a-4792-f208-08dc3e60f6cd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 04:42:15.9401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9jdhBypfzhWW3TYxEbOuT7qMqdHRMm3p1y5tvux4JaQF6BW10UlUu3yXmlr0aMA+7vkz8c9X6Ya3JsTWtJi/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7462
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

On Wed, Mar 06, 2024 at 11:01:33AM +0100, Thomas Hellström wrote:
> Rebinding might allocate page-table bos, causing evictions.
> To support blocking locking during these evictions,
> perform the rebinding in the drm_exec locking loop.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c |  4 ++++
>  drivers/gpu/drm/xe/xe_vm.c   | 12 +++++++-----
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 5124663a9694..b683ce415ef1 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -106,6 +106,10 @@ static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
>  	if (ret)
>  		return ret;
>  
> +	ret = xe_vm_rebind(vm, false);
> +	if (ret)
> +		return ret;
> +

Know this is a CI series but noticed that you missed deleting
xe_vm_rebind xe_exec_ioctl below.

Also this patch otherwise looks correct as I agree xe_vm_rebind needs to
be within the drm_exec loop.

Matt

>  	/*
>  	 * 1 fence slot for the final submit, and 1 more for every per-tile for
>  	 * GPU bind and 1 extra for CPU bind. Note that there are potentially
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 427b2063d876..732132bba537 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -515,7 +515,13 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>  	if (err)
>  		return err;
>  
> -	return drm_gpuvm_validate(&vm->gpuvm, exec);
> +	err = drm_gpuvm_validate(&vm->gpuvm, exec);
> +	if (err)
> +		return err;
> +
> +	err = xe_vm_rebind(vm, true);
> +
> +	return err;
>  }
>  
>  static void preempt_rebind_work_func(struct work_struct *w)
> @@ -567,10 +573,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
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
