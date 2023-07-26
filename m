Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC94C001B0
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F8C10E49D;
	Wed, 26 Jul 2023 16:54:51 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44F210E49D
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690390488; x=1721926488;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BjaN0Q0MOgZtgAY8mvRuQWo/gEzwBGm0ozxQCRcl/4M=;
 b=LiAGdC44Er8OpKQF851UyFAs9KQXLWfrg2OmX7JmQXKHgoxVpJ0dUECW
 FDWp3k71ElVwKWTxy95Piau7vVkiAbmiop4UPNg8BDQu36cPapo4LtKwo
 BkMAdOTwElwmvC46fKGA2dKluSbZBNRfD6Neo+PxPhayYuQI6JvQf54rh
 /h04Y1TGUrZPhzOJTIK+O138X9s80KQQs11DeBtTHg99DwTV4HK7UdtbI
 6nIv2cLP2e5V6UMos3ECCK97uPaUQCQwHDCKylp9t3ZZ393txENPkEVPN
 uJoKvPL8zbHBw5R1eAx5ktPeJYGRaljXbOV1sMzVLj7lHwfeqIMyub0XG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="347684787"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="347684787"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="791950965"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="791950965"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 26 Jul 2023 09:54:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 09:54:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 09:54:41 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 09:54:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwtHEmJY6kWwzrs9fbV3uQR6ZnMra6WfdTbWPJPfPqavkvy+J0sHaM139henKlzshGV0z3EgrsTJXEZWMrUk7yoLX2U5NhChPSCw7Cpm8OBKB2KtqulehIppWvpfeNnZPfMBFJ6gzUGRKfPbN8UTXZLP7kkP4M/9xLIwsNizxAMqpuCRHofz39badB7hv6BPWKLMLbppUhrK09VZIUWBSbakN/NeWREbHAnsfMWgRChHOMWruh86rbhdRBxByCOcSWAnZv4jzGpKj8JqoP8MPF3pGXExvZxqXas2gRGHmeCs1obZlzQzfFtBp8BNfbh0k7wj9gN0NToU9yoLIGPmrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBB2cqqYi+2A79YfVF+N5hiDXUW8PWAoeJCmElgL3AY=;
 b=U2GUUpMW2xJXhYkR3hWwNp1MbxnpzAhKAApSuRg5ZoCgHX5aTVede3xIUnnhpN7ipdblbV9xJX/HZJwcGP1ujAH/0PGWw1+RvshfuTcU8+SHtO07qnGmmL9SQWpV0Rvjz3yDe4YfaLYk76DlgJDYHVo+wmFQ7QWjeRp4oElbekh5GLm8OpCVk5FyEvDRuKKNhlblvkrfoQSAGw9PkS+w8cSokE7NQhplzWtQq/lBPim98y1Fvk5ppYdRUXs9EX54y+NKYkoEqSdE890vgudGLgSzE2jvaz6CuIOiKygiwRiVbZKUJ1/BDvu8y1NcOIlccAbomemWvBcnhAdWZqd/YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6673.namprd11.prod.outlook.com (2603:10b6:510:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 16:54:38 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 16:54:38 +0000
Date: Wed, 26 Jul 2023 09:54:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230726165434.GN138014@mdroper-desk1.amr.corp.intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
 <20230726160708.3967790-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726160708.3967790-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: 4224e04b-e2bf-4ff5-f01f-08db8df8ff50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VBeavMmdMIvFJBCHUHZBDXQANixIbVcmf4/fOrJP/scVJ0bIoc17ekYlv64o7AnLgzGy3xymnC6GU3IqUMeineh0gbfYri2fhLQ+f5LWZsqVS1OahyGl6LXJ3vxy4VKDJsrSlvNqlbQ3DHeSRrKldknrQ0sxyzyOg6BTVOgJA4U9g+m5s8pM+7PT7lzJfQJjixZwSnmefSVXmyaKh7urBiBc9mLb2tX23a85A23tA/j3JRVLNOQRta8phaBJyDLHsltqNJ2hO46pxUJ2oolu1QW9tnkd2KUbR0EkAO+PSNulmsj+9e8DO3S27jXzF0ndOJ7vnViBq+I6cp7hom2ms8OwIQ7caKxre7cmzEueFch8RokO0S6eJdbAKTxX6ZrCLJiRryt58nTsHaUCmKHl7wF+/4OgSQrhuXyG+TzpikjthteBa4x3Z+LJ9ITRxCFrkc4cEdCwQ+ZjEuO+SnETsPmYG5Lc3RV820T0pnDNTYfWbDfF8zMe/XY8RjaYivczPVNnJFzkzokQlmG2Z4V9Kiy3fCTuMnEzFi3PM32ZD2Vs8ie0pzI457KucHLvOzVT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199021)(2906002)(66946007)(66556008)(66476007)(54906003)(82960400001)(6666004)(83380400001)(86362001)(33656002)(38100700002)(478600001)(186003)(6512007)(6486002)(26005)(6506007)(1076003)(41300700001)(316002)(5660300002)(4326008)(6636002)(8936002)(8676002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ryTyYfre0BaBxsySehyKbAJ2rgEBn93iRqlSuaAE9+9kTgKexYqDUY7xg588?=
 =?us-ascii?Q?92+vyMsy1Ln0V5Udd/thA7q+3h4nz2YHxvqsscnO2cBRE3ANnW5GAZ73uHr5?=
 =?us-ascii?Q?nDivxoA4YDxiAeqnosQL7ZYUcwze/pz87QrdSIktbOPqkO5Uf6OZYCfEhSVB?=
 =?us-ascii?Q?3LdyAapkbS5TLv/dc798FR95HOqUxZPLkkXk7jDOB2rdEmiFUVHu+U9pZy+z?=
 =?us-ascii?Q?Ui/21sGn3p5GDhrnJsO7IPi6RzHO9ysXgc8OUPhhqxwjdww31QU6SsM59syr?=
 =?us-ascii?Q?Tojrlw3wUncSUQPmU85Mazhrp70qKrTSjPsGLyRBexymY0Zfda0LRYL3aLxu?=
 =?us-ascii?Q?98dcq25v0DJiqjpeYwll1PvBvGCibPc0CIgfd/Kx6/1c9v/ryFaNJZDSsxDm?=
 =?us-ascii?Q?mcvcTLH4Z9SeIOY1CrGwN8QEcbj+r35/iGqLxJJB+r2yUaeB3A5JMsWf5FMX?=
 =?us-ascii?Q?Zo3XNbd7fx2BEplqvVf/Oowf+O5mjQ74h54LaIiX2pMEmIr2EQlV6vDj1Sc1?=
 =?us-ascii?Q?ZnBETbTktwWaFu31YXXKuQRtjpOOG+lpngHp9pNcNQYF/6wnFpCtCPtaU1/c?=
 =?us-ascii?Q?ppU9z5bACGpx1cZrX5n0F2E8WcpFMNa+oqMok03B5cfmq8LrZo72y9dvoVCw?=
 =?us-ascii?Q?WEndWRcQRnajefCYstv6Rw+SOXTa87C+YwSphGS+XttB0cUDehgkacvyJ1sM?=
 =?us-ascii?Q?06y5UY3pQJ5bZnWuJGktzg6o85hsqbjcHxE9UrsUAvIH6J9rRDDwVHoIfo1L?=
 =?us-ascii?Q?KGuv0nCkH2Zgh++xj+zGs73JGGiMw8ABDL0UeAxBiE+Zj5QTwNdaAK/aLQZr?=
 =?us-ascii?Q?6QUSEnrTY8ok3YV/r1TrsaaOwI3NHDdcRK4S4V/JnWLAu5nQDg6xVRhFcRW+?=
 =?us-ascii?Q?5P6DogoaODTEdWHzff0t9SaC/J9B7V3EG0d3v1k5bI61BRMF1me0pCPShpvu?=
 =?us-ascii?Q?nRuNw8AsGy6kfLOJxGlDenISLByztzXWSstLTORVtf1Gk83zebuOdOejwxrT?=
 =?us-ascii?Q?mctwnrd8n0t9LkemoDMKxuYwKnp5on0a29CerJ0tyhgq0HuD3UI0lquHkY8q?=
 =?us-ascii?Q?XUBx9UHoexwTxI5O0IQtD/zGKfnUVhtHeB/KbQMIsZDwSaNObDsi+m7Yl/Ps?=
 =?us-ascii?Q?5K7Gjoxmj6fetIpm/YXvb6ArRp9lqPafJeti8RJpuz+F6CZbX+iFscAlWRn6?=
 =?us-ascii?Q?cTTCn/lY9VbWfqMLfCwvx0Ti19OJB7Sw4uZk2JgCCPEBlcqPQ1muMriRDjVu?=
 =?us-ascii?Q?A9bZLL8cfnbKonyvDFWadaA/+NBU/KPxTYvoj5MuRJymEOCnKFkD7eODXg4b?=
 =?us-ascii?Q?9asdofKShCG0CieYhQBj3llA+3BrrHvTtGm7Ab1MqbHI7tNM+HFhIEMSLl2D?=
 =?us-ascii?Q?KchSv1R0H+/8P93Gnkgsm3RPH+VOkRb4vxuk+iZr2LaR2KunTWtUE7ElXURd?=
 =?us-ascii?Q?p+hmEfl27Kj55JuZADdYudrghvOk3J26MMdoVHSnVyj9OSp0zUap9qw9dbFt?=
 =?us-ascii?Q?xP2ZOmCsDknolqhr+5ZJN+dliiMaw2mqxlfIJ/LjjR4dQNzkU5IUPFhitlN5?=
 =?us-ascii?Q?SnkTYMO53Rz4tgrWSNNTyPBPEF6J4BxDvZykxbUTjNotVDK1noxPwL6L61Ql?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4224e04b-e2bf-4ff5-f01f-08db8df8ff50
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 16:54:37.9503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0qMdKsAPD7g0Tv/p4Hkx0K/QQ9GQoEdXrCe5huQ9WxYPswkQkLZju1V/ZzpDuOtytcjI2y2WYuxp2uNMxulXWwlzhq0cl4BjOLBMF2oOrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6673
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/10] drm/xe: Decouple vram check from
 xe_bo_addr()
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 09:07:03AM -0700, Lucas De Marchi wrote:
> The output arg is_vram in xe_bo_addr() is unused by several callers.
> It's also not what the function is mainly doing. Remove the argument and
> let the interested callers to call xe_bo_is_vram().
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c |  4 +---
>  drivers/gpu/drm/xe/xe_bo.c                 | 15 +++++----------
>  drivers/gpu/drm/xe/xe_bo.h                 | 10 +++-------
>  drivers/gpu/drm/xe/xe_ggtt.c               |  5 ++---
>  drivers/gpu/drm/xe/xe_migrate.c            | 16 ++++------------
>  drivers/gpu/drm/xe/xe_pt.c                 | 10 +++-------
>  drivers/gpu/drm/xe/xe_vm.c                 | 10 ++++++----
>  7 files changed, 24 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index a4f30773e314..f38d5c114a9d 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -369,14 +369,12 @@ static int intelfb_create(struct drm_fb_helper *helper,
>  
>  #else
>  	if (!(obj->flags & XE_BO_CREATE_SYSTEM_BIT)) {
> -		bool lmem;
> -
>  		if (obj->flags & XE_BO_CREATE_STOLEN_BIT)
>  			info->fix.smem_start = xe_ttm_stolen_io_offset(obj, 0);
>  		else
>  			info->fix.smem_start =
>  				pci_resource_start(pdev, 2) +
> -				xe_bo_addr(obj, 0, XE_PAGE_SIZE, &lmem);
> +				xe_bo_addr(obj, 0, XE_PAGE_SIZE);
>  
>  		info->fix.smem_len = obj->ttm.base.size;
>  	} else {
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6a96cb0689c4..29813271cc4c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1516,12 +1516,11 @@ int xe_bo_pin(struct xe_bo *bo)
>  	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
>  	    bo->flags & XE_BO_INTERNAL_TEST)) {
>  		struct ttm_place *place = &(bo->placements[0]);
> -		bool vram;
>  
>  		if (mem_type_is_vram(place->mem_type)) {
>  			XE_BUG_ON(!(place->flags & TTM_PL_FLAG_CONTIGUOUS));
>  
> -			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE, &vram) -
> +			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE) -
>  				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
>  			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
>  
> @@ -1646,8 +1645,7 @@ bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
>   * address, such as printing debug information, but not in cases where memory is
>   * written based on this result.
>   */
> -dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
> -		      size_t page_size, bool *is_vram)
> +dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
>  {
>  	struct xe_res_cursor cur;
>  	u64 page;
> @@ -1656,9 +1654,7 @@ dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
>  	page = offset >> PAGE_SHIFT;
>  	offset &= (PAGE_SIZE - 1);
>  
> -	*is_vram = xe_bo_is_vram(bo);
> -
> -	if (!*is_vram && !xe_bo_is_stolen(bo)) {
> +	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
>  		XE_BUG_ON(!bo->ttm.ttm);
>  
>  		xe_res_first_sg(xe_bo_get_sg(bo), page << PAGE_SHIFT,
> @@ -1673,12 +1669,11 @@ dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
>  	}
>  }
>  
> -dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
> -		      size_t page_size, bool *is_vram)
> +dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
>  {
>  	if (!READ_ONCE(bo->ttm.pin_count))
>  		xe_bo_assert_held(bo);
> -	return __xe_bo_addr(bo, offset, page_size, is_vram);
> +	return __xe_bo_addr(bo, offset, page_size);
>  }
>  
>  int xe_bo_vmap(struct xe_bo *bo)
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 3fed3e18c223..894ea0deb34b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -207,17 +207,13 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>  }
>  
>  bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo);
> -dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
> -		      size_t page_size, bool *is_vram);
> -dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
> -		      size_t page_size, bool *is_vram);
> +dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size);
> +dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size);
>  
>  static inline dma_addr_t
>  xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
>  {
> -	bool is_vram;
> -
> -	return xe_bo_addr(bo, 0, page_size, &is_vram);
> +	return xe_bo_addr(bo, 0, page_size);
>  }
>  
>  static inline u32
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index e1b84bc25375..f57dd8703d93 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -31,12 +31,11 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
>  	u64 pte;
> -	bool is_vram;
>  
> -	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE, &is_vram);
> +	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>  	pte |= XE_PAGE_PRESENT;
>  
> -	if (is_vram)
> +	if (xe_bo_is_vram(bo))
>  		pte |= XE_GGTT_PTE_LM;
>  
>  	/* FIXME: vfunc + pass in caching rules */
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 3c7d5cfd30bc..2a4b22c3a024 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -132,7 +132,6 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
>  	struct xe_device *xe = vm->xe;
>  	size_t cleared_size;
>  	u64 vram_addr;
> -	bool is_vram;
>  
>  	if (!xe_device_has_flat_ccs(xe))
>  		return 0;
> @@ -147,8 +146,7 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
>  		return PTR_ERR(m->cleared_bo);
>  
>  	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
> -	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE, &is_vram);
> -	XE_BUG_ON(!is_vram);

