Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E7EC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 20:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA84610E97B;
	Thu,  7 Dec 2023 20:36:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C3610E97B
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 20:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701981390; x=1733517390;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NE/4MO/Ukrs6/+JIkH1Q2MTo7km93vLlNFfLhy/jelg=;
 b=K7w6xGd7kiJ77CiP9ctFCfLX7PuSsdrwrmt6do6PYRWgenltPvCsjDnJ
 SDtvPShFA4iox68w4MKmURvbJh5r3tVBlKPamOeH3w2C9b78ZAvQ8yyNY
 VxKQjbkXLuZu7hIo/jSHJoIw46ZpZgpld/HgX55WO8hpDft43jeXpQcI1
 1o4O/Ngk18Ama3NiHHf7fHNxLRZGCWSzkgD8CiHKf7atMG1HXkbEtQXzJ
 s26lDFqcM0iKRhVquYfhnXQTMRKz9TBWIEIzMleW8hjJzNum635BC3TXe
 CNxHWET66v4kMe2Rga8rGGpoahh+1C462Zhqp1CHcCpno4fn8HU+VkAOb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="15854778"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="15854778"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 12:36:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="842341171"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="842341171"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 12:36:28 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 12:36:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 12:36:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 12:36:27 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 12:36:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmuruJwKTkNjfF2+3x3ApIyjJwmLvZ/TK4/SVXlF0DcLkLeRsPm0/2RABH+w8H58kKO2QypFjf+yt6EZf2EnZ8CpVgPL4gcn7p6lbPTXYmmbZomr0qqBlR9fYDgqp9rxtfj6ETKR4PAKPBIdwIKgRor61DIE5KG72rIBkTRbEytHWQuVCSwCPl3QadO2ekRN5Wp80akoobnsTwfcb2fJBP0lkOvWv8AKxnmFvjcqJ25jggujBS/k2BbwRTyzzti8GtDUj2IzGKDOaoT/ArWjICHUnyQqeeuhVpKAjVidoSPrXYHfstrIaqfx3nAMrp/KIJ8jHic8Zv+q29YhqK+jag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kDoc1Nb9Ng+1vIQHbXXtSCcQ/fFjlBuhajoV6HyfdA=;
 b=GfyI7qO6+N2fB59EKatQkeLP1pkqHE899OSrC0JJxXhysOg9r1IpVnLB8/X+L7CZSip0vpQyyHet4FSE4u1m1Rjafnz4cB2aGvPcEd7lo3G+b5+Otqu5tIf1rmJI6WRbbFg6xJCNxVk9KLxSAy9BRQ/8Iw2vMqUEg92/OIMbBuuPSaoUjXBDN/kR8SFZ/3JsoF3VSbqzxtu66oATBdlfHqwMDKb+WuLeTeKcFXZtzW8DkJ/rsm11qOa7ucbehSrqUOSMk163gvgY/n5D3cSZhJJcBaYvqu4akJiiSuZ2XktgFPuK8oaLuAPKm76hpEY7HqhtfdHgwWCnKMs5huaE0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4679.namprd11.prod.outlook.com (2603:10b6:208:26b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 20:36:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 20:36:23 +0000
Date: Thu, 7 Dec 2023 15:36:19 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 15/16] drm/xe: Adjust to commit "drm/gpuvm: add an
 abstraction for a VM/BO combination"
Message-ID: <ZXIswwlZlu2Xk5H1@intel.com>
References: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
 <20231207141157.26014-16-thomas.hellstrom@linux.intel.com>
 <ZXG82vYroZewhAJI@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZXG82vYroZewhAJI@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0378.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4679:EE_
