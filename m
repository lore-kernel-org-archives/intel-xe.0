Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6151C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 23:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668A210E45F;
	Thu, 11 Apr 2024 23:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ek5Ftygp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE2610E45F
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 23:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712879058; x=1744415058;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H03jICNC9nlalH0qk0gGdpdvUKPOwKMObOjTN1cU+2I=;
 b=Ek5FtygpRXwZhModKN+brO/mckq+iYWiiEHlq2xrQfVLZWnUEh/tFtl+
 t2CBBPTDTj/AFz9Is26zhs5U6133OkckAszJlRk5nyGumEAxx/NvF/6SR
 OIa2JJC0b6epzH5qNgyCRR3uDpM013D+Pk4mQLDoWK+GCXLNC4wbpE3hh
 fP5X17D+othk4GnUVMXfGAITPpvGfAAZzgaHWrYNjVhdZnp+1RqyavMMc
 86ZRxooEetnL+iqjidTSeMJDB8rqPJbPQx9W75uHiCry+GUXReq6uxoyX
 0i/Hxsn5pv5BVGto/QQfVA9RhgSilOs3KmBpZpQ+/B5oLWJt+fRtHPG11 A==;
X-CSE-ConnectionGUID: SF/yvdwqSZiVcgTWNfRFEg==
X-CSE-MsgGUID: FD0x8yFjQQmVymXDtqVnfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8456255"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="8456255"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 16:44:18 -0700
X-CSE-ConnectionGUID: qfonHy+aR1+ErsQUxhKOCw==
X-CSE-MsgGUID: cldaDKKsRBihIIoKas77/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; d="scan'208";a="25600319"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 16:44:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 16:44:16 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 16:44:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 16:44:16 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 16:44:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmGp3oPbnCrnF+ua89NL35qOyRz1D9BmYiNEZt+/NhLYjKffO4vZjC+L0QCbkSz6JfJrdqePKqHNaEFq1DJd3z1tRsANBIzSfDqCe8XGsDGVbCF/Z542rMKtNa6NQ+qV7sQJAzaPoeT5OhrKTOxi6CIqxXQFd2cnxQE2/rwaAXG2HwjUjG1y3RyheYJmNXBI7VdEEvqqhN+cK4NEIOeyVTDcKOkIIVCrm3T+/2qna16qUf04q3NThIbA0bosNdIVyLUcRfej3kz530g00IwaPGn0nQuaR4prHuumhd+RWvMRNIbI749kj18Bp9T43g7bcN6FRVcwRg0lOITgxqVR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7b9MmmeHH7NnejLZNhhO/yNUVNS3XTHFz1oXIZxy8s=;
 b=KHMgnku7nFvv9AuG6rYddh5qtztZ1Q1h/IT8oaQfvkt8q0WJLK0swhqvXnadApnwOHEFUpDrFRAEgodFIss9gzuvBxajp5Ct81bi7uPSDTCz523PcPfEvYrJ89Fk6fuM2aUjo3U5G6lQTX0inaGprOOn1ny/Y2WZycEarvTMJn/oo0EJgNILJEqiRaysCrERV9lO4PFWlaHJuJquSY6Jvsl3zpeREy86AwPwUhMfMRsNj+CoQ/yksUd57u/Ze0+L19847+lDeaPEksk+2iDvlk4VsD4YoPlwDxjcTvwf8vRKEV7XUFhjV3zMqAfwdC7NEb/rrH6ofSfPgikXLf4YBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CYYPR11MB8330.namprd11.prod.outlook.com (2603:10b6:930:b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Thu, 11 Apr
 2024 23:44:14 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.7430.045; Thu, 11 Apr 2024
 23:44:14 +0000
Date: Thu, 11 Apr 2024 16:44:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/uapi: Introduce VMA bind flag for device
 atomics
Message-ID: <20240411234412.GH6571@mdroper-desk1.amr.corp.intel.com>
References: <20240410170308.409-1-nirmoy.das@intel.com>
 <20240410170308.409-4-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240410170308.409-4-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR01CA0003.prod.exchangelabs.com (2603:10b6:a02:80::16)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CYYPR11MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 05eb0e0d-6009-4edd-a4a7-08dc5a814b62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: liG5FBeMCTkqSSIdO8/DA8hVUifIBvZxCxU+bZ+/dt790wc7Wa/fOy73i2N2oPSQ1Ehfsf6mpnMiKsn0IGnAdATdyWHfH7J6sESI5ob0HLuNPY5lInGo6iG7ibJcLd6Kt7QOdbvxk8v4F2dedIfJobb0Hv7A7wpAPm9nu5YdVNlCetxmZQXuv7xJgN2/VCK9yq2E+0xab21Du45kzCfoYJLNWWbwRCANBfPA5pYusQBydO9T3fYXJXXd+SRS5vQ/D8cpKDnCNkTiqmaBXmwwtNZpOqt2I783gqLNx4r12fuT4Zw6fLrp993so00l+hoazKvKLHfnhlXM7dOGl3XQepBq6ybV1m3vpfw4wA+Uyx4czUOqJb7v2a+02wzaZcPmBUbWufgRUvIvhOHIX790IX5EJdOtuv8TzM/BIrDePWQeRGUQTnRWndfPCuEB9ZleLkdt3jWrZUTKKca/o8gmxnWCz+2vveRd6vU7oLKNvDB/UtZtzLCvccLg8iJFJcqptrZf0xCHh6MIRsxUHG7+fGrZrZ/B9PT3sHsK9dJgUnCZfpY7lJPOa5J2PG+QaPC195UgBjo2Xo0tn2mJZZtBMCTFYdjNn7uQjtnbye2LliM8aoq73aJlsLTI4zTCUDsSd7/5wUKG1MRo4SVmssF6um10CnDuDkOujDdC1G9UwyY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6KrfheBJPiygLYJcRkSfyZrvpOy0jtqcC2YzvklIB0u3abm48U17nq070emp?=
 =?us-ascii?Q?zipoi0wp5R5qjCD/d9oz4IpqpJTYzxjTn1I6UCfYg+qVlLHhhHFwzEt6WWo3?=
 =?us-ascii?Q?H/yYvy3QD8ALVg9D/glLt/Gzf1SOuEYhmN4EHcbFvbQGctIm4vPJGUqOrM7m?=
 =?us-ascii?Q?0FTqsMf5uM86vtyPjl9Z8tBiItM8rtLB3gsP2ZZuvjHO8sWBggduV8huGMmd?=
 =?us-ascii?Q?P1l2kKN3/BxptMEYrgyOlbS1KKAoRXcagQQAofNYdaNkQROs62PTZYVLR/TS?=
 =?us-ascii?Q?1aNvFFnEMp8nQgVfam5DzMQkQVl+2PfLBTHIIyv/WZTP2iRnqtGkU/MrsDk3?=
 =?us-ascii?Q?sa9cdTlf8ssbZuHvjGK4wUrcuOi/WiEswog4HwcPRqyUl/G1hOczerjzlpGp?=
 =?us-ascii?Q?cX7nfZTI5mMKRvqpUpcRnMHacJFtqZEr+TUdrA3xcaqHw5jyCTDh3ENTRhQZ?=
 =?us-ascii?Q?N5dlccvdYxT/nsuClOR3MMkxlm2EIdNs9eFIcnAdnzMhqaNbdmlYErNaoWcr?=
 =?us-ascii?Q?7JpKrNda4BjvtLeAqeOVkNCGOg3x+wZg/96BeFKht0YmEkY2EAuDg731HV6o?=
 =?us-ascii?Q?LUyFMikQ4KwFFzKzvAUrlPXTreEfWRagOcpNMm5XFkr5EwfKpREmXJTH+vlS?=
 =?us-ascii?Q?J81aPBCeR1TR730P2NHGU4Aqf47CDn7+ol0hLE67WuKXnFbwenVAb2bGmqvc?=
 =?us-ascii?Q?zGA9zd594SZz5pankAd+8YW7QbgsTnSJtDvIDP34TJSpXrL5F9wYPrpX1JMX?=
 =?us-ascii?Q?c6TCKSGFqpEUFmvM5A0D7cXTkiJKB0GR1i5bbj/ip3sXWOiRIUAkN0d7kHbp?=
 =?us-ascii?Q?xmvqIuVQAm5yBXUrLbRfeRi32owsDSN/7Yzi1Ytb8TrXeFZvIjdpgIxDhTSp?=
 =?us-ascii?Q?767PT3M1CuNaK27/flbAS2yFlA//bU/+499HAukUP2Bv+xT9effmSQGaX2+V?=
 =?us-ascii?Q?HlP1m0DNb5jc5fukkwSkpIYSB4M2xFcmWdsefC7ZdxO4vIqnwqmIkFifBq8d?=
 =?us-ascii?Q?EJnk0eC1bX0+t6h/bYU2SPkhnsBj0jC9PdqdlrEqitbn3JG67I3bN0v2/1Ep?=
 =?us-ascii?Q?3MTHaCoR7eeevbpCBmqHWC6g677Xp3SJ1KDlERc4u2OtfeGjea/PNYY4qUex?=
 =?us-ascii?Q?FGtzhynLWOqKz+s31Y//HVJQVW4DSSuHx+3OBHhq1AV8QNERFLGyMZb5yVNl?=
 =?us-ascii?Q?tLD+XijzEpX+Ag3//TTrCKmghUrDYRg2DOf8jQIO/BccpxAv48mk++yAgjYY?=
 =?us-ascii?Q?4IGgU8Dk8whQq8h6Umsh5/TYOwlCpIf2GzH9QrZ8kwVGFJTgD2LWPWBJdHZX?=
 =?us-ascii?Q?pf4BjX2MasOIfnFccRpZlCXPfYB9PYBzeGL3EYZTXX/hpFTFAaYPmYoOFNPY?=
 =?us-ascii?Q?3SyVAODf6NUN05v1Cz66Xh5nRat9NyUCOkr1ygseRAaKf3/R1CI61x4xK39I?=
 =?us-ascii?Q?kObMgVkLsN6Inae+YOAc98kZgWe8mT+bcqw3HkzcyrPTHBonGVx3B1H4mDKa?=
 =?us-ascii?Q?TBzt2gFoafCeSh1I1GPqwg9RSiUjzwcika6OE0nOAYcopXE+O1uXmTbCPC4M?=
 =?us-ascii?Q?dnDTJxAxA8ZWmFlHsg0ML62hoHQrrPTLhne8v9RTXPMiXaBbZMAbyuYzB3ko?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05eb0e0d-6009-4edd-a4a7-08dc5a814b62
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 23:44:14.2964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGltLNEGSMhk5DrOakLr0IITt79N+Ykqg7od3emh3vcxHHo0LWWQS580KwzvDb9+PecKlMRnvupa2L0BsxifV6vnIYovcyRGoagZ9eYrYDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8330
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

On Wed, Apr 10, 2024 at 07:03:08PM +0200, Nirmoy Das wrote:
> Adds a new VMA bind flag to enable device atomics on SMEM only buffers.
> 
> Given that simultaneous usage of device atomics and CPU atomics on
> the same SMEM buffer is not guaranteed to function without migration,
> and UMD expects no migration for SMEM-only buffer objects, so this provide
> a way to set device atomics when UMD is certain to use the buffer only
> for device atomics.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 27 +++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>  include/uapi/drm/xe_drm.h        |  9 +++++----
>  3 files changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8f3474c5f480..530b4bbc186c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -851,6 +851,7 @@ static void xe_vma_free(struct xe_vma *vma)
>  #define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
>  #define VMA_CREATE_FLAG_IS_NULL		BIT(1)
>  #define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
> +#define VMA_CREATE_FLAG_DEVICE_ATOMICS	BIT(3)
>  
>  static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  				    struct xe_bo *bo,
> @@ -864,6 +865,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
>  	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
>  	bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
> +	bool enable_atomics = (flags & VMA_CREATE_FLAG_IS_NULL);

Is this a copy-paste mistake?  I expected this to be
VMA_CREATE_FLAG_DEVICE_ATOMICS, not VMA_CREATE_FLAG_IS_NULL.

>  
>  	xe_assert(vm->xe, start < end);
>  	xe_assert(vm->xe, end < vm->size);
> @@ -912,7 +914,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  		xe_bo_assert_held(bo);
>  
>  		if (GRAPHICS_VER(vm->xe) >= 20 || xe_bo_is_vram(bo) ||
> -		    !IS_DGFX(vm->xe))
> +		    !IS_DGFX(vm->xe) || enable_atomics)