Should we keep the assertion here (but as a warning rather than a bug)?

       drm_WARN_ON(&xe->drm, !xe_bo_is_vram(m->cleared_bo)); 

> +	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
>  	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
>  
>  	return 0;
> @@ -221,15 +219,13 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  			level++;
>  		}
>  	} else {
> -		bool is_vram;
> -		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE, &is_vram);
> +		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>  
>  		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>  
>  		if (xe->info.supports_usm) {
>  			batch = tile->primary_gt->usm.bb_pool->bo;
> -			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE,
> -						&is_vram);
> +			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>  			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>  		}
>  	}
> @@ -1000,12 +996,8 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>  	 */
>  	XE_BUG_ON(update->qwords > 0x1ff);
>  	if (!ppgtt_ofs) {
> -		bool is_vram;
> -
>  		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo, 0,
> -							   XE_PAGE_SIZE,
> -							   &is_vram));
> -		XE_BUG_ON(!is_vram);

Same here.

> +							   XE_PAGE_SIZE));
>  	}
>  
>  	do {
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index ac01bc42e54f..38ccc96c4584 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -61,13 +61,10 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  		  const enum xe_cache_level level)
>  {
>  	u64 pde;
> -	bool is_vram;
>  
> -	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE, &is_vram);
> +	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>  	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
>  
> -	XE_WARN_ON(IS_DGFX(xe_bo_device(bo)) && !is_vram);

