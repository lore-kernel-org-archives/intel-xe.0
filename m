Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94420C6FD20
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 13:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DC310E5E1;
	Wed,  8 Mar 2023 13:37:32 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9A610E5E3
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 13:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678282651; x=1709818651;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kYEVslILPD80ZGqJqhbKcGlEFN9w/36unL7EADSlBuc=;
 b=CgJK2/rwKzJWURPhmGozC/uOoFvHUxkVDfCfwVUqoKtfSxK4YeE56oWV
 qhj27D9Pq7Xfrvei5hRqb8/Jq70hfPduy+PiSpY0E71WzOW89bJlKWuoQ
 ca+T8q3oRH+JENfMnukYzvcmLijcdiYGj0o7EU/sVzqDwX0NdAdd1c3CU
 YMgLgQBqlVMiHyTMI3ggjJQ9dgejP1r1AnfzRWNiaAe00LX86TVKvIWsB
 ebdA6ZJWJ1r7px9calDMhsdV5LqeUukFvzQ1y35Tl2BuBiN54estVhyjG
 XJpTtdhtjUHxgiuUB2QWzaofiIOyjuOVqr3+pYqlnTvYaknWxQs2onhfH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="319983331"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="319983331"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:37:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="765991454"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="765991454"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2023 05:37:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 05:37:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 05:37:27 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 05:37:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsjqmNWKcCxAcrKQjO39pWdioTRCronA3YTcNzTQLN8jBlH7BipfirZJQomBklS12asmPMNKR43g8JerZmYrys/9BRfVE7KRdHWHzqgDS3nJ1z5lW16c7zQf1v93v0129fDIpRcy9c/fZDaOhCbHY2GwrHpj7QyDQCBkzhOOo37mECtWPl9csUabDYC9Ol3qVtIbPrsT58jTBLuv2XCYx9ahSyZy1w78cLxDjInPxZPbP9lx3xXvJLJw+MzrMM8D63ryW7rtqetNH3lDaFv7SJ2q20GDbcOi6vMZcSXYM+gegKlnCFDbUeDT17vkK6KmmoVCh+xN7PQ0nnKyjtDq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCDbPIARSR+lM+EvIiOUn/KnxnIfYm/T8ydAx7/LhkE=;
 b=emgaliHmAxSSIBk7E2n3AwmJKnAJNs3kgu0wQGa4AaouKVYB6A9qhVbKElzhI5p+iH/WvqYC+PmPmH5TJmiPT/uSAUa5d26saw4DSy9v4jtgIFU3THEJv+T/qbypT8TbQq43FGFRd9ub70SxcoXsHrRv7L1kitI2mngciMQkg50Rmp/A7y3Ag16v5DuSC0H9Y7rfcudoABRxaP7bEQxOvqx8U07uGRcvzWotD6C1VLmyUaZG8z6UqaK35B7LwBKAHwxLMNhYRjHNDgqT52T5eEUpmuceVBa51RBpommIsczEesFxMYjmBmYGK1U73AUZuqJDsDQrWqNfBxA5BqQ22Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4982.namprd11.prod.outlook.com (2603:10b6:510:37::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 13:37:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 13:37:25 +0000
Date: Wed, 8 Mar 2023 08:37:14 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZAiPii3oKOzCSV2E@intel.com>
References: <20230308123012.247091-1-matthew.auld@intel.com>
 <20230308123012.247091-3-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230308123012.247091-3-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4982:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e78820-c80b-47e1-af6e-08db1fda4075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ohsAgEVQFDEahe+Bk6y8kQnoig3X0KLP8qvinKMBHF5WkxSalfWd+24gcR10Zdp0npkRYud6Dxixdp/fbd6vsKKqdPobqSDv17V0LA4XPsm244IOxTjmUDTP/fpXMH17C2AK0WjFZUmZK9k+Ueyqlcv+nOXR5QOUkRjNy9+mk2V5lfjD9kapVs116bO81amsZV9OhfgQg/teIaN1XyC/I/LHGIzYPyCrBOC879EXu5YOrCRpNl3DTIJvT/piyfx0K1ZSkKiz9OfxVN0T+b5Vaf65rlqAawUMnYKD0uyPnEkWuG5RAqNpyaMvwr+uGpGYvQWqfKR1HHis98iBzwkbkQkJ0eXmeF4zM+npIuHI5BPPf6FXIJrUVK3K/6BjklN5Zw2S/xkV5cv67qCEBjvkiTvJuIK5absLzN0nBoRLPvdJpBwspcenITi6uqSWrdJk3JDXZdd9Ok/6Zs/pYRPDB4a1yVfiUwTVD56Fkoz+QQxFidE8RLZKax4HZEZ5fnF3aIaIjWmhwFBIHPNxstgB40yOrmX6rVlGCTie4q2Un27Z6DryH6DgFus04b9MmWdgQGBH6x/d5H+mQyYATN/odtBFfKdubvNgLQC9quoLy5Mp3IJlNGWW3M+W43gjk/D9mrUYTKbwbeMwLpMnqi7CqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199018)(82960400001)(66476007)(66556008)(66946007)(8676002)(38100700002)(4326008)(316002)(37006003)(8936002)(6862004)(41300700001)(6636002)(6666004)(107886003)(83380400001)(478600001)(5660300002)(86362001)(44832011)(6486002)(6512007)(186003)(36756003)(6506007)(26005)(30864003)(2616005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vyuqPEr5ZanWX4imtUbx8t0GyOxq8WOmSPSI2tNqX54npWbZkxTb2ysdu6YX?=
 =?us-ascii?Q?RwMs63Cb7YLDxQ0SFIbqRSMSU4fIzhAcxb8HDV75d/6C+/wo/dbNIfSqata2?=
 =?us-ascii?Q?nfK+xmJ1OpqOeqFcC89BO7x4wOLX076fpHhtS5Q5b3MkNcrac4upi/x1+pf5?=
 =?us-ascii?Q?0uknA4BNJfUVxicarrdzU+gZ7QORt7i49trF54cOk2lXmM/I9pZSnf3UQX00?=
 =?us-ascii?Q?zJZZIcAwNAKptqWevT6gqydjAbXYAEnpYG+0bE1XcdKFjofZikAYGMnKz3US?=
 =?us-ascii?Q?aBQGECvYZys5Oic6HGOYr8zqau0n8ZprS46QIse92i6xipM6YZo4Ja5MFOnJ?=
 =?us-ascii?Q?EuuF4YeLYXXYOK30ZLJngp02nyYGChkmsGnJtYsGfjAAxfc+9orVRPJtkCkf?=
 =?us-ascii?Q?xU166wf6L5/U3ceHfIdN+F2bCoJ1h+GMd48DBcDMrP17k7fYGSjMDSAW6hFX?=
 =?us-ascii?Q?u5oChFmHDDhBjzZHJuzq1/oUs2fkUjObDbBJReK1jGRhOArVNzO50k7skuYM?=
 =?us-ascii?Q?VUed+On5v8aPOAsiCI9YytKCX83e4oB2gf4enzdLTv4qlFPuQ8zKHxv9L/8G?=
 =?us-ascii?Q?ExV7SI1jbym6+2jTO7fKdD3w2VvkcApQinPZYNXhahZzZWntDfhq60o4RlBh?=
 =?us-ascii?Q?vj3OlpMdAPOPswgmM2u37A0nA3WZfmzOc8GmGYqZBRDfYxVgdCHo24Tvh6F5?=
 =?us-ascii?Q?Uq/mthAHcfmkeiAgqoBTcMRI5dsm+36X6CJ/tPxZf/oEie1QRKg/m/GWi62F?=
 =?us-ascii?Q?Ub6RBPdatlKGrtND1e1/014nT7VqMNouoDpojo/WHPxCIJDRQaU/wCcc2n3r?=
 =?us-ascii?Q?4IcnNTAUTuo9NLWnA66Aw0jja3PvOnmFZ1zpjwTPFGlhkYApD2KPsxoIBlAj?=
 =?us-ascii?Q?BwIcfhHAFwbPWjQUvCPA+jOBu0qWtnbcmrjya6Vh8wyD8PYmDG49AgMn55kX?=
 =?us-ascii?Q?5N1ceDsS1CYZAc59Vr5pMojogdnLfvAAcgbRiepYdbNKPj7WC//r91aZN76r?=
 =?us-ascii?Q?zpoE8QwY7E0LmnB1h2QmFjof+vxx8juRqPg4pMEx3I7B4xVKy4hq5goEeiPz?=
 =?us-ascii?Q?azH0vIS5ItDndGaf287N1GE9Vs/Y+V3O8aj5iq+SiUc9xZLf/jV8/9GosYYC?=
 =?us-ascii?Q?FoAI1yr/b3KQLg5dTtJHdMGdu2XelJdDvAK7x4P7KgJk289hF8B8glctvoQV?=
 =?us-ascii?Q?AiyyFhG98RoU/wgRfXjAfhzInOjJihr0Cj4oUtq3jWrVD2WKbQcIR1uTp7qF?=
 =?us-ascii?Q?vL9OcgY/J3/ktn7D/Q8CCAxpJpYxGCRji/jy6WaYkmZA5qMEOzmBu/teR3Oo?=
 =?us-ascii?Q?DVIeEua6BQWkMDryh61+9glp71PUo7Cdkp5Srce64rItAO7dtkC4fbOMQv3A?=
 =?us-ascii?Q?n0+ZXIAQp+IOgm1GIUE1mzvaA+qzkneBEeePpbc5Qsc6kI688Bqf/3z7Abqu?=
 =?us-ascii?Q?eaHjlHk3UbiE57N2HsVGWcSi83QgJvuztjRxI2vTEK4NMAht0U3tK2VonCbM?=
 =?us-ascii?Q?z3TgOms8ZhWnvEIbtHjzUV/amXa74nHwuT6CQe+wGu2DWqg4Ya1Rz9nWwapc?=
 =?us-ascii?Q?GlMDu5QDVoEFooBaJJHHLG3qJVUrUts3UwZkfkQVXFGP6dsrJuvVwqmPlgU3?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e78820-c80b-47e1-af6e-08db1fda4075
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 13:37:25.2231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDhwTkz+f5RHF3DyBM45RshKG+5331j9p2FmxOjJ1rOgoFNhJCf76sFxah6hi3hF5OPA8D3EvUuyRzYq/kGNYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4982
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/6] drm/xe: s/lmem/vram/
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 08, 2023 at 12:30:08PM +0000, Matthew Auld wrote:
> This seems to be the preferred nomenclature in xe. Currently we are
> intermixing vram and lmem, which is confusing.

