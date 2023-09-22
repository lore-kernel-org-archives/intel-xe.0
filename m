Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE0DE6FE3B
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 14:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5877110E06C;
	Fri, 22 Sep 2023 14:28:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA65C10E06C
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 14:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695392911; x=1726928911;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n/1fGlAFZfvzBU5N2idL2ReMOSAo+dcbe540r/DM920=;
 b=G5F0vy9eT90Sb5H4Mt5ckXdlyCt+Uroy1CljWVRwtT6YmusPDkdUTbIv
 g4jZZ7ZN2zPq9eTvDe8pnaT6+ZcEeh8X3QggICI1FPQMvlcnIQVhST7wG
 mQpWs5t78g09dBEAw0c7S5UXWuqmiNp9uw6HP6wPerPXhT1+uWrzGW9r6
 LVLQdJ0ulvEhizJ6e8s1yJzt6ABagZGEJLnxEnT3OWUDi491hggw+x58b
 ipGwpuiFJ9bDoN/iqR+enw+UuHMPEFuA46M6fnviJCSmZTJyWE4WIInu9
 Mhae4ya5VnEa8C5cxUjRi3wTBi7JeGx2I21JFzixgs21CkUBACX6RfPmf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="384676070"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="384676070"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 07:28:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="862957149"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="862957149"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2023 07:28:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 07:28:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 22 Sep 2023 07:28:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 22 Sep 2023 07:28:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfIiJ1UyAGgvhxquV7csTzYupbhjCOwV+kEgdtcFQf+upfIPKmsJJB5t9+P7eONkjpNIY2E0op863pr0rpLdrMvRzd4cvD7lUFgtNJWJzFlay2vCxq9VSk75e6V6AuaMIdvMrDcbDnfD5R2yQAHY5PM2jTSVMgLR4MEQUICFgNS/dRdigbISnhJ0lsTk1fBvB4DImgm2Er5VYvVl1xlQFsHOY2nuCEfy3nEd0vsb1mN1G/jl1vvpB91MAs0LrvXEsNPVOJ3v8qXsqssJ+po1Go9Vio08bsV78p7pFM67KdoI2bHlD/UlxWPgU4FACvD004isvp0fTnvlFGdpcMK82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxONJ7hsqdseuSE+chmt2TjmkYfBxqmbfjUjtIqxIco=;
 b=OMeLXABfmS77jLyrdqQGqcFZJB4KiUYLFxCe057WeNzubsx7BO2Tfi/WkgS8bfgtpY2wmKsGr9rtjjvPb5HQ3VDhHtsjSE3zoFnYFJKnw6oxIXLIeu9rVQrokTUMD5egi60n+BQDJ8vzSuPqJtSIc80aQ43ViBGEzZsG28gWtpkLiWK5GiCIIoPibw5tOVQqELgl+GJjGD6uGw4TJSsidRH2IVd6vCzM7wmNClWAjerEshzECam1RCqHX5iEkBDNu+LKobp0fclYvAsLyIcFCHJI1vUrb21FjM4k69s2DY0RfDixbp7zwjLNooLUNL4s/SBQpuNPF6KJ3HWXZccKCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4537.namprd11.prod.outlook.com (2603:10b6:303:5d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.25; Fri, 22 Sep
 2023 14:28:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 14:28:28 +0000
Date: Fri, 22 Sep 2023 10:28:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <ZQ2kh2dDM5VZqBvB@intel.com>
References: <20230824174618.1560317-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230824174618.1560317-1-badal.nilawar@intel.com>
X-ClientProxiedBy: BY5PR16CA0001.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4537:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cbf2863-04b1-4ad9-a4a1-08dbbb782fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j3Fo85hpyXqLDBfp7j+j0D0Jz1RsJKtBsrYtMNnvJurDhO3LtQsVdgruehG9tY8qnebWVce3cImp/MGLN8YTSLzLXEHdsE7Sqv6FUrRoDmPEsxBi2I4eoPCSD8x0xlRvMHMQj9PUF55s2rWHH6M/5/vhoHx6XAt3lsNGOOVUAhYPiMlb7TNlQNuf7xEp6/w9H+hwvRYVj9Wl6njKQuZ4t7lNhxMQhnAk+f68HzgNJRxC7UMUWDDcN5vo401C0/py5/HlTSLXwXJVB4YQNSXzcDFjwsLJSJt7i7wF7uQxrMLciDZ0HI5hyHSFIa5zweo8wWSpb1lZBp/spY9gJ8GVMNtgaxkpOZoOfuho71UPxHvkmOk4PULqKedtFH4CUGblz4pKYx+68+9EIkhvWMRht3AtDHPI3uai/OM3//YZ8Guh+Z4oea2b2fi64EQFMNUlU4Ljb7ZQJKLwdEbuY/p/0KdupHJYy/h2tJ72hFIfxqrPOdxT2lG6uwBG4f+Sh6BFYAx14ISq/arngSS4Sy4yIMPQE46bMo7rOczdUiaJrZAcA6iqoIz3rP7FsuBqAv66
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(346002)(376002)(366004)(1800799009)(186009)(451199024)(83380400001)(66946007)(6636002)(316002)(41300700001)(6862004)(8936002)(66476007)(37006003)(66556008)(4326008)(5660300002)(44832011)(38100700002)(478600001)(15650500001)(82960400001)(2906002)(8676002)(86362001)(6512007)(2616005)(36756003)(107886003)(6506007)(6666004)(6486002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1ltwj3+mWprgZeojQ9NpOvqXwoOmUMPiCCEAzbhNJywI+hkcE7TNAdQFmGie?=
 =?us-ascii?Q?RaagXEl+XTBJFpsiy3UhMOgfjsfWEoLYPhrIqlbRpeOt3gd1qKuG+9A8cwjY?=
 =?us-ascii?Q?AOXCJSiE0VsylFrLh/LRA6QhwUGHZ5ansMNKbPs7acrYiGwLALIY94iZ1GAq?=
 =?us-ascii?Q?Zgmqh06gceTovnTnFYvosYJR9PMAwPBZ5yTz2va1c7oIbC0M4bCsxQyVAkdt?=
 =?us-ascii?Q?wgpev+m8gL2i9P70adJWQoFQPyAqDbRGyaz0NWNjEH+YBuy0k46cd5UkyuEI?=
 =?us-ascii?Q?Z0KMtfFJ46p8wLSUmr6v6C+8uN3NKKqbRW2GoCUYEi0QV4ra5Ou313dBP/Rd?=
 =?us-ascii?Q?43ix0MpFy7C8JZ/PNnWTNwC86gtmZaNa3fjki/Ra79zFhfT+kngrBE73Ng71?=
 =?us-ascii?Q?RauUGqtcmvxm1FANOf6jEgJMDokBpzqAJ4LnQw8W1gVzTsGXuomVRqDqD4co?=
 =?us-ascii?Q?I6YAkdfvoHw7zgsr2CwAQJ5SRD8x0TaEN/e7OdkuLrAuD8XwheI7kvjJe8Ie?=
 =?us-ascii?Q?Z/5Qq8/rnR/IyaJeu61wB1MZb6Bl37VXq1X3dQcChZs+ukWEs4Z3kdLV3Jbk?=
 =?us-ascii?Q?rfGhx4zGYG657m4bdKEjRq8x7bc+Ac3z0O+6blu1oP16OC5ft9vif0CVzZH0?=
 =?us-ascii?Q?UpDCEKHiyJ3GvfAbayMHk1mTTF7PjApto9hykFWmVXZOBPPrjpdMCG6xe4oy?=
 =?us-ascii?Q?AolVcaqC0hqYICMTvaesUuc6ivzlxsDtHmIpZRIR5u8je1teyVx/KlI0jepw?=
 =?us-ascii?Q?EdmCOWzef7VLRFzkMpe6nWtDgeDh9UJ+Tl7s7F2X17yg1QydLFWOZR+Vvayu?=
 =?us-ascii?Q?4/OC8Nrq7yIbNIPLJVKojnhAEVcWnyU3UDWpFh0U3TIasRMWHfA8zCHxeUMS?=
 =?us-ascii?Q?NSralWRiDM7GLnpgcq5AAFAWGQpngmS+zNsJjwqGjMgsIdC7pWrslOcHQGLZ?=
 =?us-ascii?Q?IeQJrJlgvdJk8/HubY3KR+fpyjf/Q37GR1P9FXYu9EbMYivqikoicBkbBIUJ?=
 =?us-ascii?Q?wvgNvISCaKDdposSglulHda3l92ooNCmyb+ffESaVH+Umzfkl6t2xq6vOoXO?=
 =?us-ascii?Q?VAT5L2/E9c0UhnCbsA05IOhPQEPLvlXtCMC3SVrp+9LihAQYrz6QUoTRYwzS?=
 =?us-ascii?Q?nu1E2iH3gKwtdHPhXAwBNOqhJP3JSB6dW9oP8y90IQRV9TAg80I0i2RS+hVo?=
 =?us-ascii?Q?RK11QV/8eeyvG8lbVV4M8gR9J0C0QLb+knBOQy6cWephXrDCEZ3ogyU+ozkT?=
 =?us-ascii?Q?T8YhSC4bFyOvheuLHVjP4GRi20RLVpU1UxlK+9OtFe6n7Yty5ECryk/wVjQ8?=
 =?us-ascii?Q?wvNt2ByEoFezz8+evsX+DKjXPU4fvboKh/qY/YUEhP2wZ3sRmTwD5X9W4YEg?=
 =?us-ascii?Q?ymAmGRtiXGyNyGaR6/G3VA1vQA5/x96opg1WFzlvpxFZ9EblXYlytpkiuiPk?=
 =?us-ascii?Q?T7hJvCum8yQk2YhOQp/p7BwHQ/+2+Dd/sIPnUl37NiZZ1ErYH52Ka+WuDO6k?=
 =?us-ascii?Q?kZrxj50npANrSkxvwsfoVrbVwZKs+bFaCA2J0jBcrxD578mj3+ndFyyGq7gY?=
 =?us-ascii?Q?/itexDKGVPX+tRYD2HAY/pGZfsJjR2cCtErlTxg7MSbbYM37dbVasBGVO6t7?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbf2863-04b1-4ad9-a4a1-08dbbb782fea
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 14:28:27.9755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5v3w13THXEzpWgV59mielWMXiZj0LZC6YyN/N6J3RdA5Vsonxddoes70xe7hmMCH2CikYQs1gEHY6sSDdRffQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4537
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap mappings on
 rpm suspend
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

On Thu, Aug 24, 2023 at 11:16:18PM +0530, Badal Nilawar wrote:
> Release all mmap mappings for all vram objects which are associated
> with userfault such that, while pcie function in D3hot, any access
> to memory mappings will raise a userfault.
> 
> Upon userfault, in order to access memory mappings, if graphics
> function is in D3 then runtime resume of dgpu will be triggered to
> transition to D0.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 53 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_bo.h           |  2 ++
>  drivers/gpu/drm/xe/xe_bo_types.h     |  6 ++++
>  drivers/gpu/drm/xe/xe_device_types.h | 20 +++++++++++
>  drivers/gpu/drm/xe/xe_pm.c           |  7 ++++
>  5 files changed, 85 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 1ab682d61e3c..4192bfcd8013 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -776,6 +776,18 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		dma_fence_put(fence);
>  	}
>  
> +	/*
> +	* TTM has already nuked the mmap for us (see ttm_bo_unmap_virtual),
> +	* so if we moved from VRAM make sure to unlink this from the userfault
> +	* tracking.
> +	*/
> +	if (mem_type_is_vram(old_mem_type)) {
> +		spin_lock(&xe->mem_access.vram_userfault_lock);
> +		if (!list_empty(&bo->vram_userfault_link))
> +			list_del_init(&bo->vram_userfault_link);
> +		spin_unlock(&xe->mem_access.vram_userfault_lock);

I'm always afraid of these locking interactions here, but I believe
this is okay.

> +	}
> +
>  	xe_device_mem_access_put(xe);
>  	trace_printk("new_mem->mem_type=%d\n", new_mem->mem_type);
>  
> @@ -1100,6 +1112,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  {
>  	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
>  	struct drm_device *ddev = tbo->base.dev;
> +	struct xe_bo *bo = ttm_to_xe_bo(tbo);

hmm...

> +	struct xe_device *xe = to_xe_device(ddev);
>  	vm_fault_t ret;
>  	int idx, r = 0;
>  
> @@ -1107,9 +1121,10 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	if (ret)
>  		return ret;
>  
> -	if (drm_dev_enter(ddev, &idx)) {
> -		struct xe_bo *bo = ttm_to_xe_bo(tbo);

... if this was here, maybe there's a reason to avoid getting the bo only
if drm_dev_enter has succeeded?
I would at least keep this call here inside the drm_dev_enter block
and not move that up there.

> +	if (tbo->resource->bus.is_iomem)

But I also wonder if it is safe at all to access the tbo pointers
on that case... should we move that inside drm_dev_enter? or that
is too late?

> +		xe_device_mem_access_get(xe);
>  
> +	if (drm_dev_enter(ddev, &idx)) {
>  		trace_xe_bo_cpu_fault(bo);
>  
>  		if (should_migrate_to_system(bo)) {
> @@ -1127,10 +1142,25 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	} else {
>  		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>  	}
> +
>  	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> -		return ret;
> +		goto out_rpm;
> +	/*
> +	 * ttm_bo_vm_reserve() already has dma_resv_lock.

could we add some lockdep assertion here?

> +	 * vram_userfault_count is protected by dma_resv lock and rpm wakeref.
> +	 */
> +	if (ret == VM_FAULT_NOPAGE && xe_device_mem_access_ongoing(xe) && !bo->vram_userfault_count) {
> +		bo->vram_userfault_count = 1;
> +		spin_lock(&xe->mem_access.vram_userfault_lock);
> +		list_add(&bo->vram_userfault_link, &xe->mem_access.vram_userfault_list);
> +		spin_unlock(&xe->mem_access.vram_userfault_lock);
>  
> +		XE_WARN_ON(!tbo->resource->bus.is_iomem);
> +	}
>  	dma_resv_unlock(tbo->base.resv);
> +out_rpm:
> +	if(tbo->resource->bus.is_iomem && xe_device_mem_access_ongoing(xe))
> +		xe_device_mem_access_put(xe);
>  	return ret;
>  }
>  
> @@ -2108,6 +2138,23 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>  	return err;
>  }
>  
> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
> +{
> +	struct ttm_buffer_object *tbo = &bo->ttm;
> +	struct ttm_device *bdev = tbo->bdev;
> +
> +	drm_vma_node_unmap(&tbo->base.vma_node, bdev->dev_mapping);
> +
> +	/*
> +	 * We have exclusive access here via runtime suspend. All other callers
> +	 * must first grab the rpm wakeref.
> +	 */
> +	XE_WARN_ON(!bo->vram_userfault_count);
> +	list_del(&bo->vram_userfault_link);
> +	bo->vram_userfault_count = 0;
> +}
> +
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  #include "tests/xe_bo.c"
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 0823dda0f31b..6b86f326c700 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -247,6 +247,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  			     struct drm_file *file);
> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
> +
>  int xe_bo_dumb_create(struct drm_file *file_priv,
>  		      struct drm_device *dev,
>  		      struct drm_mode_create_dumb *args);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index f6ee920303af..cdca91a378c4 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -68,6 +68,12 @@ struct xe_bo {
>  	struct llist_node freed;
>  	/** @created: Whether the bo has passed initial creation */
>  	bool created;
> +	/**
> +	 * Whether the object is currently in fake offset mmap backed by vram.
> +	 */
> +	unsigned int vram_userfault_count;
> +	struct list_head vram_userfault_link;
> +
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 750e1f0d3339..c345fb483af1 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -328,6 +328,26 @@ struct xe_device {
>  	struct {
>  		/** @ref: ref count of memory accesses */
>  		atomic_t ref;
> +		/*
> +		 *  Protects access to vram usefault list.
> +		 *  It is required, if we are outside of the runtime suspend path,
> +		 *  access to @vram_userfault_list requires always first grabbing the
> +		 *  runtime pm, to ensure we can't race against runtime suspend.
> +		 *  Once we have that we also need to grab @vram_userfault_lock,
> +		 *  at which point we have exclusive access.
> +		 *  The runtime suspend path is special since it doesn't really hold any locks,
> +		 *  but instead has exclusive access by virtue of all other accesses requiring
> +		 *  holding the runtime pm wakeref.
> +		 */
> +		spinlock_t vram_userfault_lock;
> +
> +		/*
> +		 *  Keep list of userfaulted gem obj, which require to release their
> +		 *  mmap mappings at runtime suspend path.
> +		 */
> +		struct list_head vram_userfault_list;
> +
> +		bool vram_userfault_ongoing;
>  	} mem_access;
>  
>  	/** @d3cold: Encapsulate d3cold related stuff */
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 0f06d8304e17..51cde1db930e 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -172,6 +172,8 @@ void xe_pm_init(struct xe_device *xe)
>  	}
>  
>  	xe_pm_runtime_init(xe);
> +	INIT_LIST_HEAD(&xe->mem_access.vram_userfault_list);
> +	spin_lock_init(&xe->mem_access.vram_userfault_lock);
>  }
>  
>  void xe_pm_runtime_fini(struct xe_device *xe)
> @@ -205,6 +207,7 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
>  
>  int xe_pm_runtime_suspend(struct xe_device *xe)
>  {
> +	struct xe_bo *bo, *on;
>  	struct xe_gt *gt;
>  	u8 id;
>  	int err = 0;
> @@ -238,6 +241,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	 */
>  	lock_map_acquire(&xe_device_mem_access_lockdep_map);
>  
> +	list_for_each_entry_safe(bo, on,
> +				 &xe->mem_access.vram_userfault_list, vram_userfault_link)
> +		xe_bo_runtime_pm_release_mmap_offset(bo);
> +

other then the comments above I believe we should get the test that Anshuman
just sent, tweak it to ensure we cover this case and then give it a try.

>  	if (xe->d3cold.allowed) {
>  		err = xe_bo_evict_all(xe);
>  		if (err)
> -- 
> 2.25.1
> 