And here.

> -
>  	/* FIXME: I don't think the PPAT handling is correct for MTL */
>  
>  	if (level != XE_CACHE_NONE)
> @@ -128,10 +125,9 @@ u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
>  		  u32 pt_level)
>  {
>  	u64 pte;
> -	bool is_vram;
>  
> -	pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE, &is_vram);
> -	if (is_vram)
> +	pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
> +	if (xe_bo_is_vram(bo))
>  		pte |= XE_PPGTT_PTE_LM;
>  
>  	return __pte_encode(pte, cache, NULL, pt_level);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6429d6e5113d..87f32cfc475a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3497,9 +3497,10 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>  		return 0;
>  	}
>  	if (vm->pt_root[gt_id]) {
> -		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, XE_PAGE_SIZE,
> -				  &is_vram);
> -		drm_printf(p, " VM root: A:0x%llx %s\n", addr, is_vram ? "VRAM" : "SYS");
> +		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, XE_PAGE_SIZE);
> +		is_vram = xe_bo_is_vram(vm->pt_root[gt_id]->bo);
> +		drm_printf(p, " VM root: A:0x%llx %s\n", addr,
> +			   is_vram ? "VRAM" : "SYS");
>  	}
>  
>  	drm_gpuva_for_each_va(gpuva, &vm->mgr) {
> @@ -3520,7 +3521,8 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>  				addr = 0;
>  			}
>  		} else {
> -			addr = __xe_bo_addr(xe_vma_bo(vma), 0, XE_PAGE_SIZE, &is_vram);
> +			addr = __xe_bo_addr(xe_vma_bo(vma), 0, XE_PAGE_SIZE);
> +			is_vram = xe_bo_is_vram(xe_vma_bo(vma));

This is an accurate transformation of the existing code, but is that
code setting is_vram everywhere it should be?  Shouldn't the null vma
and userptr branches be setting is_vram to false rather than just
leaving it at whatever value it already had?

Anyway, aside from possible restoring the various assertions that were
removed, the changes look correct to me.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  		}
>  		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
>  			   xe_vma_start(vma), xe_vma_end(vma) - 1,
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