I honestly like local memory or device memory term better since it
opposes nicely to the system memory... But well, VRAM aligns better
with TTM.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> v2 (Gwan-gyeong Mun & Lucas):
>   - Rather apply to the entire driver
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.debug      |  2 +-
>  drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
>  drivers/gpu/drm/xe/xe_bo.c            | 10 +++----
>  drivers/gpu/drm/xe/xe_bo.h            |  6 ++--
>  drivers/gpu/drm/xe/xe_ggtt.c          |  6 ++--
>  drivers/gpu/drm/xe/xe_migrate.c       | 12 ++++----
>  drivers/gpu/drm/xe/xe_mmio.c          | 40 +++++++++++++--------------
>  drivers/gpu/drm/xe/xe_module.c        |  6 ++--
>  drivers/gpu/drm/xe/xe_module.h        |  2 +-
>  drivers/gpu/drm/xe/xe_pt.c            | 12 ++++----
>  drivers/gpu/drm/xe/xe_vm.c            | 10 +++----
>  11 files changed, 54 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index 565be3f6b9b9..93b284cdd0a2 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -41,7 +41,7 @@ config DRM_XE_DEBUG_VM
>  	  If in doubt, say "N".
>  
>  config DRM_XE_DEBUG_MEM
> -	bool "Enable passing SYS/LMEM addresses to user space"
> +	bool "Enable passing SYS/VRAM addresses to user space"
>  	default n
>  	help
>  	  Pass object location trough uapi. Intended for extended
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index b7e4a126e8b7..ac659b94e7f5 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -129,7 +129,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>  	}
>  	dma_fence_put(fence);
>  
> -	/* Try to copy 0xc0 from sysmem to lmem with 2MB or 64KiB/4KiB pages */
> +	/* Try to copy 0xc0 from sysmem to vram with 2MB or 64KiB/4KiB pages */
>  	xe_map_memset(xe, &sysmem->vmap, 0, 0xc0, sysmem->size);
>  	xe_map_memset(xe, &bo->vmap, 0, 0xd0, bo->size);
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 876f77669104..73a7f2cd4ad8 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1290,12 +1290,12 @@ int xe_bo_pin(struct xe_bo *bo)
>  	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
>  	    bo->flags & XE_BO_INTERNAL_TEST)) {
>  		struct ttm_place *place = &(bo->placements[0]);
> -		bool lmem;
> +		bool vram;
>  
>  		if (mem_type_is_vram(place->mem_type)) {
>  			XE_BUG_ON(!(place->flags & TTM_PL_FLAG_CONTIGUOUS));
>  
> -			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE, &lmem) -
> +			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE, &vram) -
>  				       vram_region_io_offset(bo)) >> PAGE_SHIFT;
>  			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
>  
> @@ -1415,7 +1415,7 @@ bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
>  }
>  
>  dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
> -		      size_t page_size, bool *is_lmem)
> +		      size_t page_size, bool *is_vram)
>  {
>  	struct xe_res_cursor cur;
>  	u64 page;
> @@ -1427,9 +1427,9 @@ dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
>  	page = offset >> PAGE_SHIFT;
>  	offset &= (PAGE_SIZE - 1);
>  
> -	*is_lmem = xe_bo_is_vram(bo);
> +	*is_vram = xe_bo_is_vram(bo);
>  
> -	if (!*is_lmem && !xe_bo_is_stolen(bo)) {
> +	if (!*is_vram && !xe_bo_is_stolen(bo)) {
>  		XE_BUG_ON(!bo->ttm.ttm);
>  
>  		xe_res_first_sg(xe_bo_get_sg(bo), page << PAGE_SHIFT,
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 0699b2b4c5ca..f841e74cd417 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -196,14 +196,14 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>  
>  bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo);
>  dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
> -		      size_t page_size, bool *is_lmem);
> +		      size_t page_size, bool *is_vram);
>  
>  static inline dma_addr_t
>  xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
>  {
> -	bool is_lmem;
> +	bool is_vram;
>  
> -	return xe_bo_addr(bo, 0, page_size, &is_lmem);
> +	return xe_bo_addr(bo, 0, page_size, &is_vram);
>  }
>  
>  static inline u32
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index a0d672b6afb2..a430d1568890 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -28,12 +28,12 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
>  	u64 pte;
> -	bool is_lmem;
> +	bool is_vram;
>  
> -	pte = xe_bo_addr(bo, bo_offset, GEN8_PAGE_SIZE, &is_lmem);
> +	pte = xe_bo_addr(bo, bo_offset, GEN8_PAGE_SIZE, &is_vram);
>  	pte |= GEN8_PAGE_PRESENT;
>  
> -	if (is_lmem)
> +	if (is_vram)
>  		pte |= GEN12_GGTT_PTE_LM;
>  
>  	/* FIXME: vfunc + pass in caching rules */
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index bc69ec17d5ad..c0523d8fe944 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -222,15 +222,15 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
>  			level++;
>  		}
>  	} else {
> -		bool is_lmem;
> -		u64 batch_addr = xe_bo_addr(batch, 0, GEN8_PAGE_SIZE, &is_lmem);
> +		bool is_vram;
> +		u64 batch_addr = xe_bo_addr(batch, 0, GEN8_PAGE_SIZE, &is_vram);
>  
>  		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>  
>  		if (xe->info.supports_usm) {
>  			batch = gt->usm.bb_pool.bo;
>  			batch_addr = xe_bo_addr(batch, 0, GEN8_PAGE_SIZE,
> -						&is_lmem);
> +						&is_vram);
>  			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>  		}
>  	}
> @@ -933,12 +933,12 @@ static void write_pgtable(struct xe_gt *gt, struct xe_bb *bb, u64 ppgtt_ofs,
>  	 */
>  	XE_BUG_ON(update->qwords > 0x1ff);
>  	if (!ppgtt_ofs) {
> -		bool is_lmem;
> +		bool is_vram;
>  
>  		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo, 0,
>  							   GEN8_PAGE_SIZE,
> -							   &is_lmem));
> -		XE_BUG_ON(!is_lmem);
> +							   &is_vram));
> +		XE_BUG_ON(!is_vram);
>  	}
>  
>  	do {
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 65b0df9bb579..e5bd4609aaee 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -68,7 +68,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>  	return 1;
>  }
>  
> -static int xe_resize_lmem_bar(struct xe_device *xe, resource_size_t lmem_size)
> +static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct pci_bus *root = pdev->bus;
> @@ -78,31 +78,31 @@ static int xe_resize_lmem_bar(struct xe_device *xe, resource_size_t lmem_size)
>  	u32 pci_cmd;
>  	int i;
>  	int ret;
> -	u64 force_lmem_bar_size = xe_force_lmem_bar_size;
> +	u64 force_vram_bar_size = xe_force_vram_bar_size;
>  
>  	current_size = roundup_pow_of_two(pci_resource_len(pdev, GEN12_LMEM_BAR));
>  
> -	if (force_lmem_bar_size) {
> +	if (force_vram_bar_size) {
>  		u32 bar_sizes;
>  
> -		rebar_size = force_lmem_bar_size * (resource_size_t)SZ_1M;
> +		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
>  		bar_sizes = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
>  
>  		if (rebar_size == current_size)
>  			return 0;
>  
>  		if (!(bar_sizes & BIT(pci_rebar_bytes_to_size(rebar_size))) ||
> -		    rebar_size >= roundup_pow_of_two(lmem_size)) {
> -			rebar_size = lmem_size;
> +		    rebar_size >= roundup_pow_of_two(vram_size)) {
> +			rebar_size = vram_size;
>  			drm_info(&xe->drm,
>  				 "Given bar size is not within supported size, setting it to default: %llu\n",
> -				 (u64)lmem_size >> 20);
> +				 (u64)vram_size >> 20);
>  		}
>  	} else {
>  		rebar_size = current_size;
>  
> -		if (rebar_size != roundup_pow_of_two(lmem_size))
> -			rebar_size = lmem_size;
> +		if (rebar_size != roundup_pow_of_two(vram_size))
> +			rebar_size = vram_size;
>  		else
>  			return 0;
>  	}
> @@ -117,7 +117,7 @@ static int xe_resize_lmem_bar(struct xe_device *xe, resource_size_t lmem_size)
>  	}
>  
>  	if (!root_res) {
> -		drm_info(&xe->drm, "Can't resize LMEM BAR - platform support is missing\n");
> +		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing\n");
>  		return -1;
>  	}
>  
> @@ -168,7 +168,7 @@ int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size, u64 *usable_si
>  	if (usable_size) {
>  		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
>  		*usable_size = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64K;
> -		drm_info(&xe->drm, "lmem_size: 0x%llx usable_size: 0x%llx\n",
> +		drm_info(&xe->drm, "vram_size: 0x%llx usable_size: 0x%llx\n",
>  			 *vram_size, *usable_size);
>  	}
>  
> @@ -180,7 +180,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct xe_gt *gt;
>  	u8 id;
> -	u64 lmem_size;
> +	u64 vram_size;
>  	u64 original_size;
>  	u64 current_size;
>  	u64 usable_size;
> @@ -207,29 +207,29 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  	gt = xe_device_get_gt(xe, 0);
>  	original_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>  
> -	err = xe_mmio_total_vram_size(xe, &lmem_size, &usable_size);
> +	err = xe_mmio_total_vram_size(xe, &vram_size, &usable_size);
>  	if (err)
>  		return err;
>  
> -	resize_result = xe_resize_lmem_bar(xe, lmem_size);
> +	resize_result = xe_resize_vram_bar(xe, vram_size);
>  	current_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>  	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
>  
> -	xe->mem.vram.size = min(current_size, lmem_size);
> +	xe->mem.vram.size = min(current_size, vram_size);
>  
>  	if (!xe->mem.vram.size)
>  		return -EIO;
>  
>  	if (resize_result > 0)
> -		drm_info(&xe->drm, "Successfully resize LMEM from %lluMiB to %lluMiB\n",
> +		drm_info(&xe->drm, "Successfully resize VRAM from %lluMiB to %lluMiB\n",
>  			 (u64)original_size >> 20,
>  			 (u64)current_size >> 20);
> -	else if (xe->mem.vram.size < lmem_size && !xe_force_lmem_bar_size)
> +	else if (xe->mem.vram.size < vram_size && !xe_force_vram_bar_size)
>  		drm_info(&xe->drm, "Using a reduced BAR size of %lluMiB. Consider enabling 'Resizable BAR' support in your BIOS.\n",
>  			 (u64)xe->mem.vram.size >> 20);
> -	if (xe->mem.vram.size < lmem_size)
> +	if (xe->mem.vram.size < vram_size)
>  		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
> -			 lmem_size, (u64)xe->mem.vram.size);
> +			 vram_size, (u64)xe->mem.vram.size);
>  
>  	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.size);
>  	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
> @@ -360,7 +360,7 @@ int xe_mmio_init(struct xe_device *xe)
>  	 * and we should not continue with driver initialization.
>  	 */
>  	if (IS_DGFX(xe) && !(xe_mmio_read32(gt, GU_CNTL.reg) & LMEM_INIT)) {
> -		drm_err(&xe->drm, "LMEM not initialized by firmware\n");
> +		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
>  		return -ENODEV;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 5a51a9959eff..6860586ce7f8 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -22,9 +22,9 @@ bool enable_display = true;
>  module_param_named(enable_display, enable_display, bool, 0444);
>  MODULE_PARM_DESC(enable_display, "Enable display");
>  
> -u32 xe_force_lmem_bar_size;
> -module_param_named(lmem_bar_size, xe_force_lmem_bar_size, uint, 0600);
> -MODULE_PARM_DESC(lmem_bar_size, "Set the lmem bar size(in MiB)");
> +u32 xe_force_vram_bar_size;
> +module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
> +MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
>  
>  int xe_guc_log_level = 5;
>  module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 2c6ee46f5595..86916c176382 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -8,6 +8,6 @@
>  /* Module modprobe variables */
>  extern bool enable_guc;
>  extern bool enable_display;
> -extern u32 xe_force_lmem_bar_size;
> +extern u32 xe_force_vram_bar_size;
>  extern int xe_guc_log_level;
>  extern char *xe_param_force_probe;
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 06fc7b206997..dfd97b0ec42a 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -62,12 +62,12 @@ u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  		    const enum xe_cache_level level)
>  {
>  	u64 pde;
> -	bool is_lmem;
> +	bool is_vram;
>  
> -	pde = xe_bo_addr(bo, bo_offset, GEN8_PAGE_SIZE, &is_lmem);
> +	pde = xe_bo_addr(bo, bo_offset, GEN8_PAGE_SIZE, &is_vram);
>  	pde |= GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
>  
> -	XE_WARN_ON(IS_DGFX(xe_bo_device(bo)) && !is_lmem);
> +	XE_WARN_ON(IS_DGFX(xe_bo_device(bo)) && !is_vram);
>  
>  	/* FIXME: I don't think the PPAT handling is correct for MTL */
>  
> @@ -80,13 +80,13 @@ u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  }
>  
>  static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
> -			   size_t page_size, bool *is_lmem)
> +			   size_t page_size, bool *is_vram)
>  {
>  	if (xe_vma_is_userptr(vma)) {
>  		struct xe_res_cursor cur;
>  		u64 page;
>  
> -		*is_lmem = false;
> +		*is_vram = false;
>  		page = offset >> PAGE_SHIFT;
>  		offset &= (PAGE_SIZE - 1);
>  
> @@ -94,7 +94,7 @@ static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
>  				&cur);
>  		return xe_res_dma(&cur) + offset;
>  	} else {
> -		return xe_bo_addr(vma->bo, offset, page_size, is_lmem);
> +		return xe_bo_addr(vma->bo, offset, page_size, is_vram);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a0e35627e45e..6cf7172e84cc 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3355,7 +3355,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>  {
>  	struct rb_node *node;
> -	bool is_lmem;
> +	bool is_vram;
>  	uint64_t addr;
>  
>  	if (!down_read_trylock(&vm->lock)) {
> @@ -3363,8 +3363,8 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>  		return 0;
>  	}
>  	if (vm->pt_root[gt_id]) {
> -		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, GEN8_PAGE_SIZE, &is_lmem);
> -		drm_printf(p, " VM root: A:0x%llx %s\n", addr, is_lmem ? "LMEM" : "SYS");
> +		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, GEN8_PAGE_SIZE, &is_vram);
> +		drm_printf(p, " VM root: A:0x%llx %s\n", addr, is_vram ? "VRAM" : "SYS");
>  	}
>  
>  	for (node = rb_first(&vm->vmas); node; node = rb_next(node)) {
> @@ -3377,11 +3377,11 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>  			xe_res_first_sg(vma->userptr.sg, 0, GEN8_PAGE_SIZE, &cur);
>  			addr = xe_res_dma(&cur);
>  		} else {
> -			addr = xe_bo_addr(vma->bo, 0, GEN8_PAGE_SIZE, &is_lmem);
> +			addr = xe_bo_addr(vma->bo, 0, GEN8_PAGE_SIZE, &is_vram);
>  		}
>  		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
>  			   vma->start, vma->end, vma->end - vma->start + 1ull,
> -			   addr, is_userptr ? "USR" : is_lmem ? "VRAM" : "SYS");
> +			   addr, is_userptr ? "USR" : is_vram ? "VRAM" : "SYS");
>  	}
>  	up_read(&vm->lock);
>  
> -- 
> 2.39.2
> 