X-MS-Office365-Filtering-Correlation-Id: e04aaef3-9051-4b1d-1fb4-08dbf7642cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DSzRq2KPfITtj1rSqvlbeBlpnTd3JdPiqNB9hqHzpx5ef7ZncEl5+MYN7RG0BvAG14G9/8hWTWrtxDy5zo4q5UfA3sjyESzy3ZrWvotvz+JzNjVxmj+jFwczH5lq4EXvhSveSpADp2i2EkuuBX7o6YQuwFWLHr/Yi9yD4SBXY1cQYBy5HLfmcQaXYr5ZOkeI9xNj5b0YxrNc3uD3fUkTrd8x0Fi0gN6GgxD4q9S4zfMkzGUexADMdk5TH6tlNJCpb4ku0ykFHqvlwqkpY3CrnNT/86mBfoHTbRVI8n0ohDd6g+/4c8AWAQZ5hnBjuTbOVbcjiC3Vh485kOtELKsyqHKho4A3TAhvifBRND3brNetLRD7JHOPAIgQ659AR/BHsRqCs1Bc7rQ6M1RPSt8b3RM1ECzyvpgZhN3KGvZV4U40v0LYTmQppWqSDK+pd/6RBoR5GW8FtZwncpMWqEmwDoOUGwg0mf1kk4NC3+jmWjhRKbEVuOjIMvV8gG/uAxYK3XngSz/StIhCGjN5jxutTZLofdzJ014psPVptn3EDmxUchnBWEixV9XVnEuR+2vK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(376002)(396003)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6666004)(6506007)(2616005)(26005)(38100700002)(66574015)(41300700001)(82960400001)(6512007)(83380400001)(316002)(66946007)(66556008)(37006003)(66476007)(6636002)(478600001)(6486002)(86362001)(44832011)(5660300002)(2906002)(6862004)(4326008)(8936002)(8676002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?v31jSdxFrS8La7rxWieF7WFgySYM2s8fsiv9CLYlTwIKsbAP58dEvanfG4?=
 =?iso-8859-1?Q?szTd8Mx8F4+6t/rML7MT5vyNJn/mLQUAGiECdXEqJfXL5BiRJOaORa6uZj?=
 =?iso-8859-1?Q?GLFAlA1IxktvClSVDEPGBBFcCx4PMXHFuPkw+mjdjqR9UWy8oymo9ksskF?=
 =?iso-8859-1?Q?7acw/K6bU3xPeIpwR/sBhnihKBwx5uTkVJwcg9nwU3qbYs17byMSFQVcs8?=
 =?iso-8859-1?Q?nme2VJzamUcbpGhifPI0uwL5raEPRyjxX11guqbMD6iJfYPZRxMYDGVprO?=
 =?iso-8859-1?Q?c2LtI5VEI8Gotf2TOKOvvtFCLizLNHHH55Yurs4B1lxf8YsrZsBN+D5ONz?=
 =?iso-8859-1?Q?n1JXKbubzBW2dsP4MGU6MjGuvwxV21S4xAbIOGh71CYRGag0aFA7AzIBkx?=
 =?iso-8859-1?Q?5eDSHOg0fi6JN/0IFlX0kGok+yw07uPBka0g+IWk6TJMlc8MWwzwS9pICl?=
 =?iso-8859-1?Q?xtCnzvDSbYgbVrEiSTw1dUeexAVYYy8PcRX3PcxaeDEGsukpas1WKmvQkb?=
 =?iso-8859-1?Q?Heen2/4F/MX4mHYByjUs/gZZyFSBXbJI83JCNnCihHqKn9lJPPZZ57piqZ?=
 =?iso-8859-1?Q?kfSvzRTXhlMMXSrV8dsJRCF/A5yqTXdUBSUEUlF+hYn3YGfQHPeI/dLiau?=
 =?iso-8859-1?Q?8QxCSjsxK3znlNaMbihIlP9C8K6I5XSW28JXMcVq2uRIxbxU2jf10XYcK3?=
 =?iso-8859-1?Q?arUnS4XCQUwfI2Q3YN4jYzuum++HhnUnPtUWtz9ChrT9Ux7F9m/vfVYm/Y?=
 =?iso-8859-1?Q?Y6t60LWGdHptkHFo/JSroT2h3NXQ/w9ZIVEFamIL6/jho55pgaNAIzx/xo?=
 =?iso-8859-1?Q?wKA9UR156MwCWy/H7jBBLiSsf9ams91pFgFfbDVKhYrRRl9ZReIhmmaZRl?=
 =?iso-8859-1?Q?qWUA+zrhlUg0tRJ2ETpSNt8HXhehg9E8esLn072b/oCxbM5f9FYaauFm03?=
 =?iso-8859-1?Q?XtA5XC6814aR8HYPfeBvXH4qucM2wFx1xdYYiSdLYCv3qh7BPLaB4Q2rU2?=
 =?iso-8859-1?Q?oYjpHi91Z2mXgZB0Xs2Er3fhlTaA8vjOQgLvCUGBy5HZ1AJRIAeuS9/xDv?=
 =?iso-8859-1?Q?B+y6S1Fg/XGFXsr48KPtEcHH/j3wUGtRYC16w+9CQ+vkYUocsa6mfpnDRI?=
 =?iso-8859-1?Q?RdQgwXXUwLnj6Rzi84Yje7H+5xdSiZRcC64MZUugOwP59I1/4JIkOIsP/m?=
 =?iso-8859-1?Q?BtCrNzOzxe1iJnGdS4hHrCbv10hv2bV+p0CLjuDLKVyy5SqS/P+QDtCg/Q?=
 =?iso-8859-1?Q?0ELLgr50zxBmqppkodM1gLuIpMynlijNdVH9TURy34qiR1Uu6zrzLLg3Qv?=
 =?iso-8859-1?Q?S3PvscIzKpCQEbs0cR5wIqlqKvkbshpYWB1uDSIsu9KhSQERpG0GeXn6ek?=
 =?iso-8859-1?Q?45coFS6Q02h+EqzLwl/zxo87ZyJhvDGH2dIf2/zeYaa/2lc8sncVBt63ok?=
 =?iso-8859-1?Q?ufA6YNw4c6jrQgDy2ksSWpIBGprLnZNRj9tB7zzagF+7JZ6oxPT9Ar3OtB?=
 =?iso-8859-1?Q?yvEdCEJ1/IYg6Z1chYdqwbtxRB5JeNY8FVr3IvnlDtd8p8LTd67tPl/Yl9?=
 =?iso-8859-1?Q?7FHwoe9ifxuKU1eVlpIHZwEO/zwScMTFL/bdV8vc61EMcEzIIFLkJ2Tyn4?=
 =?iso-8859-1?Q?X77ZkHHI+wNZh64cWoXLzeAo/MH0JsHLAQoyHpLGgPRMk66CU9ADjGiA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e04aaef3-9051-4b1d-1fb4-08dbf7642cf9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 20:36:22.9667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPZ7qTEYZNbiMq0T+orKfuW8v0Q07H48pRFRlHD40EaeRRlWneXAzp3zRDdvINdIJ4GaILekA9mB5o0u0sJI1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4679
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 12:38:50PM +0000, Matthew Brost wrote:
> On Thu, Dec 07, 2023 at 03:11:55PM +0100, Thomas Hellström wrote:
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c | 11 +++++++----
> >  drivers/gpu/drm/xe/xe_vm.c | 33 ++++++++++++++++++++++++++-------
> >  2 files changed, 33 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index ad9d8793db3e..7e25c8b7a01a 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -470,6 +470,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
> >  	struct dma_fence *fence;
> >  	struct drm_gpuva *gpuva;
> >  	struct drm_gem_object *obj = &bo->ttm.base;
> > +	struct drm_gpuvm_bo *vm_bo;
> >  	int ret = 0;
> >  
> >  	dma_resv_assert_held(bo->ttm.base.resv);
> > @@ -482,11 +483,12 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
> >  		dma_resv_iter_end(&cursor);
> >  	}
> >  
> > -	drm_gem_for_each_gpuva(gpuva, obj) {
> > -		struct xe_vma *vma = gpuva_to_vma(gpuva);
> > -		struct xe_vm *vm = xe_vma_vm(vma);
> > +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> > +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> > +			struct xe_vma *vma = gpuva_to_vma(gpuva);
> > +			struct xe_vm *vm = xe_vma_vm(vma);
> >  
> > -		trace_xe_vma_evict(vma);
> > +			trace_xe_vma_evict(vma);
> >  
> >  		if (xe_vm_in_fault_mode(vm)) {
> >  			/* Wait for pending binds / unbinds. */
> > @@ -540,6 +542,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
> >  			if (vm_resv_locked)
> >  				dma_resv_unlock(xe_vm_resv(vm));
> >  		}
> > +		}
> 
> The indentation looks incorrect here.