Is this the intended logic?  This will still turn on AE=1
unconditionally on Xe2 platforms (regardless of the flags, placement,
etc.).  I thought it would be something more like

        if (xe_bo_is_vram(bo) || !IS_DGFX(vm_xe) ||
            (GRAPHICS_VER(vm->xe) >= 20 && enable_atomics))

so that AE=1 only gets applied to discrete smem in cases where we're on
an Xe2 or later platform _and_ userspace used the flag to tell us that
device-scope atomics are sufficient for its needs.


Matt

>  			vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>  
>  		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
> @@ -2174,6 +2176,18 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  	       operation, (ULL)addr, (ULL)range,
>  	       (ULL)bo_offset_or_userptr);
>  
> +	if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
> +	    (vm->xe->info.platform == XE_PVC && !xe_bo_is_vram(bo))) {
> +		drm_warn(&vm->xe->drm, "Setting device atomics on SMEM is not supported for this platform");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
> +	    !xe_bo_has_single_placement(bo))
> +		drm_warn(&vm->xe->drm, "DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS can be only set if the BO has single placement");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
>  	switch (operation) {
>  	case DRM_XE_VM_BIND_OP_MAP:
>  	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
> @@ -2216,6 +2230,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  		if (__op->op == DRM_GPUVA_OP_MAP) {
>  			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>  			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> +			op->map.enable_device_atomics = flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS;
>  			op->map.pat_index = pat_index;
>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>  			op->prefetch.region = prefetch_region;
> @@ -2412,6 +2427,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  				VMA_CREATE_FLAG_IS_NULL : 0;
>  			flags |= op->map.dumpable ?
>  				VMA_CREATE_FLAG_DUMPABLE : 0;
> +			flags |= op->map.enable_device_atomics ?
> +				VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>  
>  			vma = new_vma(vm, &op->base.map, op->map.pat_index,
>  				      flags);
> @@ -2439,6 +2456,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  				flags |= op->base.remap.unmap->va->flags &
>  					XE_VMA_DUMPABLE ?
>  					VMA_CREATE_FLAG_DUMPABLE : 0;
> +				flags |= op->base.remap.unmap->va->flags ?
> +					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>  
>  				vma = new_vma(vm, op->base.remap.prev,
>  					      old->pat_index, flags);
> @@ -2476,6 +2495,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  				flags |= op->base.remap.unmap->va->flags &
>  					XE_VMA_DUMPABLE ?
>  					VMA_CREATE_FLAG_DUMPABLE : 0;
> +				flags |= op->base.remap.unmap->va->flags ?
> +					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
> +
>  
>  				vma = new_vma(vm, op->base.remap.next,
>  					      old->pat_index, flags);
> @@ -2831,7 +2853,8 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>  	(DRM_XE_VM_BIND_FLAG_READONLY | \
>  	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>  	 DRM_XE_VM_BIND_FLAG_NULL | \
> -	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
> +	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
> +	 DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS)
>  #define XE_64K_PAGE_MASK 0xffffull
>  #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index badf3945083d..7b9c68909c78 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -282,6 +282,8 @@ struct xe_vma_op_map {
>  	bool dumpable;
>  	/** @pat_index: The pat index to use for this operation. */
>  	u16 pat_index;
> +	/** @enable_device_atomics: Whether the VMA will allow device atomics */
> +	bool enable_device_atomics;
>  };
>  
>  /** struct xe_vma_op_remap - VMA remap operation */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 1446c3bae515..bffe8b1c040c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -969,10 +969,11 @@ struct drm_xe_vm_bind_op {
>  	/** @op: Bind operation to perform */
>  	__u32 op;
>  
> -#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
> -#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
> -#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_READONLY		(1 << 0)
> +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE		(1 << 1)
> +#define DRM_XE_VM_BIND_FLAG_NULL		(1 << 2)
> +#define DRM_XE_VM_BIND_FLAG_DUMPABLE		(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS	(1 << 4)
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> -- 
> 2.42.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
