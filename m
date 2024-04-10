Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4431CD1297
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 17:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E4D11274B;
	Wed, 10 Apr 2024 17:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j5vF6dJf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4292811274B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 17:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712770591; x=1744306591;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PgH6jQJ3kACKeoD/u7CiNMcsaRIR4BOjcJw+wFMF6Qw=;
 b=j5vF6dJfYPrVRryCEQoOG0JD4OCaylCF5Zex9plr0pQjgOv00rvlPPFd
 c8C2GFVjl/UuiRFGTENP4L93dZyX9xsBEA1Hy5zAW/NCN1OuZMH3YG3WK
 50hJBMO90SK8dlG9iJBIO29tsTeBiWLrKIqEQOVWERV3WO02UfldrejjN
 17+q140ew4Hl9Bq3mF/HAdss/ieTMIx+yMUuG+eQdBAkWNtBNeNlbu7or
 H7AnX99huZ044t92JDh/tVEWapmw4l0fRtm0D9x7tq+QcyngaHZBQubky
 cxChMmmiFnwubX03j/jshdJjam+7HGHxxf4IBTfpws2hyogMe/BxhZCh1 Q==;
X-CSE-ConnectionGUID: 0HSg6+J/T5eE2XyDh1KNDQ==
X-CSE-MsgGUID: xL2XtCztQoWddVQfNEOyJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="30632136"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="30632136"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:36:30 -0700
X-CSE-ConnectionGUID: Jk62dKbaSdagakLJ7sy1qA==
X-CSE-MsgGUID: 58+c0wOrRoKu8Q6dEOYBhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="20598787"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 10:36:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 10:36:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 10:36:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 10:36:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 10:36:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGaUcn6FF8gu/XbiBeYP/4GtaRcLYxAVbiZa+5j91LOJ2N0sXo4RXY52NE5ygp8xriyShHV+koIjHbKfzbm7n4Js1H81NfjFRu99suqPcNWsdZdvZswT8Zt9eXEPgC4RzAa18oEKR9gRexNXtMqFHNYEzJw1eurQoFP/Dt1sxYMsv6jcI2TB7lZ1FSsXdpKLgbog9CckqJP11i6SOaqdxODpf9T9/fwuGE0xjNHSgRnKuLFciuNKE5tujIjkbmNhDOlHwCByLVABnRtcCKgmVb0cWqxf/2XPHrZlKf+4h+H1EaHK0oaiRT2MGCftn8WtgiyR2Q/TxxqUZR3AT/VOlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FetxDa6H1dmXEZoIM9c3FOKEY04PTOa6DSijfqF3vYI=;
 b=AteuPppKnK8gXSn6vMcakxY6aq6yZOadnw5XapcnhBT80lTd0vIVvxA1k9M/9RcyADotPh97kBtSEg3Ma2jAIpFm78rSxMBKcRGONzCdMnUxB15Ehnkg6x/Ijdj0ebpPk7Yi8IQFKYAVaBXu/LJ5Y7SsLZWZfDBN/CPEn+XWllj3D3TQqpnfPpSSh04wLepyeO9ggvomDSXkEtvzDTqH1TkBhNM8R8IX1TPEa9fiIM0gTVKwLgBRjn/h2XdprjghkYdnzMl6z81VTb4YfO3nHuzN9wxWgWlw2d4SV80wtLtS/onDFEz9HQXxXp54CeV+0yH/IQ1rjvtCJMBx5yIysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5772.namprd11.prod.outlook.com (2603:10b6:a03:422::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 17:36:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 17:36:21 +0000
Date: Wed, 10 Apr 2024 17:35:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/uapi: Introduce VMA bind flag for device
 atomics
Message-ID: <ZhbN0oKKhrc4z0Il@DUT025-TGLU.fm.intel.com>
References: <20240410170308.409-1-nirmoy.das@intel.com>
 <20240410170308.409-4-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240410170308.409-4-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR21CA0011.namprd21.prod.outlook.com
 (2603:10b6:a03:114::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5772:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U5DEENQknIqwZLGa6Adgrb42Ry9k5lQ5FimNMDNnyNotbgftdDOUz924iQU6qWC5h8BnDvdtsaDSzZJgDULvU0DCzAI58aDQOVpkbFUgO/ppKw8Cby9SPcgPkRRxcQyusMBOyjJ1nEjCsiTrPtyDPkcHhaAdh3RQzH6U4X31bGShX54g/XXpfjvyzwc1nFTCgxdZjpVKavrRi3GeRLj7gYPT56KvnlVc/TjSXv8AxdNp3vGbp/qDjGSUYz1v6TMEDPTzR2agM3gj6rcoJmIyp2pzkyuPLjnO0w/uODfUENqnAuZ7/+sPCn5ibRhUIIW+Pccdcwc83Ricb1ZANgNQg5ju9fUUVp8zL1ZKQsvNhiUrMFB8Kr8qdRqHx3QfjfzIoPU7GHCjLKf79jiHy5yvx84pNltwk4pLfCxvmXvype4I0AHtyrLdACEzEr+iE7ZIp05gD3Xn3C589TogTd7ZbUzATwytSK8r6PO9ykvJ05KSLNYZc5VmHYvGiUSip+EFl4go++tkcx4a4uTzfx2JcEpmN5onYEKNM3lKUt+cFGj0ch2MwOr6mFxBNbugXIriFpstPScc6tyKypU7e+vDdKn1k++xKa9pXwoPWkZAnlLDSNOGVRYYPc1WY+95VkdopaSaZiEVawEqP7azMjK3P8gbnkGVo7+0bWtMXXzp/Ng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qmBL4KNWdMqY2fPqK1l5t+Jqi3yECehLIf/Cl6dEQKoQX4Qbu9PeYRGNAEFm?=
 =?us-ascii?Q?WpzcB9IppEx12fY0MBIUFa7vcqV3JwZtETy41KqfhsyAnMAXuvRQekDkmrWF?=
 =?us-ascii?Q?+r8oepx0Zbd3FEQ/l3PndWra1FgCwcgmT4ceVnrrvhNGqVCrmXgslKU+Seai?=
 =?us-ascii?Q?NCQKgSyuFlQGITDtc4/wKodUsB0HMffjS7uhOzZ/y2VWnLUHnQM5SR+rF4Vm?=
 =?us-ascii?Q?FeQKn0d76DDuyO0dEeTwS/XC0RL28vGWEQjsjO8evzVKv/IquQKyU5uw/R22?=
 =?us-ascii?Q?n8eklzRvlGillwJEy2bb6PAy0riv84SFuTtf482U+v3sD4BslZAICO5Zd1tz?=
 =?us-ascii?Q?UT8LIFSLz09+8bjEyr273rvJWY8uhxuptD+IRwc9SY4SJ0HLOaITX7bCJIQd?=
 =?us-ascii?Q?6dNQtUsKoUGYxVqgb+tr/q9xrkN7F3VtAHGPbqmaKRIdkzm32MvJFzvHpQOa?=
 =?us-ascii?Q?bEuvszvZ58J+33iRTMZQgNBSUzW2Tdj379T2fwkslq53Ct32oZVwmoyub7gb?=
 =?us-ascii?Q?dIXqCSRzEh0DR40oVFUR+rWvw76WGN216g4gVRWaMzBk2NDtWbZnCjvvfUeA?=
 =?us-ascii?Q?BRO9jt8QgfQ20INgwO6LKJLo9H7oqxLsOUa8p6retUGJn1TfosnSTUxHy2ZW?=
 =?us-ascii?Q?BwKfYe3LjPyA5RdrSo2pW4jaxDXGf1iLlbSKsqSJwv5HNfRtoCz+gBYzmnzf?=
 =?us-ascii?Q?vkj1e8qKzN3qxDHG+RUKbfpKPwbM62d/vxueuWno5zX/L6YwBFf67laQGMUj?=
 =?us-ascii?Q?yPA17rkGVo9XNzXe2pWZxHIYg1Xt8HjX+fqGD9bkctLcPV3DV/rV2zBIJYoc?=
 =?us-ascii?Q?9HK3cCFygLvlKZgFN5Y/Spgs/mi8Hv6JRIv6DMdoYC5HMHwz2AgkPKXqn3p2?=
 =?us-ascii?Q?qjjDRrzkWK55NztXypPrm2g7yDeYzdE17SlMmukXH0WM9lKYj4fqXgygHTUK?=
 =?us-ascii?Q?3O+PUWX2mvPbBv2d1Ey5asYRMaok9fgISpn8CgtMeJsZA09gDGxgKewaJ31n?=
 =?us-ascii?Q?iAT6EM+z9a9rdQwONBgQ7EEU4wm5dcU5W04sfAFJXuBRlcyI01UYAfne85BH?=
 =?us-ascii?Q?kMLljMeyxtMNpCxpu2/VKChr2NQfZYVJsWFKVSU2Z3MfUomHmczDXT/fGI8z?=
 =?us-ascii?Q?RdeAobQZkTXJwAC1TCoKsJ9cXfaTGbHmX6GvquKa19ubeujrU/4QYFfsUywy?=
 =?us-ascii?Q?24Lmu9Sc4aK24w9K4o6enED8i5GGOrud1U+mH9RcDJo/h6OkZYc/DyJ6E6Jz?=
 =?us-ascii?Q?v0YfnY1/lXLLhQNjErLEg0lnEgWUHRug61JX25SlfE6c/nBJPnJIuF8wgdxj?=
 =?us-ascii?Q?VkFeZ4BbCTEs/5WojBwwSDMqmpXBL7PGN99z/NJqzy5UAA4SnSr2Qh+hxW4W?=
 =?us-ascii?Q?3Xv+XG+j82ITsTOD0uMSAUEmxzZKzVxuFEZV7GDQwtmuo+64OJ6WhFVR94q/?=
 =?us-ascii?Q?Wbzx+yALz+JBNZWoAtonOAlMlpBFExyevJOeM+SC0Uifu/JKQtbkald7hqjX?=
 =?us-ascii?Q?UPjrjIeL0WHffVDFHlaxYGSfAAnViGrLJrYkeF8wwCgK1TP3N9olguc5aMsO?=
 =?us-ascii?Q?O/TGkeWv85UyO6M7Uz0VN2F+qmjgKaFXLWPVIeQCdWsV891s+IOwol7r4mZA?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7087a912-e970-4046-8b21-08dc5984bc42
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 17:36:20.9921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MeWQQHJf9E3shcukaI2E3IObkFHA+7oGfreiHjbUtH1Lpz5K5R8CP5MwtAbrMTcNeca8/IjG/NkaNsBYCbCqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5772
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

For new uAPI we will need a UMD PR using it and provide a link to the PR
in the commit message.

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

s/flags & VMA_CREATE_FLAG_IS_NULL/flags & VMA_CREATE_FLAG_DEVICE_ATOMICS/

>  
>  	xe_assert(vm->xe, start < end);
>  	xe_assert(vm->xe, end < vm->size);
> @@ -912,7 +914,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  		xe_bo_assert_held(bo);
>  
>  		if (GRAPHICS_VER(vm->xe) >= 20 || xe_bo_is_vram(bo) ||
> -		    !IS_DGFX(vm->xe))
> +		    !IS_DGFX(vm->xe) || enable_atomics)
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

A few things here.

- These check should go in xe_vm_bind_ioctl() in the loop that looks up
  the BOs and parses them. Probably move implementation to a helper(s)
  too as it is already a pretty big ugly loop in xe_vm_bind_ioctl and
  adding more logic will make it uglier. Search for
  drm_gem_object_lookup in xe_vm_bind_ioctl() for the loop I am refering
  to.

- Rather than drm_warns just use XE_IOCTL_DBG for these checks, that is
  the style or input to IOCTLs when we return -EINVAL in Xe.

- Are these checks valid? At one point on PVC I had to code to do
  atomics between CPU and GPU by migrating the BO back and forth on page
  faults. I think the i915 does this too? Are we abandoning that idea?

- Lastly if these check are valid, rather than a platform check in the
  code I'd rather see a bit in intel_device_info.

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

Extra newline.

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

Put this next to the other bools in xe_vma_op_map.

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

Kernel doc for new flag.

Matt

>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> -- 
> 2.42.0
> 