actually the entire block above was wrong after the introduction
of the double loop

drm_gem_for_each_gpuvm_bo
drm_gpuvm_bo_for_each_va

looks like the double loop is the wrong thing?

> 
> Everything else looks correct.
> 
> Matt
> 
> 
> >  	}
> >  
> >  	return ret;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 6c8a84026af4..f71285e8ef10 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -911,12 +911,21 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >  	vma->pat_index = pat_index;
> >  
> >  	if (bo) {
> > +		struct drm_gpuvm_bo *vm_bo;
> > +
> >  		xe_bo_assert_held(bo);
> >  
> > +		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
> > +		if (IS_ERR(vm_bo)) {
> > +			kfree(vma);
> > +			return ERR_CAST(vm_bo);
> > +		}
> > +
> >  		drm_gem_object_get(&bo->ttm.base);
> >  		vma->gpuva.gem.obj = &bo->ttm.base;
> >  		vma->gpuva.gem.offset = bo_offset_or_userptr;
> > -		drm_gpuva_link(&vma->gpuva);
> > +		drm_gpuva_link(&vma->gpuva, vm_bo);
> > +		drm_gpuvm_bo_put(vm_bo);
> >  	} else /* userptr or null */ {
> >  		if (!is_null) {
> >  			u64 size = end - start + 1;
> > @@ -998,16 +1007,19 @@ static struct xe_vma *
> >  bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
> >  			    struct xe_vma *ignore)
> >  {
> > -	struct drm_gpuva *gpuva;
> > +	struct drm_gpuvm_bo *vm_bo;
> > +	struct drm_gpuva *va;
> >  	struct drm_gem_object *obj = &bo->ttm.base;
> >  
> >  	xe_bo_assert_held(bo);
> >  
> > -	drm_gem_for_each_gpuva(gpuva, obj) {
> > -		struct xe_vma *vma = gpuva_to_vma(gpuva);
> > +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> > +		drm_gpuvm_bo_for_each_va(va, vm_bo) {
> > +			struct xe_vma *vma = gpuva_to_vma(va);
> >  
> > -		if (vma != ignore && xe_vma_vm(vma) == vm)
> > -			return vma;
> > +			if (vma != ignore && xe_vma_vm(vma) == vm)
> > +				return vma;
> > +		}
> >  	}
> >  
> >  	return NULL;
> > @@ -2156,6 +2168,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> >  	struct drm_gpuva_ops *ops;
> >  	struct drm_gpuva_op *__op;
> >  	struct xe_vma_op *op;
> > +	struct drm_gpuvm_bo *vm_bo;
> >  	int err;
> >  
> >  	lockdep_assert_held_write(&vm->lock);
> > @@ -2183,7 +2196,13 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> >  		err = xe_bo_lock(bo, true);
> >  		if (err)
> >  			return ERR_PTR(err);
> > -		ops = drm_gpuvm_gem_unmap_ops_create(&vm->gpuvm, obj);
> > +
> > +		vm_bo = drm_gpuvm_bo_find(&vm->gpuvm, obj);
> > +		if (!vm_bo)
> > +			break;
> > +
> > +		ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
> > +		drm_gpuvm_bo_put(vm_bo);
> >  		xe_bo_unlock(bo);
> >  		break;
> >  	default:
> > -- 
> > 2.42.0
> > 
