Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC867C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 07:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C575112C64;
	Fri,  8 Mar 2024 07:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NCB1FTRw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DE511287D
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 07:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709881583; x=1741417583;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NzS+OShkJ2+Vd362YNycA0ge2MC/uX0zNShn1S3X0gg=;
 b=NCB1FTRwOxC4gAM5ppDebQPypPgEUq1zYvIXJYu+hRlas2TvDFenGqSq
 ynJPrUqr7ePeGN3+u+Yo0656xmPssiPLYZmi+7g7MpQ4LVONEAhEpUNql
 CDxX7KugWHqcB3S0W9C5FPXMh/kJVjfYjusBgUgm7tI6HkrJB0GFB+veV
 NSicDTNRafVSdqhTidxtbLmXSktwLYLCNtPjFVhk0ZnQdr7Zfs2S30gq4
 gp9yaIl7V1df6kNYoJa1qUbo7rOhWAHH0l6GX6WCY2JhAHkeQwCYBA/43
 bbmrZBHfub7XGUt2p2CjRxfQ8vuYEyO8Pn560LkaVva2z2CNsFpVfrZZH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="5187380"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="5187380"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 23:06:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10816246"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 23:06:19 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 23:06:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 23:06:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 23:06:19 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 23:06:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b23kFUyf+B58gHY+Yg8SERWmdvwcIZ++wiXxIZ/p/PCdlhThEQY3LDOP4s2CWGCL9Hkh6ZC5qrpQXdXyIkhbmXWy0ltzh/to6Lat2bFc+XnVY63ADAmaPWtT4syybW/DOJ4p0bXMoAmh23i25mZ1n/fT14AcMx41W3k6nrUfWhPTsueaq36RdLkPjOlIWJKCdUvizYZIplNDnYf3DXIdeEfYG0uIMIg6U6hCWuwzoJNDhk0hX9L+bvSjMaYpnvtTWQfWYUjOGYxrro79vOutNbWb3tqBqTcAYZWtH9aSQjmr6GZhjD2hODbALyigZz5FrwtHqCSOa5WQaNBRFpJpEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJ55cSYvyYa11hRJqC38eg86cRemwEjcQhpWfKbxn60=;
 b=BgppokJTWOtsmxRrlMMvGFRPXITYu0vuB4QnxFgFKz/vYh5ksm3RKHlJeD8uDc7jjL/l4HQMJN+onOetUJe+81dQpv+JhVPE3JqcBFDnraRECJ4OAUAlYH/mGIbEoV4BratxHCcTDNIMBXdvfVPTG/+rGS2wDGDiek81kNvqTXhgnjCgFqiK/6da+e3gGaQeSvhQ+YfWTlZ2iThxNfoMfOCbEzJ03WQaR8OvHRZgEzRrisA2bWI3cj5on5tI+5V76F+QsczzZ+OcHaopbUCNldIrTOh8djAu7fnurEr4yrbNUVRZGcgF8hWDLLE903pQWTgSO46VrMhADKnHY3tarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6438.namprd11.prod.outlook.com (2603:10b6:930:35::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Fri, 8 Mar
 2024 07:06:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.009; Fri, 8 Mar 2024
 07:06:11 +0000
Date: Fri, 8 Mar 2024 07:05:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 3/3] drm/xe: Move vma rebinding to the drm_exec locking loop
Message-ID: <Zeq40P50drXwrQjy@DUT025-TGLU.fm.intel.com>
References: <20240307164119.14838-1-thomas.hellstrom@linux.intel.com>
 <20240307164119.14838-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240307164119.14838-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9e25bf-090a-4c40-62b5-08dc3f3e3c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bU2Gb+TEufg4dc1axOosbHdfzJ0ICTVyByowFccz24ZXxnzbsj8ddtJCLtBOzCP8N/HFIN6813YaHS8X+tvusQQ7o6xXY7iPbIGnJuPQbA1VSnGQn6m1bvu+aqfgWAqqKKBEwl8MTzgG9is0UOmJVGJsV4exgBoXUE7i8iVQyGHVCAk+zmGNAwSO6XUafi9ypRL6BpYiWy/0lBYcab3w79DylDIhFoC+w5a1iiUriaIQsHNHuhiZK40YXDAPD98j95dS9iaFwsrPcWoDbTZVPzxAFy+NPiA5MbkZiJGL4625100RpT3LUSVWV5i3E5eYhMsjyt8wG2fdbf3JYlnnem7vS2gFzlbMxU8G79FBe8j3dQyXshP3CCeMTJ4mEsIsfLGMchP1CTBS8ohoModvCpyqHryM5+3mSU3z2DM7l8fVvz4C2yymp2yW5g56Sm8D1SRmm22bF7t0w37icnQzuyEl7Hp2I737mVvj88bN9U9N4biP7dvBQO+vee+6vcGw4Gv1NhVnwX2VfJpYmHAkBpmgtmpSkO6HdhXLWqtdBx5+mfWvRcuy+Sq8Zw6XI5eouP/ZTJZwiq6Jk0BydHyJhpztySR3gb87diyUpnnB8Hk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/pjwiC1ST3pN/CsnDCc9ZVvmkipBztkbDeVMHteeJ96Jczaiawma8OWOTn?=
 =?iso-8859-1?Q?6TOWcxp+igjasyTT8Q/oOYCBxkxvOsWk+3CQ99H6uzK9C3N81LLn05ha0Z?=
 =?iso-8859-1?Q?0FqwT8sdB7XcRI9T8jrUBV8h8Vvg2az2tzYB2JJlp+Xe6OPTbvw4AFsB/y?=
 =?iso-8859-1?Q?Sm5Zw0gBl1CswnUTqNuAtZ6muOxfbKyIdCRerOj9al0LUZc9qfYnJQHzoA?=
 =?iso-8859-1?Q?9mbYiv/OUbIXSP5FiS0lRZDwiuut96Ezel5IlRxNV8ckFMfIo8XUHn4BWR?=
 =?iso-8859-1?Q?NrSiLQvXjsmYsxvgnbb+eAkr5Rr8gM5Jgw604s0Pn34UmfcJhkhZ3Xq6Jb?=
 =?iso-8859-1?Q?zP+41NlrbhCGpFn4OV79PfLBZ1wcyGwyMhvKUeyB0QxI4ksWMZCXWMywvY?=
 =?iso-8859-1?Q?Rgw9jNylqf56agewzfGRYEfQvTUer6L4e8tS2LJuscleMoXpY8tvieGSqW?=
 =?iso-8859-1?Q?4JRh031U6IbmERuZJO1mpUDNZeZIELRkhNZAXZGr96tDUXfzvtL6IjUdtP?=
 =?iso-8859-1?Q?KKmuVCsdtHjwcKoI4kpA5wAswtufvs+QdhpGFtzPuBZ8SX9odG8SWItbSr?=
 =?iso-8859-1?Q?oPHozsPkXwDZgOPLm8ZOEgkt8aIA3tdhF+TjD2MeEcBRCQeqxVG3AVUym+?=
 =?iso-8859-1?Q?+XMB0szIwTvPs+8EcOVpoChM920jwVLOTjDRpQ169cYx3L8ph7aCb/g+th?=
 =?iso-8859-1?Q?mi7vf2fCmorGHmwXtjzNNPG59NgGfhesrqMoHgMO9XnNdHaxxvsbWRAD8H?=
 =?iso-8859-1?Q?qYnqwkYmjZS4VV8aF5sIYiEwFdHyTELwhjgMTCRh8jO8c8E1ThjyvjzwmC?=
 =?iso-8859-1?Q?6sWONiCWd5KIaCfQ7olEeC5+jEbe1bu6RmpNj2FK6V0Kj90EWMn4+9+O7G?=
 =?iso-8859-1?Q?He083w9nyzfopMaSSPP7AyxEzOcdHVkjJTSJRFUUHCUtliV080EwAoA0fe?=
 =?iso-8859-1?Q?clP06He8Fz5bwgIoGGnpfMLd+ABfjLqtE/GdWI/uxz1QFTi5vw5ssnL80J?=
 =?iso-8859-1?Q?LI7UFNPmdXjf4yHQWPZMTPQ1FVxSkfy/vZ7rgCMYBCWNzllEsUdfMTN35E?=
 =?iso-8859-1?Q?9yzNHeVZQ/IMwlUSTv0yMdbYoJawfbCc6TqhI5fXZ43qiJMGKSR0A8etdr?=
 =?iso-8859-1?Q?fC3Fr0DjLEncWfkrr4l9QbnbKGR11mI79xZc4bBClM5jSWO5fz5qYSM83C?=
 =?iso-8859-1?Q?KjNeuNhEUOV5YurXGCz43FOGPsmQDnsabE13zDzKB3p6YG4rYw77ETxxlp?=
 =?iso-8859-1?Q?KZRhGxYGInDSDLaHRzAnttATar6pyD+LVxA1qoW9AaUBtyATQN1ws0LJ3u?=
 =?iso-8859-1?Q?CrcDnKhMOGgTYopgQKM2p/FVZbKfLzyX9VgvZhO/HHDnvgXG1KwZcSW8zk?=
 =?iso-8859-1?Q?yQfxtIrrdmHg4WemRGFyvtEaUwMHdOVlid9yaLiDeroLp7D0Hws2iZile0?=
 =?iso-8859-1?Q?CYhfE3O0lFLmlvw2QBquzRPwrXrtdI8FPkmoKV91zLXjtQBat9Z64OiErN?=
 =?iso-8859-1?Q?pPH1h6iN0rrSlbI7xm4qgQeMP3/KzU6oy7++0KfQODt/+XSrhcjngKQo2m?=
 =?iso-8859-1?Q?R5vcXSQ9dkwpiXLFTCzEh+GdyF8O+fTIkRL9QoKDyXgsCH6IbxacrGMgBN?=
 =?iso-8859-1?Q?sM4Rd1Wq1zVUG3Z+N8rqbHlhnv4UTUPZvkLoJ8q4fXkoQSuVN2DRM2Hg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9e25bf-090a-4c40-62b5-08dc3f3e3c7c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 07:06:11.6661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M19cqrFyPESxsa/tHE2mW6JbPp4x3Cbq2g53RJ/KrUfOf06UHmNaO6ok52NDw4o7Fu2yK6NuREgPx+bbkPwsQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6438
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

On Thu, Mar 07, 2024 at 05:41:19PM +0100, Thomas Hellström wrote:
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

This needs to be moved below the slot resveration to avoid [1].

Matt

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130871v1/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

>  	/*
>  	 * 1 fence slot for the final submit, and 1 more for every per-tile for
>  	 * GPU bind and 1 extra for CPU bind. Note that there are potentially
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d9487b39778e..dbfdfd3ee39c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -516,7 +516,13 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
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
> @@ -568,10 +574,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
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
